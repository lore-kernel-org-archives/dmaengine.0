Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021095.outbound.protection.outlook.com [40.107.74.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F17D385D75;
	Sat, 12 Sep 2026 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234836; cv=fail; b=R2EodUl3yrP6JilHSxwt043H4gndPLPV6Irseelz9/IY4xrNTOzYxYm+oHYqYLDcVgs8wwhsBXTNldsRer9X63MysCJpUvsVkjjIsGHwgkYiAi9U/IQWNSNIsPTVchMebKEf/1fswJgU41X+h9ENCOy+fSiK6YxsiX5A3JsOKw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234836; c=relaxed/simple;
	bh=9qX7rxCbUj/x5taDcpafLEPgQqNVQWVK3Apzkg24SO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nwNw6qmpaYssY0CRQA3TK4lqwBUW3piCIgkJqNh7W4rM7mof6wEyFrTvFxAPRBYa/B5Jhn0yV5pPFb5dRePlVtfE14XSSQdun5j+6+byNvzy+Lml4D458lknQpxxS2iGM9QE/pbvsT8ja2ZLjSVwIzhrCgSFrY2V3Yw4ywffGYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=mBIhDb3z; arc=fail smtp.client-ip=40.107.74.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="mBIhDb3z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeNVnCwKddTBN0Fh1tgiSrHIw/JtmRDMwQd26CcDQHSDDRDfK+lYkVzMDuAB76v4GFdrNXCRSWePj/5LITnWFu1wDVLu8WQw2D2W2KUO/oQ0y5eG8Efhfd5iBOlbBCtilOgkxsUzlW0PbjkcUtcOqMT5ZQg5tMzLBan/lv/HH8GgsF/HsakagHbUIRZNjHNmb0IJy5fl5MR0SP2y42NHrXkGweO4wMqi+dxiXwaXxDdpLORteK0trT3uiOIkM3FD7fTfwQewGZx7R90BDUDcXj72CJaPQrBIuG4AtYFV1irvF4K95O7GmNAARdVSkcYJSAReX76xULMZH2ORSY2XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBmGlXf2+AzLKqgcchWn4K8JY6C5y1y28YohG0LGE5Y=;
 b=RYyUp+RQZLZKJ7Z9YUAdbWVeVuH2ulDt1rUPovmICWgNxPuRgKBKlorDPmsQ+pg++Inn0m9bNVhtGEW/KaB2pX29FQItJzW3D6GlFCIo0PECHvSK+rJv4KYurreFQtNMi1p+ULFb1hbv3RduCx3zkmSQH3C/NoH+Ag84ejLYdyYPTZ5yxl6Kkqc4DKe3ZCPMDLYPwXztv0kiDizdHnH4Zp+2WujQifBqgELmfxsuDZf2Kr/DSrJekG1ejkFEQrWn+b+6hSIeEGnPUAs2zcUDRC20SHJoCeqJZmnsNqMvxq5iVoevlFX9kgY9WrqQ0uw2kizGdeleK4WYzgbJaXpWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBmGlXf2+AzLKqgcchWn4K8JY6C5y1y28YohG0LGE5Y=;
 b=mBIhDb3z/G/73AHVmk4HgzvRVJgTPlVyX0EFbrtZGTi+PfSIbzrNwSrueC64UBI1ozwSxl+oLaF9S14JoMdroPcZ3xL7p031hfT/yuG6mojvrx+/uJsVIEL8p5rTvb79aB1w/QVTJ8QRuYdatXczNoDSb2k4sNR7WK1hSNiuazQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSCP286MB5822.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 17:40:30 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 17:40:30 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] dmaengine: dw-edma: Account for the MSI vector offset
Date: Sun, 13 Sep 2026 02:40:23 +0900
Message-ID: <20260912174023.1227397-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260912174023.1227397-1-den@valinux.co.jp>
References: <20260912174023.1227397-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSCP286MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 080c4ea6-725a-416c-fb79-08df10f4f0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NNamP/FgQvG85F74ZtMB23cl3HFshDP7jjRoL73MexFcBUX2EsqStTi2UKFiRA3FM4QEcYgQUn2YTyzVS6w1j9/k2SSY54IEQJrz7Hjt3fOWvw0lk8Co+4AzPdfWH/6foK+Td/xOGZIsH8KsTIC4a1RtxfyIBJ0KwepsM8Iy42OA6t8F9e+819oLcYEf10NcpwiagWxkcX3G5igU6vIGr19gEJXa+OMDlLIEIVvm/eC/M+pRRmNDrkBEOXkLw0nwzHX3PDLc5gTOH6SSdoF5RA0skqD0zZUISjXwIJqSIcunuh8QNdHI4r6Lsgz302i+5+BKmA8BH2diIGsmpbGlSE6MzHNwlfN2pKdLUBkvB+aEoZ+rUY6ItzGCqVE1YOmbNQO6i/bMbRgVvXL9gFqBxrFUZOi56k7saS6x3SmZJXvoHVaREtsGpI9JxO3BsSjcBGDnUBAa3f7dW7tOeulD+aEppQ2aRAqWGEcqkhVWGtm9zLgTl/N5HPv4ZP+4yV5DkTjWbZoooQkdFKQpb00kUzDaA4BtuGxqwYpJAI28wat1CQmhpV3wqKJcvf8tuY0jhDlLmMklsTsRdPLJd89z5p6nCHIJgjR95UAo73Q1yEmy8OlrLa8No0vyycjgT452mp5rGMFD+agkVxLC2Jm7rziJ5XJGRVfsj03urTRwXOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oSmujp9HhdN/lPlJC0hMzbHk/SIIeAPyrLq7YCiPJhbOUy/SbfQ+U5pKuTsa?=
 =?us-ascii?Q?v9kTypXsOQ5coqnCyXSoWFC5b+th93ZZRH+ziDJy3h6TFubsufwGJNqyz9V3?=
 =?us-ascii?Q?UiUQiAwVOdm6rO6BDI00J0yk4GZJR83YbXPMPGyRSICJVLxC7mYADpMJ0Wh+?=
 =?us-ascii?Q?zNjoq+lbNx4OwcE8pLYBnwJ2Nf9lmykoT9/IL7Nd11GFd0OKY7tF18yEL5Yd?=
 =?us-ascii?Q?N0HpuQrFdJemJN0co/BGWCkLrvJP8rf9zPmxJPvQy7vZweHzKJUFbqpb2KDH?=
 =?us-ascii?Q?YdMjqk0zp+Ir6ofbnzAhF/FCamAraYJNwBFyNyM4jVTJHsrtmvvmeC3HJQBp?=
 =?us-ascii?Q?YvIkcuAfjCcD/E3hkV/hXV0+5bi09FjNEO8yDFMrir1JEPMDoXrVk5ObMmMh?=
 =?us-ascii?Q?pZucBojX+QITVk9ohOCn3xorCMfNLoRQid6QJIqdVH/denzHSKfu+c9whZo8?=
 =?us-ascii?Q?EIPn1Rm/M/UxQUIlnzx2Yy8dm+2ujpGaQLmhBTvPpizuiMkFhDh7gfcclXxB?=
 =?us-ascii?Q?7EGoBOka0W7G+tq2PQ14S5noPmHbqij6D6N2buo+iZjJ2i9iRTplz1P+BPGx?=
 =?us-ascii?Q?ZZ7hZuknfvGIUFRYBBtDcU0borSFZKhr/MqT5/M2Utf5Da8Ek77jScUOF1R3?=
 =?us-ascii?Q?IYY7qepdXtVW+JCUmeG4UQUHQgVSoTaM/HgJRg2f5Pw8DlDGh1BH0qUd8J8n?=
 =?us-ascii?Q?4pHHuuTPbnUaMYXOER9kHrJEnb++hEocCy7hk5ey9Mgpw6p61g/dLM0mPSYu?=
 =?us-ascii?Q?fc5dao+uFXcOsIpm+AR+4IGvnFNY1fiGbTgKdJQmds6WOsKTaJGNxyAwO40m?=
 =?us-ascii?Q?21+SBNrEc1rFl4uo8xH6dTntVWI1YoHNkByOskt2G/RIHlpFnrcyi5ef+8cj?=
 =?us-ascii?Q?z8YzvMEePe4Wf3xfl7zorURY+mO7LTn9OjYT6H50vcetAmEL6qoMBApxoHxb?=
 =?us-ascii?Q?7rWC/VX/sBax2P5glFHBLIYWu/9OoPr6zLWA+183PFNYac75ggBE5CgGxZkY?=
 =?us-ascii?Q?l7PNoKNNoYQ3nM68rm1E5+AoTES8pPSpS+0CSptwKybEk/OFz5fHe0hWjYuk?=
 =?us-ascii?Q?u/SMrl6GttPBMihA0bdZnm4xt+y18SnN2CM6jfZLjnoWSyN8prNcq1V9Jyk2?=
 =?us-ascii?Q?lUN9EbL7RU+ELnhLggV2S6VExqJvnaFG5qHEONpJ5AYsm3DX0Tu8t7Me/qhB?=
 =?us-ascii?Q?/EpEGzHLAPuUjQg0FUqnUwFAzNopRidfuv8rVGI6pAfv1MoXF1N+V8dZLvXh?=
 =?us-ascii?Q?rjWZK7SbAb7iMkSDHXU+JdZP9ojLNl/CGkAENnWwG12y/rgyZ36XPnxtAC0J?=
 =?us-ascii?Q?eAT083wR5PPIvzYBHkrZHGmfcBCO99DhE5zqcuRCZ78PTK73r5LSW7V/4QWd?=
 =?us-ascii?Q?B3rHugMzNlZ2BPjjfw86mtM06xBBnlPjH+WL4rV7oEf9AfGkuXU+EozaLL8o?=
 =?us-ascii?Q?NEEYq8BCTc5knHk3tq+PJsCyrPiWQfNUIyrvZ83ciCLAHbXwSizIh5EQUm4b?=
 =?us-ascii?Q?CPS7TG5tW5cLH4uPqF3Nr4/lE+QxTD4VdzbycESjm9CrCXsX1l/Jz4+BL7mq?=
 =?us-ascii?Q?xj8g4Cv78xMTlfUpbC0QpsBKlTtI80blkHKjgeUjFZJrZI57jIbPNBXD29Db?=
 =?us-ascii?Q?4o90Bzy1AYcNLX2K64+Ru/JSa49882FJ93I2YnVeuXMhK4CknHyTajfotcuC?=
 =?us-ascii?Q?PqKeZPnjQKH/UPFE31ANDB54dsJ0yvzeLob0nRVp4sA3W99v6bBd3TJt3zsP?=
 =?us-ascii?Q?uw+K7Vp7qILkzg1TzBWKjpGWbIPpGvmuq1+70BaIc5rFbgSTYQZw?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 080c4ea6-725a-416c-fb79-08df10f4f0a9
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 17:40:30.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBXjYAYGJm0D8gcPeq+rDt2Qo2+4/j6XRgFc7qan71YrdH+RTpdvGgEZRE8acNFHtjhkBvI/A6JwXwi60ebUZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5822

get_cached_msi_msg() returns the base message shared by a multi-MSI
descriptor. dw-edma currently derives per-channel data from its local IRQ
index and does not adjust a common IRQ at all. Both assume eDMA starts at
the descriptor's first vector.

That is not true when eDMA receives a tail subset. Compose each message
from the IRQ offset relative to the descriptor base in both paths.

While at it, avoid reading PCI MSI attributes from descriptors owned by
non-PCI devices.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index c978da30bac5..1e6fbe0922a9 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -1106,12 +1107,23 @@ static inline void dw_edma_dec_irq_alloc(int *nr_irqs, u32 *alloc, u16 cnt)
 	}
 }
 
+static void dw_edma_compose_msi(int irq, struct msi_msg *msi)
+{
+	struct msi_desc *desc = irq_get_msi_desc(irq);
+
+	if (!desc)
+		return;
+
+	get_cached_msi_msg(irq, msi);
+	if (dev_is_pci(desc->dev) && !desc->pci.msi_attrib.is_msix)
+		msi->data += irq - desc->irq;
+}
+
 static int dw_edma_irq_request(struct dw_edma *dw,
 			       u32 *wr_alloc, u32 *rd_alloc)
 {
 	struct dw_edma_chip *chip = dw->chip;
 	struct device *dev = dw->chip->dev;
-	struct msi_desc *msi_desc;
 	int i, err = 0;
 	u32 ch_cnt;
 	int irq;
@@ -1136,8 +1148,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 			return err;
 		}
 
-		if (irq_get_msi_desc(irq))
-			get_cached_msi_msg(irq, &dw->irq[0].msi);
+		dw_edma_compose_msi(irq, &dw->irq[0].msi);
 
 		dw->nr_irqs = 1;
 	} else {
@@ -1160,12 +1171,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 					  &dw->irq[i]);
 			if (err)
 				goto err_irq_free;
-			msi_desc = irq_get_msi_desc(irq);
-			if (msi_desc) {
-				get_cached_msi_msg(irq, &dw->irq[i].msi);
-				if (!msi_desc->pci.msi_attrib.is_msix)
-					dw->irq[i].msi.data = dw->irq[0].msi.data + i;
-			}
+			dw_edma_compose_msi(irq, &dw->irq[i].msi);
 		}
 
 		dw->nr_irqs = i;
-- 
2.51.0

