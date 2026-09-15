Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8294BC029;
	Tue, 15 Sep 2026 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493807; cv=none; b=tL9O0Lq4YYf8vjNYeFvAGj680wcqMpND6eFN5QsYMFCZNzmzDaOZkvRj51BUhB0mzvCKIAALtaTyjSJXASXYgj7ton9+kgQYyGoNLLjR971wuL5Sxp6IxA38Mt2797IUeQgFmOgFu2CRI5w5GD/u4HGf/3TcaYdTlWb50QRgusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493807; c=relaxed/simple;
	bh=fAKi8r4snWuASdbBpGbKQFoYFIDADCaPlGQhokqyFIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sw3t+gO2hSG5ZcZZS1FO6g2BFyG4f8Ve0H6jzRfbOhWkzCaFj+smWE1Mb8++UW+S7cGAfrtKSPU8EtSTUpkOWPo0XXCE6nPPpvYpCtKXL+ZsmHdHtrQK9hWOwgZaAxorgARwZyeQxr5Vb70172lnmgGnD7dAhsjtsnirRAqb6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJW5gwL/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJW5gwL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7307D1F000FF;
	Tue, 15 Sep 2026 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493803;
	bh=roMxPJ54U61xMdFOXy95/J6fQcHW787Tm+FXBJbUVkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XJW5gwL/1OisvlbV1Tvzd14L3d6w9hFqSHxyOQiWy4uc8qTjqGUFeKqBQVXSEX4se
	 +GSyha7AzkhqyWcTQeC8XbWVN1/QfB2/z/kWZwhHLX2lb9VpuY9LGgCL0Xzj72tmPj
	 0LhvM0gFF+0PzcdDSVtbY99gVp8OtqwJfjbdFIFBuwYKgAks0tsQeMTSBMN0NyeJDe
	 UKZmtyeCh9yy1gyTi684It4yGs4/5CGZSYqlD5dSvZZlsxLqrm6TUymAM3lnytVnS9
	 A8HVGcn9W18T7gRVhUnV+V8Pa4rrACKvUjmI5ekzXtjURvOat2y9rYVZvzC6aTI/dU
	 refT0XGwvhd0w==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260915072853.58587-1-rosenp@gmail.com>
References: <20260915072853.58587-1-rosenp@gmail.com>
Subject: Re: [PATCHv5] dmaengine: bestcomm: use
 devm_platform_get_and_ioremap_resource() to simplify code
Message-Id: <178949380204.248239.15012767548995542976.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:42 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 15 Sep 2026 00:28:53 -0700, Rosen Penev wrote:
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
> 
> Fix a resource size mismatch between allocating and freeing where
> request_mem_region() and release_mem_region() hopefully use the same size
> but is not guarenteed.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code
      commit: 0a8dda0a15d3926422d286567f945a05328a4ac6

Best regards,
-- 
~Vinod


