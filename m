Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E84F475C;
	Thu,  3 Sep 2026 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455064; cv=none; b=qeTOh9biQnJUrG/9GmyqdCZ0ZT9e0nxuvaJyLQLbe1KiP/Yn9w4AncCWV/eKKIi6XQmT/t1U0Tr1XYDVdCDDAncf+Mq3VTPlBSJjCHmolSm7xQC67z8iAykVrN2l+SRhlKxTDEYaiIRfuNvRSTH7lgmmB0Z77wTdNJ3k/PHEqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455064; c=relaxed/simple;
	bh=na5JSg+85vJaB9Yuk9rKoJxn+nJ+cAMS0U3EhEihPO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=akeSo2MyJcKipTVdRbLIsacr92YUDbjCgwxzNB3M5jtFDxqfoSPTtGFa0nUVTZ/Wx+Jquy7YRgc5CKKKhbAaWhkew7ZtG1nNc+UElSmHQfz2ClKnl69oClUrSOF0WJyt1gWCmcIqSJjywKqCRd1ZEvfMPwmYl2cp8wQNFgS3eHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxPADOPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxPADOPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B49E1F00A3D;
	Thu,  3 Sep 2026 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455062;
	bh=UqEgYKmjgIKTw5yxsu8gj+jL54oiqDvkkzk5iFbNvk8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UxPADOPXK7FcYY9c0S6vKBe/Kk5L1+xE0TZBwvgluqJmA4Taun4yaeS37eBoLHMF4
	 k3X1fK8MjA8jH9xrOwBRqfmcqoTSvhhGGesrn5b4HFDGA7fohqLu8luoXIPeGJAdYE
	 coKDqVIi0miNP2jG4/FqOcMBB8CoVIJAs2bSMkspbWrBX4fEr4I5deT3vlJmeA0iwj
	 d3sZMyYx5xAtpU6bGVXtDwT1ZkJ129HfnlHsuvf2UoUJQJcI7k7LtwddGhsjzb/1u5
	 SqX9a9KrLcsUVj4UggSqQO58Ay0hoUszdPHX7F0gDY0kdqjtqxtaP9X4tFtDUPk/J6
	 EZOsZOu+fcFFg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260714234742.908956-1-rosenp@gmail.com>
References: <20260714234742.908956-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: txx9dmac: use
 devm_platform_ioremap_resource()
Message-Id: <178845506105.1711546.13774000651357007669.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:21 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 14 Jul 2026 16:47:42 -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_request_mem_region()
> and devm_ioremap() sequence with a single devm_platform_ioremap_resource()
> call, which folds the resource lookup, region reservation and mapping into
> one step and returns an ERR_PTR on failure, checked with IS_ERR() and
> propagated via PTR_ERR().
> 
> This is behaviorally equivalent: the driver already reserved the region
> with devm_request_mem_region(), so the non-overlapping reg requirement of
> devm_platform_ioremap_resource() was already satisfied. The txx9dmac
> platform device (arch/mips/txx9/generic/setup.c) provides a single
> IORESOURCE_MEM window per DMAC instance, and the child txx9dmac-chan
> devices carry only IRQ resources, so no region conflict is introduced.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: txx9dmac: use devm_platform_ioremap_resource()
      commit: e99f446c47318f4489eb3a675d53d4047951a6d0

Best regards,
-- 
~Vinod


