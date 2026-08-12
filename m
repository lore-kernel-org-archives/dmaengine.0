Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021092.outbound.protection.outlook.com [40.107.74.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C9478E51;
	Wed, 12 Aug 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550273; cv=fail; b=M3Sf+CkbpZFUsIe5b4UEEWIov2gJ40dxOAaPSc/dbEtL2QJTSGg2846l+BV8ozPiFoEtAMVcmrers0glCucQ0XAHK76+BoAuvLmiW2O7VZTX8wh6X/XnmwyTxvz4WBtnfqMO4oBHFUj5H155MCleSOY22dsfscLJzkQL+Y5IYWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550273; c=relaxed/simple;
	bh=frW5ABWRt/v3Fwj/W1ZVkV4P5Km6GreXGyvNEFsuHtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZmC2MTOkM8pKOz9OqqJERYtVIdxXxpXIRVVM4u+1WFFNt7EZN6nEIIp03ZbLFa0zXO94izBz4cTDp8FuKPuxlf1k8/p0WzQjHjI06WKnL7ysmhXPNemAVUwWoEdOXs5ummaPhBOdsGdb4Cd/A3UkT+DJ2HbD59KKJ9vuij5Nrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ac2KWyXV; arc=fail smtp.client-ip=40.107.74.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ac2KWyXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMehn+v8MaQT3WwSFJt79xe2qhp2CwJ/0d7D6tajRKA+NhsecdTcNrHwkmkw+JPMh/8PHOQG4MKv8Tux3AZx0Nvt/6cCehOXAT6iQctAOlj2dXtB8kD6dxfDEZMQnqHUPvbFiWRWCz0+MRsYBNMqI2SUKb/O+K/eSfxHvFfVZaXJWLUrVTi9Ig9ZjHxsLfGQ5/57byFIYsOLThpkuVHpdtqCRTw0UVQLfLOqt8mZmQUK5v075DNxyfJcQx3qozUUHlkkrWPGBpTs7/COUs9TekU3tUarOe7XtFrf8LQuL1miOnnwIe9oF3cTQ8ufePz1OXsQEyB96qU1MnbcmDzSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEDqvCGM9iLqzqaNMum+V7IEieodC8mnDQyal/XX6jg=;
 b=EM6SA3rmztzlZ87firK8/yH41l4ZEnalwiDiEuwnKI0l4AmemwtQob8xfl7jGJpbkzjtPLnkE2Q42LDPTzso9YgFOv88fzJvx6inZEdcDwLwMunIz1uZ5caO4+Uq9/vAk/E5i9XD1nrLwaO2KMUKJoQ8eGWxbAswLIjqCW5w2UFRTkHjlRkngxEKh7vsuOeFRE6b0jGdbEMFs7LIPbgXL0asrKEYDDTLh6F6GCUCmDhyEOTD0rcy/97TKVo0x5BSeGFRJ1OtwIyeggCHGPGbaTP6ai+OjLKl0M8d0uP7qtQPwYFgMe7YYjWUGYfT8gfwA8gwRPIWpTAylTMjSp3gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEDqvCGM9iLqzqaNMum+V7IEieodC8mnDQyal/XX6jg=;
 b=ac2KWyXVIw7cLtwBu5ULD7QC6XGCDkvtrdzHT2pC6SJFQUCn5QY8gxBBhqkXEA8yiMSJ1irSSAxyJqkIp6CCuPQ4gyqk9bzoOhEG0xLM2+3il7kOBlia/24cwp43IXybXoO6GHavZkcX0V0WXgoOVd82seLK3k673t2mHEguWQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:41 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:41 +0000
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
Subject: [PATCH v5 20/24] dmaengine: dw-edma: Dynamically append requests while running
Date: Thu, 13 Aug 2026 00:57:17 +0900
Message-ID: <20260812155721.2807506-21-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 725c2e77-fbe0-43ff-c9a6-08def88a70fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	sIBY3CykhRWmZvJW0SetYjJqexvtZIzZH7ptJ9S1lYwF+9okPQ0FDkx10t0X7RsiAVfJHSAdERgnSrUo4awYt5VjSi2k0zvbxepofBKDwjTGllOpmGzt4wh/yuv0Zsf6xwWTz0SFopk6s9/5jElD84ao7h6J4ju09KdZ72uWQmifDpL9dvOYVqCILzdyqTy87sKj1tST9qgWzwXNbX1V/6sLCzvtD9UVOVCxbs2xMArJ+lV+DfYjcIXcawzOlv4oDTO4Tkc4NWHoQ3MtsynkBt17KVX6cD0jOpBeh6Na6PBOg7tVXRKN5xsJn/dqx/CcjvRKNuA0DAyUVNZ/i99VBWEEwdsLzUOJqAzKjrSXGyPLcT4CzQNT8EbopB6rZv4itbaIGnSphR9DshDmBAzFBUj71YCpnGmkyCpBClsN+TRBkPtjYA6GfzrNQcPQYcnAJosoQgltGPMu4HSY7Vs+FEaaOUdcL3vHq+VlksjQN2qafqOUihtYjfN5UKMG8cgF6eCQ26CC+49028q1k9ajz4XGc6zKscxGfUTLLkvH77AkaNa6ZJ5EnZarj7MGTL0XAx7nUTB9HLdHcCyobe1LVpHDqRmFMQodH6U46O0PIZhrAeW6GyPCrpxKdETHM1J8sreFxknBcXlwSWnUjasvYYxOSmOvaPZBAkqP5veCESbWVkbXfkZjUt8mFqjic514DlBkycBHyrweh704HBl+4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bnqtxrb9s1Z2ma2kIrMoA4Y9VaFcI7Rwc6qtTgVLEtn0UX3LSiCUwUmqCZNg?=
 =?us-ascii?Q?hT2Z8AOEN2VMUcb03CyrwwC7qt32z7b1pfVrfbTJANV6WD6qh4qVeMLZVrOU?=
 =?us-ascii?Q?pc0qdIu11Zn++ysABMfhyc61ILMN22slu6Ls2NNMmX5l8hCHNJsIWzpJmpaD?=
 =?us-ascii?Q?PnL7cuvAqWRprTxLKcS7oLa7SU/tYzXlw2yQdv/g1Hpkoxdso9ZKzjZYwh9T?=
 =?us-ascii?Q?lJp+GVxz4ciba4MZXbSlGF6IcT22T6WWYaO8fgJidbHKYpP9U9VETtsRuJzg?=
 =?us-ascii?Q?cbwvqB5/kNC2R+BVuP/wlYii5LK1NoKgB7aPx7DcST2GC99kysxosaCcohpM?=
 =?us-ascii?Q?IXTeuP6PS7NmAUVaEk1HpXIm8JtJ8fKACtRLbTr90OTx/0R5tKNBavinHBMQ?=
 =?us-ascii?Q?BbZo1NqRVBhyzFMTXZFZwK+BC77WOOBgg9705t5yxfBIHKvoCaKlKPZn9Fre?=
 =?us-ascii?Q?QWeQtTJMWFyn8tCRpWQwhl9uJFEgBFYWCrg5QWssqp3FGKdoQLmce2I4RDe0?=
 =?us-ascii?Q?mxheHVVl6C/hq2hMd1m+pDPWbyxDJ0IXQShKGDI/AxTvRSmVM/2MMRf9F13+?=
 =?us-ascii?Q?ui0niEHipChLWKaaitQCBmpWzTQuMwsfueOGROC9NsLY1vfkV1fc9IfbAR1k?=
 =?us-ascii?Q?Z+fuWOUQAGYBknGrJhelduvaMoH50Adg+39JpqM2SlqBPT+zXbEWYOD/IElY?=
 =?us-ascii?Q?lvAIxzFwzzc0mtboimJ5XGLA4g2VQrN1xUO0DyPNQ2zhWrV8ocs+99RjWf1R?=
 =?us-ascii?Q?X48ubiHZaTKXMhyJLIjA2NjyFy5m38vqpDic4AkMhoEJscrhggibajI6rXyq?=
 =?us-ascii?Q?4LnIjKWm6AgqqEv7QtJ5E8sDTan8SN2MT/hNDpdyhT+OBPG+Pc0eDBKCucii?=
 =?us-ascii?Q?nnjkSADkLf1qCvJ6E/EkVC6Kp8VNlYcCEGXjbkZ2dGS2qsMn+C0RlXih5rGT?=
 =?us-ascii?Q?mJyf1NECszPNKVquP4Hen2mNDj7qAFgRmf3D6cDZyWe5vFubGhyxwL7MXq6L?=
 =?us-ascii?Q?cDHPKYQDUyiBlh6JMQ58qGynn5x5K3eupKw0vgBGohRML3LXiSIuL28d8IJO?=
 =?us-ascii?Q?WYgWvSVOY02QvJfCuqdxEhXbhhFHHRVi8mNJp8Zri+elSZVhK9ewzTDRhtE3?=
 =?us-ascii?Q?8BUBtHVKBch1FgpfolAEjLK434Ram+NYY6HWuHx+sqghY0ntCXo10NGcynBg?=
 =?us-ascii?Q?ckwyGq18CswQRYNts73ok0aFjHYB/7U7jZMnP1u3bEQX7ZdXze1nlcSmHWRV?=
 =?us-ascii?Q?57ueBykijuWGPxVqcf6dc57taJWYA5yYGGbl01Cm65chqLU7NtxBNnjPU4J6?=
 =?us-ascii?Q?lSB9ZyoidK+WZXTVsxlSnNT3XzVfk8p3g55Y9DBEBkufzL1CIpSh4Nxcmqc4?=
 =?us-ascii?Q?Llcsh0Te9PTy2+rmO+8ezojHaxLvgmvmB+txI7LkldzCYij2gD0uqtZFGco/?=
 =?us-ascii?Q?VVfDcM2o/C7m/7a9rEqrqHhW6nauEq9/ZONXGk9EvDUu2hKkw/oDZPf15qoV?=
 =?us-ascii?Q?YTTlshAtZrTM9hYHmB8C91Ye5O1sjdSvaCg9PkmfZ0Yj293UDdkBU68GPh4k?=
 =?us-ascii?Q?DJ5BJdDgdCwCgIqC7JKvg4IstIpXN/wm/d7D3HCWzIgMC2/CBq7OfdM5Ffup?=
 =?us-ascii?Q?P7Cqo+BcO1PEOiID9bq79q1QPM0sWQQzO+8G0YsTjF5YCTR/mUoLTJJv5yXy?=
 =?us-ascii?Q?LbZgyZ1BSvSOLJ48WMvGdi4QS9c7Cr+R5MmTAuazgfYOjcbL1Cird2dRzoRM?=
 =?us-ascii?Q?S4LQgUz685uy7OlJ10+/4ofVp6cPBT6B4+Yv7CQa8456YyeGGheT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 725c2e77-fbe0-43ff-c9a6-08def88a70fd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:41.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m43Lf0BmT2YeGk6pEqO4RZ3CYmdraUbGaD8JaWe08jWeRA1iSOKkw4VquxEdfQTI0jAJw4X64wcfx6suGhE0wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

From: Frank Li <Frank.Li@nxp.com>

Publish issued descriptors into free LL entries while the channel runs.
Skip descriptors already fully published and continue with later ones.
Request periodic LL progress while more issued work follows, so reclaimed
slots can be used to publish those later descriptors.

For LL channels, dw_edma_start_transfer() reports only whether this pass
published entries. Derive BUSY or IDLE from pending ring work instead.
Let issue_pending() feed a BUSY LL channel when neither EDMA_REQ_STOP
nor EDMA_REQ_PAUSE is pending; non-LL channels remain IDLE-only.

All kicks still use the common doorbell path, so running channels
continue without another kick and stopped channels use the
reconciliation and restart paths.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 61 +++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1cc9fa4866b9..ed5654c63933 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -313,8 +313,12 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
 	if (chan->ll_head == chan->ll_max - 1)
 		return true;
 
-	/* Add periodic progress points only while this descriptor does not fit. */
-	if (desc->nburst - i <= free)
+	/*
+	 * Add periodic progress points only while this descriptor does not fit
+	 * in the current free space or more issued work follows it.
+	 */
+	if (desc->nburst - i <= free &&
+	    list_is_last(&desc->vd.node, &chan->vc.desc_issued))
 		return false;
 
 	return (chan->ll_head + 1) % DW_EDMA_LL_PROGRESS_INTERVAL == 0;
@@ -381,35 +385,42 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
+	int ret = 0;
 
-	if (!chan->non_ll) {
-		if (dw_edma_abort_is_pending(chan))
+	if (chan->non_ll) {
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
 			return 0;
-		if (!chan->ll_valid)
-			dw_edma_core_reset_ll(chan);
-	}
-
-	vd = vchan_next_desc(&chan->vc);
-	if (!vd)
-		return 0;
 
-	desc = vd2dw_edma_desc(vd);
-	if (!desc)
-		return 0;
-
-	if (chan->non_ll) {
 		guard(spinlock_irqsave)(dw_edma_event_lock(chan));
 
 		if (dw_edma_abort_latch_locked(chan))
 			return 0;
 
-		dw_edma_core_start(desc);
+		dw_edma_core_start(vd2dw_edma_desc(vd));
 		return 1;
 	}
 
-	dw_edma_core_start(desc);
+	if (dw_edma_abort_is_pending(chan))
+		return 0;
+
+	if (!chan->ll_valid)
+		dw_edma_core_reset_ll(chan);
 
-	return 1;
+	list_for_each_entry(vd, &chan->vc.desc_issued, node) {
+		if (!dw_edma_core_get_free_num(chan))
+			break;
+
+		desc = vd2dw_edma_desc(vd);
+		/* A fully published descriptor may still be pending in hardware. */
+		if (desc->start_burst == desc->nburst)
+			continue;
+
+		dw_edma_core_start(desc);
+		ret = 1;
+	}
+
+	return ret;
 }
 
 static void dw_edma_terminate_vdesc(struct virt_dma_desc *vd)
@@ -900,6 +911,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 static int dw_edma_device_resume(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool active;
 	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
@@ -911,9 +923,10 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 	} else if (chan->request != EDMA_REQ_NONE) {
 		err = -EPERM;
 	} else {
-		chan->status = EDMA_ST_BUSY;
-		if (!dw_edma_start_transfer(chan))
-			chan->status = EDMA_ST_IDLE;
+		active = dw_edma_start_transfer(chan);
+		if (!chan->non_ll)
+			active = dw_edma_ll_pending(chan);
+		chan->status = active ? EDMA_ST_BUSY : EDMA_ST_IDLE;
 		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 
@@ -974,9 +987,11 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	/* Only LL channels can accept work while already running. */
 	if (chan->configured && vchan_issue_pending(&chan->vc) &&
 	    chan->request == EDMA_REQ_NONE &&
-	    chan->status == EDMA_ST_IDLE) {
+	    (chan->non_ll ? chan->status == EDMA_ST_IDLE :
+			    chan->status != EDMA_ST_PAUSE)) {
 		if (!chan->non_ll && !dw_edma_ll_pending(chan))
 			dw_edma_ll_snapshot_discard(chan);
 		chan->status = EDMA_ST_BUSY;
-- 
2.51.0

