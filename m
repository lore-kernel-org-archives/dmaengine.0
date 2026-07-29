Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8364DC53D;
	Wed, 29 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335465; cv=fail; b=UESui1m0MhqavDjlpLlVFQXY/xeyUSmNA+fg3dDBz9YJTdUijehIWGvHqV9h5o7/sVEd7oXaG484hHa+VQbtVHlnLXcCYyUh4dlnBZcKLg3XslkKwaUqshwHMM7aQpRDgcTR4iuS2M1YS8oXMYnYo90Ykm28t5q8+MTP2AEiXdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335465; c=relaxed/simple;
	bh=+0s7XsTFci7dwTWPH4wBli1Yzh5S1wK1wavYP4feIZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s9q6s8QL+9fgHvEcZHaVKo5gnXItIPLE1BRrlHK8yPi/XKy8VFUhTOAtfyC31/NxbiJuOugZ00OJeC6mjECA2z0YBC1BplR1N4twHG9AbF309jgjhAaQ65PRD53gsWWZK9LojkYT+IERnqjMSwV7CurOed4bE8vDBIR6Gql71TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FNKQGdJx; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FNKQGdJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O46APa4UAoQDIS3ZxN8LTdfjh4bJ4tKPsbMj/kyZa15kkuwyIKVD+9qMiD/o4qM/GPPEuSbdTGuLaUOmV4yboxLd8z+QU0tf2742uocj0T330Js2F+OwsO1ErgiLqxHWw4KjtBMo8spEWgHgatsvHB+B6vSm0S/C/qjlTacxi7TOTvyQEQgVe1QOgkltgeNXeajStPc1uoat3lSeE6X747rNCdMhbMue8CD/8jUpaPOAyXw2KGCGIE7gN6F89Q4TWITSCRPboBh/X/wI+xpsSr6irOnHT3/nm1EMK9ferweFzjmdj1PgHUPDD89xp6LS2EkUrlnpafeQLEezEJTi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4U9EnI7WaCTnN0SZL+62DM4tu9mw6Z5xoLCOpCZBTds=;
 b=ROSYpa26X35xtYR3N8lvS+cYun6+3quHS6kVt9sOtB3WzUcpCNmO4uTQGfgjI8pP3yapPX+srIphpr31GL70kM+VkV+OHJtqJiMg5qM6dsCaOtTKGFGvi2CnavbZ+RCbtO64MpNXfihuNAS355+aC54Mha1hPghWg/Q6bqPDKJCogX/vIC061J/sXOv8XgrxEaBJjFN95EitdS5pz4eg4xdcfx4N1L3QqYIfsYT6yNiHXnrNO9hnhZJqQpqb3THZqATSfCQRVkarHPCuzSaTZhbYaUvxWsNhlgjFStGDKJ0I76puMWbUzqcftZ8qbJe/1SouflgKJkDRijbgpF1gEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U9EnI7WaCTnN0SZL+62DM4tu9mw6Z5xoLCOpCZBTds=;
 b=FNKQGdJx6yD6b8LfJe3cQJDB8cnlpt8xhn3oNdRHoqzgq++yx+jZdZZS2Yizltgqu7ZMvTMvVRPaWoDK/ZMRrxvMb0/zWJJ6ghbUQlSWlzsQfRJPPT8K+Z118Qq8ZIzkOW6pEw+cBPRZ/YpibzpgmGd+cd8CvwSgsIQVYPse0uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:56 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:56 +0000
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
Subject: [PATCH v4 19/24] dmaengine: dw-edma: Drain LL entries for STOP and PAUSE
Date: Wed, 29 Jul 2026 23:30:31 +0900
Message-ID: <20260729143036.3087722-20-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d7d0ac-54fd-475e-e42d-08deed7e00c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aKtbD7wFwxuflHvQ+K0iO3L7vRWUFbSc0Y/iKkulXA6+CjGH3Ckmt6kkozni3Eeg6ReNN/l0OJ5NV0Ekwn3XkmFiLPGFB/p49YsvgsZilUAFfu6LiS8/T50tfxlwYON7X3Qcu3/F6fZKdlz2FZzsgzhvdZCECw865NQnz373KfT9sohGnHsttlt93gj6i3Hd/q7ZTcXt6ZggYjYjYN/ZcHPXP9OIJ4UvW0jOg2vh+PY02k5g8E9OA3iZki17hv3Q1+839hC9NYlKXZhi7lsqRKyG6pn9QX71lAVY76JG4SJUt/OpcGoPv8fJp0RELNE1w5G3sgYvQ2PpnsetJhcenzZZPn0YkD2WCCB8U4SuVcNldRPct44T6DoboiBPPFkFank3jvRrb/aSmSTKKlKueSH2Xwm3LTg90rAImwoiqajjRsWWzqPYm/1K8o8rNTDLx2kpoDIRu56+pDTquzOyWGS8XSTKalroNuWN5y5vOS1huWS6KEoT1l9cRCKGvxCtEnvgqxqo1GjyadJWwN/4FgZdAuMvJ3+h+tIBYt1T92/EtINNlS9RtiTUvDWukrVoyO2d91K851qLDXyJyjEiN6m/JJRp1P6DAdBQiykbhkYUInDoAPZsvbaBouIIZL55FZH0BiBqR2VapbiLbxXSQXWLKjlyjX8IUHBEeo30OzITJVo3mFitcqrF/Go0ElfSmxH4laTYlYSjE/5BvsGGsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xcd4EDRnAaU//W5GrkqB8wRHDwxD3bVl5xt0EV+iYjjcOAAhRVw5VjzSaf/h?=
 =?us-ascii?Q?049ywCSvBz1+TJNM7NFLj6TVel/9H6NDoHo2ipFuLmLb/UY3Nfbz/XagASm9?=
 =?us-ascii?Q?kBFWpHBvg1JSWv4vE5u1YsVbUHYviqwjvu5xcTPLP5/vVPIvm9JdiKsaZ40y?=
 =?us-ascii?Q?d1IhHpV0Ys5zLa4zuZYOByh7xIAb6s9GaxRnDMzQC6GxTfWyaUZ4ZsRoot49?=
 =?us-ascii?Q?0cxCJ6gnOYgDn0dSgVHG41cX/10ldTEvB5lq0UZap1tyKNLEwGR/bbtixLlM?=
 =?us-ascii?Q?vVA5TX1BSP0qujlvEfyeE+1geREnvGbMiIHpKL92tdHpRyEiY/wm2jEQZcMo?=
 =?us-ascii?Q?uuKrlcoKpfgLn4p/fjrkjPBiNQlxv7vxaQx97uxmhX8klYLgBURu+E637984?=
 =?us-ascii?Q?SRvGx9m8aPDT6YHseXO0Hd4fLWm4udgZneP4/iUzKSkYfbx1ksvouxnR/ZGs?=
 =?us-ascii?Q?/+ZpEKhvYRP263WiyCNmWfTwkN8LWqKrbzAniQuvkh/1g5sI86TIsNfZrqC+?=
 =?us-ascii?Q?x2LKH/ULNdldaBWMaNNdCCTX1Iza2FEo3crjMxdB+Fjm5eV/6wdVvIpaiC6Y?=
 =?us-ascii?Q?Rp/axLwMHPpnISZ1XEtSOjgNe1am/bNXJbLEvkiuh/U1hT6Iw+gJFXYoH3Vq?=
 =?us-ascii?Q?FmIy9GbtcTj07UcjSpEoh1UBv4ycHDy42uEqIqQb+s/VvCPdjzJvqrRKYOJw?=
 =?us-ascii?Q?e815TCuFWB/MDeAFNzmIPPlQKPg/fhj4tUXBe3R9XfX1WszZYx77QxkWTj96?=
 =?us-ascii?Q?YTLBZkIBJw6ZAhLOJsNWFQC8KFVct+ppSP3dIhvR7dZHRGSbev5HzZP77BE0?=
 =?us-ascii?Q?p1V1pCfqzW4NMr2Q/RIQokEq2iPEVDlHtVNLk1dTf2vL28wNDIRHRjjCv6Yd?=
 =?us-ascii?Q?pnjgKgCn5uimQSWjCJFr+KcFpEZhOCR+kVuXsWcHs8cintGC+RDe3XLVbl5b?=
 =?us-ascii?Q?r9iML7awk6T5YRkydbezXZ2FjwAIyd2akaDAq+JsoyNJAl5VWzYIgMMHyqf8?=
 =?us-ascii?Q?MXoVKofmv+6NqTIUgav5dLEP1P7idAT8EFe/rO/XkoLXYXjS9hHaMk8rpSeQ?=
 =?us-ascii?Q?z21q8g/Rp6XJFNZatyUvW4uPJHOeSGT+46vXNKcQVNDg/Iku15jCq2z+/Xtv?=
 =?us-ascii?Q?COFHRAY5M/RQNV3aF8RhvXQ7fsU0xruEZvrd7fc7a0xoH0zj9gjyItxjO1i2?=
 =?us-ascii?Q?EGMuwDCTxzD1bZ6WXb11TZl3vIY+dKYQzZI8AancAyIsodQ/YuknABPsFs6h?=
 =?us-ascii?Q?1o76Fz4dyR/nvGlPOtOhR1oJulOMjZvugdXNM+VRPSLGpnwvaxR6z5LcT8Bs?=
 =?us-ascii?Q?459upZ2F72A3Pgh4iy61aWUV8oGoHGqEKIGgxKl/JuKCdVCIFwhUw6FqrnWc?=
 =?us-ascii?Q?6x/m7+vuZ4uYID75IxUAa+rbyb8OvAYpYNHhldI1ehs4ks1GfGqLUP3AGepw?=
 =?us-ascii?Q?+fhYw1PciTtnl4P9FYhoKSSmJylFFnDQmoJJnmkB8a9GT6hdaosjFbX7kS6x?=
 =?us-ascii?Q?veOXCBSshv3tdfO99PZNkv1RXvpLts7hKgYxRtiNtQWo/gnsFMqkvOSkdRuo?=
 =?us-ascii?Q?A7RjWuBRwDH+SMKbYqXnvnLc0BqvoV2LSwLL3H+EecC6WPRpyZ7qhIyTIZUi?=
 =?us-ascii?Q?PiZJCs1tzKOX3u0s0DeSEtGpiy4zgd5kmOsYTlQFNEnwXObvg3PeStw4aZ5/?=
 =?us-ascii?Q?xo0OjObxs9bqnYKXQnmOG8M+iBZNdvcbjxBWABcNMikPZmeGUAuRnL6r38pU?=
 =?us-ascii?Q?o+4ho+uGXj7CKHBbbXAu235fTRQMHRxxr9/YduXITNRBcI1jZ0NM?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d7d0ac-54fd-475e-e42d-08deed7e00c9
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:56.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaHpZUUjDzplXt8CcP2zb/EfnrhefhXwhXu2ilZ9IYNv2S0O9riKpeyRWYKoUBMSEDcwznnZOoeq+m6H7IqjXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

An EDMA_REQ_STOP or EDMA_REQ_PAUSE can arrive while hardware still owns
published LL entries. Keep the request pending until hardware consumes
them instead of discarding the ring state immediately.

With the eDMA-compatible interrupt interface, a DONE interrupt can
report progress rather than a stop, and STOPPED status may still be
visible while a doorbell-triggered start takes effect. Before kicking
the remaining entries, serialize the stopped-state and
zero-transfer-size checks, the DMA_LLP sample and the interrupt-status
clear against IRQ capture. Consume that boundary without refilling so
the producer boundary stays fixed and the kick path cannot clear its
DONE status before accounting for the stop.

If the channel has already stopped when the request arrives, complete
the request once the stopped boundary consumes all published entries.
Otherwise, kick only the entries published before the request. If status
still reports the channel running, arm one delayed recheck to catch a
later stop at a CB mismatch. Native HDMA reports STOP separately; non-LL
completion and EDMA_ST_PAUSE also identify a stopped channel.

If an ABORT is pending, leave cleanup to its handler and do not ring
another doorbell. Once EDMA_REQ_STOP completes, terminate submitted and
issued descriptors without callbacks. EDMA_REQ_PAUSE leaves the channel
stopped for resume.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 111 +++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b0e3f67d3942..977392689205 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -457,6 +457,13 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held after the channel has stopped. */
+static void dw_edma_finish_pause(struct dw_edma_chan *chan)
+{
+	dw_edma_set_request(chan, EDMA_REQ_NONE);
+	chan->status = EDMA_ST_PAUSE;
+}
+
 /* Must be called with vc.lock held. */
 static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 {
@@ -688,8 +695,9 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
  */
 static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
-	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
-	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan) ||
+	if (chan->non_ll ||
+	    chan->status != EDMA_ST_BUSY ||
+	    !dw_edma_ll_pending(chan) ||
 	    dw_edma_abort_is_pending(chan))
 		return false;
 
@@ -700,9 +708,25 @@ static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
 		return true;
 
-	dw_edma_ll_reconcile_and_refill(chan);
-	if (!dw_edma_ll_pending(chan))
-		return false;
+	/*
+	 * Normal work may refill a stopped tail. STOP and PAUSE freeze the
+	 * producer boundary, so only kick entries published before the request.
+	 */
+	if (chan->request == EDMA_REQ_NONE) {
+		dw_edma_ll_reconcile_and_refill(chan);
+		if (!dw_edma_ll_pending(chan))
+			return false;
+	} else {
+		dw_edma_ll_reconcile_stopped(chan);
+		if (!dw_edma_ll_pending(chan)) {
+			if (chan->request == EDMA_REQ_STOP)
+				dw_edma_finish_termination(chan);
+			else
+				dw_edma_finish_pause(chan);
+
+			return false;
+		}
+	}
 
 	dw_edma_core_ch_doorbell(chan);
 	if (!dw_edma_ll_has_hdma_stop_event(chan))
@@ -747,8 +771,7 @@ static void dw_edma_ll_recheck_work(struct work_struct *work)
 	}
 
 	chan->ll_recheck_at = 0;
-	if (chan->request == EDMA_REQ_NONE)
-		dw_edma_core_ch_maybe_doorbell(chan);
+	dw_edma_core_ch_maybe_doorbell(chan);
 }
 
 static void dw_edma_device_caps(struct dma_chan *dchan,
@@ -840,6 +863,16 @@ dw_edma_device_get_config(struct dma_chan *dchan,
 	return &chan->config;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_request_pause(struct dw_edma_chan *chan)
+{
+	dw_edma_set_request(chan, EDMA_REQ_PAUSE);
+	if (!chan->non_ll && !dw_edma_ll_pending(chan))
+		dw_edma_finish_pause(chan);
+	else
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
+}
+
 static int dw_edma_device_pause(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
@@ -854,7 +887,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 	else if (chan->request != EDMA_REQ_NONE)
 		err = -EPERM;
 	else
-		dw_edma_set_request(chan, EDMA_REQ_PAUSE);
+		dw_edma_request_pause(chan);
 
 	return err;
 }
@@ -882,35 +915,52 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 	return err;
 }
 
+/* Must be called with vc.lock held. */
+static bool dw_edma_may_be_active(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll)
+		return dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS;
+
+	if (!dw_edma_ll_pending(chan))
+		return false;
+
+	/*
+	 * eDMA can report STOPPED while a doorbell-triggered start is
+	 * still pending. Native HDMA has a dedicated STOP event.
+	 */
+	return !dw_edma_ll_has_hdma_stop_event(chan) ||
+	       dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS;
+}
+
 static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
-	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
 
 	if (!chan->configured) {
 		dw_edma_terminate_all_descs(chan);
+		chan->request = EDMA_REQ_NONE;
 	} else if (chan->status == EDMA_ST_PAUSE) {
+		/* A paused channel has already stopped. */
 		dw_edma_finish_termination(chan);
-	} else if (chan->status == EDMA_ST_IDLE) {
-		dw_edma_finish_termination(chan);
-	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
+	} else if (dw_edma_may_be_active(chan)) {
 		/*
-		 * The channel is in a false BUSY state, probably didn't
-		 * receive or lost an interrupt
+		 * Keep published entries intact until an IRQ sample confirms
+		 * that the channel stopped. An outstanding EDMA_REQ_PAUSE is
+		 * replaced by EDMA_REQ_STOP.
 		 */
-		dw_edma_finish_termination(chan);
-	} else if (chan->request > EDMA_REQ_PAUSE) {
-		err = -EPERM;
-	} else {
 		dw_edma_set_request(chan, EDMA_REQ_STOP);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
+	} else {
+		/*
+		 * No LL entry is hardware-owned, or non-LL status confirms that
+		 * the one programmed burst is not running.
+		 */
+		dw_edma_finish_termination(chan);
 	}
-	if (chan->status == EDMA_ST_IDLE &&
-	    !dw_edma_abort_is_pending(chan))
-		dw_edma_set_request(chan, EDMA_REQ_NONE);
 
-	return err;
+	return 0;
 }
 
 static void dw_edma_device_issue_pending(struct dma_chan *dchan)
@@ -1251,8 +1301,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
-			dw_edma_set_request(chan, EDMA_REQ_NONE);
-			chan->status = EDMA_ST_PAUSE;
+			dw_edma_finish_pause(chan);
 			break;
 		}
 
@@ -1295,8 +1344,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 		break;
 
 	case EDMA_REQ_PAUSE:
-		dw_edma_set_request(chan, EDMA_REQ_NONE);
-		chan->status = EDMA_ST_PAUSE;
+		dw_edma_finish_pause(chan);
 		break;
 
 	case EDMA_REQ_STOP:
@@ -1590,18 +1638,21 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
 	 * A STOP may be deferred to a later interrupt while the channel is still
 	 * running. Wait until that handler completes the termination.
 	 */
-	while (time_before(jiffies, timeout)) {
+	for (;;) {
 		scoped_guard(spinlock_irqsave, &chan->vc.lock)
 			stopping = chan->request == EDMA_REQ_STOP;
 
 		if (!stopping)
 			return;
 
+		if (time_after_eq(jiffies, timeout)) {
+			dev_warn(chan->dw->chip->dev,
+				 "timeout waiting for channel termination; still waiting\n");
+			timeout = jiffies + msecs_to_jiffies(5000);
+		}
+
 		fsleep(1000);
 	}
-
-	dev_warn(chan->dw->chip->dev,
-		 "timeout waiting for channel termination\n");
 }
 
 static void dw_edma_device_synchronize(struct dma_chan *dchan)
-- 
2.51.0

