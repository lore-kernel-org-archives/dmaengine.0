Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988742D776;
	Mon, 27 Jul 2026 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171822; cv=fail; b=Qz8zODNcYwJKUBiqzJ7+LOdNEQ7GEr8uSYg4P/ef8Acq8L0J/Y8UZcTAy9VtS8mrJtucs8SuxEvH5O0WyYYVKEscLD5A+AzCrtz5bj9/o9Qz7GN++yic/6L0i1W3RMhcFR381js1037AHuSYTAl5rMtsK4WPIy7hfHlpjOArlvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171822; c=relaxed/simple;
	bh=2EKAJ3W4WYF/bdEbJ1YJjOEtjt7GbIMpkCR50lnTeTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gmxofiut2IsLJNOjUYIryDrpi6UWt+On5iewwdWIS7g0vqHaHb3XM/ZxunraMt8bjuQZGdlnbNkgZA6j4whuYwCi2Wxbo36w8UdNvZQ0f5QADsYrF9jbyIiLTqVoKdzJaVSX+Jdf4K6x6MJ+JMFxw1uZUC7O36Azj5tBqlcyfOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Gns3JZKD; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Gns3JZKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FroK+sBffV+Cv+B6XwZdOPUmbO1lG6CvnswRiaCmPcK/gfSODwArkEQx63rH6VMnjfmRemAYBwbGbNrwvKEBK+IA3H2AGeliD6bXvvkOzol4Am5/NCOFrwrx+30+uPft8+VXQjFpjQn9GptoPey4TANxOA61jBqHRTA51EjRwBA/mejSMRsL9BIFoLE4R5gW1pMPOnI3FM2Jl8NjTN+ylhomoj/6aFpHkyBoYx5wpMUugXnKSzKNG2a7NjdrWlMD3yX2hdYZk4m2sX1Gjpm8Q5D0k1eRD+XxIMe6/piTuHVU+hWqCVdGJFFR+J9RKruNWXfWZtcbTvmgqUSzQLI//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZNjmLu6QVaBu7YBqyrxjL6X2R7Omh36qElb1i1pYp8=;
 b=wWUU8Tl5uF3g5rBXf/3kdoT+d6b69ys5gQ0lEfMpQzgIefst4in8ex0hqftFhuhp9jR9LWEKlVxL1M+CG9LHSqldvAZ1Wg3xHNHeZii8+XwzjxSJQBJVOEBjQP2ag1UuuKanMtVe4e6KcWSKzyCXi5LFTbAXLzi32tpNed92sKB+lBaOppQRlHvUxGZ/aZQs2wOlkIIft7/IpsSxXKlzMhc9wWrpRU8uqlLLsH2aP5/TyUO7rTrtllutii9jiHDNw7+iBlSyOM3qV0x0AVKIhz7YYYH/yq8l/yL87ilMUN5VEXaJN4wwkPgJLCyuQiiqmzcySjvJ6GbUUk9qWPh7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZNjmLu6QVaBu7YBqyrxjL6X2R7Omh36qElb1i1pYp8=;
 b=Gns3JZKDZFy7Ybydi+tdcn/BQ8qUVLl0imx0rva36vHJV1pabl5+Gb8A18Nuj2xk7b5SRzOvVq5YEiNSWkVm6/qMUpBpYzVqD2yFFj0gz+C5CFRuqkKfbst3auz6mvDBZ4L2JJTSaEmE1camM6X/mU3BJy5Z9jLiS/IJL0la+sM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:34 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:34 +0000
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
Subject: [PATCH v3 04/24] dmaengine: dw-edma: Make DMA link list work as a circular buffer
Date: Tue, 28 Jul 2026 02:03:03 +0900
Message-ID: <20260727170323.2321369-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0242.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: f9564576-a7d0-430b-8aab-08deec00fe53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	zFlOEe6RtnEJQDuDjE1YY2JdvMt2JpUtDYMCsQYS6d6iVedH5wX7LKkCoSGWzmDEu5CLHppFWDYuC2KQUFT62F4wrSAku2hULWtTisxA4/dMLBKjQ4BJZPcSVFZINzAN1zKpeIdRpIdRsySrg3oiNPaK1Hbj/2YxrJKU4KTLdh45tjG/+LHe9zn7GoKvDraNpM0BnagBGsACACQi3dAHXODczHhWBrzY7+BXOm4euQbafLcIadAcbwH3Hosv3deYNz1I+6BDScJITJGZY04UKdIbYjlPhPGhZ6+hXVZXpCSQ7GGJKvoYwYFpd83zpEBYdEtXsA5XIP8MroDU8PqnUJVfGvmXa/UryafTg55sMF8KXYL9n8T7reVh6/jUU+3b+Z2fa4K9ypbNQnOyZy2fnXk97NYMHsPlpmxlgu74cgoggw89eP2Kfo4lKuzoaDLa1jELTYLKz6bsTNhXvg6IzwKyMzphbRQr/NAccNIE6/4v1MvsHMl/pNfHrxXxAfwwkCNe6h000Ba+W+9JaTk6teDzgtCu3zdyMUMGZXHYa8tCgrjfzBTPYbz1MeT3bwQOc5UUa8kpYQ8bzE8dW+R+f3jv9Boy9lEhhMZeLsPEvLBn14NrNmdwydkNrZFSwUhWdL18CuHGRyqGyrpkBqBtBGkzElImk0w6/BoU+M2zqlyW6Q5PC+FBzWC2pGyiIbEe5f6Cb/gdLYKa7fAFyXzdRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cE4KHCmt/WHcQwWJgazcyK/q9C+tahHCHNRpfBAKcnjt5/EWhW93cLS/scS4?=
 =?us-ascii?Q?l56IDg/VVCFKQ1z6mr5woCZs/PZH2eImdc9UB924rrxTdgh/EW0FBZQ1ps5t?=
 =?us-ascii?Q?oO2mH0mFMsdofA7XI/oCuxIDJclQ73y0jPp526L7qMl0349sfof+8xi7+PiZ?=
 =?us-ascii?Q?pCi8l3hdzLbkYXUd9w9aGDIbM6QyLZ1if9AHFWY0cjx76pzbGBkgwrnyapc7?=
 =?us-ascii?Q?4o4koTQfXZuBJbnZ3j48udREcNX8MRWOe3BrRT+LLMUZ1iqgUCbmRun4qiiN?=
 =?us-ascii?Q?obZPX6OqTtZUqsQ+PHnuopHyyLenM5DL3LLiRD/UGI1vcDp6wb6vO5Qyv9hU?=
 =?us-ascii?Q?rohG7X8/tW+PTHn5kom07wZUg6CmQpGZvn5xU/D1t0OjYA4c2PsSKaPbPjOq?=
 =?us-ascii?Q?5IU0GDrj8oevw8i2vITJFq96HkSvD7awIHY5zJwzU8Uwya043vBOm0g8kflA?=
 =?us-ascii?Q?ImJeho0Og9wUjVFBEe0O1mQVY3J1comSMozVeEZiPMJVzo3QTOybrpOgttYc?=
 =?us-ascii?Q?lPBLQanr5snurEemgM+qM5DvTvRGcR0lgNH1GamS0GUcjIv/0sO2sqBsI7Xv?=
 =?us-ascii?Q?ZfUPkZO92wOTQLTvCCV++nrARzAQIPWd8oEIXP6TE33W8nN/Aib8dSudpb9S?=
 =?us-ascii?Q?k4gnHym6Gcu9CA2c0l5uhVs3ltTD2IhYM1TyVVOfDxzpK7N3iQprKUj5ObLj?=
 =?us-ascii?Q?CcZWFrwqckEMw4ZRaWUkNmlRxokJXp0rd/dKiAS3yH+rmr0OSpdTbwi5WHBF?=
 =?us-ascii?Q?hyads6KxAEq4Oy7pWXLZVnD6yVOnsPH3d34QHPqPfVlM15QDBjLFp8JiqqAy?=
 =?us-ascii?Q?SQ22SEcfvP3M/wAQ9Kf5BwtwsCocJ4qY9/0e5714+zi3Re42avyuaB/gBntj?=
 =?us-ascii?Q?SrFJjhnX6x48l/jg6b/27RHPlNY7CHV7ByjunKmS3S0H3pzwg9jYPz3ejczD?=
 =?us-ascii?Q?S48gU9lxj3umStgvO0IvqRyU2ITRxJg5aB/fPH2xgor1cwI1y5jK7SDG1c8I?=
 =?us-ascii?Q?YxMJs7kFs6gVW+vuJaFubHUkn//wddLQqAiP2rHJ0wBPp1lAtmzY1j9FMTO2?=
 =?us-ascii?Q?rlONzx5C5Dl3fZcJ9jACAL7tEsuUzv/WbCF8r+0k49Rs0XwhoUp2t31oVEQr?=
 =?us-ascii?Q?s+WZtSi+AlcvGV/LWjfnNx+afxuqTjb6FOLVwLXci9So5PbNBoDSLDGWJKkq?=
 =?us-ascii?Q?S97yP7AacyHXpP2BB20oiAB99Zp8iZOX1EX8LZRLHPmpFxd/vX0ls4YrdHxW?=
 =?us-ascii?Q?A2dHHoOp/ytal/kdMLmAEoJezq4XtYYORpgL+ba9sqxNMyffQ7MfqgbGsFJS?=
 =?us-ascii?Q?XiVsp21OVMpysMuMUIi9n8MzvdiTvPgQYuE4xGUaF/e4M2PD3KveYWveY4wi?=
 =?us-ascii?Q?OHsxd8zQ+ZKyV5pLoZ9/4hafbzdVjhb278FYJQ9+oAg6wi9XMwDQtxSBs3S5?=
 =?us-ascii?Q?sqMZJ37TWCaAD53ncVvykUrEn66E+LKPoXiYSdT0+LrGQBv8kGjiyqmN/5Xr?=
 =?us-ascii?Q?Rfq2INu/ltzHGa9aa1iT0iOn+v0VGnUrSKbsWz6cb3mdH0OY/qcaxL3Zj38p?=
 =?us-ascii?Q?Wjd3C5r1xjRuE93iV3rjqBU0y/QfI14aSp0N9CXBZ3DjcrcjD/MAW3mf6azH?=
 =?us-ascii?Q?DW8Ct/j1SVySrk48ZFNX21RKoyDsJqQZZyHFkChPMlF4ao7IgoPkHxzacKP3?=
 =?us-ascii?Q?jyiutSgrjVzcHBp0SNZlRC7tgCmtXs3MHkEuilZXCCRa6o8WNvWXthUgHJTv?=
 =?us-ascii?Q?dkgfIYDoacxE5l/woVr/q52ifvB0HswrgA6+iWdU+5AbI8gKmAuD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f9564576-a7d0-430b-8aab-08deec00fe53
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:34.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN+QbyweLj58l6MS11gF2x9l3kVUnc2itUQwcpBDNn8CkKEtHSdLvarwnWmHecY/Sp6GINm3pjK0YKiHOorYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

From: Frank Li <Frank.Li@nxp.com>

The driver currently rebuilds the whole linked list for every transfer.

Use it as a circular ring instead. Append entries at ll_head with the
current cycle bit, and reserve the final entry for the link back to the
start.

Clear control words before first use so stale cycle bits cannot become
valid entries. Reject rings without usable data slots and, until reclaim
support lands, descriptors that exceed the usable ring capacity.

Termination and abort can discard descriptors while ll_done still trails
ll_head. Reset the ring after the channel has stopped so the next transfer
does not inherit occupied slots.

This prepares the driver for appending requests while the engine runs.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Reset ring state after termination or abort. (Frank, Sashiko)
  - Use ll_done as the consumer boundary from the beginning and move the
    ring accounting helpers here, so the later progress-reclamation
    patch can focus on consuming IRQ-paired progress.
  - Calculate free space once per ring-fill pass.

 drivers/dma/dw-edma/dw-edma-core.c | 125 +++++++++++++++++++++++------
 drivers/dma/dw-edma/dw-edma-core.h |  27 ++++++-
 2 files changed, 125 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 6a25a050b89c..d7a8a43b71d6 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
 {
 	struct dw_edma_desc *desc;
 
+	/*
+	 * For now, a descriptor that does not fit would stall the channel
+	 * forever: reject it up front.
+	 */
+	if (!chan->non_ll && nburst > chan->ll_max - 1)
+		return NULL;
+
 	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
 	if (unlikely(!desc))
 		return NULL;
 
 	desc->chan = chan;
 	desc->nburst = nburst;
-	desc->cb = true;
 
 	return desc;
 }
@@ -67,30 +73,75 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
+{
+	u32 i;
+
+	chan->ll_head = 0;
+	chan->ll_done = 0;
+	/* Drop stale CB bits before reusing the circular LL ring. */
+	for (i = 0; i < chan->ll_max; i++)
+		dw_edma_core_ll_clear(chan, i);
+	chan->cb = true;
+
+	dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
+			     chan->ll_region.paddr);
+
+	dw_edma_core_ch_enable(chan);
+	chan->ll_valid = true;
+}
+
+static u32 dw_edma_core_get_ll_dist(struct dw_edma_chan *chan, u32 from, u32 to)
+{
+	return (to + chan->ll_max - from) % chan->ll_max;
+}
+
+static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
+{
+	return dw_edma_core_get_ll_dist(chan, chan->ll_done, chan->ll_head);
+}
+
+static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
+{
+	/* Keep one data entry free so equal indices mean an empty ring. */
+	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
+}
+
+static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
+{
+	return chan->ll_head != chan->ll_done;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
 	size_t i;
-	bool first = !desc->start_burst;
+	u32 free;
+
+	free = dw_edma_core_get_free_num(chan);
+	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
+		/*
+		 * Refresh the link element before filling the last data slot so
+		 * the next lap has the updated CB value.
+		 */
+		if (chan->ll_head == chan->ll_max - 1)
+			dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
+					     chan->ll_region.paddr);
 
-	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
-		u32 idx = i + desc->start_burst;
+		dw_edma_core_ll_data(chan, &desc->burst[i],
+				     chan->ll_head, chan->cb,
+				     i == desc->nburst - 1 || free == 1);
 
-		if (i == chan->ll_max)
-			break;
+		chan->ll_head++;
 
-		dw_edma_core_ll_data(chan, &desc->burst[idx],
-				     i, desc->cb,
-				     idx == desc->nburst - 1 || i == chan->ll_max - 1);
+		if (chan->ll_head == chan->ll_max) {
+			chan->cb = !chan->cb;
+			chan->ll_head = 0;
+		}
 	}
 
 	desc->done_burst = desc->start_burst;
-	desc->start_burst += i;
-
-	dw_edma_core_ll_link(chan, i, desc->cb, chan->ll_region.paddr);
-
-	if (first)
-		dw_edma_core_ch_enable(chan);
+	desc->start_burst = i;
 
 	dw_edma_core_ch_doorbell(chan);
 }
@@ -123,9 +174,10 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	dw_edma_core_start(desc);
+	if (!chan->non_ll && !chan->ll_valid)
+		dw_edma_core_reset_ll(chan);
 
-	desc->cb = !desc->cb;
+	dw_edma_core_start(desc);
 
 	return 1;
 }
@@ -159,6 +211,19 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
 	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
 }
 
+/* Must be called with vc.lock held after the channel has stopped. */
+static void dw_edma_finish_termination(struct dw_edma_chan *chan)
+{
+	dw_edma_terminate_all_descs(chan);
+
+	/* Preserve a clean ring; resync only if entries remain published. */
+	if (!chan->non_ll && dw_edma_ll_pending(chan))
+		dw_edma_core_reset_ll(chan);
+
+	chan->request = EDMA_REQ_NONE;
+	chan->status = EDMA_ST_IDLE;
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -299,17 +364,15 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	if (!chan->configured) {
 		dw_edma_terminate_all_descs(chan);
 	} else if (chan->status == EDMA_ST_PAUSE) {
-		dw_edma_terminate_all_descs(chan);
-		chan->status = EDMA_ST_IDLE;
+		dw_edma_finish_termination(chan);
 	} else if (chan->status == EDMA_ST_IDLE) {
-		dw_edma_terminate_all_descs(chan);
+		dw_edma_finish_termination(chan);
 	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
 		/*
 		 * The channel is in a false BUSY state, probably didn't
 		 * receive or lost an interrupt
 		 */
-		dw_edma_terminate_all_descs(chan);
-		chan->status = EDMA_ST_IDLE;
+		dw_edma_finish_termination(chan);
 	} else if (chan->request > EDMA_REQ_PAUSE) {
 		err = -EPERM;
 	} else {
@@ -645,6 +708,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 							    DMA_TRANS_NOERROR);
 				list_del(&vd->node);
 				vchan_cookie_complete(vd);
+				if (!chan->non_ll)
+					chan->ll_done = chan->ll_head;
 			}
 
 			if (chan->request == EDMA_REQ_PAUSE) {
@@ -659,9 +724,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			break;
 
 		case EDMA_REQ_STOP:
-			dw_edma_terminate_all_descs(chan);
-			chan->request = EDMA_REQ_NONE;
-			chan->status = EDMA_ST_IDLE;
+			dw_edma_finish_termination(chan);
 			break;
 
 		default:
@@ -685,6 +748,8 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
 	}
+	if (!chan->non_ll)
+		dw_edma_core_reset_ll(chan);
 	chan->request = EDMA_REQ_NONE;
 	chan->status = EDMA_ST_IDLE;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
@@ -871,6 +936,9 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	if (chan->status != EDMA_ST_IDLE)
 		return -EBUSY;
 
+	/* The hardware context may have been invalidated while unowned. */
+	chan->ll_valid = false;
+
 	return 0;
 }
 
@@ -962,6 +1030,13 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		else
 			chan->ll_region = chip->ll_region_rd[chan->id];
 
+		if (!chip->cfg_non_ll && chan->ll_region.sz < 3 * EDMA_LL_SZ) {
+			dev_err(dev,
+				"channel %s[%u]: LL region has fewer than 2 data entries\n",
+				str_write_read(chan->dir == EDMA_DIR_WRITE),
+				chan->id);
+			return -EINVAL;
+		}
 		chan->ll_max = chan->ll_region.sz / EDMA_LL_SZ - 1;
 
 		dev_vdbg(dev, "L. List:\tChannel %s[%u] max_cnt=%u\n",
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 089f913fd247..761a5ab4bbb5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -60,7 +60,6 @@ struct dw_edma_desc {
 
 	size_t				done_burst;
 	size_t				start_burst;
-	u8				cb;
 	size_t				nburst;
 	struct dw_edma_burst            burst[] __counted_by(nburst);
 };
@@ -72,8 +71,32 @@ struct dw_edma_chan {
 	enum dw_edma_dir		dir;
 	u8				func_no;
 
-	u32				ll_max;
+	/*
+	 * New LL entries are appended at ll_head. Entries between ll_done
+	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
+	 * owned by software.
+	 *
+	 *   software-owned      DMA-owned       software-owned
+	 * +---------------+-------------------+---------------+
+	 * ^               ^                   ^
+	 * 0             ll_done             ll_head
+	 *
+	 * The link entry points back to the region start. ll_head == ll_done
+	 * means all entries are software-owned and previous DMA work is
+	 * done.
+	 *
+	 * Software always keeps at least one free entry, so the ring is
+	 * never completely DMA-owned. That keeps a hardware-reported physical
+	 * LL index unique within the current ll_done..ll_head producer window.
+	 */
+	u32				ll_head;
+	u32				ll_done;
+
+	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
+	bool				ll_valid;	/* LL context programmed */
+
+	bool				cb;
 
 	struct msi_msg			msi;
 
-- 
2.51.0

