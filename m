Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908627;
	b=rk/L59thOQGZWIwOyzo87NUl2Uwt7TDt8NBUhFw4lWUFExvz42aFO7jAKZHd+AyD22Yh
	 IMMNWGSHRI7oq9QfUXhBH9d8QEiMPfwyuZ6rx8QoLHv0Wr6Bx/H2kexbStXllCVQB5Y22
	 tAXyCBmq+J/ZuOy6Lg7Feig6B4i0omL1QuIxFuG4LyPFWJC0SKnz18OODor1S/7TATKaM
	 DeO3eIBgdGCLvXlgmPnftzmcTMxSmBcmBl1kVcD3liG93gZoI/IoekwHPQCsaVdkUhLur
	 WO2+aDDOTmYmN91C85VU+Vu2DXZV3BT0j/VZDs/1uOvT+YlrzubBbxjX54yytyhO+CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908627;
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
	bh=HR6Jfnw7Qjxd0EdlvePeumc4pAv3Bm7yZtjBX/0izhA=;
	b=ICyUS1md1MSpODiYgJK5x2yB5Az26y+cw2s67PNUbt3c24e7KKHvHjbGEGyMKTCnALb6
	 x3iAe3+S5ZfmDQhh1JfNi811CKRFk9xQKLlmeze100BtZ5y1syoz8Q28qc9qf36vbf214
	 9vYPs61MxBKWb0TYGWipFZUvoQs6qILlhsaRiMwEij2npxMna2Q67B6mBpaOzd3z2DlEG
	 vM5LaKDUkEJF/sIjrgyVj8KBdv0n9uMvPrHer8ykUVQwHLek17fwj3ylP35eFXPMBPp5Z
	 CYiqgUVL6yGBdl3+MTj3JN4JX/oJ904Dw2U4ydIeKkzOtVaCwu/17LbI6QCLYGCsOIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.100
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E2606A890;
	Tue, 17 Nov 2026 09:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598E2606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPU+8/uAsGIr54lQ0uadOSYntnHAo6QzQ1WEvM2wS63AA7NZCNysCbWnSNDDrSnEzTzu6wiXgwt7TLthXWluSxDjz40PRsFEfoqOwsQvr0gV4mzazpySDEWCuJ+qCcljrxTBbQL8T1fHFndMEYe06+ErJFn7TJMljHmbd6IjIscP3T3wtGwc9hzJbpx/CIAnNnHM6H405Ab4HWJQijNDQn9htgujjrCaMx9KIWofD898NQCjGnqx5St7qWPPN2bIFpurC9MiKibjo6+w+CYuHkKsxqtCD3eUMvTkn3BMmQzH/sqW3OLBlcUVmpcHwQsoJfgN9mlwzlFexTOLeDZ1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR6Jfnw7Qjxd0EdlvePeumc4pAv3Bm7yZtjBX/0izhA=;
 b=u1FW9lTg9AnM4/9BgB3jcZwlXQGdypy2qm2PqFbVGFs5sp9tHd+2gfyTC994X1UWGim0s63kvmWur2lQ0C1EiFByaTYiWF+iGSXal4o+uW8htpoyy5cbot645o1BGly8MayP0OktIZZb9zLvR/RzmkVEyecv8jFxbXHPEFak0aiEmDdyl4E0f8zWFmgUVE7jXMflol5RuztLQeLE946AsuW18fffqBwdQ6UIgaig0EV4Gjwra8F7s01H98tfcBOTpKcOghMJXcY3q8ri0Da+VzZWa7PG+AVUe+NjGv02V4Br2vCCX6GTqMiAHhGFv9MQBIHCKeaT6wbhQ+kzmZ4sRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0125.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::8) by SEYPR06MB5351.apcprd06.prod.outlook.com
 (2603:1096:101:69::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Tue, 17 Nov
 2026 09:43:42 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:990:54:cafe::53) by JH0PR01CA0125.outlook.office365.com
 (2603:1096:990:54::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 09:43:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:40 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C642240920F2;
	Tue, 17 Nov 2026 17:43:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 08/10] dmaengine: arm-dma350: Add slave and cyclic transfer support
Date: Tue, 17 Nov 2026 17:43:33 +0800
Message-ID: <20261117094335.1393735-9-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|SEYPR06MB5351:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3ceb51d0-4d2f-49c2-e9b7-08df448f436e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|7416014|376014|6133799003|18002099003|22082099003|261009223027099003|3023799007|10067099003|261028144727099003|261026135527099003|261102123227099003|261026140227099003|261022105027099003|261021121427099003|261026130827099003|261021130227099003|261022113327099003|261021135927099003|261026121527099003|261021133027099003|261022115727099003|261022075727099003|261021123027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QiRw4y8NPgHDMtvYBtD9JjQB/rvwDYXM2rtufsfAvXOQqEyrYHjmGbz2Vs1BXqCEt8WDnHcxLy20AB5jQciXUzeE23kEExxQjbMbYMxPh4cXyBOl8LDb83yJsE1KnE1l8NjwIJzSXY3Ky4uR3I29+qr6S8i5UmJv16xFVUup6iYWT9Ve2uqji4EeDnEsEPnujdfyFgIK2SjfegVzJ2KwqIHRQ712GRzreL6adchgc/vghWefOZL8VxYN2BxmkaxYnD8UmqZZr+iZkj3Yv8fPh+MBRnZjT4IeIWvzNOJIWJkDnFjsj0DY6Gb1HsafSOcee7YOx4HtloZr6NccZILIZJmhS2q6TgkHTglvxKJf46HOxnFT+7au2SwB+2llH2nHM9AqoA7K6bAcsFthssKEIl+Z74ptQx/GsVfzesiV9RxEFdrdHB4BF/j1R8+NZNHzOWKVbwjO2/LbEJ+ZwNVyYz6ARktKjokZCVa8uNz04eQx6REFN+KIh8X3kl+r0JEjGZ3BomhhQmw3w42du/bfxpDfRtX0TgRTIg9EJdob2UyThn+3Ev1BO7yEequpHWZVAaj/Tll2frdNnS0jzMLqHZQvefKmauvYfClvrp2f6ASMeRCIZX0aYtMJPQ+vzfb7T34fGwPUOt9Sa6ijf236fdwQ6ZH8RC1R/liUL/J/ejgEZO7uu0sTPZIeYtZ8uNg+mT6UXSKN+73XlyAU5cB9Wg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(10067099003)(261028144727099003)(261026135527099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026130827099003)(261021130227099003)(261022113327099003)(261021135927099003)(261026121527099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021123027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hQWNPnUDdvcwNo9yRWYkdIIfRo71nPdqkPD+c7tbzgL3EhzxrHY7VVf673waFHeCVkpB+MqB7VrmPZOABJCfUpgJ/hUkirqYr8YihAeUXCEHR3Snt0oftW12tME8qAiaVHKXuRIL/1FUbGDSBnzCp/7il6DxNF/HHztQFoJ4Ks8ufde1A1H3gEwbT33tw373J2AYlBDP6W3pLJ8QUicMIahTbbGw+ZsPTRffE7A0qanCSUPqCAQ/bZ57Yno4h5tmCB3lI+DHuPM26A1Tip4JgJGNhBDvhUBjrdR+gLon4zHkViq2zu+sseTgXc5tEsj3HD6m/nsXsM4CXvQz6EUjJ3EyYEq6gNB97cG4Cp7b+PgNXCCeF+KEHaOA9KHvia5BK2WhMePUJc4dXG5lemCxm7tIl9gyQL/WJ12jU627TeUv4sN8jiO0ChYFG1vB0XLY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:40.8395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ceb51d0-4d2f-49c2-e9b7-08df448f436e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5351

Add peripheral scatter-gather and cyclic transfers with descriptor-owned
resource mappings, coherent linked commands and hardware-based residue.
Snapshot channel configuration under the lock, validate per-channel
capabilities, and reject slave preparation without a valid request line.

Describe peripheral hardware commands with named little-endian fields
and fill them directly in the coherent pool. Decode only when loading
the first peripheral command into MMIO or reading saved command sizes.
Keep CPU-endian memcpy/memset commands unchanged. Single-entry slave SG
uses embedded command storage without an extra pool allocation.

Derive SG lengths from the command sizes rather than a separate array.
Rely on the final non-relaxed channel-enable writel for publication
ordering rather than a prep-time DMA write barrier.

Use scoped locking and consistent device_config/device_caps names. Use
managed OF DMA controller registration and clear request/configuration
when channel resources are freed, retaining them across termination.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 765 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 736 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 465a8b9b722a..7b46b4fdcf9c 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -3,14 +3,23 @@
 // Arm DMA-350 driver
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/byteorder/generic.h>
 #include <linux/cleanup.h>
-#include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/dmapool.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <linux/of.h>
+#include <linux/limits.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 #include "dmaengine.h"
 #include "virt-dma.h"
@@ -106,6 +115,10 @@
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
@@ -163,6 +176,18 @@ enum ch_ctrl_xtype {
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
@@ -175,11 +200,44 @@ enum ch_cfg_memattr {
 	MEMATTR_WB = 0xff
 };
 
+/* Register-update words in the order selected by the slave header. */
+struct d350_slave_cmd {
+	__le32 header;
+	__le32 ctrl;
+	__le64 src_addr;
+	__le64 dst_addr;
+	__le32 xsize;
+	__le32 xsizehi;
+	__le32 src_transcfg;
+	__le32 dst_transcfg;
+	__le32 xaddrinc;
+	__le32 trigincfg;
+	__le64 link_addr;
+} __packed;
+
+struct d350_hw_cmd {
+	struct d350_slave_cmd *cmd;
+	dma_addr_t dma;
+};
+
 struct d350_desc {
 	struct virt_dma_desc vd;
-	u32 command[16];
+	union {
+		u32 command[16];
+		struct d350_slave_cmd slave;
+	};
+	enum dma_transfer_direction direction;
+	dma_addr_t resource_dma;
+	size_t resource_size;
+	enum dma_data_direction resource_dir;
+	bool resource_mapped;
+	struct d350_hw_cmd *cmds;
+	size_t ncmds;
 	size_t bytes;
+	size_t period_len;
+	size_t periods;
 	u8 tsz;
+	bool cyclic;
 };
 
 struct d350_chan {
@@ -190,14 +248,17 @@ struct d350_chan {
 	enum dma_status status;
 	dma_cookie_t cookie;
 	u32 residue;
+	u32 req;
 	u8 tsz;
 	bool has_trig;
 	bool has_wrap;
 	bool coherent;
+	struct dma_slave_config sconfig;
 };
 
 struct d350 {
 	struct dma_device dma;
+	struct dma_pool *cmd_pool;
 	int nchan;
 	int nreq;
 	struct d350_chan channels[] __counted_by(nchan);
@@ -208,14 +269,447 @@ static inline struct d350_chan *to_d350_chan(struct dma_chan *chan)
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
+		if (desc->cmds[i].cmd)
+			dma_pool_free(dmac->cmd_pool, desc->cmds[i].cmd,
+				      desc->cmds[i].dma);
+	}
+
+	kfree(desc->cmds);
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
+		desc->cmds[i].cmd = dma_pool_alloc(dmac->cmd_pool, GFP_NOWAIT,
+						   &desc->cmds[i].dma);
+		if (!desc->cmds[i].cmd) {
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
+static bool d350_slave_supported(struct d350_chan *dch)
+{
+	return dch->has_trig && d350_chan_to_dmac(dch)->nreq > 0;
+}
+
+static u32 d350_chan_widths(struct d350_chan *dch)
+{
+	struct dma_device *dma = dch->vc.chan.device;
+	u32 widths = dma->src_addr_widths | dma->dst_addr_widths;
+
+	return widths & GENMASK(min_t(unsigned int, BIT(dch->tsz),
+				     BITS_PER_TYPE(widths) - 1), 1);
+}
+
+static void d350_device_caps(struct dma_chan *chan, struct dma_slave_caps *caps)
+{
+	struct d350_chan *dch = to_d350_chan(chan);
+	u32 widths = d350_chan_widths(dch);
+
+	caps->src_addr_widths &= widths;
+	caps->dst_addr_widths &= widths;
+	if (!d350_slave_supported(dch))
+		caps->directions &= ~(BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM));
+}
+
+static int d350_check_slave_config(struct d350_chan *dch,
+				   struct dma_slave_config *config)
+{
+	u32 maxburst = FIELD_MAX(CH_CFG_MAXBURSTLEN) + 1;
+	u32 widths = d350_chan_widths(dch);
+
+	if (!d350_slave_supported(dch))
+		return -EOPNOTSUPP;
+
+	/* The unused direction may leave its bus width unspecified. */
+	if ((config->src_addr_width != DMA_SLAVE_BUSWIDTH_UNDEFINED &&
+	     !d350_buswidth_supported(widths, config->src_addr_width)) ||
+	    (config->dst_addr_width != DMA_SLAVE_BUSWIDTH_UNDEFINED &&
+	     !d350_buswidth_supported(widths, config->dst_addr_width)))
+		return -EINVAL;
+
+	if (config->src_maxburst > maxburst ||
+	    config->dst_maxburst > maxburst)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int d350_device_config(struct dma_chan *chan,
+			      struct dma_slave_config *config)
+{
+	struct d350_chan *dch = to_d350_chan(chan);
+	struct dma_device *dma = chan->device;
+	int ret;
+
+	ret = d350_check_slave_config(dch, config);
+	if (ret) {
+		dev_err(dma->dev, "invalid slave configuration\n");
+		return ret;
+	}
+
+	guard(spinlock_irqsave)(&dch->vc.lock);
+
+	dch->sconfig = *config;
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
+	struct dma_slave_config config;
+	int ret;
+
+	scoped_guard(spinlock_irqsave, &dch->vc.lock)
+		config = dch->sconfig;
+
+	ret = d350_check_slave_config(dch, &config);
+	if (ret)
+		return ret;
+	if (dch->req >= d350_chan_to_dmac(dch)->nreq)
+		return -EINVAL;
+
+	if (direction == DMA_MEM_TO_DEV) {
+		*dev_cpu_addr = config.dst_addr;
+		*dev_dir = DMA_FROM_DEVICE;
+		*width = config.dst_addr_width;
+		*maxburst = config.dst_maxburst;
+	} else if (direction == DMA_DEV_TO_MEM) {
+		*dev_cpu_addr = config.src_addr;
+		*dev_dir = DMA_TO_DEVICE;
+		*width = config.src_addr_width;
+		*maxburst = config.src_maxburst;
+	} else {
+		return -EINVAL;
+	}
+
+	return *width && *maxburst ? 0 : -EINVAL;
+}
+
+static void d350_fill_slave_cmd(struct d350_chan *dch, struct d350_desc *desc,
+				struct d350_slave_cmd *cmd,
+				dma_addr_t mem, dma_addr_t dev_dma_addr,
+				size_t len, bool link, dma_addr_t link_addr,
+				enum dma_transfer_direction direction,
+				enum dma_slave_buswidth width, u32 maxburst,
+				enum ch_ctrl_donetype donetype)
+{
+	bool mem_to_dev = direction == DMA_MEM_TO_DEV;
+	dma_addr_t src_addr = mem_to_dev ? mem : dev_dma_addr;
+	dma_addr_t dst_addr = mem_to_dev ? dev_dma_addr : mem;
+	u16 xsize;
+	u16 xsizehi;
+	u32 devcfg;
+	u32 memcfg;
+	u32 trigcfg;
+	u32 header;
+	u32 ctrl;
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
+	header = LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
+		 LINK_DESADDRHI | LINK_XSIZE | LINK_XSIZEHI | LINK_SRCTRANSCFG |
+		 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR |
+		 LINK_LINKADDRHI |
+		 (mem_to_dev ? LINK_DESTRIGINCFG : LINK_SRCTRIGINCFG);
+	ctrl = (mem_to_dev ? CH_CTRL_USEDESTRIGIN : CH_CTRL_USESRCTRIGIN) |
+	       FIELD_PREP(CH_CTRL_TRANSIZE, desc->tsz) |
+	       FIELD_PREP(CH_CTRL_XTYPE, CH_CTRL_XTYPE_CONTINUE) |
+	       FIELD_PREP(CH_CTRL_DONETYPE, donetype);
+
+	cmd->header = cpu_to_le32(header);
+	cmd->ctrl = cpu_to_le32(ctrl);
+	cmd->src_addr = cpu_to_le64(src_addr);
+	cmd->dst_addr = cpu_to_le64(dst_addr);
+	cmd->xsize = cpu_to_le32(FIELD_PREP(CH_XY_SRC, xsize) |
+			       FIELD_PREP(CH_XY_DES, xsize));
+	cmd->xsizehi = cpu_to_le32(FIELD_PREP(CH_XY_SRC, xsizehi) |
+				 FIELD_PREP(CH_XY_DES, xsizehi));
+	cmd->src_transcfg = cpu_to_le32(mem_to_dev ? memcfg : devcfg);
+	cmd->dst_transcfg = cpu_to_le32(mem_to_dev ? devcfg : memcfg);
+	cmd->xaddrinc = cpu_to_le32(mem_to_dev ?
+		FIELD_PREP(CH_XY_SRC, 1) : FIELD_PREP(CH_XY_DES, 1));
+	cmd->trigincfg = cpu_to_le32(trigcfg);
+	cmd->link_addr = cpu_to_le64(link_addr | (link ? CH_LINKADDR_EN : 0));
+}
+
+static struct dma_async_tx_descriptor *
+d350_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
+		   unsigned int sg_len,
+		   enum dma_transfer_direction direction,
+		   unsigned long flags, void *context)
+{
+	struct d350_chan *dch = to_d350_chan(dchan);
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
+	desc->direction = direction;
+	dev_dma_addr = d350_map_resource(dchan, desc, dev_cpu_addr, width,
+					 dev_dir);
+	if (dma_mapping_error(dchan->device->dev, dev_dma_addr))
+		goto err_free_desc;
+
+	if (sg_len > 1 && d350_alloc_cmds(dchan, desc, sg_len))
+		goto err_free_desc;
+
+	for_each_sg(sgl, sg, sg_len, i) {
+		enum ch_ctrl_donetype donetype = CH_CTRL_DONETYPE_CMD;
+		dma_addr_t link_addr = 0;
+		bool link = false;
+		struct d350_slave_cmd *cmd = &desc->slave;
+
+		mem = sg_dma_address(sg);
+		len = sg_dma_len(sg);
+		if (!len || (len >> __ffs(width)) > U32_MAX ||
+		    !IS_ALIGNED(len | mem | dev_dma_addr, width))
+			goto err_free_cmds;
+
+		if (sg_len > 1) {
+			cmd = desc->cmds[i].cmd;
+			if (i < sg_len - 1) {
+				link = true;
+				link_addr = desc->cmds[i + 1].dma;
+				donetype = CH_CTRL_DONETYPE_NONE;
+			}
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
+	desc->direction = direction;
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
+	for (period = 0; period < desc->periods; period++) {
+		dma_addr_t mem = buf_addr + period * period_len;
+		dma_addr_t next = desc->cmds[(period + 1) % desc->periods].dma;
+
+		d350_fill_slave_cmd(dch, desc, desc->cmds[period].cmd, mem,
+				    dev_dma_addr, period_len, true, next,
+				    direction, width, maxburst, CH_CTRL_DONETYPE_CMD);
+	}
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
@@ -344,6 +838,75 @@ static u32 d350_get_residue(struct d350_chan *dch)
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
+	if (!desc->cmds)
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
+	for (i = cmd + 1; i < desc->ncmds; i++) {
+		const struct d350_slave_cmd *cmd = desc->cmds[i].cmd;
+		u32 count;
+
+		count = FIELD_GET(CH_XY_DES, le32_to_cpu(cmd->xsize));
+		count |= FIELD_GET(CH_XY_DES, le32_to_cpu(cmd->xsizehi)) << 16;
+		residue += (u64)count << desc->tsz;
+	}
+
+	return residue;
+}
+
 static int d350_terminate_all(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
@@ -395,6 +958,74 @@ static u32 d350_desc_bytes(struct d350_desc *desc)
 	return desc->bytes;
 }
 
+static u32 d350_get_cyclic_residue(struct d350_chan *dch)
+{
+	struct d350_desc *desc = dch->desc;
+	size_t period;
+	size_t next;
+	u32 linkaddr;
+	u32 linkaddrhi;
+	u32 xsize;
+	u32 xsizehi;
+	u32 hi_new;
+	u32 lo_new;
+	u64 next_cmd;
+	u64 remaining;
+	int retries = 3;
+
+	/*
+	 * Locate the current period from the next command's address rather than
+	 * counting interrupts, since multiple period completions may share a
+	 * pending DONE interrupt.
+	 */
+	do {
+		linkaddrhi = readl_relaxed(dch->base + CH_LINKADDRHI);
+		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
+		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+		if (linkaddrhi != hi_new)
+			continue;
+
+		xsizehi = readl_relaxed(dch->base + CH_XSIZEHI);
+		xsize = readl_relaxed(dch->base + CH_XSIZE);
+		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
+		if (xsizehi != hi_new)
+			continue;
+
+		/* Retry if the link changed while reading the remaining size. */
+		lo_new = readl_relaxed(dch->base + CH_LINKADDR);
+		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
+		if (linkaddrhi != hi_new || linkaddr != lo_new)
+			continue;
+
+		next_cmd = (linkaddr & ~CH_LINKADDR_EN) |
+			   ((u64)linkaddrhi << 32);
+		for (next = 0; next < desc->periods; next++)
+			if (next_cmd == desc->cmds[next].dma)
+				break;
+		if (next == desc->periods)
+			continue;
+
+		remaining = FIELD_GET(CH_XY_DES, xsize) |
+			    ((u64)FIELD_GET(CH_XY_DES, xsizehi) << 16);
+		remaining <<= desc->tsz;
+		if (remaining > desc->period_len)
+			continue;
+
+		period = next ? next - 1 : desc->periods - 1;
+		return desc->bytes - (period + 1) * desc->period_len + remaining;
+	} while (--retries);
+
+	return dch->residue;
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
 static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
 						   dma_cookie_t cookie)
 {
@@ -421,7 +1052,7 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 		if (cookie == dch->cookie) {
 			status = dch->status;
 			if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
-				dch->residue = d350_get_residue(dch);
+				dch->residue = d350_get_active_residue(dch);
 			residue = dch->residue;
 		} else {
 			vd = d350_find_queued_desc(dch, cookie);
@@ -438,22 +1069,10 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	return status;
 }
 
-static void d350_start_next(struct d350_chan *dch)
+static void d350_load_mem_cmd(struct d350_chan *dch)
 {
-	u32 hdr, *reg;
-
-	/* Preserve the failed cookie's status until the channel is terminated. */
-	if (dch->status == DMA_ERROR)
-		return;
-
-	dch->desc = to_d350_desc(vchan_next_desc(&dch->vc));
-	if (!dch->desc)
-		return;
-
-	list_del(&dch->desc->vd.node);
-	dch->status = DMA_IN_PROGRESS;
-	dch->cookie = dch->desc->vd.tx.cookie;
-	dch->residue = d350_desc_bytes(dch->desc);
+	u32 *reg;
+	u32 hdr;
 
 	hdr = dch->desc->command[0];
 	reg = &dch->desc->command[1];
@@ -492,6 +1111,55 @@ static void d350_start_next(struct d350_chan *dch)
 		writel_relaxed(*reg++, dch->base + CH_LINKADDR);
 	if (hdr & LINK_LINKADDRHI)
 		writel_relaxed(*reg++, dch->base + CH_LINKADDRHI);
+}
+
+static void d350_write_addr(struct d350_chan *dch, u32 reg, u64 addr)
+{
+	writel_relaxed(lower_32_bits(addr), dch->base + reg);
+	writel_relaxed(upper_32_bits(addr), dch->base + reg + sizeof(u32));
+}
+
+static void d350_load_slave_cmd(struct d350_chan *dch)
+{
+	struct d350_desc *desc = dch->desc;
+	const struct d350_slave_cmd *cmd;
+	u32 trig_reg;
+
+	cmd = desc->cmds ? desc->cmds[0].cmd : &desc->slave;
+	trig_reg = desc->direction == DMA_MEM_TO_DEV ?
+		   CH_DESTRIGINCFG : CH_SRCTRIGINCFG;
+
+	writel_relaxed(le32_to_cpu(cmd->ctrl), dch->base + CH_CTRL);
+	d350_write_addr(dch, CH_SRCADDR, le64_to_cpu(cmd->src_addr));
+	d350_write_addr(dch, CH_DESADDR, le64_to_cpu(cmd->dst_addr));
+	writel_relaxed(le32_to_cpu(cmd->xsize), dch->base + CH_XSIZE);
+	writel_relaxed(le32_to_cpu(cmd->xsizehi), dch->base + CH_XSIZEHI);
+	writel_relaxed(le32_to_cpu(cmd->src_transcfg), dch->base + CH_SRCTRANSCFG);
+	writel_relaxed(le32_to_cpu(cmd->dst_transcfg), dch->base + CH_DESTRANSCFG);
+	writel_relaxed(le32_to_cpu(cmd->xaddrinc), dch->base + CH_XADDRINC);
+	writel_relaxed(le32_to_cpu(cmd->trigincfg), dch->base + trig_reg);
+	d350_write_addr(dch, CH_LINKADDR, le64_to_cpu(cmd->link_addr));
+}
+
+static void d350_start_next(struct d350_chan *dch)
+{
+	/* Preserve the failed cookie's status until the channel is terminated. */
+	if (dch->status == DMA_ERROR)
+		return;
+
+	dch->desc = to_d350_desc(vchan_next_desc(&dch->vc));
+	if (!dch->desc)
+		return;
+
+	list_del(&dch->desc->vd.node);
+	dch->status = DMA_IN_PROGRESS;
+	dch->cookie = dch->desc->vd.tx.cookie;
+	dch->residue = d350_desc_bytes(dch->desc);
+
+	if (is_slave_direction(dch->desc->direction))
+		d350_load_slave_cmd(dch);
+	else
+		d350_load_mem_cmd(dch);
 
 	writel(CH_CMD_ENABLE, dch->base + CH_CMD);
 }
@@ -511,7 +1179,7 @@ static irqreturn_t d350_irq(int irq, void *data)
 	struct d350_chan *dch = data;
 	struct virt_dma_desc *vd;
 	struct d350_desc *desc;
-	u32 residue;
+	u32 residue = 0;
 	u32 ch_status;
 	u32 irq_status;
 	u32 errinfo = 0;
@@ -544,18 +1212,26 @@ static irqreturn_t d350_irq(int irq, void *data)
 		else
 			vd->tx_result.result = DMA_TRANS_ABORTED;
 
-		residue = d350_get_residue(dch);
+		residue = d350_get_active_residue(dch);
 		vd->tx_result.residue = residue;
 		dch->status = DMA_ERROR;
 		dch->residue = residue;
 		dch->desc = NULL;
-		vchan_cookie_complete(vd);
+		if (desc->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			vchan_cookie_complete(vd);
 	} else {
-		dch->status = DMA_COMPLETE;
-		dch->residue = 0;
-		dch->desc = NULL;
-		vchan_cookie_complete(vd);
-		d350_start_next(dch);
+		if (desc->cyclic) {
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
 
 	return IRQ_HANDLED;
@@ -584,6 +1260,11 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 	free_irq(dch->irq, dch);
 	vchan_synchronize(&dch->vc);
 	vchan_free_chan_resources(&dch->vc);
+
+	guard(spinlock_irqsave)(&dch->vc.lock);
+
+	dch->req = U32_MAX;
+	memset(&dch->sconfig, 0, sizeof(dch->sconfig));
 }
 
 static int d350_probe(struct platform_device *pdev)
@@ -621,6 +1302,11 @@ static int d350_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dmac->nchan = nchan;
+	dmac->cmd_pool = dmam_pool_create("dma350-cmd", dev,
+					  sizeof(struct d350_slave_cmd),
+					  sizeof(u64), 0);
+	if (!dmac->cmd_pool)
+		return -ENOMEM;
 
 	reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
 	dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
@@ -639,19 +1325,23 @@ static int d350_probe(struct platform_device *pdev)
 	dmac->dma.device_free_chan_resources = d350_free_chan_resources;
 	dma_cap_set(DMA_MEMCPY, dmac->dma.cap_mask);
 	dmac->dma.device_prep_dma_memcpy = d350_prep_memcpy;
+	dmac->dma.device_prep_slave_sg = d350_prep_slave_sg;
+	dmac->dma.device_prep_dma_cyclic = d350_prep_dma_cyclic;
 	dmac->dma.device_pause = d350_pause;
 	dmac->dma.device_resume = d350_resume;
 	dmac->dma.device_terminate_all = d350_terminate_all;
 	dmac->dma.device_synchronize = d350_synchronize;
 	dmac->dma.device_tx_status = d350_tx_status;
 	dmac->dma.device_issue_pending = d350_issue_pending;
+	dmac->dma.device_config = d350_device_config;
+	dmac->dma.device_caps = d350_device_caps;
 	INIT_LIST_HEAD(&dmac->dma.channels);
 
 	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
 	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
 		       base + DMANSECCTRL + NSEC_CTRL);
 
-	/* Would be nice to have per-channel caps for this... */
+	/* Advertise memset only if every usable channel supports wrap. */
 	memset = true;
 	for (int i = 0; i < nchan; i++) {
 		struct d350_chan *dch = &dmac->channels[i];
@@ -684,8 +1374,17 @@ static int d350_probe(struct platform_device *pdev)
 		writel_relaxed(reg, dch->base + CH_LINKATTR);
 
 		dch->coherent = coherent;
+		/* Request line 0 is valid, so it cannot mean unconfigured. */
+		dch->req = U32_MAX;
 		dch->vc.desc_free = d350_desc_free;
 		vchan_init(&dch->vc, &dmac->dma);
+
+		if (d350_slave_supported(dch)) {
+			dma_cap_set(DMA_SLAVE, dmac->dma.cap_mask);
+			dma_cap_set(DMA_CYCLIC, dmac->dma.cap_mask);
+			dmac->dma.directions |= BIT(DMA_MEM_TO_DEV) |
+						BIT(DMA_DEV_TO_MEM);
+		}
 	}
 
 	if (memset) {
@@ -699,6 +1398,14 @@ static int d350_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
+	if (dev->of_node) {
+		ret = devm_of_dma_controller_register(dev, dev->of_node,
+						      d350_of_xlate, dmac);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register OF DMA controller\n");
+	}
+
 	return 0;
 }
 
-- 
2.54.0

