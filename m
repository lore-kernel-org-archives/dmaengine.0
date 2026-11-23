Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397694;
	b=u1Eqxg+yBUKa7ybM7+r+HXs1eIcutwYFYDNcRBjuu0dNbPOi95OcFoJfkbVrn2mMrK3v
	 OIzsqDh8oGLn0t9RFO8FPVQcq87WqcNXn2yJ7LDVVVMLVtnUlz8y1MU3p8O4AxJrJ9Rex
	 vL93viAS27q1Arcc3/XPwwtCSjoYLgNJC1eygUQmnd0Dn2yKy81WqLEL2rJ1loVOmgY0O
	 sc2UWhQWrhSFRj4qs+hYm7nYW79O79zi+CnStAjaeGmv4diOMKmwSsqVvZTLeaveAm9m4
	 RO30yazp/1UZPWlTVcPiVJ7/R+/j6Zu8MAfCa6RxiMZbLw4M2FW2T2Klh9CfKxI0HMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RiqirlH3UXlbDIlpJI/Xyu8pMJqdP0jykv9VHffhkgA=;
	b=4Egne5NY8LMcQFhnl58KEfIuAoVqyleLxmV7/d1v4pqUXDwtArlhQ+lSt/iBLuvtxz2B
	 t5daCIGPcOKNBK0EQozmbbYef+oyC2mXRk9K/Tk8+33SJkp/v0gKj34/3KJc6X3QhHmX0
	 82lFvywhZzpTPqTPeO2r70i+qiuD0f4eSL5TtEMijLj5kEMQahuB5ejpyxMn9S4dpOE3q
	 pfDuUwqqcHKHnEPc+xcds3RQbNdykK/K1n8gVzJL/sLMnZ36kqSU3m/0OcEi36HAtjGB3
	 nGg+EXe/2GZTggr3uYlP5QVQd/zH9jOllrYxBo121ZIXzvfQ2VHeUS0pu8i8NFePT1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekdIBCb5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5076606A31A;
	Mon, 23 Nov 2026 01:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekdIBCb5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C0F1F000C6;
	Mon, 23 Nov 2026 01:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397694;
	bh=RiqirlH3UXlbDIlpJI/Xyu8pMJqdP0jykv9VHffhkgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ekdIBCb5qYBphlct9a/6+JapSBJNf4IjF3gGNlPv1pJcY9lalva1MGLXhtTPV1lwT
	 l7rQpmStMEoX+MR3c2WSGouarG6Zc3/0JtZzrTFDsFCTrciqbq6v8oYTBA72XNLylx
	 1tWpwBun1HwgGfC/CbSO/fd0Ltml7p4y8orf0xjWSHbN5EkFQ5vUSpWFSAK0YEkKXZ
	 oyds5bhE2maxFWTvxpeNNB8Ku+Nve8Qeimy8jYVbZizFY7LEL+JK95Vrib7v8EhsoP
	 MkR8bztZrPwFyQtCA44i1/pIlO4lkEr8u5qvRDXyqIUV2hw8W6zjiFGU8BdcB0hmip
	 Y3FNQ/uKRStHQ==
Message-ID: <sashiko-outbox-228521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: fsl-edma: use BIT_ULL for 64-bit channel
 mask
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-edma-fixes-v1-2-59d5da374a16@nxp.com>
References: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
 <20261123-edma-fixes-v1-2-59d5da374a16@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:34:53 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: fsl-edma: missing Fixes: trailer for chan_masked
  BIT_ULL() fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] dmaengine: fsl-edma: use-after-free in
  fsl_edma3_detach_pd() [1]
--

commit 61ad7f34b4fcfc1b5709f370095dce7e4b0ea1d5
Author: Peng Fan <peng.fan@nxp.com>

> dmaengine: fsl-edma: use BIT_ULL for 64-bit channel mask
>
> chan_masked is a u64 bitmap, but several checks use BIT(), which uses
> unsigned long and overflows on 32-bit architectures for channels >=3D 32.
> Use BIT_ULL() so the upper channels are tested correctly.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

[Severity: Low]
This fixes the 32-bit BIT() overflow on the 64-bit chan_masked bitmap
introduced in commit 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3
support") and replicated in commits 2838a897654c ("dmaengine: fsl-edma: Do
not suspend and resume the masked dma channel when the system is
sleeping"), ccfa3131d4a0 ("dmaengine: fsl-edma: implement the cleanup path
of fsl_edma3_attach_pd()"), and d175222f5e90 ("dmaegnine: fsl-edma: add
edma error interrupt handler").  Should this include a Fixes: tag for
72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support") (and optionally
for the follow-up commits)?

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 7f82dcb7831d0..818b9b986f131 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c

[ ... ]

> @@ -641,7 +641,7 @@ static void fsl_edma3_detach_pd(struct fsl_edma_engin=
e *fsl_edma)
>  	int i;
> =20
>  	for (i =3D 0; i < fsl_edma->n_chans; i++) {
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>  		fsl_chan =3D &fsl_edma->chans[i];
>  		if (fsl_chan->pd_dev_link)

[Severity: Critical]
This problem wasn't introduced by this patch, but does
fsl_edma3_detach_pd() trigger a use-after-free on fsl_chan->pd_dev
[1]?

drivers/dma/fsl-edma-main.c:fsl_edma3_detach_pd() {
    ...
		if (fsl_chan->pd_dev_link)
			device_link_del(fsl_chan->pd_dev_link);
		if (fsl_chan->pd_dev) {
			dev_pm_domain_detach(fsl_chan->pd_dev, false);
			pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
			pm_runtime_set_suspended(fsl_chan->pd_dev);
		}
    ...
}

After device_link_del() removes the stateless device link,
dev_pm_domain_detach() calls genpd_dev_pm_detach() -> device_unregister(),
which drops the last reference to the virtual genpd device and frees
fsl_chan->pd_dev.  The subsequent pm_runtime_dont_use_autosuspend() and
pm_runtime_set_suspended() calls then lock and modify the freed device
during an attach error, probe failure, or driver unbind.

[1] https://sashiko.dev/#/bug/linux-274f4f33-0d23-4b6b-a957-25b9d8ad2f6a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-edma-fixes=
-v1-0-59d5da374a16@nxp.com?part=3D2
