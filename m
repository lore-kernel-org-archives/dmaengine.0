Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B528372EDE;
	Thu, 25 Jun 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379098; cv=none; b=g5zcBB9z5OyS9qPzu0MBP7HEcVUL+9BoZJkmmH7svca6saBFBG7lkOMoK0PQhbJKXQ8xcrheoUSIqBwgF/TKLYl9biMncBAe1EDeQPBisk2X7sRlgiiAjSzeFrFBNUYaRKdKy1AzTpyi8rk06eE/RT4bg1Xg+V1WjbXKqYwdROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379098; c=relaxed/simple;
	bh=EEY4X0IikdQzYWEgm7s8dzjs2n8/9L3ueHI8a1oUkBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OixVV/LgjpPuc9qzPLoMuLGV2CJozaboP2KC8v4uOry20TM+EMHw1S5QhvJ0BQp9qUA5FFDZKR/rkl+kUM1u+D9civy0Puai7n3ScgPW9KoLsZSaav8jc/bJaPSDPLaC0DOHwMbr7s5BdCf3l0zWcMdIFw3UD3bPQLnftAG8IQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMcJWAWJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMcJWAWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43C31F000E9;
	Thu, 25 Jun 2026 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782379097;
	bh=kOMeSamMVOn7f9SCTKCSIxwv38pW42GCAwG1Q1c/qQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMcJWAWJ5tZ7tI76yUQXWtfZPPNtIygYnUSmwvWt7LhRPwgtN11s82v6fk3j2DBVx
	 ovUiiBVnWtAlrA+Yxdy91rdPnoqt5ZO8iietXUs7nLoHcSbavhwiDGjYW8lM6cqP6a
	 Lp4XY2hdXa8fxGrISFp9YgNwtLFA6CJyVmUYo9xuRtX2D0tuU0HEC7E6PXcQ5hIT/Z
	 ymcgJ39tebu8BU75tsWf2Z/Z8+JLzlOsdy6fD35HwM+6NbooItDaoU2R4eepr+1qxM
	 3Ua+ZRDHtj49BgoZJGt7iQ5UOKPGEh9D4Y6WU9onNQxmJ/EQ1kKVC3MQZzMY4jvgBF
	 mFDnX3edJ39hQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dmaengine: fsl-edma: Move error handler out of
 header file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jean-Michel Hautbois" <jeanmichel.hautbois@yoseli.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260625-b4-edma-dmaengine-v3-1-44be00ace37d@yoseli.org>
References: <20260625-b4-edma-dmaengine-v3-0-44be00ace37d@yoseli.org>
 <20260625-b4-edma-dmaengine-v3-1-44be00ace37d@yoseli.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 09:18:14 +0000
Message-Id: <20260625091816.E43C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unprotected write to channel status in the error handler causes a =
data race that can mask hardware errors and hang DMA clients.
--

commit cc17ac4f2b0c85f5476ae3803d0c9e31bd371d29
Author: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

dmaengine: fsl-edma: Move error handler out of header file

This commit moves the fsl_edma_err_chan_handler function from an inline
definition in the header file to the common C file. This prepares the
driver for MCF ColdFire eDMA support, where the handler is called from
a specific interrupt handler.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..1b1a0496b5e6f 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -44,6 +44,11 @@
>  #define EDMA64_ERRH		0x28
>  #define EDMA64_ERRL		0x2c
> =20
> +void fsl_edma_err_chan_handler(struct fsl_edma_chan *fsl_chan)
> +{
> +	fsl_chan->status =3D DMA_ERROR;
> +}
> +

[Severity: High]
This is a pre-existing issue, but does this unlocked write to the channel
status create a race condition that could mask hardware errors?

If fsl_edma_tx_chan_handler() processes a completed transfer on CPU0, it
calls fsl_edma_xfer_desc() to start the next pending transfer. This enables
the hardware request and then assigns the channel status to DMA_IN_PROGRESS.

If the new transfer immediately triggers a hardware error, the error
interrupt fires on CPU1. CPU1 executes fsl_edma_err_chan_handler() and
writes DMA_ERROR to fsl_chan->status without acquiring the vchan.lock.

If CPU1's write occurs between the hardware request being enabled and CPU0's
write to DMA_IN_PROGRESS, the DMA_ERROR state is overwritten.

If the error is masked, the driver state remains DMA_IN_PROGRESS while the
hardware is permanently halted. Could this cause DMA clients to hang
indefinitely waiting for the failed transfer?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-b4-edma-dm=
aengine-v3-0-44be00ace37d@yoseli.org?part=3D1
