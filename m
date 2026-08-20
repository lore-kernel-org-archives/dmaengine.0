Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021106.outbound.protection.outlook.com [52.101.125.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9499481AB3;
	Thu, 20 Aug 2026 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247304; cv=fail; b=RK+nucPUy4XDiglT4ELMIcCmoNIWg8uJiohAwXXZimyYFP9uWI64xSQIX6K9957JLg/Yvb5s4AKZFYkHmojNfLS7ckT21cr7SLHCppKFkhom5Qx0m/LAdUhs8ZpLjpfhBxzG5RjuMvh3sbPeoPxx6LVI+nbrPzTdUM7Lj9x6hh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247304; c=relaxed/simple;
	bh=jBaEXZYk/0Gs7r65rhgOAJrIHbJWZzfi++n7fBLE7ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lk0Dz/ucjUNrLCvRapD6fDWyLIxbmPAPQVaSDJmou/hVG2GBO2+0PI9wY8XCy1m6VYw9blijt5hdqy5Enms3ojbjl4jZtVmUpfYAS+VCauDeVz5loc5ZDh2accdj1cgonw8bW1UnrwpRtSVOwoe4rLz/picKcvNwZxN7Jq7vU7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=as+py9IH; arc=fail smtp.client-ip=52.101.125.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="as+py9IH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbNvxpK5iZCeT26UkNCp25q8WQpwA2xmus22wgiJaj66U1dTmZFadE3nAemhQDgpf2v26tez9Lh7LFpscnrjGvdjWmGlp3O0+mP5mp1ve5+miGQhHh9g1C5+PcFxTdgK9FBqYd4F9e5cwr5FrGKG4RCbAAYGM6qhL7cbdpCtfZgvf26pA9U0aC4ZkfTLEgb2IGRiYTUbzRP1uzdW8J+12iSYCXcHfDmLMbult7ygcRAdJPwevUFfXraluUvFbgISw9+G0QCtlWKdkTRbCVCHTkosfMo9KYeN5L4aMXytGYFdKA0bORy1jeNpV95KHdNKAygVM3KacEcKJ63akmVk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWRO/9ruUqJxzfs8Ej5QtDYCVTu+qqoaeHO/aCaj4VQ=;
 b=hjo/xd/pwVlx1vpe9AvY4GRiiU9ayyHurynul6Z3szDey4zefjuZJN3A6sCoG2ICKhjeg93LRLT2koE3tWHnMrZV9QU3ZgERMMlHsHhItGgg7HCEklqKKMyn4Ppf0hcjgR43HZZaJb6NYUeBdbYFsfl4Ujyy60cgM+8uYVyowU9LwyJoOE9/ARFQAlq4nKpd2CnnqGQeYVpUh50gmQSoQhNsoLC8MGQLrd4nAvikPHT2r58ol9WGp+fhCAOAwQVO8vMOHWsXScAzSg6W8i9qj9qy14fIjQlIjAAJSaAO8aAHLFBydjV5BmFypWjHYzDnH4y7UIksvGQrNF5Iu+QB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWRO/9ruUqJxzfs8Ej5QtDYCVTu+qqoaeHO/aCaj4VQ=;
 b=as+py9IHhrlsEJEk+tHCMZZv3NeNaqk6328VKfnIRLa0glBqxZs6xMiRcrKq57ofH+Q3WJpK03KN2xws9Vkmqxa3b7aHCya6xkAMGi5fMLTWiNgaPFuTsYpOonTki2MSmJOB7DSavGJSllSWK083TRvi9Jquha1AS0E+a1EE51g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:35:01 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:35:01 +0000
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
Subject: [PATCH v6 10/10] dmaengine: dw-edma: Prepare LL kicks for event serialization
Date: Fri, 21 Aug 2026 02:34:39 +0900
Message-ID: <20260820173439.2004068-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5f03cc-bc13-4cf4-5aa3-08defee15cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B5r0K4bveCu852jGAmNugKBZKhDuwr9w7tpEFjkPEq1Cfqf07RtJdgSGvpEwRfozQaK31BDvhg1/OSIJv8pLZk/ALwDvzO5YkF8mi2POlvSBRyGN2sTNa4NaDZwLt2NLLGRAHNMPH1AMe3NGUqc7Ub+gfhJnwKcJwG6QKeTZoVgilXnFY7YyHnoAXMqV/8P5hgkkzHB5ZpkmdbrIj+unPWc/o3yRvcN+iRcy+PxVP8E3XaEM/cZdsYaO5CpXc1fPqODOwXmnt6t6xc8X6uZXOfA+lD8A0KHtCYT9EIvuXmQIAeV0EQ2kJQAXOMaP/778ui5oYpFFh9sA8Ovyz/Jg1y6o5+lGHOp01fG4h9dGQ0lIWpuqdDTfMoUXoNbhW8+HZl7dUrOWygBcUNIAya2mJweZTAk3AsL3G5iJ3AG0ep4amsC2O7TrrK4YXjhcfMtVTWCRDvuxUdhhJyC4JZ7wMpYZAgzqs8emPRGal+MUrw9m0McvdwYSwAMwtEnko9kRILSC+QO6H/04AdMEzLQetuvCmju8KEFvtNwA/lnQ/IAKTGBUm+XjwEQinHqv4MxJzIJsE2a8r5cnwGXWdqZmnAWMaoYdn2+SPfgBNB5g3YixsaR6CdnQTzgiBxI6n1Br54nypbWqiFeqxaBCE7ZqMHfLBg3X3ZIoxnxV//0ykJunnurvbApxYcZSUrgNqnx75Xr++ZhnifjrsJ8cwmOtZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/xbkExctIa6ycipPe3gQBJH9nRH4ErY6a57nTvzaeVN+LZBXZqJc8ZNA8KyA?=
 =?us-ascii?Q?GCNhOlOfkmlLvzD99xQ2IHjunN0rHQ6jclQ4jcCCdB/3dl0T9wOhkFDB5CwU?=
 =?us-ascii?Q?YGKVyex6ZpANsGnSm7t/wOxEBOR19/SA1zvucHhhavzIA1KOpOh4MBObAl3X?=
 =?us-ascii?Q?KjrfSp0NkkBKBZ7F6gbATRYwtnbx5aR2Pa19k0uhpzkiNeZm9JeRAk9KXhrG?=
 =?us-ascii?Q?W+aIVM31QquLJAzFsRa4gPtJcI0u9i83s9ljUUW+me9I2Ip+hp4d//sU7Jf/?=
 =?us-ascii?Q?Vp5l0BtPG2la4FOnSUwqLtjVj5Yc0NRl+uNpPBE7TDtEGcJW0FqvZlY5p+Zt?=
 =?us-ascii?Q?20y+6prG/eUwTZirCz9DRIIy5kaoHZa019Ab/CRBOYjej7+Mm2J211Ko+hz1?=
 =?us-ascii?Q?f+r7VM3hMVTcg+KlVVxAbjU9VkMinNofjZoMu8MdxttbMeDPhM1MmGbi+/25?=
 =?us-ascii?Q?NRYsjYCIDz0tntgpFV8RgN1g1IilJzTbreEYixcDcLk0xdKihI8I09WAXojT?=
 =?us-ascii?Q?eolL+5VZu6qHZt0SZWr3aWm4BkTqIhUr0uJmiE442xEspizWQjpxZRem+x3Z?=
 =?us-ascii?Q?uE2LW714K0Gv+69Xj/TDY0gyusyyh+J4Z7OankIDstksp9KYeA1tz1Mj6Lo9?=
 =?us-ascii?Q?GsR6oI/SLxlTWds5EXqNugNIcW6CVlj0yYtPQU63rkzNWjpl9azvY4lYt7lv?=
 =?us-ascii?Q?Cp/I/UBVKcWFR08TRwTaWWiHbngFY0pYXdb1UNpPuZxRDWGZU6Ju3MaQaYgF?=
 =?us-ascii?Q?TUwXIznrrddnQVW2puO7ktG9s3JwV+Ua5SUQTv/gCpkLrgK8e8OO0p8nQ+mi?=
 =?us-ascii?Q?tXMOci8JZb43FDQigMdn+V2agYEfWKtYFmQrKwW25uoRmlhNyKFOTf8Tdukk?=
 =?us-ascii?Q?OhW/gsq+CUI5t5a9b/+KpkvuZEQqgv/1ny2BWyAgH8PvZNMFguT6di77tU/0?=
 =?us-ascii?Q?q6i+BuCZ4dhm3fSFNajhiSN5I8IEryAZdl3yyCsGuDkNeizbdafznR2166kX?=
 =?us-ascii?Q?cz7dzb7vKGLtgrOCZ7ANI45U18GzNdk72eZXOOnigT7wjV1MAJTgXNsD6yZ8?=
 =?us-ascii?Q?s+FzGVAe0tBGbVQLIZGEj2tL+Am6GiZqe+tp3gQh/OBnsOLg5RvOD28A/LCg?=
 =?us-ascii?Q?ezzc0ErNbeItLqhhsNARJuFXrN7gHe/X7H5RAE6VRUVCzYn74y0zkLJXXC6J?=
 =?us-ascii?Q?r4kSY/IRj0FhqBwPtikdsu7n9rW5YvhU+3A2BBruedFCPRpoZP961GQJcETw?=
 =?us-ascii?Q?fLdtWWIlphGy++FLr8nnmZmRJltc2CLg8wXYxRBE6DfJFcG/xOenQpdp7jBx?=
 =?us-ascii?Q?NRV5DS61g67FrSRQrWkU+ORuEKIH0VA3mIqg8h5HruQTKEBLxR41av2cYh6q?=
 =?us-ascii?Q?IL4Ai19YqU/3/8qJVREoETNYXK//zix1Y1bcr0MLufGRtG1vnSDod05EOjO2?=
 =?us-ascii?Q?zy3s0HF6ksIq91jDZJmVgCEMCVlaUy4zw/ke32RqeGZLSfM3gwPQsr+1usNS?=
 =?us-ascii?Q?zn/xh0f+hPZ97r2VZxkikQmOeQRTPK5it0maR8xk2O3I6vfyUAau1Vv2raQ4?=
 =?us-ascii?Q?BQN67pfHf1DtyXFyIg0cyJejWfeBDLoVCWPxzJUPiy107w4vCMKIEWbgp85v?=
 =?us-ascii?Q?t4ofdcZewWZt4DXridCOQq3k/3SaUkQSJ1BekcLC1V3LnoSlQJgT4ywzCwoj?=
 =?us-ascii?Q?/iffSJhksIcbj5/pqavso+eWXePjvHJIP6i3Msa6FMWKVDi4QRC7fJsRsZuq?=
 =?us-ascii?Q?DDvpgjz/C5qMeZi/UykAAWVLjoKldnH8sdr9H1kyJ8ur6SyAm4AG?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5f03cc-bc13-4cf4-5aa3-08defee15cc1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:35:01.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRZbzc6Wa63+SxZXtArTpI+iEBQyPajshKWPSdFdqtQB4rDo2jbhZNAyiFTKS2xGctf0yo18GX7oQTTAAPDe+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

Both eDMA and HDMA perform the same remote LL read-back immediately
before writing the doorbell register.

A later patch serializes each raw doorbell write against IRQ event
capture. Keeping the read-back in the provider callback would hold
event_lock across a remote read. Move the common read-back into the
high-level dw_edma_core_ch_doorbell(), where it can run before the
serialized section. Name the provider write wrapper
dw_edma_core_do_ch_doorbell() to distinguish the raw write, and leave
dw_edma_core_ch_maybe_doorbell() to decide whether a kick is needed.

No functional change.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c    | 18 ++++++++++++++++++
 drivers/dma/dw-edma/dw-edma-core.h    |  2 +-
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
 4 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 97de0ad4489a..e2eba6d72b53 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/dma/edma.h>
 #include <linux/dma-mapping.h>
@@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
+{
+	/*
+	 * Remote controller registers and LL memory may be reached through
+	 * different paths. Complete posted LL writes before the doorbell.
+	 */
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		readl(chan->ll_region.vaddr.io);
+}
+
+/* Must be called with vc.lock held for an LL channel. */
+static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
+{
+	dw_edma_core_ll_sync(chan);
+	dw_edma_core_do_ch_doorbell(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 30b508eb3e3d..76fd5a41a707 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -298,7 +298,7 @@ static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
 	chan->dw->core->ll_irq_clear(chan);
 }
 
-static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
+static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
 }
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 4a1bb128fa00..c053cb4c2844 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 		  upper_32_bits(chan->ll_region.paddr));
 }
 
-static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
-{
-	/*
-	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
-	 * configuration registers and application memory are normally accessed
-	 * over different buses. Ensure LL-data reaches the memory before the
-	 * doorbell register is toggled by issuing the dummy-read from the remote
-	 * LL memory in a hope that the MRd TLP will return only after the
-	 * last MWr TLP is completed
-	 */
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		readl(chan->ll_region.vaddr.io);
-}
-
 static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
 
-	dw_edma_v0_sync_ll_data(chan);
-
 	/* Doorbell */
 	SET_RW_32(dw, chan->dir, doorbell,
 		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index c6d7f9885aa8..0b3c8496b0ad 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
 }
 
-static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
-{
-	/*
-	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
-	 * configuration registers and application memory are normally accessed
-	 * over different buses. Ensure LL-data reaches the memory before the
-	 * doorbell register is toggled by issuing the dummy-read from the remote
-	 * LL memory in a hope that the MRd TLP will return only after the
-	 * last MWr TLP is completed
-	 */
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		readl(chan->ll_region.vaddr.io);
-}
-
 static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
 					 struct dw_edma_burst *child)
 {
@@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
 
-	dw_hdma_v0_sync_ll_data(chan);
-
 	/* Doorbell */
 	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
 }
-- 
2.51.0

