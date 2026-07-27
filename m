Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021097.outbound.protection.outlook.com [52.101.125.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193B437875;
	Mon, 27 Jul 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171837; cv=fail; b=l7OssrrXiSXEi51zEXXWAiUSzurqZ7rERf/2HLZD/K7Od4sao9VtMPv0Nuwk3AlKZBsIpq74cbAWhc6DqHntFY5IQf0dHnynTnFMylSgBLz3l8kjdY1XC80it/rzYjUEzyONghcSd/eqbLxE/dx/4ETZuG9PTdxrNtKrrFd1fEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171837; c=relaxed/simple;
	bh=ubZ723wSaXjcUMkI3hvhMTQWpS/P/FJqIbRYGR7MKFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AJ90AhNeZJE/FL7MHKGEwQO5mNM1BM/1RFOVHFCIvVcIqR08EiToQdGh3Vj6u7RNidfx0i4AUOi2Lj472pK59jZAmcDwnSVQ7b1txDyy630BhOz/NkF8TitCfBLHG4yxrQdrcOPhQMcOnmt539ENBDTFdODLtIoCF6OHIWKH4tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=HBSalsV0; arc=fail smtp.client-ip=52.101.125.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="HBSalsV0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqDBVTOJ+7C51+0b2nJBIKqwfS8bc/4rPgjcElkI6GVbmmiRr3yqTszjMsNsQxT0lj+levsGdqmv89NzMjsdAGSupd+T3dKW/dtLTCRKCRLWVSDMnGMPvO41xTffnyqA2Wy762hOiMz6FuOAmlAv7JYMvrq19KJbJv4/uGS2SV24I8c6gulXzqOakQOr4CHk0zqTb+twIKjhjpXM+oP6YpEgUbxFLLMODDShU6ty/W0VV7GCL1jwMSsSArqPBApDtvDBnwrHX4iK+VrYqUDmJmWEkQs05kHDpHl+RuDv/YS8BsFjXHXfCxsvsanAojDn0xH2Z0CITQ4fH4CcKrV72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt3YB07fyjvByrfTNvbdO0i+p3YZAfv79gl5Hae8YRE=;
 b=YBnMxQIx4fFUElPu3vaAB/iaAwrHjddmmYo5DBox/EJq94sQyrVd3AS/8L5qW5Z5DCBxu0B0/bsN7yBrSCIVXCXykyEStiaFxfFNLO/4wyVBTC7Un2fvCzbqCuBFFInY+lX8pD1xf2ztFdWyG237vvfTWHVMS4TES0nDzQiS+fNBlRMBBYxe+LpojZV3lcTmlc+47EjB9jg7UkIP4kQCXOrrRP+XCUUKYW5mP+s69FsNe81zX02ANYtY3fdapTj7h1I0EvQiVcUKhTOgpzriGJeq7zQ5zX70NTFuDYRvZrkFAz/lMsNlhtOZldNqrUP+r2VtR5QsPsT0oL4s6I9ITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt3YB07fyjvByrfTNvbdO0i+p3YZAfv79gl5Hae8YRE=;
 b=HBSalsV0tjTZTCJv7CuJx2vIF+qGBwvV20RInXbkaN3GGLF73h/1qVlCe9q42WwU55JGemagqf9KGKCOI+TbKqQJ1kGp7x4hPQjBfDtTanlQAYWTAUKPyY7YdHY16Qxvc8Zp+bO2F8BwC7AcIbAfx6UB56c+UWV01ErDNYTpP1c=
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
Subject: [PATCH v3 19/24] dmaengine: dw-edma: Drain LL entries for STOP and PAUSE
Date: Tue, 28 Jul 2026 02:03:18 +0900
Message-ID: <20260727170323.2321369-20-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b57fbc-b4ac-44f9-a827-08deec0105d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UZOkr2JMNkRz0lubOeegkDhL5NK+Na9XckAAXZWP2pOWCxW/Q/HNdrX4+xWocBtDpRA7p9ldGbQoritMmxTZrUiEfKjLBO3wCWZrq9WxPY8seIlJrn4NJGeJbyYPn40Ev1K8JBuXhIKibieDkRh2e7AcYKxWhjFr4Ryz41Is4iQMYJfLd0eIAd48QLltxjhltMwpDbzmQzyktjgY29l+eU6x1784LiwoNyVj9G5QgCxlpmJ4rjS3k+dCRTYh31Lpa4swEjc9ISb8qWW4jE9QC9F3w9RXMiW88gaVcmB2xtGXUGEEgM9T1shcFpQr4T+Fj2M/sXnXA+gJnIDqEGX3C/Kl5kpmrx6msaM4gAWEZWlDbyfg3ko1huOZswWn1l2GF1GSn7TGd7NAma0OiYpBloLL60hn5VpVO0HAPuEvhoVTJCYRm7KHVWY0JKSgbfn4A21LEhJhBeHeFxc1pIk3BZ76dt/V2oRKghXeGyF7HbpgZtBcoC8B3AgCn/RH3UMeNB67hqqmMSpbtznreCaRN4u52MYPOVsqBk/q7V3sNTap1u8W8FLTLkFrSCnjOAJo1IuPj6m8IrI/byAPomUyxUyqDzNCbY+XCtv2rRuKfgl0ojvmDDuUHRW+fDFpbwLfzxIHRRraZxsK5hGT3hRgiNQkNtj9E8f6Lh+Mwb2ix4Q73lf411tAbMI3xFzN1qJSyByl4LShA9Pj/bRPfT3A4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T6ueLi3a5J1yNlBw/qjV3Rnvk2p/+q3h0rrqfSJji6q7jQJhi8Wp3DW2GOiV?=
 =?us-ascii?Q?4qQp9ffs5z1t/zc9l5jW3Gn94oQn0OTEaL4BS5YyZfuPfXf5MMOEeoFcGm1y?=
 =?us-ascii?Q?h7b6JB9fXHP+gNy6ohIOcUmhCQuj+TQAUVqNPU1+lECdyD+lXYvm74gnyJba?=
 =?us-ascii?Q?5n/p9vaY2DcbR/b3y3IJbJk7L+2rDJS6J3ssRa9SDT+EMwch2Pe+ygFOQPtJ?=
 =?us-ascii?Q?gt/ACpoxzjiZw+/60PQ3scIMql5OLjuDhHS405cLzX8TBUDqQ20tWHe924OU?=
 =?us-ascii?Q?8Yc8dg78tM2sgSUhF+Jtmw3jsrSRYeCzfVvpuYtGjeV1aJjgZCcVA07qNTbn?=
 =?us-ascii?Q?Ma5voeFkW0rPmVrgUhraZUOABCfZdA/oGHQO/iqPOgS/v9zAves65nCoi68M?=
 =?us-ascii?Q?T05bC/TPIJTlLRZKBOBna4wO31Kw7MfNboGYVEnz7MBdfyuv7kemdnYwfyrN?=
 =?us-ascii?Q?0Koeby6iZo1NMW1o6Um3cTR/0EF+pGAcNOfXzkDQyhFx8VOnT03/xObTV5jq?=
 =?us-ascii?Q?M0oeiIHmC9e7sgbUpDmh1QVv/tRvpuqZ0x+WCRBYu2oaKUZT+BoVqz01i671?=
 =?us-ascii?Q?pg3PzRnt0SO/gcWGSbfAQHQcOpOSa+IzpW966ak8n77p26Tg0lYJ0eG1TH5n?=
 =?us-ascii?Q?8KpJAbxeYBytgVdlVWBfYwqpSyk36TXinKMgtmY/Z4x+h6pd9M5h7cNez2xO?=
 =?us-ascii?Q?yU2NDX7ru2LIp5ZeNpTxLWLtLRmlxaLSpkxMPfIRgQL/+kizhGUvAibSEcfA?=
 =?us-ascii?Q?yvZ4Lk1tnFZ83+OyiH2JZAH/Q6dtDWjuoa+hiCEwv2b8Vma8pgTlSL8WpTqB?=
 =?us-ascii?Q?ns/j05VhyxiN8GMxowlJsS4/2/GkxZHK5AiEwutcRHWiOPq8L2jRnuBj+S7r?=
 =?us-ascii?Q?4pNCW3pkthOZbngyfHOYSNlp4JvAr9SV9Cy14Fmjj9+N8se0iFFmXzmhetIQ?=
 =?us-ascii?Q?zoh/uA95IyEEHKSdQRi5wW9bkeexYWQVxtPZ0O+RdRxMENfzi5MIQ8nksTEq?=
 =?us-ascii?Q?F1HTNa3/HsFQPO4pSDRgHdnp9YU4bFn/dzdyrrU5vO/E4jDmM2IF2hhvMHXU?=
 =?us-ascii?Q?8DjEqJI+cam21oHS8wMFYDVKK0g4fFOmT1pFdUKFubQ7X7J9JPvwl+ucTe12?=
 =?us-ascii?Q?K7zOej8T4/17v+JZNIRz4aMWW4bkMSqWMk901apMeXakm9+zJpY0reNNWqG0?=
 =?us-ascii?Q?jFoT86ArgyeSSCOOHk4NfcGboJzVHim1VjKIgWIiRXinXPzvRIjZGl6WZTti?=
 =?us-ascii?Q?h5ogu4B8oFxffvFEAw8QMJ/NTHWqgRoklX2Uemi1ZsGE5fs8DjevjJ2hkP2M?=
 =?us-ascii?Q?R2hWyctWbnxBcW6tJTmuRP1FMeD7RFzFzTg4qoFdeCfOtPpM8aAHgtY8NzzP?=
 =?us-ascii?Q?/MjCqE7SJ0j2lIHhVWTwMU3hCqZEvO6s5ggqGt72cnncCBjYPUJhnIY1BAM+?=
 =?us-ascii?Q?wYsneNh339SU5Agy3IMAGUQXO4drNlZTIlpZuM+X60HHyBtMlLtbZuvNcfvl?=
 =?us-ascii?Q?zBvFXjmMBlDj1uCs+8fxRJ9Kd0G2gASSflxrCocXVG265z4Vf03bggh7us34?=
 =?us-ascii?Q?SNfppP7xEt5MwxzU9afNWBHx4Zkh1nxtgprWOlkwV/Sm50KLLI95/HVlHuyh?=
 =?us-ascii?Q?soR7YhTax9xEXqfJLkOZrHbnSSMDQoRkCjab5UT2KijvswuK23QRFe9yuwzp?=
 =?us-ascii?Q?3DfXWM9oIGKpZCu7s1Jyz25o28lrcdPiPOk8BFe+lm9mSiXGx19bA02CTdOn?=
 =?us-ascii?Q?wcWsyqRNA4oo2KmphfbRPgnxgscvUFxnbGRbecNmfQsYLeG2b4z/?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b57fbc-b4ac-44f9-a827-08deec0105d5
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:47.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB8xWx/AmBVW8tViBctkTb4HI66bkxliXTm02C0oYfQWaRdJjMuY61/6r+FZRuYkIxGVFHUHr9XuMnXNny43rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

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
Changes in v3:
  - Rework and rename v2's "Reset LL state after terminate and abort":
    move abnormal-path ring reset to the circular-ring patch and drain
    published entries before completing EDMA_REQ_STOP or EDMA_REQ_PAUSE.
    (Frank, Sashiko)
  - Preserve an IRQ-captured LL event across request changes and leave
    terminal cleanup to a pending ABORT. (Sashiko)
  - Reconcile a stopped boundary not yet captured by the IRQ path before
    kicking a request drain.
  - Use the common kick helper for normal and request-drain paths.
  - Continue waiting after the five-second warning in
    device_synchronize(). (Sashiko)
  - Arm one delayed stop recheck while draining EDMA_REQ_STOP or
    EDMA_REQ_PAUSE. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 111 +++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 0c30c0f51fea..bbd417e98a9d 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -460,6 +460,13 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
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
@@ -691,8 +698,9 @@ static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
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
 
@@ -703,9 +711,25 @@ static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
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
 
 	dw_edma_core_ch_kick(chan);
 
@@ -748,8 +772,7 @@ static void dw_edma_ll_recheck_work(struct work_struct *work)
 	}
 
 	chan->ll_recheck_at = 0;
-	if (chan->request == EDMA_REQ_NONE)
-		dw_edma_core_ch_maybe_doorbell(chan);
+	dw_edma_core_ch_maybe_doorbell(chan);
 }
 
 static void dw_edma_device_caps(struct dma_chan *dchan,
@@ -841,6 +864,16 @@ dw_edma_device_get_config(struct dma_chan *dchan,
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
@@ -855,7 +888,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 	else if (chan->request != EDMA_REQ_NONE)
 		err = -EPERM;
 	else
-		dw_edma_set_request(chan, EDMA_REQ_PAUSE);
+		dw_edma_request_pause(chan);
 
 	return err;
 }
@@ -883,35 +916,52 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
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
@@ -1252,8 +1302,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
-			dw_edma_set_request(chan, EDMA_REQ_NONE);
-			chan->status = EDMA_ST_PAUSE;
+			dw_edma_finish_pause(chan);
 			break;
 		}
 
@@ -1296,8 +1345,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 		break;
 
 	case EDMA_REQ_PAUSE:
-		dw_edma_set_request(chan, EDMA_REQ_NONE);
-		chan->status = EDMA_ST_PAUSE;
+		dw_edma_finish_pause(chan);
 		break;
 
 	case EDMA_REQ_STOP:
@@ -1591,18 +1639,21 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
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

