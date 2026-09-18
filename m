Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B550B407;
	Fri, 18 Sep 2026 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746411; cv=none; b=aObHYg7mBs9lCFn79wJve1wkWsD0kjcGUExe6zqiJc5byrRJFvis+ENQs7Fkh5Use9ty6SWxdbWcDLyUiQ9JxvAdKN0B+ha4Iel4wjaWYuz5aWMXlzp8D7C5TYHjsxP65AG/Cd9DVPq8QTsg9X/xD8TzCjcxRvAyCGRXiJmNB10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746411; c=relaxed/simple;
	bh=ynopiZN/0hAwTlTK6FzFkyoErSsBwQh8mzZQQTHrX6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GikXYiTynIw6XfJMWU623y6sQNuV4A2AKrrrJU5Ia5OL3XoELfpbAKvNCvIK058whpVdfX9reNWdEBIuSGwk6rFzAxDBEkwG9qP7ncbXLyNp9e761Zyn8j73b2hDxkGtcIrgx9AyyOYkASZoKlyX2kxhPAoti+nqW4shn9EeegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwK4dlNI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwK4dlNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E02B1F000FF;
	Fri, 18 Sep 2026 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789746409;
	bh=JboVS3406K9moY3GyytFj26wML1m6YzGEP2O+AdCWlA=;
	h=From:Date:Subject:To:Cc;
	b=YwK4dlNI9ZSqRvZCTd9nNFqC4V6p5TqniA3vMEAgVE50zjDoLR9Hnjl+xonBtCoWN
	 yMQ8lZKm31VlE9/JSU0dtM5p+GCTktQLMkh9Qx/Vgy9VhuN52LZjcHxFnxwe12fGsm
	 PyiXT6b7ictQlkVMXcjURu0RGBarD+MLeg9lauwKXIDPI1K9tU+MR+EYw71uDqkfC3
	 fAZLu6r+mzW1i4w7m3i+ewt5oxaiXONhw16/ZPqGJIHuXaqCo4tD4A8h4qk+3o5TP2
	 5CiEg0Yw2YrpPbOLYapbRFfd2HCCauZuMQAmv93tdVNUZXz4EUh3ZH/tzxEJFox2kv
	 RTmPqrmBnbzUQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 17:46:45 +0200
Subject: [PATCH] dt-bindings: dma: dma40: Restore disabled-channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-dt-disabled-channels-v1-1-0f691109d8d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrB1IgrS2VxEXSWaqAzaVjIggu
 buxyweff4JyFlZ4Nydk3kXllyps20CcfZoYharBGfcwL9sjfX1nkDYkUR8WJry7xIuis8HGSNT
 zM0AdrJk/cvznw1jKBdWrvNpsAAAA
X-Change-ID: 20260918-dma40-dt-disabled-channels-21b1ccdd8e7b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The conversion of the DMA40 binding to YAML omitted the optional
disabled-channels property from the original text binding. The driver still
parses this property, but additionalProperties: false rejects any device
tree using it.

Restore disabled-channels and constrain it to the physical channel range.
Also constrain memcpy-channels to the limits enforced by the driver and
reject duplicate channel entries in both properties.

Fixes: 23fbc87c8ae6 ("dt-bindings: dma: Rewrite ST-Ericsson DMA40 to YAML")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/dma/stericsson,dma40.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index d8f92838f4c9..81b83603ea79 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -140,8 +140,22 @@ properties:
       - description: LCPA (Logical Channel Parameter Address) memory.
       - description: LCLA (Logical Channel Link base Address) memory.
 
+  disabled-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 31
+    uniqueItems: true
+    items:
+      maximum: 31
+    description: Physical channels that cannot be used by the DMA engine.
+
   memcpy-channels:
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    uniqueItems: true
+    items:
+      maximum: 63
     description: Array of u32 elements indicating which channels on the DMA
       engine are eligible for memcpy transfers
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260918-dma40-dt-disabled-channels-21b1ccdd8e7b

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

