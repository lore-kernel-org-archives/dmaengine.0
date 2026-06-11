Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5852D8DC2;
	Thu, 11 Jun 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166654; cv=none; b=PGkaeS+FCHecHST5Q1x0PXoEtOO5kguHi8dBfklJtRvMmIHJeSLvzoJRHNJz7a+payfLyDeDWzJrNn+kGaO8JAdO0lZ2xF/V02Neufp/rrhqUFAOQLVRT1NtxHeFlDIQD6SFN+eC0keE9VYQ+nQPZk2K8Z7QsWQcI/u22dURmuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166654; c=relaxed/simple;
	bh=WiTGaNASv6ErgRt4Sd1YkqSwq+Mk0h6m1nxdIkAkhW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA2PU4E1XRwxVNNG4N0GHMORmJcvx1CfadoElHR2Cp4kpUJZd8amTEQHIdw2vOQr6wKiF0npjQQddFjVaRc02E+8h1BSM2QdljsASDifuYuQD6OrxwlYoykayjQ2dPkpxq8yAI9fjiW0DUftu9jX9j1RWhm5GoKPTOppn/lFDIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DluiMImx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DluiMImx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781166652; x=1812702652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WiTGaNASv6ErgRt4Sd1YkqSwq+Mk0h6m1nxdIkAkhW4=;
  b=DluiMImxL53/2gy0rzXysBJz85fJ9ZSR2K7JeL+oa0L4BtHWu4yvGtPz
   jD/SB4308lJg2woOs9QyE8zgLZzVvuHpYrq1FDrMqfFf3TymfYVFEWFeD
   s5165Vym6/u9/jcJEbdNiIAkVLDRydYAtjrmAKZh5xTWV6U41eAZPtBkz
   uekwIHQxQNWq4ryg9dA64vJecNhMM42zg2P47B5M8vD0bevjwI0AU4Ofo
   cKrteRZQ5caCTQ2A5RYNHdTA2rf3MP6wxO6S/2ezoqlJFDYncYaneaWHM
   M02F+w2baZkzeXzthx8wxFABptilpVkYTYOfuRL9aszne3Lyk1yVK/fu3
   g==;
X-CSE-ConnectionGUID: BLC7sqZzSrKRgurQI5WObg==
X-CSE-MsgGUID: pnxquNCgSLuW2rJwVM8fYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81978696"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81978696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:30:52 -0700
X-CSE-ConnectionGUID: 01WqtrNbRuOXTIZkbOtjXQ==
X-CSE-MsgGUID: FQ5oDzX+QwqCICSDo2CERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251339678"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:30:50 -0700
Date: Thu, 11 Jun 2026 11:30:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: hsu: Drop unused platform driver data
Message-ID: <aipyN6kqqbanoEr2@ashevche-desk.local>
References: <cover.1781161455.git.ukleinek@kernel.org>
 <86a23025da12369034dc7444f43a7763f2e515fb.1781161455.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86a23025da12369034dc7444f43a7763f2e515fb.1781161455.git.ukleinek@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 09:45:09AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly sets the .driver_data member of struct
> pnp_device_id to zero without relying on that value. Drop these unused
> assignments.
> 
> This patch doesn't modify the compiled array, only its representation in
> source form benefits. The former was confirmed with builds on x86 and
> arm64.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


