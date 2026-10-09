Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F57549BD72;
	Fri,  9 Oct 2026 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538006; cv=none; b=MuL6PGrXMz1sApWYAIFxCFpqJ/ONwdejxezCgCuy1D5Tjj0NxhcRMEnHzfrySQZFuDLzmBwgnCiqz8SdNauQc7rCI1CpniSMla4l3dWiUHHVGKUO2d6kLWjmV5dEnCQamrCo5yGxxZCWtolAj6gxNZUt+RI45odMnT2egldEYd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538006; c=relaxed/simple;
	bh=rweBYUy8fliv7r/8WwJA9aVEVvQ42EhG2SMccN58vBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YozWv1D8dtmMia1lJOe+5SGGSQFuZ9t96DSWjIcTrolzzqCHMGGTIc+cr9KMNK4/Mt2JKI+1lXFONRPs3s1aZCFDvm1bDfaVSu1KAG0zxLyndDQxNcoxfAYLRLjHtl0bz65I45bFOT7KaAC1xaTUWGSm4aZ9KoXyyKel4PsgF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giHJ5U1A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giHJ5U1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD771F000FF;
	Fri,  9 Oct 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538004;
	bh=yVsSI3SXa5DRzYRJOvwe55BxNT6uKu2WGOIaq41UovM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=giHJ5U1At4RzgREKGTxvdaA3wmcYizd6Qb/6HlB+SxtdK/zcAfjqoW6WLOT7w6R8Y
	 8cshIbFlp6aJHQa63snZZT4P79tpJLxcweToSoeaaWRYZNBNeCLk/ww8FRr5sm86KT
	 5guK1Uywl3kPM+Hp2kSxWoY+6ceLTuhSSSD9X0RLh7v4ml00QMUh42SDAFFqcmfxEF
	 pisQF+TQy2Rxfx6IVIaeXL7VyHqBjTfV6xSwsdeVmNJ+ZEhdty+ZUb3B4VFBTe22nj
	 TRNbLgbrIQvwHESQ4PgS5f0gBF35vJsdeX2cc24FVu8ORQxjgc9cCN5YOnOeE/PqvQ
	 f46BUuhpMmTmA==
Date: Fri, 9 Oct 2026 11:26:41 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@oss.nxp.com>, linux-renesas-soc@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <asizUWUuEdkyKodN@parshuram>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
 <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
 <arkPcxePb1G1vyZt@shikoro>
 <arkV-ru3aNXDFawM@shikoro>
 <ezlwzpaq54573ewlofeep3zqqajj7ycpanv24ogujtm3alc23l@ehq5obt3bnfn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ezlwzpaq54573ewlofeep3zqqajj7ycpanv24ogujtm3alc23l@ehq5obt3bnfn>

On 29-09-26, 13:13, Koichiro Den wrote:
> On Sun, Sep 27, 2026 at 03:11:26PM +0200, Wolfram Sang wrote:
> > 
> > > I share this thought, and I guess, Laurent expressed this, too. This is
> > > a separate task to tackle, though. I still think your original patch
> > > here makes the situation better by making sure the cache gets
> > > invalidated and should be applied. Or am I missing something?
> > 
> > Okay, I got now that Sashiko's comment was related to cookie-completion
> > and not the callback. For me, its comment also makes sense because it is
> > basically the same argument which the commits I quoted to Frank used:
> > ensure cache completion. This is not only good before the callback but
> > also before cookie completion. Or am I missing something?
> > 
> > This is easy to fix. If we can agree on switching unmapping before
> > cookie completion, I can update this patch and then send a series to fix
> > other drivers, too.
> 
> I agree with changing {cookie -> unmap}** to {unmap -> cookie} in this patch.
> It looks like an improvement, I don't see any obvious downside to doing so.
> 
> Many drivers do {cookie -> unmap}, so it may be worth making the same change
> there too. I haven't found a specific reason for that order in the history I
> checked, but I'd also like to hear Frank's thoughts.

I cna chime in. I think Shashiko is correct here. We should ideally
unmap first and then call complete. This would ensure anyone seeing the
completion would get the right data buffer and chances of stale data are
eliminated.

So Wolfram, can you please reverse the order.
Also, lets document this.

Thanks
-- 
~Vinod
