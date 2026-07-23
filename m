Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FFC40F756;
	Thu, 23 Jul 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796138; cv=fail; b=tBEHwNmxbkxcyOJriqQ0k0w7Dai/1WVJO1Ph6bwFmY20WZgoKL3AdSNOyPBmevggX5AFCgTyuy7TtWM0cEKkVaezAci7mk8QxYBiKGrIHDJCfPbJEommf4tgOTjgaFCsfJ2H0p/Cd4zpleK20u8jCnVh4OMM7e6FGx6Oe6SFIzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796138; c=relaxed/simple;
	bh=Yjh2H5S7U5N2oIjQAuS9yOvmouZnRAkRVW2gYpf08Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q4dP2Q/F5n+3DpnTDK8oCKdEyzfz+ubcLCu46dbZEYKtyuD4Scc/+kBJNIsdZf+jyUnHBpc4TO2wzBlqqSiamLAFV7lN8N+2n6mePPZdMKsZ6kEHPsjMEqG5ssqsRwkdu8xni5+DLQB1P6Pxmy2JPgBWPiYHlCdpEdjXRmhelCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=LYNJSOi3; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="LYNJSOi3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBylioQurVzB3nGDWLmOzWEXBmICMONU69CHdqlCEGxchEmvzv1SC6ei4lBzpb0tZQGwBs24ZQ7qqODLfg0GaDMjT7lc9E78xaFtFHqKPAJYWFSZhXTVaTrcghH8pNLIUFFLRy2jgFHbuvbsSi0fFisofSltZAacnPGtPKhUxCCqRZf0EFMZce4+bjFyW53gpWJa2OutAbqAObNhmJf//x8j4eGZr8rmZ1euXmRM6kiQtfXqPQfGVXllLtgpYgH3RAJG2RfU3eWkc09+LAxUfClLGwfYK59MnO95KvKN9iue686/i45jdVm+8Exknm5e9kFuX6V8rcPJq3FKVEUD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxuPm9hbYPXF1SwVW56asHHG5WOOFS2Gmda7XbefYO8=;
 b=IPmndlYo5NcT1+DPEGOJTB3sHPW15taUIXpktb651ezbC4peSq/FyG4OYBLcYUEhdiiggFSmMZu2j6dmAK5p4UJVN7Lj4fOQKjb/GzRsTHkSgnG5mPHemcOkK8eqFwRZSeEZTXDuf7F0p6Ggn0nGulsWTmYpWJ2/fZ+Wp9+a8TQ6qUEf3HjwXwCbk2WrKrgbNtPVOYMnz8GRG21XgW8wCOzYHKt622hN6+f3zKXqBhG4kw+JmyiCEFjdyEsEvArmonk7f1kAR/xl2cChLEc4tgxv9jkM2i1Lb/RnCASP1Ik0Vlk3IOVczfcUJ/pMtd8cPjM5vXTV6WRbIJsxi5FYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxuPm9hbYPXF1SwVW56asHHG5WOOFS2Gmda7XbefYO8=;
 b=LYNJSOi34c39fdoi0ep2+UwfMZhp2G0Rky9AYJA2JfU9aMLoqUZXhRCiSLU9TJ/TizmOMZP4Mx69Xd0GJAtOfd9R76YSi56L9ZfF5tnKJqdzXbjYiyVYLyoZhT4YR8lnYD7WdP/hPnkk90fYNUyrEjIZ7OE2RkjA1nlKECZuEoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:06 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:06 +0000
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
Subject: [PATCH v2 12/19] dmaengine: dw-edma: Recover stopped channels from tx_status()
Date: Thu, 23 Jul 2026 17:41:43 +0900
Message-ID: <20260723084150.521366-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 634b367b-05dd-44d4-cd81-08dee89646a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uBktGUHLyA80yt4vqAU6c2fHAxxFPey8pYklOW/nbQeOGc3rcukwZFhqib7IdJdVSKm1Llfx7Mn6ZK5bMgH7hV8m8regD0m3lxh0nEIvATUY5EyU977bx7IaHvm6zgjNhRBduk7/RvzKYiMX4xoEaTYRSHlVgmtordph3DHNHjEXB+lOL8PSHLMmmdTuF+3zF36bOgaXNU/ur3frPPe+PCQiwag8JA539E6LuNy+D0hxj3fnqguP1Rubu5w7qUYLWkfZvogAu/JlH597oJDKUFPuSPGR+hoXvV5ZeharvVI1fkOqITD/7bDfZcJ3y4Pa16yiFy5H5l/hnOdYUtOh3vh8m6lSEFzp2nrr+Et289dQwxi711PANVcQjbLtjC8TrtwfKlo64e1u246Fl4IvsGEcrInV1PH1Ly2yWJc6eK1nqqqMKq38Af1I+J1bqSFQaAWgyfRwd8DqQPWqDPklKVX/Viwwlj/FpCGv39JLlklFH3cP7H5UphICVKkBmAO1crXz8xaGiV6qnSoDpbSRoXr8yrkU/kl3cniwc+Vfo2xYTvwLRiRBFfrLBjvlgiM7kuE7qvUeLOPMTyIgAsi69DckpRKJ6vnY07XxX75Tv12/FvcNWh9XOyBp2PvKGu+T0OWTPaeRIAGQnZfI8H5iLqDg1hA77EL80BBtZXUZJnEzj+EktGHlNRXvK3YxGMVF4uErh+ZlZNiqkur8l6hXJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dP6JhWCGeX6FvNf44ziHuKvU1Xzu9HrsROWQfQRTVcmw5Kcvb61ALEnKBEBe?=
 =?us-ascii?Q?l6Iyi/CENyyAoo6m3uPmje1jMSVzrl25rIebGX1pS4Jr42zCOLgUWvvxzlRr?=
 =?us-ascii?Q?2zqR4o+dvTdOqgsI8Cm7ZPaOu9R1mpqN186XTk5uwOJotoyxPt7ySSDC2Sgg?=
 =?us-ascii?Q?YwQV7Z/zlsF+B/tk74GLEtP1dbpLwKe0MRnpjOoJyNl80MooSA7fZHgYkcQn?=
 =?us-ascii?Q?2n6d2zOO2YfLCvMLq66BHw00vN6EYYvjGMmYLeggPDjEQDdmFRPddwfTbFFs?=
 =?us-ascii?Q?0AadTGyro7kCzWlHFwPTsFMi7PZ1BRcrOmqxHgb1o4WmGDQjTFFetib+BfIn?=
 =?us-ascii?Q?x6zuQY8hsy+Lwd3JZtQ5liWvxQ3+42nYKf445x7I+LMA8th4zSzjNJgqyIag?=
 =?us-ascii?Q?J/fBwpWxTfZXlkwaFs7mf1//Ash/1PZ83UZBXyCEEgpzxgAHZCWqSmOm4/5P?=
 =?us-ascii?Q?302U8GIvtjjBxPLanDVHRYb2XJpk8GNr9PrWAGHidKO2co5ENed2iBsyP0hc?=
 =?us-ascii?Q?ndbp0Dxb1tnfYqPa6gOrdqC/eMhD3sB6iTkrbWM4jw0ItKluX0kHcRClfWr9?=
 =?us-ascii?Q?9AH715PlTsBkQvvGUk5EH/0oXIVe5LeXoU4VGgoh+RvBlkh1/jABylu3h07Z?=
 =?us-ascii?Q?VEb3Mt7+5mtiYufWgGVPXDTD5g1mcXXobq8MmLxMpaMC5tFuJwcBA8NrwjRW?=
 =?us-ascii?Q?exQEcEWpjQel2GZIuZ+e1i+WA3l7X5KodsVeuHlLU0XLfjDeiSGAnVMf9/D7?=
 =?us-ascii?Q?UfxRGehEGKqafiODy0axMhWmb+MnfSOJgz3G1E8s0cuLF348Q9UOTccP2Z7n?=
 =?us-ascii?Q?Wa7V9m+rtL3OVuMFReveq1CMp6BBExyjBRofktGzh7N0Ohnepr1A1q2gkmch?=
 =?us-ascii?Q?75IYUugqZbtscZnHBJZs7ILtFXTXnOKf0/Zdf0CUTf6WxnIU8cdW/BTkRx0c?=
 =?us-ascii?Q?0/YncjaTBNy8hUqZK/0WwF/lfu7ZAyYeQ0x3Lx8ippMJiUWZAwnz18t9Enwg?=
 =?us-ascii?Q?87sXs+lN9L2lI6YGpYB4QlF1xLK5VnSJdM+qWgTkSdHcVjaDrB7GGJAfsjA8?=
 =?us-ascii?Q?I841DLMhkPt2uQhsRxztta/XCLnL/qhZs7YNllCS6EROGEyuSC8xKYBufji+?=
 =?us-ascii?Q?9e/oSXUoseeL9OGYRL+hmzwW8ImwOTZ6o8+mNNMesQcgU3O9ATkDjwZaAkk9?=
 =?us-ascii?Q?7YhBbmMp/l03w32nCrSTMsvNQpO8GfPdSg9P89wN9P6IjttLpDmhb/j5kLlH?=
 =?us-ascii?Q?7ONFpP2BD2OTKRN0RPwggyx+8+hvjfuROGYkh3oPhk/T3mD28zhcEgacenCk?=
 =?us-ascii?Q?tuNjYHvdct4oWGRMPRN4vzH53OIHoZDrYT1Xux+z/fl/1BuDRQpmk3G4YHCp?=
 =?us-ascii?Q?D1udj7tqqm+zXnMzJaPGVia2WF/ngBHXiei6gWKD+BguNTLtnvLM9n7N9PS6?=
 =?us-ascii?Q?CYMox93/47SbHlc+nlntzqfRbe97hXDm9jUXkaoNbRC1YWVQlRK8Fx9N1Nel?=
 =?us-ascii?Q?zyU5hhYm6X4S3RQLmSbKOE1W0A8JtuyNDE5TuIjtlp4RgJvXgb0U7Gp/qYMJ?=
 =?us-ascii?Q?8VI9PJm1wi8Mux/hCSueexYG7zBmkQczT9d9YFyI6sHs56qkSU9Eh7Pm3Dol?=
 =?us-ascii?Q?Eom2fL2ASeAyIpsqtuwolvBoEovuXbIk0De/lqASgpInWJVn7s1ex2+DYJMw?=
 =?us-ascii?Q?STgRC1Ufx3gdat5/i5u5KinGXL4yIWMo+nE6rVrU51ptcjWhrx9o6AnwsA7v?=
 =?us-ascii?Q?2cdb6scuJ/1qFLkMYTN8ALaIvZmuR1Gveqo0I1GwsSh+M0VvxgNf?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 634b367b-05dd-44d4-cd81-08dee89646a0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:06.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJVqhBbzAn4pAyT238xvmRCLVmSKHqRI+wA0hQFMtmcPLtIM4MALgueU8BM9GxtkXjHydOy9Nrm9tFcqF1Txug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

An LL channel can stop after an append without another interrupt. A
synchronous user may then time out with work still pending.

Let tx_status() consume IRQ-recorded progress under vc.lock. If the
channel is stopped with pending entries, reconcile a fresh LLP boundary
and re-kick it. Do not use a running LLP read as progress because it can
move ahead of payload completion.

Refill the ring after consuming progress and update BUSY or IDLE from the
remaining entries.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Replace v1's raw running LLP poll with IRQ-recorded progress and the
    common stopped-channel reconciliation.
  - Reuse one channel-status sample for the stopped-pending checks.
  - Refresh BUSY or IDLE after consuming progress.

 drivers/dma/dw-edma/dw-edma-core.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 9489ca7e70fd..3fc929a6bcf5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -192,6 +192,14 @@ static bool dw_edma_ll_irq_is_stopped(struct dw_edma_chan *chan, bool stopped)
 	       dw_edma_core_ch_transfer_size(chan) == 0;
 }
 
+static bool dw_edma_ll_recoverable_pending(struct dw_edma_chan *chan,
+					   enum dma_status ch_status)
+{
+	return chan->request == EDMA_REQ_NONE &&
+	       chan->status != EDMA_ST_PAUSE &&
+	       dw_edma_ll_pending(chan) && ch_status == DMA_COMPLETE;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -654,6 +662,36 @@ dw_edma_device_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
 	if (ret == DMA_COMPLETE)
 		return ret;
 
+	if (!chan->non_ll) {
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			enum dma_status ch_status;
+
+			ch_status = dw_edma_core_ch_status(chan);
+
+			/*
+			 * Do not treat raw DMA_LLP polling as normal progress here. Only
+			 * recycle progress recorded by the IRQ pass that consumed the
+			 * status event.
+			 */
+			if (chan->request == EDMA_REQ_NONE &&
+			    chan->status != EDMA_ST_PAUSE &&
+			    ch_status == DMA_COMPLETE &&
+			    dw_edma_ll_consume_progress(chan)) {
+				dw_edma_start_transfer(chan);
+				chan->status = dw_edma_ll_pending(chan) ?
+					       EDMA_ST_BUSY : EDMA_ST_IDLE;
+			}
+
+			if (dw_edma_ll_recoverable_pending(chan, ch_status))
+				chan->status = EDMA_ST_BUSY;
+			dw_edma_core_ch_maybe_doorbell(chan);
+		}
+
+		/* dw_edma_ll_clean_pending() may have completed this cookie. */
+		ret = dma_cookie_status(dchan, cookie, txstate);
+		if (ret == DMA_COMPLETE)
+			return ret;
+	}
 	if (ret == DMA_IN_PROGRESS && chan->status == EDMA_ST_PAUSE)
 		ret = DMA_PAUSED;
 
-- 
2.51.0

