Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D4392C42
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455071; cv=none; b=i9OzPuFRz0Oawb3dEEeVBqauCuy9fCic9TmWV5gcZL0aTK/Z/yF9xFt8/QCk4u9n0r4CL8TsEu3xaQrjS7lL3UDqa0om1tMYLVrqY5Iyc3n1Gg5Xkn0NCa5gCidXvqOlsvoJSdZwGIOLs+tDhYJA4AJ+1BTWTiPWHDq7WkfwDcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455071; c=relaxed/simple;
	bh=7Img32UKFx8BO4iup1wWKAFtTvCCy4hNEldQ29BQvOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t+ZoQISJb29PIaRYrw5AChz3w/5LkqzWSxskM5IC6dIjDSGWwtBXmB0Degi91/GMv1BnJ7VELPYuNwwSIF6GaMFIpfaHq17pq4QahZEO9BOzfbF+k5S8zueMFlGlhbj3Z9GZKIZYt3tHCsBtzLOUIxTh7vR0lndQqGI+NRoqMP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBTEmqA/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBTEmqA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F731F000E9;
	Thu,  3 Sep 2026 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455069;
	bh=RxOOXEQyXe4xX553nxNGEarqDK78jUgPIA1itMZkR0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HBTEmqA/r5wyHjXrTbQh+7DaYHh6JMUNGDlTXt3IkkNspSgSj0rYC5R2mUYugFoAg
	 Rs3DPEfOyM9+kguUJeL0C6+HICTwE36Cbbyxfa16iT7rN81I9YaT03yx0uAJjTBRuF
	 IJ4ZKbw4GLYCs5U9BOFWjaJXDp9aoahi5c0t+7A1jgNnfpq8dgATIJoDAQ3jyca7t0
	 FZBrTiM+ZY9QfqsGMBksGuOmtt2Qo8ldJmsghOeK2mwjyCfwxZdhSbnvRbyeLRKqz4
	 sKSA4o7X14CDxVGMKGYrNqjg0yduYYlQIQlII5f/++QVZB4iyfm8gkMNN5/VL8FD7p
	 Q9cA5vHlO7VHg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Vladimir Zapolskiy <vz@kernel.org>
Cc: dmaengine@vger.kernel.org
In-Reply-To: <20260723211739.289699-1-vz@kernel.org>
References: <20260723211739.289699-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: pl08x: Create debugfs stats file under
 device folder
Message-Id: <178845506829.1711546.12180905876969481814.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:28 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 24 Jul 2026 00:17:39 +0300, Vladimir Zapolskiy wrote:
> If parent folder for a debug file is not set, then this file is created
> right in top debugfs mountpoint directory, which is undesired. However
> for every DMA controller device its dedicated folder below 'dmaengine'
> is created by dma_async_device_register(), and this particular folder
> is expected to store all device specific debug files.
> 
> The new name "stats" is selected as the most popular debugfs file name
> found in other DMA controller device drivers, and the macro constant
> for file mode is replaced by the octal value.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: pl08x: Create debugfs stats file under device folder
      commit: 68e26bc0b7b26c614639f1d13d160c51ff81799f

Best regards,
-- 
~Vinod


