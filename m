Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD8435503;
	Tue, 11 Aug 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455912; cv=none; b=AV+ZpOuuOEjUBYAdzk1frT2QKBVQmxVCMqTD6G/JWyA2BjQCkCyQgtpRMGVs+sx/++qnlpbP1JUP4ZucG8MOhpNIW4tQptF99u5/H640GNGT+zBwyJ36NTv7Q8IvtSzwi9J3sL/VdVddMJHJYKWwZ9N9t3q5tz5ZU0tM64DrBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455912; c=relaxed/simple;
	bh=At+0/ZKTniC5qq1j6rpznLEznAkACgsKV6FDAux0DzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfL1QoC4wsevG+G1zMFgqV6dpLkqok2xXyhtUe8UKGyLZB6gGtzKW+tN+kXnXC8QUovPxaqWmdDRaUWs9O9XDyAwpCoCz6MD136Z1GMpZYxv7I1HHZZb5MVsjM/M9bqbcP+18WbqityU3idDVUXtFdHxaZ3InjILikkNMACW5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrecCGcT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrecCGcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786455909; x=1817991909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=At+0/ZKTniC5qq1j6rpznLEznAkACgsKV6FDAux0DzQ=;
  b=NrecCGcTI8kRzEpyW/uZDE2LUPSQKCg0vSzoZIINN74SMe0lU3E5iZf3
   G9WcwnTfu5n7YDkLRNwxHfXrAASiTh3vrvJi4umzCJ67ERDqRhP2yNADx
   eHV8tSUcfEQoWErXZq63MBiOEqdpCF6t7+uTF4VMWCLEag533Zmp05tkq
   wmUolpwOEvLrnDTHjP4MWWbP27EY0GKyjR85kP2i1BxZLwf/Ftd3CftXZ
   eJ8T5H/73kEj8Y3vz4Yi3rFn5TbOOkVA5EWrUYuF3Q5N5buoTOcGvySUj
   YdC+s9FBv+7JUudr+jRCY2LekQaPcChjvevVQFwQr9o6ze7PmYUdDeJSA
   g==;
X-CSE-ConnectionGUID: UUCNh+IUQweJcul9py1C2Q==
X-CSE-MsgGUID: 3/FvxEd2ReyyUujXW9guOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86838193"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86838193"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:45:06 -0700
X-CSE-ConnectionGUID: 4s3bD59aS3mfTjSbJjQkiw==
X-CSE-MsgGUID: PrZVewVKTliOt0XqG2lIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="257132346"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:45:03 -0700
Date: Tue, 11 Aug 2026 16:45:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v3 0/2] dmaengine: Use named initializers for arrays of
 pci_device_id
Message-ID: <ansnXXZFP1J_DOdN@ashevche-desk.local>
References: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 02:03:47PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> the objective of this patch series is to prepare drivers/dma for a
> change of pci_device_id that requires all users to initialize
> .driver_data by name. See
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> for more details. (This is about platform_device_id, but I intend to do
> that for pci_device_id in the same manner.)
> 
> v2 is available at
> https://lore.kernel.org/dmaengine/cover.1781161455.git.ukleinek@kernel.org
> .
> 
> Changes since then:
> 
>  - Rebase to current next
>  - Add review tags by Frank Li and Andy Shevchenko
>  - Fix commit log to talk about the right device_id type (i.e.
>    pci_device_id and neither pnp nor platform) (partly found by Sashiko)
> 
> Note that Andy prefers the use of PCI_DEVICE_DATA() over PCI_VDEVICE() +
> explicit .driver_data because the former is more compact and the
> follow-up change to struct pci_device_id could be handled in the
> definition of that macro. I disagree here, as the compactness is bought
> with quite some magic in the #define once it handles the union, and
> being explicit (and thus less compact) has its merits, too. Additionally
> the affected drivers need an adaption anyhow in their probe function,
> and switching both .probe() and the .id_table in a single patch seems
> right to me. Because from my POV my subjective opinion is obviously the
> right one, I didn't follow Andy's request.

I think we have not enough understanding regarding implementation. I'm not sure
how the union will affect the change in the drivers. When each driver is going
to be changed to support whatever pointers you want (CFI) this won't affect the
ID table. and hence makes _less_ churn.

Do you have a Git repository to show an example of the road map of the changes
for, say, one single driver on your choice to see the difference between your
approach and my suggestion?

-- 
With Best Regards,
Andy Shevchenko


