Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC1394794
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751855; cv=none; b=Kl1Apd1iTmOrK0p98ketXVjs/OzQCprkRKt0WXYzmj1wi+lBHbJsdWovfJMRco2Kr1656qW+vY6lBKRMEh7f6+zbQIsM/lFJ/BckvIEpOQr5RkDXEp9lZgO22afw7/q3Prpu5IM8dhZac5hsELgdlBFIP/SSuEhqVk+FBAoV2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751855; c=relaxed/simple;
	bh=NTC3Gw48ldFqeTM/MyMUk9W7FQpdSSVMIoZc8wW6qBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfNtZvBOeplJCxKGs26Q7Wq8jgDz5mdOVEOzBUfFLZ669llDnxrGDu//jaxnA81SbgsbbkH738LX8QUpB6IpUXfgTFOOEgZwLrmbAnsFr4f7bbAiedInO3rVlQLnPk9ORIRc1JHS2NhCAbrCOaJWre6lXKavDeTt+g6kxwD3bv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2pg2u+Sx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=clCadTDB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2pg2u+Sx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="clCadTDB"
Date: Fri, 18 Sep 2026 19:17:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789751851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jNMW+8kIr1Ga5wZOIyAdIG5R62p+zha9uLW220N0jGc=;
	b=2pg2u+Sx3oEUk0mNmzz/Yi47eh7piHqjfAKmOZ9HbkTvhB35gq+f7dg8L5xsVjPIxcPgnc
	BMjUL6uEXuqbk+HdGTK69owpUzgtRo1i8gSsdYAl75rdqX3CC2M7LJ6K49J8HG7z10Lim1
	mZ/vu+zhJnaL23A2S/n67HuXen5zjH6tgN2pPw/uw1NRt2Qyh8Ojg7ou2BrvAmW75x6umO
	c6rnVoqPBPN5cjjJ6pWANar56tLxONe+Alfzfju7hkqPeFrvmiFN522jUrQCsjej4iwtP1
	6j4K3VMAev0JoOfjgVCVs0fBjIHoLzPPSuyoh+il6l+/Aauw+tFgnkUSiMislA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789751851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jNMW+8kIr1Ga5wZOIyAdIG5R62p+zha9uLW220N0jGc=;
	b=clCadTDBfsADASaSJD8jJwC95FNf/tz/DnR50RWMFAdCfpBFH34Dq+bgw1CJ2dZ1eH6gH/
	NetqPcjs6GI5WxCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: loongson: Use %p for pointer formatting
Message-ID: <20260918171730.HoXci15y@linutronix.de>
References: <20260918103409.UV4g2ON7@linutronix.de>
 <aq1voagTv1oJ8FaA@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aq1voagTv1oJ8FaA@SMW015318>

On 2026-09-18 12:06:41 [-0500], Frank Li wrote:
> On Fri, Sep 18, 2026 at 12:34:09PM +0200, Sebastian Andrzej Siewior wrote:
> > The %pK format modifier was meant for /proc kind of output, not general
> > printk output. Since commit ad67b74d2469d ("printk: hash addresses
> > printed with %p") pointers are hashed by default and the behaviour can
> > be controller by `hash_pointers' boot argument.
> > The policy on %p is to not introduce new ones. This is the only pointer
> > output in the driver.
> >
> > Remove the pointer formating from debug output.
> >
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > index 1c9a542edc859..27f8f7a5738d9 100644
> > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > @@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
> >  	guard(spinlock_irqsave)(&lchan->vchan.lock);
> >
> >  	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> > -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
> 
> You remove whole dev_dbg(), but commit message said Use %p

I redid based on feedback before submitting and forgot to update the
subject. Are you fine with removing it?

> Frank
> >  		loongson2_cmc_dma_start_transfer(lchan);
> >  	}
> >  }

Sebastian
