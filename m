Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50526548554;
	Tue, 13 Oct 2026 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930682; cv=none; b=AV2BDFfD3YR2R++iOdzF28pweQxONzXJXZplvhcNQ3Pl7LHwgpekz0RPXw6o0Gk0uQHI9th2q2oIz+ivfjHn5E3hALGFJmr3fiirfO7c6zavHCNbX7rQVoOjTDiha4yWEXwGnpR2ggYbgVy7Z8gsvUGi1/oNNOCkBFJA2OhMkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930682; c=relaxed/simple;
	bh=wpuzREohHmJnduK2S+GFuvLvvSRMz5svX42VCxpjGUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bq0g7VyAIGReDlsgDj9+DAC1G810mR0Gxm5El/CKxo4+Qp238tRYrDc0yiI/GDu0I2akbU4cKwSyhjvWyRCPb426rmd3+f3Br/f1A9UIZwOcmXQ3J963fDrbgzWoKqX9GPHnfCGtQ/ehkgzlFerZEoaYg/CBnONkt+wN4hHQLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFY2tqov; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFY2tqov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791930681; x=1823466681;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=wpuzREohHmJnduK2S+GFuvLvvSRMz5svX42VCxpjGUU=;
  b=PFY2tqovDbxbAxE9ReHaXSRbn9+k2SqVK+U7lvQ5+cHVHpsWAzMoOlbG
   39ybChSbjqH3sJrifgqCeNCX4L2XcT5eU7iBmvO+MaEX078bGDGXTH9ed
   8azZ5l0F2lvjt+3VObj6aAaTPm+skde/mQrG0MtPWAG6nW5XmEG4lqh7v
   N/VFPm14WGmXd6JF8+EP4G+D3oQ6d9T/DyWMzRWTkMxsCasVJO7LbX9Th
   fmrTKWcE+YaGXjCAHL+p17HypljxLxksvF69TeacRLmqgtn6tZUDpEHnM
   xzGlrDQnQUPJoAHKtW/u4RdviR6EiQwuDAo5B1+07zoaZ0CyfRF66YJ9t
   w==;
X-CSE-ConnectionGUID: 80wzQxh/RtiRZzyx7qo2xA==
X-CSE-MsgGUID: DFeoTwdmQOWZvaxPAbp4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="568886"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="568886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:31:20 -0700
X-CSE-ConnectionGUID: WD+ToPcVTKOziNMZ4qReDw==
X-CSE-MsgGUID: SbmRJrH3Q6i9OYki9GeqzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1594871"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:31:19 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Frank
 Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, Shuai Xue
 <xueshuai@linux.alibaba.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steve Wahl <steve.wahl@hpe.com>, Bogdan
 Codres <bogdan.codres@windriver.com>
Subject: Re: [PATCH 2/6] dmaengine: idxd: fix duplicate memory frees on
 initialization error path
In-Reply-To: <as5G2DmXXSBsjP5c@SMW015318>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-2-30a35a445077@intel.com>
 <as5G2DmXXSBsjP5c@SMW015318>
Date: Tue, 13 Oct 2026 15:31:17 -0700
Message-ID: <87tsmpjkqy.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Frank Li <Frank.li@oss.nxp.com> writes:

> On Mon, Oct 12, 2026 at 02:38:05PM -0700, Vinicius Costa Gomes wrote:
>> From: Steve Wahl <steve.wahl@hpe.com>
>>
>> Error paths within idxd_pci_probe_alloc and related functions end
>
> idxd_pci_probe_alloc(), check other commit message.
>

Sure. Will fix those.


Cheers,
-- 
Vinicius
