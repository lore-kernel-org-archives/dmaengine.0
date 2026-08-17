Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59013BE168
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 20:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000145; cv=none; b=vA3+zAKG6D2Ov3zNWrSCvy1nNwcWy+I05XRtiXuDHXHCk/QGcSSLvAkI9FMcTCdm+wBHXSrriL7nXWMEhdM0q8xk3wuJiRQIDFaeYgNWkhepsz/xryCfJZMI+yWFLZIUlcL3LEa8O/o01wNgeAva3otjQyKAefEX5o9Y6Rhn9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000145; c=relaxed/simple;
	bh=CuLzQ8A8r7+A6EgL22kWY6FfAaX7msvBuiL4JOHspxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SYSjfuzzyZ+usHEMFwICQg+BSHt8VD4JGwYTUpZCtt8+KfsYDFLtRnPFZNl1GY1NG8EnRPm9bW3+dPZUlwKsoTaTxyEfj62KT2YdtWXmaQ09rBUMiR1fJ7F0VybL5qQmhrf7RUNQXd3mh/VRKtPAp50UFaFCICSkg2Ycx/XnxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEaQynLS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEaQynLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253191F00A3A;
	Mon, 17 Aug 2026 20:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787000144;
	bh=zFu3MfinwnzMMi2otUpRWVGEXnH4AEQuVIyfb8lSxTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hEaQynLSgjOc5D5USy8/CNX9XwRLlTzfQ7tlkOlViHMU7z2DrYzyQxEIL5OEP0AWZ
	 gPPrfiykayiYc8ZSV5ar+BVaVsOX4s/UBRdmAKehImAvK9skD7ahUQkhHvVIki9E8r
	 8dIT9D9gqG4Ey22r5rfmPJWH3NSsAfgxAWi2KLcK6DLn443BCB2pM1iFZ8Ge4MCS07
	 NlpXSOo6YaH0qRuJS2jyzb/ZWwIhTOSSOGBf5tZS/RxJJmRLA234QwVyOj3C98YE5Z
	 7nl2QKm1/ZFw/6gAf5H4HAIhXHAj0baSFqBeFK/x1twxsLZrRecSVSNvV0S8EJiT1z
	 8KyWuxiwMpuqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: pxa: fix double counting of the hw
 descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260817-dmaengine-pxa-v2-1-f42ab0569a48@pengutronix.de>
References: <20260817-dmaengine-pxa-v2-1-f42ab0569a48@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 20:55:43 +0000
Message-Id: <20260817205544.253191F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] For cyclic DMA transfers, the updater descriptor's DMA address is =
leaked, and the first descriptor's DMA address is double-freed in the DMA p=
ool.
--

--- Patch [1]: [PATCH v2] dmaengine: pxa: fix double counting of the hw des=
criptors ---
commit 5e37421334e2f54f86d40ee190a04a05eb99596b
Author: Sascha Hauer <s.hauer@pengutronix.de>

dmaengine: pxa: fix double counting of the hw descriptors

This commit fixes a double counting issue with sw_desc->nb_desc in
pxad_alloc_desc() caused by the transition to kzalloc_flex(). It explicitly
sets nb_desc and removes the redundant increment in the allocation loop.

Link: https://lore.kernel.org/r/20260817-dmaengine-pxa-v1-1-850c215c1196@pe=
ngutronix.de

> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> index fa2ee0b3e09f8..fc43124fefa89 100644
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c

[ ... ]

> @@ -744,6 +744,7 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned int =
nb_hw_desc)
>  	sw_desc =3D kzalloc_flex(*sw_desc, hw_desc, nb_hw_desc, GFP_NOWAIT);
>  	if (!sw_desc)
>  		return NULL;
> +	sw_desc->nb_desc =3D nb_hw_desc;

[Severity: High]
This isn't a bug introduced by this patch, but since this patch corrects the
nb_desc tracking used by set_updater_desc() and pxad_free_desc(), is there a
pre-existing double-free for cyclic transfers?

When a cyclic transfer is set up, set_updater_desc() creates a hardware loop
by overwriting the ddadr of the second-to-last descriptor:

drivers/dma/pxa_dma.c:set_updater_desc() {
    ...
    if (sw_desc->cyclic)
        sw_desc->hw_desc[sw_desc->nb_desc - 2]->ddadr =3D sw_desc->first;
    ...
}

Later, pxad_free_desc() relies on this overwritten field to retrieve the DMA
address to free the next descriptor in the chain:

drivers/dma/pxa_dma.c:pxad_free_desc() {
    ...
    for (i =3D sw_desc->nb_desc - 1; i >=3D 0; i--) {
        if (i > 0)
            dma =3D sw_desc->hw_desc[i - 1]->ddadr;
        else
            dma =3D sw_desc->first;
        dma_pool_free(sw_desc->desc_pool,
                      sw_desc->hw_desc[i], dma);
    }
    ...
}

Because ddadr was overwritten with sw_desc->first, doesn't pxad_free_desc()
read sw_desc->first instead of the original DMA address when freeing the
updater descriptor?

Could this lead to double-freeing the first descriptor's DMA address and
permanently leaking the updater descriptor's original address in the DMA po=
ol?

>  	sw_desc->desc_pool =3D chan->desc_pool;
> =20
>  	for (i =3D 0; i < nb_hw_desc; i++) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-dmaengine-=
pxa-v2-1-f42ab0569a48@pengutronix.de?part=3D1
