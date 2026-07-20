Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD83CF661
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549070; cv=none; b=HmSXRiiCnPTsITEffLgeFa6Q7A193Hhy0hVh0lgz/cmB8dNmlDXvTm7i1IbtYKhw6DfywBf1HuRxxlxQ/gJfj6pundtn0mNvYpkq7JkMzWAczYxTaXSgr9qMPYs7miiOVQrjt+3Q4jowYYNIbIbv2Re6wKFB4PE4nC+Okcxa+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549070; c=relaxed/simple;
	bh=6VBS5M0CCr9Jj7oJefbVa3Pxz3o3UGvU+x2kN5eD9bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbbWxCFlWKd7t8Y5YaW3HDacEQ7MH2xPBKsY5Fjvl1GY7QFBIvU/Q4EwQdIiSnFsTl2BSv2kJe8A2oVGRDju6UELkSvGqviINBwlaZ1KevuPSLqtvQPNHx/WsiFrVN0ZJN37IhOkh62e+sg77+ABjquxK3kWiLIuGLFY91md1zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FUw2xb4U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FUw2xb4U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso498327f8f.2
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784549066; x=1785153866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRlyDfVOJZrMeVq/2E6eT1IKHDHzkOAcurIgJQkaKNM=;
        b=FUw2xb4UO9nLBs8+LDR3H8BZQRiy+5duDbqWH9LgYlR/cqmhppSr0EshHcS4X/0tD+
         P7NIHuHHzUtb86NNL/+1znv7UByTw+tsp5dU6bTaWGeChS4dS/OW7SOxKhQxfbnCGHgi
         4GRxcCbpS3+onXIB9BfTzTMvgOOEMraQdbY5SkKX5L1A9/PACZ/vwbm5Vu7Mz06GAYei
         6QPYm8TWslt6PvBTTs2DD0ygJXV5xaQ02d7UQK1zZI3canaR78p8IR7VmcglnKRQ2kGU
         arx+Sj73OmkZiJmH8jqoi9G3RDV2OUP/CPLMz9fk3PznBUbYkUmoWe4wHYF9p1CBx2hw
         Z0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549066; x=1785153866;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRlyDfVOJZrMeVq/2E6eT1IKHDHzkOAcurIgJQkaKNM=;
        b=GTvlA3jizMkjF8VDDNmUhkE7f5Plp2l3UtU8Hsj78EwvDmTSa208dW9ZBWhaRO303b
         uvkP6RuhuxBwxgK3Pu3zlkc+Op7MDaFL7N8SknWO5CeQaNPvd+NMrUAzW6Hes8byvwk0
         ysfetkO2R9tCDmcGBFlEn/Ttj3MAPdicRemxefNETPXUV4Y7tEH+yGyMWv5hl6qTAqHo
         w/OVe6zjNistUNFoEaauvPBKpeGujspZ926TEeOxwXVhk8DHJE/U1Uwq6O72+9hcffjC
         nZujKvUpbB78Y1lwMNIVIw/JSl1UD4dd8mp38x332y/M+gDwaQqiSDWTbPpwlCNMB97N
         7NFA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9DDLhQGkQqTqjqCCjPHYJC54lGF7soaJBbZHxWW/sDXVJALMMDOno5bXRCDU7q03KTRG42LCtpvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFAxBiczJnbq4Qj3DCwSsFooT5Bf8/phtLKIfiIfGG/bEw9Hw
	DiCfI8awSyvxxyckdHjZxzP0EzWwTcTiel2uIsG3+cSv9jobHsq0dQEZd8X6DXRss6o=
X-Gm-Gg: AR+sD10Vo7ZddR2WO5WV7JxomUAGLUaZ0+rE/gwuULIrzoxGNVytkAaCqDBM3WtW3Vs
	bd9aLpV3cG4ML3doAHYGynprkETSNQWxU5KsGGTio/GwC894tb2tdlpn5oTnLWjdojmxp0DpJG+
	X6pTPgtVBgqDgkr1P83f9stVSKudRnXNnc9CUnc9amSe/YtWn3UzPERRF5mWk3Ji2ADHpgIPzDW
	x0tFxmSPwlrO2F7vzB7Y5SVNFDe+OTiPxwcFQiW2JffnELnbnJp0dNE8yTS1+2wZ4R6tY3qc2HK
	SGhQBNOviMLvgOjxgiqUdW6Eqi/fw8K6W9yz08TN0P45MgltM5100kID4PRHzZvGajdwReMfZny
	jKKZRYkxQFtyiA55m0TO93mAi9cgW9qNXpyOi0HK4zFTiRAYlPeNf5Nblet5vVnHppOujg/94X7
	L0fMw6pMMk2gAto4uyafk4ukNlGioPuG60kB7ZrrY/w/5SGYHCIlZOXJSb515mj7bjJg==
X-Received: by 2002:a05:6000:2902:b0:47f:45d1:7b74 with SMTP id ffacd0b85a97d-47f6233f86fmr16320927f8f.58.1784549066469;
        Mon, 20 Jul 2026 05:04:26 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e519f4sm28344026f8f.14.2026.07.20.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:04:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 2/2] dmaengine: Consistently define pci_device_ids using named initializers
Date: Mon, 20 Jul 2026 14:03:49 +0200
Message-ID:  <148354eaf657c30428c678baaef07b2ff9888c00.1784547700.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
References: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6674; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6VBS5M0CCr9Jj7oJefbVa3Pxz3o3UGvU+x2kN5eD9bo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXg6syagQyucfj9b53yYZ19/fldEvaVFEwQsSA orefEbKn8mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal4OrAAKCRCPgPtYfRL+ TnPwB/0ROFyz/OuBrhPUOFXA3bCnnXQVyz7Upp+ZI2tScdYQGwMfyJwrbVkecGsTAd1Hv/3TlWG fWOuJJL8cTd4mffbJmzViqy+pgvmKpyNon2FIzhqaCLU+PLSLvm/9cRY1DT/T1LxlgFuaepYkCW zZWbUyG6p3Sz+1dHHZvaL5kvvt3yIaD7+3YvMHckgNAdpnv9gV9/glXXOBj0PedWfEfRYBRp+7J vzLbAO+QRJ+hY1HHSO7hfIkVCEw0v0jSY5yFzkc4zRQAgfI4tvV8TxuOHeXYfzKLEgszJr6WTuO Ge6Z/8i/hFLWyXXdIASccj08LGnq3ukEDmZhVndi2rBHJl7g
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The .driver_data member of the various struct pci_device_id arrays were
initialized by list expressions. This isn't easily readable if you're
not into PCI. Using named initializers is more explicit and thus easier
to parse.

While touching these arrays, unify the list terminators to be just an
empty struct with no trailing comma.

This change doesn't introduce changes to the compiled pci_device_id
arrays, which was confirmed using x86 and arm64 builds.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/dma/amd/ptdma/ptdma-pci.c  |  4 ++--
 drivers/dma/dw-edma/dw-edma-pcie.c |  2 +-
 drivers/dma/dw/pci.c               | 22 +++++++++++-----------
 drivers/dma/pch_dma.c              | 26 +++++++++++++-------------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
index 22739ff0c3c5..0b226bec950c 100644
--- a/drivers/dma/amd/ptdma/ptdma-pci.c
+++ b/drivers/dma/amd/ptdma/ptdma-pci.c
@@ -223,9 +223,9 @@ static const struct pt_dev_vdata dev_vdata[] = {
 };
 
 static const struct pci_device_id pt_pci_table[] = {
-	{ PCI_VDEVICE(AMD, 0x1498), (kernel_ulong_t)&dev_vdata[0] },
+	{ PCI_VDEVICE(AMD, 0x1498), .driver_data = (kernel_ulong_t)&dev_vdata[0] },
 	/* Last entry must be zero */
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, pt_pci_table);
 
diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index b34e1e45aeb3..6876a8532b08 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -563,7 +563,7 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 static const struct pci_device_id dw_edma_pcie_id_table[] = {
 	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, &snps_edda_data) },
 	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_XILINX_B054),
-	  (kernel_ulong_t)&xilinx_mdb_data },
+	  .driver_data = (kernel_ulong_t)&xilinx_mdb_data },
 	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_XILINX_B00F),
 	  .driver_data = (kernel_ulong_t)&xilinx_cpm6_dma_data },
 	{ }
diff --git a/drivers/dma/dw/pci.c b/drivers/dma/dw/pci.c
index a3aae3d1c093..99565fab3565 100644
--- a/drivers/dma/dw/pci.c
+++ b/drivers/dma/dw/pci.c
@@ -98,29 +98,29 @@ static const struct dev_pm_ops dw_pci_dev_pm_ops = {
 
 static const struct pci_device_id dw_pci_id_table[] = {
 	/* Medfield (GPDMA) */
-	{ PCI_VDEVICE(INTEL, 0x0827), (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x0827), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* BayTrail */
-	{ PCI_VDEVICE(INTEL, 0x0f06), (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ PCI_VDEVICE(INTEL, 0x0f40), (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x0f06), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x0f40), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Merrifield */
-	{ PCI_VDEVICE(INTEL, 0x11a2), (kernel_ulong_t)&idma32_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x11a2), .driver_data = (kernel_ulong_t)&idma32_chip_pdata },
 
 	/* Braswell */
-	{ PCI_VDEVICE(INTEL, 0x2286), (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ PCI_VDEVICE(INTEL, 0x22c0), (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x2286), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x22c0), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ PCI_VDEVICE(INTEL, 0x4bb4), (kernel_ulong_t)&xbar_chip_pdata },
-	{ PCI_VDEVICE(INTEL, 0x4bb5), (kernel_ulong_t)&xbar_chip_pdata },
-	{ PCI_VDEVICE(INTEL, 0x4bb6), (kernel_ulong_t)&xbar_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x4bb4), .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x4bb5), .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x4bb6), .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	/* Haswell */
-	{ PCI_VDEVICE(INTEL, 0x9c60), (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x9c60), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Broadwell */
-	{ PCI_VDEVICE(INTEL, 0x9ce0), (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ PCI_VDEVICE(INTEL, 0x9ce0), .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	{ }
 };
diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index bf805f1024f6..152939e7c6fd 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -956,19 +956,19 @@ static void pch_dma_remove(struct pci_dev *pdev)
 #define PCI_DEVICE_ID_ML7831_DMA2_4CH	0x8815
 
 static const struct pci_device_id pch_dma_id_table[] = {
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_8CH), 8 },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_4CH), 4 },
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA1_8CH), 8}, /* UART Video */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA2_8CH), 8}, /* PCMIF SPI */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA3_4CH), 4}, /* FPGA */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA4_12CH), 12}, /* I2S */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA1_4CH), 4}, /* UART */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA2_4CH), 4}, /* Video SPI */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA3_4CH), 4}, /* Security */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA4_4CH), 4}, /* FPGA */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA1_8CH), 8}, /* UART */
-	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA2_4CH), 4}, /* SPI */
-	{ 0, },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_8CH), .driver_data = 8 },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_4CH), .driver_data = 4 },
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA1_8CH), .driver_data = 8 },		/* UART Video */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA2_8CH), .driver_data = 8 },		/* PCMIF SPI */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA3_4CH), .driver_data = 4 },		/* FPGA */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA4_12CH), .driver_data = 12 },	/* I2S */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA1_4CH), .driver_data = 4 },		/* UART */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA2_4CH), .driver_data = 4 },		/* Video SPI */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA3_4CH), .driver_data = 4 },		/* Security */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA4_4CH), .driver_data = 4 },		/* FPGA */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA1_8CH), .driver_data = 8 },		/* UART */
+	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA2_4CH), .driver_data = 4 },		/* SPI */
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, pch_dma_id_table);
 
-- 
2.55.0.11.g153666a7d9bb

