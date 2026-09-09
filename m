Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F365476D7
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956708; cv=none; b=khTbyNH/HEVnYdLkhfIB/+Sk7YytIlQItxzg/rEkvAs9Xl6vG4fqtxhL5asy4Iuy6VWVPGXRmaSI6X7cg+xWPa6bqqz9pnNDgGG49kBeIRERn+8D7LDG3S6EXHJMUZKrHgJbMehr4BwW0b222THuoG1euRnXz4nr52WJ9yzjcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956708; c=relaxed/simple;
	bh=yXJuTs2uVsx6LsTP9c7zQvEiB1jsC3OOUVhxrQUTVpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNGJ+ktHqfqXSuHHQX/qyfcPsd2jPF2MP1/xb91B/VS/Gui2NotKRPCRBND26WIMIYRH9W6ly0c950rcGtJYt9zWYqjJ5qg2pT4jUg8atQm9kpLKhy9o3IA4/9e9P8h9OBGQvKAh745T/7qRXalFTV04NrkG52q5ypa4ItaQN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJZiUblC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJZiUblC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358871F00A3A;
	Wed,  9 Sep 2026 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956707;
	bh=0SQQtWIkIZDC2011m84iMIIDzmrUsKcCzn55hMdNjMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJZiUblCsDvQzhOhAKSeQvItY4tExlEM9mMPM4TBrWIX+YnpXInjoJQpMHMIrVSNF
	 TZ/b/SlcgZ4nuPgXEZpCJmIntnSJKkszoogE2RFB+MA8EUA5n8r8ae4vIX2it8zYiB
	 y7tK5T7X8yrrFeBS5N9oceOIFXMi+24U1jR0CyMMLjCY5Ky6ihn1XfIqVhp/xB5ClT
	 cEixY8NaXaLPBu/Vx1y1w3YksTsqc1gRfNR+APCXrMqn9NpZbKm4i7k3fJ06Gq0NzT
	 IzN4scrBvoM1ViEv3Oq2RC+ldqN+pBDYZaGRue4DrNtqa6mEcEqECwAHxW0f8qsQLk
	 4nEbqubgmXApQ==
Date: Wed, 9 Sep 2026 17:55:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Li Youhong <dayou5941@163.com>
Cc: Eugeniy.Paltsev@synopsys.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Message-ID: <aqFQHtOhhPOEmh8E@parshuram>
References: <20260903015438.2514100-1-dayou5941@163.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903015438.2514100-1-dayou5941@163.com>

On 03-09-26, 09:54, Li Youhong wrote:
> From: Li Youhong <liyouhong@kylinos.cn>
> 
> axi_dma_resume() enables cfgr_clk then core_clk. If enabling
> core_clk fails, return without disabling cfgr_clk, leaking the
> already-enabled clock.
> 
> Switch both clocks to the clk bulk helpers so prepare/enable
> failures roll back automatically, and update probe/remove/
> suspend/resume accordingly.
> 
> In dw_remove(), check clk_bulk_prepare_enable(). On failure skip
> MMIO and the matching disable to avoid unbalanced clk disable;
> always continue with IRQ/OF/tasklet teardown.

Hey, this doesnot apply against current code, can you rebase and send

> 
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")

why is this a fix?

-- 
~Vinod
