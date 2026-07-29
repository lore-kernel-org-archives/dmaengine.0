Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78976476060;
	Wed, 29 Jul 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325616; cv=none; b=noaq8ohXnqH79kw6c5mkcBftpwUFLpqu/MHVrZZEBTasFNUV+qHwiMD4QNAmnFclKHA58voGnGN4xW2ckrnWvUPyHMV0lI8s3xPXsjyETIm51YEE8DsEpzuGDcu0uw5ZXPDZMGfdHsHIzhiCWqY4IdKP8CtFYV2UuTUENtDWfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325616; c=relaxed/simple;
	bh=v2dOZDaxp0DZkMeLavv70Zh+ElwareDDu7QcfDJGnaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qx0onORSMaswAQVh1ftDWITdI6/XlUJVFhvQFZmH+n0uebOtxm4jhu+OoJJhRlNFUR2QxIOrfQ09mYsogg4+0ja1t+UPs+CtsgRSw+Zyf7Ky58+exF2Q5ke+9HqlrBHQrpKb+SzNwL03iUoOLAThr8fjbDYFd/TH0AWqShDYQXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=X8wuNjIQ; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="X8wuNjIQ"
Received: by chaosmail.tech (Postfix) id F30821C8806;
	Wed, 29 Jul 2026 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785325605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjWWugs5bJ2v1tG9OeuA8PVRNMAb2EGqaY6DxBYnZtg=;
	b=X8wuNjIQ4JFCFZ6+3IXJ8dzaDB6ITTa9w3MY2F34y+X4Ra9LMxfKjxgiI5ewe0NqUxuBSp
	GntjHZJhyYP6F4rp1dqSvXykeixqYq7yPXNjRRfkplVpsBaXMqPlSS4Ve1kubILC0M5Yci
	q/0wJogsTRIBy+vtKkgy3Cr158e7b+8=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 29 Jul 2026 13:46:34 +0200
Subject: [PATCH v2 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-t603x-admac-v2-1-e4b2bb6ca45e@chaosmail.tech>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
In-Reply-To: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Joshua Peisach <jpeisach@ubuntu.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785325604; l=1691;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=v2dOZDaxp0DZkMeLavv70Zh+ElwareDDu7QcfDJGnaU=;
 b=/sTI5XpwcgmEEgK3zjJ9aUKOX4KzI2uNaUP0uwgeglpbtwQLzQ8QHU20w7xjpwl6+90KXFdtj
 lH2lBPHKm86DEwZdQDLMfKnOXQzxfkQg8bLFcLoOyEEtVaBBSRYdQpm
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The admacs seen in M3-generation SoCs (t603x, t8122) need additional
configuration writes and so are getting a new compatible chain.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
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

