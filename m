Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED5379C34;
	Thu,  9 Jul 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611037; cv=none; b=oI8adNeFq+r8NSFcThsDGjfU9i4UPNFk/1w/TocwZGeSRcyHMbE9mjwFNLUJAe6J5aZCsvNzM9DwXyHWgkjSdcq8zT0YtLfTSJ45tqi19MUObAfdx8DUN42DvTOYa1R8km8CtPLdVXXYd7CtYpAMZsz/3ZIENhGLqVORXHr66Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611037; c=relaxed/simple;
	bh=VPJXC8PlX+3g80UFKW55dUQBu5ucrvmJd2Q8qexzeMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RU120y4+rFgAE3RW/WrGm7m2MSsUsJ3NRnfny3ctiOX2y4LueqKq4WJDAtP5ctQZxTbwdU7+aRAk6FdSZHExJv4Qe480Mq6X1n11ZYKiqnICD4nF5DOix9I5Cy5tfmY0wPmLEBmJzaHY4NQIhGGd0vl5uDAoU5r0L/kT9FGASpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoigiLgx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoigiLgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783611035; x=1815147035;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VPJXC8PlX+3g80UFKW55dUQBu5ucrvmJd2Q8qexzeMs=;
  b=AoigiLgxRkAecTITFi4DVEWU8bGfoANRR8y7ty/TbCX7XLyuqh8VB1NF
   0JN4xg6yIz82Yh6HIKXS3x5ALuHg807pJF1lO80k8aRgXFQ40VCb8mL8m
   PO/txKZNagw8+6B2oB5+soS9pud5B/eWJ7YGntHUx8yxkPXel4cTnVXny
   swXD798h4pXBSRC2qN7qY/l60VdpxIBdnFuOC+ZBwOw00dvazzDVYELhH
   LzEo02rawzClHhpBi31hhrd6+ocLMgrHpgM3RhA0xq0nrNS+4ZChktX6r
   j+qxHqxPC4kT797EstJ2uXrhXFeWIEMMMspkfsvr0Sl9RRsIHta5GHfbG
   w==;
X-CSE-ConnectionGUID: 4hnUlQklSLimo3m8X3oCMA==
X-CSE-MsgGUID: KiVDP0boRNuJ3GrAGEei3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95810096"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95810096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 08:30:26 -0700
X-CSE-ConnectionGUID: qlINnsEJTwGOSP/wT4n9Kw==
X-CSE-MsgGUID: Ay1mQhCFSg+cEjAddHug1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254123962"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO [10.125.111.142]) ([10.125.111.142])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 08:30:25 -0700
Message-ID: <097a48cd-7436-4499-886a-d8f313ec56f6@intel.com>
Date: Thu, 9 Jul 2026 08:30:24 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: idxd: Remove channel from list on registration
 failure
To: Ruoyu Wang <ruoyuw560@gmail.com>, vkoul@kernel.org
Cc: ashok.raj@intel.com, fenghua.yu@intel.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260709062303.4167624-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260709062303.4167624-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/8/26 11:23 PM, Ruoyu Wang wrote:
> idxd_register_dma_channel() links the channel before registering it.
> If dma_async_device_channel_register() fails after that, the error path
> frees idxd_chan while chan->device_node remains on dma->channels.
> 
> The DMA device can therefore retain a channel list entry that points into
> freed idxd_chan memory. Remove the channel from dma->channels before
> freeing idxd_chan on the registration failure path, matching the driver's
> normal unregister path.
> 
> A static analysis checker reported the stale list entry, and manual
> source review confirmed the registration failure path.
> 
> Fixes: 397862855619 ("dmaengine: idxd: fix dma device lifetime")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/dma/idxd/dma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 9937b671f6376..f2c03f3cf1925 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -289,6 +289,7 @@ static int idxd_register_dma_channel(struct idxd_wq *wq)
>  
>  	rc = dma_async_device_channel_register(dma, chan, NULL);
>  	if (rc < 0) {
> +		list_del(&chan->device_node);
>  		kfree(idxd_chan);
>  		return rc;
>  	}

