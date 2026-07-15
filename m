Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021115.outbound.protection.outlook.com [52.101.125.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7224ADD99;
	Wed, 15 Jul 2026 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138283; cv=fail; b=JO76+KyxXnZFR/aJmE1CKkchsNtL0FTM+iUD+r0ZqIahxzErTkUDvNy3bH5EyaqWRJ8LqVx/RAy2Td/5uYG8AAFNgcT/eH3L+d6qlrB8K6XRy8qebODakPcli+LDsU8GMKWPlo45eDfCKncCKFy42f86u4II+FsPozyZtQDKEVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138283; c=relaxed/simple;
	bh=BDlZuZFukDRWR6sIioqXZ0iE4/PQO+Qmdnshu+biirU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwbkkkxNQoeXMSgP5UUChHA3y+TxaRo0w88J3Bvfm86A0ARwqm36oTk8EeVhEXTOW/BYG5NTS45ystAEbvWDsmewRTnYUxKCcLSfsONJP3cW3Ovly1oBx9C6SbK/Ntm5GxZ9/hKisoTv/Gf4A4s43MSrfje4lmdrrW9CdkBWabM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=i4aB+j44; arc=fail smtp.client-ip=52.101.125.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="i4aB+j44"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFV/oY+dheJhKj+F14j/OzuF9qGXn0hVZucSQgWcJsEB3pIIT8W4XL4amHZEWeqXMV0tw8QxlsSYiixrtH2dceAFb2rXKT+y19x7n5h8ordYbEpgKag0En3x7/7wVs46/RJHwv2MtVIg5bSQyP7aLOiKEleJzG0+ewAb2Qp3TmVhPxLMyIzZcjNwfXO8ZHvDOyADWlmmf3L9HAi9wvvcBwWB2VJu5AEi2iI7qrB2KOmOBjSxcBojegMZTAMZAVPs9GGVSf6+0Bduq73DiMv4J2/NicE3zqC1jGnepxxuQtTXG3ssCBlolmP5q8u+WMcQqBl6GpEmbKskECMEmvMs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04ig4tBMn5s/eWWNEoJWlBGP0NEcN1mhkBqSPdt5TIs=;
 b=mJMdRkqRHKJ4eMhbuXCJ7sjYHFldFIqvCE34qsvcC/Vx6V/yaUNZDueOxfTQM3n8QyLiFl0NJO8Z5xh+55iiEj9kYesLLmWGUfkT/IKjJk2sXFe78v18usnZ6BjOcmqkA6x213rVxUebTc6S/HEn5iXpJ411/Cq7NkF4wR/TZUn8ALoDGO4IxfEB0en42fbY3aPZATqxG/wLd6T3wjZocxvxA+Xgdyu073QRNVEidzO1hjewXwW8dO+c0KdFRydNKWTXOKs1RCvcy8xwPURTLRkjwRqE8h80HmmI1DD6uTtVHM1chOFFw8cp3opusrXTaEG+pzZrDVx+qJNsuqK3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04ig4tBMn5s/eWWNEoJWlBGP0NEcN1mhkBqSPdt5TIs=;
 b=i4aB+j44AV4FiA8Tgwqaz7OL7Zn8xrHjxrNPfOYYJXMaGgjd1GheoAwHcPKnsnKzFCvEow8TYDSS6Wrebo78ZYuBoSu8mtpbUNamYdHdcPPf6bwUNH+UBIZArC7pjVdG/v7oiksT8SQpkMhGmYrGmOYYQNiRCjt2pDp4YRwknVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:50 +0000
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
Subject: [PATCH v3 8/9] dmaengine: dw-edma: Snapshot the v0 interrupt status once per handler pass
Date: Thu, 16 Jul 2026 02:57:39 +0900
Message-ID: <20260715175740.1110404-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cf21aa-9b3a-49fb-8c41-08dee29a95da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|6133799003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tDb+sN8wTetIxBarHw882sRo/jgRukS9I89omxmU3KpyWIIIJML8IUUsBgUtQGhOhQrdxF3D0XWyTLk0MG0Tvn9ceMgmOdKNVz1zJtcUqJv0vlDkw1zWQQA+3f31EBFlYtlkPdS6rka+6f/FxpizWZKS5g5E39Ws3vMFY8yKjmC1klm1rAp7T4Z9uRw3KRvU82dpiI9p4vArKDwU3LLy8F9T7lrDcM/NfmUbDk4Hj05EJ0G7c+vB7BP1yzcinohIn67G8r95L4msoW5A5rA0qJ6E4qg+avBykT6z0rQJeGlBkjlO5DBov94xEEWrceQOmxgYEMwQJ2JHhm5tLiR3zRErAYXC/d9uz7xqNvt+U28Poh72yccS8OHdmLR6DcdsvT1CqepDO4e+93UuIhjobRv1GRttBtDFLB2FfO9Q8G2PWvnHHVmGtoacc1nIfvGgzSIjnJuzGTZgjUAlLhsCE0uXeOJuenQazhaRkScGyY/JngMgpYYugGhl5iD1RYuR/EQGtHlODPEaOla8r2HI+Y8TNk0uHwyL4wkDl/hVkcxkF2xmUTyGIkpzR3OYA68UYwpQLKjIh2Sbx/PAr2cEUV5bQCe0cO7fyCT2J+3qWWKV6Hwroht+tuvHBXfFvMQXNDQL635bqxHdWbSytAVOAKZP7gAA/+2mLm5wP/JFtEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(6133799003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PRC024TznZBrwyGe+xF6dYlF5cYQ8sIUP4lf6qWCroO/UfMHytC3gXdoi16?=
 =?us-ascii?Q?BNQJpamFze+sKcipIA9cZ4DzONOIiV4M+29Vr0cSOjP1SYAGnZvfJDqofSy0?=
 =?us-ascii?Q?4QLC4UxPDDDPl0uUa/Z6mY7twpO7Q9/7xuMNcbULhudrPqisrkwwsYqiLAa5?=
 =?us-ascii?Q?NFrBHVLE/cA1sBlWBOSEjqLnezYF8KMvz2cj570qZ1OyjQEdCTL0teZrRPE5?=
 =?us-ascii?Q?jzZCIWsbqUrgEhOakFzwT1Wcz7/MWIpcs9Md/8jKaSAFJV3d4GwOvoDs/05c?=
 =?us-ascii?Q?ODmZBE4o0S7a8zEtm9dry/8Uh5jTNHIosHMpY52UYphoOnK9eXZ/8wK5c+yt?=
 =?us-ascii?Q?LVqnBGHJ99se3x7K1Hn1iS5jj6Vm1NQkpuHqG1NFy8eKnT+lWAZFAJxT6au5?=
 =?us-ascii?Q?Fj+51psnf26vW1ww3e6ViWxecJjrnfMBVQexmfqYnKdBBuYoQVp9kiqid1ZY?=
 =?us-ascii?Q?ByO4ODiL0knvVWaTGRI4uB9QBWxm69JnokCqL4mkYKF1vyUH3UezopdHsSFH?=
 =?us-ascii?Q?P7yce6n+IhI5ujaKv+aApF1Pjt4tCOLHjtDmMLNdwYE/znKDIKiibyc9O58W?=
 =?us-ascii?Q?Fz2ZU3tjN49e2tLsHHJNiPY7xEZVVMRYnfmai3aZrp53AESZqEtGgVaCfxU6?=
 =?us-ascii?Q?UQydpSg/zIoXTu8tvhj/AtnXzcpJ/qDbCYfsxLvoXy0jfC/hKA6+X1PvOoc4?=
 =?us-ascii?Q?RrCOP2ZdryQG/Mf35M4ItDW1l3ERrhhJXOIudtYYXe+zF07cYvnkg/gxVIXU?=
 =?us-ascii?Q?hiBMNsprWagNfTpRm6IKEcFdNJpKWOGm73cQRM24P0Mrrbng2EiKLSYlCvTj?=
 =?us-ascii?Q?2ORqyQ5KpHnGRgnfJiewqBAjuVNhiqO6M54M8/Njd43Ued+7rddwLeAPlqXT?=
 =?us-ascii?Q?/TK9RCwzpsDL/whZtctbSIeK0uxXnMwXBpd5P+LA6rZCwzFHPzPvHVOS7sGv?=
 =?us-ascii?Q?bM4TOXfc6PXjus60qD8vD0Yvm1LKA+vUYm8LUJI1kCGKU07JRcMN7KXF73Rf?=
 =?us-ascii?Q?Ckj22FHKAQVKs4tmeF29G6dgqtLoZMz297mfyAdysivv5MzIJDZxWTL1vho+?=
 =?us-ascii?Q?N0f4unmz5AjF8kKb43NA0gDLpA8yxxzvku0Ya9HeDXzJgIXExVl2TOevB+m0?=
 =?us-ascii?Q?cdSOrA318iNmj9UumXaOGxI4nHVu8xw+V5m6ymT/e7N88JyrtcW56SrCCnEV?=
 =?us-ascii?Q?ad2vJw+TUadLysDAnX5X03HhaT7rUOzTdAPiHbv1wjAU/kJLxDDwAQulo1sJ?=
 =?us-ascii?Q?OZiw+S+BpZteRUBiRXF8RuKVyCKZj6VooMpa9uVSDBT/77bivtLTRFsbaP5M?=
 =?us-ascii?Q?zWaZBYiX/IPbkq13zKFDmK1duTXPeUwODpY8/6JpWe27WuiPeUO2shqDeK6n?=
 =?us-ascii?Q?A/nUVdr3JD2hz0u+tEWUFZusAyzyJTiiak0RD8QpngDleSE8O/F4E5usY2qB?=
 =?us-ascii?Q?0JJjbt/a3UAmhW+dQxKQ6SyLD4JP6PEK7Tt+vwc9G6yS020B+0bNT5YYuMEW?=
 =?us-ascii?Q?vVtSHyUcXSN6k1cearLaPpLpQaniEhRdUwsvGHQ7bqYn3SIlI1DLBL7CtgO4?=
 =?us-ascii?Q?4FMcwACe8TwBzMHgatushEaxUv5ToqFq/Rq/91tfzjPP5DlAUOPyYX5eakTY?=
 =?us-ascii?Q?P5dJftdUqJ/q8vayL2H5qbY3/mJ6bBwGj4akG3cjZuDiJ7VjYqt7hNl/WdG8?=
 =?us-ascii?Q?ChxXJP17Q/wPh20cfBFCBNUqLo6NflyllIkbebdZD10THWtBOM5psikiIqcn?=
 =?us-ascii?Q?kVEVi5KbssND9GXZd/7mlvNRc0uBUQCyZCIvAGOqYGH6ffVsc1N6?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cf21aa-9b3a-49fb-8c41-08dee29a95da
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:50.0557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYFUhgLDqA1tCXQI8HzCGtGn5vXtg43ihpNW85Oduh+XAXsDQp1Gtr4AOnRxIzvI0dMa3vaQJT/DUb1JzBctqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

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
Changes in v3:
  - (Re-)collect Frank's Reviewed-by tag.
  - Revise the commit message and a source comment.

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

