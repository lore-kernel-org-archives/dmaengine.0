Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754708;
	b=ZvPp/UlhShkzygr4MM3u8eLPkP79pqpa7Y2pVtfildV2MDd2Q4rn73WwzvJyKzFXWwPK
	 L4hZ3UhptU2N76Hjw8ddaTuTOf0pq+CqbzlKZfwK6GDWgD+3ITvzJzpHh6tIyp0GE8ng/
	 PtGE2aT0OSkPoqQvC1CN8o2UYag+pzvEJyfehpb48jOeT8vULUkeYoMqKRbhZZu8opcQB
	 0otYJ0fUZaLWnrSYWyQrHbbefzk0fHDhRNSw0CbpZQxuHLrrrNF+G+K0vUwf0wno0+N7L
	 BkAp5BFgl2pV7GakCBZcYMXzcmlO5HbUNVuvVP0eJ32fAA8lVeQIcjJKV3SUKBgoXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754708;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=mFW3pL0JJZeZ94yvp+QQO/njRXDnJy6ntp+9zSheaX0=;
	b=2xrn87q1g6uMHYQnEqEk1JRev9YsqEaCGff4mS5lsMdw0oE5ZfDxCKGeJ2lSIQA5f0oR
	 ZRoYpFnqHbt/+13ZUo1di6zTE3kbjmsJO+K9rhdJkJm0s1y2504JUfNj2h/GDL2hWeYP9
	 p/qMikZ+JPW6njQWIvihWI3i1dqeLbszlIgk3+B+ZvFD+V9YWqFcXHAdc3t3381xg4yHV
	 nA8RZC9dqwXEgLUAz5SYmbr2wKKM0RgCuZxV6UYrEnVoi6rY9m8I+ndwVGBmiKEoiHJlu
	 xGRS9E8O3p4S0FLuarILMX9SeWIS7lFGSZ3hPRtX8Opr2VjZLs6/csGdXxyV0NzDe+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vwi96xEX;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC7606A328;
	Wed,  4 Nov 2026 01:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABC7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vwi96xEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793754706; x=1825290706;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=5MiY13fS8Fj0CdcMem0XlBVkG+3ABAxFMz/K7DFYYOE=;
  b=Vwi96xEXNYtWssiEuv4lfCtiOlCrOHZuF/s8bshmdi5YB3VzHK0+hgqd
   C7NsIUb1l6/PAj5uVz6GzHb1zKeTBDkFiXdOI50oxifWKMTM0+kXJjPgt
   IUi3OXMTOq6AH2HXxW6qJPnfEFMvDYMoFHWTtCVnvfw0GwSD04BC1ZfC6
   NxN/jAj6qfvQhwjol+g7U6ZioEiy1DhYvYMmR4pKsSG7ej4+j/CpmwJrb
   42JYQUoYGgAlKATmwxb3VbWmXeRNlEC0FGUAOTbGeTd4Gk07dC9AhGtqs
   FivWpqn3rpwUNR72MXluwpLKHLz0rcvpz4B1NOuaFxVfzEUPBFGvEJJSD
   g==;
X-CSE-ConnectionGUID: VHDqoDpiSaK9EYTTZwVtIQ==
X-CSE-MsgGUID: sq30BuwcSjO22v3od4ghug==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2495929"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2495929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:11:37 -0800
X-CSE-ConnectionGUID: Kdp0RxS4QLWzqjkPwK5rgw==
X-CSE-MsgGUID: G1vQTDp3Sam1StnyX2U3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6691128"
Received: from vcostago-desk.jf.intel.com (HELO vcostago-desk) ([10.98.24.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:11:36 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Jingyi Li <jinli@purestorage.com>
Cc: steve.wahl@hpe.com, dave.jiang@intel.com, vkoul@kernel.org,
 Frank.Li@kernel.org, fenghuay@nvidia.com, xueshuai@linux.alibaba.com,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Jingyi Li
 <jinli@purestorage.com>
Subject: Re: [PATCH 0/6] dmaengine: idxd: More error handling fixes
In-Reply-To: <20261028202400.1144290-1-jinli@purestorage.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261028202400.1144290-1-jinli@purestorage.com>
Date: Tue, 03 Nov 2026 17:11:36 -0800
Message-ID: <8733thwgc7.fsf@intel.com>
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

Hi,

Jingyi Li <jinli@purestorage.com> writes:

> Hi Vinicius,
>
> We hit the bug fixed by 1/6 and 2/6 in a kdump crash kernel on
> systems with DSA: idxd probe fails at device reset ("Device is
> HALTED!"), the error path oopses in destroy_workqueue() on a NULL
> idxd->wq, and no dump is saved. With slub_debug, the duplicate frees
> in idxd_free() are also reported.
>
> Testing: I applied patches 1-3 of this series on top of 6.18.57 and
> tested on 10 systems with DSA, triggering kdump with idxd loaded in
> the crash kernel, with and without slub_debug=FZPU. Unpatched: 10/10
> oopses in destroy_workqueue(), 0/10 dumps saved. With patches 1-3:
> 10/10 dumps saved in both configurations, no oopses, warnings or
> slub reports.
>
> The failure here is at device reset, before idxd_setup_internals(),
> so it exercises 1/6 and the idxd_free() part of 2/6; for 3/6 it only
> shows no regression on this path.
>
> Could 1-3 carry Cc: stable? The commits named in the Fixes: tags have
> been backported to stable kernels (we hit this on 6.18.57). Also,
> from reading the code, 1/6 alone only covers the case where idxd->wq
> was never allocated: with only 1/6, a failure after
> idxd_setup_internals() still destroys the wq twice (once in the
> unwind, once in the release callback), which 3/6 fixes by removing
> the early destroy. So 1/6 and 3/6 should be backported together.
> (Our kdump failure doesn't reach that path, so I haven't reproduced
> it.)
>

I am finishing testing the series, to be sent soon, but added the tags
to direct them to stable, with a small re-ordering of the series (patch
3 is going to be patch 2), hopefully that will make things (slightly)
easier.

> For patches 1-3:
> Tested-by: Jingyi Li <jinli@purestorage.com>
>

Thank you for the tests.


Cheers,
-- 
Vinicius
