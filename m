Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11334BE42D;
	Tue, 15 Sep 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493788; cv=none; b=l4GBbzJ9v2E+y73diAqrjomybVSnsw9vQeD74JN3RcM9LmU0PqrjzOqGoog5PwdwnQkZb+W6PDUTmzuVI9P5gH4pfYeCVil/cYt5QP+XCiADveZVbrfe7/FUbgFPwz5JJdQJlwtqOLAwIHPxYnZTy4z5pbEmF+Gq0Q8QQjCy+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493788; c=relaxed/simple;
	bh=Fp525D72toGhFGYQslhQM3RtxH/dCa7bkNWqSjCk4Q4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G6IxHn1hZNNvX4JqRM6rSyA9e3WEoA0y8R/N2mVUeTR7PmdK6CJVJ6rqqrYr2SUAiA002qkgBc6X7b3+cISOxH9jJNWe5Z7kfdZYpvQeUWoBGwa2dw9zkZTdKEY2jBaHZ2173q93TwhQfenGhDkS65EfC5w0xy29SM0z26g+J9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwy+Beo2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwy+Beo2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1CC1F00898;
	Tue, 15 Sep 2026 17:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493787;
	bh=sAoxuO3iAByJo3LDo/x990fqPW2xFJNLK8uSau4nVZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cwy+Beo2Q98jNjJd7kKQNhI0DoWOJ+0z7jL1nhxi/lXEkhJ04riepLmQN1DV8k39z
	 zWuZTguIOa1rkzBPNO1hrWCO6N2C2VWaOKN/r0rI+Vk7ckybsQU3/3VT/fO8S+2+48
	 95+NgddmzLKSaJK9xbnFgPYCjQo6z2vYJXbDShKBYzlwwlt86C6KnlJkhI0M1tKZP9
	 S2ErnGV/bHIBqKlHXYrSM+w7Z7pmrUJLWU/1wjjoV4/nyehm8be4iSSDuv304UbuL/
	 idXOVShNgvL3jiH77GT9gTqmn7OS8+RixFPHmbEqxuxJVJom2VSZk2haxZ6r9CIRkf
	 5Vfof7LNCD1kQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Harninder Rai <harninder.rai@freescale.com>, 
 Xuelin Shi <xuelin.shi@freescale.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260910194324.33697-1-rosenp@gmail.com>
References: <20260910194324.33697-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: byte-swap cdb32 when programming
 CDBs
Message-Id: <178949378514.248239.6603688959758210230.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:25 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 12:43:24 -0700, Rosen Penev wrote:
> The three prep functions write the first word of the command descriptor
> block (cdb32) with a plain u32 assignment, while every other CDB/CF
> descriptor field is written with cpu_to_be32(). The RAID Engine expects
> big-endian descriptors, so the plain assignment produces a corrupted CDB
> on little-endian hosts. Use cpu_to_be32() for cdb32 to match the
> surrounding code.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl_raid: byte-swap cdb32 when programming CDBs
      commit: 8b641810905cba4eb200d72adde386bca380c0df

Best regards,
-- 
~Vinod


