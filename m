Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27018519922
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 22:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932049; cv=none; b=RyqC/fuVAVYc9bD0lLRHghaqSuF7rLoHR675HwxBlBz3aqFBZYwl9+Ec9jGQXQoox8MtCgKt6WLhe2Zm7xdJOe/MY4d0Akhw6qurphD0zPn1CFq+x7HAFOaODvOCCiYBVRT12eKQrSCaHtB24gxoQkRdCFbDg+IS1PETgGLvu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932049; c=relaxed/simple;
	bh=msU/i9O6mTA5qhMROORD4h3qGhJHXQ3cY7esNkgKNbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q83fdQRx1H5z1uVYpY6rsTmUt54vOU+ZA2KUb08VtViLvyiKD6g5Vl+t4MM9VQvi0YugZjRun9uWd9xhnn5t1P0KitTvqRS4D3F8aKaeLzHwK2vu35csOvclCV/GTrF1SHsyYLoSr7THd/41IV9ybP5+wJjElGj1qiXOIXS3Z0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqYVd4R6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqYVd4R6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791932046; x=1823468046;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=msU/i9O6mTA5qhMROORD4h3qGhJHXQ3cY7esNkgKNbY=;
  b=eqYVd4R6f+ENEL8QL5rLw6Pho6ow8z0Spe3d6gRqjc62r29VEIcS5Ufq
   CYp+3FJ1aJpIEOI15k85ZtVIYXdAX/Mv/SMLyEwCggFwbPS2TH4OKGHIy
   +nBJhWsHR5f0SibXPmFNmh/+YMAqAXmkepPCHDAYVjqN8JyUSuWfiy2bc
   quGZ7HZv6ZXdTaDOfuVlB8r1FLnfEO9WUbw5dsMYDeYyY22+97oIJQmoZ
   JFbrZXSMO7xdwF6UIBKjxuDbxgoUkEVAX9b8dNAbx2bRHyl3ZPC9B2RQ0
   TG+bFGMEe7Egg88sUl8ksBU5CoqVsV68FHTY0dvTNjYXBVs+Y2oSKwlAI
   A==;
X-CSE-ConnectionGUID: N58hJt4fR0OajdXpO8wVmA==
X-CSE-MsgGUID: jvVemVudS36aYRVQUoP2iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="563146"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="563146"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:54:06 -0700
X-CSE-ConnectionGUID: 0HtpPYzUTKadwSNf1OeD1Q==
X-CSE-MsgGUID: LE8oxLPyS9C9jgMZAtr1sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3125384"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:54:06 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Dave Jiang
 <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
 <Frank.Li@kernel.org>
Subject: Re: [PATCH 3/8] dmaengine: idxd: unmap descriptor before completing
 cookie
In-Reply-To: <20261010124348.19055-4-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-4-wsa+renesas@sang-engineering.com>
Date: Tue, 13 Oct 2026 15:54:04 -0700
Message-ID: <87h5ipjjoz.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> To ensure that buffers are flushed, make sure that the descriptor gets
> unmapped before completing the cookie.
>
> Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>


Cheers,
-- 
Vinicius
