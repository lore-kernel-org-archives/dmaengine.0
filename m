Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836548425A
	for <dmaengine@vger.kernel.org>; Mon,  5 Oct 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210303; cv=none; b=t/wu1o4IhLUkrRhaknf5QcHAPXlRN/QY4aY7GY4SKfy1zmaXUJxZqdk7mGVBeLe0Yi1TeL3EYat8ImaLD1SQtcC6eSVJpeOIi3mjNmIGDKWFTgrxgM7R2ka/hz9iletOPoQq6UoUwBR+BdfsDtskMQs/SwIsmZVgh9iuRZxZ27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210303; c=relaxed/simple;
	bh=xfXDUnnHmrER0PBSf15tSFPTMMzsFy6KXRrC7JYpik4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxM27/e8cgpnZURW8epEDiLeJC7n/BDyVoaQvhXcATB8op75KhzYVK3vUzcCvb74j3mXejA5i50DJoxbcGZa366+E0W8cXFBgR9kzP7q8GkP4f1Lq02d0RlmgqckJm+8poANZD4VocbpLA9Y42BnaXC/ieBxzRgJglOScU95xpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2buJH2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2buJH2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE51B1F000FF;
	Mon,  5 Oct 2026 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210294;
	bh=GZXqVHffbtS9OmqiTsAvrAvLKtalktJGFjXvPB3NZYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o2buJH2WuEvgMj1AH4qK58ixpphjb0tEgKf0LTJ9+Df2w8IxvltI0+wv2D4ClY+ba
	 DQmFStj7HlfxCwbfGJrYRDTTfcxWEI6DbMzV9I1bklwC6vLr1HjPo01IWIGciwwlXH
	 hCgY3oVaxIjoGR4pbYDN3+Zmwa80vbu/PKZszvB5R32yY1Y/vvxVAiTB9MasR0wuUm
	 J73kuzngdBVqOELJlGoy7JV5dU2MHmuDEONOYk7/66TCGeg/nlog5i3KZPSfLbezdW
	 xKGRToNvuyoQaXaCCVVeKUSIOMSW8sVcBX4QSGL0Ghl1Gi1vjsM7r2ndrMEhej2AMs
	 Dg649XOMUjYLg==
Date: Mon, 5 Oct 2026 16:24:51 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, dmaengine@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH v4] dmaengine: loongson: Remove the dev_dbg() output
Message-ID: <asOzMw3YIXi7GqJl@parshuram>
References: <20260921195745.gY25rf4P@linutronix.de>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921195745.gY25rf4P@linutronix.de>

On 21-09-26, 21:57, Sebastian Andrzej Siewior wrote:
> The %pK format modifier was meant for /proc kind of output, not general
> printk output. Since commit ad67b74d2469d ("printk: hash addresses
> printed with %p") pointers are hashed by default and the behaviour can
> be controller by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones.
> 
> The output in loongson2_cmc_dma_issue_pending() is the only dev_dbg()
> output in the driver and is only output once the transfer is started.
> There is no output issued by the driver if the transfer is completed, if
> a follow-up transfer is started or if any of the other callbacks (such
> as loongson2_cmc_dma_tx_status()) are invoked. This output does not look
> essential.
> 
> Instead removing just the %pK output, remove the complete dev_dbg()
> output from the driver.

This doesnt apply against the current code, pls rebase

-- 
~Vinod
