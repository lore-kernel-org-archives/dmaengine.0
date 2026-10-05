Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107CA4CC266;
	Mon,  5 Oct 2026 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214984; cv=none; b=itmMMkWCHdSJlfIYIIKjID8S+3W0w7eXYswm+/0QMMeAblWv0BzQlVrx1SsDm9urvBt37AS8VORHZPk9O4O7SVINDERemHd4tCjUlzrYOV8i+ztsLkhlCbxSlaKqFm6tV5R1X8yc6xiBq3XVMbPlyp7EX3UjNuuL4/Pdbjk3obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214984; c=relaxed/simple;
	bh=ssLXG5ELdOEMK3gWEmvzq7dcSSdHfkl92tSDT6pgghM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jOxWtRzIkNuS0li3Ef4D+XoavUh+idV8fXVKQYom9bw8mnySiCDk++2DhVSUGvIwLcZDzFP+I2PIqbw9TAE1oxOLdEZ0vgAzZj4B+m7RWRv+9PAPlSLFHOwTOxPbbxb4txN+Fbkd12U+/p9FSYiL5XwuBi1z6fIt6QQJU8VI+JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCi/AB4A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCi/AB4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B25F1F00898;
	Mon,  5 Oct 2026 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214982;
	bh=LfTBDt1dBEQMaJYvndanGFbI7ZntksNWEtl7CCTziEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QCi/AB4ARXpeFluJTFQ07h9gZBJysX0ptrsliZQz+98z2zAzaBZViebMl23Hhrdxb
	 iLUcDtJjndFjiIBAMhoqv+AnK+NbJESRW1K9KeuwHbjxNidc7C7/z/+IL2xxJDVE6O
	 GQkXHBo4z6oI9Hw0aeCoQKEhn8xrJt+4j7CMqF65AL7U2ED8CYbtqTHXKH9+aJ0zld
	 bQuYdh6S9NtL7mu3BfUBjwuzXtYa9BFj0D92hvBeXxJRYz6qVEKK4eUuYeoNHKrQw2
	 qi4TAtp2BA+fd5KY2bRWlDzZBZLzX/wnb7iUCTFWn5GyO7ypf2zSCMiIZV+71NIHmh
	 u9XPpj1H7hcpg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
References: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
Message-Id: <179121497987.358863.6010339513026891626.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:59 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 01 Sep 2026 13:10:59 +0530, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Maili
      commit: f9587f7906ffca0d6bbee01a887079274adf3269

Best regards,
-- 
~Vinod


