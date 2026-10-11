Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B02036194E
	for <dmaengine@vger.kernel.org>; Sun, 11 Oct 2026 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750717; cv=none; b=sH5j3W+W+O+Ow3yd8rtLJAUrExSPiPP3D6XC33CcrXG12raXomzmuXIiNViYnlT5tOHEG1TcauyQu29dxvaiRg477Dl28/SZlKAMVCsPuK4LZDGN8xjlbmV7Z6j1H2Jt5dC8+frXwruth9Z3CWy89GphmyZcQ3QNhPgQ0H0GQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750717; c=relaxed/simple;
	bh=ttUqluAHAXw5HAusFmhqZ6/qmG56Q1g5evZls6AtjxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdqVDM0ulLkHboHVLShqIL6aHa/F/2dg0p6AtRf/RYivQNFqQCIRY3em80JRe8KbHxQ+Xtp7jE6xFW3MfgTZXPy71gQKWN1BphTT7PRVjVb/JGx/bhy9uRCBm3XNXNfwUItpB+R9b4edBcyXwur5xtJ4V1UDyzQwImTWWGLqrus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNGJbU9n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNGJbU9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F5A1F0089B;
	Sun, 11 Oct 2026 20:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750715;
	bh=pfn5T3xyjLfiHZCqBdcYDCljALXgFByZPhzM0P6+7TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dNGJbU9nkwAZGpGxZjF6JjMWTg28ckARc3QMP9K2TaInB+QLAPzeiNlg8YmID5/we
	 I0KhhQhwHj2t8t3L+BFBPpGOfORhJ2NX5xCsGOYDgw6/pX2n0y8CMHEPoylQ+I2Yit
	 VukEueqnpWWRDkCOMCteBHc3B9pIcX7zRhPlUOJjujKsmmOB13GYxsG6bgyg0ilT+9
	 upPaUz8kAxPfUI1PgudBzVNqHWx1Eco71O8mtXvf9T7sWlaa2ut5KOoBmh6wHXK84k
	 ORMnOLXeslydMK0ppYyIEuxMS6AUM/jXnIOe46GMz8QKa9G4+zjatW5H722qkEbH3Y
	 Iv8XU933/PQoA==
Date: Sun, 11 Oct 2026 21:31:52 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Koichiro Den <den@valinux.co.jp>
Subject: Re: [PATCH] docs: dmaengine: clarify ordering rules around cookie
 completion
Message-ID: <asvyOKycracKE0jC@parshuram>
References: <20261009093745.539924-1-vkoul@kernel.org>
 <ask7AujGmE7Ks6Xb@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ask7AujGmE7Ks6Xb@SMW015318>

On 09-10-26, 14:05, Frank Li wrote:
> On Fri, Oct 09, 2026 at 11:37:44AM +0200, Vinod Koul wrote:
> > Sashiko pointed in [1] about the cookie completion order. It is good to
> > Document that for ensuring that dma buffer is flushed and no stale data
> > is seeing by consumer, we need to make sure such action is taken before
> > drivers invoke dma cookie completion.
> >
> > [1]: https://lore.kernel.org/r/20260917072507.5BDB61F000FF@smtp.kernel.org
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  Documentation/driver-api/dmaengine/provider.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> > index 2897ade67b39..1bcbce705659 100644
> > --- a/Documentation/driver-api/dmaengine/provider.rst
> > +++ b/Documentation/driver-api/dmaengine/provider.rst
> > @@ -557,6 +557,11 @@ dma_cookie_t
> >  - Not really relevant any more since the introduction of ``virt-dma``
> >    that abstracts it away.
> >
> > +- dmaengine drivers need to ensure buffers are flushed before invoking
> > +  vchan_cookie_complete() or dma_cookie_complete(). This would imply a call
> > +  to unmapping buffers or any such architcure calls to ensure caller seeing
> 
> Sashiko report a typo architcure

Yeah looks like my spell checker didnt caught it, I will apply now with
that fixed

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > +  buffers are flushed is done before invoking these calls.
> > +
> >  dma_vec
> >
> >  - A small structure that contains a DMA address and length.
> > --
> > 2.53.0
> >

-- 
~Vinod
