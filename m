Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023085.outbound.protection.outlook.com [40.107.44.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354703DCDA4;
	Fri,  9 Oct 2026 05:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523171; cv=fail; b=Djo/EGdrsYUbzAcxa3MGShyxs54GtDJRaa9MZg3WrDRc8mbkE6AU/E3iHPOXFvAE66mDPAz85jROzz1e4Vx2XwDRA6f58YLnQHojarmZw+EbSQ1SsmKxNGGcooljgyuN/HIV5Ub+touyVvFWAelbtk+dGyEAR6lMiIk9eLTftmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523171; c=relaxed/simple;
	bh=2/QXG8e0+pX3s86tNeAZsd8EZGXYsJmOz9yHrY0I1H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPOXuk1/0GF2WCnCJS8ir4jiPRiXXzIYHVJ82DTqUxPvQF8gk/QYH8VER1AiG0JHcYYNdcxnI6S3oRRMzeEWkkErWcp/9fYc1ZrW1SmTuf8gjoFGnP9njM/KPlJ7eyHdqHVKcCyXsT6NHZ0T1d966WfFjqct6ySw0myBsHSbZlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1tDaafPZyZc6Ko2EU/Ai7gY3Mq6EyYnBNbCyB+r34h17rKRWjuKVjyGD67kwB1Edw0dx0AOb0dtwQSQv1MWxgktPr8qr3vDvOHDmiz0n0t9PJfBMGdDq9wDcGXliCobuID3I/8hMdMVEtrPzNTpkqrhuH/ZVLciW2ioobQGDcvaE5UHvwWBga+XTJbeKhSZd+fjVF0g5PbiZTi2KWLb4YLnLuMOydYFQg/uRSrTgT1R2/EBL5QJOGAlx3LACqjR/Hc0DXA1PsgRLpN4xpwE7EO1CFwYLUQNtivNx1F8D9vjzmuAMJtOvtTW/ZPKnzuTiSNJ8Prdytxx/DoLrVMy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLjqmzLccwADZ8zHFCisgHiPvpkACnGICBAya5LitYs=;
 b=W2De8pBK4SmWs3HSySPuO4ux1mODLtNp9SCxsgMjcZe5IfqffUsgnV+mW8AOdcZr/n1Fo5BdgwUmQ3kCWnkNrJGbtGxMZOfO5YVQLkqNx+kskPTHyM9j43GKFV2HeWuhagppLds8GKrU8J0pblcAMZfNBWzUW7lbps8Mnf8e7RzQteoymea0K6pEiHX9zR4jfwDvIJcIbekJkybTA9n5Y9187tX8cqYyMUlae+YdlbQoWkNp5QhOplg0RTvc+dVclnuxrtjbbFKQenn0gUpxkqd3FcAaQQUi1cTbRc+YyILsO7S23PWH9deIM0bxxZtziUQGrXNSIvUnA/KaaeNeYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0007.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::12)
 by JH0PR06MB6967.apcprd06.prod.outlook.com (2603:1096:990:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 05:19:24 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:301:16f:cafe::94) by PUVP216CA0007.outlook.office365.com
 (2603:1096:301:16f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A2D2940920E2;
	Fri,  9 Oct 2026 13:18:47 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v2 2/6] dmaengine: arm-dma350: Add slave and cyclic transfer support
Date: Fri,  9 Oct 2026 13:18:42 +0800
Message-ID: <20261009051846.1115962-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|JH0PR06MB6967:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca3c4ff7-bbfc-4763-2bea-08df25c4e138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	zz7goGlDoXBScEGjnhMdLiIVP5658Ipl6cpCkE9S0nFoBdwP9gvL/MPeKZUAlPaL1hIRrMBLxl+985HGe6UKnPAUoHogI7NMHKgXyRrQP7RiB4lph0r/LZnFt8auu0nm7ggUtGwIDcyDdWNq6E2xhCGp3/GqOhAaWEXwU+uJPL9eV+r4inhCG0fiKF6ZGF5HkB4JJLzC+OCbOg48rvqS1TChQl/QVoxnVFwRdzwDiKl4pHP6EALMN80ANNY0Tp6cAlJRsSk554KsxpqTRQaH7u0/yVll4f9L/MK5hSQdfwcvh26CLGaYbPvxNRDPfQN90Dj8jK/RAo+42FSrb3cRiYYq/bPae2feK4KkAUryq8aIbeYmA1w3HjNEmCeJWLD/7wH6w9b94OfaYYkxhNuNTFeLFjGgFEKnjOfmZkGb1CWvlmfw2Kb3YUmseiLim+VeUrumZ+Fxh5F8PVTBXly5BRycn1u7HvqF1bGZPvL1Z6Pr/skRq/mA35jkZWxBnwe1Yu4JQIj0wDi49ROvPL0Zaa7J9a+BN6AqZCaJ4CiYOkhA8J7oiaZ7DV3REM/LJQRgaygPn3parsDJ7RcltfQIn4HJQfzlsDIB+5LYeYPDHsx+MVnfoHlqZgWVneZaz6anxbJZOcHbtUf7zsu+cBsC1kZ9e8Xd7tSB80nlThZED85u+r0YeTuICA4EViRsONjyJyoqbCV5r/gskB3fMUCHng==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sCd7s7aY8tc/B7EirT2Z2cKcWre4bbmEXQHROEmhASH0BPNq9Nu97qfi+GMhcvrq3lwgL8XYe+mJ+n/OBF2zxMRx5fEQ2eXP/NUjoMwwrxu4XNI8pNQOhsKw7ZAhMeBTLTFCwdVAbHulr6ffDN5tU3LqYSbqxRWYjKlRo/556W8FOYkA+9qnx/Zr448NpRhI1LEBFFKM609zmdHUxbvLIpVqejIlFkdzMBB/WJSk8b3+IQ6GJUooLE2/4QVtL1oDcWp4AbnPdxk1ADKl6Cfs5+oyDrmDnTvqMtKse625lBmxr81l/sus0g90fJESgp8tJe/ooI0t71dXB3NAVUnbQW5TFxR7t/bhC+xPbJnuoKT2FDE4tf6gvZdxaf6+RRmVHf/0sjr4gQOA2m2rNZ4hHRt2Go0BmMk+v+RpEs5+TTv/0mM+JqX+5NHV5ASjT2Pa
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:22.8260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3c4ff7-bbfc-4763-2bea-08df25c4e138
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6967

Add DMA slave support to the Arm DMA-350 driver, which so far only
supports memory-to-memory transfers.

Slave transfers are needed to serve peripheral requests: on the CIX
Sky1 SoC, for example, the audio subsystem uses DMA-350 channels to
move PCM data between memory and peripheral FIFOs, which requires both
scatter-gather and cyclic transfers.

Each scatterlist entry becomes one command in a linked list of DMA-350
commands, so a whole slave_sg transfer runs without software
intervention; a cyclic transfer chains the last command back to the
first one, which the controller then executes indefinitely. The trigger
input comes from the DMA specifier and is programmed into CH_TRIGINCFG
with a per-direction block size matching the configured maxburst.

Peripheral addresses are translated through the DMA API and cached per
channel, so repeated transfers to the same FIFO do not remap. The
command list is allocated with kmalloc() and mapped with
dma_map_single() rather than dma_alloc_coherent(), because it is freed
from the virt-dma tasklet which runs with interrupts disabled, and
dma_free_coherent() may only be called with interrupts enabled.

Completion handling is reworked for the new descriptor types: the
handler claims an interrupt only when a channel interrupt is actually
pending, tolerates a spurious interrupt with no active descriptor, and
reports cyclic progress through vchan_cyclic_callback().

Residue reporting walks the command list: the channel link pointer is
read (retrying when the channel steps it between the two halves of the
address) to find the command being executed, and the length of every
command that has not started yet is added to the residue of the current
one.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
v1 -> v2:
- Allocate the command list with kmalloc() and map it with
  dma_map_single(); it is freed from the virt-dma tasklet, where
  dma_free_coherent() may not be called.
- Pick a free trigger-capable channel in .of_xlate() instead of taking
  an arbitrary channel and failing when it has no trigger support.
- Pass an explicit "link" flag to the command builders instead of
  inferring it from the link address.
- Read the link address registers in a retry loop, since the channel
  can step the link pointer between the two reads.
- The parent bus dma-ranges translation moved to the CIX integration
  patch, which is its only user.
 drivers/dma/arm-dma350.c | 604 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 581 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 4e17130de6c8..bbcf4071c3e7 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -3,12 +3,17 @@
 // Arm DMA-350 driver
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
 
 #include "dmaengine.h"
 #include "virt-dma.h"
@@ -102,6 +107,10 @@
 #define CH_FILLVAL		0x38
 #define CH_SRCTRIGINCFG		0x4c
 #define CH_DESTRIGINCFG		0x50
+#define CH_TRIGINCFG_BLKSIZE	GENMASK(23, 16)
+#define CH_TRIGINCFG_MODE	GENMASK(11, 10)
+#define CH_TRIGINCFG_TYPE	GENMASK(9, 8)
+#define CH_TRIGINCFG_SEL	GENMASK(7, 0)
 #define CH_LINKATTR		0x70
 #define CH_LINK_SHAREATTR	GENMASK(9, 8)
 #define CH_LINK_MEMATTR		GENMASK(7, 0)
@@ -147,6 +156,7 @@
 #define LINK_LINKADDR		BIT(30)
 #define LINK_LINKADDRHI		BIT(31)
 
+#define D350_SLAVE_CMD_WORDS	14
 
 enum ch_ctrl_donetype {
 	CH_CTRL_DONETYPE_NONE = 0,
@@ -161,6 +171,18 @@ enum ch_ctrl_xtype {
 	CH_CTRL_XTYPE_FILL = 3
 };
 
+enum ch_trigincfg_mode {
+	CH_TRIGINCFG_MODE_COMMAND = 0,
+	CH_TRIGINCFG_MODE_DMA_FC = 2,
+	CH_TRIGINCFG_MODE_PERIPH_FC = 3
+};
+
+enum ch_trigincfg_type {
+	CH_TRIGINCFG_TYPE_SW = 0,
+	CH_TRIGINCFG_TYPE_HW = 2,
+	CH_TRIGINCFG_TYPE_INTERNAL = 3
+};
+
 enum ch_cfg_shareattr {
 	SHAREATTR_NSH = 0,
 	SHAREATTR_OSH = 2,
@@ -178,7 +200,26 @@ struct d350_desc {
 	u32 command[16];
 	u16 xsize;
 	u16 xsizehi;
+	u32 *cmds;
+	dma_addr_t cmds_dma;	/* DMA API address of the command list */
+	dma_addr_t cmds_bus;	/* DMA350-visible address for CH_LINKADDR */
+	size_t cmds_size;
+	u32 *cmd_len;
+	size_t ncmds;
+	size_t bytes;
+	size_t period_len;
+	size_t periods;
+	size_t period;
 	u8 tsz;
+	bool cyclic;
+};
+
+struct d350_chan_map {
+	phys_addr_t cpu_addr;
+	dma_addr_t dma_addr;
+	size_t size;
+	enum dma_data_direction dir;
+	bool needs_unmap;
 };
 
 struct d350_chan {
@@ -189,10 +230,13 @@ struct d350_chan {
 	enum dma_status status;
 	dma_cookie_t cookie;
 	u32 residue;
+	u32 req;
 	u8 tsz;
 	bool has_trig;
 	bool has_wrap;
 	bool coherent;
+	struct d350_chan_map map;
+	struct dma_slave_config sconfig;
 };
 
 struct d350 {
@@ -212,9 +256,419 @@ static inline struct d350_desc *to_d350_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct d350_desc, vd);
 }
 
+static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
+{
+	if (desc->cmds) {
+		dma_unmap_single(dev, desc->cmds_dma, desc->cmds_size,
+				 DMA_TO_DEVICE);
+		kfree(desc->cmds);
+	}
+	kfree(desc->cmd_len);
+}
+
 static void d350_desc_free(struct virt_dma_desc *vd)
 {
-	kfree(to_d350_desc(vd));
+	struct d350_desc *desc = to_d350_desc(vd);
+
+	d350_free_cmds(vd->tx.chan->device->dev, desc);
+	kfree(desc);
+}
+
+static int d350_alloc_cmds(struct dma_chan *dchan, struct d350_desc *desc,
+			   size_t ncmds)
+{
+	struct device *dev = dchan->device->dev;
+	size_t cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+
+	if (check_mul_overflow(ncmds, cmd_size, &desc->cmds_size))
+		return -ENOMEM;
+
+	/*
+	 * The command list is freed from the virt-dma tasklet, which runs with
+	 * interrupts disabled, so it cannot come from dma_alloc_coherent():
+	 * dma_free_coherent() may only be called with interrupts enabled.
+	 */
+	desc->cmds = kmalloc(desc->cmds_size, GFP_NOWAIT);
+	if (!desc->cmds)
+		return -ENOMEM;
+
+	desc->cmds_dma = dma_map_single(dev, desc->cmds, desc->cmds_size,
+					DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, desc->cmds_dma)) {
+		kfree(desc->cmds);
+		desc->cmds = NULL;
+		return -ENOMEM;
+	}
+
+	desc->cmds_bus = desc->cmds_dma;
+	desc->ncmds = ncmds;
+
+	return 0;
+}
+
+static void d350_unmap_resource(struct d350_chan *dch)
+{
+	struct device *dev = dch->vc.chan.device->dev;
+	struct d350_chan_map *map = &dch->map;
+
+	if (map->dir == DMA_NONE)
+		return;
+
+	if (map->needs_unmap)
+		dma_unmap_resource(dev, map->dma_addr, map->size, map->dir, 0);
+
+	map->dir = DMA_NONE;
+	map->needs_unmap = false;
+}
+
+static dma_addr_t d350_map_resource(struct d350_chan *dch,
+				    phys_addr_t cpu_addr, size_t size,
+				    enum dma_data_direction dir)
+{
+	struct device *dev = dch->vc.chan.device->dev;
+	struct d350_chan_map *map = &dch->map;
+	dma_addr_t dma_addr;
+
+	if (map->dir == dir && map->cpu_addr == cpu_addr &&
+	    map->size == size)
+		return map->dma_addr;
+
+	d350_unmap_resource(dch);
+
+	dma_addr = dma_map_resource(dev, cpu_addr, size, dir, 0);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_err(dev, "map slave failed ch%u phys=%pa size=%zu dir=%d\n",
+			dch->vc.chan.chan_id, &cpu_addr, size, dir);
+		return DMA_MAPPING_ERROR;
+	}
+	map->needs_unmap = true;
+
+	map->cpu_addr = cpu_addr;
+	map->dma_addr = dma_addr;
+	map->size = size;
+	map->dir = dir;
+
+	return map->dma_addr;
+}
+
+static bool d350_buswidth_supported(u32 widths, enum dma_slave_buswidth width)
+{
+	return width < BITS_PER_TYPE(widths) && (widths & BIT(width));
+}
+
+static int d350_check_slave_config(struct dma_device *dma,
+				   struct dma_slave_config *config)
+{
+	u32 maxburst = FIELD_MAX(CH_CFG_MAXBURSTLEN) + 1;
+	u32 widths = dma->src_addr_widths | dma->dst_addr_widths;
+
+	if (!d350_buswidth_supported(widths, config->src_addr_width) ||
+	    !d350_buswidth_supported(widths, config->dst_addr_width))
+		return -EINVAL;
+
+	if (config->src_maxburst > maxburst ||
+	    config->dst_maxburst > maxburst)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int d350_config(struct dma_chan *chan, struct dma_slave_config *config)
+{
+	struct d350_chan *dch = to_d350_chan(chan);
+	struct dma_device *dma = chan->device;
+	unsigned long flags;
+	int ret;
+
+	ret = d350_check_slave_config(dma, config);
+	if (ret) {
+		dev_err(dma->dev, "invalid slave configuration\n");
+		return ret;
+	}
+
+	spin_lock_irqsave(&dch->vc.lock, flags);
+	if (dch->desc || !list_empty(&dch->vc.desc_allocated) ||
+	    !list_empty(&dch->vc.desc_submitted) ||
+	    !list_empty(&dch->vc.desc_issued)) {
+		spin_unlock_irqrestore(&dch->vc.lock, flags);
+		return -EBUSY;
+	}
+	spin_unlock_irqrestore(&dch->vc.lock, flags);
+
+	d350_unmap_resource(dch);
+	memcpy(&dch->sconfig, config, sizeof(dch->sconfig));
+
+	return 0;
+}
+
+static struct dma_chan *d350_of_xlate(struct of_phandle_args *dma_spec,
+				      struct of_dma *ofdma)
+{
+	struct d350 *dmac = ofdma->of_dma_data;
+	struct d350_chan *dch;
+	struct dma_chan *chan;
+	u32 req;
+	int i;
+
+	if (dma_spec->args_count != 1) {
+		dev_err(dmac->dma.dev, "dma phandle must have one argument\n");
+		return NULL;
+	}
+
+	req = dma_spec->args[0];
+	if (req >= dmac->nreq) {
+		dev_err(dmac->dma.dev, "invalid DMA request %u, have %d\n",
+			req, dmac->nreq);
+		return NULL;
+	}
+
+	for (i = 0; i < dmac->nchan; i++) {
+		dch = &dmac->channels[i];
+		if (!dch->has_trig)
+			continue;
+
+		chan = dma_get_slave_channel(&dch->vc.chan);
+		if (chan) {
+			dch->req = req;
+			return chan;
+		}
+	}
+
+	dev_err(dmac->dma.dev, "no free channel with trigger support\n");
+
+	return NULL;
+}
+
+static u32 d350_device_transcfg(u32 maxburst)
+{
+	return FIELD_PREP(CH_CFG_MAXBURSTLEN, maxburst - 1) |
+	       FIELD_PREP(CH_CFG_SHAREATTR, SHAREATTR_OSH) |
+	       FIELD_PREP(CH_CFG_MEMATTR, MEMATTR_DEVICE);
+}
+
+static int d350_slave_params(struct d350_chan *dch,
+			     enum dma_transfer_direction direction,
+			     phys_addr_t *dev_cpu_addr,
+			     enum dma_data_direction *dev_dir,
+			     enum dma_slave_buswidth *width, u32 *maxburst)
+{
+	struct dma_slave_config *config = &dch->sconfig;
+
+	if (direction == DMA_MEM_TO_DEV) {
+		*dev_cpu_addr = config->dst_addr;
+		*dev_dir = DMA_FROM_DEVICE;
+		*width = config->dst_addr_width;
+		*maxburst = config->dst_maxburst;
+	} else if (direction == DMA_DEV_TO_MEM) {
+		*dev_cpu_addr = config->src_addr;
+		*dev_dir = DMA_TO_DEVICE;
+		*width = config->src_addr_width;
+		*maxburst = config->src_maxburst;
+	} else {
+		return -EINVAL;
+	}
+
+	return *width && *maxburst ? 0 : -EINVAL;
+}
+
+static void d350_fill_slave_cmd(struct d350_chan *dch, struct d350_desc *desc,
+				u32 *cmd, dma_addr_t mem, dma_addr_t dev_dma_addr,
+				size_t len, bool link, dma_addr_t link_addr,
+				enum dma_transfer_direction direction,
+				enum dma_slave_buswidth width, u32 maxburst,
+				enum ch_ctrl_donetype donetype)
+{
+	bool mem_to_dev = direction == DMA_MEM_TO_DEV;
+	u16 xsize, xsizehi;
+	u32 devcfg;
+	u32 memcfg;
+	u32 trigcfg;
+
+	desc->tsz = __ffs(width);
+	xsize = lower_16_bits(len >> desc->tsz);
+	xsizehi = upper_16_bits(len >> desc->tsz);
+	devcfg = d350_device_transcfg(maxburst);
+	memcfg = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
+
+	trigcfg = FIELD_PREP(CH_TRIGINCFG_BLKSIZE,
+			     mem_to_dev ? maxburst - 1 : 0) |
+		  FIELD_PREP(CH_TRIGINCFG_MODE, CH_TRIGINCFG_MODE_PERIPH_FC) |
+		  FIELD_PREP(CH_TRIGINCFG_TYPE, CH_TRIGINCFG_TYPE_HW) |
+		  FIELD_PREP(CH_TRIGINCFG_SEL, dch->req);
+
+	cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
+		 LINK_DESADDRHI | LINK_XSIZE | LINK_XSIZEHI | LINK_SRCTRANSCFG |
+		 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR |
+		 LINK_LINKADDRHI |
+		 (mem_to_dev ? LINK_DESTRIGINCFG : LINK_SRCTRIGINCFG);
+	cmd[1] = (mem_to_dev ? CH_CTRL_USEDESTRIGIN : CH_CTRL_USESRCTRIGIN) |
+		 FIELD_PREP(CH_CTRL_TRANSIZE, desc->tsz) |
+		 FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE) |
+		 FIELD_PREP(CH_CTRL_DONETYPE, donetype);
+	cmd[2] = lower_32_bits(mem_to_dev ? mem : dev_dma_addr);
+	cmd[3] = upper_32_bits(mem_to_dev ? mem : dev_dma_addr);
+	cmd[4] = lower_32_bits(mem_to_dev ? dev_dma_addr : mem);
+	cmd[5] = upper_32_bits(mem_to_dev ? dev_dma_addr : mem);
+	cmd[6] = FIELD_PREP(CH_XY_SRC, xsize) |
+		 FIELD_PREP(CH_XY_DES, xsize);
+	cmd[7] = FIELD_PREP(CH_XY_SRC, xsizehi) |
+		 FIELD_PREP(CH_XY_DES, xsizehi);
+	cmd[8] = mem_to_dev ? memcfg : devcfg;
+	cmd[9] = mem_to_dev ? devcfg : memcfg;
+	cmd[10] = mem_to_dev ? FIELD_PREP(CH_XY_SRC, 1) :
+				FIELD_PREP(CH_XY_DES, 1);
+	cmd[11] = trigcfg;
+	cmd[12] = lower_32_bits(link_addr) | (link ? CH_LINKADDR_EN : 0);
+	cmd[13] = upper_32_bits(link_addr);
+}
+
+static struct dma_async_tx_descriptor *
+d350_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
+		   unsigned int sg_len,
+		   enum dma_transfer_direction direction,
+		   unsigned long flags, void *context)
+{
+	struct d350_chan *dch = to_d350_chan(dchan);
+	size_t cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+	enum dma_data_direction dev_dir;
+	enum dma_slave_buswidth width;
+	struct d350_desc *desc;
+	phys_addr_t dev_cpu_addr;
+	dma_addr_t dev_dma_addr, mem;
+	struct scatterlist *sg;
+	u32 maxburst;
+	size_t len;
+	int i;
+
+	if (unlikely(!is_slave_direction(direction) || !sg_len))
+		return NULL;
+
+	if (d350_slave_params(dch, direction, &dev_cpu_addr, &dev_dir, &width,
+			      &maxburst))
+		return NULL;
+
+	dev_dma_addr = d350_map_resource(dch, dev_cpu_addr, width, dev_dir);
+	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
+		return NULL;
+
+	desc = kzalloc_obj(*desc, GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	if (sg_len > 1) {
+		if (d350_alloc_cmds(dchan, desc, sg_len))
+			goto err_free_desc;
+
+		desc->cmd_len = kcalloc(sg_len, sizeof(*desc->cmd_len),
+					GFP_NOWAIT);
+		if (!desc->cmd_len)
+			goto err_free_cmds;
+	}
+
+	for_each_sg(sgl, sg, sg_len, i) {
+		enum ch_ctrl_donetype donetype = CH_CTRL_DONETYPE_CMD;
+		dma_addr_t link_addr = 0;
+		bool link = false;
+		u32 *cmd = desc->command;
+
+		mem = sg_dma_address(sg);
+		len = sg_dma_len(sg);
+		if (!len || (len >> __ffs(width)) > U32_MAX ||
+		    !IS_ALIGNED(len | mem | dev_dma_addr, width))
+			goto err_free_cmds;
+
+		if (sg_len > 1) {
+			cmd = desc->cmds + i * D350_SLAVE_CMD_WORDS;
+			if (i < sg_len - 1) {
+				link = true;
+				link_addr = desc->cmds_bus + (i + 1) * cmd_size;
+				donetype = CH_CTRL_DONETYPE_NONE;
+			}
+			desc->cmd_len[i] = len;
+		}
+
+		if (check_add_overflow(desc->bytes, len, &desc->bytes) ||
+		    desc->bytes > U32_MAX)
+			goto err_free_cmds;
+
+		d350_fill_slave_cmd(dch, desc, cmd, mem, dev_dma_addr, len,
+				    link, link_addr, direction, width, maxburst,
+				    donetype);
+	}
+
+	if (sg_len > 1)
+		memcpy(desc->command, desc->cmds, cmd_size);
+
+	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
+
+err_free_cmds:
+	d350_free_cmds(dchan->device->dev, desc);
+err_free_desc:
+	kfree(desc);
+
+	return NULL;
+}
+
+static struct dma_async_tx_descriptor *
+d350_prep_dma_cyclic(struct dma_chan *dchan, dma_addr_t buf_addr,
+		     size_t buf_len, size_t period_len,
+		     enum dma_transfer_direction direction, unsigned long flags)
+{
+	struct d350_chan *dch = to_d350_chan(dchan);
+	struct d350_desc *desc;
+	phys_addr_t dev_cpu_addr;
+	dma_addr_t dev_dma_addr;
+	enum dma_data_direction dev_dir;
+	enum dma_slave_buswidth width;
+	size_t period, cmd_size;
+	u32 maxburst;
+	int ret;
+
+	if (!buf_len || !period_len || buf_len % period_len ||
+	    buf_len > U32_MAX || !is_slave_direction(direction))
+		return NULL;
+
+	ret = d350_slave_params(dch, direction, &dev_cpu_addr, &dev_dir, &width,
+				&maxburst);
+	if (ret)
+		return NULL;
+
+	dev_dma_addr = d350_map_resource(dch, dev_cpu_addr, width, dev_dir);
+	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
+		return NULL;
+
+	if (!IS_ALIGNED(buf_addr | dev_dma_addr | period_len, width))
+		return NULL;
+
+	desc = kzalloc_obj(*desc, GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	desc->bytes = buf_len;
+	desc->period_len = period_len;
+	desc->periods = buf_len / period_len;
+	desc->cyclic = true;
+
+	if (d350_alloc_cmds(dchan, desc, desc->periods)) {
+		kfree(desc);
+		return NULL;
+	}
+
+	cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+
+	for (period = 0; period < desc->periods; period++) {
+		u32 *cmd = desc->cmds + period * D350_SLAVE_CMD_WORDS;
+		dma_addr_t mem = buf_addr + period * period_len;
+		dma_addr_t next = desc->cmds_bus +
+				  ((period + 1) % desc->periods) * cmd_size;
+
+		d350_fill_slave_cmd(dch, desc, cmd, mem, dev_dma_addr,
+				    period_len, true, next, direction, width,
+				    maxburst, CH_CTRL_DONETYPE_CMD);
+	}
+	memcpy(desc->command, desc->cmds, cmd_size);
+
+	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
 }
 
 static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
@@ -228,6 +682,7 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | src | (1 << dch->tsz));
 	desc->xsize = lower_16_bits(len >> desc->tsz);
 	desc->xsizehi = upper_16_bits(len >> desc->tsz);
@@ -266,6 +721,7 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | (1 << dch->tsz));
 	desc->xsize = lower_16_bits(len >> desc->tsz);
 	desc->xsizehi = upper_16_bits(len >> desc->tsz);
@@ -339,6 +795,54 @@ static u32 d350_get_residue(struct d350_chan *dch)
 	return res << dch->desc->tsz;
 }
 
+static u32 d350_get_sg_residue(struct d350_chan *dch)
+{
+	struct d350_desc *desc = dch->desc;
+	size_t cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+	size_t cmd = 0, i;
+	u32 linkaddr, linkaddrhi, hi_new;
+	u32 residue;
+	u64 next_cmd;
+	int retries = 3; /* 1st time unlucky, 2nd improbable, 3rd just broken */
+
+	if (!desc->cmd_len)
+		return d350_get_residue(dch);
+
+	/*
+	 * CH_LINKADDR points at the next command. Match it against the command
+	 * array to find the command currently executing, then add every later
+	 * command which has not started yet.
+	 */
+	/* The channel may step the link pointer between the two reads */
+	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+	do {
+		linkaddrhi = hi_new;
+		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
+		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+	} while (linkaddrhi != hi_new && --retries);
+
+	next_cmd = (linkaddr & ~CH_LINKADDR_EN) | ((u64)linkaddrhi << 32);
+
+	if (!next_cmd) {
+		cmd = desc->ncmds - 1;
+	} else {
+		for (i = 1; i < desc->ncmds; i++) {
+			if (next_cmd == desc->cmds_bus + i * cmd_size) {
+				cmd = i - 1;
+				break;
+			}
+		}
+		if (i == desc->ncmds)
+			return dch->residue;
+	}
+
+	residue = d350_get_residue(dch);
+	for (i = cmd + 1; i < desc->ncmds; i++)
+		residue += desc->cmd_len[i];
+
+	return residue;
+}
+
 static int d350_terminate_all(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
@@ -369,7 +873,20 @@ static void d350_synchronize(struct dma_chan *chan)
 
 static u32 d350_desc_bytes(struct d350_desc *desc)
 {
-	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
+	return desc->bytes;
+}
+
+static u32 d350_get_cyclic_residue(struct d350_desc *desc)
+{
+	return desc->bytes - desc->period * desc->period_len;
+}
+
+static u32 d350_get_active_residue(struct d350_chan *dch)
+{
+	if (dch->desc->cyclic)
+		return d350_get_cyclic_residue(dch->desc);
+
+	return d350_get_sg_residue(dch);
 }
 
 static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
@@ -387,7 +904,7 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	if (cookie == dch->cookie) {
 		status = dch->status;
 		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
-			dch->residue = d350_get_residue(dch);
+			dch->residue = d350_get_active_residue(dch);
 		residue = dch->residue;
 	} else if ((vd = vchan_find_desc(&dch->vc, cookie))) {
 		residue = d350_desc_bytes(to_d350_desc(vd));
@@ -469,17 +986,32 @@ static void d350_issue_pending(struct dma_chan *chan)
 static irqreturn_t d350_irq(int irq, void *data)
 {
 	struct d350_chan *dch = data;
-	struct device *dev = dch->vc.chan.device->dev;
-	struct virt_dma_desc *vd = &dch->desc->vd;
+	struct virt_dma_desc *vd;
+	struct d350_desc *desc;
+	u32 residue = 0;
 	u32 ch_status;
+	u32 irq_status;
+	u32 errinfo = 0;
 
 	ch_status = readl(dch->base + CH_STATUS);
-	if (!ch_status)
+	irq_status = ch_status & (CH_STAT_INTR_DONE | CH_STAT_INTR_ERR);
+	if (!irq_status)
 		return IRQ_NONE;
 
-	if (ch_status & CH_STAT_INTR_ERR) {
-		u32 errinfo = readl_relaxed(dch->base + CH_ERRINFO);
+	if (irq_status & CH_STAT_INTR_ERR)
+		errinfo = readl_relaxed(dch->base + CH_ERRINFO);
 
+	writel_relaxed(ch_status, dch->base + CH_STATUS);
+
+	spin_lock(&dch->vc.lock);
+	desc = dch->desc;
+	if (!desc) {
+		spin_unlock(&dch->vc.lock);
+		return IRQ_HANDLED;
+	}
+
+	vd = &desc->vd;
+	if (irq_status & CH_STAT_INTR_ERR) {
 		if (errinfo & (CH_ERRINFO_AXIRDPOISERR | CH_ERRINFO_AXIRDRESPERR))
 			vd->tx_result.result = DMA_TRANS_READ_FAILED;
 		else if (errinfo & CH_ERRINFO_AXIWRRESPERR)
@@ -487,21 +1019,27 @@ static irqreturn_t d350_irq(int irq, void *data)
 		else
 			vd->tx_result.result = DMA_TRANS_ABORTED;
 
-		vd->tx_result.residue = d350_get_residue(dch);
-	} else if (!(ch_status & CH_STAT_INTR_DONE)) {
-		dev_warn(dev, "Unexpected IRQ source? 0x%08x\n", ch_status);
-	}
-	writel_relaxed(ch_status, dch->base + CH_STATUS);
-
-	spin_lock(&dch->vc.lock);
-	vchan_cookie_complete(vd);
-	if (ch_status & CH_STAT_INTR_DONE) {
-		dch->status = DMA_COMPLETE;
-		dch->residue = 0;
-		d350_start_next(dch);
-	} else {
+		residue = d350_get_active_residue(dch);
+		vd->tx_result.residue = residue;
 		dch->status = DMA_ERROR;
-		dch->residue = vd->tx_result.residue;
+		dch->residue = residue;
+		dch->desc = NULL;
+		if (desc->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			vchan_cookie_complete(vd);
+	} else {
+		if (desc->cyclic) {
+			desc->period = (desc->period + 1) % desc->periods;
+			dch->residue = d350_get_cyclic_residue(desc);
+			vchan_cyclic_callback(vd);
+		} else {
+			dch->status = DMA_COMPLETE;
+			dch->residue = 0;
+			dch->desc = NULL;
+			vchan_cookie_complete(vd);
+			d350_start_next(dch);
+		}
 	}
 	spin_unlock(&dch->vc.lock);
 
@@ -525,6 +1063,7 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 
 	writel_relaxed(0, dch->base + CH_INTREN);
 	free_irq(dch->irq, dch);
+	d350_unmap_resource(dch);
 	vchan_free_chan_resources(&dch->vc);
 }
 
@@ -568,23 +1107,32 @@ static int d350_probe(struct platform_device *pdev)
 	dev_dbg(dev, "DMA-350 r%dp%d with %d channels, %d requests\n", r, p, dmac->nchan, dmac->nreq);
 
 	dmac->dma.dev = dev;
+	dmac->dma.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_UNDEFINED);
+	dmac->dma.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_UNDEFINED);
 	for (int i = min(dw, 16); i > 0; i /= 2) {
 		dmac->dma.src_addr_widths |= BIT(i);
 		dmac->dma.dst_addr_widths |= BIT(i);
 	}
-	dmac->dma.directions = BIT(DMA_MEM_TO_MEM);
+	dmac->dma.directions = BIT(DMA_MEM_TO_MEM) |
+			BIT(DMA_MEM_TO_DEV) |
+			BIT(DMA_DEV_TO_MEM);
 	dmac->dma.descriptor_reuse = true;
 	dmac->dma.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 	dmac->dma.device_alloc_chan_resources = d350_alloc_chan_resources;
 	dmac->dma.device_free_chan_resources = d350_free_chan_resources;
 	dma_cap_set(DMA_MEMCPY, dmac->dma.cap_mask);
+	dma_cap_set(DMA_SLAVE, dmac->dma.cap_mask);
+	dma_cap_set(DMA_CYCLIC, dmac->dma.cap_mask);
 	dmac->dma.device_prep_dma_memcpy = d350_prep_memcpy;
+	dmac->dma.device_prep_slave_sg = d350_prep_slave_sg;
+	dmac->dma.device_prep_dma_cyclic = d350_prep_dma_cyclic;
 	dmac->dma.device_pause = d350_pause;
 	dmac->dma.device_resume = d350_resume;
 	dmac->dma.device_terminate_all = d350_terminate_all;
 	dmac->dma.device_synchronize = d350_synchronize;
 	dmac->dma.device_tx_status = d350_tx_status;
 	dmac->dma.device_issue_pending = d350_issue_pending;
+	dmac->dma.device_config = d350_config;
 	INIT_LIST_HEAD(&dmac->dma.channels);
 
 	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
@@ -623,6 +1171,8 @@ static int d350_probe(struct platform_device *pdev)
 		reg |= FIELD_PREP(CH_LINK_MEMATTR, coherent ? MEMATTR_WB : MEMATTR_NC);
 		writel_relaxed(reg, dch->base + CH_LINKATTR);
 
+		dch->coherent = coherent;
+		dch->map.dir = DMA_NONE;
 		dch->vc.desc_free = d350_desc_free;
 		vchan_init(&dch->vc, &dmac->dma);
 	}
@@ -638,6 +1188,13 @@ static int d350_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
+	ret = of_dma_controller_register(dev->of_node, d350_of_xlate, dmac);
+	if (ret) {
+		dma_async_device_unregister(&dmac->dma);
+		return dev_err_probe(dev, ret,
+				     "Failed to register OF DMA controller\n");
+	}
+
 	return 0;
 }
 
@@ -645,6 +1202,7 @@ static void d350_remove(struct platform_device *pdev)
 {
 	struct d350 *dmac = platform_get_drvdata(pdev);
 
+	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&dmac->dma);
 }
 
-- 
2.54.0

