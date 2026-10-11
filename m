Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C452AD00;
	Sun, 11 Oct 2026 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751128; cv=none; b=V80vwZTQonBonkk2KD9Ab5+2feIfxKaQ3j+TXmq00502g2Sy5Lu9ont+UUc1API0R2qLLLU39FM8J3khUMWo6pRno6GDQa9/X1f0tjQKDL2OWhD+hJk1A1bypETcwl++JGIdG1mg5eR4uYCwyNiAJotgUTbJJzLjYiDgjLVyvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751128; c=relaxed/simple;
	bh=lcHPBSMos0qwExzxVdrmD268Xn8iDGScSlib+TKOEbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Apk9vr7KkEuvsOLbFZ6LAZVTWZu9r89IVJDPjuslmWzsWKGjiQsSO+V9hEKGyKrxLdZA/WEBf9GaefwTC7WmL+HU/URXvej7RdMphOQjKC4CGi47mCjvasIJ/vajLkowldue/ePjHDmZg2lvRq/C3wv63SSZXjQ4o300/SOSk+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhHDfr6w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhHDfr6w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9351F0089C;
	Sun, 11 Oct 2026 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791751127;
	bh=reWRkuW0hAlZFnk+d1VjwTNlztXheRbRR+EBybysZfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fhHDfr6wU3HBez1/wFQeI5uYxDofNlXyRnKB10NELoMxwZf7jvHAXLV9vLjQ0lPXN
	 Xo3CnFPkfK+BpLFwAA6Ljtr0ZFp/Qt5bWBwV3LEgDNIaYj8tEKHFbf47R+8pbHyY6P
	 K72bnMLwPNHTj4/BXHJ+ox+E9tJ8gf8k+XMg/x5xDQ7D+VuKdBo0+kFBNDjp0EXpg7
	 YpBuMv2D5pSBUCRn0Jgg1WUKR1R3Z49J3Wf80RNTlRboiWPUFGUzJErnoDiMGTFR5Y
	 GU4w2zqmwjSKsAsIeTfgVTzgWGfYZPCqf1XwU7jAgQUYLunC2TDSkHu0UdChx0BaL3
	 H57GjeOgPwbdw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
References: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
Subject: Re: [PATCH] dmaengine: ste_dma40: Preserve the LCPA I/O address
 space
Message-Id: <179175112609.604740.2384834135572859219.b4-ty@kernel.org>
Date: Sun, 11 Oct 2026 21:38:46 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sat, 10 Oct 2026 00:58:53 +0200, Linus Walleij wrote:
> The LCPA area is mapped with devm_ioremap(), but lcpa_base and the
> per-channel lcpa pointer lack __iomem annotations. This loses the I/O
> address space and makes sparse warn when d40_current_addr() assigns
> LCPA register addresses to its __iomem pointers.
> 
> Annotate both pointers and the LCPA argument of d40_log_lli_lcpa_write()
> to preserve the I/O address space from the mapping to the register
> accessors. This also fixes the existing LCPA read and write warnings
> without changing the generated code.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ste_dma40: Preserve the LCPA I/O address space
      commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b

Best regards,
-- 
~Vinod


