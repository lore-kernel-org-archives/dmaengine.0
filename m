Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A8A4052B1;
	Wed, 12 Aug 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526809; cv=none; b=TEmbTlJaxXHzgir6tr4YjftsYABuj0lKUssHD6KoX+cd2t31Kyi9nScL76yzVSbMbegENhZuGi28KKTySnYgbQCEaKmVh1kq6jelwoj4VmPMj034vpwujycFavnIlNty+cSzWZ9IMSOLOyDduaG57zt+GRO2UHnJf6C/PVs4xi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526809; c=relaxed/simple;
	bh=3cJuwk+SwgAMtlNgWNyBZ4gRlYU1RemC2UGW6KC37gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwabe81Y3u9ThTfsOSbak+X+YhVI5gO/sGYxPYyWUzUT8iS66cY70fFaHXl6jPd4FpBfstfORRaQqtMg6flK/oa951K60DbSm/Csh0+LGCYAO2005R8P7TNjCgA91fvj1g1b8DkYil9a1OyNRvg7FV6mxxiiT03xloPIFEgLygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=IHUOdoEK; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="IHUOdoEK"
Received: by chaosmail.tech (Postfix) id 786C31CBF48;
	Wed, 12 Aug 2026 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786526799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXFSBU1xWiPxMVGUsDxH0Yvws9+xQ3ZgpzZeeM1bKsA=;
	b=IHUOdoEKdC2GR15W21totkGTsYxvVSpUw1Rgx6UTOQICM1kOkDbJ1YgtzdL7JsRExyKOZc
	TtTkJFVB85W7yedbPq0zGHNNXYvFyCH5dx0XRi0ZTcUUrFDSmiGoWsI5kJInKuCFGYCekl
	ypFbVR2FZepqLPWAyBGovdWUaS2hTAc=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 12 Aug 2026 11:26:33 +0200
Subject: [PATCH v3 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-t603x-admac-v3-1-d1f137f803e1@chaosmail.tech>
References: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
In-Reply-To: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Joshua Peisach <jpeisach@ubuntu.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526797; l=1733;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3cJuwk+SwgAMtlNgWNyBZ4gRlYU1RemC2UGW6KC37gs=;
 b=etnzUXOg2TP1uuUZnOGX8Mq2EU0UnnOyLlJRqLwdT8oicdKQLjEaBqxoFDtIbKIVrfm4kvCA/
 S70u/F+NwcnBOD1Hq5grUbMp2nx5bnsQFyuZfDuKJ6DDsD2FmlnipTe
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The admacs seen in M3-generation SoCs (t603x, t8122) need additional
configuration writes and so are getting a new compatible chain.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Janne Grunau <j@jannau.net>
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

