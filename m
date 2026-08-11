Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054BB438478;
	Tue, 11 Aug 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445516; cv=none; b=YXV+KiMPXbVf/q0OxqpVqCfU3paXyjfvyb5IfVNvwrw9VPxkETjV2D8OwF2kBpn7dpM0uwulTgE36aXbWI+wAK3ImGEsEE3ZHzhR1dVekQBziUlfxE8Ni7GVXE3/5cQEWSFJTdnDKRwhXs9RYaV/eL1i0E3MJZdoyPm/0iGjbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445516; c=relaxed/simple;
	bh=Z518yLI8ELwkyus5zVg6xmji8Go6zG7sAhthpxfDdws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doUPBfwua1Z95MkYDPC9fx3XdIReAfEfarz0Pg0SPb7rhB6S0Ffz1OnwnHVbqffInwFKGrEsfpH41yCnVT3gneuiwmYeadpNgjeWXGbjRM01zgN8LBwsDpoOd//V7VBT0Yga4ssjPwVXjBh0LixyUCvaluFs8aEGvOd1poILLGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGf5bqAT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGf5bqAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786445516; x=1817981516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z518yLI8ELwkyus5zVg6xmji8Go6zG7sAhthpxfDdws=;
  b=jGf5bqATomgfyBc1DPvtQCqM1mjgM3BOQ/jivdIwMTGnavOxjtfKJRpZ
   r0LEAg9p9sXhr2XvfHVpRxRm6+IWROmJrZ+pBS1JFgzPLR0Q34RicHilH
   dgQ26aw++rOvCpEDhJWA68dFuhYvTyCFI2xk32Frb3+B3zMNftgpkd6qF
   ddk3Kolg+ARHHNfMhMi2JMPr94sV9thyMwNj0LzACGJA/lj5MVHJV1Y6z
   GxkGhKj0vKxXwW8SYnkqj7432I7gHldMtNp4oC+IebaycEZtSir+ssMMI
   8QpH/MSbmbmPadVUDWTDeXpp7WO5PbNl7U1zp4rxqkESI7zPLwX3umi6c
   A==;
X-CSE-ConnectionGUID: tBCfi/NIT8OJ3IIie1+6JQ==
X-CSE-MsgGUID: MGNj/8JjRkiVC5nZA4KyFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86825843"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86825843"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 03:51:55 -0700
X-CSE-ConnectionGUID: XdKeYzuGS+KyxQANgR9zhg==
X-CSE-MsgGUID: 22Er8gU3Rc+GuZ24pQCeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="260704649"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 03:51:52 -0700
Date: Tue, 11 Aug 2026 13:51:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v3 31/34] dmaengine: dw: defer callbacks via channel BH
Message-ID: <anr-xeE3ccxJth3x@ashevche-desk.local>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 10, 2026 at 11:09:32AM -0700, Allen Pais wrote:
> Queue completed descriptors on the channel and invoke their callbacks
> from per-channel BH work instead of the controller tasklet. Add a
> synchronize hook so termination can wait for deferred callbacks before
> their descriptor storage is released.

This driver is so old and got a lot of stuff that may be cleaned up with
converting it to use virt-dma. Have you considered that option?

-- 
With Best Regards,
Andy Shevchenko


