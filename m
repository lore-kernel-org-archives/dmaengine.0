Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1357469841;
	Mon, 12 Oct 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795081; cv=none; b=MPzhaXtKlFPMB0xc/gXh6sa91DHypBdyfq2Ndg913cx9BAE1FNy9/cvsa/6gNTZk77Z+GcwaMLD7S+WpgeeXMWxSzjfgWhiLZjh0AWA7sNXr1wlA/y8oZCU6zVElYph4ViLVBaZXPNyjByGsCBE99zl3ccNQBB5bn0Hb+BL2KFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795081; c=relaxed/simple;
	bh=5hoyyoSORk9mzUd+W1nOoRHU/O1mL/R7NkGxhA54QXE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DD7DwDGhZq1QYjgrcSWs32jwG6vwxH7bg04SEHzkTOLyZx2YFC1nj0Euz8Ph9bH64HPcM70K7Lh1qiegTb/FHi/YcN+9rLmyypbOj7GS9G7vxihziMI4GeVnEK5GJvW4XcIiKpFhoDZBP66fLWbXIGKgOHX6tImCfiPqjIhbXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjVCr3vW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjVCr3vW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACB01F0089C;
	Mon, 12 Oct 2026 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795079;
	bh=g8DFu80vVeE+gFk1uhLcIaTP0KcYgoGx+Z11nrn5M8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QjVCr3vWTtdLWT+sjmTimDvsbFfG9WrukC/DBP6VY52vHHG8/nqDe4LKC4MtjDPVf
	 rtQJS1av/+sQgJCxn3bb+qsrv1a7Utz++YvKt8ZCLZYmtZB2j8uN4b5ITRhXs03/av
	 ZVTxdhWHfPzgh4Dw9Y4xaprXl+T3fopwMgh7pek9n1hcFV5UgRtH1x6+kypDjqZ9xu
	 YKuGLSwVNbhFNgN0rr3OI4ITp7H6cf3WGU1nVxGRkUygH2tdsQpVKX8CkoYVjmYrZU
	 9JTF5XLhpM9pXBKpb6AWAjWhpcfAYHdgXkEpe3Ms5xvdherNok2Ve1nD75Leq+ixqo
	 t1gWlg8TZhMXQ==
Message-ID: <sashiko-outbox-167868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] dmaengine: arm-dma350: Support integration
 clocks, resets and reserved memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012084155.2547480-6-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-6-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 08:51:18 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: probe fails on level-based reset controllers due to -EN=
OTSUPP
--

commit 9e76b19e390586bfc4ec916b67c4dd6c3a4800c5
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Support integration clocks, resets and reserved memo=
ry

This commit adds support for integrating the arm-dma350 controller with
clocks, resets, and reserved memory regions using the device tree. It enabl=
es
the clock, triggers the reset control, and attaches the reserved memory
before registering the DMA device.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 79bd6a04ea0c5..d811a0dc9fe9e 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> @@ -1139,12 +1142,28 @@ static void d350_free_chan_resources(struct dma_c=
han *chan)
>  static int d350_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> +	struct reset_control *reset;
> +	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
>  	bool coherent, memset;
> =20
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
> +	reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to get reset\n");
> +
> +	ret =3D reset_control_reset(reset);
> +	if (ret)
> +		return ret;

[Severity: High]
Is it intentional to fail the probe if the reset controller does not support
pulse-based resets?

If the underlying reset controller (such as reset-simple without a pulse
configuration) only supports level-based assert and deassert semantics,
reset_control_reset() will return -ENOTSUPP. Because the probe function
aborts on any error here, it will fatally fail to bind on those platforms.

The commit message states the intent is to release the reset, which usually
corresponds to reset_control_deassert(). Could this use
reset_control_deassert() instead, or is there a way to handle the -ENOTSUPP
error gracefully so the probe can succeed?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012084155.2547=
480-1-Jelly.Jia@cixtech.com?part=3D5
