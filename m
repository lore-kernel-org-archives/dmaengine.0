Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501F1F3B85;
	Sat, 25 Jul 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982382; cv=none; b=fy2xP47bKXpXZUfMBPgOACvL30vR46uexW6UFM8jmgT5sBzUJmGg7d9oTn8VzxVssSsqkFRkA1OJZMx7BCHxT7BqwMxp2JrmXhBKc4JBBEPBwe+oxto9ppMRCVR1wDgngcAp777lF7ggAuarBOxLqh05DhXHOOPxgTRud8vL6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982382; c=relaxed/simple;
	bh=3Aqoo/zey1l7RhP95jMxXWVd4w3Vomi3P3qjge8iKtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Avr0tNgCLL/+XU+iLznllrI/iq7rlC+Pls+NXuRGTJjcvtXSSUYdvro1v43AXNVSpP83oYOBCeSWvvspeL+tcS1nSHKizr7+bogEi4Rmb+CO8uwcOXaeZiN0oLBlc6F+UZd9mWhlXIWWJ8jMEe8ru8q/xtX/xSgHPLkchDgDyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=AGMbYnxc; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="AGMbYnxc"
Received: by chaosmail.tech (Postfix) id D9A9F1C8684;
	Sat, 25 Jul 2026 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784982370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCHjQXxXMYrxr5yB3wpWbMUM9HzItrzwrkrPzz7GJqE=;
	b=AGMbYnxcL79jyfTd6yynlpuz9rhjODKMiut97/4hQ5mEEufN/0yrjUx+ZzNm1U/m/Qu5F+
	PT0mr5t9V7jYz2xdW8eZ5owAvsoNL0DuGrGBWBURbSDYX1zcz+DDG9N0pNjv20i9FBZ2t7
	0wyXloGOtCZXF0PLlIlpL4vnP3RH11A=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 14:25:56 +0200
Subject: [PATCH 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-admac-v1-1-6a4dec023f02@chaosmail.tech>
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
In-Reply-To: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784982368; l=1593;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3Aqoo/zey1l7RhP95jMxXWVd4w3Vomi3P3qjge8iKtQ=;
 b=nOhlp9i+owoRRsOF4wPMKpbcFTGWfQReW0Tu7W3nYDbfMTzc7mk++piG+EZtZ8vUlsDFooqd6
 O9Ee+wM+7AsAuONA2sTLkNQu2w9fyOYtVbecUw0Y7XkQe1966/JuxWj
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The admacs seen in M3-generation SoCs (t603x, t8122) need additional
configuration writes and so are getting a new compatible chain.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
index 6a200cbd7d02..5b4fd8348f99 100644
--- a/Documentation/devicetree/bindings/dma/apple,admac.yaml
+++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
@@ -10,7 +10,7 @@ description: |
   Apple's Audio DMA Controller (ADMAC) is used to fetch and store audio samples
   on SoCs from the "Apple Silicon" family.
 
-  The controller has been seen with up to 24 channels. Even-numbered channels
+  The controller has been seen with up to 32 channels. Even-numbered channels
   are TX-only, odd-numbered are RX-only. Individual channels are coupled to
   fixed device endpoints.
 
@@ -33,6 +33,12 @@ properties:
               - apple,t8103-admac
               - apple,t8112-admac
           - const: apple,admac
+      - items:
+          - enum:
+              - apple,t6030-admac
+              - apple,t6031-admac
+          - const: apple,t8122-admac
+      - const: apple,t8122-admac
 
   reg:
     maxItems: 1
@@ -43,7 +49,7 @@ properties:
       Clients specify a single cell with channel number.
 
   dma-channels:
-    maximum: 24
+    maximum: 32
 
   interrupts:
     minItems: 4

-- 
2.55.0

