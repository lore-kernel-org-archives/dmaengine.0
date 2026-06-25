Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D943803FD;
	Thu, 25 Jun 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379240; cv=none; b=XlHKOkRT9B9I8TNOZCDzXaQxQzmDhP4m9VUyziVIHahojDM8cfH+mfOCLSIN5wF4QoRo2jMZINL7Wzaow7MyMGFYeeDYvBRc73CKQ2gCAuzjcwzK7N/Ak1GTMYfi/MLExRJtvG7vkv7Hp/plhkETym5WcDhdToCv3HEVMPsyF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379240; c=relaxed/simple;
	bh=NnkG0LvREYMOjpL9Cyd2P83GELQnlTFtH+tWfVG7cI0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TiSgtbmi1mrvqpPTmv1PVfgx7mRfTPRvxvYOUCm1ba1SmtJ4cDt6OWe5v5Rj1svBPedXqSwz7zm06Et6J58IRejFhh0sgDFjiklrCV1koXu9yKMILV7yixdtFzEz4oTE8bIiMA/pikEC7gI6231jOGeNRm3O3rxImUniD+HnoJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRsvbs1d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRsvbs1d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEF71F00A3A;
	Thu, 25 Jun 2026 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782379239;
	bh=ZmtqwaEfrCM1u9fWEVQASF5DOPAFCjKZpojpUgoJkzA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eRsvbs1dokLAI2sGi8rf4XCSASXeuTYoPDltekiccRYc7qP/8IWRE0Y8B+K91LXH4
	 4ubFNi1l5/GuM+y8M+slpKc5qOdLOr3nxClmggJ5dCxNZaMHH9n6w+VvyeDTR7kKu8
	 b8l71La/DVX5gh/GX/7KLdVlCFXTG+K4E+47Veg+STrsflVmE7A4zj88nVtNIRUF0z
	 leTL/WPnWLrfalvE0tFI3QCqSp9C3i6/QdFpiM548E7RXqemHAa6SOEjOzGriHB14D
	 2vnNjCyvdat7UGBNtkvivpCnwZcui2MW052wQGnbmXHAXX1indXGFTb3VYTQNXcbyr
	 nzIBNR2R90Qrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] dmaengine: fsl-edma: Add FSL_EDMA_DRV_MCF flag
 for ColdFire eDMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jean-Michel Hautbois" <jeanmichel.hautbois@yoseli.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260625-b4-edma-dmaengine-v3-2-44be00ace37d@yoseli.org>
References: <20260625-b4-edma-dmaengine-v3-0-44be00ace37d@yoseli.org>
 <20260625-b4-edma-dmaengine-v3-2-44be00ace37d@yoseli.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 09:20:38 +0000
Message-Id: <20260625092038.ADEF71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch correctly bypasses the XOR byte-lane adjustment for 8-bi=
t registers on MCF eDMA via the FSL_EDMA_DRV_MCF flag, but fails to apply t=
he same bypass for 16-bit registers written via edma_writew(). This will co=
rrupt TCD 16-bit register writes on ColdFire platforms.
--

commit e23a155133dba0ca56d6eea575c63bb35a8ef9ab
Author: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

dmaengine: fsl-edma: Add FSL_EDMA_DRV_MCF flag for ColdFire eDMA

This commit adds a new flag FSL_EDMA_DRV_MCF for the ColdFire eDMA driver to
bypass the XOR byte-lane adjustment for 8-bit registers, ensuring writes
target the correct documented addresses.

> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
> index abc8f78055156..64b5375272917 100644
> --- a/drivers/dma/fsl-edma-common.h
> +++ b/drivers/dma/fsl-edma-common.h

[ ... ]

> @@ -419,7 +421,8 @@ static inline void edma_writeb(struct fsl_edma_engine=
 *edma,
>  			       u8 val, void __iomem *addr)
>  {
>  	/* swap the reg offset for these in big-endian mode */
> -	if (edma->big_endian)
> +	/* MCF eDMA has different register layout, no XOR needed */
> +	if (edma->big_endian && !(edma->drvdata->flags & FSL_EDMA_DRV_MCF))
>  		iowrite8(val, (void __iomem *)((unsigned long)addr ^ 0x3));
>  	else
>  		iowrite8(val, addr);

[Severity: High]
This isn't a bug introduced by this patch, but should edma_writew() be upda=
ted
to bypass the address adjustment as well?

Looking at edma_writew() right below this function, it performs 16-bit writ=
es
and unconditionally applies the ^ 0x2 XOR offset adjustment for big-endian
controllers:

drivers/dma/fsl-edma-common.h:edma_writew() {
	/* swap the reg offset for these in big-endian mode */
	if (edma->big_endian)
		iowrite16be(val, (void __iomem *)((unsigned long)addr ^ 0x2));
    ...
}

Without checking FSL_EDMA_DRV_MCF here, wouldn't writing 16-bit TCD registe=
rs
on native ColdFire platforms still apply the ^ 0x2 offset and incorrectly s=
wap
registers like soff and attr?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-b4-edma-dm=
aengine-v3-0-44be00ace37d@yoseli.org?part=3D2
