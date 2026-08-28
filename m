Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020085.outbound.protection.outlook.com [52.101.228.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE51364EB2;
	Fri, 28 Aug 2026 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934994; cv=fail; b=SFB/OaOyQZNVBh+PaYTZQWNKKtLhGR3kEZQxPPvLyMpkVVDa3IBmpXsfRx52pb9CeilE7oSZYKebNvA+EgRg45EdhJhTep4x3h0Wjb8G+ulf4L9xyh0MwwIQVvyBh8SrldN0vMOfypm+HyMoGjyCrRw/WE0mpfPz7EBrVlMm2Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934994; c=relaxed/simple;
	bh=/QJc3sYa06YjxgvMEIhoHb5OM74z5/SpQzJalKcDDcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eL5hlb5lUBTk/XCfljtBpzxo0lHpDoJNMkLVxXk+MB/hOyweHaiTDqd/KjPYyp53KI0IqWQ10S0wIvJQRpT+0XUz7pgwZcqU4fvDA8KJ7RssnZQ47KN7UhQ5PpcmxitsWzWMe4hopJIX0Gp/1PbrWzSEsZT5KCCqPZXUT06bVr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ciBZ+1cs; arc=fail smtp.client-ip=52.101.228.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ciBZ+1cs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGvamblRU3qzNJ9cVYpSXmJ9CIIbCpdp9V0kmbliH+oRLA4uSZrTGn385IeUEB5Oq4EL/fncUXWURzLc1N2ef0KnMSCQOZg+3ElpxilzIeoyaLqGigbl4tpveYAnXF/TDlf8OfEO28kxfPc2rX5gkV/kpj5mIQmhqB49CI8tZfpO+CJH7tbn5WPu9fM5a69UFkAm3IZCerWmQL9nLEGvZ+pn3+Tfn871pLA4Ux1twAbsDlwFwAKtGwH8fpHO8XnhMDuJ4GEr4lGZ6Pei/+0InMpNbZVPvY8TLhYgNfHUTIjNacYiWHfszeFG5laRoGWcqOF0ro/syzCoTgcEVyar8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw+wG6U5FOKCDBqiJQMOsffEmQQac1PxxUls0/ytRoY=;
 b=tL4pbkTzvrrKxy/AFTukgR5w33FfV83Mv+XkYjCC8iQe/iq59A6dQ3mRF6tNVF8tsILSwaMnzMf3U56KhhNe/FL66awdMADKsvtOflp5GwQ5DFBJq7lAxhaa6cPe9PuaMbEAnOYjw9Cgkb01mQGgN5a4ijk4rvKK86JaDrpfk0UtmGULSfQwbknXtEA5CS9FGItboIqkfZ03xnsxJs1n6LR1aGbs4TZ7yLMq/+8Trr6zHA/6EoY4S5pNS1ZY3TajT2hbEcZ4BqH0Jeea7Gn9dkvX5MI1TAeiO9J+1k7tQ3NGq9jSydVWaZ+z57revXZF+3jZSu9BSSMWsbh+XTIz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw+wG6U5FOKCDBqiJQMOsffEmQQac1PxxUls0/ytRoY=;
 b=ciBZ+1csVx3dP0u5w+KMAhDlMmHJVdOkuVIqn2uy3nA64CPcorz8Jmyahc1VrFFa/WwWEmZqF5j+7DBLtteTTymI7oR3uzW+0949+ohT6OeVzMsCLtRT9nU46HtilcEPnioe1xR7aeq2WBahqykYV8FlTug45076aSSa11az2MU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB7093.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:36:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 16:36:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dmaengine: dw-edma: Account for the MSI vector offset
Date: Sat, 29 Aug 2026 01:36:11 +0900
Message-ID: <20260828163611.2691264-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260828163611.2691264-1-den@valinux.co.jp>
References: <20260828163611.2691264-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: c720edd0-daf2-4fd5-a999-08df05227dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	4K7oZsvFNg+2rANXoU2bwaTZAr00jYUMwPGA9lb7vwKR463pENdN8wqMB0F3U0cKF1w8zfmOcllEUUL6GQd3JPYdcdHVHa8g2oFFUlTcXr8c3pIKd64+ipw26Q0SBkRDJnHc59b6677EyiC2PDgfn4WTrlG5rB771cCo1gipr0LXIpz3vcJ9bFKNQ6Dd8Eoj3hZNR6gxYjlcWIozEbhDyCXho7DvqrWjRlmGXSnIlTJRK0WYe0FM0kcT09ycHUW65OLmzpq0YpDiQ+jLimGzxv1oFoXkOcgZSa44pNEti+NPFm6xr6NxV6is0akqZlEoqVhW8WMkfCaLkHWHqswm4Pc9+u5ON+rOZZBjeXV/V3LhQ1HVcISqXBfdjYBAlr3Fm2OpNUCIAzAtRGmVaS030j0FLjvR7KYMzen2wEJAoPQ7ka119LSJXOYtVW+Y3YXMK+SECCd8wI9RJ5v0drSlNGgkBqslTh93zi+mDFkvWmFv5EdnacunuB09B05ztvWglhjRvZlpAGYAbO67sMg04H+oojCLAmx+FecbYsy+BYLVdnBDAg2o6tIJSdmoUfYtQP2MdAJReDaxUYSJI2uCG7qOkSoKBeY2veQXzLQ4r3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cb1IY34CqlbfFoi2275blMfMiZ5Bi8cPfdItnYF7y+hKpZ3+zlYR7ysMiup?=
 =?us-ascii?Q?EXz/WnmRuqzQf0AfmnLpZnfxnLim4FBlBpdAKr7vQ11vXKlPWSuGLvH4MFdR?=
 =?us-ascii?Q?vI8p6BXzO78s99wfzj0dvk/FNihry8xCL4NyPr6eRiHc/Qj2/ernRoSrb0ud?=
 =?us-ascii?Q?kdo6Yx7Hv9+XzSquGVd4TxnO576amNSzZC3ScxKzycJ8EexITMLmcw629VJC?=
 =?us-ascii?Q?MWTyz72kSDxW+H91BsBUUGLOCG69GfJiiZmq3fHbPQJOAc4HRPCdWeFLxW76?=
 =?us-ascii?Q?WjJTq6OIEvYKPI4XKrQVvmYSwItTZtoHPIR2csu8+JcMcz88OOVNJ1vJwdBQ?=
 =?us-ascii?Q?8FRjdyRXhd4Ttg4kpf4fVTu/QsvP/Sy8tGpGdRe5wY1+jGumHRfJu+15zEKV?=
 =?us-ascii?Q?tTA/ZYkyrZFVxK8tfuOVdhr7FnctViheGTEicSMamyUoEhOABj9r8Wayfr8x?=
 =?us-ascii?Q?TKyLZhhbAV1bpnV33HTSQLr56Qo4Rm0KDvxy9RxNXY36ureBd2HRv97cg7be?=
 =?us-ascii?Q?rcwQP/VbVjW/6DSWG1O3myl4NxVCAfnrIORmQXRsj4GybBHElYpeRdJWfr9V?=
 =?us-ascii?Q?cKVGi2RDaJmW+1RbCBW5ZUeDhz39vnQBUmoilooaLFvYrWfTO0YmTpsqmXUR?=
 =?us-ascii?Q?0lI1tSRnJg+W3dQd1zW6o9Q8RAGjdDo1aYQhFCec+RHQA7hoWBDqlT9yV/V6?=
 =?us-ascii?Q?0TTaJP6LW7wEGTTjfU+5vBVI1nbcIbOHQ8AaU3ZCpEThy5IaeJBH+tvH8Rvs?=
 =?us-ascii?Q?9PiQWpV1sWBFTaim2jXqYAe4k1eHW1HfIuvS4Jb39e/kloPkJWPH0hd33fn8?=
 =?us-ascii?Q?92XOKc/ua5pva2EWLs6Y78iGLlAOFfES5EWaVX34jBy9IhyXzvAqHN+AIBeM?=
 =?us-ascii?Q?Bobbd/wrsAReUKESEcHeKWRMTTOOpLbaCjst/xVqondvEirH1lr+UOnAlfvl?=
 =?us-ascii?Q?xvV+wSSTNrVVcGddQO8OytllkSrYGqg2WijnlU1b/xV7dI+xMaSi6kXFwuHj?=
 =?us-ascii?Q?cxvpalxYm2sQCpf38B8M/a+V8RyEieX7MXlbzcAeUU/a9MzvmPp3frPfDAqD?=
 =?us-ascii?Q?Gt6XBOOtG/4Y7unQ1Y6Z3EVybTWlxXs/tPdbvg0rdUKtZIPRaZvzkd5z+vY4?=
 =?us-ascii?Q?MGc3mdbOvbU7Atc0XsyHkzdbcG+0EKflfdYzoB6XjRIUOKobYrCMdtYojISz?=
 =?us-ascii?Q?JtvKoFlukQ/0qgczGOUgs6d5k1/aVlW00+Gqgd0rWCR4o1w9d3OIfJ8G7M+8?=
 =?us-ascii?Q?X/W8DoKdAg/O1mQs77hQZWY1RSs5mnECS0tSr3TZqeViX8aphkzlrR3RxGoR?=
 =?us-ascii?Q?2+ydNw9ZrtaZ8Q5/s61Er15+xjgTjF6THyxO4Y5BB8Q7sP9nUKEnr2XWRLNE?=
 =?us-ascii?Q?tV0/cEkHeHCEm4x/29FLODoHs16eOQUeLH3Lt6g6Toe9UI6Lfd5bknLYIBGm?=
 =?us-ascii?Q?lmzUcutecRDflfwguCzG2cwlxx2a7kcnV0XB0i18YEV+RlncWvy7ecNRZGXn?=
 =?us-ascii?Q?XBlBws0YGwyem5sI0TbjDEb4qdHwlyVjq3WfwVr1E0bG7jsC63JuDrwIrIeN?=
 =?us-ascii?Q?zUM6WpiteNh09fyQlJ//Kav1ABmZ+u25vgIVya7Iul1cBlychZ87SauUE82l?=
 =?us-ascii?Q?90cN6iVjzgUFq0TJicE+gen+ItkbSIvUJ3z6ODx0uFRrC1Tyk8bLYT6gUjNq?=
 =?us-ascii?Q?XYLpdOqbKgBx5fIHK5YQaVOkiZ88BNx69TaKa1NE2bebMOHFCVquwZnaB/Cm?=
 =?us-ascii?Q?Z9HJs6R1wqtfXUF4RTnj7xPj/XEPUD4eFa3i/nsg2Tv8L50EPDBC?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c720edd0-daf2-4fd5-a999-08df05227dde
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 16:36:20.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUUDHVBmDttji381aJX81S4Qi5NAy3phpWxlW2m4c/gh6muScCmLIw8b60pPfFHkpHzpqKwH6AedJpyTNJA8Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7093

get_cached_msi_msg() returns the base message shared by a multi-MSI
descriptor. dw-edma currently derives per-channel data from its local IRQ
index and does not adjust a common IRQ at all. Both assume eDMA starts at
the descriptor's first vector.

That is not true when eDMA receives a tail subset. Compose each message
from the IRQ offset relative to the descriptor base in both paths.

While at it, avoid reading PCI MSI attributes from descriptors owned by
non-PCI devices.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Rework v1 patch 5 for an MSI allocation shared with vNTB.
    https://lore.kernel.org/r/20260312165005.1148676-6-den@valinux.co.jp/

 drivers/dma/dw-edma/dw-edma-core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a8c6bd508fcd..6af8a414e4a2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -1075,12 +1076,23 @@ static inline void dw_edma_dec_irq_alloc(int *nr_irqs, u32 *alloc, u16 cnt)
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
@@ -1105,8 +1117,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 			return err;
 		}
 
-		if (irq_get_msi_desc(irq))
-			get_cached_msi_msg(irq, &dw->irq[0].msi);
+		dw_edma_compose_msi(irq, &dw->irq[0].msi);
 
 		dw->nr_irqs = 1;
 	} else {
@@ -1129,12 +1140,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
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

