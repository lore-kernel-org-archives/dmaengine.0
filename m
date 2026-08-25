Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0124CE54B;
	Tue, 25 Aug 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669365; cv=none; b=AJCp3dc6HdE/ovVYi6Zz8LQwIANpo9b9IH0bjx1JsLcHMjGxRrQ4lCbBc0CTvgxG5+jMGVBKAZfHbKU6Wi88UiiKjS2Yyo1hQb2TBYE8M+S95VcBBFuNwdGV6rAioL8tB4Bp8Xxcc44+2KgP7JB6HoImPYVtdTrQeR75EAfhTz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669365; c=relaxed/simple;
	bh=cMQFiNoNsc+e5bMD2TUqNaBnM6xNs/OhHdhbqhUlALU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMpFOGY9KbF4YmBac/s2mXt5aovYEdafEuw3CNkBkqLpsC5KplUDRJf4WU56a/H6burviV90P8lI6FOVh4h+7Rh2bxtyhulker3KuyksaC/2bplCyjEMqAutGYj6tWEvnyA2jZOgF1j+H6WD7Q9VP4yzw3TCR6LfAY3ZFfR+WMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEhSC2RN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEhSC2RN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787669363; x=1819205363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cMQFiNoNsc+e5bMD2TUqNaBnM6xNs/OhHdhbqhUlALU=;
  b=eEhSC2RNwDHoLOq8NYBDrrj7J82W7cBrP5eCBG6n+S7KetQjD4Z7RkE5
   g6+WVCz8vzohFFmokuH2sz9JerJIH/p2U5j8tSY0wqP+8MnIHBgO0XcD2
   6WECHTfqrhVdJXxH/cU0Oa7mGGJLM8PB9Ta/riIvTMk0YJOo1UWMXzJyO
   aYJhPtGkrynomYv3wO3QdXt0XLrmYEFHNugfFDrAAEi5vetBcTdt3Fv/y
   /Fvm71EgMG+V3dZiiY1rFGEqDjtXhlS10koeyORk+Px/jlA00yVSNoabm
   ylrbtzhsl4x/B6w5FaZZ3durPUwsYy28GCqA0eKQT8h6wkBiIVbMSJOUd
   g==;
X-CSE-ConnectionGUID: ht7GVay5QZGrw+NgnSKODg==
X-CSE-MsgGUID: L0f+8ypsTFe2TrSezerLqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113673435"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="113673435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 07:49:22 -0700
X-CSE-ConnectionGUID: 5c76Y/jwQdOyVpVCI++JvQ==
X-CSE-MsgGUID: oM/qhDRHTQqig1nJgWPbsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="270777621"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.109.2]) ([10.125.109.2])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 07:49:22 -0700
Message-ID: <90003b42-543c-483e-a490-e9832bf7a14d@intel.com>
Date: Tue, 25 Aug 2026 07:49:20 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ioatdma: Fix NULL pointer dereference in
 ioat_alloc_chan_resources()
To: Yang Zi <2959243019@qq.com>, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, linux-kernel@vger.kernel.org
References: <tencent_629A33A5198254C3EC75AF7CB18050796F07@qq.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <tencent_629A33A5198254C3EC75AF7CB18050796F07@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/25/26 2:14 AM, Yang Zi wrote:
> ioat_alloc_chan_resources() performs MMIO accesses using
> ioat_chan->reg_base without validating that the device's BAR mapping
> (ioat_chan->ioat_dma->reg_base) is valid.  If the PCI BAR is not
> properly mapped, reg_base is NULL and the channel's reg_base is computed
> as NULL plus a small channel offset, so the first writew() touches an
> address near NULL and faults.
> 
> KASAN/Oops report:
> 
>     BUG: kernel NULL pointer dereference, address: 0000000000000181
>     #PF: supervisor write access in kernel mode
>     #PF: error_code(0x0002) - not-present page
>     RIP: 0010:ioat_alloc_chan_resources+0x40b/0x1ff0 [drivers/dma/ioat/init.c:679]
> 
> Validate the MMIO base before any register access and return -ENODEV if
> it is not mapped.
> 
> Signed-off-by: Yang Zi <2959243019@qq.com>

NAK. This not reachable code. By the time ioat_alloc_chan_resources() gets called, reg_base would never be NULL. If iomap has failed, it would've failed long before this. The pci probe would've failed and the driver would not have loaded.

DJ


> ---
>  drivers/dma/ioat/init.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index 737496391109..80dc8f36c346 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -677,6 +677,10 @@ static int ioat_alloc_chan_resources(struct dma_chan *c)
>      if (ioat_chan->ring)
>          return 1 << ioat_chan->alloc_order;
>  
> +    /* Validate the MMIO base before any register access. */
> +    if (!ioat_chan->ioat_dma->reg_base)
> +        return -ENODEV;
> +
>      /* Setup register to interrupt and write completion status on error */
>      writew(IOAT_CHANCTRL_RUN, ioat_chan->reg_base + IOAT_CHANCTRL_OFFSET);
>  
> 

