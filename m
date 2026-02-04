Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD32156F20;
	Wed,  4 Feb 2026 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224441; cv=none; b=p0QaOmb9tYtZXnEmKpTfVxrh/vuPmvBEaqKAq6DAcjM96Z7oYnl4ypWbF7w5v60hexWdVL0hq6wV0dOl7rBNpPWf1FWWZe28zbVx9sjdXu8w3WIUBP00BR7TCABnQVSONJ7XRWMXY0LZmmefWTLZh6S61Y1dhBlMsF/BM60RBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224441; c=relaxed/simple;
	bh=5LVuablpYJVQk+RFOXEVsWRw/8OeLos12YQdNldmgnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMZDgCi4O9aJdsv1nWjfwoNpvbwqA0x5IKR/Jq3BenJKN/ux/kSfe8k5PJMEk5cijq6HYMuij4PSPS/oGzkhQMo1Jx9XBFzxyAmz/iHDzEDeezRO4eCj/lp5Dhn5kfwSjki/LS9HMjw3KBKhs7D/h6HhNaQarHeTXW9Ar03Fb4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRiiMznV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRiiMznV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F7C4CEF7;
	Wed,  4 Feb 2026 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224441;
	bh=5LVuablpYJVQk+RFOXEVsWRw/8OeLos12YQdNldmgnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRiiMznVngxfks1OrAZGlBvMlzd/MqpuzKko21Be3faLN1adOJkPMgDW55W3kcsrN
	 5rwcyORC7tMX/zWK4yebBjTZrn5c48ZOOi5cIw2g86abvnzcrhlepxyC7sgSFvtizo
	 yH57izC5WCMBQyG7na2b9bccfWnXy//R4Ee/5uRvCHt10LT1BLDB/P2DYzDwmh/zJe
	 lm5wJMcdeuNpBcKL5YqSYW5vIde1bLyUAd87WvCPAWFz67i5EarNpK4VjWL3BMgueY
	 r9qbBumrTLgvyH1GoN4gSAyputIFQzs0kpPPKr1QhWL4HLBbqG7xvXbpdrx6D8TASi
	 p7V20T6zYwCoQ==
Date: Wed, 4 Feb 2026 22:30:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dmaengine: add Frank Li as reviewer
Message-ID: <aYN7NZeITe81TqtH@vaman>
References: <20260130042039.1842939-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130042039.1842939-1-Frank.Li@nxp.com>

On 29-01-26, 23:20, Frank Li wrote:
> Frank Li maintains the Freescale eDMA driver, has worked on DW eDMA
> improvements, and actively helps review DMA-related code.

Thank you for volunteering and the help, appreciate it

-- 
~Vinod
