Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334521;
	b=O7bRhCHYCsEUiXmd2Pi8VYEyjBn2H+etk8G901al8ObJxVJ4YOYtZ4ofBCA8I3/+vpsp
	 931XsCt27boBLgDdEQl4//OhtPjmLhUY9zmb5P9oaFjHdzsYdAiA0ivo/wvpdQglS7EMM
	 +TjUte9mxEjh4Aw0jz+dxU8oujNhv9fRfXAaxRyCL0YIV7M2N5nAvQlQCtxZNnyNEMznm
	 hTBZKxcVxK/p5n4IlqVLO9cDyLBT3HI+BvM4jupctaVH8Zs/hEcXaXgc3h4MyyFUM+gC+
	 PWUeAtST+4acfBUxEbpUBTJErG0aTQAdP8P5dD+w1/OfdTePPThgw2v8vqCULVVMhYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334521;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=hZcz5ydihOXe/GuAwZ5VWgUTG/VWm+MFA26U9CKQQV8=;
	b=QEKXG7I3jCHTDaFDbJ2TZz/RTCVcR5M+vTNxNRE00ywUCYpGP/156HVuDWDkVkx87MrC
	 fvnIpSNN70yWkL9hkCBHTF5iYFE5qiHZZx6ZSNcMIH7bIKvs46iw8zT3jeOI1ajEMk4EL
	 hrbaar8J0e+H1lG15SPS8ZUvAe7D2AHvaum8B5ASbDHYJM2B9WOBPCT7d3nFneSCMqmaf
	 pR0MHBWM1FZ/VyTTi2/Tz0pS9W6gknDXKvKsYYQ2cMw7yiQxPcBI0n9fF5NKhDnZV5JM0
	 ZHUcSXFpoHEpI4gkX20NRhZF4H2D3WlwZ+L7ixjrsdQPw1NLc1Fvha1Q+G8xbEFjRsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=mQcBNRAs;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3918606A31C;
	Tue, 10 Nov 2026 18:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3918606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=mQcBNRAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=hZcz5ydihOXe/GuAwZ5VWgUTG/VWm+MFA26U9CKQQV8=; b=mQcBNRAsbuuVQb4Y3ICEE+vpDA
	xFk/V+emWvgSBKMwA9HhqYL+nj6hjlS6YVb4Bj2vDFwTYibSJjOdjgXv4oFTJpYXPfogWJredH/rH
	C3UfS0Z5520AktxsRaOmsHo80VQJLNmfWSJSi/KcHWBQ8HsMH2yo/1HJkyGh3Jku6reGmSarjB+Ms
	tXAbbEQVo0CJ2lpYNNyZ83MawYj1ylDaudj4ITLChKFU5iVhOFyU4oRLZuXz8aE5/6r+3m58+bVAv
	E2r8h1R6uNC0YhIOcccgidPpifrFDIQ4y5ITvFlSA9qVspbeCk9m+QSOQsim6JT7J/VaCTMLmFJmS
	UI4vegBA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQqNL-00000000oyl-014i;
	Tue, 10 Nov 2026 12:15:19 -0600
Message-ID: <0b924ece-f666-4905-ae19-910be9d6d9ce@deltatee.com>
Date: Tue, 10 Nov 2026 12:15:18 -0600
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
References: <20261110173927.624629-1-logang@deltatee.com>
 <20261110173927.624629-3-logang@deltatee.com>
 <sashiko-outbox-207537@kernel.org>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <sashiko-outbox-207537@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2 2/6] dmaengine: plx_dma: fix descriptor ring leak in
 alloc_chan_resources()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-10 11:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] dmaengine: plx_dma: missing Fixes trailer for
>   alloc_chan_resources() leak fix
> - [Low] dmaengine: plx_dma: duplicate cleanup in plx_dma_free_desc()
I've made the recommended duplicate cleanup and added Fixes trailers to
all of the commits. I'll send a v3 next week.

Logan
