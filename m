Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6021FF2E;
	Sun, 19 Jul 2026 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784485990; cv=none; b=ZQnsjIG7kCKOUCD3hqptbJj+SZuKKieqPKIASYj8kqYwyGbscAHW3VDMlsY3ucTG5eSKNDYVOFlSeb3/j8PVdF55q/c9e8gE26IKdzyIC4f0a9Yb9BZM2BD2ch0sBSbALZsxIiLXoBmy9tIxohMHZks/Tmpn48gpEVlJXTcCJ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784485990; c=relaxed/simple;
	bh=zxFPwRk/+w4fiCQ82nZl51rK5pr2JoKaB182mWLb2VU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rhF2BotjAl3AFT/KCbt2SkzBPkmQRxXmK8rancVwqowR969F/d+yFeoaN915s5gzx3KvFMvaKHN9OaeZ1NQ5z5LRbsEpH0w+Skcvd0aI/l1AambnJPPkjSI67pkqwYqxZaYtSzdooF4d8JJQLc2J4BiaOoDYX4NolEesDd4QnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAjoeJqh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAjoeJqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAB21F000E9;
	Sun, 19 Jul 2026 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784485988;
	bh=7Z/EjemJzPUh6s553jnRJduk5JDbIRmGPX1LAv16sQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lAjoeJqhV2TvEAaVwrk4BywWkmmEd+vRcWnE2ETcwMaWCKcxfIrY+c1AHiS1FLlls
	 fPaunVUC9xzFzmfsDMRAG0SWOMaclJye6sgRnTB5XO5l5ZpbBflsUzKaSHNBCuEyRL
	 7sbB11opU7cp4ftXNVzreUakB0/EeHbd26Aj+Z2daGV3PMXr4B/QKz/XAbBxbDlxeP
	 av5MXda70E9ERzNCsqErWiN2m3U+zEwj4qGlnrg22KDF0UUHtCXK7LJ6Dk8BjZgI/D
	 M650+BhIdk6FB8y93OBSlTJm9NYuxa3IqEh8/loDm74iibRK47Z9d9EtUSp3fbplNw
	 rK5fibqC8Fy3g==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Cai Huoqing <cai.huoqing@linux.dev>, Serge Semin <fancer.lancer@gmail.com>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Koichiro Den <den@valinux.co.jp>
Cc: Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Subject: Re: [PATCH v4 0/9] dmaengine: dw-edma: Fixes and interrupt-path
 groundwork
Message-Id: <178448598578.1267529.4032933142249960015.b4-ty@kernel.org>
Date: Mon, 20 Jul 2026 00:03:05 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 17 Jul 2026 00:24:54 +0900, Koichiro Den wrote:
> This series collects dw-edma fixes and interrupt-path groundwork, mostly
> split from v1 of the "Support dynamic LL appends" series.
> 
> Most v4 changes address review feedback from Frank and Sashiko. I also
> collected Frank's Reviewed-by tags.
> 
>   v3: https://lore.kernel.org/r/20260715175740.1110404-1-den@valinux.co.jp/
>   v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
>  (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)
> 
> [...]

Applied, thanks!

[1/9] dmaengine: dw-edma: Fix HDMA channel status register access
      commit: ef1b080e03acc83d5bde841da67036985acd50dc
[2/9] dmaengine: dw-edma: Terminate all descriptors without callbacks
      commit: 99109a51efd28c9a661fbfb9469b023c517b31d1
[3/9] dmaengine: dw-edma: Serialize abort state updates
      commit: dd80e259f65d932634e26d366570d71669ef6654
[4/9] dmaengine: dw-edma: Complete descriptors before pausing
      commit: c154060016a9db2ac889bfdb0a3c1322f9be8ded
[5/9] dmaengine: dw-edma: Serialize channel state checks
      commit: f7d1619f3e10c619b62c6cd6d95371b5c526c85a
[6/9] dmaengine: dw-edma: Clear stale requests on termination
      commit: c0d9c6275adcca7c0ca5f4270bf88026f9864bd1
[7/9] dmaengine: dw-edma-pcie: Drop redundant pci_free_irq_vectors()
      commit: eb4022c1fae2bb029178779bc2b1fe84a9510dbf
[8/9] dmaengine: dw-edma: Snapshot the v0 interrupt status once per handler pass
      commit: 5b0a8818fc5237676bdcd9659180e1edf8e943d7
[9/9] dmaengine: dw-edma: Defer channel IRQ handling to workqueue
      commit: 35de39e4511f00a87f814b5f0afeb082a8fbc5d7

Best regards,
-- 
~Vinod


