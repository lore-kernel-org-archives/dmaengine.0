Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B539231842;
	Sat, 26 Sep 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433269; cv=none; b=ni+b5z4clCHic578+k8FUzvtZnLylpfx/ztcDJDixQNz3Y98azK3ZIo1TcOB3W+YwbovbzsRaoSxNAKxbDW2S4NTtY3u5s5o2sZzuxgD0NqFjyeClky0StSIH/5xUmOFA6p75TzpJV7eKgh5jjetkc+r04FM02uWWH9Rip2FZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433269; c=relaxed/simple;
	bh=sioWM7zU7orAq0yWu48tuqAz3z5o3yMX3T83TcxxaaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apxRDao+oCuMsjOAkVGkFyS4eJh5b4HvVB8NvpTPy9P1V3D5kgSroz080BcokQAYEKYbRAyIXub/Jg130J5wgPpaID6Q/DqeW3dsOLnIir0fv+5/ugoeoYbtnVeBtYKoKvfI/ylU3MSTopm0wL/uR3ivJSLPpBzQ+c+0X72eDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OIrF0ZoN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OIrF0ZoN"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1636B5;
	Sat, 26 Sep 2026 16:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790433149;
	bh=sioWM7zU7orAq0yWu48tuqAz3z5o3yMX3T83TcxxaaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIrF0ZoNTmP2Lh34cBXH+NEf2YlnDeyBWP/Y0GNoZpcBxs2nnT62H9yJ+rx7CmJNy
	 GPxUH9pFck4AZvcVIMnsYulGkG4gW6OTZ8QvUMogQAqsL/MKaLB0W2Dwy8q95I//TD
	 VGNszo1ZO0NmkV40TweHYccyULWmYDLulOK6yqmQ=
Date: Sat, 26 Sep 2026 17:34:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string
 terminator
Message-ID: <20260926143415.GA764757@killaraus.ideasonboard.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926121250.3258285-4-yaojiale02@163.com>

On Sat, Sep 26, 2026 at 08:12:50PM +0800, Jiale Yao wrote:
> xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
> strncpy_from_user() can fill it without a terminating NUL when the input
> has no NUL in the copied range. strsep() and strcasecmp() then read
> beyond the buffer.

strncpy() has long been considered unsafe, and has finally been removed
from the kernel in v7.2. A better fix would be to similarly replace
strncpy_from_user() with a safe equivalent.

> Allocate an extra byte and keep that byte zero-initialized, so the input
> copied remains unchanged and the buffer is always terminated.
> 
> Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..b61ef3062d84 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
>  	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
>  		return -EBUSY;
>  
> -	kern_buff = kzalloc(size, GFP_KERNEL);
> +	kern_buff = kzalloc(size + 1, GFP_KERNEL);
>  	if (!kern_buff)
>  		return -ENOMEM;
>  	kern_buff_start = kern_buff;

-- 
Regards,

Laurent Pinchart
