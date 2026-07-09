Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D03D5647
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783579053; cv=none; b=RPgy5NkMbBO7CUqeCvc+fDlYNFnn4j3sjCEGl+llKicf2FWFAX9j0sFnUAhRCCNQxmRl0RuMTi01Cl49tX05vcnizX2zZcLGnCeMGpbuBoazd0s7O8Gbeq/BLY2Yqcfdv7owolbHOmsoZCJiiTFb4GYeNV2UZGxGdMcbeeXK9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783579053; c=relaxed/simple;
	bh=DuAfwTWBZdt0MNaVN/DJ5SgFXNzwB2qxa6IMwkFx0S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nnyCKngA1bDoNxGZoYUBILcZp0UBG66XYve38SvdmuwP34fmlMfxv2RiRoWGrjz0Mjp5/XCYBdgwvrMfcAoQH6UtdKsdKswqhDQvnGPr5JSEBJ75h0LPmc8sqmdFymWfnj+43bPJi8NPp0LxVCOHQDgHMW9OT8ZfWNQILDvPK2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPDDDza/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPDDDza/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE0A1F000E9;
	Thu,  9 Jul 2026 06:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783579048;
	bh=Y2LCVHewSJw9M3C0dmB5VeGqU1QNaoApllvBYVOjO2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPDDDza/kpNsspb49JZ32l6hdTP+X2Rz/7k+pVBqX/UWsst2gBIa7sMp6TZSz3GNP
	 9aLnV6f4L5B7FIG6JUbM/na5J482EDZ6T/u+s0/r3pL7lxqaVBlmHgWQ9QwAWTouSF
	 CAWAypDFtzb8wt3+kZ7ZmlTcKyWb1Qcyoebd8Pimm+9qW6j9D61xe/eaw64WGDe6Jw
	 BXdYNeN5bCQNMQ8/xM+BlCSg75NIiAWJLXlLkF09o3u57JTRdYGUkpKUzmVa7VSsdm
	 twAyQqtJaCorMxzJxc7OBmY8P17KoqWn24l7RGWkMb3LPdxpHz4NpekkJGdAB76l0x
	 KHhRnOeAOoLZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Remove channel from list on
 registration failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260709062303.4167624-1-ruoyuw560@gmail.com>
References: <20260709062303.4167624-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 06:37:27 +0000
Message-Id: <20260709063728.3BE0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe lockless modification of `dma->channels` and missing `dma_l=
ist_mutex` lock leading to global list corruption.
--

--- Patch [1]: [PATCH] dmaengine: idxd: Remove channel from list on registr=
ation failure ---
commit 4fb2c9798431d41ef3638a29b584b02b54cf00cf
Author: Ruoyu Wang <ruoyuw560@gmail.com>

dmaengine: idxd: Remove channel from list on registration failure

This commit fixes a stale list entry bug by removing the channel from the
dma channels list before freeing it on the registration failure path.

> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -289,6 +289,7 @@ static int idxd_register_dma_channel(struct idxd_wq *=
wq)
> =20
>  	rc =3D dma_async_device_channel_register(dma, chan, NULL);
>  	if (rc < 0) {
> +		list_del(&chan->device_node);

[Severity: High]
This is a pre-existing issue, but does this list_del() and the surrounding
code need additional locking to safely modify the channel list?

Currently, idxd_register_dma_channel() modifies the shared dma->channels
list while only holding a per-workqueue lock, rather than a lock that
serializes access to the parent dma device.

Furthermore, this path calls dma_async_device_channel_register() which
leads to a lockless global list traversal:

idxd_register_dma_channel()
  dma_async_device_channel_register()
    dma_channel_rebalance()

The dma_channel_rebalance() function requires the caller to hold the global
dma_list_mutex, but dma_async_device_channel_register() does not acquire it.

If a privileged user triggers concurrent sysfs bind operations on multiple
idxd workqueue devices, could they race here and corrupt both the global
dma_device_list and the shared dma->channels list?

>  		kfree(idxd_chan);
>  		return rc;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709062303.4167=
624-1-ruoyuw560@gmail.com?part=3D1
