Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D882264C0;
	Wed, 29 Jul 2026 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335460; cv=fail; b=LdLieWNTS3siMvivBSZd5b/5cVFsyatD+O8IY9hOKPFnoQCXbQZgh3wVEHYYTOiRqhWHHgB3abrThbE/dUZvicWGZB/cMQofoCHJoUwKDZr8bQUJk7nvhtkRK2XwSOkq7kGdRgn472dNSekCiKSP+z6gw/S8EokPIY/NkIOO2YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335460; c=relaxed/simple;
	bh=7o1doFnFl/wzN4pMikj5XFy4gNj+e28XVAuUgw7gfrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JAO4vXQ2luFsPMt/xqINu7crta9i9A1KfrX4hgPw9n6l3ZnBU3sXiG7B7OqB2KFYjYduWo32wyZbFyDzgJPky4nePeSPXtv9rI9lKuqOT4tPoWqzEhaSr5HKHmnkI54hgx6fLDE2v+6/5v9Lkk/ZrRudZexYUx7NxDEO+MaVV9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=IriyqzZO; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="IriyqzZO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cW8+l+zv5P6dq3nAhmcJUl8E5lElEBEXVNSyAAP4oCKm1x5iHzRq1tnEd1+JbgvkmApxd2BansybCp4brlQdSM2v6oWF1WFvHS+3nXUtogGrvPFC3b7VsYP0eHrtcjfTstxrvQcOOkSrhRF5BmDCicuxuHTv+VOj/fz1yod+mlzm8bV405uEB3hVvemEMF5KgycVKItVAU3T27srvrsA8+OTZjdp3LSA9X3E3S+r38lPENZRIyoLvl0HMGVwpc9sQCKSGk06fNLzVUKaB8sVczs5qB/p2YqNlCPC1a4A8gnsfeQaY9GTCYkdzUpODe8EFgqzAv+9Ze4D9U5tgVTYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMBNVcCL7WJCMC7QNupG5eF+fqi/vTPUSvM0iVVtG14=;
 b=jVin4df2v6OukJTmWFV6nMWwfJjpRfDix0hPyCS50863DbXIN+LitMZDKZdLF2i0GwfVGNBBU4MWELA02AjlUe7zDPDsj110I5h2nEOKW9irtPorYnIm8bknViixtt39p/0/wAQtSjlqdwGJHmv9AOYv3DGSl4ZlLTTpQ0SHM/uUJSEw6sCye0//Oo/wwuUjEne7j4lVYteVnjSERgExNJGB9W0afpt+/TAiHeLb2XKMOeAW10UfRNCcjMRwlBYCYpU7wgvGbH0O5pv9R7ydC2fFykDzPkjtAbj4pUKcn6MZkFB28e2/ffSIRQKwXnmj+Go0r+oybEdZ27DiVQMVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMBNVcCL7WJCMC7QNupG5eF+fqi/vTPUSvM0iVVtG14=;
 b=IriyqzZOn/vDXrrlFlFoVY8UHCvGDyc2xTCrirBAURDfXYXip5pafQkGJBbeqy4yBRU3gaOAxl+V5qzDtbFP/4ReuP6w5tXDNxA6DnHfcF3ueNbRXglPMYu6O2idKRi9uOMH9CIRj0CuBiBdq4yBzG8T0p7XBVsL4Edc4krYILU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:50 +0000
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
Subject: [PATCH v4 11/24] dmaengine: dw-edma: Serialize LL event capture with channel kicks
Date: Wed, 29 Jul 2026 23:30:23 +0900
Message-ID: <20260729143036.3087722-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: f25b69a5-fee0-4321-4a53-08deed7dfcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|6133799003|5023799004|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/JWvkM7ggCB7Q1JsQskpfSRKieqHmwJZxE7fWjNuvLrs9y4txf1Dt4Fe3j2k3ryNq2UwVLAaxJWe9vQTDAjZX3701LwYHkkSEK9RkFYZXMjhv4RChJ7Iu4zjIoFdycaY07mlvTmU4wBKy70c1EYaFEao8OBjDz5WiYtFSdFB7J+eIu4n+6ym0bZEoQLCi6AaMJsZYBifFwHW9bFUbFo74V6emnCVO7Ln+ooXhUa8GQomMhpw8lBtaT85E5ea3JD/Z5keskIBkEwiCF+im/BDQpui6/vZSq02D13tD5/FYuMd48LFXvIIxSdN9UQua/VjbtQJZwTBHPBcGsS/RzMR8un7rY5yu35k/dLrk/vNCP9ErEQ8ttoxKx7SsTHONDRIVfjMhocCZp4LDFSlZdc6Rlj2VVUrSTvX85/xr2O82fkpf7+zBMk+arJC6Hbm2chWZtmUESCtDrGhV8rJ9BUsjySt5yWWhZ4/BCMzjuU33hstnmrcTdV9j5eTIL5Ou/FuQW7MZMmDzBUHLYBWcAs4KieDOU+gsiGfaM78cJmokX4FVme6doYuKdseTW9bpWDByUepsUx6rtJy37uxVbFZZVGIVY0grV3uTc7AvAiFw2kljQXvUkIW4N4+9HidZrnuBYQz3Jxwd/vYUtgr5gxH+fjqckstM7cBg3twsL5uzL1mc93UVKKf7fnxG+1LwDxGpjzxrJ55sSSquFcgm0Ucxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(6133799003)(5023799004)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E7BPw/6esS/FLfi6N4Ixh0WUUSGKKRAWrMdX46zLxTt3qkdzjySY4bE55K3q?=
 =?us-ascii?Q?xEYHhHiCVIjD/M5vWkw3FXQhMdjHRehWrxHRNKSVRURCNlCNkoXpbBpACP0K?=
 =?us-ascii?Q?KYLUxwuNV2bVt2UAf2gnj+vG9XbX7EJYxkUYiYvsI0SKQNm66eABH5dp0c+u?=
 =?us-ascii?Q?iIxFieGprWXnukkS863wbNPTY4WwCnsbrCJ4LWM16xLWXcRUaYi75M47SFWE?=
 =?us-ascii?Q?8Nb9OfgAaMpQS1BstDy7BCNxpOsJVRlwDLwNHfy1QnHYAXO6Hk/vwCf/+3RV?=
 =?us-ascii?Q?jDg9LbCq8cVlKSPpYiFzc/aq8eVIDuXiRbH5M0q0ccO9P4DMsRIYpWg8Wmfr?=
 =?us-ascii?Q?UAnXvrJDS3W+IZVn4+LPkXo0JIq8iwDA/jEJ34sEUm5s8VCQWWfsvLKzF7Lz?=
 =?us-ascii?Q?OOuDPj9Fzs9UJwurzCBHmNdsnVMhhVQKqybc+D8WEPvKt2sGqp5vslmuzxj2?=
 =?us-ascii?Q?C8tmMzRTvcAO1e0Hv0WBwm5z0k6EIYs45xPo62dXTXJNG8Iiz8+BZDSCk5VT?=
 =?us-ascii?Q?PGfhJxr397vYjWD+2DMvvKTjtiXTeqWmv5sKdvW/qkioHD8+5QnAlIQdoXwb?=
 =?us-ascii?Q?RuRk6MfBoxclDplajC7ZNalqskoc9QwyoJYiDEErAI8az5+4/BbFXlxB9OxX?=
 =?us-ascii?Q?unmH0A2s/a9bN6PWr0V/OrybUtkRwKTKZQVkzY9ha4WvMrwaR228cWFnzcAd?=
 =?us-ascii?Q?QMKdQsfTwV7vQ09sxcr6HKM6wynlTD7D3PIa6DJTeda6rop12AsGxE7vOICy?=
 =?us-ascii?Q?CwCDceDUX0XhhUgyXVGQJQRsni7Ip4AIOIQ3Qt3fI8Uckj6iGWiKgArOxVQS?=
 =?us-ascii?Q?/VcmNuw7/MBFDJNtw6bt0ls6FrJCXDOlhUruM5RGQiS8pmzhdWmS+qScckZE?=
 =?us-ascii?Q?QI6jGdOFF7lYWUeQWSGdAQ1jJYIQvLv+zrQYKl9vnrv3em86VwM5Ae34tT1y?=
 =?us-ascii?Q?64G4/yUoleOmO/nNJsqmSOHnclqEQ0T1mnJEQxOurYqEOiOWpft3DJIYJUJx?=
 =?us-ascii?Q?t2jz1aV1g5kxMRO09eu43htcfg25uv64gpGM2znOcacGi9Uh4tykd7wkyTe+?=
 =?us-ascii?Q?SNSp+vlX49SHe21uq1hj7dZkAPg69nmwx2YyXgpDKJysCqreDCLmCAFzS3Vu?=
 =?us-ascii?Q?Qxrct/SH48xhYnPNaGkkRgwz8QyHBRRRmGoevVXdg6AxZVHLsCwX2jjTa63r?=
 =?us-ascii?Q?XX5ziEXCMb6yanhHw6vJPlFY7tSzDtIFbb02thXVfLw9XuA46tjlTPR6gKXF?=
 =?us-ascii?Q?KQ4+xdH232siisDuoqTe0wKRRKQQylHZ7LKgrXJXaHNMeE+ok8aCdIsQT13M?=
 =?us-ascii?Q?plL+nR29BQ5/diPNHFwNf255J0LqccnFWfSnCR31YkwPnfOMYEGL9tufCuN5?=
 =?us-ascii?Q?m+FlNrP2KqMcYNeGYaZ+OMLtKO4OSGFfETQ1uFUNebdn0UR7Uq4asogIoNk2?=
 =?us-ascii?Q?KfpR04yhEgMGrvn62iCqaGywi9NNeMPAvh0EXief/1kRAC7T45xTd08H97t1?=
 =?us-ascii?Q?jQ7K5Btq3pGtE99CUaUKoAT/2F40YsAXYcQSwOT/UH8y55yDBnMwRNW4eQei?=
 =?us-ascii?Q?QMuHx4OKxpPighL42OxRWgTItYQwHUoacp5oE2Yq0wps9MiLzF2d5/jzdNwi?=
 =?us-ascii?Q?WiREWRIsJ/LBojgamNi5t0DoLo91CgXbraZGgiCjuMHR08eAyDbiwAk93e6E?=
 =?us-ascii?Q?Xoc9B93634on+H7jmv6jbdrWtfhhooDcLZ9lx0KjEsRHi9z3Fl3yvJCMeIiT?=
 =?us-ascii?Q?CXM4wsWPHls1KCyPYEnCmfvNkQ4D/LFMvYPY392QOO6UGEwmGNEH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f25b69a5-fee0-4321-4a53-08deed7dfcd8
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:50.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf9a9Xhvy2eP5wLfzGy2BGG+9AzctWcbYtZqGJ9G7aqZB+ZxYVLVyVOxHmWKksmZZ/B1OijeUyRfDu1CSF5hHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

The hard IRQ path clears interrupt status before deferred handling takes
vc.lock. If a doorbell starts a new hardware run in between, the
deferred handler can apply an event from the previous run.

Use the event lock to serialize the interrupt status read and clear,
snapshot recording, and LL doorbell writes. Do not write another
doorbell while a snapshot is pending. A ring reset discards the snapshot
under the same lock. When events coalesce, keep STOP over PROGRESS.

Changing chan->request alone neither changes the ring nor writes a
doorbell, so it does not invalidate the snapshot. Preserve it across
request changes. A later patch uses PROGRESS and STOP to decide whether
a pending STOP or PAUSE request can finish.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Replace raw event locks with spinlock_t and event_scope with a lock
    pointer in each channel, then use the common accessor in both interrupt
    providers. (Frank)

 drivers/dma/dw-edma/dw-edma-core.c    | 114 +++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h    |  39 ++++++++-
 drivers/dma/dw-edma/dw-edma-v0-core.c |  66 +++++++--------
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  33 +++++---
 4 files changed, 200 insertions(+), 52 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 55849b0c862e..9ef7342a1093 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -33,7 +33,8 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 
 enum dw_edma_deferred_event {
 	DW_EDMA_DEFERRED_DONE	= BIT(0),
-	DW_EDMA_DEFERRED_ABORT	= BIT(1),
+	DW_EDMA_DEFERRED_LL	= BIT(1),
+	DW_EDMA_DEFERRED_ABORT	= BIT(2),
 };
 
 static inline
@@ -74,6 +75,52 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
+}
+
+static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
+/* Must be called with vc.lock held. */
+static bool
+dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
+			 struct dw_edma_ll_snapshot *snapshot)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	if (chan->ll_irq.event == DW_EDMA_LL_EVENT_NONE)
+		return false;
+
+	*snapshot = chan->ll_irq;
+	dw_edma_ll_snapshot_discard_locked(chan);
+
+	return true;
+}
+
+static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	dw_edma_core_ll_irq_clear(chan);
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
+/* Must be called with vc.lock held for an LL channel. */
+static void dw_edma_ll_event_discard(struct dw_edma_chan *chan)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_event_discard_locked(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void
 dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
@@ -120,6 +167,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
 			     chan->ll_region.paddr);
 
+	dw_edma_ll_event_discard(chan);
 	dw_edma_core_ch_enable(chan);
 	chan->ll_valid = true;
 }
@@ -269,6 +317,17 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	dw_edma_core_ll_sync(chan);
+
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	/*
+	 * A recorded event belongs to the current ring and must be consumed
+	 * before starting another hardware run.
+	 */
+	if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE)
+		return;
+
+	dw_edma_ll_event_discard_locked(chan);
 	dw_edma_core_do_ch_doorbell(chan);
 }
 
@@ -779,6 +838,18 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
+static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
+{
+	struct dw_edma_ll_snapshot snapshot;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
+		return;
+
+	dw_edma_done_interrupt_locked(chan);
+}
+
 static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 {
 	struct virt_dma_desc *vd;
@@ -811,6 +882,8 @@ static void dw_edma_irq_work(struct work_struct *work)
 
 		if (events & DW_EDMA_DEFERRED_DONE)
 			dw_edma_done_interrupt(chan);
+		if (events & DW_EDMA_DEFERRED_LL)
+			dw_edma_ll_interrupt(chan);
 		if (events & DW_EDMA_DEFERRED_ABORT)
 			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
@@ -825,14 +898,29 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 
 static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
+	struct dw_edma_ll_snapshot snapshot = {
+		.event = events & DW_EDMA_IRQ_STOP ?
+			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
+	};
 	unsigned int pending = 0;
 
-	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
-		      DW_EDMA_IRQ_STOP))
-		pending |= DW_EDMA_DEFERRED_DONE;
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
 	if (events & DW_EDMA_IRQ_ABORT)
 		pending |= DW_EDMA_DEFERRED_ABORT;
 
+	if (chan->non_ll) {
+		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
+			pending |= DW_EDMA_DEFERRED_DONE;
+	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+			     DW_EDMA_IRQ_STOP)) {
+		/* STOP is final for this run; do not replace it with progress. */
+		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
+		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
+			chan->ll_irq = snapshot;
+		pending |= DW_EDMA_DEFERRED_LL;
+	}
+
 	if (pending)
 		dw_edma_queue_irq_work(chan, pending);
 }
@@ -1020,6 +1108,7 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	dw_edma_wait_termination(dchan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
+	dw_edma_ll_snapshot_discard(chan);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -1071,6 +1160,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
+		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
@@ -1264,6 +1354,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 {
 	struct device *dev;
 	struct dw_edma *dw;
+	struct dw_edma_chan *chan;
 	u16 hw_wr_ch_cnt;
 	u16 hw_rd_ch_cnt;
 	u32 wr_alloc = 0;
@@ -1307,6 +1398,8 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	}
 
 	raw_spin_lock_init(&dw->lock);
+	for (i = 0; i < ARRAY_SIZE(dw->event_lock_per_dir); i++)
+		spin_lock_init(&dw->event_lock_per_dir[i]);
 
 	/*
 	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
@@ -1336,6 +1429,19 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	if (!dw->chan)
 		return -ENOMEM;
 
+	/* Event locks must be ready before request_irq(). */
+	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++) {
+		enum dw_edma_dir dir = i < dw->wr_ch_cnt ?
+				      EDMA_DIR_WRITE : EDMA_DIR_READ;
+
+		chan = &dw->chan[i];
+		spin_lock_init(&chan->event_lock_per_chan);
+		if (chip->mf == EDMA_MF_HDMA_NATIVE)
+			chan->event_lock = &chan->event_lock_per_chan;
+		else
+			chan->event_lock = &dw->event_lock_per_dir[dir];
+	}
+
 	snprintf(dw->name, sizeof(dw->name), "dw-edma-core:%s",
 		 dev_name(chip->dev));
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 00ddcaacd671..b6de4ac9a8aa 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -48,9 +48,10 @@ enum dw_edma_irq_event {
 	DW_EDMA_IRQ_ABORT	= BIT(3),
 };
 
-enum dw_edma_event_scope {
-	DW_EDMA_EVENT_PER_CHAN,
-	DW_EDMA_EVENT_PER_DIR,
+enum dw_edma_ll_event {
+	DW_EDMA_LL_EVENT_NONE,
+	DW_EDMA_LL_EVENT_PROGRESS,
+	DW_EDMA_LL_EVENT_STOP,
 };
 
 struct dw_edma_chan;
@@ -76,6 +77,10 @@ struct dw_edma_desc {
 	struct dw_edma_burst            burst[] __counted_by(nburst);
 };
 
+struct dw_edma_ll_snapshot {
+	enum dw_edma_ll_event		event;
+};
+
 struct dw_edma_chan {
 	struct virt_dma_chan		vc;
 	struct dw_edma			*dw;
@@ -104,6 +109,16 @@ struct dw_edma_chan {
 	u32				ll_head;
 	u32				ll_done;
 
+	/*
+	 * LL event recorded by the hard IRQ handler. The event scope lock
+	 * serializes its capture with a new hardware run; vc.lock serializes
+	 * its consumption with LL state.
+	 */
+	struct dw_edma_ll_snapshot	ll_irq;
+	/* Native HDMA lock storage. */
+	spinlock_t			event_lock_per_chan;
+	spinlock_t			*event_lock;	/* Selected event lock */
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -153,6 +168,8 @@ struct dw_edma {
 	struct workqueue_struct		*wq;
 
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
+	/* Per-direction lock storage for the eDMA interrupt registers. */
+	spinlock_t			event_lock_per_dir[2];
 
 	struct dw_edma_chip             *chip;
 
@@ -168,7 +185,6 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
-	enum dw_edma_event_scope event_scope;
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
@@ -177,7 +193,9 @@ struct dw_edma_core_ops {
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
 	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
+	/* Called with the event scope locked. */
 	void (*ll_irq_clear)(struct dw_edma_chan *chan);
+	/* Called with the event scope locked for an LL channel. */
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -221,6 +239,19 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
 	return vc2dw_edma_chan(to_virt_chan(dchan));
 }
 
+/*
+ * Lock ordering:
+ *
+ *   chan->vc.lock -> dw_edma_event_lock(chan)
+ *
+ * Interrupt providers invoke the dw_edma_handler_t callback with the event
+ * lock held. The callback must not take vc.lock.
+ */
+static inline spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
+{
+	return chan->event_lock;
+}
+
 /*
  * Return the current LL entry index. A negative value means that the channel
  * context is not initialized or was lost after a link reset.
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index e254e9f1e613..3f3e94b9073f 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -339,8 +339,8 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
-	unsigned long total, pos, val;
-	irqreturn_t ret = IRQ_NONE;
+	u8 events[EDMA_V0_MAX_NR_CH] = {};
+	unsigned long total, pos, val, active = 0;
 	struct dw_edma_chan *chan;
 	unsigned long off;
 	unsigned long *mask;
@@ -356,45 +356,48 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		mask = dw_irq->rd_mask;
 	}
 
-	/*
-	 * DONE and ABORT status share one register, and on remote setups
-	 * every read is a non-posted round trip across the PCIe link. Take
-	 * one snapshot and derive both views from it. An abort raised
-	 * after the snapshot is deferred, not lost: only bits observed in
-	 * the snapshot are ever cleared below, so its status remains set and
-	 * triggers another handler pass.
-	 */
-	sts = GET_RW_32(dw, dir, int_status);
+	if (!total)
+		return IRQ_NONE;
 
-	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
-	val &= *mask;
-	for_each_set_bit(pos, &val, total) {
-		chan = &dw->chan[pos + off];
+	scoped_guard(spinlock_irqsave, dw_edma_event_lock(&dw->chan[off])) {
+		/*
+		 * DONE and ABORT status share one register, and on remote setups
+		 * every read is a non-posted round trip across the PCIe link. Take
+		 * one snapshot and derive both views from it.
+		 */
+		sts = GET_RW_32(dw, dir, int_status);
 
-		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
-			continue;
+		val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
+		val &= *mask;
+		for_each_set_bit(pos, &val, total) {
+			chan = &dw->chan[pos + off];
 
-		dw_edma_v0_core_clear_done_int(chan);
-		handler(chan, DW_EDMA_IRQ_DONE);
+			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+				continue;
 
-		ret = IRQ_HANDLED;
-	}
+			events[pos] |= DW_EDMA_IRQ_DONE;
+			active |= BIT(pos);
+			dw_edma_v0_core_clear_done_int(chan);
+		}
 
-	val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
-	val &= *mask;
-	for_each_set_bit(pos, &val, total) {
-		chan = &dw->chan[pos + off];
+		val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
+		val &= *mask;
+		for_each_set_bit(pos, &val, total) {
+			chan = &dw->chan[pos + off];
 
-		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
-			continue;
+			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+				continue;
 
-		dw_edma_v0_core_clear_abort_int(chan);
-		handler(chan, DW_EDMA_IRQ_ABORT);
+			events[pos] |= DW_EDMA_IRQ_ABORT;
+			active |= BIT(pos);
+			dw_edma_v0_core_clear_abort_int(chan);
+		}
 
-		ret = IRQ_HANDLED;
+		for_each_set_bit(pos, &active, total)
+			handler(&dw->chan[pos + off], events[pos]);
 	}
 
-	return ret;
+	return active ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static void dw_edma_v0_write_ll_data(struct dw_edma_chan *chan, int i,
@@ -664,7 +667,6 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
-	.event_scope = DW_EDMA_EVENT_PER_DIR,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index af4ab43d00ca..617e39f7a8b7 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -177,10 +177,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
-	unsigned long total, pos, val;
+	unsigned int events;
+	unsigned long total, pos;
 	irqreturn_t ret = IRQ_NONE;
 	struct dw_edma_chan *chan;
 	unsigned long off, *mask;
+	u32 val;
 
 	if (dir == EDMA_DIR_WRITE) {
 		total = dw->wr_ch_cnt;
@@ -197,20 +199,28 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
 			continue;
 
-		val = dw_hdma_v0_core_status_int(chan);
-		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
-			dw_hdma_v0_core_clear_done_int(chan);
-			handler(chan, DW_EDMA_IRQ_STOP);
+		events = 0;
+		scoped_guard(spinlock_irqsave, dw_edma_event_lock(chan)) {
+			val = dw_hdma_v0_core_status_int(chan);
 
-			ret = IRQ_HANDLED;
-		}
+			if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
+				events |= DW_EDMA_IRQ_STOP;
+				dw_hdma_v0_core_clear_done_int(chan);
+			}
 
-		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
-			dw_hdma_v0_core_clear_abort_int(chan);
-			handler(chan, DW_EDMA_IRQ_ABORT);
+			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
+				events |= DW_EDMA_IRQ_ABORT;
+				dw_hdma_v0_core_clear_abort_int(chan);
+			}
 
-			ret = IRQ_HANDLED;
+			if (events)
+				handler(chan, events);
 		}
+
+		if (!events)
+			continue;
+
+		ret = IRQ_HANDLED;
 	}
 
 	return ret;
@@ -419,7 +429,6 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
 	.ch_count = dw_hdma_v0_core_ch_count,
 	.ch_status = dw_hdma_v0_core_ch_status,
-	.event_scope = DW_EDMA_EVENT_PER_CHAN,
 	.handle_int = dw_hdma_v0_core_handle_int,
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
-- 
2.51.0

