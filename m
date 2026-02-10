Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6B18C03E;
	Tue, 10 Feb 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715931; cv=none; b=T69qA4n97x/pPMmwSdbCCKS7q+58BiGWBAL6HIhnBCgmTXgi4iehOo4em8zD/fjbhpJEcz4d31J8sPZEzKB9CidapFCOAV1cvw/F3djN/7O1MXdSm3IR16F7ufOyBgh8e3kTuTrp69WgQ6EuXFu74u7jq6NXhESUxUo7EoqqW1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715931; c=relaxed/simple;
	bh=kYIsjsZLgJxmXTXblWku2GtXgWhXhurnXLINQE6ERfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmGsPIVIWEDZ48pwF46Yh0ADYD+HyZybjQPgBV0VCidWudAiHqOsuAlCwrR0uDExi/J0ZUt8d3CBDLPjbWm27J22kb/fpf7FWff6hH2+4Gi3j0Tk2gUiouDMNIWhV/HpFIqyaNmDQsh4bz1EllU8eQIsOgyKnrzd8n6LBmaG830=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHmctRxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHmctRxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F2DC19424;
	Tue, 10 Feb 2026 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770715931;
	bh=kYIsjsZLgJxmXTXblWku2GtXgWhXhurnXLINQE6ERfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHmctRxeOHTEMyXoAI/mUEbFqzYmt+lBd8rPryGtvUW3R5CZSaCnClyNlRMIh5KZU
	 x/90ZEl0ec1YOqzg+fDsY10HyQ7aTfca88rxO3erwfe8fFRTXopjR6TOMBP/BaehDi
	 vVQ+oZzqMQbZNw3H02hzrzdLp+zaQMMb5Itr358hpi/LsZabgaT4ALAmvSrzVeJqtO
	 VGT0wbMf2UpsR9lhaIyI2GEgjTjkzsockfKZyEss5osL5TSYpqxOp2yP8Ws+s+DQ+2
	 /KP1+Gqfm+efygVNYyQvdf+NcM82SFirtwQNhkZ/nntugF/t8zdCJpCo6HvmPQK8kk
	 LYhQKKg/r2Ibg==
Date: Tue, 10 Feb 2026 15:02:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Logan Gunthorpe <logang@deltatee.com>, Frank Li <Frank.li@nxp.com>,
	Pat Somaru <patso@likewhatevs.io>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma: plx_dma: Convert from tasklet to BH workqueue
Message-ID: <aYr7F3ZPnOCs6sRI@vaman>
References: <20260206090058.1127675-1-patso@likewhatevs.io>
 <829601a5-f39e-43a1-bec5-80195a8833da@deltatee.com>
 <aYdtNHiE2wGp55cZ@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYdtNHiE2wGp55cZ@slm.duckdns.org>

On 07-02-26, 06:49, Tejun Heo wrote:
> On Fri, Feb 06, 2026 at 11:43:59AM -0700, Logan Gunthorpe wrote:
> > > Signed-off-by: Pat Somaru <patso@likewhatevs.io>
> > 
> > Looks good to me, thanks!
> > 
> > Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> 
> How do you want to route the patch? I can take it through the wq tree if
> that's preferable.

Sorry can you please not pick this.

This is a wrong approach as wq are not the correct approach for
dmaengines. Allen has recently posted an alternate [1] and we would do
the subsystem conversion for these.

Thanks
-- 
~Vinod
