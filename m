Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70F70808;
	Sat, 27 Jun 2026 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782521369; cv=none; b=PhflyXGwdk7l7Z/ld5GvtUpdmWrUCLH2zkIpZar4JzRixeBmUewvH43+imJK97UicaF1aDa9H7+am2p42/alzmqw/o3jAGM/Drck7zDL05fYNiGnjcGk7vC4oMy2McK9yqGYVaESaARHFTUkUj3AkNdjO4774/2euLb23fdo1Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782521369; c=relaxed/simple;
	bh=s9MDuYh6hp/WAxq6fUgJ0FtEW+jThQTMjxmRgP1Rd1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ktjul8puVvm7IK6AHQrYmH8OOAjSQQxCnesKnf9C3ZsR1i7UA4h/+0QPyyNFSdsbBsP87SUkuBf0BsIDRwwq3lbWX0aZb0DLLArUyiq8mYAOBoNuFlU4nClzmVLIGLLkXhNddyAefO6bkKWraAkyhrqYDaaxTNKDgrNRM2F8U+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuJBG3x4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuJBG3x4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782521369; x=1814057369;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=s9MDuYh6hp/WAxq6fUgJ0FtEW+jThQTMjxmRgP1Rd1A=;
  b=MuJBG3x4MfBju++dnQWr2eTk8qgUGOZ/G2wJNJTtDBKJ+1lLXXV0Oy6M
   XSUN27z4Tv3ridWbx4SqtYEuMZr4gxqcUqNFTVb+YWHz4Rn2Syxk4i5xe
   QB/4Ae0RUUU9Ig3MU+Ce85RI4VpAqozk0hGWw+K2Tm3ZcMyB2UcyBdzt5
   iIucFndl63qHtEeNbchruT+iAcLFf9/Hf/WtmBijYcxlQ4ehwQM2kTHvi
   aiShC62QSm4nuIkI3sTwfuJX47KsB2auwhLGbw+JlS7Q82ztogre5yFDV
   cJY9mPUKOnu/f4JAfgLKradkcVUZd79JObjGQ8eBL0cnWjla6nT/hunr4
   w==;
X-CSE-ConnectionGUID: Kl97rbkuQFOR52qmOBdBIw==
X-CSE-MsgGUID: A6DqTTG4S92PXKEDGDjcEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94800634"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="94800634"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 17:49:28 -0700
X-CSE-ConnectionGUID: 6LDZWUysR8+TwDyfIdsS4w==
X-CSE-MsgGUID: 5epQ0CsGSnqydvZN4W/e5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="247474458"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.88.27.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 17:49:28 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Steve Wahl <steve.wahl@hpe.com>, Steve Wahl <steve.wahl@hpe.com>, Dave
 Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
 <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH v2 1/2] dmaengine: idxd: Do not call destroy_workqueue
 with null idxd->wq
In-Reply-To: <20260522203414.336549-1-steve.wahl@hpe.com>
References: <20260522203414.336549-1-steve.wahl@hpe.com>
Date: Fri, 26 Jun 2026 17:49:27 -0700
Message-ID: <87ldc0iz8o.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Steve Wahl <steve.wahl@hpe.com> writes:

> Error paths within idxd_pci_probe_alloc and related functions end up
> calling destroy_workqueue with a null pointer, from
> idxd_conf_device_release via put_device, because that allocation has
> not yet occurred when the error is hit.
>
> This was encountered running in a kexec'd kdump kernel with reduced
> resources, causing the "Device is HALTED!" branch in
> idxd_device_init_reset to be taken.
>
> In idxd_conf_device_release, check that the workqueue has been
> allocated before trying to destroy it.
>
> Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
>
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> ---

(for the earlier email, I meant to add this)

Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>


Cheers,
-- 
Vinicius
