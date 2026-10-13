Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3257037267A;
	Tue, 13 Oct 2026 21:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926015; cv=none; b=L2KunHAwnzq9dmirZ7dJbyasPjlCQK5iygE+Nt62edzmQ6TBaMwmtMZCuOtnl5v3Ry1ZecpmsfCRZDX46hzKpy1zlobRFc/iWQFNAusSbwIq9imKD6zrYkrhbGD+ZIodFHNQy1E+Fd/t4Y4tWoUf8gJst6VfeKNKzisQohLhh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926015; c=relaxed/simple;
	bh=vb+/L5DrD8P4i5I3JmtjCZ64SxVzPyuxRci20FwgNwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhiTFj3l+cH6Ymv0AQ90NBFnJ5zkbwTUEaQ0Hjp0YMq6dQzjayyHSqlFKEz47gFD0K8I+E175PfseARivBXo6//HEuefkTuaX8HxkVI7J1olP9J2Fdr6ZbQGG4ahyeaAeV17kyLH3ZTZ6m5mDQmDFDDSvDhNZWEbu5gaK8VlsLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t0QIdCoq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t0QIdCoq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=I8Pm8HNepE95itWfgTl7gsXRQvYzWAvqH3Xb35WTFZ8=; b=t0QIdCoqO7+iId2qjBqXfbTsQ3
	Y3Dce4bEIGPb5Lg38EMUrBnz6qfT9tSyobJOijsJTa6xLdl1oBkY7xKWl72DpVZ/9TWZQugamS4DS
	DS61xGRd+DUSq4xUvqIuKlUO4dssuXOheNmqgsWxJ7V+Blhv7vf4nL9oOXuHLuwiUzUIQJPBROoJ0
	BqFpUbU6ODoFOsTmXTSxrV94rUEoDBhFYlHQ5d4DITyaOOL86A3PVJHFW7SRaifG/71psarx8penN
	ecTJ0v9s+JOZ8p9rGZfmWFKERt4CpP510TQbAX3iXHdJ6T00HGr19D90az/gM8wgTTr9e6oBnr/WL
	CBwwFiyQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjoJ-0000000E4Xt-3Jem;
	Tue, 13 Oct 2026 21:13:25 +0000
Message-ID: <127cc922-79e3-4e62-a5ba-67655caa2d56@infradead.org>
Date: Tue, 13 Oct 2026 14:13:21 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dmaengine: shdma: move shdma_chan and shdma_desc
 structs to private header
To: Frank.Li@oss.nxp.com, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM"
 <dmaengine@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/13/26 1:34 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move struct shdma_chan and struct shdma_desc from the public header
> include/linux/shdma-base.h into the driver-private header
> drivers/dma/sh/shdma.h. These structs are only used internally by the
> shdma driver and do not need to be exposed to external users.
> 
> Prepare to make struct dma_async_tx_descriptor private.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  drivers/dma/sh/shdma-base.c |  2 +-
>  drivers/dma/sh/shdma.h      | 80 +++++++++++++++++++++++++++++++++++++
>  include/linux/shdma-base.h  | 80 +------------------------------------
>  3 files changed, 83 insertions(+), 79 deletions(-)

-- 
~Randy
