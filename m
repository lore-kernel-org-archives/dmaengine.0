Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D152382296;
	Fri, 12 Jun 2026 21:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301151; cv=none; b=TaBvtWzOWa+0J/IqH7JzJY8ikzxuPzTqaAiOrLzuN++NqRuxSNfHdhoU/5QNjZ2F9XC576W1DB9Ae9Kw9yRgxB3xgQUPxXfP5/cK0/V493KEomVBBUCjLVbKF5qX2CN453dlPDY/eJ31ap19WUGKA8WgbjQsWR5ndDNs9odr5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301151; c=relaxed/simple;
	bh=IRz3Du1qtVxZ5gFmKKgbR4SWg6QoR0EnSMAJagWBtq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COtL70YJs4AkvWblL5wOJoccjEYyOfmMktReo3uYO0AlzEKYeeB9ezmszbr6+Rs67T8vcJlzh6jy2KcMrSHGReePSF8DqnMgMFIQDW1QtqiV0nTfubzMz/5zc2c1GO14th2MA02gvYvD7rOHzWBe+iFVtqFlDltDxTRkPQjqw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXorvUJa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXorvUJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168A71F000E9;
	Fri, 12 Jun 2026 21:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301150;
	bh=f9Wh7NvXO66sNsL9eRF3jkvVQcyg+DTDNvWmFLOKnjM=;
	h=From:To:Cc:Subject:Date;
	b=VXorvUJaie1JEFvJ3mt1q5HQtkUfWzFpUxsFjIgebkb+WjeShUqFMT3RglFn/bJpO
	 9Raf9cYpB/359pXknr48+/MK3vWUEmUiv88eRRmM9ScMwGf3KbI1Y7nKR7V02/nAyX
	 NdKguo4HR8azK3h+wAi/dyEmkVDnNWleaj/dFvjHIYfDeP/nGaeAa3BBTjfuOnZ3Sh
	 r/NGCJNiTmqTUvhGnrEVZFksFxwF9l8VkvWEMdQJGDahcxVoCWZ1Mbssx283Tcy1jE
	 SazzDhqwkCeYf0G1NzbU2xGZGpXvRK+ID8FPQZY5cU6v5nyqEq+oawVGx4jLqn8wMC
	 6yyQMmekjb8Dw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Abin Joseph <abin.joseph@amd.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: xilinx: Fix "xlnx,irq-delay" type
Date: Fri, 12 Jun 2026 16:52:25 -0500
Message-ID: <20260612215226.1887726-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"xlnx,irq-delay" programs an 8-bit delay field in the DMA control
register, and the driver stores and reads it as a byte. The binding
described the property as a uint32 cell, which made the helper type
check report the driver as wrong.

Document "xlnx,irq-delay" as uint8 so the generated schema reflects
the hardware field width and the existing driver access.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
index 340ae9e91cb0..ba0fc515d825 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
@@ -93,7 +93,7 @@ properties:
       Width in bits of the length register as configured in hardware.
 
   xlnx,irq-delay:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint8
     minimum: 0
     maximum: 255
     description:
-- 
2.53.0

