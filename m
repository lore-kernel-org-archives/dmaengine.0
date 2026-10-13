Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D553C3A3;
	Tue, 13 Oct 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923698; cv=fail; b=DdxDKKwuDz8Qs6AjjxNNEWb2wJYPmUF9D5W4kXZzP1edShbjDyG/VVBh3a9os9/7f/bGkwLxiiZUowFO9zDDP1/LEo3JAe8kfEXbSItcupEz6zjsdNmsD71FWWd+srn6bmGV/XsJmv+vDFfcMzGpEmIow050vqCbPYL9CckkK4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923698; c=relaxed/simple;
	bh=9im+Nh7uz6vkHVx8/yhwISI+mR5zWsqljmIspQASpYU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GKDDP4NaHkb72tFDifvTPJ4c5sltEs4cop5DzAuN8krdO3UBYT0qqs3jHQ4q86114N1BE7OrNYrpn/SgHJ7YoRo5ZmHiVHc0cBRaPEZDkmvZlXXs3Dlxn6n2TRqg9xz4Igc+b4H4gmw0HDapOB2UyJXORh2tf7SAWCEmZtO3rwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oqw0a6am; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oqw0a6am"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3yTGJZfRaPgFHk68egZTeiFCrkFAErYWDrG1HLOwhj74qhsNa6absm+No2//zAD25MdcfqjCyybsOUnmFycoihXqL6CwNb7T3pv9sowLq4YnvsWVut8ln+uVOPvRhIPXS7Zw8xbcuqhWsB+3B1wdbH+SNLI9EECMjTTs6BPGnrI2yAtncktm6dKXMUkpY+ytxl9A/JYuStUNi0g4FknoPNTM0RObKYi56smZsFCwWvM5OiFl7jTGDRzXzVqoYWghsUfTeF4UboI2Yr3qpPM9p8St/i/Q55Sam1LNzvJoxuwfq8ORHY4aHdwzQXuMXhUBameMVTADZuyFZhdYpseKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPjY7nDGYGEPwJsecX3KR7AhF+6rOy/LTJW3VsPighQ=;
 b=oV8KLZwpmpMDEcPuLTO/gDe+CDCYf0/mlk20i42A8lQRpAjFy43O3CGRdZAI3UkIKiTCSuDlDjNRi6d3bt8sEk9gv2qFnxsPUcsj0app+msXjQfnfeAMqS6KtHgr3jDImnY+ObInQ9dscVmgzvdw9HpcML+xE0hOmhbgKZwA7CWyjV3WaFK2U5I2KlwYJ8iwriTGHGqfe1FNHcKJCpeHTacmQs7i0Go6g1a0+/L2YzSguCV4MfQ7iPIwyAADcQdK52CK233CIp4E7PcRnGCijGzBX8ozMv9kyJz4ASjPO0OraunlSlmhLMkNkd8vrMi6xgOSYoQDR7VOh2bMz2ny7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPjY7nDGYGEPwJsecX3KR7AhF+6rOy/LTJW3VsPighQ=;
 b=oqw0a6amqQ/4kpipOrQmPwRSpmhVWwgY+st+SfMGXUy6t6+kGLlp357y/juyIY+pw9ECJlesEyS+AD3vDrZSGxLNEO6Q6a5nI2mNxTj5Ui2KX+iYBCaKzbLFgCn1b1feMpehTFd9MYzP41OE2aMelpQJw3x2vd3zl7qTUPm9NndZJUODLEs7zrIuTk2igiknhBp3pIg+cD+qJiPrrNkWwbnkP1DGGd+L89cUijxo1ElEINZBkiFJ/R/MApM1gBfrYnLnb3ZRMvIZPaiM5OGsRjfdBxMJC0oL/qjCXyZIMZmbOv7eTjlUX3dDi9FUg8XUEvJx2WYiT7uEoJwzh3r8vA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB375776.eurprd04.prod.outlook.com (2603:10a6:910:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 20:34:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 20:34:51 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dmaengine: shdma: move shdma_chan and shdma_desc structs to private header
Date: Tue, 13 Oct 2026 16:34:23 -0400
Message-ID: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:46::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB375776:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a79334-fd8f-4b18-1296-08df29696e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|56012099006|261009223027099003|11063799006|18002099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	60YrGeukHCnLBorFDkIFRlEdE9H8TU3zfBuwRYspa4p+tO9SC6eVH5UxMQ29MabqEkEIUpmty3cV4uu1YPcmISEe4MvEHwsBNuI4PxN7a2MhaHOnjW8XdALC2qEUXABWP2Ey1A5uFCqo3/jWC9QwTAGsCW/k1GZSfYLX3meEE5fB/0TWwoMZ8REcPTagLAW2lQqWHIe6Hu3tpGe7/umuwI6PGXV4Iami2XvOtA75UQPM9B82Q0WWiAQN8PpfccfIqhN66bZIIqPrr1FBAhrr5GOnYufJW3cJg5AdikhEA6+cCxOLl3D5FrJ4jSXDxo0gkyLE5X/rSAJIyYBF715sPdNo0C81+98ACETnKNeheFv+cxSCsaBGm4uj682mY48Kz8IBFluMlMCNNptWqBmMrKl22dPwwgaxwcsBtAhLtiMFbXcAj4Bh3/5z+hLnE1joMd5xk9iKLN8J9Hymf/IGhsyDoWDU2pK2buQ9gEYlDNb6QnRhamYhKuki1XUUQU5mOoJAViQ4VQRnaQ6ixyGVr3Ijxo5p+LzL4QpBeiOI20rGwgxyTHp5ThE01iy6mQiya6OEhQ9Mhi7lhA46rCoYOe+RkA6JkkOCu3vinlpc0XG3KoMeMBOxoblD5Z3ELfl58Xq3DfBNbmeHuaZ6ihBETHQ+/XCkzWG2q9fXXe56M4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(261009223027099003)(11063799006)(18002099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?me79hDn9ZSGILvB1scQzfV/6cPmh/Yo3AylRZAwowSWnrhUmHx1ymiggInt8?=
 =?us-ascii?Q?AMKYCvjgeDLqXuSRcKSLuSODUqkLtVh8jHSeGg3F0DomGXzQo9j+1aVIjxp8?=
 =?us-ascii?Q?eWA9hnZUX+XVB7dLpogzolIRkOHcrFfPX/m95pzmWesm18Y1mX1c5xjVMjXH?=
 =?us-ascii?Q?z2k8cvVfy4RheVpPRj2etIeZrzF5P1ATo6AXdQF4D111B74AiInqNCFS04y6?=
 =?us-ascii?Q?GCBE2CaHv+tz81HxbM/oxrb8cFizQ8ceuvSpRmsX5ijhZNEOFkctDxqaAKr2?=
 =?us-ascii?Q?VKgSJ3Re5PnZPcd00D+KfNSr3NsISWfitOZChY6VF7jZ9t0TrNQVOyKNlp2l?=
 =?us-ascii?Q?9pi8XP4RHdiX5zyMPgMjUkGSkq6VWoCvWqX3mfEVlt6umchIaPRPOupmbRs/?=
 =?us-ascii?Q?sZ9RGH8xx7Z9jOmTPoJktn1syyeOlIMrh/Rd2rkpbYo/V0KLuy7NtlXzI4xJ?=
 =?us-ascii?Q?8JtZayj7KINL/tmBiCF5D3VuOWyaFaMp3OCLQkdN1BAE909ZDEsjS9xLiBii?=
 =?us-ascii?Q?1djgIoo6M8Qtb3gKiCo0XacZA+Cdy5g8naZcwFW/NnNB1F4DMOaQvGKWTyH5?=
 =?us-ascii?Q?601LoMdDBobe2bqpwf65YWP8cSHKd4MtzKAjGO1isiFmOPoddhOs+7Oclb9K?=
 =?us-ascii?Q?cCxdXhg2L9UIagBjvBO2pUgE53xM9qmSOzSfici+aBaeEdO9c2q/tXobzxRd?=
 =?us-ascii?Q?6OHoqhR5fgiMM6QOYWAHYi07/J1banUsgYu4NCbyA4W+rc4riX2k2kL2CSoH?=
 =?us-ascii?Q?F6IM+IsT1mV5oip8yZmCslYA80xDW1xmWKpLAsVPL/qvFwAia5IT5jNuiPbD?=
 =?us-ascii?Q?7Xko6848swoNpNe5P4V/jzYqmpIvGB1/qTfDjgvlVEefjmCPTNGDUyqDJGdy?=
 =?us-ascii?Q?Wj7GDDPURG6Gm1OJuh/AB0F+/ZU93Ta7QPMZBFJxhzbZ4P+X8YZ8JgHlnfU9?=
 =?us-ascii?Q?b6aLQ1P7ntjmrtbE8HRXAa0dsd4mjpA1Asza23JPW++0qdTsqGjkna/u1ltR?=
 =?us-ascii?Q?tptFTlNkRXAbR9wYL6S8zMxgbgEBv1UkERi9M3feUlYXVZv5TZyJGzOoX2dE?=
 =?us-ascii?Q?tB0C0ukAj1XJGNUpS0t98NPYA+dCrIsVlqZzSQ9bhAdugqIUJDH3ixtdpP84?=
 =?us-ascii?Q?djlj4EZhwAyEfbrPk157b50C1GWl5kElIFJlDBIun5p1SGP2Y0C1vbRfKLCT?=
 =?us-ascii?Q?xA7KYXewasCc44xdXM5Euf1yYjfxrTtsgbQ0FYaZskqOHShHxn3W3bwhVT88?=
 =?us-ascii?Q?ERWSD0I9Dk5e9+VjLAVVVEXpWUotXvEibZMRTO5FHKsU4ZjxwlQVsoshKNLc?=
 =?us-ascii?Q?y/WgzGQaxG3U158KRzVztESDthiC6p3fdQXrbQf6lukgYle80vhEV5hNhLhX?=
 =?us-ascii?Q?ljBtr9ChImSNX93b8kQjbkVh8YWVguACANI/IK1Ggh9Pj9t3dpD7MSBacR1k?=
 =?us-ascii?Q?f1/LUwrFbdliziUzq0Ayxcurn9MKuxH2GG3DpAJkjoIFON/auPwhqoMDhFpK?=
 =?us-ascii?Q?Avk6rv7aGGv47f4wruyFeqYi+FX9EPwMJW8u6z/yVY/8eCmrfHKnX4gTKxeW?=
 =?us-ascii?Q?hXz6eMrPGhhxMmiLsc9um3ofw0FLol2A93IoSZmDBvyyp5wx1QCEaY6Jd82c?=
 =?us-ascii?Q?edCfnHagLobNzF43saq0kHkB0rCQk9QHEp0XCvHB/MM3DmnbPzdoSTYuRhvb?=
 =?us-ascii?Q?8S69jXUKcJJM2AUgMFikWkXHldB6VbzFOYG1FzRoPEc4c+PstITJMlsDY1p2?=
 =?us-ascii?Q?QzOAq24pURImHsMEPqul41bVy8EOEssqQGnTaSAg+Y9RT4IB1VN1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a79334-fd8f-4b18-1296-08df29696e64
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 20:34:51.1798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cr/DrG9Wipzdi5cEcBRhXMM7Dp7Gvcq7ru9og/beEwYv/lEjb6mNv4u6s4GkeU11DmGhMjDO3cJll/nKLNIHcVZz9ltHLIRuHX6VNTudY2Wdl2GjP5vQdcSOVFQ59cuR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB375776

From: Frank Li <Frank.Li@nxp.com>

Move struct shdma_chan and struct shdma_desc from the public header
include/linux/shdma-base.h into the driver-private header
drivers/dma/sh/shdma.h. These structs are only used internally by the
shdma driver and do not need to be exposed to external users.

Prepare to make struct dma_async_tx_descriptor private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sh/shdma-base.c |  2 +-
 drivers/dma/sh/shdma.h      | 80 +++++++++++++++++++++++++++++++++++++
 include/linux/shdma-base.h  | 80 +------------------------------------
 3 files changed, 83 insertions(+), 79 deletions(-)

diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index 89a78e685b1d1..ef704a6aed233 100644
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -20,7 +20,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include "../dmaengine.h"
+#include "shdma.h"
 
 /* DMA descriptor control */
 enum shdma_desc_status {
diff --git a/drivers/dma/sh/shdma.h b/drivers/dma/sh/shdma.h
index f97d80343aea4..d66d45062e9bd 100644
--- a/drivers/dma/sh/shdma.h
+++ b/drivers/dma/sh/shdma.h
@@ -15,11 +15,32 @@
 #include <linux/interrupt.h>
 #include <linux/list.h>
 
+#include "../dmaengine.h"
+
 #define SH_DMAE_MAX_CHANNELS 20
 #define SH_DMAE_TCR_MAX 0x00FFFFFF	/* 16MB */
 
 struct device;
 
+struct shdma_chan {
+	spinlock_t chan_lock;		/* Channel operation lock */
+	struct list_head ld_queue;	/* Link descriptors queue */
+	struct list_head ld_free;	/* Free link descriptors */
+	struct dma_chan dma_chan;	/* DMA channel */
+	struct device *dev;		/* Channel device */
+	void *desc;			/* buffer for descriptor array */
+	int desc_num;			/* desc count */
+	size_t max_xfer_len;		/* max transfer length */
+	int id;				/* Raw id of this channel */
+	int irq;			/* Channel IRQ */
+	int slave_id;			/* Client ID for slave DMA */
+	int real_slave_id;		/* argument passed to filter function */
+	int hw_req;			/* DMA request line for slave DMA -
+					 * same as MID/RID, used with DT
+					 */
+	enum shdma_pm_state pm_state;
+};
+
 struct sh_dmae_chan {
 	struct shdma_chan shdma_chan;
 	const struct sh_dmae_slave_config *config; /* Slave DMA configuration */
@@ -30,6 +51,13 @@ struct sh_dmae_chan {
 	dma_addr_t slave_addr;
 };
 
+struct shdma_dev {
+	struct dma_device dma_dev;
+	struct shdma_chan **schan;
+	const struct shdma_ops *ops;
+	size_t desc_size;
+};
+
 struct sh_dmae_device {
 	struct shdma_dev shdma_dev;
 	struct sh_dmae_chan *chan[SH_DMAE_MAX_CHANNELS];
@@ -41,6 +69,58 @@ struct sh_dmae_device {
 	u32 chcr_ie_bit;
 };
 
+struct shdma_desc {
+	struct list_head node;
+	struct dma_async_tx_descriptor async_tx;
+	enum dma_transfer_direction direction;
+	size_t partial;
+	dma_cookie_t cookie;
+	int chunks;
+	int mark;
+	bool cyclic;			/* used as cyclic transfer */
+};
+
+/**
+ * struct shdma_ops - simple DMA driver operations
+ * @desc_completed:	return true, if this is the descriptor, that just has
+ *			completed (atomic)
+ * @halt_channel:	stop DMA channel operation (atomic)
+ * @channel_busy:	return true, if the channel is busy (atomic)
+ * @slave_addr:		return slave DMA address
+ * @desc_setup:		set up the hardware specific descriptor portion (atomic)
+ * @set_slave:		bind channel to a slave
+ * @setup_xfer:		configure channel hardware for operation (atomic)
+ * @start_xfer:		start the DMA transfer (atomic)
+ * @embedded_desc:	return Nth struct shdma_desc pointer from the
+ *			descriptor array
+ * @chan_irq:		process channel IRQ, return true if a transfer has
+ *			completed (atomic)
+ */
+struct shdma_ops {
+	bool (*desc_completed)(struct shdma_chan *, struct shdma_desc *);
+	void (*halt_channel)(struct shdma_chan *);
+	bool (*channel_busy)(struct shdma_chan *);
+	dma_addr_t (*slave_addr)(struct shdma_chan *);
+	int (*desc_setup)(struct shdma_chan *, struct shdma_desc *,
+			  dma_addr_t, dma_addr_t, size_t *);
+	int (*set_slave)(struct shdma_chan *, int, dma_addr_t, bool);
+	int (*setup_xfer)(struct shdma_chan *, int);
+	void (*start_xfer)(struct shdma_chan *, struct shdma_desc *);
+	struct shdma_desc *(*embedded_desc)(void *, int);
+	bool (*chan_irq)(struct shdma_chan *, int);
+	size_t (*get_partial)(struct shdma_chan *, struct shdma_desc *);
+};
+
+#define shdma_for_each_chan(c, d, i) for (i = 0, c = (d)->schan[0]; \
+				i < (d)->dma_dev.chancnt; c = (d)->schan[++i])
+
+int shdma_request_irq(struct shdma_chan *, int, unsigned long, const char *);
+bool shdma_reset(struct shdma_dev *sdev);
+void shdma_chan_probe(struct shdma_dev *sdev, struct shdma_chan *schan, int id);
+void shdma_chan_remove(struct shdma_chan *schan);
+int shdma_init(struct device *dev, struct shdma_dev *sdev, int chan_num);
+void shdma_cleanup(struct shdma_dev *sdev);
+
 struct sh_dmae_regs {
 	u32 sar; /* SAR / source address */
 	u32 dar; /* DAR / destination address */
diff --git a/include/linux/shdma-base.h b/include/linux/shdma-base.h
index b6827c06d332f..a7e6184728f8d 100644
--- a/include/linux/shdma-base.h
+++ b/include/linux/shdma-base.h
@@ -43,85 +43,9 @@ struct shdma_slave {
 	int slave_id;
 };
 
-struct shdma_desc {
-	struct list_head node;
-	struct dma_async_tx_descriptor async_tx;
-	enum dma_transfer_direction direction;
-	size_t partial;
-	dma_cookie_t cookie;
-	int chunks;
-	int mark;
-	bool cyclic;			/* used as cyclic transfer */
-};
-
-struct shdma_chan {
-	spinlock_t chan_lock;		/* Channel operation lock */
-	struct list_head ld_queue;	/* Link descriptors queue */
-	struct list_head ld_free;	/* Free link descriptors */
-	struct dma_chan dma_chan;	/* DMA channel */
-	struct device *dev;		/* Channel device */
-	void *desc;			/* buffer for descriptor array */
-	int desc_num;			/* desc count */
-	size_t max_xfer_len;		/* max transfer length */
-	int id;				/* Raw id of this channel */
-	int irq;			/* Channel IRQ */
-	int slave_id;			/* Client ID for slave DMA */
-	int real_slave_id;		/* argument passed to filter function */
-	int hw_req;			/* DMA request line for slave DMA - same
-					 * as MID/RID, used with DT */
-	enum shdma_pm_state pm_state;
-};
-
-/**
- * struct shdma_ops - simple DMA driver operations
- * @desc_completed:	return true, if this is the descriptor, that just has
- *			completed (atomic)
- * @halt_channel:	stop DMA channel operation (atomic)
- * @channel_busy:	return true, if the channel is busy (atomic)
- * @slave_addr:		return slave DMA address
- * @desc_setup:		set up the hardware specific descriptor portion (atomic)
- * @set_slave:		bind channel to a slave
- * @setup_xfer:		configure channel hardware for operation (atomic)
- * @start_xfer:		start the DMA transfer (atomic)
- * @embedded_desc:	return Nth struct shdma_desc pointer from the
- *			descriptor array
- * @chan_irq:		process channel IRQ, return true if a transfer has
- *			completed (atomic)
- */
-struct shdma_ops {
-	bool (*desc_completed)(struct shdma_chan *, struct shdma_desc *);
-	void (*halt_channel)(struct shdma_chan *);
-	bool (*channel_busy)(struct shdma_chan *);
-	dma_addr_t (*slave_addr)(struct shdma_chan *);
-	int (*desc_setup)(struct shdma_chan *, struct shdma_desc *,
-			  dma_addr_t, dma_addr_t, size_t *);
-	int (*set_slave)(struct shdma_chan *, int, dma_addr_t, bool);
-	int (*setup_xfer)(struct shdma_chan *, int);
-	void (*start_xfer)(struct shdma_chan *, struct shdma_desc *);
-	struct shdma_desc *(*embedded_desc)(void *, int);
-	bool (*chan_irq)(struct shdma_chan *, int);
-	size_t (*get_partial)(struct shdma_chan *, struct shdma_desc *);
-};
-
-struct shdma_dev {
-	struct dma_device dma_dev;
-	struct shdma_chan **schan;
-	const struct shdma_ops *ops;
-	size_t desc_size;
-};
-
-#define shdma_for_each_chan(c, d, i) for (i = 0, c = (d)->schan[0]; \
-				i < (d)->dma_dev.chancnt; c = (d)->schan[++i])
+struct shdma_chan;
+struct shdma_dev;
 
-int shdma_request_irq(struct shdma_chan *, int,
-			   unsigned long, const char *);
-bool shdma_reset(struct shdma_dev *sdev);
-void shdma_chan_probe(struct shdma_dev *sdev,
-			   struct shdma_chan *schan, int id);
-void shdma_chan_remove(struct shdma_chan *schan);
-int shdma_init(struct device *dev, struct shdma_dev *sdev,
-		    int chan_num);
-void shdma_cleanup(struct shdma_dev *sdev);
 #if IS_ENABLED(CONFIG_SH_DMAE_BASE)
 bool shdma_chan_filter(struct dma_chan *chan, void *arg);
 #else
-- 
2.43.0

