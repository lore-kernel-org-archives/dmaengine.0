Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E225782D;
	Mon,  6 Jul 2026 22:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376957; cv=none; b=RHi5K2LOyd/hqnbdyvguPs1l9Ay6JEicP9IEPh666TLEfilDNpE4jxDQkwEPW/vZKiKRiDxnLIXRCtKgcGa/KR8azT8amh81zjrTGnC7zyFJN9zHm7IKo9Gy57Z90vPn7VSYjOXTEGpGAFEbxxTQiq+lJYjtEb469Fg60S1GwQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376957; c=relaxed/simple;
	bh=RNYHsdS28HPuySSWvP1Yyr5i9l6ITmxkysSASJfZwD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUzMG0++WkJG1I4oyJdaL8JTw3bUVkVskn5ysR4Ha55KEKZJ02W3K68XA5+1D31D6Rsdxs3hZJWpFj/V8U4vPF/+piYVPcA+i5caLdMTGqtGaqv/9IqOZcjVyP98uXpizqzesBJ/cvRIG5ac7PSTKWLy14W8lIX0PRM4KGHm7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1CpuDRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1CpuDRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CBD1F000E9;
	Mon,  6 Jul 2026 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783376955;
	bh=NIKhsdKujmUyo5f1I8e0key9LsLGYc70ehoq2AKl2uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G1CpuDRrdmcEC3wEPp2EVGqS3HOURCh2yKP14x2Er3LIpE0Tkc0mbAgDMaBJN5W0X
	 181F/jwiOAN1KUKl7d8Tt9eqaXftQp+0szy8NqHpE4ZGAN+l6ygxC6pQRp6QD4Qi9b
	 PD+cjXv5G0p1b4RhnU3thcwBP/tAEKulVNe+MkjBA+OskiUYP4gz5Af3sxvILh5i9y
	 NSaJwEybJx+Cmcj73mmLNBb+CZKxXIwmgW3FpsZ9uRWTaj3E2yosi1DEV/TEJrrTx1
	 sRsIQcEh/TffxG3kOyZY+Vh0qjdF+17MokOULQIjZKL+OkpTJomQieKfasUeuzHmUS
	 qgxzLhRCrca0A==
Date: Mon, 6 Jul 2026 22:29:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Message-ID: <20260706222913-GKD35811@kernel.org>
References: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>

On 01:07 Sat 20 Jun     , Guodong Xu wrote:
> The PDMA request numbers (DRQ) are fixed values specific to the SoC from
> a hardware perspective. The detailed definition can be found in K1 User
> Manual [1], Chapter 9.4.3 DMA Connectivity & Assignments. Add a DTS
> header file to define the symbolic names for the DRQs of non-secure DMA
> peripherals.
> 
> Convert the K1 SPI3 node to these macros.
> 
> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
