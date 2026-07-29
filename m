Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021126.outbound.protection.outlook.com [52.101.125.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C2E4F7991;
	Wed, 29 Jul 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335467; cv=fail; b=WqBhUj8TsNTcmAtCOnykPVbfoRUFXjRFNxfDJ2QLobnGkfpu8JxAUbTAtgbGwUUe9sgqCzrtLs4Ez2nwO1jZcwWJOwgb5ren6hrMEPYHFPVLSH8dzhu8AEIwdQZXIWS6lJPPUPKD2K9j/KMexgK7Uc+GLFPJETMgMg6ebNBXBGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335467; c=relaxed/simple;
	bh=b3NyGW4Yva9z+r7amlNZXEs+IyaOZp/ErA+UvndCLcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B/NOeO/mAEQMMdcsm1FIemR5F7XSVgUHXOISoHJ+++BOA1Fik8DL0GLWCABjDeQGFT6hv/tc7YsjQyu0mi2s7CiE5oqEuI69p4BxA1fpS5CRjLt4deduVQLeCVGZeYB3uR/uI6uqQlQcb/+yo5fqxFs5nm+xKMM55ecZxW7D8i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Sp7QcTVz; arc=fail smtp.client-ip=52.101.125.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Sp7QcTVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRIahCyWBz9Z9Ve8QdaD6J5rNHOmXHtsQMSiK1pHYQT2SXhPlbSlXzdc6uztVfA7w0NnpgI884/dbZ9uWHxqCOUZxhkbStzJ9J8PkF5XElBzPCz9yW42Y3MHzHbzzHGBFffZfgYaio4Kzqg55rjxXAE0JvQ5Lr6g2UFC9+s2C+87zQRgk7Q5Klwvlh9y5htur5TvEVnBEYIaUO58uVp3kmUGAx4JreNSxDvx7BUyXRODoOTb74jIr9UZ1Qu7rtJkg0PMwSoHKv4bMh8s498oTN/fEHSxANMAa5k+m4P08Wf9m5aHWg24fHd9XaN8av9xcui5kjDJgUAnb07OjPNoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/luh8G1KCiFYkcJIWsuJWW7D6hk5yEseeexlm+3SIqk=;
 b=GKZoRVYTvYV49R+Z2mMPV1skikpacpNRDv8jNK4gom6XcrunnQuIq/OzbJGM2BoP+rfmqrXO6TFK/blCchSW3amHhV4MRPnteWtsSzD6r17lowd+4cusw3fuodPaIVTP1nJ1FywleMxNtxepYlzcz2BSxME/Xw0IYB5XrTynBdOgMrGClivKLk8vjbrcmPeXe+zTSe23z9uGW74nx4KuC9elukeJzPu7GrO4IZCFNAqnao+gROR1PSsHK/rnGpSaEzI2/nsLCRRAQQQeZ8ESH+1qN29MYFUjOwivRgSv80+dIXMtglJEJVtQGkd2Cuedo6TWYHi9UyGn4UuSUBxa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/luh8G1KCiFYkcJIWsuJWW7D6hk5yEseeexlm+3SIqk=;
 b=Sp7QcTVzyTSIGOU03Qd0B3XyvjwR8WCAzHeqPjQt8d5rKO2ACyrRt7RoOcM9b3lTJ3CKejZiY3UxjAZKCD+2+Jj56Z6CFdARgCA9y2ing5Sm9MxNnnhT65BBM/RJofUm7yBDXPgmX2QAYJTRrXxPedawW2GNBPi90ED4oYLYGF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:57 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:57 +0000
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
Subject: [PATCH v4 20/24] dmaengine: dw-edma: Dynamically append requests while running
Date: Wed, 29 Jul 2026 23:30:32 +0900
Message-ID: <20260729143036.3087722-21-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: cb76e6b7-582a-4af0-bc96-08deed7e0153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zli9ND0fsZ7KbXKvCnEWEyUY204Am1Ehaal82yQXaqTY1t4JVhbtOBYgvGWKjvPeenV9kYPBVzudV/lddXRrrrC7hXVMGggclGSAsqKx2tF19xct2gP6aMZBz2YMxQ/0PTQzIOkeP1l5MuYoK6zyjJfF4nJ+jbntUKblcsFV3QZBSB87y9pPZ+JmSt1Xio/OM8bcBxKKrCS9TOtAu+GvLPdLHOBAiijlJnMYv67nvIdkLN5rd8oY9X+RaqI43oZuUQxBJ8BtK5rNkKgNC4QMgVqlso5up6REaMduYl2jREgfgLeAFKX2PZqMzNDEQ3njtoclBIsuQ2dIUEUx0yn1YngR2YaI3yucnJzzpddxamYCcmw07DyUIQh5zlyZSTJhfjr0AuDl5Fg+1SFa8r7/9uZZFFDTFN2FppO8wmEV614plCmujxTk0Gtv1E1wJyNrw+tHuapBtSGfmZEZH6X0Q05cLZfMUo/VZquq1U/Z1KHXi1cANBFYQwc5NVAdgojESnV6z9wLroqFX5L9GL/RTwlWCO0RLZ4FF/STNpwQ9zJfGbV0dQf8KDq1Tw1Bb6Ke/jZmMwUWCJVvLYBwUtJ/JQdB67c8KNiqJzRoJZoOZKdp9MIA6anNr2rGzqL854LP1sUsTYW5g3/9YPVWNs6I2YGFRWlnaTnGbQ/NqgtYKr7Gpp3lXrsuI6pg9xl6J9sPNYGSycRAA5WBLnUGR6K5gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eUiW3FPhB743Q/ytdP4N4fhuLicm5Ifvamzry5ARRL0TxnRj+dNY8RJkevIQ?=
 =?us-ascii?Q?zRY2pyL37UR1dirow/72eJFaaTXluu/L3dQhsaXoCJO/Cy/9yhnPTFbPwHUX?=
 =?us-ascii?Q?dtRR/ngbc5fKVplPLuKoBttWIwCQd26aIChFyKSXqaf46MKcaVRrf7Vr0imN?=
 =?us-ascii?Q?H2txmFMyUXGURd8xXxb/irpsFXVThqzrIyIacJfmo6Wm62r/R47CyiavWS0/?=
 =?us-ascii?Q?8oA65F2O7J2CxLpvJlUqimEaZX41HQbtHGIpUy0HkMdKRmxt0aPpwoxaT1lm?=
 =?us-ascii?Q?6bES02fauXZBHtjwWWRGzabRJt+GuWZf5ZGOObJWfKmv9HfQwBxGp8spV/zz?=
 =?us-ascii?Q?5J0PlhnKd2QhSnhjHu803OChUv27mbdEIJE/uUkyT9P+7jIGLk3VMcZdLSeh?=
 =?us-ascii?Q?Elt6WRkMhsGlW5jEh9vzRVUAKv9pMT0BLNlpi3dxjCvgmFQGLfEYGTJsttQQ?=
 =?us-ascii?Q?JZY6fWEVNutpScueevPr7qRpA/l54qLTR02wYswbM/ea2KG+WEI/5+Emf5Bf?=
 =?us-ascii?Q?e4rtq9CbLRtAhnFY3JSDeSH+FrLvzKzm0W5Xm4MXZ6Jj2w3lZrfmUFk3tSAF?=
 =?us-ascii?Q?Ja2QETA/ssUuBo1DsZciqO+31kB5/YhObx/WwyEatgnMUImh9WdWXo9yZer+?=
 =?us-ascii?Q?/xLttxLGbjD/S0EX45TP0NoVSyH2S56ErpDse2o3GuLt7IIidojLYSNtHCDE?=
 =?us-ascii?Q?RKzUPllgGOufFXMwuN2HyHwekP98QUJFku+WTGeYxY+CaQptl42nrNnJsJ7O?=
 =?us-ascii?Q?XJzfLcdBDuIGk2iaCG3IUdtk2244lRP7nbAVNgc5tNF1oO53LEbw0ZIlvstw?=
 =?us-ascii?Q?l0XWL7ZbFQaXAHg2JbsIEYeY14YKhDu9a485hfAnFp9uvu8psclXwU6brZ+t?=
 =?us-ascii?Q?m/GJaB21rGn+vQMbE2nAFod99QF+lGJBhwUPIDTNAMG3BcuR6f3GDG0+XlD/?=
 =?us-ascii?Q?O3yJU48iGYr0zcu9hPAI+sykkjh5Kft1BtoJUNG2KKqQB8+XqeELxY3XFDcj?=
 =?us-ascii?Q?gwgBYAqO/Q+cDzNZCUspzUGw2aFF/f3fKnaCvBFv4sDbR5hSpJ+BO3d74zci?=
 =?us-ascii?Q?t9Zza38pgkZGqSwuEOeFVc+srLrf1oat62ENP5ifagHJigDdFUOkpGjRQbYo?=
 =?us-ascii?Q?lLn7Z0meVm+riZO6dKQlIz5YCMyYNyxGm/mKI3QbQI8mNrby/1Jih7J5+JL0?=
 =?us-ascii?Q?Pbn5nP9ay1xiUW24EJnF3JYTde57JTP/VFOkfsSI/TqDFCaeg46VbSFwXlLY?=
 =?us-ascii?Q?9wgLQXZJvNvfA3vgy1jaqNNoZ3py79q2fDu8Ygx8vd6PBpFyM68dx0l/o9Cs?=
 =?us-ascii?Q?03pShpkIjTxvXQlbgEZB3f/ptmc0tNbrQFL5c0diPxtx3sv/7xfouPJxkgvS?=
 =?us-ascii?Q?/v6SxWRwcvy94nlhUaTWGpIvuxDcYcB9cAAcPUMpVLxMj0NZtVT/Mmin3Fxg?=
 =?us-ascii?Q?P8c8bMQFa4mBRDBQdYe0ZY5E1ly9ggEP3cYDqE7qVs/RKTpxQ0dHn4foGjQ/?=
 =?us-ascii?Q?Pzzb57FMSvosWGHO+vxHe4mg4tdD/whEVyt3beYTdm6D8byJikJEzYUeRvMI?=
 =?us-ascii?Q?qTNU5bg3AFTt02sKdWsnp0FawVp8BfILI0IrPyGyy05E7Gn5rHRgE599pRmS?=
 =?us-ascii?Q?JOfZKMC73xFX1A1/Aup6+2S/fqSj/cwMCdqZfen3nR5bOZ8haSSBd+CPYzB6?=
 =?us-ascii?Q?O0KxbEq/IMeZkKyAKm63+attjAeL6awAT/xVKsEYvlNMaPYPR05N6jmno0nv?=
 =?us-ascii?Q?JSlAAZQ4GzBMB28EpndS69p52grXYN9mFyU9otMmt8GVWnFiv02N?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cb76e6b7-582a-4af0-bc96-08deed7e0153
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:57.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e97nnBUC/v3RwaMz7LKMEr2GBTqk2GPPAOjfp77x9mabKEX+dDnhjrDdhikzxkiOxy/oRTUs2Jzr578v6JU/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

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
Changes in v4:
  - Move the "more issued work follows" progress condition here with
    multi-descriptor publication, resolving the bisectability issue pointed
    out by Sashiko.

 drivers/dma/dw-edma/dw-edma-core.c | 61 +++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 977392689205..cbe60bcd4c9a 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -311,8 +311,12 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
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
@@ -379,35 +383,42 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
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
@@ -895,6 +906,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 static int dw_edma_device_resume(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool active;
 	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
@@ -906,9 +918,10 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
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
 
@@ -969,9 +982,11 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
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

