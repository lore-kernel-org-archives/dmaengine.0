Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB153DFC80;
	Tue,  6 Oct 2026 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275802; cv=none; b=PbNCMZ5TCt+QysM7lNU1hZ3oEHAhbX61xgFKDCxPrjlfd3C9h688eyy8IGSGC9jekUziFG80dIcjOavX8XyRbv0HGjB6UdiXQtKGbsvSI2D1LjY0kyfvtXqVr217badSRC+V56a8sa/IRRzQ79uLIvX/vEcTl6Yvpmql6S+ddls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275802; c=relaxed/simple;
	bh=PupcmyQUeWvSylKin/WcBYdcQ/AArjlFBA8oVCIIrkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/v8mYNDNIo+Rq6oXsvUYm8sid3VqeQDunnmReoy6ZgrUlGNKRRRvHFSz1nU3+2u0Voj2SC8UqES/wrYtxosdqXwEyNEr7xSsKWZ2PX/Ka/JABBEGFVrHs0HXeKJD8lv4eCGY8vsr4KA90jhjfvrCPdeCn519+yifWHi37/2Ae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNFRm4WG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNFRm4WG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4775E1F000FF;
	Tue,  6 Oct 2026 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791275799;
	bh=XSUhnVHk1iSh8qKx6XqfspZ6CJLCO+HxlannG1zfNFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNFRm4WGU3Ljf6w+E9W3s7kv2V708TZBWJTJiba0MxZ+XoEJniZu+F0AOjz6kYHID
	 A1jEDnyVRrw1+aRIzJZCDawomCbi963czx3lXwNbYQ3iL3Tm1SyrU3vY2xLTe5TJxT
	 jAT0chqxYAIpi1f+fBR/xaQYuueazrZsIrx4dDCbW/VmT10H5WbCENtzMABhnhcmoG
	 FSvRTCppF+iWsfKCLokMT4c1BW9GqvTWB3CgitQzlebIySI6fuRmUeqKgJzOSHC27x
	 3uUBRY9bYACOYRv0wEYNbLp6yoGZVafSjFm8avAy+OQyM9rKUsmuunpaxQrV+4Q2eM
	 LHmJY3qB/bbmw==
Date: Tue, 6 Oct 2026 10:36:37 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Message-ID: <asSzFW-ZJ16xhFnA@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com>
 <asOtEhjOMXc9SVNP@parshuram>
 <20261006060202.45817-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006060202.45817-1-hemanth.selam@gmail.com>

On 06-10-26, 11:32, Hemanth Selam wrote:
> On Mon, Oct 05, 2026 at 07:28:42PM +0530, Vinod Koul wrote:
> > This is bogus, pls drop these... If there are real typos pls fix those
> > instead! This is not a language book, it is code, upto should be just
> > fine!
> 
> Understood, dropping this one.
> 
> For what it is worth, one hunk in it was not an "upto" style change:
> drivers/dma/ppc4xx/xor.h has "contoller" where "controller" is meant.
> If you would still take that on its own I will send it as a separate
> one-line patch; otherwise I will leave it be.

Yes real typos are welcome. Pls split and send

-- 
~Vinod
