Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDAB312836;
	Sat, 17 Oct 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230962; cv=none; b=L4ot6xfoc0DiJr3G/GRwd0RitRbljUcmtP98T09iYGNhVLuz5HpAwKVZc4Q2I/R/BQfxHwr747smitFIy8vGGgmlt+mKwZUA/dGBseSbUmOkXD+YsfJ9ZynyIH3fmUd2Fo1HGTgQqsDJ+PNAw/mrNNrUHdUqTHe/dqFN1HY5qe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230962; c=relaxed/simple;
	bh=TqyObOnxnEvwfk9gL/Bw+P2vELIJKPK26mvPJd6QZE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JBe8BclseeDIdI9bZ96cqdxNPGvRSVXItb5e+8l6876W+DnshnRyqcuD2vcVqj/zZ7IkKw1Kr/2wnOzq0O4EQ9pCntTbHdTFoNeRC1IZWrLDrLuUaIgnPAFBfbgaUi2tI2ScBxePZkx4EOgO9AKiUc6RivVpKyvMLGCOoeq1zp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axbJsIY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axbJsIY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6C71F000C4;
	Sat, 17 Oct 2026 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792230961;
	bh=TkCfXjStqGW2jteRUK095mzfOnn48uimDZyVFl0o8ZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=axbJsIY/VuqAYJQYbPV3Rt6qYcYOrghbmItDrJa8rK0OWqnAoitTZkpAfVTE/J/0p
	 VB3Wxg9bTo0ArW1Eq3jVc3Xkl8EEn0BK3a0dnKgqJwiB09d6yHh9Bza0PJvjRstA/U
	 Rl2gPeuAwzNR2elXdL/j9buF703lAnhM6v4F9u5nAfRpOc/et8UWNX4gjQ1Po/a8Yz
	 s03FPBmPKm/FKqo16mHMBxveA5SWTX+eD+DCtWQVJKXCy7/p7N/dhWKQHuIpdA3j05
	 1s7sXxIOE9oKTbGnXYwH6Pop56ogcXI5f/0vaJXhCNVQRqI+Y4hT3O1g6sFAP4kSQA
	 a+ajdQDwxoKlQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
References: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
Subject: Re: [PATCH] dmaengine: amlogic: Fix regmap error check issue
Message-Id: <179223096443.840866.16372529405826771559.b4-ty@kernel.org>
Date: Sat, 17 Oct 2026 10:56:04 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 16 Oct 2026 03:00:17 +0000, Xianwei Zhao wrote:
> The func devm_regmap_init_mmio() only returns an error pointer on failure,
> Use IS_ERR() instead to make the intent clearer. And Fix the following
> compilation issue at the same time.
> 
> Smatch warnings:
> drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'
> 
> [...]

Applied, thanks!

[1/1] dmaengine: amlogic: Fix regmap error check issue
      commit: aff5e6a77fc69a7c490246465940d18422d7c631

Best regards,
-- 
~Vinod


