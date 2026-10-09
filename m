Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470A4A498A;
	Fri,  9 Oct 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540906; cv=none; b=WgRQzNPNuuIiV+cjxKQ3Q7k/KN6azMMm5q8Xi/YJupJ0420VBXARvdbA5J5KR/Czeet26JbWv2OFb83Tm1j11T+68LTe0gqxnZ/XW9jsx0jmxf4tO5ipQGSDpGPtyVxZAFGZz+iGvmSoN1is4RtnXc47ShnVB3dV+xaMCPJf918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540906; c=relaxed/simple;
	bh=pZGtCO/cbsffyJ/+hIx9AEnMLhSQ6qT/18jEy7/+afo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hCVINnvlKYfyC4l09UImyIkXCHn5NQNbJg6WBKesZSAa1wHjTS4Gf7W7xPC26XrUr+sK2r2VdOKTX7NY9EKP6MwmvIPUt0Mt9u8Rhr0FJE/EQtguogO1GjBanroBtsne0L5nINumhSglFCzbJorsnLZyr8zvyyMuojnNC78QUwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIHhR5TW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIHhR5TW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BF51F000FF;
	Fri,  9 Oct 2026 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540905;
	bh=XhJS/ohRboRHwsxazN32zeL8y321YhT0c4CBpKxSKUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MIHhR5TWduPKD0RfhfaJxNdg60KHcNd31SnDfswZXG8Rb0tAXwMwCcTbO+Oqh0kom
	 B9SEugXQhNvUTi0dZrnTbyTbMv5GkR8fWLJHgNZqVaBEPTbWI6jFYBMUf5KJ5TRi+i
	 YNDzf7kX2PYSJqknTGOHx83Mna86qUw4/UCAn4vGQ5DXf+SVG/aesImBDhKeJ/d5zb
	 dmxpemMFZKiI+kNC1e3LDBEWxLK5Yp+JKm6qM4Eom8I7If/V8TYLtFPCDJma7d/JWR
	 GjHeAqPjTsUHJVaCHm3RDArQ1NsidmPXBOhCs9TSB7VuJCmIvY9M/nZa1afWPOm7sE
	 KDR+HDE72YzLw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261001143955.2195063-1-Frank.Li@oss.nxp.com>
References: <20261001143955.2195063-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: move driver-private helpers out of
 include/linux/dmaengine.h
Message-Id: <179154090329.553139.2859535657192516068.b4-ty@kernel.org>
Date: Fri, 09 Oct 2026 12:15:03 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 01 Oct 2026 10:39:53 -0400, Frank.Li@oss.nxp.com wrote:
> Move the following functions and declarations from the public header
> include/linux/dmaengine.h into the driver-private header
> drivers/dma/dmaengine.h, since they are only used by DMA engine drivers
> and not by DMA engine consumers:
> 
>   - dma_async_device_register()
>   - dmaenginem_async_device_register()
>   - dma_async_device_unregister()
>   - dma_async_device_channel_register()
>   - dma_async_device_channel_unregister()
>   - is_slave_direction()
>   - dmaengine_get_direction_text()
> 
> [...]

Applied, thanks!

[1/1] dmaengine: move driver-private helpers out of include/linux/dmaengine.h
      commit: 511afae96d89847f753fcab6b3a597f0281be9d5

Best regards,
-- 
~Vinod


