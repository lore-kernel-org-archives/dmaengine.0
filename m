Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79DA215161
	for <dmaengine@vger.kernel.org>; Sat, 17 Oct 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231046; cv=none; b=B082DNtscEvDtAJ7tmvdKIhFgSjzFd+FweqqQFCyI/M358iSkdSyD+UW0GVVCJKQPkq4qAn4cowVHEBfucC8pwzXy7cHbIO+R4oydU+f1Q6HF67GP8Ms4TUuOogGmmGZPZlcNuFDw0UXgkLasSmtkuRjPZ5l0KZmgdiIiJp2N7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231046; c=relaxed/simple;
	bh=vELMO02HhRogd/0zYYio/uR/r5cac3/bBCdxYFXFbak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8DC2e0RwZL5HcVmYEMJrBFd2xp7Igxtmy/vmQXrRTESSmLYJ4GmwgTpFibN19kUYw18zg/urmZ9+uPBxYX57bu8x1EoUOpb0P1atYf47HYJGytPnsGMZTp5t+6iFfbRAfPyAjw6DOYXhYzZRb7jQVCZJpyNwiG9BqqIEtkDbWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZuaUu4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZuaUu4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE8D1F000C4;
	Sat, 17 Oct 2026 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792231045;
	bh=m3Fon1BPVNySA2cP/H8bZCoF5CT4ont1XGr76mePwyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RZuaUu4uZ3DAKFWEZHdcev24npS98VeDOTtCs57T2U8SqUyKUxE0hb6S551/zB+PI
	 SzSStWsMt7Rzeho9QEvktPmDkk0CyDT/tH16bdDJSKOVSNJ54L1RP5mgklzSNNr2fw
	 lJSliQqHtFRMw48GApy64ztpr5nQbptmZ1E6Q9X6RE8FfIl1VU5ZTFeI2FNK118dMu
	 digui4t8I0ANzjKTbpgvaC+Nj8jnP4K/aS9c/sxlWw8GM78+qbdyfhoXyYQ1L+kNeb
	 y3LdXC0ZXKvFzhokHUwyxPB4X3rPmRz8jWlJ7Ed5/ip+wI5O/UiB46Xe74lpy//3Om
	 ZmdH71LCii7ew==
Date: Sat, 17 Oct 2026 10:57:27 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: dmaengine@vger.kernel.org,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH 0/8] dmaengine: unmap descriptor before completing cookie
Message-ID: <atNGh7mCjGJ9rgPt@parshuram>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <asy5hLkzZARvkKyD@shikoro>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asy5hLkzZARvkKyD@shikoro>

On 12-10-26, 12:42, Wolfram Sang wrote:
> 
> > We found out that we need to unmap descriptors before completing a
> > cookie [1]. Fix the drivers for which this is a no-brainer and just
> > switches those two function calls.
> 
> Okay, according to Sashiko, patches 1+5+6+7 are no no-brainers but need
> a deeper analysis which I am not able to provide.
> 
> So, we could drop this series entirely because it seems more trustworthy
> to let people with actual hardware fix these issues. Maybe a FIXME could
> be added instead to these drivers.
> 
> Or, we can apply at least patches 2+3+4+8 where Sashiko found no issues.
> 
> I tend to use the first option but am open to whatever maintainers think
> about it.

yeah lets get some testing into these. I would hope people who care
about these would test this out... FIXME is fine too

Thanks
-- 
~Vinod
