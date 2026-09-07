Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12A34B669;
	Mon,  7 Sep 2026 03:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752515; cv=none; b=ECBHZQFrLlAilkKP7qVoOCXAFKl9sC/iUjlHyKyhRs0U+58qXY8hgjw746WLrEhe4cCJE9bKZQrbtfesUEvVucwiy/BpbHNvKxG21ZM+C2m2Jzq8cszD+KuIe+DAWcY0hs52Ey0pM5kUd/+gCFz4VqfvYzwgPnSUxVOjxOs9A1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752515; c=relaxed/simple;
	bh=biYRPLu73uTwPMN+5Z+1q7VJHLamcrJrBUACS/Onm28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kXB59luf38XMxS/m1FgRwnoVy9zFnmC1toVnAmQIlBywqNgKBQTuU2OhokSXQjaGyPhH64J3ubmTlIzxnMcFRWPkcOOHG7jf+/eggYjGQ2yDUQVPkx48rDJl7YV+spK8xyvq0SRF8KXnHcsT0h77KEXEIzE1MmmqIoCfC2FNDlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdIsnWE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdIsnWE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EFA1F00A3A;
	Mon,  7 Sep 2026 03:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788752514;
	bh=PPUN7af+VqE8OBwOrB5lewxAsz6OcVFxBqD/H24uDUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HdIsnWE+s+FdHHl4GIpZ9vO52FMElJG8jw3MwSmQnntWBbGi3SvWoU7cRMkFu1cjl
	 9LebI3Nhu7umvhkw6h7bplJybOxDhLb4xDInOpRHT1budCb4qQcNWHdVkQp3EV7OG1
	 3T//iH1WlkYQNmvEUz4pfBEjM6TQ9cDmYIj9ItNAufBSs6Gv3c3qiNhr+PynN8T5zr
	 jBMGxCr2h4SyEDy5Enkg9ATef0TWPSB1EvBsLCUxRCeKCnEIXskZGcyFQRCZFHx6YE
	 jhZB+m7MEhPD+4de9phYCMK8cfnaVlZwEGsoAsVZ6JufZQXc/8JttcW9hfhtYw7DP/
	 PDwZ7V/GkKU4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/5] dmaengine: arm-dma350: Fix source trigger bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260907033404.596839-2-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20260907033404.596839-2-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 03:41:53 +0000
Message-Id: <20260907034153.A8EFA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores the return value of `dma_set_mask_and_coherent(=
)`, which can lead to silent memory corruption if the requested DMA mask is=
 unsupported.
--

commit c925d144b95da8512ff2006d79c7add5a368be10
Author: Jelly Jia <Jelly.Jia@cixtech.com>
Subject: dmaengine: arm-dma350: Fix source trigger bit

This commit corrects the bit used for the source trigger enable in the
CH_CTRL register. It changes the value from bit 26 to the proper bit 25 to
avoid inadvertently enabling the destination trigger input. This prevents
silent failures in transfers that wait for a peripheral request.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 09403aca8bb06..4e17130de6c87 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -63,7 +63,7 @@
> =20
>  #define CH_CTRL			0x0c
>  #define CH_CTRL_USEDESTRIGIN	BIT(26)
> -#define CH_CTRL_USESRCTRIGIN	BIT(26)
> +#define CH_CTRL_USESRCTRIGIN	BIT(25)
>  #define CH_CTRL_DONETYPE	GENMASK(23, 21)
>  #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
>  #define CH_CTRL_XTYPE		GENMASK(11, 9)

While reviewing this, I noticed a pre-existing issue in the device probe
path:

drivers/dma/arm-dma350.c:d350_probe() {
    ...
	reg =3D readl_relaxed(base + DMAINFO + DMA_BUILDCFG0);
	nchan =3D FIELD_GET(DMA_CFG_NUM_CHANNELS, reg) + 1;
	dw =3D 1 << FIELD_GET(DMA_CFG_DATA_WIDTH, reg);
	aw =3D FIELD_GET(DMA_CFG_ADDR_WIDTH, reg) + 1;

	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
	coherent =3D device_get_dma_attr(dev) =3D=3D DEV_DMA_COHERENT;
    ...
}

[Severity: High]
This is a pre-existing issue, but should the return value of
dma_set_mask_and_coherent() be checked and handled here?

If the requested mask is rejected by the architecture or IOMMU during
device probe, couldn't the system fall back to a default mask (typically
32-bit)?

If the dynamically read hardware address width (aw) is less than 32, the
kernel might map memory addresses that the hardware cannot reach. Could
this lead to address truncation by the hardware and silent memory
corruption during DMA transfers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907033404.5968=
39-1-Jelly.Jia@cixtech.com?part=3D1
