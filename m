Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB1353A63;
	Thu,  2 Jul 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006333; cv=none; b=a/StOWVCHli+uvKuZHyfLQIRed2cZqaBDGHwuOCnS1GhzLS7kZ7+sPo3Kz5oviW6MTeNRCE6wdDM7rtbqfewtYvgizEitG5cq1fQnF2KxyDx4vK2T57cGRyjXsQ1LrG9dHYLdfPyUNYmPuL7/lBWPKKCVRP5ZGIckFJN4WDwwM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006333; c=relaxed/simple;
	bh=Sb3LKkmQyqomKK27FPLNJF6IlkXvXhAyXMJUrV39tHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F1xKG3bqgmTne2VioyQmoX7I+QDGKWE99TPEIzJo3S+LVzalEr+MD5Pr42MNO/S4dKX5WutKfsG2R3yDKrLIqmmPK0dqSPoeujoCSO/yu+XDyKeYX3rDCLgmvUA99b23B/aHiWHvar4Rhm1MaDAByVosCHwz6jAxZG/rfsFrRIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6+YRcEk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6+YRcEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8741F00A3E;
	Thu,  2 Jul 2026 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006332;
	bh=lHqpWAShTGw0CBIGY4OTCZoZs2U3Gv9S6HeoH1CtmfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h6+YRcEkDn01G0p4rOMjNZFGHjcAINtexYDwZ0siYrekxWvmW38iZUpWCVyYUvwAD
	 Hi4W+jLzpb/jxSMqP9faj1i1wuaDFIKNvMa5+1Yx3I5vzkGGWBb28o74N9r6Dn9Z/i
	 cgQKCV0UrqdJ8HVu35GdfZYcSY5ahlBs1+FlZ/Yf2xiJrMssyV42scsjajrtPFz0Rf
	 KUdhwtQZZhPzTvoyyhZQ/2u9A/upgPtcF5PV2bw9iJ8ugjaS5pXwaIYHdtj9B30jGM
	 +CaBtLeFtnz+vvtaJlxtNeyZK3sbFnVY1oQTEFA/sUv9Gm3nzIOAOR1/ZC1b/HQBoO
	 5MZ4CN/mXFrkw==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
References: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
Message-Id: <178300632766.735405.17747916047775158971.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:07 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 01 Jul 2026 17:47:20 +0200, Louis-Alexis Eyraud wrote:
> Add the compatible string for the APDMA IP found in MT8189 SoC,
> that supports 35-bits addressing as MT6985 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: mediatek,uart-dma: add support for MT8189 SoC
      commit: 0d2b094b1c10be619a63f53a610587bcabbee06b

Best regards,
-- 
~Vinod


