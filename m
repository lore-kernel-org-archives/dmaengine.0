Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841D14EC66C;
	Thu,  3 Sep 2026 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452974; cv=none; b=F176fHUPTmJYibbI8ptdrr9qDdvdi4UwQm0OIIjtp4BRjEj4Wt+2CfOpMgSiF6YgZeAwYTy6j9FuvBeuaU75xhvmqoa0tFhAPtL4q3406Odfd4+rT5vBMV2UIQ2SxtPzVcTTpbS/KXSq5Lhm+VBpCIKIJ+H8UX8woi3k8nziW0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452974; c=relaxed/simple;
	bh=GHdMxXhpt/f2xcL1eGNyB4/iMa5i1iZwnf3eipotpwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=INiuXaNKHNYG1uyrlay2HGiSmRTjyslJIUJk/N01TvO5cUB+eSe0pasHs9bC+45w7Z92QAep6ks4q58Sdx7BMFccy/MZs8Tn56gbAnqasbpwlD1xGSnpELIVF6J6KWx7lIRLvvpWcgw+biONpiZLRonL/8RQfVxZO4aH7Bcn480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4Dc7aDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4Dc7aDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB911F000E9;
	Thu,  3 Sep 2026 16:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452973;
	bh=LRMNrFp5oyG03PXJEJtG731mEFzWgSM8xfjF3tnbMsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g4Dc7aDz2FYmVlEsJCVpdUuO1Bjcy5LYXAfOEujr213p/vveO6i/fBhQJsGCk9bJi
	 9vsNPymhUGIhFddu3xFzvEN5ltyPjm9bn6x7YpPl4H2HwPkxfCbQCLzENhnE+LIz8u
	 ulaPzW1SUWYNAN5OQGy1jT7fIgT/l/i7tW9+/RWQcnhXE/i4qidTrHMrHzMLNQktMv
	 3nnZ/hhelqpwBdsGn5fFMiNOeIXzFof3e2GkoLvMGILlyok8BI2c1eNEtMRNQL5KFA
	 y32DKj1kOCa1S8VQTXpDRNXlu529uDPrDc13Tg71Mt9rRBXU2kmZnSTF9XyBgPtL+j
	 UtKjQVb8laggA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Frank.Li@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, 
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260813153149.3953497-1-ruoyuw560@gmail.com>
References: <20260813153149.3953497-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH] dmaengine: sprd: Fix runtime PM reference leak in
 probe
Message-Id: <178845297038.1679748.17132954988792576970.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 21:59:30 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 13 Aug 2026 23:31:49 +0800, Ruoyu Wang wrote:
> pm_runtime_get_sync() increments a device's usage counter even when it
> fails. sprd_dma_probe() currently jumps directly to controller clock
> cleanup on that error, bypassing both pm_runtime_put_noidle() and
> pm_runtime_disable(). This can happen if the preceding unchecked
> pm_runtime_set_active() fails and the following runtime-resume attempt
> also returns an error.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sprd: Fix runtime PM reference leak in probe
      commit: a7df136ec529ee49a789c5029bc37b98b0d4bedd

Best regards,
-- 
~Vinod


