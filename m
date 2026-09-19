Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4253290B9;
	Sat, 19 Sep 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826230; cv=none; b=pFzOMQbXxv1MDG2E/a3zwVSEaZsqci6IsalOxmLUebF7BlFqgeaXnkwCpTAhVKo2H+658D+00Eq2JVcuyzp6x/RQiTnqmXr7knKXbUjsTQk80b34GNUO5BUYN7+mMFhMlYU+Ak1lppbiv67MnfPzjK9odQSU70hm4Vqz+phHdpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826230; c=relaxed/simple;
	bh=XNAAz2y1hQI1jpd/UD1AKmVlqfxjbi/3Ibab7fxF58U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxcLbWHmjlJtyqgZtfoEGGEIBT96DMpXfPT910KDmHwIgULhPEKImR0Pp0uEAb6oHxH1B8rEmo8JbhU+NqiIxGeYDxpQ+9KATArrCTvPj61CROnfL1slwItFd4ZbuVfskvLkaKQUO6Tq0zyL7MBwaw3k1N9CeCnz5ZFd1cNo86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lf4b02pp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lf4b02pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789826228; x=1821362228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XNAAz2y1hQI1jpd/UD1AKmVlqfxjbi/3Ibab7fxF58U=;
  b=lf4b02ppZXpsKF52EsAjfqxWz5FTkBDe60S3xB7zRPRIsmfa02owQfvO
   yIIY3SCwUbBMJxxbiHqSr61lXQ3S28c8D87OB3OBpvgNw8cXR5JNjifY0
   5IC3Fnu4Vn5OKz8DqIbDlEBnTPcu58t7D3n12R4RLKZ7dAIv81esH+U91
   2MODBi+HKg//QV9mwrrx5p4aayLcGuQis2mh86XryKKekXcUChM5GdeDk
   YlML10gqbg+QFKbkiig7GWnq+nLhe9LAkEpWL28EJPH+YW5HNcz8nCpph
   psAhnO004AtlrygWz3WKwCs4+4VTRm2bOZFQx/+eokGkiXWbtAdqwPWW6
   A==;
X-CSE-ConnectionGUID: d2ii0WABR3GNUcyXfov3Xw==
X-CSE-MsgGUID: MwlqoC8iS9u5Gz6Q1QyM+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="92856446"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="92856446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:57:07 -0700
X-CSE-ConnectionGUID: sOAvjBjpTLqXtcDgmqC3/Q==
X-CSE-MsgGUID: iJhVdkZTRsGRyU1tFZqjug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="276781262"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.50])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:56:55 -0700
Date: Sat, 19 Sep 2026 16:56:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 7/7] dmaengine: Remove deprecated
 dma_request_slave_channel()
Message-ID: <aq6UpdBvXV6qnj3G@ashevche-desk.local>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
 <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
 <aq17qvmxF6nwclkR@parshuram>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq17qvmxF6nwclkR@parshuram>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 18, 2026 at 11:28:02PM +0530, Vinod Koul wrote:
> On 18-09-26, 13:34, Andy Shevchenko wrote:
> > No more users.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I thought I had acked earlier one. Here is it again

This is strange. I used `b4 am` to collect tags, most likely it was an old
version (before you sent that email). I will anyway issue a v3 and I double
check that all new tags are added.

> Acked-by: Vinod Koul <vkoul@kernel.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


