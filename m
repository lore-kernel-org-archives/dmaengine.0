Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311324DA9BE
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562516; cv=none; b=KLhXXaFfJJnM96pbM0/H60LPDY3p4lUhN8zYvzdTcTH/DFUGsio4e6W4xkTMKDaChETeyQa0UPRhc/l4Fd2U+B8rkmsLwgbHaenLDcPT5ZmRysCOh6PvMfVGWCiBMcpB/EEqsoIsyV+enqQDpPoP/OVITw2LocM08jDbEmgqhBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562516; c=relaxed/simple;
	bh=wgIX1S24h2P4HPzSMc4RGGAwTHKl50S9ibDTi5MtLho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcQu/f/5GyXBKCc2wy5Xa69lowZnZrtFKpnmFjpnDAdsOp8RV8hKpMc2sxSiguFzE4SbWktzD5qeEK3av/1HHT8xNGdKElmBCtBrHOyL0HNYGDYvcmQn8i2eYvBBisjk2r9f4Fcdg0BJW0r2jCkicVgBUTwb2tY7sJQ0sVthvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxS4oKHS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxS4oKHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791562516; x=1823098516;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wgIX1S24h2P4HPzSMc4RGGAwTHKl50S9ibDTi5MtLho=;
  b=KxS4oKHSHgybQkGFzy52yF457r/jjEtFlXEsDtD3/W08lBdOvfnly1bg
   WxFKnCV51k9iokkQ7F85JohEj0a2Pm3BD4xv4vZoF9JLTgISTsYni7dhz
   etCHTwkWlEwHrzyAK6u0VRy0SVAuNTyJIkWg0+xO5x9sEijiARTy49CrK
   hWlyiMf+DZ0M5Thd/qppWz8J3qAWya+IhCoe7CL/xqf9Pu7aeF+nMRxk4
   8PBPwQuRRr8x6TpyXx9MLya3PeST5NSHhFcCZUMQy7DxDL3pxac82r3vE
   vMl3I3lzOkZSg/9BP0GUSW7KUc2KIlMmhGLlLV0FMG2OLkrm9czOa2Cod
   w==;
X-CSE-ConnectionGUID: UeUye9UVTHeZimGO+wxn5w==
X-CSE-MsgGUID: WrJxqXvTQGydalsTtQA81w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="257346"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="257346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 09:15:15 -0700
X-CSE-ConnectionGUID: wuXNGfW2RwmGylp5V1hV+w==
X-CSE-MsgGUID: p47TUs46RpiCkD+bqmMCag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="662020"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.109.99]) ([10.125.109.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 09:15:14 -0700
Message-ID: <13208c9b-cf71-4b1e-ae7e-d43dcc47ee27@intel.com>
Date: Fri, 9 Oct 2026 09:15:12 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dmaengine: clarify ordering rules around cookie
 completion
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Koichiro Den <den@valinux.co.jp>
References: <20261009093745.539924-1-vkoul@kernel.org>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261009093745.539924-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/26 2:37 AM, Vinod Koul wrote:
> Sashiko pointed in [1] about the cookie completion order. It is good to
> Document that for ensuring that dma buffer is flushed and no stale data
> is seeing by consumer, we need to make sure such action is taken before
> drivers invoke dma cookie completion.
> 
> [1]: https://lore.kernel.org/r/20260917072507.5BDB61F000FF@smtp.kernel.org
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  Documentation/driver-api/dmaengine/provider.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index 2897ade67b39..1bcbce705659 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -557,6 +557,11 @@ dma_cookie_t
>  - Not really relevant any more since the introduction of ``virt-dma``
>    that abstracts it away.
>  
> +- dmaengine drivers need to ensure buffers are flushed before invoking
> +  vchan_cookie_complete() or dma_cookie_complete(). This would imply a call
> +  to unmapping buffers or any such architcure calls to ensure caller seeing
> +  buffers are flushed is done before invoking these calls.
> +
>  dma_vec
>  
>  - A small structure that contains a DMA address and length.

