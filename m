Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C384A9D49
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637298; cv=none; b=nO0wADgyZbn48pVhjQZ1DgRTzXpKpT1Pbtg05PwweszEddQ3p7ZW14rfdujMdBv9/F3Ys1RR2OBbjwU+qgixNugwHSoND8pgNVQ4a43rF88cye5KJGmqbXx5TbnS3L+sPsYRMtH2vsiMBqzMi3dXUbA2+KPw7BiGjBZrQcEA7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637298; c=relaxed/simple;
	bh=Gk95g/TQRNPXXIx6oQ3mph82fncVl4bedzOc0hGQ1LQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Vg9gazxyJ2CcKCUXAh4Uug3eQgtASc9Sw89/peq2uK2q6bYoxGwSrxSZJwW4b6DoW0beHltiHizey1WqOnKUPkinoiam/S51+DE0fdQCZDiAwikrez/Gg0AXsAsI0j10c6BPrZG+IUaPN6yFKFCSvdoMAppKbj+y6n95U/2xiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjIC5R+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjIC5R+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5791F000FF;
	Sat, 10 Oct 2026 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637296;
	bh=d6QsPf0RhXqQHwYAr/ILFKyYS4u2ZousiHeuD4BS/Oo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RjIC5R+61sS9Cfd2xGMTbpOWtspDk1axfLGuxtjXLcv/Gl+7zeherpOFykoT8fSZk
	 aFo/0WLKyUuqPuBcJxjrhJGhOPTWZFVfyXo2fAfwLIE6nEp2wY2lgVLfvz0oltQwPC
	 ctjaQTx37TfFxSrL4XKLVZdhLQP2e4kaT7L8Z80GWkdb03sZARDIactBltn7psOUcy
	 uHhZk4lybAW0bgQYIBLKr8VQ+GrtsvgLJEXlvLY3LTTf/JxQ5rc0Q+UbJQKt4nD1x2
	 qsxfNGD1l94ME2XAdePT5pPFtoJWCXjVIdQqQhIPQsrjuuaOfucxv+fyyy14pw1Hm3
	 qicijs2/2k/Hw==
Message-ID: <sashiko-outbox-166556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: ccp - unmap descriptor before completing cookie
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20261010125001.19300-3-wsa+renesas@sang-engineering.com>
References: <20261010125001.19300-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:01:35 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] crypto: ccp: silent error swallowing due to cleared dma cookie
--

commit c8a251448dee088f8a410c932932372165225507
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

crypto: ccp - unmap descriptor before completing cookie

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org

> diff --git a/drivers/crypto/ccp/ccp-dmaengine.c b/drivers/crypto/ccp/ccp-=
dmaengine.c
> index b386a7063818b..02c6c5fc7db1f 100644
> --- a/drivers/crypto/ccp/ccp-dmaengine.c
> +++ b/drivers/crypto/ccp/ccp-dmaengine.c
> @@ -224,8 +224,8 @@ static struct ccp_dma_desc *ccp_handle_active_desc(st=
ruct ccp_dma_chan *chan,
>  				"%s - tx %d complete, status=3D%u\n", __func__,
>  				desc->tx_desc.cookie, desc->status);
> =20
> -			dma_cookie_complete(tx_desc);
>  			dma_descriptor_unmap(tx_desc);
> +			dma_cookie_complete(tx_desc);

[Severity: High]
Does this clear the cookie to 0, preventing later error checking in
ccp_tx_status()?

When ccp_tx_status() attempts to find the completed descriptor to check for
errors, it skips the descriptor because its cookie was zeroed by
dma_cookie_complete():

drivers/crypto/ccp/ccp-dmaengine.c:ccp_tx_status() {
    ...
		list_for_each_entry(desc, &chan->complete, entry) {
			if (desc->tx_desc.cookie !=3D cookie)
				continue;

			ret =3D desc->status;
			break;
		}
    ...
}

Since the cookie no longer matches, ccp_tx_status() drops the DMA_ERROR sta=
te
and erroneously returns DMA_COMPLETE.

Additionally, a few lines later in ccp_handle_active_desc(), the callback
invocation passes NULL for the result:

drivers/crypto/ccp/ccp-dmaengine.c:ccp_handle_active_desc() {
    ...
		if (tx_desc) {
			dmaengine_desc_get_callback_invoke(tx_desc, NULL);
    ...
}

Does passing NULL here cause dmaengine to report DMA_TRANS_NOERROR to the
client's callback even when the status is DMA_ERROR? This sequence appears
to completely swallow DMA and cryptographic hardware failures.

>  		}
> =20
>  		desc =3D __ccp_next_dma_desc(chan, desc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010125001.1930=
0-3-wsa+renesas@sang-engineering.com?part=3D1
