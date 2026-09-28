Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131B2D0620;
	Mon, 28 Sep 2026 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565123; cv=none; b=mnQrB8UnEhaUKWLwoiAS/AfXb2Ts52pVWLJB7S6jmZHPfuaurwul6x2ubVXgp+nlDy0lAELWdXFSrX/Dfowbfqa0LIeEq33LxmKf6kvNkOnskGyrQ65hNaWaukmTsBgANuerTXG9EEvWM3nFL2cl1AGHkWVC7vMCtSSVmx2fwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565123; c=relaxed/simple;
	bh=kVM/1fDOzFXxp5YcsJhgnyfn+PeFPmkkf65ClxOh6EA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OrRrd1gBjCws7ywWcox2qudotTP6d409R5GTlsSidMPdcMpoHxmo1a0u2orr2mkMvjw/aG2Eugg/r3tnsqWt63cqsMPw8CAUK1Vuwo3vcIfBpw+AZbvVurLtnvk4puf9gm9FxX3tlBwwQu5LcgvW7z7aLrzYlUHI7uAc9nq15QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM91RSzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM91RSzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11731F000FF;
	Mon, 28 Sep 2026 03:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565122;
	bh=pGBFZaw08Yq8BQQPcDWlfLaiYvDGI1ez012qrUGu1bE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LM91RSzSoAnWZ4vj1HJlwgNd1b7BSVFmZ5k1PqhwpA+AmcEq19q3icydPs8vT/R8m
	 vewRQZL/WLtcycWTIEbyG5vzCzNAz/qCzueAF0kQ55yd5pwSGOU9Dtq/QsrZrFh+jl
	 3I8L6/MnnyvbHyxPgZ18+jVfhURjsMcHTzC3TLbVa/5FVPRrfRlJDKa+Lp0r2xeTXK
	 j57bSLtOptIcpB9brVGkfXy3/mfmPnLi7QNg6Ksa0Y4ut0axIvX3bpwWV1qvPunGkT
	 TC+HT2HRy02g+R8HjnzRQo1Tct+JjvRM1k76/8oKBMJOl7Q5T6SGmCPOjKWBkJojAM
	 YXQnRNjkutLhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/19] dmaengine: ti: k3-udma: move static inline
 helper functions to header file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928025749.1055383-5-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-5-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:12:01 +0000
Message-Id: <20260928031201.B11731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: missing <linux/io.h> include in k3-udma.h
--

commit 5bd09b8edabbd7745c849b6097d830d3dac4a91b
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move static inline helper functions to header file

This commit moves static inline helper functions from k3-udma.c to the
k3-udma.h header file to improve separation and reuse.

> diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
> index 11d08adb0d69f..54e1757c3de38 100644
> --- a/drivers/dma/ti/k3-udma.h
> +++ b/drivers/dma/ti/k3-udma.h
> @@ -451,6 +451,115 @@ struct udma_chan {

[ ... ]

> +/* Generic register access functions */
> +static inline u32 udma_read(void __iomem *base, int reg)
> +{
> +	return readl(base + reg);
> +}
> +
> +static inline void udma_write(void __iomem *base, int reg, u32 val)
> +{
> +	writel(val, base + reg);
> +}

[Severity: Low]
Should drivers/dma/ti/k3-udma.h explicitly include <linux/io.h>?

It uses readl() and writel() here in udma_read() and udma_write(), which are
defined in <linux/io.h>, but the header does not explicitly include it. This
can lead to build failures if the header is included in source files that do
not indirectly provide <linux/io.h>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D4
