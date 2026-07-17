Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2E357CEC;
	Fri, 17 Jul 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289664; cv=none; b=BnBF4xARYUUA/c5oc+lj6vbgWBugIofrQs42ul2jqTCqKRaEl+HPuNyMG60Hjo9I31tX9M8CaRKLtkhJiWLC9PxH+edTLzjD/NX2KVJpOINrJ30tPxeWomwu09QHwuq5oSN5lN2bymntlgszBs/Wqpb1F1jS/mCKGYh/bUqcl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289664; c=relaxed/simple;
	bh=Row2zwNBIa7NHSD8hoMiCpCTm9DyeBQNazUQfsoqHE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP1xa/6cAUk79IVKwSVkk6JFibSJTZJQhFnLDImO9EY8ZXnaRUlJai1X0EV90Zee+2Hjqz6y+TdKjWcWxP1N291bMJYq3KvNZYjerJ5rNn2vXwdGlAOy4e8o4UqZQqDkxIrWHKWLk2W4yZdPtRy8QsqwaK77MS07+20o/e3/dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS90eA2Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS90eA2Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9140A1F000E9;
	Fri, 17 Jul 2026 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784289663;
	bh=wWuj4RJqXa+o1WVFv6qOnRs119CWOd1DZQqEz3AuEb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZS90eA2YJsFj5nLDovXcq33D7sUjZ/TMEbZwuAQ+zUZ6m5BXYgXmxY/uvxNR3UmG3
	 NK1InVIww3bGJEvNDmfO2Vw77aOdyJK8XcLfkGN/2xXMcsjUbfB7zfEmSSOQnXxEAQ
	 XM4HXwVoNbcf3emYIkKGBbpCfcjtBHVxfoYFGvw3SaTYz8mQEG6BM6DS6ZtOYC+Y8d
	 0uQotNKkgPXwcl/tayMyalp4LP24PQhR5JH/hlJE8Pr9PUiQ8JCJ8bVmNLKdgP19lp
	 2lkxsjsSz2b0LsVrT6fTHv5EkG6LmY8aWEip8kQB+VkYN9a6NadQCXgywCgbYTC/XT
	 Pp0QRtTkivmZg==
Date: Fri, 17 Jul 2026 17:30:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] dmaengine: dw-edma: Fixes and interrupt-path
 groundwork
Message-ID: <aloZei10QXM1e_0P@vaman>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>

On 17-07-26, 00:24, Koichiro Den wrote:
> Hi,
> 
> This series collects dw-edma fixes and interrupt-path groundwork, mostly
> split from v1 of the "Support dynamic LL appends" series.
> 
> Most v4 changes address review feedback from Frank and Sashiko. I also
> collected Frank's Reviewed-by tags.
> 
>   v3: https://lore.kernel.org/r/20260715175740.1110404-1-den@valinux.co.jp/
>   v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
>  (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)
> 
> Rebased on the latest dmaengine/fixes:
> commit 867621ba2030 ("dmaengine: qcom: bam_dma: Fix command element mask
>                       field for BAM v1.6.0+")

Can you rebase this on next. Yes there are fixes but there are updates
as well, so rather than splitting I would prefer they go via next
It does not apply on next for me

-- 
~Vinod
