Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7863126C0;
	Mon,  3 Aug 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767987; cv=none; b=KHttUMM1Cn+VzTi8E1JACh4f5x1SrBMqFShmnDQ0MrFoa1HEaK2saDAUYeFCXFkhJaLycVdM2iNwTSMfGsDkW7sgoG9cwaLWo75g94gWGQS6qsqbkNyfpPyO4ZVZGXgEaT93PC3BCFIQTlrgfy6wboHX0MPHbCmOo6ROJfc5IRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767987; c=relaxed/simple;
	bh=TnyB/lE62Vgv0XTcDZMRiCAeP+lIpfxoxN39z6lueKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvoIi0b5QABVUPaf2MgY7gLX/C8lTMRflxO/neyna9QLvUboHnM/aeOqghFHDsJ81CXdjzf2kg41/1GS4RjztHVD0DxC5sLMLRY9dN3rfVwyyiGei3gQsl18MGxZytSitWiZPuTjK0el0x4Zymbywun1YTqWx9mcf7vNSzuRnv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aLvbaW7+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aLvbaW7+"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69ECC5B3;
	Mon,  3 Aug 2026 16:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785767914;
	bh=TnyB/lE62Vgv0XTcDZMRiCAeP+lIpfxoxN39z6lueKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aLvbaW7+8hS7GdDEXnxKqZKAW0LR2Ggpf4gUlFDFsbx6m15yYrZHzZDZwVnh5yt4a
	 nw/7UKMIyruyqLqBX7mylRUDGwkCmp1GBiV8zaiy8eakfsCO9VPc3meMrJifqH/HqQ
	 8pk2ZgEQlJ7wr2gZfDhZfhKZtqcHKXg2OnNfWOBc=
Message-ID: <a976b47c-164b-4d6b-ba88-169b401c1c93@ideasonboard.com>
Date: Mon, 3 Aug 2026 17:39:40 +0300
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>
References: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2026 16:20, Tomi Valkeinen wrote:
> All callers of xilinx_dma_poll_timeout() pass a zero delay and a 1
> second timeout (XILINX_DMA_LOOP_COUNT). With a zero delay,
> readl_poll_timeout_atomic() does not measure wall clock time, and the
> actual timeout can be much more than 1 second.
> 
> This is very visible when a channel reset never completes, e.g. with a
> VDMA whose stream-side clock isn't running. Probe appears to hang, and
> only minutes later fails with:
> 
>    xilinx-vdma a0050000.dma: reset timeout, cr 4, sr 0
>    xilinx-vdma a0050000.dma: Reset channel failed
> 
> Switch to readl_poll_timeout(), which checks the deadline against
> ktime_get().
> 
> Calling xilinx_dma_poll_timeout() from atomic context is still safe even
> after this change, as readl_poll_timeout() with zero delay never sleeps.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/dma/xilinx/xilinx_dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c17353..6e8c786147f7 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -530,7 +530,7 @@ struct xilinx_dma_device {
>   #define to_dma_tx_descriptor(tx) \
>   	container_of(tx, struct xilinx_dma_tx_descriptor, async_tx)
>   #define xilinx_dma_poll_timeout(chan, reg, val, cond, delay_us, timeout_us) \
> -	readl_poll_timeout_atomic(chan->xdev->regs + chan->ctrl_offset + reg, \
> +	readl_poll_timeout(chan->xdev->regs + chan->ctrl_offset + reg, \
>   				  val, cond, delay_us, timeout_us)
As commented by Sashiko, readl_poll_timeout API doc says "Must not be 
called from atomic context if sleep_us or timeout_us are used".

Maybe a better fix is to continue using readl_poll_timeout_atomic, but 
use a small (non-zero) delay_us, and decrease the timeout_us. Using a 
one second timeout when calling from atomic context doesn't sound very 
good in any case.

  Tomi

