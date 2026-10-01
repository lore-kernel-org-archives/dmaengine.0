Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB45374A16;
	Thu,  1 Oct 2026 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888427; cv=none; b=BULLLcCDV2GOLWoLXuMeE2KvX5vorbMrDt/noc66KqaqIFT44eDr60x6Z0I6ZbetY9+UstuQbIPgs+zGT+EX84KE5Zhwm94tTdUqFMsVBeyDVk8B/PQedS/Ck+IZBPY889uiQXNbPNc/u4aiJubfO2OyYvAaviZK2E6+Q+AwEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888427; c=relaxed/simple;
	bh=xH0u8C5iqbgx1k8NmWvyHlZXUFkitoJMZ2/QXJho17E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGm08LgWM3GxFVl5RZX7FDY6rX0PlmgFm91p/BoK2G71ueT/RP39x1qPvmL7TPZdEPGhjNQm5quDzqfFXUDmEgBwLSz0fj0QjJ5JBnnMgyw+ZseVlQmOBvlBinYLsE4GaReT6MvgOeTIUFhuCqIcdJnR34DFx5by3JS+zmB603M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B/bxI5qh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/bxI5qh"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78532593;
	Thu,  1 Oct 2026 22:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790888309;
	bh=xH0u8C5iqbgx1k8NmWvyHlZXUFkitoJMZ2/QXJho17E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/bxI5qhZCm5GHy3VGESwHbAINU5xKrCtPL2g9PAw8WMitKPJ+2pqD9F7Ur7KUUpM
	 bPYXUCtEFj8jXF2JeRoEVcNOTpk5jZy5eXHqO4R0GlZjokEMmGtcWzgsOpLMmlb54j
	 tG1QqPC9iTqjkxHtXQ8lcVMSG/BOsn+QSzNRZ3ck=
Date: Fri, 2 Oct 2026 00:00:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Jiale Yao <yaojiale02@163.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string
 terminator
Message-ID: <20261001210021.GQ944070@killaraus.ideasonboard.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
 <20260926143415.GA764757@killaraus.ideasonboard.com>
 <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>

On Thu, Oct 01, 2026 at 04:50:23PM -0400, Frank Li wrote:
> On Sat, Sep 26, 2026 at 05:34:15PM +0300, Laurent Pinchart wrote:
> > On Sat, Sep 26, 2026 at 08:12:50PM +0800, Jiale Yao wrote:
> > > xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
> > > strncpy_from_user() can fill it without a terminating NUL when the input
> > > has no NUL in the copied range. strsep() and strcasecmp() then read
> > > beyond the buffer.
> >
> > strncpy() has long been considered unsafe, and has finally been removed
> > from the kernel in v7.2. A better fix would be to similarly replace
> > strncpy_from_user() with a safe equivalent.
> 
> Do you means use strndup_user()?

I was thinking about adding a strscpy_user(), but a dup version could
possibly be interesting too if there are enough users that call
k[zm]alloc + strncpy_from_user.

> > > Allocate an extra byte and keep that byte zero-initialized, so the input
> > > copied remains unchanged and the buffer is always terminated.
> > >
> > > Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> > > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> > > ---
> > >  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> > > index d9a3542c4531..b61ef3062d84 100644
> > > --- a/drivers/dma/xilinx/xilinx_dpdma.c
> > > +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> > > @@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
> > >  	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
> > >  		return -EBUSY;
> > >
> > > -	kern_buff = kzalloc(size, GFP_KERNEL);
> > > +	kern_buff = kzalloc(size + 1, GFP_KERNEL);
> > >  	if (!kern_buff)
> > >  		return -ENOMEM;
> > >  	kern_buff_start = kern_buff;

-- 
Regards,

Laurent Pinchart
