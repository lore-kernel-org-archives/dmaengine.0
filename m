Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747838;
	b=kt9Pi2fE8VrqjrC4M5yeE2jag1tmYw6Jh5nnuVWdR/xheyGXXHk6v1j2esA6bee8h/cu
	 6mfoPTqbL+Qf31Anzk2eCJybB/b5Val2fd+al/vdBLBqUR8+xoorBs/yQ9oat2aq6uE2H
	 +b3KFJsJ/mw2GF5dC/9cNTA0YM34PgyAOhLB68FUw7h44WMJVOKJLNW9M6FK3XFUYDVxS
	 qKioRM9t4im0s2xptuZyTjzxsFzhxnce1h8SFZsfFFO7GtIbJTqLaCxiNB/K+0Myiz99p
	 oNvoPT4M85wCTJuyDfukqMGYvoKVgyoFPJTBSb99636EccvMP7+FwRk0TUEyoODFHQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747838;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5kT35Bjp8KFl1jAvONfEoe8gxZ4yawr7KoB1wi+MoAo=;
	b=FpdnGRiR+KYyPyXvEJFVJtOzpTR58yrK9ulz4BbzXa+x4R7rJ0IKmWD/9+V57Yc+r3Ea
	 wVEAHtV2oePescPZahrtOHdPdP05Ka5aRwqPALudVgopsyHEY4WghWsNhQJmnh/U9Vefd
	 6fH1e/eG3codx41+oefelnUiwUTjPKuKsSqvUiCnW6fePVvHU8SxQ7Lm1v8jV+lXFdeMJ
	 Ky6zYHx0FzWWWbHoUx7pgp2iNQQCHG9NAYNU0maATb+sL89K6oCUdp8E9inZ4HkFWt8WP
	 /rvJaLraFsdFdSoDumEJrwc2/yhHo08h0/fFru8hxEc1SzmR4EFLlGU64zBm99p0U9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.114
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023114.outbound.protection.outlook.com [40.107.44.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E3460A261C;
	Fri, 23 Oct 2026 09:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E3460A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfD9/Qlm6PFtBkYlScDn4vQQ1jM15EAUhI2GEi2nyJQxgVFpp7+BwsSykZK8TRBn+9/he7OspBfg4CQllAAscS5OEYkeTYbYeQSxM4g01hfMtPkQMvUMakTJwA5ncbK6E0fH7KoIGfJC2vCNwyTHprm5Moph1zXki6d52oZETAHmbZkMJhGSBWlDRdHfAqNJmR8jZMRpVbnK7ACooxuv8uOWPqPs3xrW1I/U7XxeEWWnrmpBoNxkRIrUApSgAFjLftAI7ZhqEDFfGm7wDAy5RQNnc1y5zJSghhnHesKzRrDoU5oqprQO6EwODJeHoPBqW/v+WSsSAwaqiWsyMCqTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kT35Bjp8KFl1jAvONfEoe8gxZ4yawr7KoB1wi+MoAo=;
 b=tzPFuOCryIRvSODyxVQsiP7oY4RUana+DymxfHUlDjjSnXzRo6BeFZtWJEI+rJ/wgz3QVStFc+7pY8k5OtgqLgsD1cqZpVEBjD0e/h2CoZhCn+goBJXcWg4bLOire0L0Wa+6yPOTifkNkI96QDG4ZwBoE6viSLzd5UNmsEnjJ7TibtjT5Z6iCvdEFpDMxxGrolwzI+J8tBSg+/q2WsIcNSiwDVjGMhidAYW9F4taspEgdGqnMW1n3mkTYdSj4dFqZpoZiXVuFM2inxqfbP/UfqIyv52Rwl5nXURG8bgcrPIcz6+eZCb2aHRwJvbsxAbIkEZQns6tIm+ixQHAuhxbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0058.apcprd02.prod.outlook.com (2603:1096:4:1f5::9) by
 PUZPR06MB5851.apcprd06.prod.outlook.com (2603:1096:301:f9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.2; Fri, 23 Oct 2026 09:30:21 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:1f5:cafe::5f) by SI1PR02CA0058.outlook.office365.com
 (2603:1096:4:1f5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 09:30:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7A3BC40920E1;
	Fri, 23 Oct 2026 17:30:18 +0800 (CST)
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
Subject: [PATCH v4 2/5] dmaengine: arm-dma350: Add slave and cyclic transfer support
Date: Fri, 23 Oct 2026 17:30:14 +0800
Message-ID: <20261023093017.3248454-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|PUZPR06MB5851:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b2ece2ec-8449-4220-7749-08df30e84152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|7416014|376014|6133799003|18002099003|22082099003|261022105027099003|3023799007|261022075727099003|261021135927099003|5023799004|261021133027099003|261009223027099003|261021123027099003|261021130227099003|10067099003|261021121427099003|261022115727099003|261022113327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	O6+0Oklhgn1HsG9o2ivdEGSrGv4UXsajf3TUcVcT6utD+Z27gGBXrFvDEQEK+NsshuZm4C5Nsou16EP1QZrQ5l1TJUqox6egPLYXLM4kAG3/Iqjohib0Hu8YDmMc9JiITDpB82w4uAhANHKqtsvH+m2hbq6hhcOQU78ugJgCmN7xc2YF7HfigTa6cHNUnV4shof7Rd9oABs0gkHfW90xnhz54Q0ZB4+wvo6Bgl+GW9xBOGvWc9WG8xxFioc1DUHEchq+/Eu21jDuw7bRiDdQfGx96FxGYgaUHkCsRa4srafyplY30JhY/kUWwbufcX1JeBf2F727uuFRqRsXxHryIjvcrliGZxHMSmrZT9lD8TP53aH/JXn+hYQ+r5JZalVBC4nwzJXdHCKxlg+BHz/dadxZbG3p9czXacSEmGpQlr9yWV/1Md2kyo0Ig2CeUuPzE3fxagd6XmDno3K+GtcfGEaueMEH9sy4nNNSe937AZIz3LG1c4ujzJSqLLNZ3VeFzp57ZGUClYRzycdYWsnfhC8Ac26ylKeIKESMjg2YpwZXChIfdpNH9YikCMyFOlcsEAwYwAiROS8bTKwbXSDR3XG6gWNlHhAkzgf/nj51nZS8kwQefJGSGU8M4xERPj/k0wGm2gXdoLGS03bW5NiTaNXE5Ebu5/t/pTi2CXdlTMNIxkmTQVfcaY6NXA023dgqdMNYGNHwHZSxe4SBtkSIAQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(7416014)(376014)(6133799003)(18002099003)(22082099003)(261022105027099003)(3023799007)(261022075727099003)(261021135927099003)(5023799004)(261021133027099003)(261009223027099003)(261021123027099003)(261021130227099003)(10067099003)(261021121427099003)(261022115727099003)(261022113327099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pae6y70GrOQOQjGLNqiQ4YxCAqtzqq7WXRDxDHj357h/2ft1eWwJJHOC/+SuyitmFa5BFoZ0n51Iz7cCup8jDXO1njbvgP9EYsbllw3YBgHhPCIIEElNmNnt9qUKpuY0oWzmsbpQAUFp5z+vH0oYjStyJfj913g3jIsdU9gf76goJdR7iYdI/jHqTy53mjFV/zSH+J1gUoJi/ViZgxQDvkXtTgXaYNFYBWWlY3Lf0c7mZ/VDloYejzaR3YU6zFqeS0s5Bs0jPAD6uYZqmowPhAffHiPdTaVdZ/FV8YlAEqv8gztS4CZeRAK3kl8QjFwXaHAfYyO2u4ZzcbWr0dy4jJtT8FMCb4iER1gNP21FflD7aIWD1KnDXOL3jHwg1FGdOwQ9NFD6caHwyLtw94sJycptP3cBSgsCGRfefe0/PAU0eLgpx85N3e5xJ1eizUgQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:19.3765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ece2ec-8449-4220-7749-08df30e84152
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5851

The driver currently supports memory-to-memory transfers only. Add
peripheral scatter-gather and cyclic transfers in both directions, with
trigger configuration, period callbacks and residue reporting.

Keep each peripheral DMA mapping for the lifetime of its descriptor so
preparing another transfer cannot invalidate a queued mapping. Allocate
linked commands from a coherent DMA pool to respect the controller's DMA
ranges and permit freeing them from the virt-dma tasklet. Store commands
in little-endian format and order writes before publishing them.

Set the trigger block size from maxburst in both directions. Sample the
link pointer around the hardware residue counters and retain the cached
residue if the channel advances during sampling. Include submitted
descriptors in status queries and protect slave configuration updates
with the channel lock.

Check DMA mask setup and register the OF DMA provider only for OF-backed
devices. During teardown, request channel stop and poll STOPCMD with a
bounded timeout. Warn on timeout but continue IRQ and virt-dma cleanup;
this is best-effort teardown, not confirmation that hardware has stopped.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 755 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 726 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 4e17130de6c8..f62ff6a9f490 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -3,12 +3,19 @@
 // Arm DMA-350 driver
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
 
 #include "dmaengine.h"
 #include "virt-dma.h"
@@ -47,6 +54,8 @@
 #define CH_CMD_CLEAR		BIT(1)
 #define CH_CMD_ENABLE		BIT(0)
 
+#define D350_STOP_TIMEOUT_US	10000
+
 #define CH_STATUS		0x04
 #define CH_STAT_RESUMEWAIT	BIT(21)
 #define CH_STAT_PAUSED		BIT(20)
@@ -102,6 +111,10 @@
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
@@ -147,6 +160,7 @@
 #define LINK_LINKADDR		BIT(30)
 #define LINK_LINKADDRHI		BIT(31)
 
+#define D350_SLAVE_CMD_WORDS	14
 
 enum ch_ctrl_donetype {
 	CH_CTRL_DONETYPE_NONE = 0,
@@ -161,6 +175,18 @@ enum ch_ctrl_xtype {
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
@@ -173,12 +199,29 @@ enum ch_cfg_memattr {
 	MEMATTR_WB = 0xff
 };
 
+struct d350_hw_cmd {
+	__le32 *words;
+	dma_addr_t dma;
+};
+
 struct d350_desc {
 	struct virt_dma_desc vd;
 	u32 command[16];
 	u16 xsize;
 	u16 xsizehi;
+	dma_addr_t resource_dma;
+	size_t resource_size;
+	enum dma_data_direction resource_dir;
+	bool resource_mapped;
+	struct d350_hw_cmd *cmds;
+	u32 *cmd_len;
+	size_t ncmds;
+	size_t bytes;
+	size_t period_len;
+	size_t periods;
+	size_t period;
 	u8 tsz;
+	bool cyclic;
 };
 
 struct d350_chan {
@@ -189,14 +232,18 @@ struct d350_chan {
 	enum dma_status status;
 	dma_cookie_t cookie;
 	u32 residue;
+	u32 req;
 	u8 tsz;
 	bool has_trig;
 	bool has_wrap;
 	bool coherent;
+	bool stopping;
+	struct dma_slave_config sconfig;
 };
 
 struct d350 {
 	struct dma_device dma;
+	struct dma_pool *cmd_pool;
 	int nchan;
 	int nreq;
 	struct d350_chan channels[] __counted_by(nchan);
@@ -207,14 +254,452 @@ static inline struct d350_chan *to_d350_chan(struct dma_chan *chan)
 	return container_of(chan, struct d350_chan, vc.chan);
 }
 
+static inline struct d350 *d350_chan_to_dmac(struct d350_chan *dch)
+{
+	return container_of(dch->vc.chan.device, struct d350, dma);
+}
+
 static inline struct d350_desc *to_d350_desc(struct virt_dma_desc *vd)
 {
 	return container_of(vd, struct d350_desc, vd);
 }
 
+static void d350_unmap_resource(struct device *dev, struct d350_desc *desc)
+{
+	if (!desc->resource_mapped)
+		return;
+
+	dma_unmap_resource(dev, desc->resource_dma, desc->resource_size,
+			   desc->resource_dir, 0);
+	desc->resource_mapped = false;
+}
+
+static void d350_free_cmds(struct d350 *dmac, struct d350_desc *desc)
+{
+	size_t i;
+
+	for (i = 0; i < desc->ncmds; i++) {
+		if (desc->cmds[i].words)
+			dma_pool_free(dmac->cmd_pool, desc->cmds[i].words,
+				      desc->cmds[i].dma);
+	}
+
+	kfree(desc->cmds);
+	kfree(desc->cmd_len);
+}
+
 static void d350_desc_free(struct virt_dma_desc *vd)
 {
-	kfree(to_d350_desc(vd));
+	struct d350_desc *desc = to_d350_desc(vd);
+	struct device *dev = vd->tx.chan->device->dev;
+	struct d350 *dmac = d350_chan_to_dmac(to_d350_chan(vd->tx.chan));
+
+	d350_unmap_resource(dev, desc);
+	d350_free_cmds(dmac, desc);
+	kfree(desc);
+}
+
+static int d350_alloc_cmds(struct dma_chan *dchan, struct d350_desc *desc,
+			   size_t ncmds)
+{
+	struct d350 *dmac = d350_chan_to_dmac(to_d350_chan(dchan));
+	size_t i;
+
+	desc->cmds = kcalloc(ncmds, sizeof(*desc->cmds), GFP_NOWAIT);
+	if (!desc->cmds)
+		return -ENOMEM;
+
+	desc->ncmds = ncmds;
+	for (i = 0; i < ncmds; i++) {
+		desc->cmds[i].words = dma_pool_alloc(dmac->cmd_pool, GFP_NOWAIT,
+						     &desc->cmds[i].dma);
+		if (!desc->cmds[i].words) {
+			d350_free_cmds(dmac, desc);
+			desc->cmds = NULL;
+			desc->ncmds = 0;
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * The command pool is coherent, but order the command writes before the
+ * descriptor can be submitted and started by another CPU.
+ */
+static void d350_sync_cmds(struct d350_desc *desc)
+{
+	if (!desc->cmds)
+		return;
+
+	dma_wmb();
+}
+
+static dma_addr_t d350_map_resource(struct dma_chan *dchan,
+				    struct d350_desc *desc,
+				    phys_addr_t cpu_addr, size_t size,
+				    enum dma_data_direction dir)
+{
+	struct device *dev = dchan->device->dev;
+	dma_addr_t dma_addr;
+
+	dma_addr = dma_map_resource(dev, cpu_addr, size, dir, 0);
+	if (dma_mapping_error(dev, dma_addr)) {
+		dev_err(dev, "map slave failed ch%u phys=%pa size=%zu dir=%d\n",
+			dchan->chan_id, &cpu_addr, size, dir);
+		return DMA_MAPPING_ERROR;
+	}
+
+	desc->resource_dma = dma_addr;
+	desc->resource_size = size;
+	desc->resource_dir = dir;
+	desc->resource_mapped = true;
+
+	return dma_addr;
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
+	memcpy(&dch->sconfig, config, sizeof(dch->sconfig));
+	spin_unlock_irqrestore(&dch->vc.lock, flags);
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
+	u16 xsize;
+	u16 xsizehi;
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
+	trigcfg = FIELD_PREP(CH_TRIGINCFG_BLKSIZE, maxburst - 1) |
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
+static void d350_store_slave_cmd(__le32 *dst, const u32 *src)
+{
+	int i;
+
+	for (i = 0; i < D350_SLAVE_CMD_WORDS; i++)
+		dst[i] = cpu_to_le32(src[i]);
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
+	dma_addr_t dev_dma_addr;
+	dma_addr_t mem;
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
+	desc = kzalloc_obj(*desc, GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	dev_dma_addr = d350_map_resource(dchan, desc, dev_cpu_addr, width,
+					 dev_dir);
+	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
+		goto err_free_desc;
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
+		u32 command[D350_SLAVE_CMD_WORDS];
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
+			cmd = command;
+			if (i < sg_len - 1) {
+				link = true;
+				link_addr = desc->cmds[i + 1].dma;
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
+		if (sg_len > 1) {
+			d350_store_slave_cmd(desc->cmds[i].words, cmd);
+			if (!i)
+				memcpy(desc->command, cmd, cmd_size);
+		}
+	}
+
+	d350_sync_cmds(desc);
+
+	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
+
+err_free_cmds:
+	d350_free_cmds(d350_chan_to_dmac(dch), desc);
+err_free_desc:
+	d350_unmap_resource(dchan->device->dev, desc);
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
+	size_t period;
+	size_t cmd_size;
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
+	desc = kzalloc_obj(*desc, GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	dev_dma_addr = d350_map_resource(dchan, desc, dev_cpu_addr, width,
+					 dev_dir);
+	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
+		goto err_free_desc;
+
+	if (!IS_ALIGNED(buf_addr | dev_dma_addr | period_len, width))
+		goto err_free_desc;
+
+	desc->bytes = buf_len;
+	desc->period_len = period_len;
+	desc->periods = buf_len / period_len;
+	desc->cyclic = true;
+
+	if (d350_alloc_cmds(dchan, desc, desc->periods))
+		goto err_free_desc;
+
+	cmd_size = D350_SLAVE_CMD_WORDS * sizeof(u32);
+
+	for (period = 0; period < desc->periods; period++) {
+		u32 command[D350_SLAVE_CMD_WORDS];
+		dma_addr_t mem = buf_addr + period * period_len;
+		dma_addr_t next = desc->cmds[(period + 1) % desc->periods].dma;
+
+		d350_fill_slave_cmd(dch, desc, command, mem, dev_dma_addr,
+				    period_len, true, next, direction, width,
+				    maxburst, CH_CTRL_DONETYPE_CMD);
+		d350_store_slave_cmd(desc->cmds[period].words, command);
+		if (!period)
+			memcpy(desc->command, command, cmd_size);
+	}
+
+	d350_sync_cmds(desc);
+
+	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
+
+err_free_desc:
+	d350_unmap_resource(dchan->device->dev, desc);
+	kfree(desc);
+
+	return NULL;
 }
 
 static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
@@ -228,6 +713,7 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | src | (1 << dch->tsz));
 	desc->xsize = lower_16_bits(len >> desc->tsz);
 	desc->xsizehi = upper_16_bits(len >> desc->tsz);
@@ -266,6 +752,7 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | (1 << dch->tsz));
 	desc->xsize = lower_16_bits(len >> desc->tsz);
 	desc->xsizehi = upper_16_bits(len >> desc->tsz);
@@ -339,6 +826,69 @@ static u32 d350_get_residue(struct d350_chan *dch)
 	return res << dch->desc->tsz;
 }
 
+static u32 d350_get_sg_residue(struct d350_chan *dch)
+{
+	struct d350_desc *desc = dch->desc;
+	size_t cmd = 0;
+	size_t i;
+	u32 linkaddr;
+	u32 linkaddrhi;
+	u32 hi_new;
+	u32 lo_new;
+	u32 residue;
+	u64 next_cmd;
+	int retries = 3;
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
+			if (next_cmd == desc->cmds[i].dma) {
+				cmd = i - 1;
+				break;
+			}
+		}
+		if (i == desc->ncmds)
+			return dch->residue;
+	}
+
+	residue = d350_get_residue(dch);
+
+	/*
+	 * If the channel stepped to the next command while CH_XSIZE was read,
+	 * the size belongs to the command which just finished and the sum below
+	 * would count the bytes left in it twice. Keep the residue from the last
+	 * completion in that case.
+	 */
+	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+	lo_new = readl_relaxed(dch->base + CH_LINKADDR);
+	if (hi_new != linkaddrhi || lo_new != linkaddr)
+		return dch->residue;
+
+	for (i = cmd + 1; i < desc->ncmds; i++)
+		residue += desc->cmd_len[i];
+
+	return residue;
+}
+
 static int d350_terminate_all(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
@@ -347,6 +897,7 @@ static int d350_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&dch->vc.lock, flags);
 	writel_relaxed(CH_CMD_STOP, dch->base + CH_CMD);
+	dch->stopping = true;
 	if (dch->desc) {
 		if (dch->status != DMA_ERROR)
 			vchan_terminate_vdesc(&dch->desc->vd);
@@ -360,16 +911,105 @@ static int d350_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static int d350_wait_for_stop(struct d350_chan *dch)
+{
+	u32 cmd;
+	int ret;
+
+	if (!READ_ONCE(dch->stopping))
+		return 0;
+
+	/* STOPCMD clears only after the channel has stopped using commands. */
+	ret = readl_poll_timeout(dch->base + CH_CMD, cmd,
+				 !(cmd & CH_CMD_STOP), 10,
+				 D350_STOP_TIMEOUT_US);
+	if (ret)
+		dev_warn(dch->vc.chan.device->dev,
+			 "channel %d failed to stop\n", dch->vc.chan.chan_id);
+	else
+		WRITE_ONCE(dch->stopping, false);
+
+	return ret;
+}
+
 static void d350_synchronize(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
 
+	/* A stop timeout must not skip callback synchronization. */
+	d350_wait_for_stop(dch);
 	vchan_synchronize(&dch->vc);
 }
 
 static u32 d350_desc_bytes(struct d350_desc *desc)
 {
-	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
+	return desc->bytes;
+}
+
+static u32 d350_get_cyclic_residue(struct d350_chan *dch)
+{
+	struct d350_desc *desc = dch->desc;
+	u32 period_residue = desc->bytes - desc->period * desc->period_len;
+	u32 linkaddr;
+	u32 linkaddrhi;
+	u32 hi_new;
+	u32 lo_new;
+	u64 next_cmd;
+	int retries = 3;
+
+	/*
+	 * desc->period counts the completed periods, so period_residue is the
+	 * residue at the last period boundary. Subtract the progress made in
+	 * the running period, read from CH_XSIZE: CH_LINKADDR points at the
+	 * command after the one executing, so while the channel is still on the
+	 * command of the running period it names the first command of the next
+	 * period.
+	 */
+	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+	do {
+		linkaddrhi = hi_new;
+		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
+		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+	} while (linkaddrhi != hi_new && --retries);
+
+	next_cmd = (linkaddr & ~CH_LINKADDR_EN) | ((u64)linkaddrhi << 32);
+	if (next_cmd != desc->cmds[(desc->period + 1) % desc->periods].dma)
+		return dch->residue;
+
+	period_residue -= desc->period_len - d350_get_residue(dch);
+
+	/*
+	 * If the channel stepped to the next period while CH_XSIZE was read,
+	 * the size belongs to a command of the next period and mixing it with
+	 * the current one would overstate the residue: keep the last reported
+	 * value instead.
+	 */
+	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+	lo_new = readl_relaxed(dch->base + CH_LINKADDR);
+	if (hi_new != linkaddrhi || lo_new != linkaddr)
+		return dch->residue;
+
+	return period_residue;
+}
+
+static u32 d350_get_active_residue(struct d350_chan *dch)
+{
+	if (dch->desc->cyclic)
+		return d350_get_cyclic_residue(dch);
+
+	return d350_get_sg_residue(dch);
+}
+
+static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
+						   dma_cookie_t cookie)
+{
+	struct virt_dma_desc *vd;
+
+	list_for_each_entry(vd, &dch->vc.desc_submitted, node)
+		if (vd->tx.cookie == cookie)
+			return vd;
+
+	return vchan_find_desc(&dch->vc, cookie);
 }
 
 static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
@@ -387,13 +1027,16 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	if (cookie == dch->cookie) {
 		status = dch->status;
 		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
-			dch->residue = d350_get_residue(dch);
+			dch->residue = d350_get_active_residue(dch);
 		residue = dch->residue;
-	} else if ((vd = vchan_find_desc(&dch->vc, cookie))) {
-		residue = d350_desc_bytes(to_d350_desc(vd));
-	} else if (status == DMA_IN_PROGRESS) {
-		/* Somebody else terminated it? */
-		status = DMA_ERROR;
+	} else {
+		vd = d350_find_queued_desc(dch, cookie);
+		if (vd) {
+			residue = d350_desc_bytes(to_d350_desc(vd));
+		} else if (status == DMA_IN_PROGRESS) {
+			/* Somebody else terminated it? */
+			status = DMA_ERROR;
+		}
 	}
 	spin_unlock_irqrestore(&dch->vc.lock, flags);
 
@@ -469,17 +1112,32 @@ static void d350_issue_pending(struct dma_chan *chan)
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
+
+	writel_relaxed(ch_status, dch->base + CH_STATUS);
+
+	spin_lock(&dch->vc.lock);
+	desc = dch->desc;
+	if (!desc) {
+		spin_unlock(&dch->vc.lock);
+		return IRQ_HANDLED;
+	}
 
+	vd = &desc->vd;
+	if (irq_status & CH_STAT_INTR_ERR) {
 		if (errinfo & (CH_ERRINFO_AXIRDPOISERR | CH_ERRINFO_AXIRDRESPERR))
 			vd->tx_result.result = DMA_TRANS_READ_FAILED;
 		else if (errinfo & CH_ERRINFO_AXIWRRESPERR)
@@ -487,21 +1145,27 @@ static irqreturn_t d350_irq(int irq, void *data)
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
+			dch->residue = d350_get_cyclic_residue(dch);
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
 
@@ -524,7 +1188,11 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 	struct d350_chan *dch = to_d350_chan(chan);
 
 	writel_relaxed(0, dch->base + CH_INTREN);
+	d350_terminate_all(chan);
+	d350_wait_for_stop(dch);
+
 	free_irq(dch->irq, dch);
+	vchan_synchronize(&dch->vc);
 	vchan_free_chan_resources(&dch->vc);
 }
 
@@ -553,7 +1221,9 @@ static int d350_probe(struct platform_device *pdev)
 	dw = 1 << FIELD_GET(DMA_CFG_DATA_WIDTH, reg);
 	aw = FIELD_GET(DMA_CFG_ADDR_WIDTH, reg) + 1;
 
-	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
 	coherent = device_get_dma_attr(dev) == DEV_DMA_COHERENT;
 
 	dmac = devm_kzalloc(dev, struct_size(dmac, channels, nchan), GFP_KERNEL);
@@ -561,6 +1231,11 @@ static int d350_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dmac->nchan = nchan;
+	dmac->cmd_pool = dmam_pool_create("dma350-cmd", dev,
+					  D350_SLAVE_CMD_WORDS * sizeof(u32),
+					  sizeof(u64), 0);
+	if (!dmac->cmd_pool)
+		return -ENOMEM;
 
 	reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
 	dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
@@ -568,23 +1243,32 @@ static int d350_probe(struct platform_device *pdev)
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
@@ -623,6 +1307,7 @@ static int d350_probe(struct platform_device *pdev)
 		reg |= FIELD_PREP(CH_LINK_MEMATTR, coherent ? MEMATTR_WB : MEMATTR_NC);
 		writel_relaxed(reg, dch->base + CH_LINKATTR);
 
+		dch->coherent = coherent;
 		dch->vc.desc_free = d350_desc_free;
 		vchan_init(&dch->vc, &dmac->dma);
 	}
@@ -638,6 +1323,16 @@ static int d350_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
+	if (dev->of_node) {
+		ret = of_dma_controller_register(dev->of_node, d350_of_xlate,
+						 dmac);
+		if (ret) {
+			dma_async_device_unregister(&dmac->dma);
+			return dev_err_probe(dev, ret,
+					     "Failed to register OF DMA controller\n");
+		}
+	}
+
 	return 0;
 }
 
@@ -645,6 +1340,8 @@ static void d350_remove(struct platform_device *pdev)
 {
 	struct d350 *dmac = platform_get_drvdata(pdev);
 
+	if (pdev->dev.of_node)
+		of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&dmac->dma);
 }
 
-- 
2.54.0

