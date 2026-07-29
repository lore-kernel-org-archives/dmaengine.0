Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0247D94B;
	Wed, 29 Jul 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329293; cv=none; b=DSguVAOlzExUOgpkLElJLr6fXzOvhXsBvTHT26jZrr3erwP7fQDiYbvNIsup3xdLSTETMk/fA7XaBcqFm4s7OSS9lFlOFVt96zU8ViVc+BGWi5zarvpyjkMDF/Hg5VNmbD6THdQH1uahIed9NvcmSkvnPYdCDCACsigWYU7ImDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329293; c=relaxed/simple;
	bh=wwRgOCeBZQChVq1ChsSDRS4YB781y7S5WARPQZjVtWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwxDIfKbxhLue6WyZFoCV/ZNhBiIxbLNEgTCvmuDObkY6YHqcCcjFnJ13nqxynPrv5CBU78Bo1au6MQS0nEXA1nzk68LmsoNiYc08GHusBdXa1F1ahLPW3Uo0Omoyioak/z9bXdStCcjROR/Vx/kg9d633nS18mIs7TTv3ZJY/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1wjp1wN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1wjp1wN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D174B1F000E9;
	Wed, 29 Jul 2026 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785329292;
	bh=sYgZf2/QfNDM4106ihswLkBRZZsASSaSX2oz23JSks8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1wjp1wN9pMX+n67S62f1la7WnwUn1ZuwixdrDqU96apxvHX0AAipUkzwgYXA0vKm
	 mMjM25ijlV97Cm1EEawj3IUueXuHKs/H1dQilT6rCPhxbENj9gr80jZfJsWnDmPZVO
	 ov2yotwR0kFgsSWHvu8ioDZgLy1xYCEvyr+Sewgm4c/yxNk2/zakhGljW1PpC1jm88
	 gRh3Ro3NEz6cey7N6mLIV3opNLnWfyl/nqyfTAjho5bhyIwrFVZldgw7Jki/j67OCr
	 VLn0JXG3j/X0dvbM+RjT1C6Nk7U8ZlvttfTjjt95tZFu9XjZuzP/eeV6rI94B5g154
	 B6fGByTa3cl0Q==
Date: Wed, 29 Jul 2026 18:18:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH helpers
Message-ID: <amn2iBN8NoBvZHzT@vaman>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>

On 27-07-26, 13:28, Allen Pais wrote:

>  void dma_release_channel(struct dma_chan *chan);
>  int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
> +void dma_chan_init_bh(struct dma_chan *chan, dma_chan_bh_work_fn fn);
> +bool dma_chan_schedule_bh(struct dma_chan *chan);
> +void dma_chan_kill_bh(struct dma_chan *chan);

Can you please name these as dmaengine_xxx. Yes we have mix of these
two, but I would like to see new ones move to dmaengine_xx and then
progressively drop dma_ everywhere

-- 
~Vinod
