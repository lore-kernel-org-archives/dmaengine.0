Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0A3749E8;
	Fri, 28 Aug 2026 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900518; cv=none; b=rxvn/aWAlK8Pmqjy3ver/NqNKngkmLuQk/eEjlfUPin2lR+pRLHKeUk0z7OyAUEwsZ5jW8bR7Mr6fAHlROiLAJf9DaLpB2p8zPeKKV/tPnVu3NEwRBQ1g12u8uaWa0veCz0XaWV0pC04UT/YELpcVWaUmut05foNwd6uBH52oIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900518; c=relaxed/simple;
	bh=4jXzHVfk6onz6MLCfIF4eccIsIjSibkxZeNK9blm0JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTYbCeUULmk+ZUMsFhId9JQN94FKUFG0acy5bF7Z+i9z0JowH90sp1vWOMQqd1b3Wo80kaYHikwdQus2Ecg392CQn3hBXOMylGJGiH0cQJWZEiiF7Xi+njtpSzq13QMr81KDzUerYhEUeXLWYk2EQZkYqdGCEBOYt6ETrnb7vwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzGj3+Nl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzGj3+Nl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787900516; x=1819436516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4jXzHVfk6onz6MLCfIF4eccIsIjSibkxZeNK9blm0JY=;
  b=QzGj3+NlDTeZIlT8QYzHXGMwv5RCobkLM8/4L6u+O1Te/tP6DwiC2fzD
   lwk0R0RjdsjMRjpnKrFtm0oQ/PybsidetwP1CXv4RQtFklseOMiB3qrwe
   A2g9WvKRuPe2mlQL7gE1gFNRFK1Ke+/bZt9nLgO5OeLYTSZteR9/qIkCH
   GVMOa8OtJeylEqOwdbl27y8fU+9XKUXOqgyBk6swV/p/hRMwdE112QoPd
   wKaeqFUbTeblPdLVc0YmpIrYNqILyXyJ9Nhrzm3kCy01nerI4MdH/fD/M
   1xezoVYeB/2q0yOvqxmXsNmpOIUEdqZTOqkdmjMLESFLHnhocau/OFP6S
   Q==;
X-CSE-ConnectionGUID: 60MtdSj+REmLi7qwwltTsg==
X-CSE-MsgGUID: sEbvQsqYTBOHXC5+7lN8LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88171220"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88171220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:01:56 -0700
X-CSE-ConnectionGUID: l00rTkhSSNGvUe2pX1CNyg==
X-CSE-MsgGUID: Bm5I9lqkTb6V16WhEy+GMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="266775124"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:01:53 -0700
Date: Fri, 28 Aug 2026 10:01:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Pandith N <pandith.n@intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds
 access
Message-ID: <apEyX4mTTMiSE4_0@ashevche-desk.local>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 08:48:27AM +0800, Jia Wang wrote:
> axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
> walk the hw_desc[] array of a single transaction. If multiple
> transactions have allocated LLIs, the channel count can exceed the
> transaction-local nr_hw_descs and make the DMA error path read past the
> end of hw_desc[].
> 
> Use the descriptor-local nr_hw_descs count when dumping LLIs.

...

>  {
> -	int count = atomic_read(&chan->descs_allocated);
>  	int i;
>  
> -	for (i = 0; i < count; i++)
> +	for (i = 0; i < desc_head->nr_hw_descs; i++)

While at it,

	for (unsigned int i = 0; i < desc_head->nr_hw_descs; i++)

and drop that 'int i;' as well.

>  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
>  }

-- 
With Best Regards,
Andy Shevchenko


