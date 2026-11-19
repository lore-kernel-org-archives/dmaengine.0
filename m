Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108613;
	b=eQ5/tJIwN714dya3rwNAd00bjdDKnBNCMbkfJRDt8v8mSzQr+Nmx8uDI1Krd4TvoVhrN
	 kVQrdG7r08uQBEIwJw2J1e/WRkN1bDO2mM75zp0UI7iA1aThDI+59msMhAz9uxGJhW2ky
	 J30o7F5Mg/gSAhU9Eb2WRAo7cfly6Q9OViDsoWjjqyJS1oHNEZPtXQM62M1R63bo2qm3z
	 2pN3zFXrMkKulR5bFk8MNapqKborEcmIwzFaESQMAsjksb9saBRKVoZnUijPulnuT0J89
	 dST7Dcug8h0ck57W8+c35KosPpPpmQWOgQTXix/OiYiN7XgbVfBKxaQdyLoMQg/op4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108613;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=XcVmZEc6Gq4OuB1zdcpG9oMjnMlKRblSRHFagTy/UIw=;
	b=mSpUeKD1StnPad/rwCY+1jUMXS89+EXBG4rsUUXtev2NGsr0f1aLsazKnyEa3Kp65PUj
	 Vf6/9G0eKBKeWyoOTF7/EEcxS/Z8bScxM7lHtCeQ2PGMcNifV8W5IivazHRvKtHcHq5vx
	 BAw/u9aK7CZAmvYHctt9eWOBFVKlfonNd2FK2/gcuB5HeR17YwAoy1Wv13xNf26pSi7EA
	 JalAmbzSayvwF0qZDi05tX5WGsV9biGDrNWZH4fm4ZyR+4pFDvDBsE4jimdek5bMwzCfp
	 35akT4t63zHTUwnB+lRAtZAiAIhybj1b3lXY2aqjjHc9gC0bFmRGV+EIZYlPy6H0o/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtXhJLg6;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E1B606A320;
	Thu, 19 Nov 2026 17:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E1B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtXhJLg6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108613; x=1826644613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fVcb3RZMdA9jKDOf4VjTcM3wKpIJdMv+Ni1IbOrDSlE=;
  b=TtXhJLg6Ade71IfJDLuxKm2Fp3iQv9hzYHZlClXSE7jYydXf9gE3wtRF
   3c23dVMbkCLm/GCfb6ejGrHH7SvL44Y7NYTW8h3zp7O9aWkQP5TSwIs9T
   PhUWfFId5lTOHNASfQtPW9BavXuvlPoMkXJ77Hzh6KkU4lH4P1crb3n8B
   QTA/UUgO/pN1NWrtTuEZNwSu/P5eElgi3a+/698x1Rp2b84NZvsHQ/fBs
   1iT68dthHhaw3ltO5hUi+ePLmMpsSxyU2mKq8ISVm9qr8NOl+cjiEYLnA
   M0n3Bfin3l05UTIF1S/vQZT0IfEsK9pWrTTb2iGItuNrUM2HHyf1TKund
   A==;
X-CSE-ConnectionGUID: l2C+BrHKSgyipUTKHZfX2w==
X-CSE-MsgGUID: PjFUl6/RTMa5zbiuBXWTqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4067672"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4067672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:16:52 -0800
X-CSE-ConnectionGUID: 8HAYrekaRM2uIdRCNKPf/g==
X-CSE-MsgGUID: 0I16itP2TV+5LiiiVWQa6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10514091"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:16:50 -0800
Date: Thu, 19 Nov 2026 19:16:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Message-ID: <av8u_xgva8ORkzaC@ashevche-desk.local>
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 19, 2026 at 05:06:55PM +0100, Markus Elfring wrote:
> 
> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.

Something is wrong with your tools or scripts. It now brings a regression.

-- 
With Best Regards,
Andy Shevchenko


