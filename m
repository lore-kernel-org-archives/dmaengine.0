Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570D3B5303
	for <dmaengine@vger.kernel.org>; Thu, 26 Feb 2026 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772135022; cv=none; b=u5CLrA9OU2OcKo037Qx28ED7emX0mh6xmE0GewdWKmniS0Qbd+JpmL7/pv8rFImG8GxU2/YtKi6m/Ol+2yfkVe0n+8uENrNUdA/R7Xx62mkPKthXndEE52S7W/R+X4FIBt5wcLZE8xa9Pxpj4VAXdfaxSzss7DtZ4kE92rirkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772135022; c=relaxed/simple;
	bh=KsIDUmCbm8ycOJF0wmH++ZInq+LAYBBS4hDDp4hu1Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ5X4BAkSSXHJuK0oRZOXQ3zsXQoQ9wxknz83mKsWQTg3VPZ80g5HG+TIsWgmIQ9uCJaVKnK7aVWBJbkbAauz/5jFKeNZN3aHwBg1GcyFFoOIXO2mTDj1B+WWQBMTjepGSdcr7782htQiyvvpRedpVmqk7LlvWcPFhUMplV+rO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBUstrVD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBUstrVD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4398913af88so1122635f8f.2
        for <dmaengine@vger.kernel.org>; Thu, 26 Feb 2026 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772135020; x=1772739820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVb2KwRi5Vzg4eql9FYlq5xGm1WE+ci+AdR3AsLLeHc=;
        b=HBUstrVDBuIlAwmiQBFwl/u/oJH/KMV4w5Hc8TvMcqKWj6Jsu9bjlemJbmGNl5RBPL
         OxXXvyEbqtTOSUmM99lQFgQQTr4uhx6yesWRpWA4xJUi/hfM0U2dPIoqL1oCiPlHE4lL
         PF2jS2+rdWJVL0vraqCahhPZWYt/ZNDQ4z3Qhide9DS1LEkVVrJJtrcL+z0eepU7NsXW
         vttTLaKBbmeo6RANvMMJ8w70DqgOwFhlHoS23iwfRuiyezTfCZF/qUIYP+EuGzhk57N+
         EhRRPg6N6T8OBeqr9XhZRjULQflflCqyj5HLzX4TR0P/yR4lNIzPwtIJKwGdW8Xil5P0
         /zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135020; x=1772739820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVb2KwRi5Vzg4eql9FYlq5xGm1WE+ci+AdR3AsLLeHc=;
        b=m3tbShyDeXEhpO0tR7FMIx4aJOIWI1NlJA2+xzphRserYK+gfeASoLd+7M7jovYz4z
         0YTcGXOEiWtlChKaggQaB9KOXIHKYZ8Vo67fC9xtS1GXWC3RoZRZnHGKW7xVBFaeZGP7
         XE6bNqlMfaAIFs23m6boc3KxNR8j7Ju16ydTxkE3TRsct+8Lt7Zqid7XYI6345669o+C
         mx5Pwbbg3on3vgsKm3XCdkJ39bzuWi/BvZS5N6wsAlUKkIsRmkp4x8TDf8X9C2d51Jci
         HcAskwQIjkRJhx5y5G1hfdTtwwbXmnHw8bmFMEpWqqp3enxh9xXBUm9B9QAAC0dEiHYt
         L3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEuglZoVbCpgva7lbsQTwrTHHcn/4VlbIomJMgKXR3u5tOMnukYdS+pVYQ2gahziKy1ulZfsr/ipU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcRypmsSp6e5aOxgmRHf1TYJQuLeszkiQeV0zz0fJZZb9GcYD
	Y2zqxKqLfG3HvCMksIua+QizrMkW9/KBuJe3G6ed48v1HrsOprx+0oLh
X-Gm-Gg: ATEYQzwCoSuR/xsL3KJF/t5U068JDKZSOJGW1OruQG+gdn9K4VTGi2Cvc+Qe8okvcpL
	z1qy8BhzKrb3W3yoveUe51gPt8SrNY/Nq1jJPTdBtAqi0/ng+8CixOevj6H+usye31fT9A1VYdJ
	ebCtMStLeBf6rXVa07YsxBRXDjxZOWLyqgmmVZejbOVo6gKhK2xvW81NGDczxmrnPndgSejKXJg
	SD9K5BmDZMUp3qpl5Art4lBuRF0/r9g7XzhYKbN5oNXW3d+Gu/PHbcJR0qFPsTe1nO5RmWpiIZt
	BrTpVbG6/qNjOsfw5nbs61MUTBOsF07gzcNYdnMVCUiri4sAVAOWTSFzDPZW/oYkJgdL3UbuoJe
	qpPRClLegTZwVdPW2cs9vMf4m4ZYrl1LJHC63Hj62EmUKDRlNSzSWb6P/I3syUH/XwGIEDXxXXw
	mktE1qDQ2Y5pxv6JIFv20Sj8EDLnMGlP0hDfs+4u8iGqCljcPqX/lIAPShZ4RiCYZ+CH3ZSR5+
X-Received: by 2002:a5d:584f:0:b0:430:f985:a7b2 with SMTP id ffacd0b85a97d-4399de38167mr18364f8f.51.1772135019469;
        Thu, 26 Feb 2026 11:43:39 -0800 (PST)
Received: from ideapad (ip-095-222-030-189.um34.pools.vodafone-ip.de. [95.222.30.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70e8e8sm1532704f8f.10.2026.02.26.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:43:39 -0800 (PST)
Date: Thu, 26 Feb 2026 20:43:36 +0100
From: Alexander Gordeev <a.gordeev.box@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] dma: DMA slave device bringup tool
Message-ID: <aaCiaMi5HV3dJNv7@ideapad>
References: <20260221132248.17721-1-a.gordeev.box@gmail.com>
 <aZ4njFwdYsMLTcSa@lizhi-Precision-Tower-5810>
 <aZ7CwvrgPMkzMouW@vaman>
 <aZ9lL6-Q07PryHqN@ideapad>
 <aZ_xQ8jk049d1OgW@vaman>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ_xQ8jk049d1OgW@vaman>

On Thu, Feb 26, 2026 at 12:37:47PM +0530, Vinod Koul wrote:
> > I likely missing something, but how this differs from dmatest, which also
> > lacks any controller-specific setup?
> 
> slave dma needs a peripheral to test. For example a spi/i2c etc
> dmaengine in slave mode will not work untill unless there is some
> signalling for dmaengine from peripheral to push/pull data.

Well, the idea is to trigger xfers using custom out-of-band tooling.

> > I tested it on Avalon-MM Interface on Arria 10 FPGA and found it super-
> > useful - thus an attempt to share.
> 
> Which driver is that? Seems more like a memcpy masked as slave to me

Yes, one could say so. It transfers off-CPU memory in one of FPGA
implementations, which does not need any xfer setup.

When attached to a camera however the xfer is triggered using a private
tool that uses i2c - exactly as you guys noticed.

The dmaengine driver for Avalon-MM Interface is not upstreamed yet.

> ~Vinod

Thanks!
