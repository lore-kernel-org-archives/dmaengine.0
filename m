Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607140;
	b=fa+FGMVkxJ6G4QKT8H1W7gxBtFf5om9viCTJx/JIoVV3NaZX7BoSa5QknEinrl+s8kFg
	 51A5SStF1ZiOKSSMMpu0MX7ktu7+o6eUvW9UEQS+jpnRcW1dLa2zAo77nZsmnRRwyN6d9
	 48gFktoPxsFHfPgfOyyDd9RS6Buqk0+aKEToQ8iFLCsIUlAdOpin4YfbrsBIsnT+ARROL
	 1peXGPstHy9HFhDQIKj+A6ZLEhNhqEAVwh2gyUz4bHF4/NhEN5rI0dSSpoHLJHMHOwmAl
	 zx6zdzE8Z20R/E8nOmiBHhV9Y2z9C81CkqIJZ8tmxjMVMSkYoEq2QKcCGHEkDfINtVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9vidyt/DEjPOdulG26wicwETsX/k8RXmswJN0sUtW9k=;
	b=EHN7NVl781mmZ57DZ4hnTpxC4M9WWA7Eht6Pp7emwfBuVn34Sxm6Jefm+vvMRsI+onE9
	 mPYO9SL5/w+nDuNupT7SKHUSQpuzFQsnNqvcdK34CKdqOtKilZSyDDxZJ+ltLY7uzi/Vh
	 uGgUJniMEPFozklcfFWS/kBlLofs1XcxHxhG8obn3JpoRBBb07RpvfVoDIDUBoNdy2ZvS
	 J6CTQWv4VEoGNNR5eyTrjIue5gwSF6wVMMf64U91fblEz08sBei9cewbDdZaa4s/yeuaV
	 6b0Hg1SoDekiIQRX2iUpPLJFvapTYVzWLs9e1cOrDGhij/rRLjXV60XL2TUAsWB5vaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EuEfXXb4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE4606A329;
	Mon,  2 Nov 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EuEfXXb4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0151F000C1;
	Mon,  2 Nov 2026 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793607139;
	bh=9vidyt/DEjPOdulG26wicwETsX/k8RXmswJN0sUtW9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EuEfXXb4ryG5S8XuwapfFS3BWNPGAvnU4Rnxk3tuSUcAWtSYjsVXBgg/TkqV86FOx
	 Kgy6hqpCcYufdmTUJcbI1eJpGNf2n24Src2NwcDnGmb5mqLoutRDFDtwiEWVhEOtpr
	 FQq/lvrAiAIHI0M2wHzcnRDbLKP6vyRXvGmhVsQO14y42x/IjdgS/IIYoiHbMACVE6
	 zVhpTGE0PSJTwxxnTHPtK5jPTU9hRDY+RxYvkENnqh3Z0TWnp/PgyS+8ULQJCZolW/
	 7jpGyDs9/HAXCKemVosav7H/82hUPPDRNw3tOXoyWZaFLfNJ91vY1MgZLejUlxb2WO
	 mlq8afN3Hkh/A==
Date: Mon, 2 Nov 2026 09:12:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, devicetree@vger.kernel.org, 
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] dmaengine: arm-dma350: Add slave support and Sky1
 integration
Message-ID: <20261102-ambitious-kraken-of-triumph-c9da44@quoll>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
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
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>

On Fri, Oct 23, 2026 at 05:30:12PM +0800, Jelly Jia wrote:
> Hello,
> 
> This series adds scatter-gather and cyclic slave transfer support to the
> Arm DMA-350 driver, then describes the clock, reset and DMA address view
> of the CIX Sky1 FCH integration.
> 
> Patch 1 fixes the source-trigger bit. Patch 2 adds peripheral transfers
> with descriptor-owned resource mappings, coherent linked commands and
> hardware-based residue reporting. Patches 3 and 4 document and handle
> optional integration clocks and resets. Patch 5 describes the FCH DMA
> address windows and adds its bus clock.
> 
> The controller nodes use arm,dma-350 in this revision. The driver changes
> use standard integration resources and introduce no CIX-specific register
> programming. The companion AUDSS interrupt-path series builds on this
> one and manages the AUDSS interrupt gates in the CRU driver.

Patches have five unaddressed reports from Sashiko. Dropping from DT
patchwork as I expect new version.

Best regards,
Krzysztof

