Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E995166C0;
	Mon, 19 Oct 2026 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419507; cv=none; b=p5fwVrAULZssgjiWkO5Ok96AyZvinC4jt3KlYfa8Jn42zr5mT9gB/M9wFHcg7HQbP9DlaDe/HQsElFSCcgCVA5wBIXYQp7tSQ3WvjHxqJYgpcqFjT+hCoMJJRsPZPEZ364zu8WBeKqniFsnHDndfUPuaM3Cy/4ANOmDXmJkhPRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419507; c=relaxed/simple;
	bh=x7ERYfld8j9PNMFNVnjueJRW1ipvlVPBBuwletYkG48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/QF5HKqJvv1NDS7eJWfKui7nIEzv9jmA3jkv4m8T/+keplOK+xoFrY4UXVotMU67dgZzjSB+QNg+p6SzPSqlXsjdJHOGirOp2XTAyo2I0O843UC/6AglhBL60iuBTJraC5vclppru+XIlGCMkVc18wg6a58LRBS5PZiZ1LObaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buxnWFAC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buxnWFAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792419506; x=1823955506;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x7ERYfld8j9PNMFNVnjueJRW1ipvlVPBBuwletYkG48=;
  b=buxnWFACvRxRLUklKy0al8RKH+SjBcdgVClwbfddc/pDgpVQnye0ICce
   1shjA+cUTfwNZmNWm+2rnmtvQ7bquvDsJuQgXSCr5qYdTTzZK2wk7fal7
   EcWmbKFP1faS4iO/Dn28q4mynoQ50WNr1P+FjleNv/INpnVhSOUr7mDtA
   lJ9N29LhTI6s2o1X+SQDfTNPMQW/c9z9GUT+r+ERLCJjPTqP6NFQny1uU
   1vrEyrcW5BOZAXs0ie7Q/TFqIrnIs8t9cBIsPz+7y0h4vs0rri7vAzXTc
   PXVrKEYIHjlTAoGcU+T4MwLEgGKDQQxmrtE6vv64/TloWswhF29qIZvQv
   g==;
X-CSE-ConnectionGUID: lmTZPZwuSk6mkyPWwieaHg==
X-CSE-MsgGUID: /HkmItsuSw2B6JXHg7SDCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1103952"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1103952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 07:18:26 -0700
X-CSE-ConnectionGUID: KpsHNtnmTY2+igOeHCUjdw==
X-CSE-MsgGUID: wy+c+LG8SvuKBqJYXD0g2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2521119"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [10.125.111.28]) ([10.125.111.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 07:18:25 -0700
Message-ID: <fd4682a7-79f6-484d-809e-504a8fecd575@intel.com>
Date: Mon, 19 Oct 2026 07:18:23 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dmaengine: ioat: possible use-after-free on probe failure
To: LI xiao <lixiao0@hdu.edu.cn>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <AMgApAB7LHAmvchq*LUlC4qv.1.1792418652126.Hmail.252270051@hdu.edu.cn>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <AMgApAB7LHAmvchq*LUlC4qv.1.1792418652126.Hmail.252270051@hdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 7:04 AM, LI xiao wrote:
> Hello,
> 
> I found a possible IRQ lifetime race in the Intel I/OAT DMA driver.
> 
> I reviewed the relevant code in Linux v7.3 at commit c03c1a14507dfaf8b856c2608f9ac216021fc222. In drivers/dma/ioat/init.c, ioat_dma_setup_interrupts() registers IRQ handlers using devm_request_irq(). In MSI-X mode, the handler receives an ioatdma_chan pointer, while in MSI/INTx mode, the handler receives an ioatdma_device pointer.
> 
> If initialization fails after the IRQ handlers have been registered, the err_disable_interrupts path disables device-side interrupts and returns. ioat_pci_probe() then frees the channel objects referenced by device->idx[] and the device itself before returning an error. Since managed IRQ cleanup occurs after the probe callback returns, an IRQ handler that is still running could access a freed channel or device object before the corresponding IRQ is released.
> 
> I tested the suspected lifetime ordering using a test-only kernel module in a mainline v7.3 KASAN-enabled QEMU guest. A test kthread retained a pointer to a simulated device object and waited while the cleanup path disabled simulated interrupts and freed the device. After the kthread resumed and accessed the retained pointer, KASAN reported:
> 
> BUG: KASAN: slab-use-after-free in ioat_irq_handler_repro+0x68/0x70 [ioat_probe_race_repro]
> Read of size 8 at addr ff110001025c0388 by task ioat-irq-test/77
> 
> This is a controlled simulation of the lifetime ordering, not a reproduction through the actual I/OAT driver or hardware. The reported access occurred in the test module's handler, not the driver's actual IRQ handler. QEMU 6.2 does not provide an I/OAT device model, so I could not exercise the real probe-failure path.
> 
> Could you please assess whether this is a bug?
> 
> Best regards,
> LI Xiao

Thank you for the analysis. However given how old this hardware and driver is and there haven't been a field report on this issue, I won't spend the time and analyze this. Patches are welcome if you can reproduce it on hardware. 
