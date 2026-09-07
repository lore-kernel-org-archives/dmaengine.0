Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48073CA48E
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766034; cv=none; b=FvLVoA4wF7bc8m/skJuYc5xp2LMNnGWYAznkElAW+EBHY9a+47SBgIYyeVd1CALYiaHYADfVN7My5VhBPqtzGlfQJqOY9JBE+ttamj+YNGTuWWOygNOrCVidPHwWtVg9qxtZJWs9MYPWXA8wkCAWVr8h05xXt0gvq2CgB7rblMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766034; c=relaxed/simple;
	bh=bkzSfvLv8uCTOD+y8cDpH4IX3uLOrXLpPZTytk2Apro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTR/Roe/THCLzy/fk2mCuDEwAMSVd94ASNSqftqxZphRVEA87CNH+ddI1R9+ENsKLBJQFJut4MDCguw3qr9WhSj8KOt6d2MDB+Ij+kTc5X3421CPMTBxwA+MkSpm4bZ/sCF2XwvWwiEpX6SjcCDRAmQ/4B1Swjr6wGt0wAfWvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+wQCUTy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+wQCUTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900401F00A3A;
	Mon,  7 Sep 2026 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766033;
	bh=aLZCQpd4zRCOxWEYxXdsUk4dsPVVO49Xiwr90zE82hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+wQCUTyZvbtinrF6tyzCItGaRLDiQy3ye+miRBc1T4ckowG++aqIhoxHNZxTJLTV
	 U3TFb3OrnxZH2F50OKpLLMVuSYULWt/0ToWF3HfB+dVoTDfRA3pV3qYEgN704E3yqj
	 43rXebvklHDbllds9676k/1TvtdbKRmR7AQNAMLBpFjmRDsyo4YSbgwdYahfHolJJI
	 XkkzASsnmendMaXeshc3h10eSfP+UHIKVihNvh9uFvVWBAya5Rn3CyeWIBa/gaGD61
	 isIcaTWvJEXzTpjl8AfyZu3G9krdL+wJ/Uu/gDXPna0EKjqPfyFUXAEjCqkO1TmfWR
	 akCkhe0od+Yjg==
Date: Mon, 7 Sep 2026 12:56:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
Message-ID: <ap5nQ1Q7s6RbdoUj@parshuram>
References: <20260903170357.1711462-1-vkoul@kernel.org>
 <fe1ff210-3a77-44e9-b092-76995ff3469c@amd.com>
 <ac8ea7c9-2c6f-422a-a741-7829c77d7c00@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac8ea7c9-2c6f-422a-a741-7829c77d7c00@amd.com>

On 06-09-26, 16:49, Pandey, Radhey Shyam wrote:
> On 9/5/2026 9:01 PM, Pandey, Radhey Shyam wrote:
> > On 9/3/2026 10:33 PM, Vinod Koul wrote:
> > > Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> > > dropped the use of err_disable_pm label causing warning:
> > > 
> > > drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
> > > drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label
> > > ‘err_disable_pm’ defined but not used [-Werror=unused-label]
> > >   1171 | err_disable_pm:
> > > 
> > > Drop it
> > > 
> > > Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> > 
> > Seems Fixes tag is incorrect.
> > Fixes: 3f30db282c28 ("dmaengine: zynqmp_dma: Fix chan probe/remove error
> > handling")
> > 
> > Rest looks fine to me.
> > Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > Thanks!
> 
> Just a thought - this bug is present in dmaengine/next and if it isn't
> pushed to external we can squash this patch to fixes commit itself (if
> rebase on next is possible)?

Yes this is for a patch I applied and found while building. So will
apply this...

-- 
~Vinod
