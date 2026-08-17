Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5E3290DB
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003280; cv=none; b=DImE9JWMs6iGUtj7Q5xQgI+KQLEWmX8pyiYmOZdJsfBYJwO+aUnUKl4L5n8PFkM/VoX1uvTxPY1GK8XoP7fD1V/3snjud8CZJnCa89LFsg2xhQxrigZY0cjifGJr+LCl9fjY/+FScXLF43ZXLO6/sZN0yDJY2hbWljts5YGbFh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003280; c=relaxed/simple;
	bh=2zGPgT53nMyKtGN4bplmgmbVd+Cg1WvfyXIJuEqowq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lo0WkLyLGRYT3E6x4S8hcDArTkYMno7pvMr5N0Rsq1ciJwn1vjxN18whHTf7ox+bBh9UFlWKZTHZ7p28jFFab6Yxdi971+5+0rxV07N+bPVm5hMYEXTWpM0M/P6KjWUY6qT46ZBv3D2P+EfYgOtQzeP05ELhzA7fy9dQb4wHQkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmChcg7P; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmChcg7P"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso344700a91.2
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003277; x=1787608077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shib2rntu2e/Z5UR8HQqW2K03GJsazba3W0OpgQm6G4=;
        b=WmChcg7PcM+dluZU5BEOWq8wlz7BtCkxQcbpJRN1xCc3BcU5ZiCr3z92RhUZD/oKiR
         VaghgZk8iCoIkdXlOzUa77RfxlOEhSZoSTms2fmXfxSxgdgm4CcZVAV8tyfPHY5sE0y0
         VCi4MkunjEE6dgDKo1A4pHWWFoceixahPgfCnLzEGS60UcSybaxBzixwfJ3AORGE/Wv6
         C3VCMnxk5nGEzN2XCnlPsD9z+EMuCkFO7JP3sa7tXerdWHfPShBhHc6DmRwq0IEOLeNz
         NGlibCVWv87fDPzNFK5jqYMXRrdfN27dqzlB+RK29CUyIg1CSP6nUzLZL83ajtTttVIa
         G7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003277; x=1787608077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shib2rntu2e/Z5UR8HQqW2K03GJsazba3W0OpgQm6G4=;
        b=KrvOYF18izA8I8dYNZdvnUGHKwyk8uHyoeN5kkrk62rKaKXjLDXmAqguBdisS1bamL
         pv3yO/2x8n128quUkX0Vnm56Wnqi8+DCTLQXftevE1AFiiBeA4txqyXgM+Jb0LzhhIbd
         L+s1IUE/poZe3ngirUj2nD6X+OnlfwQYLpZYjGtzQdBjFWxbsLMnmRfEqEeR/Oxqv0jJ
         Nx4hY/nISsY4Qhrpgvq3m73+b8TbDXOhnsFEMsCWqzRzPAWW2gWpr8BuHVvDzByyvGsW
         q2l0rzizAEEiT8vjdmuc+ZOn2GO9dobt9f34Hrpkq4KruGmslpHBHmemTIlz5NIjcwrN
         /F1Q==
X-Gm-Message-State: AOJu0Yyuu0GL7H3tpYNd0hWTjiNw+9Z1KZEWxzPoTrM+lrRkM0sovFx8
	kBIwGpCR+CUGHphHnU7E9mj/uyxN63V10PO8Jgu4EYy0cyw/HlbuRGgu
X-Gm-Gg: AR+sD10ukSI45HEaPMf7CBKAwgaapj8f/x0Bws0pir1hFajh1yf6IM9pRQrI+Ep0/Wm
	WrX7Z92VSo2Wio1A6XrGJqOoCMzotvwKw9qmdJ+crLTjm0/zNvJtjRx2onhhgBMxsKJfs9QCrDW
	hSLHyw8ZBNVv0XfPJ4ZVw4q6C9m7y5XojudwrVRDasRPnjHT5Dqt05O21QXGBPt2gvjnDC8Nhz1
	kzPFX530jc9v6CweiERSMeUfF6g3L+lItRytmFWEDbGF4EcNClsLlB232i2MatOdZhuDXdTy70V
	3B0qdsIVwDKYS2SuxBXn5vZmNQkd1dt5w58fUzA2EIbWmsyFt2J/7mYPyfkWGV7JDQxBdP8KkUK
	6cqwZKt68mLq0rDxaagcm/ATxNid35l3lQXguE6f0ktQOtUm3GsFAuJKsKKJ+hV2sx/w9TXmC30
	ejZasQtTpqsSpMG52yVKYk88c31+FqjqdYFAep25c+paDytdGvLV7c4mNQ80H7GQKXZqobgtqy7
	3w=
X-Received: by 2002:a17:90b:3b42:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-3933baae9c6mr19716659a91.3.1787003277081;
        Mon, 17 Aug 2026 14:47:57 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:47:56 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:33 +0530
Subject: [PATCH 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v1-3-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=2514;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=2zGPgT53nMyKtGN4bplmgmbVd+Cg1WvfyXIJuEqowq8=;
 b=J2aDNs1JbD5WHy4QICMYeixKDDwKXUIq702t65HPDqSG37dUVXssumHiJUZjcOf+0PeHyYsGR
 5w/krRlhbnHA8APgYbNaYQk/sTkjsf2Rt5UBG/QDaHSLSoX8bWnhSSs
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The am33xx.dtsi defines a single interrupts property for the MUSB nodes.
Several board-level files override the usb0 node to use
interrupts-extended instead to include vbus interrupt.

Since both interrupts and interrupts-extended cannot be used
simultaneously, Add /delete-property/ interrupts to the overriding
nodes to resolve the schema warnings.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi   | 1 +
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts       | 1 +
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts  | 1 +
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index 1d83fc116b66..c436edd98e10 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -197,6 +197,7 @@ &uart0 {
 
 &usb0 {
 	dr_mode = "peripheral";
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index d430f0bef165..7da2fb782ab2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -304,6 +304,7 @@ &uart5 {
 
 &usb0 {
 	dr_mode = "peripheral";
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
index d21118cdb6c2..6bf388c4abbf 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
@@ -35,6 +35,7 @@ v3v3: regulator-v3v3 {
 };
 
 &usb0 {
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18>;
 	interrupt-names = "mc";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
index 23caaaabf351..068ea23bbc0c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
@@ -376,6 +376,7 @@ &uart0 {
 
 &usb0 {
 	dr_mode = "peripheral";
+	/delete-property/ interrupts;
 	interrupts-extended = <&intc 18 &tps 0>;
 	interrupt-names = "mc", "vbus";
 };

-- 
2.55.0

