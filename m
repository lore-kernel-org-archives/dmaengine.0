Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3782379C2A
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642155; cv=none; b=E9Zv/qgU4vRVv1/Ev27irtRQ/tzUr0YtpeW6IIEr8pEUmgWM770JSwI9qrJNFAhRyqQmcI31JAl5RyeCHu6ZtG0Jq6iWLeczNK9iI5JPsTEymMaMKOBTU25Mrb2wX/AsE2c1jXMcb/nQZMoXGnynTzMg5tZ/Jo4M9vA0kDIAdqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642155; c=relaxed/simple;
	bh=26KNaVMJXZmibGDzt7ZUoU4jSweEbLUTwf+m1vbK0lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iF4Xb8pL6qcQzuC95VXXDYT8tpp2Ydq97gA92HuB2ZS5KhIfjxb6Uq1XtFgEvKK/cgn0wpQmC1+6ga3qXsVYAWe1X5ClQLcc1UO30H23Z0wJxIopLBJQcZ9oNRu+xBgdzOw3FXBDwc6l1+nAi2ww0I1CnVFQA2xPTjZNb7nD6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+jBdvhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+jBdvhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE261F00A3D;
	Tue, 21 Jul 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642154;
	bh=TJFPioPFIr56lhHCeug+nO0NHhLJwL6dQ8L8FOZ7nCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L+jBdvhdKtPNHqgxvn6d1cKnQsR78Ske8ADYZB158msjS8KqvZt00gu3jcyIhlhYS
	 TYkAbBuCMkNsL7M3716jbW7ZVqeiE1wNCggAss7OHNkWCixFyfhqjK6vCcDX+qWFMU
	 mK+dA58TjPp4YwAFEbRVNm3nA3fioaJDQFNOeArp2yW88sl4q+ZrJdS+GXzsJ64zJE
	 lCeQ3+UNtxJ5WAEdI7vVlPLFRlbdetjlCdR0lvYbE9KnLf255qJVRiSRhJsZ+/gM2n
	 Ig0d3Ee86g2KyKPpVb0/NTmL/LZNU9T4uwT0BVTJ+Ks/F74xahm6joIwu+3/iQ64Re
	 wE9El6ltGiFsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-14-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-14-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:55:53 +0000
Message-Id: <20260721135554.4DE261F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unintended hardware misconfiguration due to partially initialize=
d `dma_slave_config`.
- [Medium] Potential memory leak in qce_submit_cmd_desc() error path becaus=
e dmaengine_desc_free() refuses to free non-reusable descriptors.
--

--- Patch [14]: [PATCH v23 14/14] crypto: qce - Communicate the base physic=
al address to the dmaengine ---
commit 6c1591ac036f81ee86f8eab63457a3de06d13cef
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

crypto: qce - Communicate the base physical address to the dmaengine

This patch configures the BAM DMA engine with the base physical address
to be used as a scratchpad for dummy writes related to BAM pipe locking.
It passes the peripheral configuration structure to the DMA driver via
dmaengine_slave_config().

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index 88d253d9147cf..09699d96575b1 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
> @@ -116,8 +117,16 @@ static void qce_dma_terminate(void *data)
> =20
>  int devm_qce_dma_request(struct qce_device *qce)
>  {
> +	struct bam_config peripheral_cfg =3D {
> +		.lock_scratchpad_addr =3D (u32)qce->base_phys + REG_VERSION,
> +	};
> +	struct dma_slave_config cfg =3D {
> +		.direction =3D DMA_MEM_TO_DEV,
> +		.peripheral_config =3D &peripheral_cfg,
> +	};

[Severity: Medium]
Does this partially initialized dma_slave_config cause an unintended
hardware misconfiguration?

By only setting the direction and peripheral_config, the designated
initializer silently zeroes out src_maxburst and dst_maxburst.

When dmaengine_slave_config() is called, the BAM DMA driver copies this
configuration. Later, if the engine is not remotely controlled, it will
write this zeroed maxburst value to the hardware threshold register:

drivers/dma/qcom/bam_dma.c:bam_apply_new_config() {
    ...
    if (dir =3D=3D DMA_DEV_TO_MEM)
        maxburst =3D bchan->slave.src_maxburst;
    else
        maxburst =3D bchan->slave.dst_maxburst;

    writel_relaxed(maxburst,
               bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
    ...
}

This alters the hardware configuration from its default (4) and might
break DMA interrupt generation or cause an interrupt storm on systems
where the BAM is natively configured.

[ ... ]

Also, there is a second issue I'd like to ask about regarding
qce_submit_cmd_desc():

[Severity: Medium]
Can this error path leak the DMA descriptor?

In qce_submit_cmd_desc(), the code calls dmaengine_prep_slave_sg() with
attrs =3D DMA_PREP_CMD but lacks the DMA_CTRL_REUSE flag. If
dma_submit_error() detects an error, it branches to err_free_desc:

drivers/crypto/qce/dma.c:qce_submit_cmd_desc() {
    ...
err_free_desc:
    dmaengine_desc_free(dma_desc);
    ...
}

Because the descriptor was not prepared with DMA_CTRL_REUSE,
dmaengine_desc_free() will immediately return -EPERM without freeing the
descriptor.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D14
