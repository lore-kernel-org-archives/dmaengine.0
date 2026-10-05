Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2064D2EF4;
	Mon,  5 Oct 2026 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215005; cv=none; b=JSYcpc/Q2s0q+hO2ZUMElxH4GUVd8Rp8lma9/8AKqORuRBAhbufPMR1WJPtAObDj1lRA67IA4uJEJAHm+GG2h+vv6ptBGXLYahcJODcqA8sxTszxKKsnl+p6uln8/eD2OhSPrgdFI2OJjTLi2LL9/VPQgFP5lLn9ARjlm32H7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215005; c=relaxed/simple;
	bh=+shP5rSQCNKEJhIZLQOQZBDyRn9uaUn7PbqWeBlgJCY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UuFqD8gh8C5FtPAgeaePDa7VGcWDwPFJlu5LMKfLFudH6c8UcFQMcwEv6RDC0X6GGHSbHTU8CxI1ge9Nubp10ag/xAJaqsM3GFeNGrgba56Pv3c7GE1LlE9P67DpJWNwr0/ztOe4saa7PHrHNKe1e7X5jnnAsbuOQoVHUokymgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8bPbrDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8bPbrDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72F01F00893;
	Mon,  5 Oct 2026 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215004;
	bh=PO59GTpEfJ18uXrZIZu/rx/RGON0fsFRlSr9guOMQTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F8bPbrDKHhzC2bLpLZ3G4N67cahx5z44iJBtNiar2Ut2TMhf2R8pzLPPUAfefnZ6G
	 KcU89N7cFEzTitKaEUESaN92fPa8UwIdlHJWtuvIdU9/11Y5rTEfQMtAnGPJBE/xf6
	 MJ5AOt33ll5VEkfeb6otnXy/qkgb27dit5w5V8xp+dWRt3U5NjTc8OPGmWdlEEdgAe
	 KOqA1vZKLAfflOj81LWq7J4Yh7snX+P2Z1Us2+gWjBf7X9O8NzacqVUUwOsnxzWlsR
	 MzRaKhFDvTWmowYPnxzpIt/S88KuuBoHBCIxdhHEMk8pHavfVbdYGteehy36F+XHQZ
	 gQYHlc2h/37ww==
From: Vinod Koul <vkoul@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Message-Id: <179121500137.358863.16462502729162373474.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:21 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 16 Sep 2026 17:21:29 +0200, Bartosz Golaszewski wrote:
> Add the compatible string for the GPI DMA engine found on the Nord
> family of SoCs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA engine
      commit: 5014a84aa577922593072719c048d526e5a37bf2

Best regards,
-- 
~Vinod


