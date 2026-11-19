Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109774;
	b=rqtXcamH7l0UGAWDQl5/3xyGpLpdPY0UEn6rIiAUDbHsLF5+ADVNE5DQbTK5anjf9IBi
	 IGGZAHGYqxUTIHhiNOsV+BUSE4IBE128No4EOb6ScVd7uacHGDTZ+Zw36EU2CwohhTxST
	 NpQscLXKnvXcH2WQOMbXaVQ8VLbV8Ou1MBaLmCljLEdF2LCS9/NwG43lrBQQKLfKSfDsq
	 KpocQGvuGgyczmloa2CZnM0Bcuu8luT8ocGmWqwM7Lm9iGBd66QucmTlEKoqgV4D+SXTt
	 F/uIUJWCuJmuVPXjce+cSrxJcTzOVEhtYKdT3pou0Wmadi4JDk9e5NewkOlNG2kqJ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109774;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=7lPp38yQqapWLynzBVA4CU5EykvtBLNogGxWpp56dPo=;
	b=xb3jzM/IbTbr/jqdj3UTFlEujchwnIiDcNh0xnh0SM0tNlx6rZLa+98M4sasvtiS1z4D
	 Ybh4XUktPnU8im3Hys4KmJpEwLiNQ0549xxmwnCpObK7NgV1A9moDG9ETjz0nSSm4brMP
	 t4xoRAL2nAM88YuJS+onsZlDmgG08r6Cd3V/Ppa594Tyo1Sltqce3I18/1sLn4xq4pdiH
	 oxzjRLgGBsPN2KPWoed74eBzjpmAqP3EeiZbEO3HY9KiytmJo5jW6wqjDUJ2pi5eq2AEN
	 wcv+og2V2Xa5SP/BBO1CU8Abrl1S/phSNfvi81nJ/cbl0VarDTjgniJYo/Btku9U92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lcJ0pmwW;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACB606A320;
	Thu, 19 Nov 2026 17:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAACB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lcJ0pmwW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795109774; x=1826645774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o3BRdW+dhH4bRD+XBAD22OyQPZBgW+FL4Lkn+B4t/XA=;
  b=lcJ0pmwWV+rm9QbPhUTjNowq60hyYpadLatalTkCT5lcBWkBpCmcuzKE
   2CyyXHIrMlyj7ZPMiE4/fKQ4GTkhLZdPCfPJQnuzeTsSG/EtkBgcvq8fu
   v+lfWSRBaQbBbgPT7Gwfb+yhkWIC5avcIBCZcdRZjY3w9TEUUzHo2wi7P
   7kWlMqyMHx2mCwGO+o6XQjGhn2FhEv7xQW23oKgReAhCDdZnu4skVzn6E
   70eIvtjgYmkKJFB/vOlGddlnZjK2K9WgHjLYd9pEsvKm4ERTnpapwtMXi
   +MaEHR44s5iaXVpg1blIo7JTxGR/OiNxrhMsl0tMtyeNXc0CrYhei4NCO
   w==;
X-CSE-ConnectionGUID: 1V6chUxAShC6voNCnd+EkQ==
X-CSE-MsgGUID: TYmFrrw6STyxG5UhUCyVsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3869130"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3869130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:36:13 -0800
X-CSE-ConnectionGUID: IBi2LnLRTb2Dbbhdws001Q==
X-CSE-MsgGUID: AzJMLJM3R5W6DgJUYjiX8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10384610"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:36:11 -0800
Date: Thu, 19 Nov 2026 19:36:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: dmaengine: dw: Use devm_clk_get_optional_enabled() in dw_probe()
Message-ID: <av8ziPUCh4wZPyr6@ashevche-desk.local>
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
 <av8u_xgva8ORkzaC@ashevche-desk.local>
 <c5e756c6-2449-4079-a924-15a6bfdef848@web.de>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5e756c6-2449-4079-a924-15a6bfdef848@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 19, 2026 at 06:27:40PM +0100, Markus Elfring wrote:
> >> Reuse existing functionality from devm_clk_get_optional_enabled()
> >> instead of keeping duplicate source code.
> >>
> >> The source code was transformed by using the Coccinelle software.
> > 
> > Something is wrong with your tools or scripts. It now brings a regression.
> Would you like to extend background information?

You are not the first year in this project, find the answer yourself.
Hint: what devm_*() actually do and when?

> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-L699
> …
>  * devm_clk_get_optional_enabled - devm_clk_get_optional() +
>  *                                 clk_prepare_enable()
> …

-- 
With Best Regards,
Andy Shevchenko


