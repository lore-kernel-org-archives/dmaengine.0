Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71335311946
	for <dmaengine@vger.kernel.org>; Sun,  7 Jun 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780854237; cv=none; b=KHmfyIg0XlVE+Hm3p5oops0Z0eQ4StwmLPWK7ldY3yBQ5uq5u6Yo2ResIQ6ZwjmvRTc/OQHw+fzljSRACAXMqHPt9aVn541zxvGqGx3XVLrds+nZefIEDvLwiAFFX/1JceuMlVmzDqXgspvWogxNsJu6k3c7LLKtJJ8y3n6U828=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780854237; c=relaxed/simple;
	bh=Q0lqw13/3gF4uns/WKal2h1G/je064L1lnG61X5XfIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WX43GfSQYU6M30zTtHICykcfRtB6fx7pfQd4zvY+FyGVyOE9SkFONW1j31eCgMwQejexQQufZtvO2D1TL/HNTG5SVOX8liJM9tuWAxeXSw0kVyYJGV9QM9R8lSq8vj/CrrtlCWbTL509a6QAhPEmkh5C95WxnObB65FF5IDgXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFN4evAG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFN4evAG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso31410865ad.1
        for <dmaengine@vger.kernel.org>; Sun, 07 Jun 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780854236; x=1781459036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51hCQtNZoxXJgbeY5Zuo3sa2yEFucyY7phuZ1UaRfZ4=;
        b=MFN4evAGLzN0mdObzDyA3Bk9sUvHNOq1NqewirsCpxtHfaXhzfOtmRUjIMcp5VgJyC
         +VRLQOJ8pXBX3WrzO/A48nFAZPFbX61cc4MLyQNPqYxzWF1fJ3BhSgcBgSIOBqBO6TDW
         4C54d17wvoazGmaI5ry+yyJ0cTW4j31XRSeeWLVF4NxJzSboI6yPuZi3xdNcVTaQQG1W
         yc1LnWR8x7cqsUenxCcVTId/jUqWpKjXbCxLhXyl4UMGEz0ZmQSD1DqLglkUap4TGn2W
         p2nDgyxMDZ9qZkfVdHXB4DH+nouvCN9r/NcW5APePzKRqBo+/XXk+6FGvdoeUANWsYc2
         MfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780854236; x=1781459036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51hCQtNZoxXJgbeY5Zuo3sa2yEFucyY7phuZ1UaRfZ4=;
        b=MZgOa2jHaWfz/fA3XogUthY+tyGUwBH51d4r3eje1nlTFu0mlmrm232MlWMydLpvoM
         ixG2FDihLJbnvzotGhB6k8sn37kr+agnR24e8uDEXuWv4P7uHLBcMVd4hJPDQe1DhT1I
         DUyx5tMymQspSPs2XoMjl4I7DC605y+1eQ1KpM5uT2T+QC5pvUwgfKegmHk88xNkhMvc
         UDVyONzu0HT7s+O9Ih4ywKUCJH2FuZP6SGCNoQO6jLtYhiMTxx3jeaWje8NO8fpdUowP
         neLGPBlVujezfiF609xgvpg2q+w3qQPSYJ1uMyGQdJsENiFQ/vJ11Fk67Xwvcmy8HHo+
         KwQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OCwoCHEnvDJ3+8szIEUEID+ufqa6d4wrWcEHIOwQDvTkyKYgWlFGu+0PBUsC5cTsoENIPd3AcG8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6M8EPsMKjtNwM2wc8CI2RjooalxlhqCAc31oezVHsSw0VNK+e
	6uBMcta8F5PlfF4xiOA1Y1geeIvxiwDs3O7fCPIkR9P0lqLygJoUKIhJ
X-Gm-Gg: Acq92OE7DMOaVVGB5hRzZk0VSC9bBnTirFztdrKYIU/vnAkNKrPLPbz4CubvgpVNhvj
	0JYgzqB+Jtq3sF9sXAaZwqrGiobh6tsIePAe8J1BOQGFjWZBbcBSt+EjAtC+3EiLdTy7oXE2B98
	MqgRXsdyaBDkebZD/jtcrPFW/ki56GHixVNOsBhxvkKMXWf/QdE2WbAXUxdxdoHCQL7JIb3DlPO
	1nCPUyKGYl84HIoz+ewo6lm+G7pGY/muGu2OnJY9e3YLFA19//AnNWv2YxusXyg4eNsCn9SITII
	WcgpvDHdLxnJWb6acPL6vgzEu7XWuj7FRTTe1CsATmRTgSK+0jl7/wng5y3y/KLmUdUAZvAFzlg
	5qiUDlsDzNQX7tnEMBF0zy1c4B1ljXN7n8LBaQaTFHDgrnBai0nDqryAQZJyys+xh3IItKjXfS+
	a9YwkhsHQePOEdlfs9gYY=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr144525455ad.16.1780854235665;
        Sun, 07 Jun 2026 10:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm149171185ad.71.2026.06.07.10.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:43:55 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sun, 07 Jun 2026 13:41:31 -0400
Subject: [PATCH 2/2] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-b4-k1-pdma-req-macros-v1-2-5b2a3955007c@gmail.com>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
In-Reply-To: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Q0lqw13/3gF4uns/WKal2h1G/je064L1lnG61X5XfIc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhizVtWev3/p2qE70xoZFWnK+a9Nkv64uWXbxuO0Xs59CM
 17P77Pe0VHKwiDGxSArpshy+GhL9tZXPtG+zzl/wMxhZQIZwsDFKQATOanD8E/llLyc8+xv4ap7
 lqx+WP1YXLL/+rrE2w1Hn+2+XBGgkOXL8E+5QpKjef/Eml8TXLN3fjjz6l3ghYft2oXfXErfnNX
 csoAJAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The K1 SPI3 node's "dmas" property hard-codes its PDMA request numbers.
Include <dt-bindings/dma/spacemit,k1-pdma.h> and use the K1_PDMA_SPI3_RX/TX
macros instead, for better code readability and easy for future
maintenance.

No functional change.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..c413a64d5560c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/dma/spacemit,k1-pdma.h>
 #include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
@@ -1094,7 +1095,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

-- 
2.43.0

