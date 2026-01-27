Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A14535B63C;
	Tue, 27 Jan 2026 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532642; cv=none; b=r71Tpzjg3hsn5PlsTEbqUJapfpuN8HsYkK3YSk1UjzpeWIq6ds3rpfOhnr8cw+NAOgATtT4ipOkp/sliVqnVkoWbk6MlsDMPanj0+6XPduOLiwde5g39m0tbJ0ntpCSFTcP/9QUbog7qAEpss1CUTuefp8cWbQqVZK9SqoA7Bqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532642; c=relaxed/simple;
	bh=li9WJG92XX20cHhn7DjZrnNvlGal2HGpbwK0VeGUtL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UHjNuCzfQLWYUeKka1Bmj/qHoMkPwZ31gNBHTjmt6IAfkoeRt4EwJY3pxJk8XttvVGV8LHFhHpo21lwNMnpbaIQS98QwsTw4HOEIn0oNV5IWPaQGRew7jArwfFq+xdf8qxd6NSF6Q+p5ybmw12ZIQZkrjdrhKygZWmehY2WCGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhVcBtGN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhVcBtGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769532640; x=1801068640;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=li9WJG92XX20cHhn7DjZrnNvlGal2HGpbwK0VeGUtL0=;
  b=VhVcBtGNxmdPnGiOiS+U/b5UNLe/KGN5DSMtLy1M9LMz+/p+hxF7MvGQ
   mzuIno7VP5QSC0qpP+Py7GOTBQafyr2aSscalXp6RZ0PzedGM+a9BAj6a
   7J0wjDcPh8O9YdePXIWvOfKTGCOgMfJVzrVQ87zXEFCPUyc/0OufDilxx
   Rii/Kpp0ScWpZ2Dlxt2+7VoUG4nmViJ4puanntsoq50FSDkBunEkwp8S2
   Q5lcG8Sfj3Dc4p0i1Ny5AqIn9rf0k9mQ7JNWbOzqNeyDj+AtMxEbYnNxk
   H1KPPdGUiW/Zkgz9Yf8t2lKlti6rPjDhj31Kf5Qb59j7ELryxur8NvkFC
   g==;
X-CSE-ConnectionGUID: 5CgtMWZ0RLeQ2v3ucv3h4A==
X-CSE-MsgGUID: ZkoSt95vQIChpzr/SoYbLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70450528"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70450528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:50:39 -0800
X-CSE-ConnectionGUID: 31RU5YmXSJSjlA+LNUODEA==
X-CSE-MsgGUID: 2NhGmcL6QomHwj1MmHTDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208458083"
Received: from cjhill-mobl.amr.corp.intel.com (HELO vcostago-mobl3) ([10.125.109.148])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:50:38 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Daniel J Blueman <daniel@quora.org>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Dave Jiang
 <dave.jiang@intel.com>
Cc: Daniel J Blueman <daniel@quora.org>, Scott Hamilton
 <scott.hamilton@eviden.com>, stable@vger.kernel.org
Subject: Re: [PATCH] idxd: Fix Intel Data Streaming Accelerator double-free
 on error path
In-Reply-To: <20260127075210.3584849-1-daniel@quora.org>
References: <20260127075210.3584849-1-daniel@quora.org>
Date: Tue, 27 Jan 2026 08:50:37 -0800
Message-ID: <87ms1z6luq.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Daniel,

Daniel J Blueman <daniel@quora.org> writes:

> During IDXD driver probe unwind from an earlier resource allocation
> failure, multiple use-after-free codepaths are taken leading to attempted
> double-free of ID allocator entries and memory allocations, eg:
>
> ida_free called for id=64 which is not allocated.
> WARNING: lib/idr.c:594 at ida_free+0x1af/0x1f4, CPU#900: kworker/900:1/11863
> ...
> Call Trace:
> <TASK>
> ? ida_destroy+0x258/0x258
> idxd_pci_probe_alloc+0x342e/0x348c
> ? multi_u64_to_bmap+0xc9/0xc9
> ? queued_read_unlock+0x1e/0x1e
> ? __schedule+0x2e43/0x2ee6
> ? idxd_reset_done+0x12ca/0x12ca
> idxd_pci_probe+0x15/0x17
> ...
>
> Fix this by releasing these allocations only after use and once.
>
> Validated on 8 socket and 16 socket (XNC node controller) Intel Saphire
> Rapids XCC systems with no KASAN, Kmemleak or lockdep reports.

Can you confirm that you still see this issue after you apply the series
I sent last week?



Cheers,
-- 
Vinicius
