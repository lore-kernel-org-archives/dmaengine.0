Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA4301719;
	Fri, 17 Jul 2026 05:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264601; cv=fail; b=qeBdMcCjTXx+uBeF47LEeZx7FWwpaxJn0wkWRgpKbg6WMZAD1hu3DteDH9wXCX8Qssz2djndKPTCBBNSWJkk3L7lfIbeRnUTBDvE0lX5lVAQt5+FhRNp4URQJdQufURMxhkr/1xLbcg24635q4nWX/OSnahteS4VSzz9QqbO0Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264601; c=relaxed/simple;
	bh=0kHdLdkfNZcTB4Hj8E23wqhkvaQNBsLCrlKQWNawtkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tc9MdCIStzLa5yxJPS1ThxU/L7cD2n9izYsAIm5FWjWbkGESQO8X7MnavUc6HtEG0c0CFArDjTa4u8bHae2AUtad54YbokIvFApefmAqLNQ/QlJX25GFNE/gwPx2GlPsPLjRydTSU8OlAv6uWHcMA6wSB1AOCIT0D2aFNo1hZ7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=qD6otCxV; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="qD6otCxV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyx6BleQkjUee7YfHSTAyEd5gtH0lGCZMEJPvCgIoehxEtOERyeAk/N4TNhRfeyeoobZB2HzjwB16nWvV/+U7w47Q1iGWDQxIowWGGvANgMpdqv4loVi7zWV5bjMnP/AVA6Ykva4TzXHJfweOTYC7UvX7psU7obwXZVdo7GG/KcXOX24cS+kjoKc6Gx82SfaxVXaWQPznSsqo3EfvCHIiU8L/nY3/saaANXRQB9muK0qVQZ3BCDNnBLoub+j+uTVunDAozXt/KI7rJnG3I3DXk8CWeFmTzM/NENnY0GAiXZ5KdcLo9MxKHtUgU2isbXhqQzT7QBCCii8DKG89UdhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/SFqbB9JEmCrK5N+35lsFPr8DjylFUejS9lcbxBc0s=;
 b=iKvvQ4aSzsEoRbiZeH5vejraURVu5r7/kcdZokzik1lJqgG50LttK0jXKbT8h7l0ykHY4F1H6h6Yccju2YUH9+/yUv3XVYqGScfmH8gb/jtqLdjZHDJrrpiI/kBg0Y3mi3ijSwohqmwiepSNswYUtAjCJ52YkkPSteZyqtdZqofBbs8g6mAcfJjgz88LyKxJ8JztONwfwwJnQ4/GSDe48Nt/tdIZmpGUHrXF4m+k9TzOPh69vqx1k3vpftN+uLDvz+vYmPXeEezGnwXKO/659s/WYVhCH9r19aMx9z/tlEyJCK/xI5/6oD1WtdFsYEZzq6akbklooJ2MFxUbKay4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/SFqbB9JEmCrK5N+35lsFPr8DjylFUejS9lcbxBc0s=;
 b=qD6otCxVqJjPViX8RwUBfZMadeMqZ6GB5y1Y5lWfJlOAk5mtcUBNf0x3MJsO5jBYKa/EXr7FYCG1kQXeb/jY2759KvVFkTNfp2V69nEFW9bI+OJvjveq1qRYVg6hq85OeZV73KN5/5eUqBVzNhbsJknEjIO67H9+t3GZb8e9kTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:15 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:15 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/14] dmaengine: dw-edma: Factor out HDMA interrupt setup helper
Date: Fri, 17 Jul 2026 14:02:55 +0900
Message-ID: <20260717050308.2144108-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cedd34c-8d64-4c6e-acd5-08dee3c0b544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3PbgqHoLkduAzQX3/940rXgLDA96SpOFlzOyWxRM0N9Vansk0Hi1y7lgOnw02rs+olkHt+G+u0CNjehwNLnwGaGjHo7IoYM5OKeUUQdMFO2N2KDKaXh43U074GDo4oBxd/hsjAOA+kZf5spPRRTO0CNzYkZbqKb80qgpddiD0QqreWaFqvUXNsPv7BjyC5pMR5kMlnC8y/aCEBEC0Xyc2sn47vUpFmLuf6e6amakHHr7OnZkQYjtsLVpqF/QEUbIPPEuTpn2CqfroMF/od6hJnJHfIeqnNEB12PfqxifZZCTh97I+3vVstrOk67I4KVKOUCaX4J7YkP0iIEY52CDn5Wyw7sEi2i5CYHQTtgvl22GUEDDjOquNbTkPv3+6KQkUgop+n7m5eltMjo2/mw8PXE8n5uoO+jPTfqkIcO6V9QRThcBiEV21Q47OhiXH7TFajInHEuk+82fn796bBpp1VUabYZGhVhPEEc2aeynTN6i9sq+3uHn+j9kxAtAI+gDcqWW0iwonMhCpt1oP6eEFDWMaZKgCijk7CeuFEoWiSWehZSDDe+NgFJQLOfutAiG9AMNAzFTr1yDRE1HKzIYij03T2rALyTxAV/JA+A4bczj7JES6h7NSuWklpx3liXzqZ3HIS14Uts2I+fu+XnhujIT0o8gEKnGrYez8z9zkIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+9jNzoAfHle9PW9rhQSwahzDJOObWTS+uAIy8RxlxOD8sy9xrcBMzdDDPetb?=
 =?us-ascii?Q?0E+rrXY4H6BDUoB+8kLRjQITDujOc2qXmQfjyiPMb6yI2K7r0xWl7DD45wfa?=
 =?us-ascii?Q?WbnViQoyHZnWjN9jKyLZ+gwF6DONg0bFQeuaKYtAYkNimXwFLAWaPKFIsCgo?=
 =?us-ascii?Q?WEdpk2KrCApz0C4i7TTRi2QN7DEstI89N/9E64BuAjYisC/g6TtLSmouse/w?=
 =?us-ascii?Q?JVGDRELVoTo1N7E4iwnAzWhA0yYegpBaNJptGug4mW0mBHgHS0X+o8ulKJHE?=
 =?us-ascii?Q?WiAajPxJC535vbg6z2FOkJ12AW6PM7SmgsYLn0/RoAHWi+OLCEMH2pmutE2j?=
 =?us-ascii?Q?N01c1xWFWmhUIViqp29alDRLlxx+vTO1UJTDb+RVwQx933s2e9l6zOIw30bH?=
 =?us-ascii?Q?LKYo84r/nXxPjTuMU19MtHPRT9pNRqfZ28VFTn/QDykg3OvjNnf1giWeEuNZ?=
 =?us-ascii?Q?wXtuUsIyXbiDiiJRIhqjwOsPRF0WQStGt7cjsh94m2bCHfAIWZIWRFXLwdwg?=
 =?us-ascii?Q?ZeaQ5Re5feD6OYA6Kndrwp8ewkyEmqMYXtZg1M8UqyF9dX3mJaw7BP61/caU?=
 =?us-ascii?Q?wv9fLLL9JWuKYfIh0TNGCmLP+YAsc5jpJpG2tl+PGodUjjpO6elayWM2/dqa?=
 =?us-ascii?Q?QVQoaqahsHnpwvWi/MEVnr6ZcUclVge2nEsjdS1cy+D4TLP+kUb5/f1BBIHZ?=
 =?us-ascii?Q?bjHeZNLG/cfoCb0jQ/l4gi/FP2fdc5cZQDV5dUKZ425oQVwQAArfqnJP3h8V?=
 =?us-ascii?Q?AsmVn29QfDqLRKAt7onXzKcAVohKjT1wanUrCH772sAhipYIBWHuxzENm7zS?=
 =?us-ascii?Q?w+ajkcXmz/kXsD+IYUeZ6/18q0xM6AmTI+zHhSdgwU27KCrGVWRkoDXRiFH3?=
 =?us-ascii?Q?xYPLaAKcGRMU/FUu3j68hXfA0iCRHU9zXnS00r5vSPLoDGGoBfJkstvyrez9?=
 =?us-ascii?Q?E97vPo7dIgpjz7nTj3IoNS0rqvf/9UO8RPWljnQwd3MMurBEcupWsgFDj7Nw?=
 =?us-ascii?Q?mWJXLyJFCiVXPp7rtuKA8TvZ8GI6K4gWcECtNmeLJxde1wU+0xS8rDim4imR?=
 =?us-ascii?Q?hya1nABXU4giZnPx+3SKGfsMizcXhtgi1vFrp7a1vVlmE6NXTLdKZcyVkFd7?=
 =?us-ascii?Q?VaCupqkjbsoPsBcSvjJGsXiEDBYFz7HAeZOb60vuzCdHItaFzis9epCmQ6nf?=
 =?us-ascii?Q?8Mp53qDgngI0LKRTNdlfjeyFABrGFcRzZcs2Y4c624RwtSjf9qnJCWWDVh6j?=
 =?us-ascii?Q?6EO+3xjhR6F6gTUG6khhsRQZPEhGGCkDz2hnjiXG03iqPLoeNj2Y0HRjjEJB?=
 =?us-ascii?Q?0uwH97d2cUXaIMc21VdlFLaFB7ZrhDBHDlYMKNeJPvJ3V/Bgev20y0gjSFLG?=
 =?us-ascii?Q?A+OkP43rDWr4fxqB1etf6butBeus3IdWsSs2nGHzsXhBvqdZ/k++wv3NqxYj?=
 =?us-ascii?Q?PKjngI458lbk2LK0yQ6ndBQqKU9MLnuZvq7XD7cn5ouGlGTcnPuVxn+8mWDm?=
 =?us-ascii?Q?2pzideLoi7zwufx4aVW2ugDjIYeNJTZzOSPWg/UDhkwOcIN8aLqyXAz49dgH?=
 =?us-ascii?Q?kvBaX84zGWvACp5o8SicxgOWJBkk6PO25dsM/XE2+L0uSSERsupWsA23wiOV?=
 =?us-ascii?Q?Kmc44BiNiGiYzG2sboplWLoQFW6TA0bV4vVm/zETsmwrYQnlfGTEPtGxA0k5?=
 =?us-ascii?Q?TV3TQpNxoPsyaGn5me3NCme/mcw4CzHfHHSsneyzhfnrqTSxWsZ6bBMrxxRh?=
 =?us-ascii?Q?49vQ7Ac06be3/ekyu9778/1VQPVuddt34WrSSteGSzyN1ilf6QZU?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cedd34c-8d64-4c6e-acd5-08dee3c0b544
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:14.9221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+qi4Mtw/Bn4tC5rrNfGZHL7WaXkPhcI+4txRS/1bZR8yv6GZP/rwCxO/NazI57asyqHNdF3/Mv9rP5a/82o6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

The HDMA linked-list and non-linked-list start paths both program the
stop/abort interrupt setup register using the same local/remote enable
policy. Only the interrupt-mask handling differs by transfer mode.

Factor the common setup into dw_hdma_v0_core_int_setup() before adding
per-channel interrupt routing support. No functional change intended.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 34 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 4bf5a441afbf..b455da3d9b0f 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -49,6 +49,21 @@ __dw_ch_regs(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch)
 		writel(value, &(__dw_ch_regs(dw, EDMA_DIR_READ, ch)->name));	\
 	} while (0)
 
+static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
+{
+	if (chan->non_ll)
+		val |= HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK;
+	else
+		val &= ~(HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+
+	val |= HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_ABORT_INT_EN;
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		val |= HDMA_V0_REMOTE_STOP_INT_EN |
+		       HDMA_V0_REMOTE_ABORT_INT_EN;
+
+	return val;
+}
+
 /* HDMA management callbacks */
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
 {
@@ -203,11 +218,7 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
 	/* Interrupt unmask - stop, abort */
 	tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup);
-	tmp &= ~(HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
-	/* Interrupt enable - stop, abort */
-	tmp |= HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_ABORT_INT_EN;
-	if (!(dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		tmp |= HDMA_V0_REMOTE_STOP_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN;
+	tmp = dw_hdma_v0_core_int_setup(chan, tmp);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
 	/* Channel control */
 	SET_CH_32(dw, chan->dir, chan->id, control1, HDMA_V0_LINKLIST_EN);
@@ -260,17 +271,8 @@ static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
 	SET_CH_32(dw, chan->dir, chan->id, transfer_size, child->sz);
 
 	/* Interrupt setup */
-	val = GET_CH_32(dw, chan->dir, chan->id, int_setup) |
-			HDMA_V0_STOP_INT_MASK |
-			HDMA_V0_ABORT_INT_MASK |
-			HDMA_V0_LOCAL_STOP_INT_EN |
-			HDMA_V0_LOCAL_ABORT_INT_EN;
-
-	if (!(dw->chip->flags & DW_EDMA_CHIP_LOCAL)) {
-		val |= HDMA_V0_REMOTE_STOP_INT_EN |
-		       HDMA_V0_REMOTE_ABORT_INT_EN;
-	}
-
+	val = GET_CH_32(dw, chan->dir, chan->id, int_setup);
+	val = dw_hdma_v0_core_int_setup(chan, val);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, val);
 
 	/* Channel control setup */
-- 
2.51.0

