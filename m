Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FC48AE28
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946864; cv=none; b=VzRKppuE7CdWMjtw20Tbu9bmFVT05SOen0hk/wozpBVhnAJVVrZ5mfpbDmvZrZ7tIU8ZjbcKSP3KRCWR2MYUgDQVVZxJRs7TLagTRsnoPjN8M3l1hz9AUA6/AmI08yskIN9BqHTaxv6+l24GOL1Nt2mXy7yefrMoHWVhmrQXQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946864; c=relaxed/simple;
	bh=mRdwxYqX1HZ2VKPNPSMUIV8izH5ZdRpZ2t+GB1KDn4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgDCrSygGHOL6yqmDUbF+GFU/dKTeQe00hTMpOuMc5gu1en3lsKTTnG/whgGdtaZ91j5VHJKSGSVT4vKUYFQxCWEjzTHCz+NlWDqDtSpu5Flxhem7uU7stKUNq8DkhnPgTWMnulQe7YeqcfoFas4xa7G3605Y3wIdSDl7N4AQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EQPqwBjN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EQPqwBjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xAy7URZlIijMMsTANKzLRl3WbK9TOC4NUUCsiTTzvrc=; b=EQPqwB
	jNN4uhQ2HEFwWkxKl1bLx/AFCoYD9x5baxnHC5ZnMQsdLbemCH8XTfyn4QjboIsg
	cLq5ZQ1FPiNTOtGEqpcHCC900AVf+NrY0h0yxua42EvoNJXW0Q4c8zr7mcciS/Dn
	N1RZ65xwIG8S5Os/PHloSD7s7hXv6cFOMtqUY6/Olm5Cc770U4xDAeetRDgr3uCJ
	qT3ldtqgoaHGq1MirhTqxiBG3QBSdnD8KJqm4ZUQ/7qlzZ1sbue3GmqwXDf9o8P/
	+wKCrc6ZlTb0bVtKR6fR0ClXwlvpbdLKd6ufB+psH7/L+nIeDaUy/mU1OTcH4GXJ
	8owruozkzl9hbD/A==
Received: (qmail 3073095 invoked from network); 9 Sep 2026 11:40:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2026 11:40:52 +0200
X-UD-Smtp-Session: l3s3148p1@7uigpQlbJKJtKXBr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: renesas,rcar-dmac: Add support for R-Car X5H SoC
Date: Wed,  9 Sep 2026 11:40:12 +0200
Message-ID: <20260909094009.2167-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also add the familiy compatible because X5H is the first R-Car Gen5 SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1:
* tags added (Thanks Krzysztof and Geert)

 .../devicetree/bindings/dma/renesas,rcar-dmac.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
index 04fc4a99a7cb..d3d521c927e1 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
@@ -49,6 +49,11 @@ properties:
               - renesas,dmac-r8a779h0     # R-Car V4M
           - const: renesas,rcar-gen4-dmac # R-Car Gen4
 
+      - items:
+          - enum:
+              - renesas,dmac-r8a78000     # R-Car X5H
+          - const: renesas,rcar-gen5-dmac # R-Car Gen5
+
   reg: true
 
   interrupts:
@@ -123,6 +128,7 @@ if:
       contains:
         enum:
           - renesas,rcar-gen4-dmac
+          - renesas,rcar-gen5-dmac
 then:
   properties:
     reg:
-- 
2.53.0

