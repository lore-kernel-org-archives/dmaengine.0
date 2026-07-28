Received: from akranes.kaiser.cx (akranes.kaiser.cx [152.53.16.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062BA3E49C1;
	Tue, 28 Jul 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.16.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226772; cv=none; b=UGWmiJCK17MN7Hmy1hYRzr2RhBwDoty/pxPOhv0WgQ5RYGVHU3ZAmMhTtPS81BxAHk7C0bidNKEdDTKk24t3lop8qSdOoN1y/MalCUjSkw8+FShu9AXFlQ61nYnAma0e5BwXbdv3W0iktILdYT8104s00WOLFJlVqTLHDURYYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226772; c=relaxed/simple;
	bh=gPcTEODO5QHfXsCrSNwFtFHTNTQUpFzHaQy/9orEqOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY4wmNheM3kAKphf3yfjsoTMitFZkxBLAYWKPi0h4FqHWskWPsQbCoZkt0fpUHvTsRvCTKGVrUxDi1xNuZkBy7Nb7qVw9CvvFgXJn6vTwSJU21TSXeNgUKV0Zjj5mNkBS/DysWCsg3Po25ljpMdIpx5msGcvL7Q9uXx4MzNAFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaiser.cx; spf=pass smtp.mailfrom=kaiser.cx; arc=none smtp.client-ip=152.53.16.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaiser.cx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaiser.cx
Received: from ipservice-092-209-184-216.092.209.pools.vodafone-ip.de ([92.209.184.216] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wod25-00000001A77-3ngN;
	Tue, 28 Jul 2026 10:19:25 +0200
Date: Tue, 28 Jul 2026 10:19:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH v2] dmaengine: fsl-edma: tracing: no ptr dereference
 during log output
Message-ID: <amhmDM2DWyL3ngRc@nb282.user.codasip.com>
References: <20260718130024.341243-1-martin@kaiser.cx>
 <20260718131453.A94821F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718131453.A94821F00A3A@smtp.kernel.org>

Thus wrote sashiko-bot@kernel.org (sashiko-bot@kernel.org):

> However, edma_writel() uses iowrite32() which assumes native CPU-endian
> input:

> drivers/dma/fsl-edma-common.h:edma_writel() {

static inline void edma_writel(struct fsl_edma_engine *edma,
			       u32 val, void __iomem *addr)

where val is always little-endian

>     if (edma->big_endian)

edma->big_endian is configured from a devicetree setting. It's possible that it
doesn't match cpu endianness.

Could we check __BYTE_ORDER__ instead (or additonally)?


>         iowrite32be(val, addr);
>     else
>         iowrite32(val, addr);

The potential endianness issue affects only the value that's written to the
hardware. It's unrelated to the tracing patch that is reviewed here.

>     trace_edma_writel(edma, addr, val);

The value that's traced is always little-endian. We might have to use
le32_to_cpu(val) in the trace event definition. But again, that would be a
separate patch.

May I ask that we put the sashiko comments asided and merge the trace event
fix? (I'm happy to submit another patch for le32_to_cpu in the event.)

Thanks,
Martin
