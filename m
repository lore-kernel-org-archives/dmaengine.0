Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C581488DB6;
	Thu, 10 Sep 2026 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048863; cv=none; b=lvVY2dRwineTa+MJcFRd+XVbCtuwwzlYaXly1sQCXQ5E5O+c5gNf0KUuM5frS/kJ1g13URlH+sbOg+zfp8m0INLqV49dJ1zXRBSfaSO7KJ/xv2Vcj70ldLc7mqxDA5tURuKN2yjxyEp+cwn4FJuGP/slJ/P/hTaPNs1hNwdYg5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048863; c=relaxed/simple;
	bh=jlM46+TuRhEr40sN7rYV6RWx8Dmue6LPAvGY05a8VL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWouQmMDuMS5QMcvAjYGmZuAsjCPm52FLv3JuImcLCwA6FWt71iHQWUU7wzZ3o8fzMuhJVKaRcMNq5YpNHyj7uRxIFUMYLIMHjQWSHYN1XZOXxAOOnHpO2Qeccwn4fIXNFj6GREGKaadKFh9ui7eTBWpiO2mTGRZKY77Rri/ddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+UmGzv1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+UmGzv1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7F41F000FF;
	Thu, 10 Sep 2026 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048861;
	bh=AcgYlwaqPlFnoddhUIMNGVmSmineEfv5TPAqOmCmHEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+UmGzv1cYK7yH6bI+GgE5UwojwXWKTTuM5d/WtRKUN3TFHEmvfab2EYj1iaa1IKV
	 vu3rSYF6XSW9DxskVNSxTWoCj1YsB2+277+cj2sM1NgRxsZgnKm5fLYzT1P7RkaW/4
	 U0f7zheVESkWRKJ/3qHeGHg3vcuaUVUaQsNSxHV1vyw9BHcf6dyJYviHZxvTtIdGG0
	 TxAr36WQwRx8ThTsDf+9PIijI6nBizZ9ZnTsCtg1IrCogwypYNXfEKj2pLNco+Wu1v
	 lLxmAANnlmIUA/aLaKka2L0wE8c0cZvsk/hfzqkS3++ki31e0apZDXUEaIF1AlzvO0
	 AVzRyc6X2U2jQ==
Date: Thu, 10 Sep 2026 19:30:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: use
 devm_platform_get_and_ioremap_resource() to simplify code
Message-ID: <aqK4Gd1LvImmVPUi@parshuram>
References: <20260909232623.89321-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909232623.89321-1-rosenp@gmail.com>

On 09-09-26, 16:26, Rosen Penev wrote:
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
> 
> Fix a resource size mismatch between allocating and freeing where
> request_mem_region() and release_mem_region() hopefully use the same size
> but is not guarenteed.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v4: fix subject

Where is v4 in the subject..

Nevertheless this fails for me, can you please rebase

-- 
~Vinod
