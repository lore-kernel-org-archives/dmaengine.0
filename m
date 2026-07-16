Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021134.outbound.protection.outlook.com [40.107.74.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CC42CB11;
	Thu, 16 Jul 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215529; cv=fail; b=LGVMXDnHA1HQAQhRlZzHm2MvVqo9dA4SCIEyLXGXVs2GXNm4PQPTez0QmzhTHOTi06fK+bw3+UPrItjfitqB5GAYH2k3OwYPtxgSa9cZFrSE2x0PqDTbPfR6OzzHTCe5uoHEV0kFGaRb6y7e13DDTS+RdfMouQ6jyv8DyJGIPhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215529; c=relaxed/simple;
	bh=BjWM33zs7QVoB09GFzPJgitFyRu+ZEzTpiWNy4oTD/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMw7bAjUKFPxjUgGSlzDCJLRwseWsiYywfBCtfJeRAAPX5cJ5X+jylKO5XAcYjUmPMNB6sJFG2TQZX7x5A25Q6rMhBUKbse+72fAOTc4c7mINaHXci/gbplvr0Xu9n0mKGrNWZ8Tyf0Yf8hb9QxbCj04v32JapdpQwh6DqANIoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=YVEjCYrK; arc=fail smtp.client-ip=40.107.74.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="YVEjCYrK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMwujaB9Fpl0lKhiJ0jV2KQbYwCXuoz+kNq7e4IgxPPrPsutioFdk3dwfpQ58MR5QSj5YwbLPqb4jo8omiBUIIATdLNLz85rfgxtEoAOa7ZCXu8Ua8QDRSi4v9WjvZORjpeP45HtRN+JXbMRgrwaXYOTSwt5pk3ANJbkZKbFihuUqOsFeVDUo+GPsccvvDfuC3kWoev7VLCGblYaFkRV0h7KDoPCOTIdbXTP0IFH+4/c41TdS+3ZmeRhtswQtCtOKwgEuaFXSvRuy5G3NyEeJ6S3sPNEvC2oy7zCmiM7WZHvyTk1eTgvQtdBVqXGaKDhKMPl8vupUEV2doyX7UyBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miGwmREqSoHT+ttET2yaXDtSK7wzVlsh13bhaw+YBZ4=;
 b=MvQv0nIYDBZZzEsMJrfxX45rpmcwbOG7YkCtM/1wJYmJvjOFySQjCGDnVR+KKryRl/zyNcrsedmW3VnkDGMC3eEA6nKTGMq0dVBhnxjUPCOxbsKdJzYq9QHfHCfEgJKBHYFvX3uLLpI+VZhURXeWFpFJU5nQxIku2PQNfyIBLV6kfdCBuwh8v4UR07Z3zXoHYMYgQcndTKaSRAL5xL2ieypcMp4eLPb06+C7FOf+9Sd1s1BUcU62nx5yEw8aRxgFEm/YB3ByQNME2kI/SC/G1SnX98NQGOo0LAGtaj3XPc7w6jeXOQIP1cnj6+UBwHtSmwqjFty7v73DptcEv9IYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miGwmREqSoHT+ttET2yaXDtSK7wzVlsh13bhaw+YBZ4=;
 b=YVEjCYrKeDq/R3iQ+mlUbYe2NwlEM+nGgzvxe9XP6m/5hg3g0AU7LZHyWC+o/exfJYbHoWyZJ8TX5FU4nIyD+c2eN4rh7xGkudJgpM6Puat430clng1Du5DkdJ2ePFpo2GlokwIICOdK7m3VsMPk3wftNMdL9YEybH1cCInA/ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] dmaengine: dw-edma: Snapshot the v0 interrupt status once per handler pass
Date: Fri, 17 Jul 2026 00:25:02 +0900
Message-ID: <20260716152503.1747922-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0177.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ee0472-5ae8-419f-e3d8-08dee34e72ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2VGYmE6V0KEVUrYcK/CuE7DaCqR45BUEUZqJXbhZezoCNxG0QXwmfrGEs9FfMthWZljql7o02YsWxsGBVUEmrVZcvXj6rtVqkqyRa8ET6qhx58S/qEaEgkWo73mR8pU7e0jMZcxF3Wqd7K7+IFjqIUu1j0fJ9PduV01a/LSwzqJLBiNk2N/seFEfjBZhCzFmmtV8CKJmcwRU2t6r9Mi+lpcr/Z1OdN1dKK3y0+JdIjxJQfiCIgB6X1VpDu3tX29qlo9eqicdBtOVWH7Iy7Uh319lJyLoyv5VG6iQZP2nYDRz5fvGb9yZOvO41H52Hg7cT94TUwn2FqKA3NI9nNienajuRdVr8CDkJgCQdBTF+OuM1VBGibjRkr6zPcizTV3y0NNYggl5r9cGUFGePtzkcJvUSG3YmziEy9K5mgJjr9LYG6yYzNVzaXz5WeFVGY7BXLape0FUnpWXgD/7hkWiLh0jbuK3wcyqcFInCLbxspy9169Sv1K+5xKws3ox0JuoxgvtMzMpJeARmRkjb2/70ZyIRi+JPuJZg1j6U+73yLTrzNSsxHzYRCtIpeKcxN6txg2QPFaKQaz9VEIHftzkS8cL/cqMSvmLlS/glMlTjfzRn5rUcoxmkcLBhkmYgZqyDTfZ3sddaf/VTccpuQnnIgjz1gmM4/LPNg22A7qed8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xxZ1NhOB9rQ7muXzKSD5t9VWuGWhP/nVS7iMaprbqL2uybH8IAKH5bfYlZbr?=
 =?us-ascii?Q?OpnzYiDMencUwDfkq8MoT5Fadz+HTnHugqM8q7KJyxElApOo15gvDR6h2xTp?=
 =?us-ascii?Q?K/ztf1fKXNzPilBA53uG2VQgSScuOhLovXCjNCf3jjx2xSHmTV3YVkjP70C7?=
 =?us-ascii?Q?Mo5SLOHKulz47+QEknx6PtgT9D7cmUHZn72DQrMF8a0RyStmVcCheIWrBcd9?=
 =?us-ascii?Q?xB0E6khMQpbDeTpJd9mVkxfbN5xAOwLZVjLSBmeghqIlntxrrceMfZmZ9D2A?=
 =?us-ascii?Q?suJqacnlrI5nVkjHvm496d+GS0cpL1xr2bpxkP1cFrw4xDQmULSk1j206ZQq?=
 =?us-ascii?Q?5ts8uEyq3gIZ3uC8TnJ1meLc8OSPghU6/O7x4s0YhWmewUskv54nm1bq/5mp?=
 =?us-ascii?Q?tKUnJDhthvS0nDZw1WexOWDbWPyEbEI641TQiWx+Zu6wfNu5A/ol1Aq1N+/v?=
 =?us-ascii?Q?yrbEBSibDMeQv14uenCLDDQJmQNrvFce5f7FZ1Jy0W3ssWKMHZJXGmk7v3bC?=
 =?us-ascii?Q?XF61Zgzd/gAYFNMyVNdvuY04nngeMRNhhMef31uYRMlAeEuUZi9a7yu3mRVe?=
 =?us-ascii?Q?gwKpBr1dnF/iY/vVZpiRsrysP7QDfoYuEEfIWjrdVE6tPvF/zK/9g7fXTZtm?=
 =?us-ascii?Q?dhUdzxQuXt4AxvRr83iS3re1UMUaSpnwWSCcoCB0TWnnN1qAgrtMByWSP1yc?=
 =?us-ascii?Q?OODzY7/WhW/7/aFZhG5fV1zhhTzKSJYoVwttdyiKBBrW6LgxsqvlzV+6JtYF?=
 =?us-ascii?Q?96k3rnAojgyTKvC7bF21z4aj50o3gMqQ8y40D/zx96b566mSNJTF8xw/NUq8?=
 =?us-ascii?Q?/7TTe1/HnejrnPCD+SdoPzT09MZEifBrt5A+62yiaHKG6Ds56s35HB+w+x0y?=
 =?us-ascii?Q?nLH3Nar3tLYFDwc8d+Ze0HugcLgzrfAHA5igSVa42Nn97sCeqwKrQfiWbuER?=
 =?us-ascii?Q?kfcV//G205QdCryoPfmNIV2puGSFvXwhTNq7QfzOMaYJBHSWJN3Jee3sLuWE?=
 =?us-ascii?Q?Ti9cJD4821WIhWJSqSSSMDO6NxuvQJKSs7Ti4/ahWJDdK24puMgemaCwhsUd?=
 =?us-ascii?Q?4BzR2fM8MaN+8MNdZnX1wv4XN5v/eSRGsZFSvqCl8YkEemGV9+opkCME7pwM?=
 =?us-ascii?Q?DnCI1FGZ3WdNaTrFQbURwt2GPdjsxG7vO1DJxWiwIAfiCHqb/jx1nvhlZWXU?=
 =?us-ascii?Q?PrUA2zUbFcRdmVIFsm7p/KQ3iBEZRkwESKX+oKdjNr6+OI/KF4WykG9BpCRd?=
 =?us-ascii?Q?GyqDV+vXk4R3+/X9bqWwUc1u8l30cWOD0sONaM8Cg1ZTe0fOnY+If11A921F?=
 =?us-ascii?Q?3hwq1yC3N3sTUNibwxyk5jFQNX3j7RCWr5qNZDv77T4XkDDD/tgO0C3o8QMS?=
 =?us-ascii?Q?3OYOivYBi9XB/OclN5k1WDfEwQl5NFZuQbposxMRB3ZbKGfQHepHCbb7E+3y?=
 =?us-ascii?Q?5qGPCvRIfMOd1MvLg8HW5rmNYw8d6honmXPjf2TMp/uKSunn2X092BVg7JK3?=
 =?us-ascii?Q?yfrm9s+MhqPFzGNJePI3LOX173jHtflZyXzWofMwuYT4QwzJbUDMb5u5aE87?=
 =?us-ascii?Q?NESIMIp5PdAhWLEOvlURoYT+7n9wyf43iE9oWI/7rwnekcqflMHGb/V2PCAZ?=
 =?us-ascii?Q?EeOUzeS/YFIT6mnlAtLG9c6mAnHu7u9dSUT6BT63XJ+wvjUMc8FlW2z2YnW/?=
 =?us-ascii?Q?lk18JnLvBDgRsaoZ/RFU4P2QC4hZo1zOyc5qvWjibeDqnEWHJO+bIQDw9eKj?=
 =?us-ascii?Q?zI1EuZjQNfY8q25rHoUOQOMT3zTVk9RiSE4y1E+mIqr0VoRf2RPO?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ee0472-5ae8-419f-e3d8-08dee34e72ff
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:21.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcyFA1lg04kCkqgNrKnitRwP3OcRlDUzU7BlEU3qTd9LI09a+SE59soHbDOayOFH2FwJLTr5QTDu2+emEy0Ggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

The v0 interrupt handler reads the interrupt status register twice per
invocation, once through the DONE accessor and once through the ABORT
accessor, although both fields live in the same 32-bit register. On
remote setups (dw-edma-pcie) each read is a non-posted round trip across
the PCIe link costing on the order of a microsecond, and with one
completion interrupt per element the duplicate adds up. As an example,
profiling the R-Car S4 remote path put the handler at ~7us per
invocation, dominated by such reads.

Read the register once and derive the DONE and ABORT views from the
snapshot. No abort is lost to this because the pass only clears status
bits it observed, so an abort raised after the snapshot keeps its status
and its own interrupt delivery brings it to the next pass. An abort on
an observed channel cannot race the clear either. Software can restart
the halted channel only after abort() runs, and abort() is called after
dw_edma_v0_core_clear_abort_int().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-v0-core.c | 28 +++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index cfdd6463252e..6befae2c95ac 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -218,18 +218,6 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 		  FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id)));
 }
 
-static u32 dw_edma_v0_core_status_done_int(struct dw_edma *dw, enum dw_edma_dir dir)
-{
-	return FIELD_GET(EDMA_V0_DONE_INT_MASK,
-			 GET_RW_32(dw, dir, int_status));
-}
-
-static u32 dw_edma_v0_core_status_abort_int(struct dw_edma *dw, enum dw_edma_dir dir)
-{
-	return FIELD_GET(EDMA_V0_ABORT_INT_MASK,
-			 GET_RW_32(dw, dir, int_status));
-}
-
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t done, dw_edma_handler_t abort)
@@ -239,7 +227,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	irqreturn_t ret = IRQ_NONE;
 	struct dw_edma_chan *chan;
 	unsigned long off;
-	u32 mask;
+	u32 mask, sts;
 
 	if (dir == EDMA_DIR_WRITE) {
 		total = dw->wr_ch_cnt;
@@ -251,7 +239,17 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		mask = dw_irq->rd_mask;
 	}
 
-	val = dw_edma_v0_core_status_done_int(dw, dir);
+	/*
+	 * DONE and ABORT status share one register, and on remote setups
+	 * every read is a non-posted round trip across the PCIe link. Take
+	 * one snapshot and derive both views from it. An abort raised
+	 * after the snapshot is deferred, not lost: only bits observed in
+	 * the snapshot are ever cleared below, so its status remains set and
+	 * triggers another handler pass.
+	 */
+	sts = GET_RW_32(dw, dir, int_status);
+
+	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
 	val &= mask;
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
@@ -262,7 +260,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		ret = IRQ_HANDLED;
 	}
 
-	val = dw_edma_v0_core_status_abort_int(dw, dir);
+	val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
 	val &= mask;
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
-- 
2.51.0

