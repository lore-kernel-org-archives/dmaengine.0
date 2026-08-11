Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51903E2ADF;
	Tue, 11 Aug 2026 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474337; cv=none; b=a84+0DLa26qAf3MJDjmEuaQV+suZqV93xTGXghV2a1CJ0WEbpWNJGVC+00DCbKC6aTvF29n5cfgqhpGOD9nwezjDfIPyEpplZVrcDcKjom7BChgFcxBbKibGKI13oZDz5GopjKoscGopseGZzxVIng4qDJbxyRoMxszuq2eke+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474337; c=relaxed/simple;
	bh=zaU4omkA+nHWFR2rQUdaFQWbVMYuk1tfeiYbHRe7dXs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c/hjL5LjnrVd4ZcX34v+HeItZD1RtYb3nPwXumQ06UIJ+SDHcTy2fznz4jWG674XasYWxlJKfcNbIn7h1+qBGkiJULS+0zYyOa84Rr08Lh0BDOeaB7Bc80v0aeSlARP05Q0IkBXN0kgQm9hnVxIOoO4I9zVGCowsOBh94MN1q38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q37gr/bc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q37gr/bc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C178C1F00A3D;
	Tue, 11 Aug 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786474336;
	bh=DfbEBgPG5NzSwKbyGKiPlrHFzhe/gLJGThxh9aTj2UE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q37gr/bcSKIg3lS9NxlHqf5gkv4YktvfMTZuNKOqwZDQAEc/tOpQUI1etsO7sOfwT
	 ixvdb6WsjIcDs+Op7g9ME6WN9n1vTOOHc8T4DIujCMFANwcImxIC1ba2lMiUClLWO1
	 St5D44RXwJ8+9FdQP5IFi+X+M/Wp9swKw+31Eg0pASC5ctr8zjXaU88PLmykfhwMwS
	 TC8aFgzyYm9dWj1tc+5Rq7F/sCrQC8b4ck9ws6bgtVIi+Kpvmc3sIV0XuG9iXcQTOO
	 kfF6kO807kHDai1okeliDS2qp5bvCGYV9jqDlVNljhlZHix1KTrPlt/DBE1kjEZv/N
	 119OTuLI2DvCw==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Koichiro Den <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260730160701.3550710-1-den@valinux.co.jp>
References: <20260730160701.3550710-1-den@valinux.co.jp>
Subject: Re: [PATCH] dmaengine: dw-edma: Mark emulated IRQ as
 level-triggered
Message-Id: <178647433438.1113716.16199804095421718813.b4-ty@kernel.org>
Date: Wed, 12 Aug 2026 00:22:14 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 31 Jul 2026 01:07:01 +0900, Koichiro Den wrote:
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
> [...]

Applied, thanks!

[1/1] dmaengine: dw-edma: Mark emulated IRQ as level-triggered
      commit: 0d995da5fb97e8c312834575604d4423eb6225b7

Best regards,
-- 
~Vinod


