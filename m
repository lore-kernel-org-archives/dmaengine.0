Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AA3BB678;
	Wed,  1 Jul 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893879; cv=none; b=PKULD4ezDyCvh9MTVy1JR/BMFzscH9CtRGLieBqGZMjVGve8Uf5b7FoCC9hhNd65vImk6jnMr2kK4ffvK5V5qksH+v6+svCaPreRMYv+ETQAvdWrdxMCB4V53/b79HEu7rTwN/wmxdj4zHzIVLMYFtUHeRshYBqvvvPm9fh6TEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893879; c=relaxed/simple;
	bh=dWBO3Ub498Krs5H8NbYO+IVSFHciaITAmJ2wCOmUxdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ff5ZSB+XbNl0lpJiA/zbCiKffXhZOwHYB1DZldXGKyQQppL9RQToGYokfrLHRQmFiSm5gFEbUXab5Q9bQkRaJv+TzuV2tJdvx0s5Ji1Gmst8Mk33nngWuveVPi87cOldtX4hGMRRaSxtFFDGagzL4Z2FNiqicU6ZNB5G2jOkzsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1YXBn3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1YXBn3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62A61F000E9;
	Wed,  1 Jul 2026 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893878;
	bh=h+neGWa8OqKBZ1Do2yjMNb/FZN1kT+CXr2XFwta3nxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e1YXBn3WqP2Zd4Z8JlUanT1IFMAXm57F4Y2bNb+ms+CRVMoLbk6A2N+AJD9aQIXe7
	 xoffTqEhCluA44hJHcPR48I5pv9IRCtMG5EqYxGq2H86kZHsCHWUC+fyWWLTO8PhJ/
	 kv7YL6/MStckCZuDK3ijElsAq5B0wpqfiVPfx11x1cYFp/XtMr7+OszojAXfyEMOgN
	 bQ7s8jvxMnD5lAUBAD+ITg/5ggtRz4Ux4ijRW/iKvDlY/1+7GvTZzEoaGpXvH+WMnR
	 7lt8C2ICQyu/d0YbRsg9IgbhhApSylUw4hY9A3FRo3R6fSlzjGilDve3ijj8Me5aWm
	 EpBV7onJCeS1Q==
Date: Wed, 1 Jul 2026 13:47:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhongling0719@126.com, Frank Li <Frank.li@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5] dmaengine: sun6i-dma: Fix reclaim descriptors while
 terminating DMA
Message-ID: <akTNMl8dhepg6GvN@vaman>
References: <20260701045733.33654-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701045733.33654-1-zenghongling@kylinos.cn>

On 01-07-26, 12:57, Hongling Zeng wrote:
> When terminating DMA transfers, active descriptors are not properly
> reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
> descriptors and their LLI chains to be permanently leaked.
> 
> Fix by using vchan_terminate_vdesc() which handles both cyclic and
> non-cyclic descriptors by adding them to desc_terminated queue for
> proper cleanup.
> 
> Add pchan->desc != pchan->done check to prevent double-adding completed
> descriptors, which would corrupt the list.

You should run checkpatch to fix the formatting issues.
ERROR: trailing whitespace
#65: FILE: drivers/dma/sun6i-dma.c:95

For now, I have fixed and applied

-- 
~Vinod
