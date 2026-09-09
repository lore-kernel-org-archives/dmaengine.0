Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7914F55A5;
	Wed,  9 Sep 2026 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956795; cv=none; b=WdM8sZ4fa2buhjaaGavZbOPGHpU7pHLtEFs/rciR/ZzaivCxjHFD+SUSTsXD2jBK6DbqVxp4Le1IdUhXsulvxouovcx8rAnt9kVWg9qwS1xdi/w4bIOuq47yxk2zpFFYartHKkaLXHByEMqSSRE+09NXBf5ShU1V7wu3InQVHFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956795; c=relaxed/simple;
	bh=0TbyH+rh4akQYkM5LbNFbyY/gsn/1tw5vANT2Pt74Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsShXoQeJjVsikKJ9MB3Y7bZTxyukAJf+0s+I0zU+AJ/FqZUzzoOmvSF3UlDPac9SlXZNAlS2o3Xr+ockr+BwitXmMlhZ8ywesbTw84m3815r5KZ38bbD0dWSNPLv2LNqI2etfVmpyx3C0WfB0pQn7ELvzMqHNJUjUKqdS7MwlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0Ofhry1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0Ofhry1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1061F00A3A;
	Wed,  9 Sep 2026 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956794;
	bh=bJ2V5EWvwotfrF2ZEOvBFpXNDKLZNXu8G+Uh6SNV/Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e0Ofhry1Xd3do2WaMauv4+hyJpq1Q9slFclLImJanlG8X36fIY7Fh3U2P8VbpGz/D
	 XbW9mqdf/k1igD0dUr2faIKYzFH5KGUXm9CV9o3TPr1dWdDAuoa8rZu3qMni0iIsX3
	 lSTl5grWPets+t30kTTGUZUcytcU48xXIzewBpt62VDdpOUkqTzZWlB3u1hxJUUKRD
	 FsEBIDcOIkvbipd0Fyc7XJGCaecxtQ6cuG2ZLzRdpsVBpua+++ylq6U/XFgcRgnk5A
	 WohU45V01NIGqVnMbmgOHXwDXSIF6L0GFXF8GyNGljeVovFutO2HMERISlm18OytuV
	 2oscAy+deQv2A==
Date: Wed, 9 Sep 2026 17:56:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: at_hdmac: use devm APIs in at_dma_probe()
Message-ID: <aqFQdomiOg3h1dTM@parshuram>
References: <20260823050303.17725-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823050303.17725-1-rosenp@gmail.com>

On 22-08-26, 22:03, Rosen Penev wrote:
> Convert resource allocation and setup in probe() to use devm-managed APIs.
> Simplify the error handling path and remove explicit cleanup code.

Hey, this does not apply against current code, can you please rebase

-- 
~Vinod
