Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98E38BF6A;
	Sat, 18 Jul 2026 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380495; cv=none; b=biZz8VrEvQvUmf743aWEcUDURIstZFVnc3zZZotpRE+BwoQZC5irjFNhtjo56wVuW16BQT0JoXfnqHDRRfhUt9XRt14daXNNTns+2joOcGxenDJfuaXRHQYd3ZOvU++dimfGDJgV1ySF/JmKZZU0ONZjDUeQiVIqvwRVOuvxqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380495; c=relaxed/simple;
	bh=pz1vTTJP8O/W6RQ7mwo4Sv7n2igwyxVzoVFa/GoA/R0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PyVlYEZAcsdGaFXV4zFDvHr1YtJaYts0XGx270s4x5j1LhL/n8lb+tpl+uEhJk3bulB8aD/43awKUnlrG63KE8XlL9ac7d4BonoxO3x8AmKLZ76cBEY3a69RglWjcwy+5xZGe5UvTDbdi/A/PPLnFQQSu12lK73vsYNyja1kBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0Xu4ZXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0Xu4ZXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94821F00A3A;
	Sat, 18 Jul 2026 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784380494;
	bh=qUGYEiT2IJcAJnJIpsaLJ0Vsp9fMDihJhCWl/Q0XWlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F0Xu4ZXeqdy8c5DixPX9JECC9Icm/cv/Te/hwiouQ+cKiv6Ilx+wuAiVi9tVC/OJG
	 4C4MqyLfS2ZpURjjT8BIxgBzM2FkRovVllF4JyLNHzas2/+oqRpxGyZHo6QnUIKpMt
	 QXGjnctkNHD0N0XIyRfsVHSCEzAayXIMKRt5AMuunzzDtoE4d1DQD98KB2HE2b1CMf
	 UZCG5j2+cbCNCWdaocKEtrXsk2frXk5bK+7XSHy/1tqImdKFuol4gA6sHTqPZqSHcz
	 1lyUJ+dwbs4/P6ja+S39kcZf0V2vsDKVTFLHiCNbobgjhRHT2EpDT6jToFbuywVSSj
	 u+xW2bq3sq4SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: fsl-edma: tracing: no ptr dereference
 during log output
Reply-To: sashiko-reviews@lists.linux.dev
To: "Martin Kaiser" <martin@kaiser.cx>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20260718130024.341243-1-martin@kaiser.cx>
References: <20260718130024.341243-1-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 13:14:53 +0000
Message-Id: <20260718131453.A94821F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Double byte-swapping of TCD register values on Big Endian CPUs.
--

--- Patch [1]: [PATCH v2] dmaengine: fsl-edma: tracing: no ptr dereference =
during log output ---
commit 3052808ada723a8fc5d5327178f31b6879486260
Author: Martin Kaiser <martin@kaiser.cx>
Date:   Sat Jul 18 12:58:48 2026 +0000

    dmaengine: fsl-edma: tracing: no ptr dereference during log output

    The fsl edma events store a pointer to a struct fsl_edma_engine in the
    ringbuffer and dereference it when a log entry is printed. This adds a
    membase field to the event to avoid dereferencing the pointer, preventi=
ng
    a use-after-free if the edma pointer becomes invalid.

    Fixes: 11102d0c343b ("dmaengine: fsl-edma: add trace event support")
    Cc: stable@vger.kernel.org

> diff --git a/drivers/dma/fsl-edma-trace.h b/drivers/dma/fsl-edma-trace.h
> index d3541301a2470..45d964a3726d6 100644
> --- a/drivers/dma/fsl-edma-trace.h
> +++ b/drivers/dma/fsl-edma-trace.h

[ ... ]

>  	TP_fast_assign(
>  		__entry->edma =3D edma;
>  		__entry->addr =3D addr;
>  		__entry->value =3D value;
> +		__entry->membase =3D edma->membase;
>  	),
>  	TP_printk("offset %08x: value %08x",
> -		(u32)(__entry->addr - __entry->edma->membase), __entry->value)
> +		(u32)(__entry->addr - __entry->membase), __entry->value)
>  );

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential problem with how
the value being traced here is written to the hardware on Big Endian CPUs.

When a DMA transfer is initiated, fsl_edma_set_tcd_to_le() prepares the
in-memory descriptor fields in little-endian format. Then
edma_cp_tcd_to_reg() passes this little-endian value to edma_writel() via
edma_write_tcdreg_c():

drivers/dma/fsl-edma-common.h:edma_write_tcdreg_c() {
    ...
    __iomem __le32 : edma_writel(chan->edma, (u32 __force)(_val), ...
    ...
}

However, edma_writel() uses iowrite32() which assumes native CPU-endian
input:

drivers/dma/fsl-edma-common.h:edma_writel() {
    if (edma->big_endian)
        iowrite32be(val, addr);
    else
        iowrite32(val, addr);

    trace_edma_writel(edma, addr, val);
}

On Big Endian CPUs, does this result in iowrite32() double-swapping the
already little-endian descriptor data and writing a corrupted value to the
target and source addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718130024.3412=
43-1-martin@kaiser.cx?part=3D1
