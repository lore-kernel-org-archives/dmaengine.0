Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166993;
	b=LAtolky/ti/WLwO9z2+KMw+0Z/uHIk6W2PlbL3cEBORFDPPYd/ihq7a7ZXZr5ChqXTmC
	 2WDkm9r+4DJjWhZweDgypkTjyuwnNe5dBGHCldgZKxZ6Bz3pF8MYoGa+zjvb8i2jIcGX3
	 6PvtctJIp8JYi6CPXmOYrmsrB7K/qgjEKijB/4T1pMT6VRTzJ1MUp7cTRCT4BeElk0npT
	 bbVodWm79zB7R6UuC+z9mXhkci3dJfnIAJDp+l6f8GfHN317Up6JSRJNmYhV8XkBiw2r4
	 4w/pZr1fGvM2IXaHkpOtdOK8+0SSKPL3TiTGZFfUyucp9+zyO0126RZFi7QaN3QXqhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166993;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o6RrZWPrk39SJFV7nccgRDGcI4thVjBKp4xf5aZUbKM=;
	b=V6Pq2UnUqmKT0Mt2pqL1VIR8X5wqBclZoVp18b8nTWVMJIgSwSRQQk9auF6HIDJ0ejZc
	 4nV3BurbIYsmUxfWtTMCbS0949/GJiZtVDRzyDaWw6n9OLL63KMTHc6keUjTZ22BvaTGQ
	 GRjSn0MUZPBAwhcbfYZ3L5Y2IW5F5Dh0/LcgS0xvcX4aiyS5wCRf7A5uDuctw3hgO0W0k
	 EwBRHXKrGnS+60nVXRL8C7KpCimh9PIyGYmFo+aCTRXo0klFu56XXy2WxWfNf9REquEVy
	 gGJTL1KDqdzi6penZ2ktUPHxAnYIZNZ+zVN9TWfooYNcUJN0Kj6aKyFZhZn4AoE0+MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icEMk76I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DDA606A331;
	Fri, 20 Nov 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icEMk76I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5001F000CF;
	Fri, 20 Nov 2026 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166993;
	bh=o6RrZWPrk39SJFV7nccgRDGcI4thVjBKp4xf5aZUbKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=icEMk76INok54GpfpwYSsF8W4KmFJtWVKXn/CQd9Ip+s0+1LGvE2pcQZkSS8cUu/T
	 1WJypxnIhWeyAkdgpo7rwl6G7ejQuuF1cNkcEhE2HC6h8gW1hDJabpoUnog5k5dSXG
	 hgrfoQ/1yi/VtxlUcEtecxi6xLY1WDJZMZ9aDeNJMM7hbFaS+RP7jrOHqa5rjI15fU
	 8PVOewdoLOOKVQG73vGIugWnzd6wIudw+zU/e/sQws7LziCwpLXWNofbIjZiEhrfNI
	 H8YGZwCfX0Z9ikhtnSP2JSr22B7zt36EI7jBoL0l/XgrelxImnZkvccpF0ZLM9qTDl
	 j+I/V0gpgszjQ==
Date: Fri, 20 Nov 2026 14:59:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: sean.wang@mediatek.com, Frank.Li@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel
 IRQ handler
Message-ID: <awATDbG0Cl95eKWL@parshuram>
References: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923094426.67872-1-ginger.jzllee@gmail.com>

On 23-09-26, 17:44, Ginger Li wrote:
> milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
> plain spin_lock() for the whole time it runs.  interrupts are disabled locally
> in that context, so the handler itself is fine.
> 
> milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
> milbeaut_hdmac_chan_resume() are called from process context and take the same
> lock with a plain spin_lock() as well, so interrupts stay enabled while the
> lock is held.
> 
> If a channel interrupt is delivered on the CPU that is inside one of those
> critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
> interrupted code is holding and can never release, and the CPU hangs.
> 
> Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
> milbeaut_hdmac_issue_pending() and the other process context users of this
> lock already do.

Have you seen this deadlock in reallife, any logs?

-- 
~Vinod
