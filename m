Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B34A43E1;
	Thu, 10 Sep 2026 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049443; cv=none; b=SNsu8sSVz8PPNhnulnfLSCy4sUOA4JluRd8bc+tuvTS9cPkqAMyzBmqVT8e4+1ewAka9R6v7cD8iJuN0X4X/lJ8q5mKgLPXcSKot2WPO7ipFcpl7Qof/RXIUoYHXNN3h+uiUhtlkLh+ZBrUcNwBlX98O/z3DhMSIn7K6GWGq2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049443; c=relaxed/simple;
	bh=uVRKTmxSSNoNsRnhFeWuu9W5cTQUN6Rrsk0/2LKTgl0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s/oPgG19IH43A5PZWICdAiRj472mrxYn3gBC+0YXF/7rSdME2k4UftLix2aOJFwOFZ9cFcGFE7OmpxGJy7Svf304TG/Dpfn1MKRwCN7ZAKRs8XR8rC+5IFQrxSajg2aU+ss40m/T0i9/HDQvYOPSMThcNfGe2T4eWVOPwEwGCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMdodQ1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMdodQ1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB471F0089E;
	Thu, 10 Sep 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049441;
	bh=ErE7tDa+XostGKGYrYQDSr1XJZB41j65/FvtYsW7unw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RMdodQ1PD7WBEn2D7VgXFZkJ2XuUgSjVSTbxRcfHYz46WA5zV2gYJMTRBMly2EE5i
	 /l1GXXAe3zIrU3Z2GSt1syh/q4/xig+nj9fkbv5xslra+jsuyFA2mR5Z2SysmtN+dL
	 8XSIqnf1UlS9PlnUJYE5JGNbLKFaU8Nbe7dWt9al124P0jNx+UobJDIt+4mFwdocmZ
	 662hchPW85W+7bnqiQmD8TkOl3a6XJ+EE1HFC4nHG+tevv338vGaAmno1PnU1sFWzK
	 tp/NnqH/6qmnWEWASWopSgejN0Hr1D5NSQ8VM5HYkf9oprfwXKWRWeikVMxAp68SwV
	 x7lXZ3925pnJw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909234924.103418-1-rosenp@gmail.com>
References: <20260909234924.103418-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: return descriptor to free pool on
 io_win failure
Message-Id: <178904943964.118320.2401943102810826405.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:39 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 16:49:24 -0700, Rosen Penev wrote:
> When mv_xor_prep_dma_xor() allocates a descriptor slot and then
> mv_xor_add_io_win() fails in the source-address loop, the slot
> stays on the allocated list and is never reclaimed, leaking a
> descriptor resource.
> 
> Return the slot to the free pool under the channel lock before
> returning NULL on failure.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mv_xor: return descriptor to free pool on io_win failure
      commit: 5d5f4b3407d6ec86e76d094c332301135f493636

Best regards,
-- 
~Vinod


