Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422205;
	b=2bMI2ZYsbh6FWidvVDZSm3DUN6rn4Rns5jFC8h6W52gjSJ3B5v+qO0sUomSLdShF92tv
	 zXDU6uoP5VLPifqXEROd++XeXBxkK65vHi1N0v+isFeIpddfhYscP+X41oXQLfzRYf69T
	 aXDpDLUjzAnbvHkjbgWMh7ogw9GrYAExTLwSRAtDEuJatguORVyWtli6elILl/BfdeGqB
	 aZikjY2uj1DeUWe/ZaUtnDQinoOZgK9/7OuEJE1tZyRGrr/CxTrArfteUSCZOhq8Qotw6
	 N+toqB57mIfod4+TKS119ZX02l7bAw/UVdKvqtmYiiZu5tQ+jL/1ISJnwYZ7wOinqSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422205;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=z+UaNPJX5505dCbZSDZnTfq/B37UFxlyuCT94x8JJm0=;
	b=P3dlnrsSsoVnYPQUeSIopNLEomJcEtjYOAfkzW9k7Ze5Xuj5YmOG4xLAzeEm4Fz7ZOUM
	 dNyI1hWuIkpVOvuFm8fZC8eHDEmpvJpl/6QcC4SPf4OF6x3r0Pp/2w6TK8/JBMcZ02OvB
	 Spf8v/bt+uKIpRbxeQvJGXqv1yow1smpBqIiBsL82fKOYygSRIG7GOCbaqydXT4FoFgTF
	 aRUWMqbbpYTK9UOxmEeaEoFgmxvGVFkojPAsDzigCGfL0A7UOkhv6lHJNK1Bqx/xipB+g
	 qcT5m7IeJR9Pg8IrkUiICkAZdSZ8qyPUr63uQZ4NmhHdNo0ReM6g7Gm40vvzJldCKbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HIXi08gN;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD687606A31A;
	Mon, 23 Nov 2026 08:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD687606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HIXi08gN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795422205; x=1826958205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4WwUmOOHvcoR/PgEdhp1ehfxdymzS9sZh81isA7SyI=;
  b=HIXi08gNacSrg4U7sBwbzwKc2SRzS1+Lyxs7AHlh/B9BM9cokxxkL9ve
   +4aRMTMRDqTbD96JYWgkQatAdW1FWLUlTK1bnbHGyKNnTwtxgR5AFwNdD
   XDPOnjKFcgPREHzZOYoI/g/cj2RhRVGIl9225J7i5T71oDTMKBiAUxL1H
   fa9KzK2pqoSuMnChgZ73EMvoe4JRj0m5N33EcElbSMka5IsgaoDGMOn6p
   nuhY+x10MmhjQwkubzYD5MW1F+K+Mc/rEPAturejLltWza8iXR4Z2ijHD
   OZ2xMWfmdj2r9qDz1T3a7MB9yonQUQPVk8V90oRKreELBhKuRslFH424O
   g==;
X-CSE-ConnectionGUID: 0BEr25Y8S/KloOeZf6DbTQ==
X-CSE-MsgGUID: dCxH3ZspQb2okEryGMxBEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4233108"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4233108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:23:24 -0800
X-CSE-ConnectionGUID: pRzJFGYQSZi4cO6/hILKQA==
X-CSE-MsgGUID: x1HI3+QqS+2/uJJsvD2nbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11013347"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:23:22 -0800
Date: Mon, 23 Nov 2026 10:23:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Frank Li <Frank.li@oss.nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v3] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Message-ID: <awP3997Cz3ERsthB@ashevche-desk.local>
References: <357f5490-8920-4199-a4ac-3f105cabbc78@web.de>
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
In-Reply-To: <357f5490-8920-4199-a4ac-3f105cabbc78@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 09:32:49AM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Nov 2026 09:16:47 +0100

Frank, FYI, the above From: header is one of the correct approaches to submit
the author. The Date: one is not wrong either (`git am` should swallow it).

> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> Clean up disable_unprepare() at error handling path and dw_remove().
> 
> This issue was detected by using the Coccinelle software.

-- 
With Best Regards,
Andy Shevchenko


