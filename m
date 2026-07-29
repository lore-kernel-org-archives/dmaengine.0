Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A344D2ED0;
	Wed, 29 Jul 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335458; cv=fail; b=sk+VkLi3WjCNP8tcaR62/4XqGB7OSr4+870ZoFFmXZV/5cKuhu/4J681PdUjuxZKAVNeBPJOAtRiU6+ZsjlTHJcbtm/dKRChvow0hsa+Tw45SfMSVfBTetbPdfJTiE5yZMBJC8IRcbwKX9ABkTNflx43zWEzQTP63AndGkZ4XrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335458; c=relaxed/simple;
	bh=EnnXSm7GGgP8EbfBHt0sHXEH7ATvs9BjNjdx7UnYICU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rX+5rOd8rlYKL83TTbjdjV5ge+hbFeeGuQFBtWisvVG3dI34ONBM7jnf6s8rk543VDoouK17wrZTVP794w5lF8aZEjUu345D7hguP0utAiudfN6DHtb3N3p4gsnSLNFfgwVyRmCVE0GDrNt6P4aB0zqVIb4dEV75JKvEv9/txhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=AadD/e2+; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="AadD/e2+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfxBqqZuoMs4rWvFV0rC3ufbegqFDU21jQIzK1w2lnA9eBu+O/bmbU7YtzNH9GmAyWN8qnGM7uHmd72t3N4Fo9DezSa3ANHCQStfl3iH1mVkqkXbsgfQyzrz6FQcG2EqQuTR/aLrkHbaBkKlicVilqvCITA9VNmIjlap9VMc6pNYcqo2tFaJOkOsQVGrf3aQcxcJASW4NtUQlXmHtXmgCacKqtKECv8/D87aCb7FPkRYifAAZkRGRBBj2pyAe3dSBzs8HQsSttEOZ3shiXWVmVqdMiOfcZIGHDgmkeJMGBayfA6fVMdTPu1D9l4t4t2zU6QJIxBio1OqMPoMP7NhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfo0AVIB+gPt4Rj0il8dgXw65WZvoVjgSzjtzhgX7t0=;
 b=LllBaKeUbt/quBNMWh5HpweWHB7Kb5cW3ExEGg2xuesN5TETIcGdq61YX+pIvfbj4j5xnA2FJ9wHJySNYPRjMug6XOeUi73CXwX90dqMK25wcB9GlpDf5Y4xv1bEChA+RUyJ0CjqXxaDeGXV/RDPsM2ISJCLVM/DwXL6BzqELVL1yVAGAZ3/lFgQJjOqp2+Whsf9fmo8l45ZfoF/CpTaDV3cIT1MrY8paaFQaO7OxsoJf+LNEHrLo9nPm8kkaLTzZjAg1HFjyANhVzAlZDJSwtzQqPWSGOV+Q8BlpgUSgTo0tLG3dMJH9peBLoQX8rHHEPyYhKawmwPwxiPpa36LrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfo0AVIB+gPt4Rj0il8dgXw65WZvoVjgSzjtzhgX7t0=;
 b=AadD/e2+lKOttw9de1m1iJpKAKFnq63DygmgIXIEJ7D+Bp2VP86hEaXJoxVJk/Sx6/GbnOY3G/tnWD3kXSvcnjbIwJxZPcLKmLYPUumaFQEeTRa4oHB4cuXLk4K3cgQZO+dp8TxBebRF9XKjiyTTijcMtECmbS7qWWnXw31H4W4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:48 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:48 +0000
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
Subject: [PATCH v4 09/24] dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
Date: Wed, 29 Jul 2026 23:30:21 +0900
Message-ID: <20260729143036.3087722-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6bcb87-af96-4c0b-ff2b-08deed7dfbe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Qa+EMyr5SU2awKrCelcMzuI+yZ1pT/+IFdQHulofFUgOGG61lqKtk1MfBw6SlZrBpY7S7FlV3Ix3VOD7lJ/Ohlkrld5xTbKfA9YDReuvUVC3Bfh3dvUVTiVg+mdRVd+L+Qt8YENDiqb0ta+fgqn6gH01PksF9uxp3O1McC2q18/+naL/shMETACApWKjDn04KPkVaP4SbEnMphFoD74bvVdwdcNWzYRQtQr3c2+yrGshPqaVoIL6re4zT7xRuoEiz4Y8B3V1EY2t0Wl4oJmupbX+frSBO8sD2xxpeQtKWtvF5GV9IhSJfyfPoBAys7qfGMW22Hwtgp+pd8sNlKUvhRxBLq8UouI7jni4qhAq/CHDcR0La/EiNcDbGGKuyeM3kyJtF9tgo0suT4OrWW/ori0VRbcPBUTfbJRsz7DaaIRN4ek26Hz23omMGJWMdzAOXW+iNjgFK0Xb+rmyQsozoRhrRB1WwLGv8UeOiS/mOf8R5g/Z3/z1GxfR5xVUiYTN0UuDPEw1NPecGwl3eA0p/r2GoBiqrNBiMP8zeLCmL8FOvnR/asHm7ZptTZSQimXLPkV8YA2x4nAqd7dOuu56Vbj5QIJIM5easgs3xyUhVaNo9bEeQCjrZRVJ1LIeU8fglpY3Ldl+FSMI25lqsvaGwmO4r0dMhmny5GG/a4ZY6rXzd4WyYFB/CYjjzCN1y0eA+V1+SuXYL0nUIQm9KpobvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0Fbb4BheZ4tfgiRiSm72ECoLWmMgVpJUXj/1yHDeDad6TulsiaSxTZajbdu?=
 =?us-ascii?Q?x1hMWO2PBwvIpF0M8E34uru54ASpWgcqNrA3PexX1GzhIKDD5guTo9nZKYQt?=
 =?us-ascii?Q?x7+R2A/sPX7sdKXFYUobGC8b8ePeHdWGtwqGppzYBOzZN7D5ocOB7reSmpHy?=
 =?us-ascii?Q?2l3mNBNePVN56FfNTr9L25I4zNNrcfduseWlzEjzlpG8ExeI9Zz39rsBLHd9?=
 =?us-ascii?Q?Rj9fdrG2+yPMxnziQCg5O/0p4NjjERutEtZLYriDg5S4iKc2zwaD9qYx3R6v?=
 =?us-ascii?Q?4jesGMi2xAZHaBvROdYq3zUn2YvDP8LyeoGNn5itC3Ro5OrrRegXX0wHFiQJ?=
 =?us-ascii?Q?eQ1FnjK5/5B3jV+TILoQiRQ4Eom1ipJHyjYo8MUt5hiHaANvcK0llxhdQzOy?=
 =?us-ascii?Q?9MRwJh9A/6eoewQg4Ylo5DeITQBw5R/YDlAMW+bj82+s8v9E0U+RB8aFckvy?=
 =?us-ascii?Q?c7XwmwAhrkCeIXvgLjpZzl0xBL9vunkNP/1njcQqDliR3N5pmE9jfD+HECUA?=
 =?us-ascii?Q?cSpA2zuOZDn0JpL6KtpxgCxuJjrbS9TMfGkw9PEreUPiUEj4yQmi6KlPhVcI?=
 =?us-ascii?Q?l/ha4oAJTJVfHGXk9TQDJFqWyPpKEmjKexd3Kdo+muGMmamJcYhQhX/a6xVs?=
 =?us-ascii?Q?jg1Vww+0NNtjmmiYH3YjET8ulVyin+3CMMK0uobQpKOXcFfOCvNOC/RZVkJY?=
 =?us-ascii?Q?ecU5pM0uhXfAE8Wo2czZcIsPUm40/oogRtiBUMWX6aCijGcuU9yUAydXCr2r?=
 =?us-ascii?Q?FeOoWlNcBOOEOPzZDujG0KpPexWrcWbbMMB2oZYdVqa0BT6hdE0EtcH3TH2P?=
 =?us-ascii?Q?dBteNoD/bBtSKH6TMqjd1MsI57yjJCjB+VHdUBdC1GdX9Ia7+g7MnJSzf8uS?=
 =?us-ascii?Q?TxqGgau0XpMBZQa3rN97r0m/+C2cw8zW8qffDkv7D50wndSzuuZfazW91QJd?=
 =?us-ascii?Q?erjPlWRM5ry0VZjGDNpWqr6FpfyHesM7BNujTDYCYPR+BiY35XDv2X6j10wN?=
 =?us-ascii?Q?a1FAubDMO2z30B0pTm+eApb/DsVUtFPaI0vEAs2Oiv2rQZhJsLSF1gSsZmcd?=
 =?us-ascii?Q?hQBGfSJE60yHtaVkQiDgMal6xyIRMHnTEtsqO9lfOdJEUec44L79lNG88PQs?=
 =?us-ascii?Q?jaEeNteoCkQouAQZl7I0gmzdEgzVFjYP+bVuQuuYoUXhLMm38QDduuiWZ9nQ?=
 =?us-ascii?Q?AcsQvxBRX3xkX4KIpAW6YKEyUvcK4kPbMgym5hfWVyUDsZfyHcD7r5AWoAxO?=
 =?us-ascii?Q?C9YwtRzGCgw6GMvswQq/KzIVkuEByIp0QAvmSGX6LiegTySdHg4YLppYaepF?=
 =?us-ascii?Q?PfFRB3egCTefa4wiCGvnE4PEObpFXtzjL6afxZXUSEHPuzVf7HfIRQYeb5df?=
 =?us-ascii?Q?6F1WYaS827IyexhQiXAUM5SMQKpo1RRBw91iLGCzztI0UJOj7bU8z5BNkTEM?=
 =?us-ascii?Q?Ke+BoNBPafQ5h5sRQeujK4KUcj5rtHocCbfbLMrwYU9mG3adFFMnXNADv5iu?=
 =?us-ascii?Q?BgrEUXK3BlWnQRbIlYlUB3Q4vGRmiex3TBL1CrC0wg9kyVNzIZEWDvTTlUUi?=
 =?us-ascii?Q?txjDx09aURg+0WJ5of5t26YfAtvc3tKZvcznhS/TH41W7grR7o0jx02jLdLY?=
 =?us-ascii?Q?hkzz0iTbUlX1FiGKB0eX9yUNxqUiFz7ntnofS91Q/LCrAbgGIq0zTY+GCNrq?=
 =?us-ascii?Q?q6C9fpj3kTLPMVLEg/kScQj+z5LEbOztwk8b4dRAdeXRXfePil8dn8I3Wd3I?=
 =?us-ascii?Q?f7UAyHVjDeZeUQD7UatBouzNuhVuyAuAoG+lS+gwg8nSS6F/m7+A?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6bcb87-af96-4c0b-ff2b-08deed7dfbe2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:48.6456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlJeifwpSK6T6fpCSQSy0tBUUOaDbWm+O9DgkQh8RZY7OgOYPPg79XFe5/LO8cNAOmXkhhZulHwGoeOjdfQZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

A later change serializes status capture, interrupt clear, and event
recording against channel restart. It must also publish all causes
observed for a channel in that critical section through one callback.
Otherwise, the deferred worker can consume one cause before another from
the same status pass is recorded.

Replace the DONE and ABORT callback pair with one callback carrying an
event bitmap. For now, map the bitmap back to the existing deferred DONE
and ABORT work, so behavior remains unchanged.

Also split DONE handling into a lock-taking wrapper and a vc.lock-held
body. The later LL event path needs to validate its recorded event under
vc.lock before running the existing DONE state machine.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c    | 44 ++++++++++++++++-----------
 drivers/dma/dw-edma/dw-edma-core.h    | 16 +++++++---
 drivers/dma/dw-edma/dw-edma-v0-core.c |  6 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  6 ++--
 4 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b84aed59bf77..bb57f2d39d1c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -702,17 +702,16 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+/* Must be called with vc.lock held. */
+static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (chan->status == EDMA_ST_PAUSE) {
-		spin_unlock_irqrestore(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
+	if (chan->status == EDMA_ST_PAUSE)
 		return;
-	}
 
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
@@ -751,7 +750,14 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		break;
 	}
 	dw_edma_core_ch_maybe_doorbell(chan);
+}
 
+static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->vc.lock, flags);
+	dw_edma_done_interrupt_locked(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
@@ -793,20 +799,24 @@ static void dw_edma_irq_work(struct work_struct *work)
 }
 
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
-				   enum dw_edma_deferred_event event)
+				   unsigned int events)
 {
-	atomic_or(event, &chan->irq_pending);
+	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
 
-static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
+static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
-}
+	unsigned int pending = 0;
 
-static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
-{
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
+	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+		      DW_EDMA_IRQ_STOP))
+		pending |= DW_EDMA_DEFERRED_DONE;
+	if (events & DW_EDMA_IRQ_ABORT)
+		pending |= DW_EDMA_DEFERRED_ABORT;
+
+	if (pending)
+		dw_edma_queue_irq_work(chan, pending);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
@@ -906,8 +916,7 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -915,8 +924,7 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 95bd4bf47ea2..6b0d475bb8b5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -41,6 +41,13 @@ enum dw_edma_xfer_type {
 	EDMA_XFER_INTERLEAVED
 };
 
+enum dw_edma_irq_event {
+	DW_EDMA_IRQ_DONE	= BIT(0),
+	DW_EDMA_IRQ_PROGRESS	= BIT(1),
+	DW_EDMA_IRQ_STOP	= BIT(2),
+	DW_EDMA_IRQ_ABORT	= BIT(3),
+};
+
 enum dw_edma_event_scope {
 	DW_EDMA_EVENT_PER_CHAN,
 	DW_EDMA_EVENT_PER_DIR,
@@ -152,7 +159,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
-typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
+typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
+				  unsigned int events);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
@@ -162,7 +170,7 @@ struct dw_edma_core_ops {
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	enum dw_edma_event_scope event_scope;
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-				  dw_edma_handler_t done, dw_edma_handler_t abort);
+				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
@@ -262,9 +270,9 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			dw_edma_handler_t done, dw_edma_handler_t abort)
+			dw_edma_handler_t handler)
 {
-	return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
+	return dw_irq->dw->core->handle_int(dw_irq, dir, handler);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 27c57f755d83..990cad7f0e54 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -336,7 +336,7 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -375,7 +375,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_done_int(chan);
-		done(chan);
+		handler(chan, DW_EDMA_IRQ_DONE);
 
 		ret = IRQ_HANDLED;
 	}
@@ -389,7 +389,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_abort_int(chan);
-		abort(chan);
+		handler(chan, DW_EDMA_IRQ_ABORT);
 
 		ret = IRQ_HANDLED;
 	}
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index c8b9f6c42494..8edec9c95cf0 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -174,7 +174,7 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -200,14 +200,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_done_int(chan);
-			done(chan);
+			handler(chan, DW_EDMA_IRQ_STOP);
 
 			ret = IRQ_HANDLED;
 		}
 
 		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_abort_int(chan);
-			abort(chan);
+			handler(chan, DW_EDMA_IRQ_ABORT);
 
 			ret = IRQ_HANDLED;
 		}
-- 
2.51.0

