Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022105.outbound.protection.outlook.com [40.107.75.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A48248867;
	Mon,  7 Sep 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752055; cv=fail; b=CvffgEM14emZUICE1g/ciJwLVdAIzXvBP6dPdtXAGvi79M9Ydk3Ncpz+azenRyD7lrez+6BxGCpET03NK1qgx8mI00fd2fQQgx9PKPb6B/w/rBzl97TXU0HpdFPdjIBGQ0cY181vsO2XDbKL3pMA5E5G8RfX7ga0YP0GhuOH9Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752055; c=relaxed/simple;
	bh=q2AM5F4P7iZnPsyYY8NXkLSBg4/p+dy9td4AMDFMbd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DinYwIIp4VSNQF8/0WK62wdG0G2KOFih+/uctoQ/SjFmWaYlTOF25baFu26SI27tYeOxosNJJcp7lnenPV84OR+NbMMzPJuxftNWCvDkthha3YzqumkVrc5S4ujbnhZ41XmHXaXxJchO4kxqSQVmsyAc8SFwosMlVUpioZzkMdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHPHz+7SM1xPz7CQ+WOFgtM6rFAyIei0v6ek0ebeUsoS7+PWnNAuNOVv0B7VNosvQJ1RPOQCdbkk8uROXbXCz5WSzSrADz1QBoOwRtaqSttJL0dyaXZ1IS+xiwvDep4dXVEC7oyE5rORK14gsRtLuaDo/+mqqgHIwrZd1K4lE3Eie7K0dfRW863XLoHhJWpX1NLZE7UFQaOLC5GPakHgROP/VCMgLWlz8ps+oz9aiAkXPqNBIu8SvXfYx0tHiImJurFmcfiagclsWV8Al21jJrm83+cXPQ/iVh5HiSHY3w9OVSdNMtfjq45eWCg2p3oJggO8CbM3JbPSbDeFYGMg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NfzIkYwwx4pbr34MjVWx51G00RHTazvGplZ343dJhw=;
 b=jZUc6kJBaj+AhZBsiH8syJnmpBZMYAo33cOG39lJngYSnzoZuzEWQgs1CR5xMuzN1YghhpDaawr8lYf/Ps4CzrBLChUSi4bNmwar2PhYYDJ6nByzfF0qUo88b/fz8rV+HzjXWwECfHTiDtyh7jTY/KOvvH5tq0xQRmvKjzhYI1n4XwYlD/sGb33kIKnaYTZKOGrAW62qo7PUhxJYri9ISrcOb+gplWg8ZaFRhFiwyuI7HvdjDGBqfRjd9eEUriJXhpn65/m/yY6pMyJdTNTLzGPvumX+ZgMbRJ9GGm5xVoRbdzM5VbpR5CON4gccYu3IWsMQiKJzPKVtmEkSUFt+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6P286CA0018.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3b9::17)
 by SI4PR06MB8802.apcprd06.prod.outlook.com (2603:1096:4:2b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:34:08 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:3b9:cafe::23) by TY6P286CA0018.outlook.office365.com
 (2603:1096:405:3b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:34:07 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 37D014092118;
	Mon,  7 Sep 2026 11:34:06 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly Jia <Jelly.Jia@cixtech.com>
Subject: [PATCH v1 2/5] dmaengine: arm-dma350: Add slave transfer support
Date: Mon,  7 Sep 2026 11:34:01 +0800
Message-ID: <20260907033404.596839-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SI4PR06MB8802:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e8e6a17-85e4-4f0c-0841-08df0c90dfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|23010399003|82310400026|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rF0HLJGlQukh6bEaaWW2hC5ukSLzG2herQvdvMU0OVcStd54mOmHZTy29x69EeZoZY/QMP5M00g5PN7x766kJa30lGnkUTjbf4psFl/AFYLzaV7+4unlCQWIobgzrLwoq8xPuldmHDScuRvz/8cY9pLU/cgf5zGFBrC9wH389T6cS9rsq5CiV3bXEp/cJ6o2wKG7sL6HBcMpmZMMw18Slm3YG3jaAxvMaFmPXHmXC6V0MVr23w8mS+i1ejwi3h8QBwY2Mf4zjf5HwUVJGAQkOgbYK69OpvhOWkcHUeqga1P1swiLlhJwezvaTFwHoYUUFX6zsAybPExe0JAe3gyMXJc4FTNtjnFH5/bRzqEjJoNaH54cXQmJhqR26qG2AgbHAvOPXUJBur8xq7pzyPVaIn2Yx55Ix4CqDNf1FUj+0as9FSQFDrMVsKodKFANzPTyA18PBA2AzPasfanfM3BXLCukP35x2dgqUCIWskdNE5W+aDBjQAR0hrhtN13VlYLBpwkypqq/U3MNi40ulQhaqZkbGXHb/uzGLuiBdatXUT9GtNRCnVTxHM2D1QVh4te+k2pVrU8haxEprPWplAyQBiWIPNImsfAToY8wS1/ewJZM+x9kzHk7PHhgmeWQ0SF6kbpex23LDAm4hpYh5ii4U/sOql6PwTRkFxy3f63NQ5iN69zQyeRYS4o+AmsNczzgjC5XOdCGxqg2zG3rYUCUQg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Eem75iz2GJoY/r0xe0Bv08z9fydC+Pt+9WHbfWQWtdzdVN3UAS6eeJjpHby9lz30cda67N/G2jwOuCl2DOtay3DSeKQL8yuuj6ofaiHknNt9Im7MH8MyBNOFd3IN/N16Y8psDMb1BXIBT2fJt5ifIX4+ozJhVgW631sRdtYvElw7x4+58APyD3NIU+g8o6MSCNOjJWi0zrxPKlWMwamjppwuG71L+LjNu538v96EQqN6qmgGK75xdEB+oi5nQ7FVMyVnc59oWhSV9hObHjrgeMdRLN/WlaDDId02/ZKNUt3/OnH7kiPZ16OdgEO0ItZGiFl/LU4nopkxC1UYWjvmg9gidFa2FvuOWfJBuEFQluukevJGNEpvPNG3c9XBBBRyGVv8PpXy22VoEqcqtk3WV3apslH3RAFBYln8cYItm1jH8XlMR0mH2jpHIV4ab5SX
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:34:07.5435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8e6a17-85e4-4f0c-0841-08df0c90dfaf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8802

Add DMA slave support to the Arm DMA-350 driver, which so far only
supports memory-to-memory transfers.

Slave transfers are needed to serve peripheral requests: on the CIX
Sky1 SoC, for example, the audio subsystem uses DMA-350 channels to
move PCM data between memory and peripheral FIFOs, which requires both
scatter-gather and cyclic transfers.

This adds scatter-gather and cyclic preparation, command-list
allocation, per-channel resource mapping, and residue reporting.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 640 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 617 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 4e17130de6c8..85e8c5e42804 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -3,12 +3,19 @@
 // Arm DMA-350 driver
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_dma.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
 
 #include "dmaengine.h"
 #include "virt-dma.h"
@@ -102,6 +109,10 @@
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
@@ -147,6 +158,7 @@
 #define LINK_LINKADDR		BIT(30)
 #define LINK_LINKADDRHI		BIT(31)
 
+#define D350_SLAVE_CMD_WORDS	14
 
 enum ch_ctrl_donetype {
 	CH_CTRL_DONETYPE_NONE = 0,
@@ -161,6 +173,18 @@ enum ch_ctrl_xtype {
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
@@ -178,7 +202,26 @@ struct d350_desc {
 	u32 command[16];
 	u16 xsize;
 	u16 xsizehi;
+	u32 *cmds;
+	dma_addr_t cmds_dma;	/* DMA API address from dma_alloc_coherent() */
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
@@ -189,10 +232,13 @@ struct d350_chan {
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
@@ -212,9 +258,462 @@ static inline struct d350_desc *to_d350_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct d350_desc, vd);
 }
 
+static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
+{
+	if (desc->cmds)
+		dma_free_coherent(dev, desc->cmds_size, desc->cmds,
+				  desc->cmds_dma);
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
+	size_t cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+
+	if (check_mul_overflow(ncmds, cmd_size, &desc->cmds_size))
+		return -ENOMEM;
+
+	desc->cmds = dma_alloc_coherent(dchan->device->dev, desc->cmds_size,
+					&desc->cmds_dma, GFP_NOWAIT);
+	if (!desc->cmds)
+		return -ENOMEM;
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
+/*
+ * Translate a CPU physical/resource address to the address visible to DMA350
+ * using the dma-ranges property of its parent bus. This is needed for internal
+ * interconnect windows where the DMA master sees slave peripherals at
+ * different addresses from the CPU.
+ */
+static int d350_xlate_parent_dma_range(struct device *dev, phys_addr_t phys,
+				       size_t size, dma_addr_t *dma)
+{
+	struct device_node *parent;
+	struct of_range_parser parser;
+	struct of_range range;
+	int ret = -ENOENT;
+
+	parent = of_get_parent(dev->of_node);
+	if (!parent)
+		return -ENOENT;
+
+	if (of_pci_dma_range_parser_init(&parser, parent))
+		goto out_put;
+
+	for_each_of_range(&parser, &range) {
+		u64 offset;
+
+		if (phys < range.cpu_addr)
+			continue;
+
+		offset = phys - range.cpu_addr;
+		if (offset >= range.size)
+			continue;
+
+		if (size > range.size - offset)
+			continue;
+
+		*dma = range.bus_addr + offset;
+		ret = 0;
+		break;
+	}
+
+out_put:
+	of_node_put(parent);
+	return ret;
+}
+
+static dma_addr_t d350_map_resource(struct d350_chan *dch,
+				    phys_addr_t cpu_addr, size_t size,
+				    enum dma_data_direction dir)
+{
+	struct device *dev = dch->vc.chan.device->dev;
+	struct d350_chan_map *map = &dch->map;
+	dma_addr_t dma_addr;
+	int ret;
+
+	if (map->dir == dir && map->cpu_addr == cpu_addr &&
+	    map->size == size)
+		return map->dma_addr;
+
+	d350_unmap_resource(dch);
+
+	if (!device_iommu_mapped(dev)) {
+		ret = d350_xlate_parent_dma_range(dev, cpu_addr, size,
+						  &dma_addr);
+		if (!ret)
+			goto done;
+
+		if (ret != -ENOENT) {
+			dev_err(dev, "translate resource failed ch%u phys=%pa size=%zu\n",
+				dch->vc.chan.chan_id, &cpu_addr, size);
+			return DMA_MAPPING_ERROR;
+		}
+	}
+
+	dma_addr = dma_map_resource(dev, cpu_addr, size, dir, 0);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_err(dev, "map slave failed ch%u phys=%pa size=%zu dir=%d\n",
+			dch->vc.chan.chan_id, &cpu_addr, size, dir);
+		return DMA_MAPPING_ERROR;
+	}
+	map->needs_unmap = true;
+
+done:
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
+	struct dma_chan *chan;
+	struct d350_chan *dch;
+	u32 req;
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
+	chan = dma_get_any_slave_channel(&dmac->dma);
+	if (!chan) {
+		dev_err(dmac->dma.dev, "can't get a dma channel\n");
+		return NULL;
+	}
+
+	dch = to_d350_chan(chan);
+	if (!dch->has_trig) {
+		dev_err(dmac->dma.dev, "channel %d has no trigger support\n",
+			chan->chan_id);
+		dma_release_channel(chan);
+		return NULL;
+	}
+	dch->req = req;
+
+	return chan;
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
+				size_t len, dma_addr_t link_addr,
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
+	cmd[12] = lower_32_bits(link_addr) |
+		  (link_addr ? CH_LINKADDR_EN : 0);
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
+				    link_addr, direction, width, maxburst,
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
+				    period_len, next, direction, width, maxburst,
+				    CH_CTRL_DONETYPE_CMD);
+	}
+	memcpy(desc->command, desc->cmds, cmd_size);
+
+	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
 }
 
 static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
@@ -228,6 +727,7 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | src | (1 << dch->tsz));
 	desc->xsize = lower_16_bits(len >> desc->tsz);
 	desc->xsizehi = upper_16_bits(len >> desc->tsz);
@@ -266,6 +766,7 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | (1 << dch->tsz));
 	desc->xsize = lower_16_bits(len >> desc->tsz);
 	desc->xsizehi = upper_16_bits(len >> desc->tsz);
@@ -339,6 +840,45 @@ static u32 d350_get_residue(struct d350_chan *dch)
 	return res << dch->desc->tsz;
 }
 
+static u32 d350_get_sg_residue(struct d350_chan *dch)
+{
+	struct d350_desc *desc = dch->desc;
+	size_t cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+	size_t cmd = 0, i;
+	u32 residue;
+	u64 next_cmd;
+
+	if (!desc->cmd_len)
+		return d350_get_residue(dch);
+
+	/*
+	 * CH_LINKADDR points at the next command. Match it against the command
+	 * array to find the command currently executing, then add every later
+	 * command which has not started yet.
+	 */
+	next_cmd = readl_relaxed(dch->base + CH_LINKADDR) & ~CH_LINKADDR_EN;
+	next_cmd |= (u64)readl_relaxed(dch->base + CH_LINKADDRHI) << 32;
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
@@ -369,7 +909,20 @@ static void d350_synchronize(struct dma_chan *chan)
 
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
@@ -387,7 +940,7 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	if (cookie == dch->cookie) {
 		status = dch->status;
 		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
-			dch->residue = d350_get_residue(dch);
+			dch->residue = d350_get_active_residue(dch);
 		residue = dch->residue;
 	} else if ((vd = vchan_find_desc(&dch->vc, cookie))) {
 		residue = d350_desc_bytes(to_d350_desc(vd));
@@ -469,17 +1022,32 @@ static void d350_issue_pending(struct dma_chan *chan)
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
@@ -487,21 +1055,27 @@ static irqreturn_t d350_irq(int irq, void *data)
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
 
@@ -525,6 +1099,7 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 
 	writel_relaxed(0, dch->base + CH_INTREN);
 	free_irq(dch->irq, dch);
+	d350_unmap_resource(dch);
 	vchan_free_chan_resources(&dch->vc);
 }
 
@@ -568,23 +1143,32 @@ static int d350_probe(struct platform_device *pdev)
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
@@ -623,6 +1207,8 @@ static int d350_probe(struct platform_device *pdev)
 		reg |= FIELD_PREP(CH_LINK_MEMATTR, coherent ? MEMATTR_WB : MEMATTR_NC);
 		writel_relaxed(reg, dch->base + CH_LINKATTR);
 
+		dch->coherent = coherent;
+		dch->map.dir = DMA_NONE;
 		dch->vc.desc_free = d350_desc_free;
 		vchan_init(&dch->vc, &dmac->dma);
 	}
@@ -638,6 +1224,13 @@ static int d350_probe(struct platform_device *pdev)
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
 
@@ -645,6 +1238,7 @@ static void d350_remove(struct platform_device *pdev)
 {
 	struct d350 *dmac = platform_get_drvdata(pdev);
 
+	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&dmac->dma);
 }
 
-- 
2.54.0

