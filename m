Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021110.outbound.protection.outlook.com [40.107.74.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAB43846F;
	Mon, 27 Jul 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171836; cv=fail; b=sOiSuFGGpe/gdiGMZoSMTnwtKdyE2QS2hgOclH04k/ccb15ijvy8pAZTLWWqY+KzxFTgdF1/zaI/DOeRfAlGFgbxjSQG75HEfujcESFHFX8/cUcOEA2RmrcxesX1vh4UzHBeIyUlQEJbowJEyUbYSjBsZAuhBLizNZ7cs2oUUR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171836; c=relaxed/simple;
	bh=nECWvSrZ1JXvdJBJXn75Og3T9a7vPIWsQhAUCWQsryY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7o7RSTiCdWwjTJmbfovjBIKOV4hYJYawcYsXaZ7cvXpnW+O/pavfmWB1Lo/J4jyIoNvkH71/PsJ27ok6Iz2Mm90lTYG4T4CqGM/MEQTyJpcyZZaeIn4AD8PT0+EkDrsjO3lt7Ni84R924o0flZUmLZiaAdw9e7vttirJ1ZRLgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Eaa8dYj7; arc=fail smtp.client-ip=40.107.74.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Eaa8dYj7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQpffo+e3SUBPDuUTKWoh6mAKkCsY4sjhGcWyKy98HgCVB9FQWk6ISRdx89ntowxLRrIWmJ+85lHbU+fNE/jcsoMQflbSTtKD8XuZ5J3Kzfm3evDBHEaF4x0w8LJEtGy2Ddco1Jur+EPcSrzlD670TsH+iu5bClEhQvCJu50egLPW4Pvj0CQgSNid43YnJgEZ7Yr8zDWXkp2ooAO068JSVTUDBuOIKoiguW9At8d3DDVr/1sed3+ZulS4e2Kjqkq7ImFlPcicIWnyTX29gCqNObcUU7oDBUOXEjjr0o1xPkWhP6kSRkyYhQG+AFNoL8XstUpsIL0LCrjlTsUihMA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU2MwMZ5eyviVjsB2qVWowFbHsmXQ2A9HYsrBkmsjT0=;
 b=bd2Ez04lu790Po2SpoAz08DuoiGeKmJbFACTXrdqJczOkyp6UcfrkhOUC3KKKCBM8i9SgLrYpHqvO0070L7Xzfu+YKqpdFXV2DRSBlyghYr3mZR2iQE6ccaF2Rug+29pYHqWqQkZ+gVzmlYiHW8u+XWq9aIqlYnz7OqasApZEGacmiHhTfeprYQW2dLUx3dRxa5qPLRhlBN+ki08E3BPOZ2ZPKJU7Ek43fKf96+WPVZr/Vax5LkS7aWCEVy6C/9J8xQc3ZZdyWSuzJL+RiOoJBu/SdesPy7tBtl8CMBMJE+4lva9lzawaIctlLRxKfhbRnppsd/Bt0MBgC3QdEjJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU2MwMZ5eyviVjsB2qVWowFbHsmXQ2A9HYsrBkmsjT0=;
 b=Eaa8dYj7DMcVVShG/BO2ta042EfOSSGTnXmYD2uaJbf5cidZNPRR5BLJd2bhg0x/F+IfmIG8TBWAVWZML7Zzwex8JxJJfzJcO9O4PIwQ81UtsJGLLOXerMQ0NDM86X39HBLdvJt5e1j/rVX9F1UO/1yj5S2hGcP+moAjWL4bBBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:47 +0000
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
Subject: [PATCH v3 20/24] dmaengine: dw-edma: Dynamically append requests while running
Date: Tue, 28 Jul 2026 02:03:19 +0900
Message-ID: <20260727170323.2321369-21-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0363.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4c48fa-4495-43c1-74ac-08deec010645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5UXjOBssyCi4hQgHGaRNBMNkHoGfgrKj/qEJubhBg6ZnIJ3bVDZutHiwrttiKrphX3c15h0gMhULqcMzuuYopvcIG4ItGiTpSzCR2zNJrzaqJs74omWIG+bfjYhzNg0lXjOdn9pyF9HSlVVfL+flZAiqjNTnZnje72ERXijyQ5OFSL8DDY122doeVCszqqxYsXyaH60+Hk/maZtJY3D7NC2LkW8TpPgD8T4DHp3MRmyFK9Jgl7kXgvXKFLsPCDmdjKyyVMilGaGNCZHR/elWINoQt5OTbn0wIICwq2/Xi2CZBlzbu9Hdulc2ZC4hZJXgmJKxzAKprHZFtDfAuSJjyN4ZGmEJ0XxPH07gvTuh9xQpcZukXXFdm0pcBh2lEXsRW+M5Oco2f51A8XJ6khfa99Zlm/d7Cy8SPZjaWO0nlUQT/96O8SI8gUQ3d+X4142xi+0D2Swdptfb4gEh7c/PWQrgJNivuVkL1IHRStGXvTp/fuJlte51IDsTr2TVbJong2YDq44+tljgIFijCrXYmAvvXNBt7IxVO8dTXOrTPCA2rIR1+wwCvxt6cpZW262y63PqDIW2Ld3B6GSz9lNdvECYH6X+7mTZM8C0LOajqRl8FypeNY1lgIMJOtEZeanES1NLCc1800jLJgZG7Ao6FSfFOop4BTwLRmJle2OQ7n/UN39ZBP/SRxKcYgk0kymBLXEMyToyzh3UyCUgg3G0sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cIQ+zS8rsPfEIUX7GfzMTjPQT7OSYXT35Wpt+sMqHHcwU9GYcLsQcXY9mIMQ?=
 =?us-ascii?Q?p6gcYQ7mB3zWCq8l/oI+JRMLyGAD5wcOLowGiUhj9THPoqZQXU4u3KyrXzJG?=
 =?us-ascii?Q?VTv9ZDN50sRRcmViI9PRDx5bDom+X+cmPyuoir7ZoJ/+KSqRvCCFiB5bDFkB?=
 =?us-ascii?Q?wXVS47FWk0m+/woABRysibz6IxavkDPccLOCGUVc5zgs3tj4L3h9dF2GsuoL?=
 =?us-ascii?Q?qMZq5XTWg4LVmEwkER8lkZHtSqFnSYS/plMRvPULVDptxvRqudTt1MKzSuTc?=
 =?us-ascii?Q?2ulzgIMRXFq2+sweVRQcptSw8t5CaEluKn44hZ10BLh4IIbP+Lcl7FWCL1nc?=
 =?us-ascii?Q?QrNTOJ1cVA9lnhSsFuxysdW4PjSOsxmPV86UaH6zaB4lwiudVaIRrXsNiEIS?=
 =?us-ascii?Q?hoHagwKfpiGS+BrpgDmPNPDKiTAaFfbaANzOuFmRB4Yr3JTyKLwMysYp4m6x?=
 =?us-ascii?Q?SosWz0PUWqxzqq6fjtrTH3+stvnl0wGOvHrhR1Vt6Bmc5JFutKj9CECZBRaI?=
 =?us-ascii?Q?WQ4ygtf7kzntEcyNGhRbBO2HtGWBDe7SETBohnEcrEIJJczstgvtmJ+WO/2l?=
 =?us-ascii?Q?c4q4VAvuLG1iGj7N1osjwevsZopMC4LNKX9vkzDut+H80M66qULnFb9N6QGz?=
 =?us-ascii?Q?NUqllNHBfRZWQyqutK/xc0UidP61VRPUFaHklYKapGJQSgl+r3BOfXWS84Pr?=
 =?us-ascii?Q?C71MPZ08uzosalK5lmeWb58bWxVAczpWITM7VCqcwYcTVcD7nWwX/gtLYL/1?=
 =?us-ascii?Q?s+/N4JSiESL2lgq1C+3Gy3i4tc+BAL3UWanA0jZO+M48PQhNuWu6IkfXHWFC?=
 =?us-ascii?Q?lE8LZ9ZW48DZqwKDxCkXbWbPsxPaltIv4axaPHrJRjYY2Er/66igJP0pVpyp?=
 =?us-ascii?Q?dg6P2APhARKInOUgDp8HNT1uKgyo/kS1Sfjvje79RF7nkfQ1Tx8B+V8OA4Z5?=
 =?us-ascii?Q?wjQqkFD4GDA3yZxK8S0Ga9HUOzC/IkGbmwV2OIqM+jC5334yhDAoFAdnNaxW?=
 =?us-ascii?Q?vVOUUEzA8NdQF8kRWo2FIptVkdf+eDm587NUTfM6kwE41pBad9sOqZ+B7Ltg?=
 =?us-ascii?Q?6ZdTopoUBgq+ifvhFvhjQBv5DE9GtDwRWwL5b+t92mfHPl638frQl/7+BU8G?=
 =?us-ascii?Q?20ag7OudiQRulzfIsPyAijmXXNWlGYqPqxIzsodCjkW6+SUPu5xdo0K0Tfsz?=
 =?us-ascii?Q?8OzFGkO+8TK2KRm2i6phX8tCbBxfMHWG7rKptJ20aTNqbJGob0W34XOBR1dY?=
 =?us-ascii?Q?dQjPHfYGuuyvQvS1hDu6VQyYHzj8YG4OamSuLk9HbZk54oA0u67aJiKrIwn5?=
 =?us-ascii?Q?ZhY3s2RyA0oHjlRtYgFhFXniZMZpWWTd6sgFDVmvnp25//HLKtl/tGG3YNna?=
 =?us-ascii?Q?W0IcBbdCP3pXGV3TTmabpcUtXJzfal+YSHEfXKNAZpzhshQfI6tlCyD/m89m?=
 =?us-ascii?Q?/hjd5jZNXJjQp8WV0QqO+hQkBMcMKVmeVmem+feH0+IOfQeyrhhzWu2ShdBU?=
 =?us-ascii?Q?fivPHmRw3cc0i7VuEhDgU98BIpHH3zQHTxfy1W5VJTFlT8ApwPVaLX68Gb2D?=
 =?us-ascii?Q?rdMKLg7iCl/DTD2TNF0wrpMz3jbHkbnDI3aYeod8zZCDx2rs3bJjR6YFGdl1?=
 =?us-ascii?Q?sfVAESPDSyeOypIfuMcc4wRp37DDSwkuXSX5SQGEeO6y1UQbbPN8hLHsZei7?=
 =?us-ascii?Q?pn7RjmleczR/GBWz3xE3HxiHB2CEcOXZ6i+9Z8EYPEIrk1onMDRTxCUvXWGO?=
 =?us-ascii?Q?0ykWc/zBRm4sdEg3rAK3ANHQ96c0I+pU8gERS1ZWdGPxr6e5crEw?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4c48fa-4495-43c1-74ac-08deec010645
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:47.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8IymbwORv6UXcfSTq4EIn0AQw1y700ty8eOUnu7UDHjCqi8PteEPULRiy9lD11BcBMGBkpLuhqaSCdBh15boQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

From: Frank Li <Frank.Li@nxp.com>

Publish issued descriptors into free LL entries while the channel runs.
Skip descriptors already fully published and continue with later ones.

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
Changes in v3:
  - Adapt start and append paths to serialized ABORT handling. (Sashiko)
  - Move recovery gating to the later recovery-infrastructure patch.

 drivers/dma/dw-edma/dw-edma-core.c | 53 ++++++++++++++++++------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index bbd417e98a9d..98b8732a6cb0 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -382,35 +382,42 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
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
 		guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
 
 		if (dw_edma_abort_latch_locked(chan))
 			return 0;
 
-		dw_edma_core_start(desc);
+		dw_edma_core_start(vd2dw_edma_desc(vd));
 		return 1;
 	}
 
-	dw_edma_core_start(desc);
+	if (dw_edma_abort_is_pending(chan))
+		return 0;
 
-	return 1;
+	if (!chan->ll_valid)
+		dw_edma_core_reset_ll(chan);
+
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
@@ -896,6 +903,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 static int dw_edma_device_resume(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool active;
 	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
@@ -907,9 +915,10 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
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
 
@@ -970,9 +979,11 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
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

