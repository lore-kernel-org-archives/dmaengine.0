Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214E3E5EEA
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218680; cv=none; b=cEajLGY5VM630aAKq8y7JcB/6FZEDVnqutdBJTjPx1828Z4lsuhNul+DedOcH8WpkBLmj3+x5iOPO5MSobDTIwaQ5PcQHM4a3Ui/55FSPsaqwFhS45yMQ/fasMePyk3k+/2tX35TxOpsXFWHDsg072/5MLUpms/m8WQz0mwbBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218680; c=relaxed/simple;
	bh=eP2GsusgnC1pbU80sJIT0eWrfLWddFQwIfPwMIT9cmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPtDkSohR+eqbBys+h5qCBicWn+DyDxG/0T8eNK47wR06euqX/8X09ZlNYDlnbeLh+0yrDwmBlVdZIcMSrpfV1cpb40iuu0FVvbE/vsfk/4N9nPcEcgEtZOiq0b5sJLT7bhO4hKcqC6pwdjxMk29HwRZgHlrrB81KmUIO7BLskI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhUKuE/g; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhUKuE/g"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-394f4397662so535744a91.1
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218678; x=1788823478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBzDYqJz1rhOo2qIbSAQbkR5tnylL7yY6lbPSQMXgwo=;
        b=YhUKuE/gFBfS6CA6vhx+EjfqKRXC9cil+jcaxcCW0DSUxfxTE39bkZwjiHkmTX75Dn
         m88GCFkVxt4q7/eHD8OJ30/mqJfOh/ykDbF4n17ZTM0VEPuW1acOdDS1aKqod8C0sKHr
         QtvyjWpC0MhdYIPzbn+zsuahKqa6TXtkIk18zo2GkUm4KhLVwHEbErCk4kXv96nTJA5T
         DECpdDzRpFT4+w3/DHLuLEk4epvBKdylLRrdrK+jjjLyZNoTdpcu8Rh0acWW+ynEgjMg
         +6QFqESrVLiSF7I4WDgJRmkIxAl3ALrjOZRBvUZKFC9x61hRdtiPwSOqrXcmOyT6iqvg
         JBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218678; x=1788823478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBzDYqJz1rhOo2qIbSAQbkR5tnylL7yY6lbPSQMXgwo=;
        b=oj0hd76VGg5meA0RsL1IrR86p0zJ6XJ07LNfUQtSfwwsAEsxn7cRN86yypBw63mDVy
         QK+56gXmW+RoWwAUe7DPbNcTBQWJtEV3vvc6toFkkPdD8TvIXcEr00Ia2sosx1QzkwDJ
         SAMf3iTUJ8H/ti9KaHVJ/JPVFYNOB0Aewbetf/nmTIvMdYl/gD+Kv0UWJiJ0Q7raFwEU
         lwasUqKtsZBKtAREvLGPbWuuFyYwLMtnsYxSr3PUfFQx1Crt+bfmy/tSObi/gasGonzx
         X5ROiV7QoB6v0KhP5OSWg4Fo3RjMF2Bsks5i3Ut0dKRNrxub1a0bQ+2IAaGxyRAXQxL4
         XH9Q==
X-Gm-Message-State: AFuF++lvK/AUEioOAklcQcG/vR6CbUAYiqEqj/o2rxKkSLwU1kCBRWnk
	Z1A8UT2GY8xZ4/PkoTjgEn2/1SgxB3wx0QGV3poAblC6mihe1ijPKqRE
X-Gm-Gg: AYBFou13zU82MoaxBMwdrHBYoDEN/pYDu7vZzJMfwuOy2jlH4L9/Rf0eLv0Zx/z+99p
	ZNUE4AHcaXFF5wuxgZeJc+ahyBHo9LLEMweTOWZJ6uWK6XYLxhZJbgydZiiSFszSTUag8lh7ECy
	wxPyLKBp05qJpem2LnBnC95pDBpstqgAbMma+su6TxlZ/h1iXXqK1l9zRH4nCXF5YHACaXVtneA
	iV/RDpeF2BiDUKLokgkUfEIJPFgu93R6SF4yjYYIqX/3ETGZqrflz2tHMHZv+d4vLHhWgbUCxbr
	mrUoNubIJU9owM04hcNWZncZxx3dpu4/8MTRwWAi33Lbyy6v+p+6zjxNRR1GfuwQCyM/SH2uIAq
	cHBfBNr6Pv9Q+EwrRPUJnvaOO1mmCxCWc5tV7xGQbkM9L5w3DQ7fDk3H8y7IYUrUqHYiDNQmUvK
	52cqqkrduxUtFay1a5yuUGW7Pi+KFE2SjdWsorpndta+79PKa9kY7zTG4UMI5rFbN6MY0mDAc=
X-Received: by 2002:a17:90b:58c8:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-398bab4a682mr15575622a91.2.1788218678209;
        Mon, 31 Aug 2026 16:24:38 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:24:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:07 +0530
Subject: [PATCH v3 3/6] dt-bindings: usb: ti,musb-am33xx: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-3-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
In-Reply-To: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
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
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=5224;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=eP2GsusgnC1pbU80sJIT0eWrfLWddFQwIfPwMIT9cmQ=;
 b=QKEENH/pj3ZaAy5ezfELNDe8pUzU+tFPVnNjJtdxDFCz4/6NtxPSN1SnnaeXP7MXy6zDXGJdZ
 kLUrMckFkwTBgWUvFyjKaYnWZ7kD0k3h5Eiy2kJtstOdTebdX2jbHpl
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM33xx MUSB text bindings to DT schema.
Changes during conversion:
- Allow an optional vbus interrupt used in am335x-bone-common.
- Add the interface-type and phy-names properties natively used by the
  dm816x hardware.
- Allow 0 or 1 for mentor,multipoint. While the text binding mandated 1,
  the Mentor USB IP natively supports both single and multipoint
  configurations as used in existing DTS.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  25 -----
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    | 113 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8832843c7d7c..5973f88bcc65 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,31 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB
-~~~
-- compatible: ti,musb-am33xx
-- reg: offset and length of "USB Controller Registers", and offset and
-  length of "USB Core" register space.
-- reg-names: control for the ""USB Controller Registers" and "mc" for
-  "USB Core" register space
-- interrupts: USB interrupt number
-- interrupt-names: mc
-- dr_mode: Should be one of "host", "peripheral" or "otg".
-- mentor,multipoint: Should be "1" indicating the musb controller supports
-  multipoint. This is a MUSB configuration-specific setting.
-- mentor,num-eps: Specifies the number of endpoints. This is also a
-  MUSB configuration-specific setting. Should be set to "16"
-- mentor,ram-bits: Specifies the ram address size. Should be set to "12"
-- mentor,power: Should be "500". This signifies the controller can supply up to
-  500mA when operating in host mode.
-- phys: reference to the USB phy
-- dmas: specifies the dma channels
-- dma-names: specifies the names of the channels. Use "rxN" for receive
-  and "txN" for transmit endpoints. N specifies the endpoint number.
-
-The controller should have an "usb" alias numbered properly in the alias
-node.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
new file mode 100644
index 000000000000..cc01edc75d11
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,musb-am33xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx/DM816 MUSB
+
+maintainers:
+  - Ravi B <ravibabu@ti.com>
+  - Ajay Kumar Gupta <ajay.gupta@ti.com>
+
+allOf:
+  - $ref: /schemas/usb/usb-drd.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,musb-am33xx
+      - ti,musb-dm816
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mc
+      - const: control
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: mc
+      - const: vbus
+
+  mentor,multipoint:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Indicates the musb controller supports multipoint.
+    enum: [0, 1]
+
+  mentor,num-eps:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specifies the number of endpoints.
+    const: 16
+
+  mentor,ram-bits:
+    description: Specifies the ram address size.
+    const: 12
+
+  mentor,power:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller supply capacity (in mA) when operating in host mode.
+    const: 500
+
+  phys:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 30
+
+  dma-names:
+    minItems: 1
+    maxItems: 30
+    items:
+      pattern: "^(rx|tx)([1-9]|1[0-5])$"
+
+  phy-names:
+    const: usb2-phy
+
+  interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Describes the type of interface between the controller and the PHY.
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - dr_mode
+  - mentor,multipoint
+  - mentor,num-eps
+  - mentor,ram-bits
+  - mentor,power
+  - phys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@47401000 {
+        compatible = "ti,musb-am33xx";
+        reg = <0x47401400 0x400>,
+              <0x47401000 0x200>;
+        reg-names = "mc", "control";
+        interrupts = <18>;
+        interrupt-names = "mc";
+        dr_mode = "otg";
+        mentor,multipoint = <1>;
+        mentor,num-eps = <16>;
+        mentor,ram-bits = <12>;
+        mentor,power = <500>;
+        phys = <&usb0_phy>;
+        dmas = <&cppi41dma 0 0 &cppi41dma 1 0>;
+        dma-names = "rx1", "tx1";
+    };
+

-- 
2.55.0

