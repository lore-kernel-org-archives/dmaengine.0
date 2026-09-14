Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A482447805;
	Mon, 14 Sep 2026 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387880; cv=none; b=GZfWKA2ZUs+zqpVRHJU/+Pc3MoBkxi6He8hHTiifHxM0j0dICj8ey7PbPVI88rNmQnC5QG6ky3frLczgOmwccPHc3K1nBWrxrLeDgQBrHqEJCTd7pgC3z4j+zqWPMoDHjRxetNRhc2aYLNXGYg38xJAtEh0lv7fb84lPW2qHIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387880; c=relaxed/simple;
	bh=Wl3ENf6BnjTaC8yIrHzo+jFAUyZCF78AjgSJCTeDpsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=idxt+GCgVxU+5IcYMMgY+YdWCft6YV4zKLRCdNgunLrg/Dr7zUg79XnSTZLmlnyF3RP4QPBQQhTjK1bKUAYAiC6L39yF+ihsU0xzJnOed7nC5OApt0ZYyh8pgF7VVW8kymay1fCXun0lSlYmXlnVGtjumdfPICvJ5R8FkPQbV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCpdq6Dt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCpdq6Dt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A27A4C2BCB8;
	Mon, 14 Sep 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789387879;
	bh=Wl3ENf6BnjTaC8yIrHzo+jFAUyZCF78AjgSJCTeDpsQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kCpdq6DtgJOWAmHAVesZBQZ3QI3SR0VjjqtVlKVxBD2DzeEDSud0cbzcFUbNA68yq
	 ORRzC9AsXJPmMfMv+RlMxcS4C0HRLOBslEYWt+WKG1bzOXPi8FsgiaCDWJxQ9Lvpb+
	 vmA1aYFhe3qrv9pdnyD30TxdyNyuGDmLA6gfwWEFq09qwFakjxWVxf1lUNKnYf/rqi
	 CxRxkCZ6rJjx/GlrKVvJoVrUbR7eYpWARCOtZogFrgLJK+Mu8e7NaQddF/88S4+vFD
	 ktV0yt0p+0Xk6LszE8bxenBNoNwsrDvy1V9oqDrW45NzS62t3wBhZFUM430LVhEJkx
	 iB9AfEM7tdP4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB02C88E66;
	Mon, 14 Sep 2026 12:11:19 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 14 Sep 2026 15:10:52 +0300
Subject: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB1IQv2pVxEXcTLqFGoliUUQ7
 27U5bd4b4fAXjhAk+3g+S9BfnOCzjOgyc4jo7hkMMqUqtYvLIvKoIu4Wh/d16J5MzmtqposQao
 Wz4Ns97HtHoe1/zDFawPHcQI3ahAucwAAAA==
X-Change-ID: 20260814-6572-dt-uartdma-29ecd1078cac
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789387877; l=1054;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=R/+/MvTbfqvkqZYPWb9QyO+k6HKf/kl6ZguY9m0N+VQ=;
 b=vHFQ8nf+Cscdtn5vC9FyI/0sorPVchBdXpOIQ+fzj8SGBcpe4ZMoTKRWZGvDpsjerB48ledz2
 KESJiMeDfqWDtBQYWIV6sKsJwpR3GB4+CKVowCWSei6VHMLmKXh0tdV
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 APDMA, that is compatible with
mt6577 IP.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Based on next-20260813 tag.
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index bba20e88a6dc..bd5f5260613b 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-uart-dma
+              - mediatek,mt6572-uart-dma
               - mediatek,mt6795-uart-dma
               - mediatek,mt8173-uart-dma
               - mediatek,mt8183-uart-dma

---
base-commit: 2697ef8943c9985c14708a6429e21812693857b2
change-id: 20260814-6572-dt-uartdma-29ecd1078cac

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


