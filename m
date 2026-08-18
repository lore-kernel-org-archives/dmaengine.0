Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1924389E07
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063419; cv=none; b=ZxtfuJYyIXHfFBXhUeB9z2tjmVtz4PH9wDWkJqdzphmsC8MI8RGR6BBWrqTWQkm16u4aXkGf0yhPdTxEKGwbWvDl2S6huISxQukr6+x5aTJw/Q6KJ08oIBFIC+j0vE9n2G3bRpa8Eb8Azrcd8iAa/sHYlC+gvTf+sAOavSxTjMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063419; c=relaxed/simple;
	bh=2zGPgT53nMyKtGN4bplmgmbVd+Cg1WvfyXIJuEqowq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msOKQGFXYoLgq6CmgQs5mgVcW2qv8RyBZ4KRhDLzPjuxQZiYGszFDHWCllZ00NPs8v0N9A+HMF0Qyedpp2cM32GpNlSx2f1t8u4PDl/xTzLYj2tLmblw1jkEaxuzb7ejY65vygxVDcsbXtGvXLthR76kcOqpSuBbCuMsn3HtKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYoyPS+Z; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYoyPS+Z"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso282627a12.0
        for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063416; x=1787668216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shib2rntu2e/Z5UR8HQqW2K03GJsazba3W0OpgQm6G4=;
        b=nYoyPS+ZMPPvddDFZE8AG33Q+GktB9s4k8cTI4i3nqoa81DTZPRP+sA4Yy17Sb4olC
         k7/tuVZOV1YEhnxwKVGdAcgT6wrvuoBocG25AFto7CKMEFdInSbjtDLKghlkOJQqetpG
         4NwbmzajPVH45HpJMRgOwrfH1AHyxRXSXSZFLRBbp3BRqrsyV5hJ2tj0IXjF2TWnZwup
         CBsYEHIn4WtJvpYFwRrDplNz3WnqajPaakG1itnhVEOEQI8EbKmG0SgxEl7WMceUELzF
         NrP5sOyrUedVkVnvWS1A/X4EF6LqZt9zHPbhrjFWOnMBcIpVtVXXgKgqjm6cQn9iQhDK
         u2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063416; x=1787668216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shib2rntu2e/Z5UR8HQqW2K03GJsazba3W0OpgQm6G4=;
        b=e18IRyjcpmNro+DOVw5JDSmTrwOYJ4ve8ij9ZaogzI0FsThj9zOHcVmTX+FLnHifMp
         JsyjDq06AnkNdttxzOpZ3MMOcQ+IoFPCdgi2FCKv34ueJYZspaKt/5beWNS/eLtdt3Jr
         5bpS0qJpUKHSf7wLjYFao4VZqZXGZdXO5s1eldWsFPrsQMZlrMNOSI75MRK7q6zrxK2D
         +MwpdF2sePBmOBQqer48Vyo2afVgz4bSwEVeCdF9aUa2/g0G+VVHCD0EONQ2XFi0qWAO
         C6rPbTr24kpPC/jDPXvI20FngJoOHeljTz5xQzcQZBTE61MyZ8PkhHH4v+xTM3TUMZpO
         qmeQ==
X-Gm-Message-State: AOJu0YxPktaTdll267lUqsF5aHqI1DfmdSqPw19H0Ku2/kOBSqH9EFNP
	plZPPl2Me8Ea74zjJIFIFDVIU3q1TjVUtVk/NnT3+8VO23xg9rwP8cU+
X-Gm-Gg: AR+sD101hwI67LfnpTUd7TSasrC8MByHde+5wauXNTxNUJPJbFGm+lL1DSpsF30wbIl
	uoYW5cPGvNGB4oxYfzP5yRAAiICGyzIAlwLPbde/ekTuZGN5xOjnX9EfrV3qUeTxIgTOc8Msrit
	PlBtyDzS9JaOFqrELfun3PlKsODaU503QCFkKc2QguXzwJ9nAYsye+SDocRmJCMghQuu4g/Wr01
	d9jKUzWwkr0mEr5F7m3DLtMmiuy0tmlxkBjPIZDZVVU6v84SGYTgVnGDR5xyFh4u7C+4ACVe2Gl
	Jh6QLVa4rGdp6pO+IHnb7LXUrFskLOjJtGvcGf8YCQDHymHNkOuLXoKKIZ8/twq9rrMf6UQNReM
	OOydhGjFaHulr2MOR/T5Z/S8ZgI5QesGdnuL7qCss1pBanXCeQTCNcpzx0cxKdgw+17tP6NVAfh
	+6F3USYMKDjmKMDxFOnanKD6zuhBf0+lLyrqs8hmG5RtEaBk9opWcKw4oSI1m4NeonXLWDeNZx
X-Received: by 2002:a17:903:3847:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2d3b0c9938cmr295090215ad.3.1787063416121;
        Tue, 18 Aug 2026 07:30:16 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:30:15 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:45 +0530
Subject: [PATCH v2 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v2-3-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=2514;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=2zGPgT53nMyKtGN4bplmgmbVd+Cg1WvfyXIJuEqowq8=;
 b=U44CBfLq+mbjkIIztglKnpvX2Szjq/KUNnCaHfRupVE20B/nuOBZ8VDQDiniFFo7nOR6ojcl5
 a0qkQIOtaOKCZggjOaSYj5Lei+aZaYsAaMkpyryBk3CoRhEFxzruH3X
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

