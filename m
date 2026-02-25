Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A26C3815D6;
	Wed, 25 Feb 2026 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012230; cv=none; b=Zly8aveuLIC4vvrO6sFJsIvAoIFYJdVeTNXugtV8OfHQeMYhLBpCVjeUTy1yjbxXEfeSF1YqSbhgVdhe5OSIVUo+5Sx3MhmU40pilFqD6aYj16lpO7qfX6cQugwm9qNqCBbQY08J8Hsi7BmuFJSzRitL4F7wX2P2KUDrd2UTspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012230; c=relaxed/simple;
	bh=Y5mfFLDdpqHWC9fmKpe0xYSJu3HTMY2LxqcLVpCggdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBaLehmZkaq8YQXwMTd1INvNaUVqvaDqslsq7D+QfaRbOsmyNs6NMpJ4nvxo9g1PZ2tqyQnqWm4+YS5Lnen5AbMkQJ6RUeU3p/pi/cJctN/KhaBdYuyjLTkhc9EY8LNex0OJ4MmbFc06uNwPt9g1QmS00wCEt+kEbMyU/RY6oHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgE03R+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgE03R+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626C2C116D0;
	Wed, 25 Feb 2026 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012229;
	bh=Y5mfFLDdpqHWC9fmKpe0xYSJu3HTMY2LxqcLVpCggdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgE03R+WM1OMXzXaZOob36Ka9GWv4ZxAVfKJwQLBXatKsaNMv8nmYQLZbhvwGry4A
	 Axw98PPGLN05AcdHEsZcGpaib0mWPq/7qilCutAFlocVIiszOrkgOJ82FykogF38qh
	 xKXL++INT456Vg5bas3SwOKQCVzX1ZhD4hqH+qePCygCj5wDaf1NutMT8PnOR3DC9/
	 u7J37lQkfQBKMcHTE2FVDCOazww52t0fpuRif0nwiHe0czqGaskYOeaoal+mwTXrvI
	 hGGAcb/wBp/AtCcns7Rvz3kPns6kUwsRw0V1H6EaIoMGyeK/d2+wtGwnNfkzmgUGCN
	 03QQ6/1O+s0hw==
Date: Wed, 25 Feb 2026 15:07:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexander Gordeev <a.gordeev.box@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] dma: DMA slave device bringup tool
Message-ID: <aZ7CwvrgPMkzMouW@vaman>
References: <20260221132248.17721-1-a.gordeev.box@gmail.com>
 <aZ4njFwdYsMLTcSa@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ4njFwdYsMLTcSa@lizhi-Precision-Tower-5810>

On 24-02-26, 17:34, Frank Li wrote:
> On Sat, Feb 21, 2026 at 02:22:46PM +0100, Alexander Gordeev wrote:
> > Hi All,
> >
> > This is a custom tool that can be used to bring up DMA slave devices.
> > It consists of a user-level utility and a companion device driver that
> > communicate via IOCTL.
> >
> > The tool is likely need some polishing, but I would like first get some
> > feedback to ensure there is interest.
> >
> > I also tested it only on x86 and have little idea on how channel names
> > on other architectures look like. That could especially impact the way
> > dma_request_channel() treats user-provided target DMA channel names, as
> > exposed via /sys/class/dma.
> 
> I am not sure if it can work for general dma engine because it slave setting
> is tight coupling with FIFO settings and timing, some periphal require
> start dma firstly, then enable DMA. some perphial require enable DMA first
> then queue dma transfer.
> 
> burst len is also related with FIFO 's watermark settings.

Correct!

I like the idea but it is not practical. Every dmaengine is tied to the
peripheral for setting up the transfer. It is not a memcpy! How did you
test it, which controller was used ..?

-- 
~Vinod
