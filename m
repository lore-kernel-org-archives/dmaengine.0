Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865C5540A6;
	Wed,  9 Sep 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957679; cv=none; b=sf8S7tgfRTnCBIMnBJyuPQokXdPjUGQeU7oRtxXh0cTgwQwH/rkK6YYBNP/b7tin849UTR4bjc1MI/Cf1tLcOonKn0USUWhil5+47HZND95x5mJlPAuY4/ys54G17t4xyBOs3l+nUOeB90WtrUeJrGmdI5/qE2CkVEs5DPWH45I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957679; c=relaxed/simple;
	bh=he0kSAglRwnzxsfzR5gQKxZazku2Goz/58rit8TuXhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ke4YuZPb4piX74/2O51LIYEK9G0nE0oKjifjXChzBCoO382MSMyXMOLifgr7wewHHWGC48/aE3BASarQySy4gOxSgPWbB/U86r+JNiGbF/2785FJ/iL1OipY8WyUvR1Hbh0ZEKdOs3ZyqX15Lt3DfgohhHbac6koYMRuXdlf/Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQ4m5RGv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ4m5RGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02631F00A3D;
	Wed,  9 Sep 2026 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957676;
	bh=nWrOOT2yuc5GSsATUk+WU/BnifAyG4BXVzbZl1YS1Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WQ4m5RGvN0GFrHJkp5areqbWX1Qd9xVBfsRi5/aM4ROM1CO9WS6YRJWCIQ+FfcT+8
	 H9kPOJDNkjDiT/mwNUpzXUGDnz0Ise2Ug+2U1qAeJkx1J0r6ktz0esiS0SO7+PPkXZ
	 pvmtyYJIFKLCnKxi6GVyZEHA6QN/pz2V4BFDLaZ3z5IraXuhOsVFXCNI18OJ3xyEBJ
	 INx45CX5R/ThNYEMytk3ev76ExFLSvb+weTUfuulLmPzNruBkVg9PKwuyfQjqFrnWB
	 sVdJKxrAzbuDmzJOao44HVD+8X5FnYJOkvKMynVbfHS2oyOwC305n9WiiB9Y6pg6et
	 gL8q+t/QhogsA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260825-ti-dma-crossbar-v4-1-b0bc78cf071e@gmail.com>
References: <20260825-ti-dma-crossbar-v4-1-b0bc78cf071e@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: dma: ti,dma-crossbar: Convert to DT
 schema
Message-Id: <178895767132.2174329.12994810431401898186.b4-ty@kernel.org>
Date: Wed, 09 Sep 2026 18:11:11 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 25 Aug 2026 16:55:22 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments DMA Crossbar from text to DT schema.
> Modify MAINTAINERS file to correctly point to new yaml file.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
      commit: 2c7604696ca3f2cdf70bff17f2f905e03df8b8fe

Best regards,
-- 
~Vinod


