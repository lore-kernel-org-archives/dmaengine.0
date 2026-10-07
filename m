Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94FD3C0606;
	Wed,  7 Oct 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370947; cv=none; b=HJQX4bTLBKq2VBSPUgmRoWEFatG6Ow4aFxZ4Nwk8trIGWV3rdBPiSvjyBWXfBgMiFx+E2ctLF+jgH40gurZhAjLBfRywLlmezOC+ZBosvM1HsV75At7oIBo2XVxsuMg+9aC5CfKSc/cNSzR5SVkCQwh1baZkIJnkiBVhsRxOOzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370947; c=relaxed/simple;
	bh=IcKcq6ytPF0c6k/fsuFjkKd0FlMh1oB2kh70ij9tvSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=srsRhLToQmKxk26tzXkz7qW1n6XS/to88ADUFZDilrrM0jnYR4RGO+Mwu2X7f76YSquRFsuxb2eC22w8y9wJtXWzYZTJGVhkUeX7Ho1t1y/VA06GabO0Tary7HaRiIBr/6pHdlbWjY9YfAwvPcckdGiBHJPQX1cqd3RQKSnxbj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVvoIcwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVvoIcwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823F41F0089D;
	Wed,  7 Oct 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370921;
	bh=6Nc9bqPPlgFooqDfzYmh9P7G3xydsziuOQo0/aFk93Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UVvoIcwaKYy3NMXZOVUVRJwvgVJ8JBrDjZgtJhLfds0jyUWYjYk/HLno40//PJwTk
	 +w4psQHUv+pyEpxzH5tm8jDhVKjBg/PFrF+rN5sT9pMZm1KSaPR/uJ59ljR6DxA/J8
	 etNg4KcLD+FVifFVmRxAQPgpculFTtuZ68ZKZ/PaQp7DrSHvbAoBLSUJWYWF7zL2Oz
	 b7bvwx+jwmAdQLQ5AfwSk9+BLfa9/ZGnp8nKejT6cD93dnIfv5mLI77z+iGhRQpER+
	 CL3VZ93L9WwI/7XQAZnY7IexhiiZjzBijH+XDMIOcHGYPDbfGgYXgYnpSurrNQU1L6
	 5bImKRCf4eIHg==
From: Vinod Koul <vkoul@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006084702.5748-1-hemanth.selam@gmail.com>
References: <20261006084702.5748-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] dmaengine: ppc4xx: fix typo "contoller" in comment
Message-Id: <179137092025.420596.4208450514798269361.b4-ty@kernel.org>
Date: Wed, 07 Oct 2026 13:02:00 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 06 Oct 2026 14:17:02 +0530, Hemanth Selam wrote:
> The comment above XOR_ENGINES_NUM is missing an "r" in "controller".
> 
> 

Applied, thanks!

[1/1] dmaengine: ppc4xx: fix typo "contoller" in comment
      commit: 53b32375c9caf793ff392f762236c90f2a062ae5

Best regards,
-- 
~Vinod


