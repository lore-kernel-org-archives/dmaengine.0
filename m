Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57153472528;
	Mon, 14 Sep 2026 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389117; cv=none; b=rlax4M+3QsT0Z5x/ktK0atyuLoW6VzFnMBhvcv/NKm5KJRFOVZbMPTRYrUMSvBwr2X29nnYPaZaLOr8sfiGBMAk2QzcAulE75+VPFOxA+zWRYZMLQQC+Q4ThvCjqMraDNyxcOC7hPBrD4jYnPKblfzZmwS2O89K6qMHL/7dgtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389117; c=relaxed/simple;
	bh=JprKAj3WcBPMjGGlKwMb7u1QmjKgBn6gWZ8gnKo1/yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jx9YUqmk83NiNwbuueu3Gv5MytrVXU8lhhfkDQreGnJafWEkposTKd0b7OtfMmU4ghQuNlQifCgzVWttjXTISeUln9ud4kKEZkd0wqS0R6rb7Dq8GpJv81kjYAovvZp1M4BgTijRe+5S+qZqs6aida6jkCrcNlPJEUM4z8Wrph0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gFuUeK4k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gFuUeK4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789389106;
	bh=JprKAj3WcBPMjGGlKwMb7u1QmjKgBn6gWZ8gnKo1/yo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFuUeK4krZqgQHfcKDSyoAiSnzipqUN7ouuMdphPMobsw04OFTxt+5Mu9HPYAkASH
	 tR2s65Q7i+1ETuV57y+xhrIbLgPZRPMwAZvJeMXbZb/TImo4m1pSyo9ap6O7VEYQw7
	 Xk/Mh4fIw3DrKK9sHmNYe91I8glwXanJQvD/OKlI9lhsEqFoHC2qrXyCOnH/URx6tr
	 AFE5hvIoMNjspfyGTdcxy728DGtsXkWG/emg3ljf7+ItyrlnSwBIwH80kpF4UV5djl
	 MPGMv3iwgpiAGbEwLiKwOpWaz0zgXFQJ0JOJQR3U95gna5Ap2G6ZjFbIUbzSLubvfi
	 DXnpIWDkg9XKg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B049A17E020C;
	Mon, 14 Sep 2026 14:31:45 +0200 (CEST)
Message-ID: <a8610c0e-3332-46b1-9a28-1c1ef504a727@collabora.com>
Date: Mon, 14 Sep 2026 14:31:45 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
To: rva333@protonmail.com, Sean Wang <sean.wang@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 14:10, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 APDMA, that is compatible with
> mt6577 IP.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

