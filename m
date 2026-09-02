Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D8466B66
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346678; cv=none; b=mM9mtkKjbUreisTsbAirBQgFQBUivAd8TVmcDgoV/XX9N+WeSkCpKhbbktash9NLtbC7AgTErfYuvclTD4YRQgABDeq2qHJBaPjB4B1Da/2drCZwk2ubNaCWn5rWeYT27GB/N8ptYPoW7ebbhHK4zOVDaCMuliWXVh6xl6lx3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346678; c=relaxed/simple;
	bh=NiuCjnimhenpBlG/+JwZXgFLN4C3J4aGRkUket7TKng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUsehZy1zkYfCSlFFWoM8ViT7Ivt8HpYPG6WrrI1MUr4ns3R/uU6iQGL+AUyQwEWJShxSBL8g2lNbjGAQ2LoLhrHO4RUL9027aN6PElzDEoiiKbzmVMF6gOVgCcngKQS5RXLhfpfgpA24Cfd1v52TEoXpvspV+CizwKT/Um2X/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVtosYIo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVtosYIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788346676; x=1819882676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NiuCjnimhenpBlG/+JwZXgFLN4C3J4aGRkUket7TKng=;
  b=aVtosYIoBGATxFuV1tYmr4oF4+svcQsIReAC8LqrLwcKxsQWon2ylKnB
   wcyI6zs7lD09odChcdhqVhox5T9hZTGons31o+KcIOkXyiOcXls+JTSbr
   D9TMmBnpcNKB3o2GkXI91iOp37f5goW5XPxcKWDVX29bA/44jUeFmeCsj
   +OcxCfXE5JCgBCud4EEPptcGcIBS7KtupX5XJX/ZFEjoeGy6MClTwdALm
   scYjR+JyvF+qFC1u7oVOlREuDzFgDbIw1I9t/qfQe3+cqDWnndZ72cNq0
   vbDweF8WtDWchlIf+NWzkDk44gzv5hzcL5hSw8NC8sA9LCzESHeNr3NVh
   A==;
X-CSE-ConnectionGUID: o/nkaELRRjyugulEqY5Zhw==
X-CSE-MsgGUID: bZmBNf2jT9ORo6em+yuirw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="76349848"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="76349848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 03:57:56 -0700
X-CSE-ConnectionGUID: 6G1s1JXzQUiRfimQ+gX6vg==
X-CSE-MsgGUID: z6so+PrOR6OwqVi1xruOWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269938788"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2026 03:57:53 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1if8-000000002Re-34IO;
	Wed, 02 Sep 2026 10:57:50 +0000
Date: Wed, 2 Sep 2026 18:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Li Youhong <dayou5941@163.com>, Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Message-ID: <202609021848.VdrAqFe1-lkp@intel.com>
References: <20260902013016.3381788-1-dayou5941@163.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902013016.3381788-1-dayou5941@163.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v7.3-rc1 next-20260901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Youhong/dmaengine-dw-axi-dmac-convert-to-clk-bulk-APIs/20260902-093016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260902013016.3381788-1-dayou5941%40163.com
patch subject: [PATCH v3] dmaengine: dw-axi-dmac: convert to clk bulk APIs
config: parisc-randconfig-r071-20260902 (https://download.01.org/0day-ci/archive/20260902/202609021848.VdrAqFe1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021848.VdrAqFe1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021848.VdrAqFe1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: In function 'dw_remove':
>> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1638:2: warning: ignoring return value of 'clk_bulk_prepare_enable' declared with attribute 'warn_unused_result' [-Wunused-result]
    1638 |  clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1638 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

  1629	
  1630	static void dw_remove(struct platform_device *pdev)
  1631	{
  1632		struct axi_dma_chip *chip = platform_get_drvdata(pdev);
  1633		struct dw_axi_dma *dw = chip->dw;
  1634		struct axi_dma_chan *chan, *_chan;
  1635		u32 i;
  1636	
  1637		/* Enable clk before accessing to registers */
> 1638		clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
  1639		axi_dma_irq_disable(chip);
  1640		for (i = 0; i < dw->hdata->nr_channels; i++) {
  1641			axi_chan_disable(&chip->dw->chan[i]);
  1642			axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
  1643		}
  1644		axi_dma_disable(chip);
  1645	
  1646		pm_runtime_disable(chip->dev);
  1647		axi_dma_suspend(chip);
  1648	
  1649		for (i = 0; i < DMAC_MAX_CHANNELS; i++)
  1650			if (chip->irq[i] > 0)
  1651				devm_free_irq(chip->dev, chip->irq[i], chip);
  1652	
  1653		of_dma_controller_free(chip->dev->of_node);
  1654	
  1655		list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
  1656					 vc.chan.device_node) {
  1657			list_del(&chan->vc.chan.device_node);
  1658			tasklet_kill(&chan->vc.task);
  1659		}
  1660	}
  1661	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
