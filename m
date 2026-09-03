Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B14F55B5;
	Thu,  3 Sep 2026 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455067; cv=none; b=R9gbZVNflELJt9+/ZSc2FpmCGj6flX6ndYYo4wXQFYzK/kuXR6CTbiVmwceUlCaIuHZUMXrYocWb5zAuLWoMKxL+9aA4UhFjq2a3OC31YHIAiQLkgu53o2c+F2i00hI3vPrm1m8C+ed18ov3dmwRrtb47mCQC05zkTXyWBF2ehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455067; c=relaxed/simple;
	bh=SKOofuwKkbb3idGCYZeUQBfCYmxXq7prv8up4X9kDa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XNgTXPzyKKmH/dQ276toQ7dicDlW8vos/Ue0ls+Fd4LuNbnTTKmAhAAj2DxrrKo+bdtZ2L4c+eIlJauywTLCLcA0+V9dXy9X+Ikba9qFbAL01oyay01m2BgDQ5nUEYP58lbC4yNUjxBsCA2QWJqG+9bNRCMWD8n+glcaAF8JVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFsxd7Ir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFsxd7Ir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858611F000E9;
	Thu,  3 Sep 2026 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455065;
	bh=PV+XTjhAg0kw90qkSCdaV/YQqHki4aLaaXaINI4UQjM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IFsxd7Ir84CyaRSQGGWuTESVTa5Bzm2MsyRv7Z4OAdeGybV9IhQnuqNbwA4XC3psr
	 jb1n1vqfR1NJKWyDJqXVIcEbcw9l5IegmL150NtVg8wPCrcGf73Zk8CPVnOQfMZd90
	 RIpy4MYoCG7gNZ6GVFrxziWhvDkKEP85gu6ZSi1azG9r6F7aPq66UimHpNXWIeUmS6
	 O8IyYS/zEw3IN80VMjQzb63AzC4ijqzNkFNb8ngFiywgfbon7TnPuWqONODe/uMEXe
	 FNKpj+e3vJjqAjKjHJw9LWagFLaVWuazgMGyLuB/rgBS7573QUggnzfIDsCjPoe0HB
	 RfDyegaXtDUww==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Harninder Rai <harninder.rai@freescale.com>, 
 Xuelin Shi <xuelin.shi@freescale.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260718053010.3074329-1-rosenp@gmail.com>
References: <20260718053010.3074329-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: don't invoke client callback
 under desc_lock
Message-Id: <178845506309.1711546.13763967844499804503.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:23 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 17 Jul 2026 22:30:10 -0700, Rosen Penev wrote:
> fsl_re_dequeue() holds re_chan->desc_lock while calling
> fsl_re_desc_done(), which synchronously invokes the DMA client completion
> callback via dmaengine_desc_get_callback_invoke(). If that callback
> submits new work (e.g. fsl_re_tx_submit()), it tries to reacquire the
> same desc_lock and deadlocks on the spinlock.
> 
> Collect completed descriptors into a local list under the lock, then
> release the lock and invoke the callbacks before moving the descriptors
> to the ack queue.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl_raid: don't invoke client callback under desc_lock
      commit: 62c267ce97444f8a381f2bb3cd5d534eb362c540

Best regards,
-- 
~Vinod


