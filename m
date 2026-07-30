Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9230568B;
	Thu, 30 Jul 2026 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429585; cv=none; b=gkAq55VRQ0ZtJXcWaqBf/vK0jEhRIKHY2gVzNoSmVXvlbGsOZAXubRBIKe5jI9jFRRvNH2vD6Xi0FefmkMhM/mdD88f1X7WDkI92DUhfQIwrJ2H9EixUeGjdKYuyxMdfIICSv7yQl6ugsu3WnZFsIq+BaH1KPStLJd4PzF0Y0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429585; c=relaxed/simple;
	bh=y8YseKwHJLoIQdT++c0LneFoNIEqbasmQY5QR4zaKKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQaICmoZNJj+ZqbEaJFcJcix8eTwKbZ2FrLqhCKX0Ucm/wD71VPpm/rrD+G/VOnWHb6NfOkJHFFHeh60xEJGwQPtsdFGNa9vXIljc7c21WqaJZi2UFxmq93z56JjQ8+B6jOcLn5sF+N/jgwuVvlSoAlSL6Lp3cimfyFP6w0katI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja1MmmOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja1MmmOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EE81F000E9;
	Thu, 30 Jul 2026 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429583;
	bh=YEgYkmC+Ido2BcCHAivqeJ60Nj0oROe3LYvmWSk4gCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ja1MmmOVfg3Mh3g72EaWh4ht3nEEJYVUu9nZEOhcgjL37aBNW5/ljziXP6AKFqlaD
	 Gg0grTKe2hZ7KSc6TQatZ8cMkhETMX9y53CFbIGO1/3hbZDVniRd25cHfsub8WITlc
	 /Rr/XC9F0DAKCds0idGdwH538znmlQ5P5W+UJoOTTr86MBrb6mwxhIiBoWIIVMu4jf
	 2AHiqMPgssNgAoc26QHItgfVkpZDi7tYWT/PP1oTp9XIfsoI+SCdAvYhpMUbUIYVux
	 EVkdZQ7oyabsuCAwl9rw+pYUeZM9WRIp3xfHkVWG5Ld095XwqJTP+mfPai14V7B/i9
	 e73SJBlKZYATA==
Date: Thu, 30 Jul 2026 18:39:36 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-edma: Mark emulated IRQ as level-triggered
Message-ID: <7wteyasa4awuf5d7lgusdv5yyn37o3xwiglgip5upztbtcals3@hatam5qdqqwj>
References: <20260730160701.3550710-1-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730160701.3550710-1-den@valinux.co.jp>

On Fri, Jul 31, 2026 at 01:07:01AM +0900, Koichiro Den wrote:
> The interrupt-emulation virtual IRQ uses handle_level_irq(), but the IRQ
> descriptor has not been marked with IRQ_LEVEL.
> 
> The interrupt emulation is somewhat unusual: the eDMA interrupt handlers
> dispatch the virtual IRQ for every edma_int[] interrupt because software
> cannot reliably tell an interrupt-emulation event from one caused solely
> by DONE/ABORT status. If an interrupt arrives before the doorbell
> handler is registered for the virtual IRQ, the IRQ core marks it
> pending. When the IRQ is later started, check_irq_resend() treats it as
> non-level and replays the pending interrupt, causing the newly
> registered handler to run for a stale event.
> 
> Mark the virtual IRQ with IRQ_LEVEL so the stale pending state is
> cleared without being replayed. This was observed in pci_endpoint_test
> as two doorbell handler calls when the DMA-variant test ran before
> DOORBELL_TEST.
> 
> Fixes: d9d5e1bdd180 ("dmaengine: dw-edma: Add virtual IRQ for interrupt-emulation doorbells")
> Cc: stable@vger.kernel.org
> Reported-by: Niklas Cassel <cassel@kernel.org>
> Closes: https://lore.kernel.org/r/ampndLtU32ODmncX@ryzen
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

MSI handling by DWC cores is a mess. Thanks for fixing this issue:

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
