Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A65208B2;
	Thu,  1 Oct 2026 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865615; cv=fail; b=SAphEPMGbCt9ppL5X3vL6GXaT36Ze2tHvwLCc+YR6MJEvkt7vAoJ5lsCWYVa3hsxO1tp0ctY+yQvtqTIsTcEHPoC64Izx7egDWyjwpu2IkdzcOkkBTz/rBI6bVuILXOynTO19nL7eV8rjnkMRZh7R3YMvdMMEx4JLeXHoDDbnH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865615; c=relaxed/simple;
	bh=OF0nSZSaC5Lt7NucSqoaGQAKn4OX+wNpUO2vn9zJ/4k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uFW0HtgqH7PlmWvNG+toMhGoJDQ+lDi6MAyIrr6ib0BnScPrjWwl9mXm1YeIrIpEmjdEAPqnlHdfTbIYKJy5xry9PWlm7A86psuiYRHG5YynYH1EG+EzIk9D11IxMn3148ItjzPR2n0HAwX81IPUSUKn8C4oc5PhvOiqeX6u/5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gaQIOjx0; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gaQIOjx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFDqDHdE6Vl0m3xxAiLtza8OmSv3X+U/77PX3G70P4/K7I0zG4v/LQpokJot1/cOafauoNJWIQwnpwUv6n5NEogMqxMws5setckNixoXZtzq7iw0tSdFp5Sh4CG9UBdJpsW/ZlDHYvHoqLrA+VK5IqqpKrUU/HwnMF2w8ba3EjSCjJ5acXu2C2XClXZ6EwabaYhVfqsgtXJ5vZYWg5VGp8Dn0DIlU6Cm8GuFhJau0SgDG2QVU6RBi2nXXw08qORE80aVA4vz/Qpai+gzZZkKbaK4y1Ew2MEpgrAYGbYWxkmvh+vb2ysHP8+8pQ7C/hWNn6fsItbe7sh4xpEhmRkTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr6HFa4o9CEcJBPjacwradHtLHfkof9yHS8cSZMv83I=;
 b=vQltOVHDicXBrgvf49gMQEoQak4/C1e+u+h2W2c/BxJY7KRv/3L39/WCZB6kGKtTVtfA8ZWDEEMxUzDhyDKvcip70rKi/uc2QA2O/xilaRe/idVFTziUOqwrhwbT9bztqOkHSkiFyUqPsJVdKRXinnaiSpUrrXb49wX5+4YSyBqGtIOjBECice0QhSzT6kkkC9eu6seLQBa94iDZxZ+h0UJrdpVUTL9KlRE4inZrRY1W9p7QIdAyHnG6R2VAqEoqD5tBaLePkTSbZ6/cLD6sYMg+dW0na8SW/w/7/rFxx7m81ViK0Cbw7MZ77+UNPe08V10THa7EVXduOjra9jD/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr6HFa4o9CEcJBPjacwradHtLHfkof9yHS8cSZMv83I=;
 b=gaQIOjx0y7y1uXjTB2BasnzzQAVCDlmqc4OboAzGQA6r5xHVi0c1O+JtH4LXrLQGkykVAs3xrYG7iYnZxZZYei3keS3F3JqBVVdeWGjQZOA3B9o4LkjTlxc8x5jfvbcdwLeQyo8YRHKvKn4l8OF4bUeidlM9QCW5iz7S6z1ve/89z1XodiE7p/jpk+CKnD3W3A8Tlb7hUEX4BpbWES7OGzKyAcRS7NsWpstUy3ppWGyztz4prD4a2vfkvzRQn2Qq4+6yVsmmcaoF98c7P1YqneFU0EyDDHeLZL2dlA5AQNz2A5w3NZGeq6oZylUs2SvDAMyDTWAS+haLdZlHSbbRoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11777.eurprd04.prod.outlook.com (2603:10a6:102:524::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 14:40:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:40:02 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dmaengine: move driver-private helpers out of include/linux/dmaengine.h
Date: Thu,  1 Oct 2026 10:39:53 -0400
Message-ID: <20261001143955.2195063-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11777:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c9b51c-a715-4fd5-cd7a-08df1fc9e07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|10067099003|6133799003|260925021311599003|260925022911599003|260925021911599003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ONUzeh1bXvlw6/CNzID64/Q0yfFVK8OTEg6tgp9Nqtdd8tii72CsHJPAABRFcYVz93wWutBuw/F4p2j5jy5v0fkyq4MG1hztirgoo4H0AVzxzG31DTJCMuOlv9OcvWikzzXA8X6BYcjJEgQ0QMHINOJIw/YQSFNV2tKlqdRj30GNfFbVOnHqlYl38+JhnmchK0c1A2Z+yob6LxNnMYZinnJdTJ81kk7oy9xrVexjqOnASD6N3+XSmwjNZDwk3wWYfmIfXsfa98yMJvjb+xEVidnAmgKMuC/pvSOhaos98g0R3lLRWstCcCQC5ZxrNXC2Mg1ydKFejXPjPm0btfYCGeQa3iQHHCkAzM80BFAqdQajsyuJq8lRWiEJhyPxP/o5Lr+C+UDLeFxxEffLPOchzYXNl6h9fcRR8gUydw+54rItOJUzuzoqnlmLUsG5NxM7JCET4O6D5s2f56JCP0p+i/G/PxFVbQPcOy6NbNBvgHH6Nxt00Ai0LiLP2jcwXCLvwM3Vj9MNxjsKH3urul8A9GaX/0CeO5HaHUvXPNwNh1L1DjxAUMLDZnBdlqfC75osN+JagZ4e/vljKmg65V+Gg+BYWjAnaUPUsa8ItF8gaSeuyJD2ttN2Vt88eaf/DVIO6FgOTHimrgjhCPJvRx+LPgf2Fgu0XSrVVRCShvtmI7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(10067099003)(6133799003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yKEdz4Ufagft0+Vijct2Oc/vnhcSVtxS9nNv07bD7Ts24SdeZK2XAG3nSxJK?=
 =?us-ascii?Q?bZ0RPyrRwe5jqJpPau+Zu+dhg3f7VTB0FdyPnzneNHNnwhCF6cPRlrWr3gj/?=
 =?us-ascii?Q?wVMwESegKRSGTiijXelSA4nk3EE9Avp1/9jdosIFGclCndElcPw2+CcV7TtI?=
 =?us-ascii?Q?PxZ0oCsZiOrGDXAk1Px/+X54f9X1+BJMTY/yJUDMChBpt6ONk5tnFvrw93B7?=
 =?us-ascii?Q?zIjRN1th0LwyI8KYQpv7nlIDAuLjqrd1E8XNDfqL3vQ6c90qCFJ7wx1McLCW?=
 =?us-ascii?Q?0E9HjTw38DFVXkRael/nCsNVdJaA57RHy9cERBRu+dUi8quminJRIBv2QJrk?=
 =?us-ascii?Q?rGfN0+Rf6gM7Vl2uJWVpYNrRc/33sfa97FeIAKIpga7/3/bJYtsB17Yaa0fE?=
 =?us-ascii?Q?KAN3JfU/32bmyPsdcVQV8VZ32jtJeNadVIWkcKhe9TfNn+fefzogfI74dPCa?=
 =?us-ascii?Q?ripO1rkB3xtOEmGlqiLaRpSlazc7NiRnHgwpsNmT5mCXYGmBvbxN4n5+6KBz?=
 =?us-ascii?Q?AcBnMY3LDZMNo6F1BgdemE/v2EzyYe5KB0YN2pjZq1Fozn5Acn0zpAdp4t9A?=
 =?us-ascii?Q?NieARR4NLU7xzB6NfwphhXStcrh27CDIFkujV+YfZdHKi3MZxnuN3VdLHZlW?=
 =?us-ascii?Q?sCfY7T4/vBWHO6I1kUakIT4YA+E3LcWjbOAzfEOkjYQYqUSGp4/DZ92Alrn1?=
 =?us-ascii?Q?zhOdMHDAr0VXgqGnsCBNKfuBWcS1LGqMH++31Mu7l/KfYHpjkbelIxF9sKDQ?=
 =?us-ascii?Q?O/sb+e+4Jk3mvKF9Q881oUlzO+jkTmiT804Yf2juHuytsYdDE8gzg/XBhdsB?=
 =?us-ascii?Q?+OiJWyCpSktU0x1odZTc7jdSi63HGm+lYrugZblHlCH4uoscoCNlP5sJk9w6?=
 =?us-ascii?Q?MT7pOaacdefKNVOY9Snv3pzEgQijj+1Mahsh1CzJHfzUlziadC9CZXPkOJ+k?=
 =?us-ascii?Q?KDmTCbEo1n06D3/mV1RUo2iBhtC3bh3pNx7vmiudbsEVuAGtIKyk73aJHGQF?=
 =?us-ascii?Q?QX8IOPZ/HuU7VX41P/FNCs9X7XIlN3aUfIFpL+7FWWBz6NqBBbCQzkRHPrVF?=
 =?us-ascii?Q?9AO7A5Lur63ZbaIiAFNyATTXApT8WR5IcJcTsQrVg+io/r+r9TzZ++bxYreC?=
 =?us-ascii?Q?lYytWkuvkbGsWxMkFrjZw9bLPlbKJ7ALzUXyCq6CDfBLz/eHqLfhejPWdAhx?=
 =?us-ascii?Q?5VzDjRUd065clY+gAh1jI9aBwTaorJlmVYT7EbxRj0XDqeBs+oCmNeEZ6l4H?=
 =?us-ascii?Q?PoTCD+Kna/ysiWz3czVUkVr2sX2/fVL3NoxsMncA5qjGtFNKYvdSw+MAs9Xo?=
 =?us-ascii?Q?0Fj0r5/6UdpjdkArxMx3vlO1c08Cb0suYZxYxukj+tOlq1WnA5p9p5xJha/c?=
 =?us-ascii?Q?GQvykblPzhsfuglb4lU5hfUiroub6KBgSWlLjgSBpPg0oNXF8qe+zwCCRgLA?=
 =?us-ascii?Q?6TPqmV4L1JtGbzAunO9swyqomU2cJvAn1lAXr0lGUptT5345ObT7Tff8z5qn?=
 =?us-ascii?Q?lx3spddyr1kw9q+KzPZb4vo8CE3uTvmU2ip/bcfEh69yg8AJurf9o0DTDJ11?=
 =?us-ascii?Q?zfhFJp30X2AreODqy6a59UDuJVpmmMaEADlDnt2olLPp8HrfbJQFh+zhd3Im?=
 =?us-ascii?Q?3cpz9r2iR/7B65Ti54/+T1k7ZICoq0aQMclKGkHqHjZwUeQekZYjyrFkRb0l?=
 =?us-ascii?Q?sYretvBsAogCwgT8hlAW6IzJTHhg+/IYoSCpuyLBeGDBgcN7V5FZ8lvArS7F?=
 =?us-ascii?Q?Q0x3kies4RWGFcb/1mehe/67F1Vsj4L1FsG/dRodIiMPyylLuuU1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c9b51c-a715-4fd5-cd7a-08df1fc9e07f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:40:02.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XJjBZ9oW1xPQ+Azt4J7YblBk1M1PPjIFkbAMgapKyFFxpQFdpTbd9DFs0aDj+6GGoAgKrZ6ay/fqndEQg5i0bGHC2hp9yHgweL78eyfx9a7YkOgU/R4ApL/lKEn8u3Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11777

From: Frank Li <Frank.Li@nxp.com>

Move the following functions and declarations from the public header
include/linux/dmaengine.h into the driver-private header
drivers/dma/dmaengine.h, since they are only used by DMA engine drivers
and not by DMA engine consumers:

  - dma_async_device_register()
  - dmaenginem_async_device_register()
  - dma_async_device_unregister()
  - dma_async_device_channel_register()
  - dma_async_device_channel_unregister()
  - is_slave_direction()
  - dmaengine_get_direction_text()

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/dmaengine.h   | 32 ++++++++++++++++++++++++++++++++
 drivers/dma/dw/dw.c       |  1 +
 include/linux/dmaengine.h | 31 -------------------------------
 3 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
index 53f16d3f00294..42a3cfa7e5970 100644
--- a/drivers/dma/dmaengine.h
+++ b/drivers/dma/dmaengine.h
@@ -182,6 +182,38 @@ dmaengine_desc_callback_valid(struct dmaengine_desc_callback *cb)
 struct dma_chan *dma_get_slave_channel(struct dma_chan *chan);
 struct dma_chan *dma_get_any_slave_channel(struct dma_device *device);
 
+static inline char *
+dmaengine_get_direction_text(enum dma_transfer_direction dir)
+{
+	switch (dir) {
+	case DMA_DEV_TO_MEM:
+		return "DEV_TO_MEM";
+	case DMA_MEM_TO_DEV:
+		return "MEM_TO_DEV";
+	case DMA_MEM_TO_MEM:
+		return "MEM_TO_MEM";
+	case DMA_DEV_TO_DEV:
+		return "DEV_TO_DEV";
+	default:
+		return "invalid";
+	}
+}
+
+static inline bool is_slave_direction(enum dma_transfer_direction direction)
+{
+	return (direction == DMA_MEM_TO_DEV) || (direction == DMA_DEV_TO_MEM) ||
+	       (direction == DMA_DEV_TO_DEV);
+}
+
+int dma_async_device_register(struct dma_device *device);
+int dmaenginem_async_device_register(struct dma_device *device);
+void dma_async_device_unregister(struct dma_device *device);
+int dma_async_device_channel_register(struct dma_device *device,
+				      struct dma_chan *chan,
+				      const char *name);
+void dma_async_device_channel_unregister(struct dma_device *device,
+					 struct dma_chan *chan);
+
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
diff --git a/drivers/dma/dw/dw.c b/drivers/dma/dw/dw.c
index 6766142884b66..e56974e7d4afb 100644
--- a/drivers/dma/dw/dw.c
+++ b/drivers/dma/dw/dw.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "../dmaengine.h"
 #include "internal.h"
 
 static void dw_dma_initialize_chan(struct dw_dma_chan *dwc)
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 1b57bc4a7e72a..3203b5f81b21d 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -989,12 +989,6 @@ static inline int dmaengine_slave_config(struct dma_chan *chan,
 	return -ENOSYS;
 }
 
-static inline bool is_slave_direction(enum dma_transfer_direction direction)
-{
-	return (direction == DMA_MEM_TO_DEV) || (direction == DMA_DEV_TO_MEM) ||
-	       (direction == DMA_DEV_TO_DEV);
-}
-
 static inline struct dma_async_tx_descriptor *
 dmaengine_prep_config_single(struct dma_chan *chan, dma_addr_t buf, size_t len,
 			     enum dma_transfer_direction dir,
@@ -1756,14 +1750,6 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
 
 /* --- DMA device --- */
 
-int dma_async_device_register(struct dma_device *device);
-int dmaenginem_async_device_register(struct dma_device *device);
-void dma_async_device_unregister(struct dma_device *device);
-int dma_async_device_channel_register(struct dma_device *device,
-				      struct dma_chan *chan,
-				      const char *name);
-void dma_async_device_channel_unregister(struct dma_device *device,
-					 struct dma_chan *chan);
 void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
 #define dma_request_channel(mask, x, y) \
 	__dma_request_channel(&(mask), x, y, NULL)
@@ -1785,23 +1771,6 @@ static inline struct dma_chan
 	return dma_request_channel(mask, fn, fn_param);
 }
 
-static inline char *
-dmaengine_get_direction_text(enum dma_transfer_direction dir)
-{
-	switch (dir) {
-	case DMA_DEV_TO_MEM:
-		return "DEV_TO_MEM";
-	case DMA_MEM_TO_DEV:
-		return "MEM_TO_DEV";
-	case DMA_MEM_TO_MEM:
-		return "MEM_TO_MEM";
-	case DMA_DEV_TO_DEV:
-		return "DEV_TO_DEV";
-	default:
-		return "invalid";
-	}
-}
-
 static inline struct device *dmaengine_chan_dev(struct dma_chan *chan)
 {
 	return &chan->chan_dev->device;
-- 
2.43.0

