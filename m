Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65D94C77C6;
	Mon,  5 Oct 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214974; cv=none; b=d1T+YaX6xiUUx/JAd9S+Hnlauonu7CSX/lgv775+AJaWS/DJgoXDa4iQ0wCDGAv1ljDAU/SDo/sps9mNbFlFnHxBZj0fIJy7oMrpoe2s1pctmmYpCu0KaQmsXb2JDZkcpjkv+WZe4aZ333/9PYmCrCtw8vIwlKsMqDoSi0jyq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214974; c=relaxed/simple;
	bh=dx5ZPuw0EDthZkAiYwdnJ88apPFW9G1RVihGrnW3Hbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cfE19zMmxNG4jNhe/8kAtxg8DBdcKcUa//Z6VRnbX8Ax9pqWE7USuO76E8xVjr/2DtmP8eY5HbEtbGGxE4mLklq/al/DH8rKuc2W/E6l/FEBeCrexiJ3ppanwIBXOXpn9u7woIDvkTLIMjPdnNWzpY+soy1DIKSLG8adS42u73Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xpu2ucEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xpu2ucEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969B41F00893;
	Mon,  5 Oct 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214973;
	bh=cY0MImdsbwwry+0M5+lusqvStPfpoJWB8RTDFB0Iwvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xpu2ucEKC7J4WZKgWocc13bV56BFfjA/o2ZhUHlgzrny4VLzVrJiRfsC3jOs2HyLj
	 RiSwkpSx5JlAby7QZsMWgt2JfkNgaYdvs7YWKsISRQmYrx7FXjAHWBKcLhDypt316f
	 gTdlfX6We6cVQE8Xn/w1QJ5AD7ytHwwLmuhhJQ/rybdQUXX7lTZKlKqYJd/Hzv0fv0
	 dVedNvHP46QUVGgcybrORTcb7dRRO3djLGlmHL+r5abYGbM6gXbBGc/yjnQyQnyHrQ
	 J6HA4MXCfJiLCLj2vkBBkPmGlmyMu/mmpr5SKRfR1Oz2MxRgu/jDtYjv4HJmqVDxZk
	 sCrFNl+J16DbA==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>, Roman Vivchar <rva333@protonmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
References: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
Message-Id: <179121497025.358863.4128356307100144833.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:50 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 14 Sep 2026 15:10:52 +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 APDMA, that is compatible with
> mt6577 IP.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: mediatek,uart-dma: add mt6572
      commit: 6c0a5a1fb1668b5fa9f9c9c302f5235d131f2ed5

Best regards,
-- 
~Vinod


