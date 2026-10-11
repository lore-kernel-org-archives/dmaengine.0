Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA32AD00
	for <dmaengine@vger.kernel.org>; Sun, 11 Oct 2026 20:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751126; cv=none; b=r6F0U7FimBI2o0bH7hdpAandXkF89PUASxCHzg8JoavQ9W91VL+tk3VHV+FSZuLUscoXek7eziR5fBimxZF2GLamhDcTWD+tq1p8+OqPMWHm6dXgHiTxNR8njhJjiGAMtECRPTroTSH8c7wCv12lxh9cDzSR6VsvMZLc4L+ngtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751126; c=relaxed/simple;
	bh=U/uHs1XbJqGCM3fq/EYnY1oOSbjWRkMb2/STHhTak3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ejXvOOIQXvpiV61jEtR6c9ar9B4oP5eMOgjsyqkhyARpjCvoy8bYEttjfC4sChDDbYXsfYygAJ389hEbBOK6juO4Fs96tuT6G111qbJBy1FujIOCdR3KHquLMDUuAFknayZcjQabzIDs4YhIyVxC3KuB4l7DnOjXzpy57ISgATo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeJVKxb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeJVKxb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654671F0089B;
	Sun, 11 Oct 2026 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791751125;
	bh=ofmIBBbqxJ6/hIQJtBpc7xjtrsiD6oJii9//iQ1htzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WeJVKxb8RInnx9ZHFoVxIJhJCO/+Jx4b0SN2gXEp/pxrqKAinJYdp5zk4LcCLTsaD
	 IgI8kET/lKVId2u7clMXyI4iWHvYEgDsnq8p6kI5i41MjRAAo7BQ1ubUxMtCQktchG
	 lJOHGMjW1p5CENcHdVpAqut3maJLoi1xAsh4uJZcuI7byC5YiBhRZV3sIs7GNVdnY5
	 SXJfktJrcfgva3FHRiPg/ZFx/Xm88tqImGmmE/kJynnqygEzGkyHSTPSpkQyzSelcJ
	 LCQawQxLa0lidf9UHLOsucEgE9DNumz8tP9UKE/GS4RTMKuD0BSUYZcYoWpKgyYwrX
	 HBu5ZDtXYGR0w==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Koichiro Den <den@valinux.co.jp>
In-Reply-To: <20261009093745.539924-1-vkoul@kernel.org>
References: <20261009093745.539924-1-vkoul@kernel.org>
Subject: Re: [PATCH] docs: dmaengine: clarify ordering rules around cookie
 completion
Message-Id: <179175112438.604740.4996434444257122340.b4-ty@kernel.org>
Date: Sun, 11 Oct 2026 21:38:44 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 09 Oct 2026 11:37:44 +0200, Vinod Koul wrote:
> Sashiko pointed in [1] about the cookie completion order. It is good to
> Document that for ensuring that dma buffer is flushed and no stale data
> is seeing by consumer, we need to make sure such action is taken before
> drivers invoke dma cookie completion.
> 
> [1]: https://lore.kernel.org/r/20260917072507.5BDB61F000FF@smtp.kernel.org
> 
> [...]

Applied, thanks!

[1/1] docs: dmaengine: clarify ordering rules around cookie completion
      commit: fa89be96e845de705eed6edd01ecb79d46ee21c7

Best regards,
-- 
~Vinod


