Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F123392C4E
	for <dmaengine@vger.kernel.org>; Wed, 25 Feb 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016078; cv=none; b=rj3H9/YdXKQ+pSQMycDPNXIjFc08ofkuGermkYq8i2yWsut70t1+1QmVu+s27rSpZoCOFR2bTw3VRNCvk+hZAD7tKSXv3WASdufTcIeWtidd2JpA8/psZL0TFWZRPRimTm4wJqF7BBZ1/X7NPlbr8o2F8tAnuuZ5xqCoGHHVBtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016078; c=relaxed/simple;
	bh=Ee5cJqs9AGlHrnOai87Vw6G7NhsrebwsNUtzf+WjlHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/kJsxHT/pU6cmzaCxth8WoBm4YUTLnMHNO4NUouxtIbt3IPHaD+FSdeVjmv547ySIi8jOryfT1r/ToUbuFOVDzT4NAZG1DRbnMLxt3UrPtU/7vYN4IQ13bBPSOt+VST59LhvExG/U64I9df3KJOUvw/ctamcu53Tra1mjTrrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFrG51UP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFrG51UP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adc1d9ec56so7044795ad.0
        for <dmaengine@vger.kernel.org>; Wed, 25 Feb 2026 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016076; x=1772620876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSPeK2iXnMV3LrwSQxDZgTSQGbBxT4o3wiSW4SZQv5k=;
        b=CFrG51UP2XgIX/o+roApQdrxcFK80tc83AtbT1lKgQRqWLIFpbO/H8lDanrTULTK90
         nXSjRJ6Q0DImi47Ri3S8KzRAPlWYCxNblGLJDTaikBGchOtk4imZYRD9JI274OsAxiIg
         H85Cy/68mpFs00Cmlxgyqpp8L/0AqizOFaMB1dm5uefEGaEzaMS6ixqaUcy7uJKn6AXC
         +B4kSxa0d3B4+ylRJXRZq8bLEp5mC1X3k9aJjTZFUgfAxom9ABq9z81BdSBTaEBsmvqt
         g4kR3WjK7gwh8V9qnEjCpr3KNEXDu56Z/FtXAN6c+o8sEFZAFGK7NZvAwe4Q3T08iBeo
         xxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016076; x=1772620876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSPeK2iXnMV3LrwSQxDZgTSQGbBxT4o3wiSW4SZQv5k=;
        b=Nu1LZhJneseCWQP7QbYiP3Rk3DLcF3EoBic3lRLaWjrlicEwuU6PiawSyv+JQC/Y9O
         0k7/AOSxrSCgtH82P36H9MnTv68bf4AmT/d7pe6eHqS/5TTi1bkjAEB9LO+rcUX59c+I
         drj68ucNKXLl2j4ybOPMFCMgDx07waVZ7jfJe9zT9mSImheGSXralGURCx8lfCTLbyhO
         1KRdR+5xgj6nS+e9U1zTT5BVpGRW9BhcEd+2eYhpYoXS1f6FjhCyTXSA5GikcKoWw23e
         6524/5nMF+6DJH2uCmZz1t+UW+bKMAhEIdxkqV8nDt6LWFSHTMfMKhwfxKl0kONriOEm
         A3Tw==
X-Gm-Message-State: AOJu0YwXa3OZwkd6uAocirhSowvYRkGwE2MytYfU/FEfrpWcTDzZ9lCq
	diD+mwX6sWz0C2RsK/5saCL0mMa6qojGXaQHUbLOjFWtOgunIrmc5lxM
X-Gm-Gg: ATEYQzxv0IYI3We8jWzSZCCcQLX9NakAGgyfGkZxFKaD+yFIzjndes3uemOIP21z+9n
	zNaqEJMAS0hOl1TyMPN1E5ZMm9A1pd2pGnWYP9NrhxFbLtHzAg5ceW8mIVff6nZ8JR5Zw9j1WWf
	HIakbPw4piBE/2qU0Kb/Z4TmmhPlW2P4oREi97bhDL2h29ucsxRl5MHUPQogxkh6vPMz/N1Kn/S
	MfMpN4i6CV12YLuhJQ2RyZpB9bbxo5DIeLn6dY3eF+OsIG3Rq+y8YArKCMrkc2/PrnprEdMai/d
	deUVe4R2KXL5Xeb9W7cs0Ho/eY5GYO4525KDGBjB+2JqaQm9035QcRB1oGVAC56/+U6urGshen5
	lCigiWpG6uMuMWh8XBiTNyuUvSX2DcF9Ys+Db3eU9fiIjDVq+qSWOeepWeuV8zxGRmEQGYGpZ1Z
	XDg5t7DRwtTeNJNMjnmJoJ9A==
X-Received: by 2002:a17:903:3bc8:b0:2a7:561e:690d with SMTP id d9443c01a7336-2ad74556ee6mr139419385ad.46.1772016076534;
        Wed, 25 Feb 2026 02:41:16 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad97d6132asm52860285ad.68.2026.02.25.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:16 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Wed, 25 Feb 2026 18:40:41 +0800
Message-ID: <20260225104042.1138901-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8446b4dfe1a1 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.53.0

