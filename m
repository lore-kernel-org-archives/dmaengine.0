Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167149;
	b=R0lXyabnKr9riqdmxenzXhiIql13tATcStt2sGVq8UWoD5hRpOOzFo+1G4PuE+GipQer
	 dZAhFiHYdMHNvbKazip34QWnO+yBJRA/+5AxlW1ejQQ3qkQ932Q+OZa1SR/ILdOdH6GlE
	 4DcxvbbxbVpGY9RsANjheBmLTdladSPnsd/o678yAfX4ZQNu0I00xPz37F9lmpQNNgRSp
	 x1j6jbVTMwnAWiSGpkQeIEW5dIgGREuAwinq3dSwcfUf+HYSZbmJ52rItyIO18EVY8anp
	 xXWdl3W4c/P2a3GJGIiO4YxBKBx2EKxHiGoJ4SNzGaar9GdC2LwdFN3d+VyEsQNtAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167149;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N2TX84muOckIlzBgwTaSk5sr6HXNB/fegPx1qDVmWWg=;
	b=K6IKVrsWYh3FYxIGzMT9b6Ydp802VBKWUuwfUkEV5Rwg1gUhHeUIzEzSrZGV8Do2FkxP
	 vP0IdGPGzD+tHw2ndSyVq8wZTRYZ8KFv485bu0W42kOBfWRBoWUKFLb6ArWmAU9rdA91n
	 R2LMFRKa4KwwhCTOjW9mPQV7pCcP+0PGz9ykr8+yacJqIfbEa29RgZWdWD3ADHnjn7QmG
	 x2ZQ+ka2uDTL6MLOSsSoQL/ZfF7PIJi6peW8CE6WvtbQJ1r/elzsrWpG7t7NvBlefFrh8
	 Z/oaGv78slB5qRZ0XBY7MRXrPJulpmTT9tG7DWxdDPqyeYslANUHzi4luTbf9Y2rLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b+aayWs/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF012606A320;
	Fri, 20 Nov 2026 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+aayWs/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081771F000C6;
	Fri, 20 Nov 2026 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167148;
	bh=N2TX84muOckIlzBgwTaSk5sr6HXNB/fegPx1qDVmWWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+aayWs/8zNGLRP2GlXUtmz8xp5X+5vLouh0IlkRXw7wkKAbJfTUheIfkHnKomjRy
	 TXx4/fabragKwGwqDmaGDetXZvXckvRdRTJnmUCDnHn2htfw8xXWbYJbLb/BfzOTkD
	 yWd89VPKBAtk23Yl6XNHeq/H3mbJfxwAWLiDyNRkBIAqKuxv5mOiT3/JbbuA6rqHUc
	 FbMLwvet808w+6qZINkn2COvA9CiH4Ggd56c7kmeBn7fA2WIHtQ5lVgedUE5X75phA
	 tgn1tcExMLn9b/9ULyDBBcf19MFieDjpWD58uQ0Zs3UDeWoEev6d9M7J4XOXtIpV7k
	 QdhBZFUdSsucw==
Date: Fri, 20 Nov 2026 15:02:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rui Wang <wr574332525@163.com>
Cc: Eugeniy.Paltsev@synopsys.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Message-ID: <awATqdO3Ltn5JiLg@parshuram>
References: <20260928035133.2046-1-wr574332525@163.com>
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
In-Reply-To: <20260928035133.2046-1-wr574332525@163.com>

On 28-09-26, 11:51, Rui Wang wrote:
> The driver implements device_pause/device_resume, but device_tx_status
> keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
> tell a paused channel apart from a running one. Report DMA_PAUSED when
> the channel is paused and the cookie is still in flight, including for
> callers that pass a NULL dma_tx_state, and clear the stale is_paused
> flag in dma_chan_terminate_all(), which disables the channel and thus
> implicitly cancels the paused state.
> 
> Also, the residue of an in-flight transfer is currently derived from
> the number of completed LLI blocks, so it only advances in block-size
> steps and stays stale for the duration of a large block. Read the
> current hardware pointer (CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR
> for DEV_TO_MEM) and walk the descriptor's LLIs to compute how many
> bytes have actually been transferred. The 64-bit pointer is sampled
> with a tearing-safe double read, as the transfer may be running
> concurrently. The pointer is only consulted for the descriptor most
> recently programmed into the hardware, tracked in the previously
> unused chan->desc field; any other descriptor has not been started yet
> and keeps reporting its full length. When the transfer has just
> completed but the descriptor has not been reaped yet, the pointer sits
> at the end of the last block and the residue naturally reads as 0. The
> pointer registers are pre-loaded with the first block's addresses when
> the channel is programmed, so a stale pointer left by a previous
> transfer (e.g. when its buffer is reused) can never be observed before
> the first LLI fetch completes. Cyclic descriptors keep the
> block-granular accounting.

This fails on dmaengine/next. Can you please rebase

-- 
~Vinod
