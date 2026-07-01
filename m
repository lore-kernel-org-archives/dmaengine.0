Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45F372073;
	Wed,  1 Jul 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924923; cv=none; b=qMG4LNv5s0lHl2Yvc39FjBaE/A0rHUlZ2/UczAHl4woMcX3TDCNCC0VoCor4BRKlPu/EktJpV/aUiC+fwAjCuPIJnm3fMPhj0PAOK+/ZbdpsLOEhV7bjDLAzB2UvJBQkjvMfaYW7qVt6S1neqds/OmA6CABHRMc9/Tf0vX3Xrlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924923; c=relaxed/simple;
	bh=YfYkB3ig/KBHMaLO3PQRP4rzQsPdZVQOBAWsBZHeAow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9MPt/vMz55tyYou52lPnfJRNi/5d4Ik8+O0SbVLJIyGtALwdbOykJ4F2jjpF1IGWhZ0sGkU+Pt2P+38bOIKoeCkyG0tssc/M7+ymhHnpnZYKOVVwFXA561dwwuGYxLJcOvGFJNd1drkoysdvjJvWOy/J1egI7ho5gBRFY+YDjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q06OGYnm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q06OGYnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924920;
	bh=YfYkB3ig/KBHMaLO3PQRP4rzQsPdZVQOBAWsBZHeAow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q06OGYnmJaCUTt2ag3/3SujadGgGI8m5kToFndSywAuMO4yvpQOooF299MkqtlYeQ
	 9ePkVf6vdFYcgRHQluMNdMxNTAUn6AxOyAQra6r2Ge6Qay8DOJoH2yGq9mXomWC7MU
	 T1TM3f9yk4gNzxu4pTG5J39cx3ttHNdM+iA+tRGTeBjpwLeGg7nMC/jseGPK1sgkmw
	 FM+pYXSE8O4v7rePNOUchz7njKwVss/CNGb1JvhDhdEe5BWEg67JOvZ5hYUELeRYmo
	 BfZAVnexUIip4tyDb2QyKP3j/LnOP2KK0Spo9Bsq/S70JaxNTTgttpXAwHpsYr6HNr
	 JMvfFcGZ+bMgA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16B7D17E0D72;
	Wed,  1 Jul 2026 18:55:20 +0200 (CEST)
Message-ID: <7bda5a3e-d753-445d-a093-ce647d29df74@collabora.com>
Date: Wed, 1 Jul 2026 18:55:19 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Long Cheng <long.cheng@mediatek.com>
Cc: kernel@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 17:47, Louis-Alexis Eyraud wrote:
> Add the compatible string for the APDMA IP found in MT8189 SoC,
> that supports 35-bits addressing as MT6985 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
