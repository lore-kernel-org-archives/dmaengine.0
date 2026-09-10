Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B2B4A2610;
	Thu, 10 Sep 2026 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049430; cv=none; b=ETtYSoFVyLaiCY6YSF1UdbMjxL9q4mKhjAHBcr2MdWkcOf8EFHYR9wvMMR7WdjFc0XxnCkVTgmBuT1luSmQpYFdwPR9ekEpn6AjHznBEOg3AfYspEockUxgpG3dqC6KtSicqhNC5n/1J9Cd9uccP3o2373Vf4kqSWTmqaQg7hKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049430; c=relaxed/simple;
	bh=emSgHe+KUULbFdnjIwLocSiv7+E4enOzQ6mFsNTrF6I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jmzG1m5Xa9v8oEO6Ppt6Cu42l2mEoZdDUFGXOM7BqjQYkS6TyiGoDCdkMWEoLysuyU4vkjGyzZGwF4extFZvpiOhnyPoYbQeQFhihPq0zqBCLougJItMyxoPdgnpy7g6CcnLD2kw1yO8uHEPJJr5PI61f2XJq5caV3YiRD/e4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw9atBS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sw9atBS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C351F000FF;
	Thu, 10 Sep 2026 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049429;
	bh=pAiDO77QQ5JNamtieOGuTO2Mfd1IrGvCOIw4oOK+YqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Sw9atBS11YWFM891TkjcNx/7NrsyQInByEtQBlVW+VSbncq1fEHeRK01Pt7KxhSeK
	 55ZBKkgCaoOsmDg77TUhZ+FEJHkGcEE9isivB3fynSoUrJZBZk7Ke8mn1Zn+4RHCzm
	 uExH44iX+MY95mYlr7tGCk+SjvCVkk/zRk2L7iVcavrS6tfMuhNdJ6/e/TZ+gxnQsN
	 lgqZuFfqX2CLbSoig7M21i7F5LjjBNir+1AHa8IOR5DHICfoKSFwQevcArgltTp6Sb
	 BwtGnRiPY4rXfbilZs+BS6Jh34lAzYjEtEhh2Ers24wN1/jiZNZpPdssccONn1VhVx
	 fi3VI4+t82u/A==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Harninder Rai <harninder.rai@freescale.com>, 
 Xuelin Shi <xuelin.shi@freescale.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260820031654.28450-1-rosenp@gmail.com>
References: <20260820031654.28450-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: zero CF descriptor pool
 allocations
Message-Id: <178904942676.118320.14801400250683856639.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:26 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 19 Aug 2026 20:16:54 -0700, Rosen Penev wrote:
> The compound frame descriptors and embedded CDBs are allocated from the
> cf_desc_pool with dma_pool_alloc(), which does not zero the memory. Only
> cdb32, the gfm coefficients and the frame address/length fields are
> programmed; the dpi_dest_spec/dpi_src_spec fields in the CDBs and the
> rbro32 field of each frame are left uninitialized. The hardware reads
> the whole block (frame 0 length is sizeof(struct fsl_re_xor_cdb) or
> sizeof(struct fsl_re_pq_cdb)), so uninitialized heap contents are
> exposed to the device on each new descriptor.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl_raid: zero CF descriptor pool allocations
      commit: 26d48e9fb6997f4026dd86daecf8d2c12258f698

Best regards,
-- 
~Vinod


