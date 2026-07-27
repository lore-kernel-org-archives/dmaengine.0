Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AA4430304
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173056; cv=none; b=f7JlEJkEECpY6XVRFQzASTsj7VfW/OoDB3DF6YK+XTjJY4Wvwa4FbeRVzRMKxQTeZnXxQFG2JvEobPu1Ijrw3elOOmiyr8cnlSMwaWeXPmZfAwgK+L7/spqWf48cgxutgj0cJEVtAqex7KIT6xT+vuzkXZxvvHXa0iOjaS/umRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173056; c=relaxed/simple;
	bh=lvxMenxFLTcnI3SHUe9xaCeaC6vv5Akov0txNfeZimM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fa3RxQD3HzpT/Fu5AVQgJriukNLM5LzqFus8InzclhdvTYHx0AswMRrClcpCYz9seepOe/IxL4VrlcxBse88/XXZs8LiT2tTSWVWxRcOomfkwaxY655mYn7O2dihESekwP14OgPZDj1MpmUhdKvIS2EsuawuUhkzzGLV8i+LgA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbGo9qk6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbGo9qk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A388C1F000E9;
	Mon, 27 Jul 2026 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173052;
	bh=UaX5Y5mM+H8MSRLGnrsWq0Oc9QXaQc7P6Z/l/qwlgYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbGo9qk647MkvkAcCdE4K3DR96yrY9rZIsMkdAGahRB+0xAQ3eZG6fQwdNouuDG7p
	 tuTyLFT1EFRET8/CQ2vHwn77dewIZNuCrjTSQaC0M5xn7yPMdpteqtAE5s9ex/fuwC
	 C281yDlCqNCT8Gub/EieacQXF7s/MqBbEpTPuW7tm4Sxl8Ck5OzvcOjJ8C3TxDRWbz
	 IReTx6iNkv+UWFN3TmAO/RnjGuw50m2GeCbl2zEPtnC8IP3rmTe7FpziwgENBuOFgy
	 3w+Qbk5ZybAo/4OZdxcaeLqQ3maHBxptX7oXmn7O+F5rx6Ou7kU9WVh+lwGrHu8Wx1
	 o7V1UNwTyPoGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/24] dmaengine: dw-edma: Make the LL ring reset a
 full channel resync
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260727170323.2321369-19-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-19-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:24:12 +0000
Message-Id: <20260727172412.A388C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver fails to dynamically append multiple descriptors to t=
he LL ring concurrently, defeating the pipelining design.
--

--- Patch [18]: [PATCH v3 18/24] dmaengine: dw-edma: Make the LL ring reset=
 a full channel resync ---
commit 5973888151d0718a6614eb2366d05e6ecc44461c
Author: Koichiro Den <den@valinux.co.jp>
dmaengine: dw-edma: Make the LL ring reset a full channel resync

This commit updates the channel reset logic for the dw-edma LL ring. It=20
clears out descriptors with published entries to prevent stale tracking=20
while keeping untouched descriptors available, and ensures the ring is=20
reset before looking up the next issued descriptor.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -364,6 +383,13 @@ static int dw_edma_start_transfer(struct dw_edma_cha=
n *chan)
>  	struct dw_edma_desc *desc;
>  	struct virt_dma_desc *vd;
> =20
> +	if (!chan->non_ll) {
> +		if (dw_edma_abort_is_pending(chan))
> +			return 0;
> +		if (!chan->ll_valid)
> +			dw_edma_core_reset_ll(chan);
> +	}
> +
>  	vd =3D vchan_next_desc(&chan->vc);

[Severity: Medium]
Does this logic prevent dynamic appending of subsequent descriptors?

Since vchan_next_desc() only fetches the first descriptor in the desc_issued
list, if this descriptor has been fully published (start_burst =3D=3D nburs=
t) but
not yet fully consumed by hardware (done_burst < nburst), it remains on the
list.

In that scenario, dw_edma_start_transfer() will repeatedly fetch this same
descriptor, find no more elements to add, and return. This would completely
ignore any subsequent pending descriptors until the first one is completed
and removed, defeating the pipelining design of appending multiple
descriptors to the LL ring concurrently.

>  	if (!vd)
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D18
