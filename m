Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947B42BEB9;
	Mon, 27 Jul 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171821; cv=fail; b=sx0Ta0Rap/hY+1P9kOuZHVtCR18OXnNeidJnWwYUsKKsQutgKsZAgTFz6J9E/2rlA9U0pBAtJO2IhB98RjtMrsWy5kvzaHL2TwVhO0t8/laocRPs47ORyrSbiSI3JX1d5zwAn6nZTY0Ny+aePQVQYuEqT3xOrj9V+4WqVMc1vDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171821; c=relaxed/simple;
	bh=/CAFF/WTNIf6z8KMus6TluUfPZOIJ2zfx0gR7CrxEXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YESdjMTl55yu2fv8jOdjH5h61xFZxVBgO7v8ubTUaorMoU7i2nigGz2DT79axGtVXZckuIpbhHAryXYu1dh6mruFMtN3P3MrU1zhYtYNsLdSECxJ+E2r+q3Ix8ZVlrHO8RSflL32IFBJZ+WQBbyjpowdbs8S+HvcQaO/NJTr0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=B/MjInOP; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="B/MjInOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYTjX4cBJOH7nSjE4YAntiL8wacpEt9BeeSCUWi4gMifuluvVqMkFqv5+nTkeUdcJxpcz1avEUFzUDpVeVTBx1BK5aVBe/xKt3b8N8MM1eAV6aa71vZUHjnR9/FJTp8aWjzlswt7sc87ZDpRLqCTelViWfVD3h0P6HkoqpnIk5GFsA1N9/KNQ7eOjvguQoG4YHgnRIWno3IWfKOnXousf4By07c+wY23Mwb8QFXyQtxP72mbBWczjRJrBqN5CuPdLRdb6NQh9ZkuSR0KZ2PvPBEdGzq1m8804CMIJIp9f1s4QMbjLp3v7kIltOqoiTnOV4/Lx9vKgjtJOEiDlha84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc0ZeTVgwpflH9tXIYAk7NSTm6+LMxD/IbxzkYbttJM=;
 b=UxRNxrSwsyArF1iTLDba2tXZhf3vIAKXnwJNG+oCKIUlT52c9PmjneUx7r33zypGKwpQYvAQlJzGylv3CbQEo6aUQfARD4RxRCBJbIVREXa4uCtcNNjxzn3GqFbpTzqgM+Yqp0jx/riwgUS5/vG7AXaQoT/JUBoafNQ+85LoSRLR8UVSg3eY80unI8/OfLki585Ja6qjv78dtiqznhOMztAe/iKZR/qj+/nQCiK8OdSa9B/OLDdpFTgTe1Z6WxZTt3oDSP/0U58G+4a5BO1NX0HcMRrMpgl74QlY8yqjX5AffdK/2Mo9DHIlswM7cUn4P2ZaNcYwTft8JJJ4fcdoOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc0ZeTVgwpflH9tXIYAk7NSTm6+LMxD/IbxzkYbttJM=;
 b=B/MjInOPlfN860JFPSeK5ENKw6gng+BDXGVSMMWwbjJhVEoMvchR5Vkyd++BlZf0OVeS5T1AfbULJdWaVplTQP2A7wGB3YmqgkfY+CcfGitTWV6VaB1uWZhpZ6M+OkxxoUspIaN9Wqoik+H3ADVGJeG0YNbDgJGKUl3tKxWRucs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:32 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:32 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/24] dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-word
Date: Tue, 28 Jul 2026 02:03:01 +0900
Message-ID: <20260727170323.2321369-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c5ced4-c16d-45a8-7fa2-08deec00fd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|1800799024|366016|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o8eB3FNot0klMlHpKZS4C5grLtc5AOm5ugpeCKp3dt+CepPw03SCUK+v4b98Q+n51xOoUmOFvn5rLSYBNy3/cmNXXqfUlIBFOxKe5Gt1AzGZvYdFBJ2lzfbBokrl3O9S4915b1dhrbzqKVgBANDTBrZ/8Iyeo+y7a/8dkkFa1EVtax4aQ65lexrrHxYRpvNBqbuCaUbIkNpMT9WWuJgdtFu3IX2sSp73FmAVIrRFhhdgWXtVE5u/NPt7JQI8HAgctW8q9Lolycslc5PJMxvVROY1WmvI3SrwoV548hhDDDClU1nsQzlC1qOicTv7bQ0R4v/2X327UFIvBvFoWdVpEBDLdblLgndyL7GxCqNjoclgFfuLoaxc5Wu/4vwvOl2ueXhtiYcF0gJQttN2oV9qEu5DzWeXwI6+XaByPS4zSZ91mjKjhl1bQ6TXfP6R7hu4o1dbPk7uz3ST0eJORfIrrhtgLg9S4gspnZZ1j8clECy63Ataqm8kGQFfIHWENQuee2o1e5QIogbuOvZTrs/024qnkptNBQzQaZUMHbtL2qYcg0kbr3E/MG5eHI9p5YE7TIfFfWGc52GsqHTQ2wtT+b5B8XWiU4Bzkkb02fw51eH5uUk+afzfADXcsjX9YIVXVN9tVdYwsmXsvAxqT6ZjifUU7G3vOI1qczqzkrBduABJbIGCBycFIRvebgNnaKPtlbuN1PVlyhWSLdyHg0x76A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?skar2cLgNgqRKDAKOq7z+lbov/HEeW6ux+X0UamuTujTp/T1HwYoCOx2+rHN?=
 =?us-ascii?Q?38XhmzaVCLlN5uwMed1609TeVonsAIwDglG8F7qnBuMLkuOcn1sAJukmqpB6?=
 =?us-ascii?Q?GsRKgobg/8mcoFR8rHMXD+vUxYsdLT1rY+WdrEU5P1/OLbHvz74NGqKTYu5P?=
 =?us-ascii?Q?j0SDd4XpURcFBBschHL9ZeM1K7qpskhbNPuQ1HDx1dJWkx2gR1QPn1AMUovv?=
 =?us-ascii?Q?TFLrXz64Me9ErZ2iBM8b7uzd+IbrppQgYKkZ7x2O9HpfkXLxPH6xDsx87ExM?=
 =?us-ascii?Q?ExzdvZQVydTpt5t/v5mghnRFS96Ph/9znmaIG+MGnYkmPu09Mhx88xdRtQ3B?=
 =?us-ascii?Q?DR/Dyu2uYKsB1KVbEP8CRYHZapwi6se3aNpNTddfJMpGISJAWaz2LrFWd9gH?=
 =?us-ascii?Q?I03Fy/6ROCgglK4Yc0rRd2eQDit285+uQ7HZZ0GPoFPMHDqDN7JDET8KJkNu?=
 =?us-ascii?Q?kbOoFA5N10GROJvb+E2EM/tb0MKxn2U+y+18nuysRLIpJsE09DR4mrG31fCM?=
 =?us-ascii?Q?IOlNsO9/FWd5AF/ha/4pTagi7izs4Qrw9LFxhlSplr5u3xT5fHB2y2aBQ5dF?=
 =?us-ascii?Q?OXNa0tWuhj+7pHVwp3K//rMCkBa6L4rezJ602vwMWwRzQn4DbUBHmi2ddETS?=
 =?us-ascii?Q?yZ+GBqkkyNbbKZQk+C5mDVSGB2QFoAdTf+w2pHdvUI3TEKjeTcyc9UJ8RUx/?=
 =?us-ascii?Q?ISiiIuIPVJKGyeQezv1Ql/mO3U5qgnWoI9DpUUhU0Vzqazrto41fQa8aWRCZ?=
 =?us-ascii?Q?uiiQhC/r9Soan6m4QX99pZVGPuWPUKRv99RctQ6SuWVrI/Wb6Gaab/kQAHxm?=
 =?us-ascii?Q?HXG6oepZnpuz3qrfvZj8FPDuG0qbSTZjJH7ezvfyiczJifh2JIpahDGtwTD0?=
 =?us-ascii?Q?60fGK0QznbaWGr2Ui+BrtO0+q06owBKbAPeIctP6sLKWPDHvXIs6eYzeyYuA?=
 =?us-ascii?Q?sV+gnKOTG6xIiegUX+cJZ6tSuPtewTgORFtXGQqflNBeEiUwhEajxZaCWTDv?=
 =?us-ascii?Q?hXXndpdyEkHdFTRz37LGT/IMuYJugTrfL4Dj65NybuUx0mnF9iw1xNfT4Vj3?=
 =?us-ascii?Q?alBIYmnS69TM4mtA8Kd8XPE0vNa4MarxgUSEV30LDrOInoLPbP9lY96wva6s?=
 =?us-ascii?Q?3qoGczzr8DyUN9JrbdsEiyampr4ZNXgjTTRuCd7iVYy1SZ/1+++30DkNsmoU?=
 =?us-ascii?Q?wi+LBs/CbSLg0MHUXsAlNmkxQllD6w8dfjY3mxsc6ykTsC5OaOWNDIOYleOa?=
 =?us-ascii?Q?U+fK5QZteubCDuP5be+/U3GBOKbKdQBjTgNAI21Cja0qrGIWqefi2MfHSzC9?=
 =?us-ascii?Q?RwLfuJDuPyQfY/OgHD9a7GyRueF1dPoQESp30OjGKi0NxzIYikbCxWS7k0DB?=
 =?us-ascii?Q?Av0ju8mUSuZ4OLFET69I0Oa4MkFE1oYw+LHNCZnED4BwhQRQU/WaIeXRCBy6?=
 =?us-ascii?Q?dpSOAY1j1e1WKH4ZeQKp9Ktj+SFbJHUjTScSXRip4vZhdsoWYJZWm9NRQVRX?=
 =?us-ascii?Q?Vc87No75K6ybg2o0OlHXHI1kWIVf9c6fnssQwQcjGy3mrhJ2JsUTfLloiEDm?=
 =?us-ascii?Q?hal8TP5sxhzk7FBx1GGbM1mvwXozA2Fvz1lhzoTdE+fcsjssMU/1PSTFL45M?=
 =?us-ascii?Q?2RXoat3tPykGVWo8ODQP4Xk282C6wq+APKJzsrV1icGPGAqt6nw3G2oWAzQH?=
 =?us-ascii?Q?BvgkPIFyrBsUhpNEQ1OIHl6LytwODRZw0zJsIgUHh56jsLJ3hwU9tLDZlkih?=
 =?us-ascii?Q?7Cs6qWVlBOazQKM7RGGlNe9a8j97w+EGyP+8+ggsKUY9aDaJcdUr?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c5ced4-c16d-45a8-7fa2-08deec00fd59
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:32.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR2TfUTuBJZDp4beAL3gVwjlAVXMUdt5YW03aAALutsqgpJ7P5GcKHgimnCbPV9ANihyd2lUrfQaGluHGl2VDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Add a core operation for clearing the control word of one linked-list
entry. A later patch uses the operation to invalidate stale CB when
resetting a circular LL ring.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.h    |  6 ++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index e50fa7965778..089f913fd247 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -138,6 +138,7 @@ struct dw_edma_core_ops {
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
+	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
@@ -255,6 +256,11 @@ dw_edma_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	chan->dw->core->ll_link(chan, idx, cb, addr);
 }
 
+static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	chan->dw->core->ll_clear(chan, idx);
+}
+
 static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index ba84811234e1..c31fff095b4f 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -605,6 +605,21 @@ dw_edma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	dw_edma_v0_write_ll_link(chan, idx, control, addr);
 }
 
+static void dw_edma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	ptrdiff_t ofs = idx * sizeof(struct dw_edma_v0_lli);
+
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
+		struct dw_edma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
+
+		lli->control = 0;
+	} else {
+		struct dw_edma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
+
+		writel(0, &lli->control);
+	}
+}
+
 static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -668,6 +683,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 2fc7f8e85b43..b2d35f0b7b6d 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -374,6 +374,21 @@ dw_hdma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	dw_hdma_v0_write_ll_link(chan, idx, control, addr);
 }
 
+static void dw_hdma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	ptrdiff_t ofs = idx * sizeof(struct dw_hdma_v0_lli);
+
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
+		struct dw_hdma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
+
+		lli->control = 0;
+	} else {
+		struct dw_hdma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
+
+		writel(0, &lli->control);
+	}
+}
+
 static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -424,6 +439,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
-- 
2.51.0

