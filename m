Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342D4F6461
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 17:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455076; cv=none; b=bqRd/Q45ckGP42a2Htg+ICDoYY04SSMbfuJckwyxxU7KL4aeXzdJI1DhB4d5YLKcYYG2Ju5G1xmt4vRtihjSwInA1D43m/nnkT98n5EIXKKakTw1Cn2zDZTut2rcIAHQn0adMUtfQNPnXK5JLuM6c00t+HUuZ/6yns0XexSX01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455076; c=relaxed/simple;
	bh=p1YsUagwAPMqhnB+yGRUM8empGvVo9m80mlJpn27zhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T9fP390zXh+mrafVrEYOJqnkzQxNFy17xrWISsVtyNXVhQeRUmsNErJsNAPkKSvpzlARL+HezP4VEUDlSylKAjhnzxQoJvxFSYl2aKUhBxoG3JqgICiWNJJGW/BtI2Cf9IRpepzQITOaWlFYN8gYTEa0wdC9d5kpFkzm9S3KBUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ki8bKt6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ki8bKt6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E9A1F000E9;
	Thu,  3 Sep 2026 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455074;
	bh=GwRoiW+HdZ1wHfqxToXxJHXW5UReBsYWCdEHfsjlbOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ki8bKt6a6vSDPDQUv/LZEuCdZIGMyqZ539NNz5Y4AMNZc3DFfOgFUjg9vVoOVbbXy
	 Ixeus1+H/ZyQk2z2/PNqs5iOboyQHeqAztdCRZXSPOpK18bgEbFMF8Fc9Oi4c+JvN9
	 y6Qjr13M7LRjHdhoa8Ex+0f9Yhblsvbf9tAhtN0oplyKpXlS2/5yU3WIMaPu5azWNQ
	 8OPFG69nNRpoxIVlamKkrqGk9F1rOOMUONq5I4JZwbAD343coFjXVmKC4zcWm7IYR5
	 1jRi6Na1rjAnqdM9q6z5BAJ0W2Gw7sICbYl6VpCLujsi6qjDEUjoFm1VwbaMlGGrpE
	 AVLwu1GY1IFjw==
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org
In-Reply-To: <20260725194343.494973-1-vz@kernel.org>
References: <20260725194343.494973-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: pl330: Move device specific debugfs file to
 its directory
Message-Id: <178845507294.1711546.1705927078852351178.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:32 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 25 Jul 2026 22:43:43 +0300, Vladimir Zapolskiy wrote:
> Under DMA framework every DMA device gets its dedicated directory
> dmaengine/$device_name in debugfs to store any supplementary data
> accessible from userspace. This change moves a single registered
> debugfs file of each PL330 device from debugfs top directory to the
> device specific directory, the file is renamed to "stats" to match
> the most popular name among all DMA device debugfs files.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: pl330: Move device specific debugfs file to its directory
      commit: d2d5b3dbd97e50261c1ad6a5f0eb09963f421848

Best regards,
-- 
~Vinod


