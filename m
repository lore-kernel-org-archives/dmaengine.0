Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520753;
	b=s1sdhhZch46hGctDK7GljIc1R+gC94A0QvzZ+6GIyoBOMLqHjQya+OElIEtxvejIuItA
	 7AlAmq9nRH4XmKfMeZuf+tJfLn1LFJTs4BpipRmNMq3TNfRflfcailOOZ7jExUvjwSs35
	 7O5jrYIIx2AGu43B21UcAgRqsEfQcvSUc/Zq3/Kth/seLCiuC3WEuUdu9CvwVCXVze64G
	 SNI0tSihRr0FoQR8Yiv2M2dVM/yrAGwAnKZEZXXFuvOTJYN+UCjq0e9+UPvU3NBrzKEPp
	 oxMka8NZn6PjXnNf4T+kLJHvsXkFEB3C2ZMNh0+EklzqbTzu43QV4ZIRenokhsXCL/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520753;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1cURh+cWjXvoC2szq8gQr/Fkr90VJ750fgGr+ihKYe4=;
	b=4njXUJUKb9obZyoFdEBAa8zgQg0axx0RxsMm383S/7Btk9xgkctfr6UNlJ/ZLDtymbY5
	 KpvqevHDWU2AfArpF29T8XeoFjYsbGfCy2TLUGdTO2QI3fftiHe1sMbF9qvEKxVYXa4tp
	 jO5FJy/W0QwTGxGv1aFvDFPpNZPTbPk37sDgQuCJZBT8TaB/034UUJrXCTNlNG+MSbjXI
	 nh4yTSu2xKcEsnXR0F0OPw5LI5+FuGW2zCOIjgWNhvBajs1paGjxA9RrwbwY05nYpN4ly
	 690YzcpQGI//NrrwHIEMfiewgtrjnvOoK8ZrDjRAKnlMdD0t78B7wEy8OpCQNZofFqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWhY64mj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA8606A680;
	Tue, 24 Nov 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWhY64mj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520753;
	b=Ys5P4A/3NQ1pi7jZxK0SWhtBWQUdeLufRAYQx2iz8dO3elD4Pl9MgdWY3PDZY5Z792qU
	 Vm/ZqDfAE1Zj9OYq51CILvFDaVo9pCOAGNjQcECu87ImNdLCoX3IRG4k0QSz2WvKb/fqj
	 VkuXsi5m8P4wmM+7K7R/bABoSELohGaM6uBgek69YsQl0WOJgessdZvmYuF93VUeRNfgM
	 +PShBdBzrOSENP9EstEftTfs2ZKhzie04Vurmm+gukFzLA2AvhmVA3ni6Q3W3OFXifwPm
	 KY1gOYjwi63Kylq2+GF3wDLyENgLSBBJu78/K0GXU0TVrRjK0pxIcGDrRi8XJDLa5mg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520753;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1cURh+cWjXvoC2szq8gQr/Fkr90VJ750fgGr+ihKYe4=;
	b=D/MxLom7vaT8iKxu37wyNY0m8MGBTdWIQ5DnFhjnbJHXd+tGYwgygbJsd6O5YChHYdZx
	 luoZnDrin21OoK2Bv3N9V0Ed+hlg6oczctbM4+3R6mwQulJ/g4mTpXOWG8ubu0z8SsfiR
	 aJ6nQuk16+JH5q+LFhwYXOq0Y5AIlzVj+fXRLYDfnk/kcTcEcq9LrNwxg/zfWacNKkHEo
	 pP0USiNYMkf2/6ETvh96kaYdWTy5ZNjyoxb24HlJziI3HSR0aATEFc/gQ28qJQxWShReb
	 7/WBnF93a0mgAGgs7j76X8aaeTvwxNAXAFekhoHzjnO1Hb3uh4u6u3TkxAHXrBEfHBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5639F1F01570;
	Tue, 24 Nov 2026 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520753;
	bh=1cURh+cWjXvoC2szq8gQr/Fkr90VJ750fgGr+ihKYe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RWhY64mjJWKnXzC7L2N1uiBecYM/3Xc6M6a6zPj2y66bugy4LaG4PHb1z9ALygcLw
	 GSnAwa4YVpGhdM3pJOCatCHmi9bauv+OBv8k21VOGufA59UHvyn6p4zBlO66HTxvPR
	 W00jRqJFK4ZnYpjkXXywZsR5rl/KUoKTR7T3NjBdGQaTz3MeVyWH6W7+J8Pz/iPOiL
	 zFcfg5EHp1O4YxiXJgXJPMwkEYL0doWHQmqo3ChlPu09VAphqCMyVIjWMQTTJsBJUw
	 zkrv2AATqmEjAsBzSr+HthoImbP/z5fH+t9aiVjde067a1wlKJK0fbcQdlDFAq5by0
	 xfSxyrAKUyZbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 13EE04CA13;
	Tue, 24 Nov 2026 11:45:28 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:13 +0530
Subject: [PATCH v13 11/20] dmaengine: ti: k3-udma: move inclusion of
 k3-udma-private.c to k3-udma-common.c
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-dma-upstream-v13-v13-11-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=1324;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=VVeX4J/dXs4ejzP8B+9y6agBzE8c91pMInXbG2KOEqo=;
 b=G5PdmSp8RSYF5NzncygzFsSMzW67ZfiKQUY+NSuy3NcWVq2sjPmFK/I8ws2RgOSrEUIBFpUdY
 7Lus++NIQk1BybdBJ9jnqS4iRSZ5Cy9HruugryauVnPjfDIm63SnK2W
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Relocate the #include directive for k3-udma-private.c from k3-udma.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and
prepares for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 7c44f5dcb117c..ff5c9aedaecf3 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2538,3 +2538,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c5de54d2a24a6..8a8e2b5e0f473 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2850,5 +2850,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"

-- 
2.55.0


