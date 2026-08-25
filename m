Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52404404BC4
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667378; cv=none; b=awaLeV+8+VsmEGnJVlvBk2mrHqK1IVcQQ203tiiCXEfLGppQoEBQ80Ul7j0AjxZDj7r1zYk+U9NxCDY+1IDTG7S29eTeMotDU47wZl70hAJ1dpkrqgDw4YnqlY2LFae02VDZ7jMnEUyohDwagbNOOhmhZ4BK6Y1JvfGS+MCYvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667378; c=relaxed/simple;
	bh=Y15ijkBq3cCA9hYlYCjjIjEfWdS2AnI/QEHwLbxSBoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0F8LFkwKzF9oPsBwR4UvXKHUNnaRly+ckvAefGoLt3IHur53Z9cNxKs2L0hNwzwA+HgUFQD29XiWMEJNPhYUITcyR1g386MbyTJAwQpzfkW+7xkGy4C9Wu5GvAt3RxH2f6MFRhUJVgH+dh8SohfDBP2hBQprBkCfq+e4u2KAFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DC7LwmL2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DC7LwmL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=8CrH1NjBdwNSU65k73qFHV/Fms6889dS63+AR7BlcJU=; b=DC7Lwm
	L2BWt7jzmzp1567knCaKp/86LYl/a36lNYQyDRqT0nhHAlSXQniA017h7gxa4dvK
	Lp1kQ+BLyXDS3qfZkJn92KrhfZ20cigUhVVb/GBS+ZZvd1rDOfH3tOqMYZlfW3Gm
	XotORqhgWwnfEeMPgewFnSy1Y8bi8mFFE4c/ydbO0kHijP5letI3lync9n7cIiEL
	pSKfiXHTtnL2111od4yEQYZ957h+uovV+9o+R3hJBS5HdJ0JKyDAP+TWN/aGDxTE
	ZaJ8kdkIYdsbP5zp7N+jTX+5T5JsTPZFeOUKG6dez8fvlFWluVYG6tmA6hqGxTyJ
	W5gowKt6sGLs4b/Q==
Received: (qmail 534335 invoked from network); 25 Aug 2026 16:16:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2026 16:16:03 +0200
X-UD-Smtp-Session: l3s3148p1@oIUjvt9ZLuIujnus
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: renesas,rcar-dmac: Add support for R-Car X5H SoC
Date: Tue, 25 Aug 2026 16:15:45 +0200
Message-ID: <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also add the familiy compatible because X5H is the first R-Car Gen5 SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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
2.47.3

