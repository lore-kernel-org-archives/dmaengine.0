Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F18849DB90;
	Thu, 10 Sep 2026 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049425; cv=none; b=RVAV2iyzsy7fnhOlHNjU1JAmdYTfqmi4Ym8M9pHViSDYRC9BkIVNoAAZi9EoFl3U8aZXAmy9oB4wmN8r6IeoM6ySfumgdPQVQPib59aahHDony+dB4mT3kf6QLoudtUlIu5b9KI+cHr9ZfzsBhxEFQt67jVoFXd+kgKfKbg/7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049425; c=relaxed/simple;
	bh=AJduWVtofwtd7mTaXC2bW0nPaQYpVWvRPHMl1F3FeAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fVqtPqg2ZKRLDgk8+5/KF76Bx5LHFValenFewrQB9PL616Aa+oFE0cGaRp3v8Y09mcA23XuyudgISCNYIsLWpjvVTrOL0RDDCQtZ1WVqd91hI5QKBB31iW4Y9NAlE4mkJhrv/PFLYyhwSNw5YVaRh8nPo0ZfXvA2/1q5I8Oe/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFJoUm0E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFJoUm0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DB81F000FF;
	Thu, 10 Sep 2026 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049423;
	bh=qRvm5JIYTkHUCSh7fZellD2+/+cf8iqHWu+VCImblvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KFJoUm0Esy5Get1gN4OGl4R4cE7hkuzet5VVheE8IpllzL2Jn9zlOCDye40HwCJEP
	 ZwqBYMS4T06AYxYxHuIqaylWgYQYOuUm7uamwmSnfI4r6DE1ym+Up17VGjr4mqZzn6
	 3kA7c2ndrqUMuT4AZLknOSJX0c764FobxEuOLE1XO/SKxQnCUvBOnWEKTgUoV9uZA1
	 hHjkC6pk5SbEBENjDvtyXT327L6rAZ/f6Xhv2rxzUF0DYxHu5fq1rwCpuytdYZnxIB
	 tGWMR+AZIVe/QPvbtG9tZMN6NpTdQDusNYU2X33XSXP2gL4F4Tgi9/26QZsjXa0Y+/
	 qKFUb9HHoBCiA==
From: Vinod Koul <vkoul@kernel.org>
To: frank.li@oss.nxp.com, 
 Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Frank.Li@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, 
 zhang.lyra@gmail.com, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
References: <aoMfW_TVbzkuGZeU@SMW015318>
 <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
Subject: Re: [PATCH v3] dmaengine: sprd: use clk_bulk API to fix clock
 imbalance
Message-Id: <178904942062.118320.17575916116147698499.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:20 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 19 Aug 2026 05:35:18 +0000, Chaithanya Lagisetty wrote:
> sprd_dma_enable() enabled sdev->clk and then the optional ashb_clk. If
> enabling ashb_clk failed, sdev->clk was left enabled: both callers
> (probe and resume) treat a non-zero return as "nothing was enabled" and
> bail out, leaking sdev->clk.
> 
> Convert the driver to the clk_bulk API. clk_bulk_prepare_enable()
> enables all clocks and unwinds them on failure, and
> clk_bulk_disable_unprepare() disables them, which fixes the imbalance
> and simplifies the enable/disable paths. Both clocks are fetched with
> devm_clk_bulk_get_optional(); the optional ashb_eb clock simply becomes
> a NULL entry that the bulk helpers treat as a no-op, while the mandatory
> enable clock is still checked explicitly.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sprd: use clk_bulk API to fix clock imbalance
      commit: d09cd5e8bbc98969b5333015b45c525078ac0f6f

Best regards,
-- 
~Vinod


