Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405625;
	b=XUqAhwBHFqs/XX6lr02VJReItG4VsPPYrwh0Q2dPk35goMApgZ2xvrq186mYkcTnEY1I
	 Pej1MTk8sKuMcTyA93kHx/7W8IyllMki1WdSwZX15OGXBxE3DVRQgHA7PGKGmSbqjkhRP
	 nlOVMhd5EGJ/s6K6b122FQgywin6vyQntwExXT4cyc34WgjkV1TRaDZIarZJj8FEuKG/X
	 lVWLnENhxnLMan5nEdS5XVNTfRYR5QSdHmrxtwYSFMHL7gCUZh8vR/3IE/m5Pit5V3uan
	 m5i5plJHwoAECzdHyRThR4Tl3QlZ8HMDE1KK0Xb6BkS285dAPngq2RXFWr0h+TD5Jkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405625;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=keRsBFedUTBEaf5TO70Ubj5I8W4UKIxaqM5rYixLglc=;
	b=OZw+1rxT06CqN7T4BqVwo0QGj8MP6nbN7cVj1RmhEHK9Zdx9kJPVaP21q44sxpkxRieb
	 RqzOQ6qWZ0AI3z7ER+vmBaM2lyAQCsJK6tZtmkzUhgIV9fZvb3o99daEf3vX+Q0NGiBFw
	 sScyqjhX4M2g/00J+AizHuSfqgPO18FehhbA7r9rlY7nTMcjJBMG5cv0G3IHMZlwr581b
	 +mTBQH10V7iIiaKj63jA4D4+r8SgbRUj+aMep/bUqRo+9u/nKn7S5rP6EB18v/pitZzy/
	 jf7uIHpnLM1EiGNHuFRg2rV+NpiipqgtaNd99th/mF76ASN/odpfbc56F6Af4KwKCnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Sm/pebDf";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E77606A31A;
	Sat, 31 Oct 2026 00:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sm/pebDf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793405624; x=1824941624;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EDyi6/MORzQEdVy3reR07jUnjeETzyvV7qqwKrZAyb4=;
  b=Sm/pebDfR7pS3qIZw/AwmjyUJqelUL7H1t14pIJI+t59hj3vz6MCFyqQ
   2spp8SELpzDadU/TJ+nlwYwp3fYkbBYw0fu/dontnMOXcfgX0OJcfLfSp
   jWGUfsf1QC3Dld4x/7kQH1T4DJGvwFfKVB8pWQr9EP+v4CcpqXZgi6Zni
   1wS4XFU8lP+0wPPUzRvx8gNjQm0IwUbQZVCFC9M6bvdnYA+oET/20bZhR
   ebo3ym/tNRegup6vxrgX19iExeh8TxRmsTfrri3SoYr96NYqkCA0hYrd1
   xT1FlQsJztCppiJuuj1JB1CnAQM+46R0GolEsm3S0zg02E5L/rVmWrDmv
   A==;
X-CSE-ConnectionGUID: SQ+YqaxaSKa4rzzT01Dpiw==
X-CSE-MsgGUID: hlFPOdIYS7+LCP6rv2a9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2068857"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2068857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 17:13:43 -0700
X-CSE-ConnectionGUID: r4xMv7kwSHuO+Ll3i5FWbA==
X-CSE-MsgGUID: ZTDtXSfRTT27NjmUnBx1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5650976"
Received: from vcostago-desk.jf.intel.com (HELO vcostago-desk) ([10.98.24.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 17:13:42 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Ziyou Wang <ziyou.dev@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Huang
 <adrianhuang0701@gmail.com>
Subject: Re: [PATCH] dmaengine: idxd: Fix use-after-free in idxd_remove
In-Reply-To: <CABBdrdLtTJL7-xgB4i=AvqBoBJfFzYvJe+gV+KyLz5=QjUWkCg@mail.gmail.com>
References: <20260911065547.161522-1-ziyou.dev@gmail.com>
 <CABBdrdLtTJL7-xgB4i=AvqBoBJfFzYvJe+gV+KyLz5=QjUWkCg@mail.gmail.com>
Date: Fri, 30 Oct 2026 17:13:42 -0700
Message-ID: <87se1mwwuh.fsf@intel.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Ziyou,

Ziyou Wang <ziyou.dev@gmail.com> writes:

> Hi Vinod,
>
> Gentle ping on this patch.
>
> This fixes a use-after-free bug that can be triggered when unbinding
> the idxd driver, which results in a kernel crash. The fix has been
> tested on real hardware (Lenovo WenTian WR5220 G5) and verified with
> KASAN.
>
> The issue is critical as it causes general protection fault during
> driver unbind. The fix is straightforward - taking reference counts
> on wq/engine/group conf_dev before unregistering to prevent premature
> freeing.
>
> Please let me know if any changes are needed or if you need more
> information.
>

It looks very similar to the issue that

https://lore.kernel.org/all/20260415095030.42183-1-kanie@linux.alibaba.com/

tries to fix, can you confirm that it solves the issue you are seeing?


Cheers,
-- 
Vinicius
