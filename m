Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065D392C31;
	Wed, 25 Feb 2026 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018644; cv=none; b=tUeO+3th07e4PYnPaHBtTA2vUm80AnOGm21ZUo8xcQfrXhXK0lkoK+x47kGRMdNqGhErQ1n15laZChzlGbwrq8+6C6ivYierdRU2KuU3/Rb+xP7KZ8B+rELO13ktVRpgbomVUABBgTXSS+POL4OnN1FK81U9aTsXfKwzdmnDsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018644; c=relaxed/simple;
	bh=jSczoSALkEfviEOFlNuY2BWP6opjhQVAmR/wSSbgbXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qT1adB77jszwlgwDovqb1pamtb0wro56i4tUp+5ouEQlc3oXATu6ly9MDUB7F0BppZhx8TuY2GGDHNuFSRDDRl+2FEN6y0Me9x97lmeGND338wH6TKyPjhnl7VVAErPkcrV4AYuj3+remu/5GoxlKY5yQaoMN/yieU7FEIWrjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMDNcp35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMDNcp35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035ECC2BC86;
	Wed, 25 Feb 2026 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018643;
	bh=jSczoSALkEfviEOFlNuY2BWP6opjhQVAmR/wSSbgbXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MMDNcp35PyIZHa/T7kY59xi37MBZamkDY4l7byRJ6k9wIcDZYTJwaiRSsaE0NhHC2
	 kV5UGRqYEjy6bMLxuupB5epEh1/3o5Qdr1gQZiFK/i/ubrziSdXWwlnw3DLPI5LeRN
	 ks8ILCazpiorBCt4ySxW4SWxHdi3jdorKOsFbXKUREBY66izZsmWGyp30Ni/2IMs7C
	 a5H1dpOfP2QQJc6+eqWEm8DuvXACRz9MDAiK3THLT4abUWzhhgc5vVOosfvxQ0Ufn+
	 hC5wvYpxZmoAme2O7Bw8AB2mRWWWwWDKAIakFkf36DdeosCuiIb4N13cAmGu634Blh
	 OXs9n/p4MfyuA==
From: Vinod Koul <vkoul@kernel.org>
To: mani@kernel.org, Frank.Li@kernel.org, Koichiro Den <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260215152216.3393561-1-den@valinux.co.jp>
References: <20260215152216.3393561-1-den@valinux.co.jp>
Subject: Re: [PATCH 0/2] dmaengine: dw-edma: Interrupt-emulation doorbell
 support
Message-Id: <177201864163.93331.15342236938596497444.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 16:54:01 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 16 Feb 2026 00:22:14 +0900, Koichiro Den wrote:
> Some DesignWare eDMA instances support "interrupt emulation", where a
> software write can assert the IRQ line without setting the normal
> DONE/ABORT status bits.
> 
> In the current mainline, on implementations that support interrupt
> emulation, writing once to DMA_{WRITE,READ}_INT_STATUS_OFF is sufficient
> to leave the level-triggered IRQ line asserted. Since the shared dw-edma
> IRQ handlers only look at DONE/ABORT bits and do not perform any
> deassertion sequence for interrupt emulation, the IRQ remains asserted
> and is eventually disabled by the generic IRQ layer:
> 
> [...]

Applied, thanks!

[1/2] dmaengine: dw-edma: Add interrupt-emulation hooks
      commit: 2e8726879559144b4582fa059780e452b3a1ad41
[2/2] dmaengine: dw-edma: Add virtual IRQ for interrupt-emulation doorbells
      commit: d9d5e1bdd18074ea27985c777ddc3a8a0b007468

Best regards,
-- 
~Vinod


