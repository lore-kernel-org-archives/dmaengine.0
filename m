Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02544218B1
	for <dmaengine@vger.kernel.org>; Tue, 26 May 2026 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819624; cv=none; b=IiPVhYfH5snIm6PDCA7KmEDlZoc8X/mvMh4nMFtDyY/+7R0Fe693X8eXi16AvI1BRmaKYh0neXqjffpCAdlTaWr0+2qM2xyPKj4xUl48At/pUTHbj4t9n+fdDdtIEEQZWYc5HQr6cA1pQSpGrrai1v4To8Cos/hrCCgozZUHRVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819624; c=relaxed/simple;
	bh=APR7mYIRnO/ZdxeHU5TIc0Dq6V7fwrTjHVVI9zhc2fU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ukdWIXPGzVmKGcPbkm4c53ut9hXZg9314thpHqcP5wRl+CgKO/Hje2u8bZB//jUmOhn6413e/y5Gxq4qBlzzXcs3IClyYItHmONocHKAkfYqqi3wL48ZtuvkwnxJ3sMHav3VA+hAGPQ8o0qlX3SrKahhkzjmBLLNxYnaTHz+DnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R39l+ALA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R39l+ALA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209B31F000E9;
	Tue, 26 May 2026 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779819623;
	bh=g0eqhNDMsVMuplxLKUYSv3uCTbZAhUOzCxENcwCLkek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R39l+ALA8TRVdp/yctqOy2CpFFFo8u5jROyTjgBim3wdd3cVZmNPJsdJwyprdaDFv
	 XF6x8Y3i53zHamhhP8clZPJmD/VOdmO7cZyqBpPOysAQzo/SYHpXnHLCpMRPzxfgCZ
	 cckA/6UQ9JGjw/7V8VHjPb7kdS9oi2y23caVVaPZa/YNBHQvzkFku7Okel1iCd/W6L
	 oGvtLVpg5c2Py4/uITSASxzbWmU10UJL9hvgQ50kHJJ/Zis4WeksJOwV6HqtXP5j09
	 53arvsfkxTOdsA+dKv2M6SrgC/3KHs/5AXfU6+bk0KT9Y3WUBgy606QxxtV/YY2Rkb
	 7gb4lfv3eOWUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-14-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-14-08472fdcbf4a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 18:20:22 +0000
Message-Id: <20260526182023.209B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Orphaned DMA descriptor memory leak upon metadata attachment failu=
re leading to channel exhaustion.
--

commit 433ea109d3dff3d196874c0f1de536092d9aa63c
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

crypto: qce - Communicate the base physical address to the dmaengine
   =20
This commit fills out a bam_desc_metadata struct containing the scratchpad
address and attaches it to the DMA descriptor via
dmaengine_desc_attach_metadata() prior to submission.

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
[ ... ]
> @@ -60,6 +65,10 @@ int qce_submit_cmd_desc(struct qce_device *qce)
>  		goto err_unmap_sg;
>  	}
> =20
> +	ret =3D dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
> +	if (ret)
> +		goto err_unmap_sg;
> +

[Severity: High]
Does this error path leak the DMA descriptor allocated by
dmaengine_prep_slave_sg()?

If dmaengine_desc_attach_metadata() fails, the code jumps to err_unmap_sg
without freeing or submitting dma_desc. When the error propagates to the
caller, the cleanup path bypasses dmaengine_terminate_all() because the
transaction was never submitted.

If this fails repeatedly, could it rapidly exhaust the DMA channel's
descriptor pool and permanently prevent future requests? Should the
unsubmitted descriptor be explicitly freed before returning the error?

>  	qce_desc->dma_desc =3D dma_desc;
>  	cookie =3D dmaengine_submit(qce_desc->dma_desc);
[ ... ]
>  err_unmap_sg:
>  	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEV=
ICE);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-qcom-qce-c=
md-descr-v19-0-08472fdcbf4a@oss.qualcomm.com?part=3D14
