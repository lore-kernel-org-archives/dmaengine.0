Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D1F448D02;
	Wed, 12 Aug 2026 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550257; cv=fail; b=AX7+ITP5pl6pUwEg9zphtobzjkSZ9u5YSlP83h16z53JX45UMC+jMArBut0Pev3LMWEFdljtdCS77a9Lo12qwuiX+Bn6QDGzu+HDcsyVqPvr4ldBgGVqJcp6tFHqs6pKBMet3H92nxbPa2GNKwdBgabuJ26ZnGnZ0HyPJyA79co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550257; c=relaxed/simple;
	bh=1mRYD+w1UVqNtDR2dkJAa+mvKSsPIrAJiTq+3AC/KSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n9EzBMgTkxJnIUzzAt+HvQ9UUD101HCLPsg/kJaZ4498Bq/xyqH3BnVbjVGHUigxyXwfw41oY5PEZjAdUQNlZaWEwOARnHO6eVwFCZ7ZpyC4G4xGHo8WLR3R7ePS29oZGmIu873KeHoVriUvSbLYJQIlozZQoapgGtS2RgQv67o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Ts970kmY; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Ts970kmY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElrSlM/NPZaXMneyVH3xKmQqv7wogAx9y3kL20Orj7Uv8gBL2ZaRL8rhCUTkfvKhyat3QJIayckX/lP3Sa0P/DDZptDaB8JGx78ZG+A7r6RjzmH511x6FfwzleySRnDV1DN78SuKdx5MICt4NHRsnC3ZdfETr6gUqmA7TMnCKh7Rpoca117H2ON4vHzh98BxR+HXG3bWD3iaFAJzuYJDxKcJ7dnjqWQiU0vtW+98XmJ3McGofKqpyi3mxyIuNaPf5/TPED9H5RwMCOWCA5i+u6EKbfZzexVCq/LbOzzXy0zhgEjfS4j+qnvzcYdDXVncpFTQK9m2gwSgc6fl6Zqq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHUaRrwSBTJcpawM1hcDvRJJg2U0+tS3ijt6SCL8nUk=;
 b=GVTmJwNS8UwdznbZA8THtVZ4MLGFRHQpj1VtBxD1vz94Kz79G2JmF4s7SAzWxJ4E1Ur6LlTxDpvkfUQy3F//fpBdt912h5tt+SdzcssC63mLr4L0G0RayY0kxIXJn+0f79N1JifaclSLbY8y9Wj/ck6bYnNwYmEJOZ29HWk7Kh9wmWGJ2Tz6LADXEo4NIi7Infb6HwU6EtiF4er+9l7damYeBpBS4YY716KuNbEZ+Ef2l3wnQ7oXh/dwwajMeq+jhd4T339hyMFZhwt/vk9f2q9B4oaExbzjHF5jeu5HPqaqqxDOsKydhOF0F4et4C/6LEWp7lc2KMkjhgBEm3LaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHUaRrwSBTJcpawM1hcDvRJJg2U0+tS3ijt6SCL8nUk=;
 b=Ts970kmYz69gbprFfsZheq+9TD0ewJXR1IQS1/MIrOLY4InjFhoJMnwvce7925Qs7BQzoOe3paG9EO8Bzo/OG1tkFivGHX7IGwBywaodWK7bD8NYNOBFda8zUcX9SpUCAITPPFm6AQYXfjBgDwXvylkqKuvNBa3PpBzt+ilCrm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:29 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: [PATCH v5 04/24] dmaengine: dw-edma: Make DMA link list work as a circular buffer
Date: Thu, 13 Aug 2026 00:57:01 +0900
Message-ID: <20260812155721.2807506-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 87154d23-1dce-4e82-9930-08def88a69a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	K0sqZlqOlix20hf4AWWdRQyQ66LKSmoFuJqKWSwkmiZpvEFxeL8GVxC5Cc00Ml3vhIt0SKHldtKQODuCXKXVxl7DiTWx334+hmXmpuqr8FvjgkLNcEH7ybnBvle1fHDM7K1WX2NfZhaWXNrkLIqsrUaG85N3DG81ku91Aa5xtPkVv8vK7Tro2QLKVXntG+gusp+bTB3jWvimUhwY/DgjWvwgRQiFJL4zMxa+/7d5oP4Ldu8AJ7rQ3JxwI1oMxZBTbl221zLaNzQOtpXaU7V2mbTdFzcc9uLkRkD/8zwFFQNrAioueeAsEe/SpXwt7IOhdFhayzjPzXZdMBFKM7bdbNP8rbd3pzABJ9HASoNeNgS91IDPlNPVlDexTl6vujrhydaKM+tBuTaHGS0I8zJutdjjwgKXeRVKKgp2Uyxg/mZISukF+uiLxBYPOkV3D+GiRnT1iywQ2sz7H0r/PQ/KX5leaqvNXd1zYUtj/VUEY5opSDN9RMfQ7i7oJ7lfpU/FMq7KGCwYO3z1+ScITW7vnXU7TFeJmvWSB/sRU6/FaXtYT7a5rDmsLBhga6SSw7mA/6vW1UT3aGRK5aE25Xfrcknot2a8yMVETFsgoLH+48yvVRENrJp6mEqn2GZ660erIeTXXfZx+jx1niX+d0rqZf/xEDvnX+tEQ8Ozy/rvHspHMnEIUU3Vqw/fHQgh+9ndDx913KYFKleoSNg7vi35UQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gPP4mOy4N8RZdJPrwH/0+1s2D2sRitl8+s+V5gZnpHGdoETwH4YN2bv2fI3h?=
 =?us-ascii?Q?AqKoAW2S6181UeNdKs8xuHZkgyOKOvM4PnXQiD4lByxOOPdVPtoOSSoTuX/p?=
 =?us-ascii?Q?9iwK/058Z4QC5GG2TgVexPlxWx0zQ962A51TQRFqGK3TE9OTwsXYKF4n8VXs?=
 =?us-ascii?Q?OHf1KajLxyRRRIoJu/dnQYoSqv9/Ph4Bhvy+T/RLgluo5OF1vb+Exy6Y4FNW?=
 =?us-ascii?Q?XI0c2wIGyM/VEm62x5etUfc7pntnL0ok7JJqAFrF+VVgaKhSrGVoxwSGmJzR?=
 =?us-ascii?Q?ScL1Mww9YYorq0Ca/hjkdH/x3GuJD7xUCfx5DZYutWTJPmksYg1bmqDef169?=
 =?us-ascii?Q?hNSsu9MjLPiXo6UBL8MXAOeJ2U2i/OP5GU/ZTDAlaG98eU+423e5M0h8fnUh?=
 =?us-ascii?Q?UdGjTYedpBWaZkf80fo3x2idnIaMN3LuowNteaC/QO44rkyJc6OjmBrPgvzj?=
 =?us-ascii?Q?6zkdhjeB6PwKNjiE7HxWJwGn+wLuvnHA04FAhT7aj529d8QCJax3phwpRN7q?=
 =?us-ascii?Q?ToVxD7m2CKObpBhuknjEFNDW/TwQ+M9G1hymf269JsxQjoKwuaXri8x5YID9?=
 =?us-ascii?Q?Djvi05pXvGSI2VWGeq00kGoA3ZhWVQTJx9iywypUrraXC1MhPMjYMux1A/4n?=
 =?us-ascii?Q?oZ5OpOFnT53LFPX3O+tY/ZX8JiwLTjJL7W/tEb9JgZMcUVG4Xc6zv5qsNHbr?=
 =?us-ascii?Q?Wog9W7nfLzeV2TgVC+npXqF64q4pjt4ftTDGtLASkWeZD/TpJXqSoIVW9+bM?=
 =?us-ascii?Q?VZOad6mHCvIgV2K/XWyTDylI+9ZiB+6H/wk9QyJck6v7jG5PdDtLbGjwwyWv?=
 =?us-ascii?Q?QHH/JreRAEE0M2KI79mWMRtzNte4xWTgWlVYHnQqlodthlQZL302o/wPmIWs?=
 =?us-ascii?Q?eNJ8asFY8Ewh1JYKkJZeCuHS/8PclvY3scaiJ+d95Ec9vB3ByfY6/t0cp0Pr?=
 =?us-ascii?Q?PcMCff6JgkES3fiz6ANOIizc5EHAvOXueG/IhPIj2i2AgwboawGwSg6Fn4av?=
 =?us-ascii?Q?cTG6t3ov4V2u++tgg9Ue7LDQwr8YXRz7PS4g6ZFptxPe+Adz++Xg5GlMS4iH?=
 =?us-ascii?Q?wfY+QhuTU4QhAw3sY/g/Dirlt5HsvwCikzAQqaBRKHZRyYYroGjgYEarshl7?=
 =?us-ascii?Q?3W07u1M/KGZjx5z2SUidpBiUa/DxPGltC7Agb30cdZOipRo+JagwJL+7VaEF?=
 =?us-ascii?Q?bInsskm+AEQXq2yucqLEt5pwXCiZ5Ktd01EkykA8/tVdvoK7qib9Yeu0GdXC?=
 =?us-ascii?Q?yI5uamffrY1JOmMHTX5NALamzP66sVM45l42lIq8faa48SO47s0JdsIvQu4F?=
 =?us-ascii?Q?tbFhxFEb8EGtHqpnR8aPnG+AzSM2ehg0n6saZlw8wev6q93gN509Ps6uI/me?=
 =?us-ascii?Q?JkUszq5oy8QkTppo53Ey/DL4dISQeyaehg3u5XNeNblzqtkOsX6c3rSqWAvG?=
 =?us-ascii?Q?C4Q6zy9VOaoqhG04ocaMNA2eBziJLIZp7llhLH/uThBrUJoPF07pXi8LBo2A?=
 =?us-ascii?Q?gOAkxLgL3aFTr0X75kQ4l2VoUSzOXo/8JS5ew25scnnTimOrdp5v0FARarLe?=
 =?us-ascii?Q?MwBWMbY9a6jy6T436zlT4o+cIXCYn/hGvVs6VWyM5PHWyFovS2iZ9AXn8wQc?=
 =?us-ascii?Q?HcBGt1dTkw49p8iud5LPQxKVmquSrhh6TOgMVUS8fE35na0Dt6GWYu7/nnIG?=
 =?us-ascii?Q?ifrSmqijgr6oq+x/yDWCcXtir0yDgd75JOdZMw+MKi+6y85GoRlIn3wPqYGa?=
 =?us-ascii?Q?khNeYc6n5qABxrEl3X5AlK+GF5FSWQdmZhg7JtKv6zAm05+r6w4x?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 87154d23-1dce-4e82-9930-08def88a69a0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:29.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNzFgERBjlEedBz1C6o+YjexteghH3UCwe0Z/hR4AVdeaOPXrIZstIM9KNKr8WA/8WwKRj9PSqKtOX2n/nWlcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 125 +++++++++++++++++++++++------
 drivers/dma/dw-edma/dw-edma-core.h |  27 ++++++-
 2 files changed, 125 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a6bb68ffdfe2..1af262b6e881 100644
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
@@ -872,6 +937,9 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	if (chan->status != EDMA_ST_IDLE)
 		return -EBUSY;
 
+	/* The hardware context may have been invalidated while unowned. */
+	chan->ll_valid = false;
+
 	return 0;
 }
 
@@ -963,6 +1031,13 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
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

