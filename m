Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954012;
	b=BzwmwP5fhYGmxTrqiZHjRk7E94XFGf+jXDLqF5Nh2lezfcOrUS5+wqSNIK5r30udw+4p
	 HFsMfc64PP8tvT5F11AE89yxhsTNgu7yanNmclthPivcp7UiYunGpjFGjIp+tz0PaQflj
	 R0KtBhSxCcRmsa7P1ioZ9NJzI0AVX7WZ0B4fwLAvtF67WdGEnYqZEGjmht1amMT38CHDm
	 NfkSNhGf+wfvUlD0jaC6Tp6WhegvmYgWfoctIqF54+OpZXCtOKq/x7j8fgE87c+yf8/rE
	 dXbCWn/y2FxtOAA5cMIHEWMB1iDyRsyfPboZvz0dawCiazy7LWkDpioo7kVnSk5RYaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954012;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/Ds3C65fvT5xCzj/ZU+yWxOGchnXx9nGZT0Im7vt7Dg=;
	b=sBlc+U1XAKijDp6Dov5N22t1vMRGrS/GRbRN6ELRvGqUo99BOY4Dib3LJOVHWFz0E5TY
	 qV3C9VICoB/+04K+mZ8pC+pC8uA6BvOK7Z45KGuwiibsFBPRBKZD0omodDrN0VsvXTews
	 0/iuXiuhThp+WskWfqU7PGD2hHsnMFfd27gDHlL58KIvqyeeRq4VXMRanfFK8oriyhdoP
	 BuPglFWpa4E3Qtqf0AR2L34O2YvL/roTh0B1vm4NF5ZG64Ijl4N1xW+tL72c7DqL3epJo
	 RyUWwtoBAtuAlsOjq2AHN50RNg2kGHhaFXFtYfYHSlQcuxlmxX1m/XNBreQSI6+ch9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOvqxxLO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1457606A328;
	Fri,  6 Nov 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOvqxxLO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D111F0089F;
	Fri,  6 Nov 2026 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954011;
	bh=/Ds3C65fvT5xCzj/ZU+yWxOGchnXx9nGZT0Im7vt7Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOvqxxLOekQ7EUVCDQNPtj/sHckLvw3Kf0CnNnFTN8zanboUDBRUbyAVWlYzAAyT1
	 5F1O1z7WFQgGJpcFn2xfTSR1hog0cX5bEO6qercwxDDAbFb827qrKFScIC4X3epbRb
	 N0iLBzT9BWrWzzekB0Lf9iOV/CiG0NAxW/kUB56IqLIrR17kk/2bs3uUNcGbmU6v4b
	 J2VNtX6g1EnT9kT/r/ydbzE8ZjySAkhAbtvU0yGQ7Px2d0rQMyHmjTAVkPlihnX7Sf
	 Jh4I99HWZMPXmaX7iKZvUAB414qD9opTp5xFzpD83B7W3WwJG67M5zFzgm+cYrlCNN
	 wQvnHH1nhyjyg==
Date: Fri, 6 Nov 2026 09:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, devicetree@vger.kernel.org, 
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: dma: arm,dma-350: Describe the CIX
 Sky1 integration
Message-ID: <20261106-screeching-tireless-kingfisher-db6e07@quoll>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-4-Jelly.Jia@cixtech.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106013453.1134239-4-Jelly.Jia@cixtech.com>

On Fri, Nov 06, 2026 at 09:34:51AM +0800, Jelly Jia wrote:
> DMA-350 integrations may gate the controller with a bus clock or hold it
> in reset. Describe these standard resources on the DMA controller node.
> 
> Add the CIX Sky1 compatible with an arm,dma-350 fallback. Sky1 requires
> a bus clock for both its FCH and AUDSS instances, while only the AUDSS
> instance provides a reset. Require clocks for the Sky1 compatible and
> keep resets optional.
> 
> Both resources remain optional for the generic compatible alone, so
> existing device trees remain valid.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

