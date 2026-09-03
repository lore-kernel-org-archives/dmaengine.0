Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D74F647F;
	Thu,  3 Sep 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455097; cv=none; b=B9s2oATaca+GWHOrjcfLa+rrjbN6OMAmDBYIKReOYsMtMwqZnigMPUNMLEAzzJzZKaQCcadxYBdlh/Wafm1BcsDIdS80CfQjaRxLtHdDhCfmjEPq/leHOKX3aIfPggT/eN4YdRW/vUORNrSIXf32JRFbrUPl1s/QwXEWWSLkbP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455097; c=relaxed/simple;
	bh=LzG1gTIjJeOWNjoMgrbmHuIiUUsxXoPBLQ/Jl1vtNa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qqJdy5BjA5z+zkoe2CSnvZTjYnl/ZLgSLw/B+hoYdfsYJBFxjsa+52hTSA4ll9XFQpRg++kOhp+Pe7fHy4nJSKBm8hcmj4zxO6yFXiDnVwcXkRgYVzNSjq8DVj669XeoO/EsgYtRqiJnLvJnma0YZVaFz1FwBnFp9w5XVGAk5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBTQZtzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBTQZtzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339121F000E9;
	Thu,  3 Sep 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455095;
	bh=wFQh8fOfETsrW69vOOjUQvO4A/piFS2eM2eusnqqIn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aBTQZtztLAWAr7CxLgHUbJfDLpXCISC7w0MHG26Ftvu//QdMFdWlNO+vBPmz9FgpS
	 hGxhXUt2oyYyeVIp44/ykQQZV0IPAEHy8LClFgADTJl9YrV+EVt8zVx7caMnTmj4Zx
	 sNd2GwBD0N8EZUGvOgWYZl1TxS6CffLTCN7cGFB/ofbmCKv12o3nj+Pt69jVYGsxNw
	 Ghamy7xLj0MUNXK2+uKEBBRkQOTMpeLHdmnzFqg3x/2sE6aykzDUnfpBU4xoJ9UheP
	 XcFZXh3z+TbkAFXHWWLAFkQJolXrrgrpahxrQfqEUP7Aau9zKdxiXTBA3eGW7rDn2a
	 hiTqvgn/NKqCg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Frank.Li@kernel.org, ed.blake@sondrel.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260813153143.3953303-1-ruoyuw560@gmail.com>
References: <20260813153143.3953303-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH] dmaengine: img-mdc: Fix runtime PM usage counter leak
Message-Id: <178845509375.1711546.3886618816582313442.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:53 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 13 Aug 2026 23:31:43 +0800, Ruoyu Wang wrote:
> pm_runtime_get_sync() leaves the IMG MDC device's usage counter
> incremented when runtime resume fails. mdc_alloc_chan_resources() returns
> that error to the DMA core, so the channel's client count is not
> incremented and mdc_free_chan_resources() is not called to drop the
> reference. Repeated allocation attempts can therefore accumulate usage
> references and prevent runtime suspend.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: img-mdc: Fix runtime PM usage counter leak
      commit: d8dfd04faeb9b49663bd268090df5c7df6bdbae6

Best regards,
-- 
~Vinod


