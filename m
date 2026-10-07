Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992843BE63F;
	Wed,  7 Oct 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370947; cv=none; b=A5U3iwoaIGfqGNlj0t1ShISIX9n4+FZKuRc88Pfyeh+PeIW4/9f6K0Zx6NwgA8m/NKu4fgJon8P/Bbi/osfUgDYy3ay/uQAtwMtVDQhXGp2uTgj5jfG7cELHIPUAZoe+hhlw6Oj7WWf6dqVjKnTPecr90RvebgwYFMeiwFVmfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370947; c=relaxed/simple;
	bh=n1YSL+9MvnCqYRCO+mBTtOPH+hf/ShCBLDri2w21VDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KczOyc0RPEt0XNKDVjZbhiMZYDczF1vmLHZ4GLPPeg8xM78sMV1kfXqOySmQsvqu597o2ebx78vIFhKjzK4+1OrutK6XY2FCfcVsDzStzBfjNrmxI4D28QePTWVa/bWH6DhcsEl3WyIfOiOZ+ZcDCFka6Lnb/9rd+cx6Q4FzJWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtteQr4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtteQr4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D2C1F0089C;
	Wed,  7 Oct 2026 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370920;
	bh=pHuAiEYEaiOaI2fwpbIiriUo86nH9tk/GcCE4KPDgmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KtteQr4w+uYpjAIKWJbn7nsJmfSmNF+392yUGpMjtNdQNu8G/eLxFM8p/HjQ/6kes
	 sxfoYzewoOw6RO+DqRIWPaK3jL14vP4p69lZQVS93KzXY5lZF/6MgHaW9l4rpPbRAA
	 q03BGNdzhqRDgSfM8s2br51nA9O4qrgchIvuRpLmHfI27pO/BprRRKSIMROKbQpM0d
	 HER2eaMnSN1czo5e/mEAuXh1CIbrpTtl3BbmzzMFGum2rEJS2rmj24zXcaGJ65cT3c
	 /MgRBysN4ZyCqX3abFIgKeXu2APJR8OTxbyi6XwqQFWpsMN05v0lAzwKpU66Um1cMg
	 41cys/74eRHNg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 sashiko-bot@kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261006-dma40-fixes-v8-1-b0aadf804793@kernel.org>
References: <20261006-dma40-fixes-v8-1-b0aadf804793@kernel.org>
Subject: Re: [PATCH v8] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Message-Id: <179137091832.420596.16161126087831129631.b4-ty@kernel.org>
Date: Wed, 07 Oct 2026 13:01:58 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 06 Oct 2026 00:40:17 +0200, Linus Walleij wrote:
> Fixed logical channel allocation scans physical channels in blocks
> determined by the event-group layout. When the requested physical channel
> does not belong to the first block, d40_allocate_channel() returns -EINVAL
> instead of checking later blocks.
> 
> Skip nonmatching blocks so controllers with multiple physical-channel
> blocks can allocate fixed logical channels from the later blocks.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ste_dma40: Search all blocks for fixed logical channels
      commit: 15728ab23d00b19013a6cf5f8ed28d4f2ee5410a

Best regards,
-- 
~Vinod


