Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254963793CA;
	Mon,  8 Jun 2026 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920791; cv=none; b=OXHBSHIeT2QMA8pdkDNNAlPqwZm53COeNv8mnF0kaT7bX9B2JD3Bxrp2COmcDqbcfMYUg8+jXHsXMrB16/lDKz2h1iqup6kmnt/SxE9Q9CGtSKIVoLb6eYb/tPTLv6Odp4+mW8hUTMXq8OoJvqcPP1PrDQkB2p2AEHl4S6ZV6K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920791; c=relaxed/simple;
	bh=SsvfHM5cbaOuVmsPlxxbWFNem8KAVqHLwQcxRI4sFOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sc0M3VEdKTLSmyO6vn1f61R5xLco60J7HLOTZh3Zlh8iAIvSuD7eL7Y3UjXj2oESB9gku+FYl/lAvF8KZVUQByyUqqZULxDu+JftLMirN9Olg5BTXzYRshb271h1CiGGAAGOSlsKuNReTG/JK2s0mtO4883TJyrlGLVpRQzqy5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnW9TsTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnW9TsTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316551F00898;
	Mon,  8 Jun 2026 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920790;
	bh=3VKaQzGNEeuYPjmhK0TBQOvYPF1Wk07LOIZXhQAuY7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AnW9TsTit6uYsJFpcs0JYcMbshndazbtlIMjHKSBfKCcABnzHvowz7/9aMlxo/689
	 N3a3BxGGMZF5c/z/7+UT/9DwyiyeXBe+f8rs1NPH/43T7zAz9twXLPui7QgXNC3CkJ
	 DTG/W1a5eyXbaerJOtNEOtM0RCbWSqmYGCK8FX3KP/S5Cf6MI8LQCf8ZUmS01FiDyt
	 1BbnF5m0LBMqCM0TOHPhRO6/63kQGpSa6iIzbYLMSszhMsJdg3y6BhM2DaZRvwEbL4
	 8oznMNavdEHs/WPTuNSdE5sJQdnW4H27Thx38CYUqSSNlz0sFhsbvUzVh8LPwfWooP
	 d2kYrDjgnfVrw==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <5f7380828873e2375e319ef091178d11a277a0ac.1779965563.git.u.kleine-koenig@baylibre.com>
References: <5f7380828873e2375e319ef091178d11a277a0ac.1779965563.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] dmaengine: nbpfaxi: Drop unused platform_device_id
 array
Message-Id: <178092078780.96550.7212200918268219242.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:07 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Thu, 28 May 2026 12:55:33 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The dma-nbpf driver only probes devices from device tree and fails to
> probe devices relying on the traditional platform device probe path. So
> the platform_device_id array is unused apart from providing misleading
> module meta data.
> 
> Drop it.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: nbpfaxi: Drop unused platform_device_id array
      commit: ead262712217296cad7d9db1707e504f16e2cb0f

Best regards,
-- 
~Vinod


