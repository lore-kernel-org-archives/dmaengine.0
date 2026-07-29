Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021126.outbound.protection.outlook.com [52.101.125.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C283E7633;
	Wed, 29 Jul 2026 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335471; cv=fail; b=SEZFVYdA5Qif3iHM8cpX8uvJaOR7acg+Bxp6t9jjrERcRV9Ge1eCuRVsmPvwQDXcFRzPsAhyui8vFMLEsh2utXaDyDDhhb5xxPy0HJToMBWTpH1Wqm39Zrw/NIijLrhe58Yc4dCCF2Jl9C8U4D4a372Ak90GGYpqn96mLnh9rBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335471; c=relaxed/simple;
	bh=+Cy+DUACmRF+gT7UhBl4/83KOF67MWvsck9yZqCRXFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rs82WoPKQwvBJ3isteiKT1855BX/Ra+hLTfCHvQeLO1UugML03mgZc/klUFacSU3/uUl4CIFpzj16Y5Asi7l+UBnzoGpJg2g4vx1B93OxrGtR4y976hSDOT1qf0k2O2zXltg9Ra/liwdMsXOJJs7U2vapHXkjWVBqMx15X6MwCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=WdI7tNOC; arc=fail smtp.client-ip=52.101.125.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="WdI7tNOC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w82IjjHeUhWGYa1sxR8JkiFSvyZ+AnHfx63+pifM0NDdFT00643yyHuushp6G8weqNOV+BkuqixdiEsJGca9KOvscl6c5r5mMnfFU9+aKuQPh5Ij53FJVo77KOHpqT0Z1l3SH2KqJ5hjcquk7Q35xn5+vnqd8RqsnpgGkQ8L/wAglbpJqXC3wkw5lPQ2i1lulm2yoCeBIMdaDpqpX6BSPAMr8I3GoFNEjYTWHxFWEQPTd6dqmlPOm2KVvwOQ/sUm/ePGBe1NOG3hicKni5q9r/OF5EbNJLkLNWf4uyGwYS3edyFcw0jYWIkRbWSs2ARIRiYJo2Lx8TaYMrEm113ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJbDhxae01UabguIWqLJcjn+nXpEFtyNWqpKB2H50uk=;
 b=PJdUmF9muUSEonZMsxmcdtsC9uKq1JW7XbZiVRE/uRLJ2cgk0rzrzWmABreHq8c3BSeIFTD1xo1tTdN6QXTlCitOOdqFpvRmBeujk5+FhI9dsi8bAGDGNmDZVZXN7Sn2QN3eLnIgcQ9oAnQga5GAIljPsnebeXaGVfRAx5xB1f9WoLvwEqvku3nW6VjFvQ2utpXn4sqOcX6bRBjzT7SAlcPmMV24pBu6ovm8Piy5pHKEsZSyJDQ/iH8LBfsgitABZHHhp7MPVPoLucu7CVcT43ioBSkRBgEm7NMNnHwjxrJFvZGcpt3RqI/tbalvIMVMFuQj98RjJkq4YnVP7ugDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJbDhxae01UabguIWqLJcjn+nXpEFtyNWqpKB2H50uk=;
 b=WdI7tNOCKm/0bpfoMVvh/p8e2C9qcn8lwx2SUr2l5zFzjiN1TGQsV7PHMZFl21tAth9CeA5KDiNFpow72wPPapTsjB5AQ0WYaJxKZtYMfrpHiy8tbKbTPNLWWZ/GjLbZvpF9pS8dNq+yfLbjVW4SqXtFQPYUPBRN1X9yoO7OOtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:31:00 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:31:00 +0000
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
Subject: [PATCH v4 23/24] dmaengine: dw-edma: Detect and recover a stalled eDMA engine
Date: Wed, 29 Jul 2026 23:30:35 +0900
Message-ID: <20260729143036.3087722-24-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae00350-f767-4ac3-2aa9-08deed7e02b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0jERVJM4t7pZqvCGHXZ8HOvXuJLpErMRGNQeB0vFPz+AJaF7rpn7QpIMQ2L1DEWDpzybe9vxj24t4W0vLUNM0JaPiGyKQeEpF7XjAR37Ez9crScUYPANB+uhfeu/uwaAIGPZLnHKJoL8rn+FiIiyqg30AvUSZX9oV6ZFKZG/fKQS1gMnidJppPiRfRcroT1GTRJJtR3HJ0iVFaZmPCmD3m67+03wUaxehs6+WVG35wvd7jxxpJI4MpsCTytWWm+/Cwi+lANM4c5+Bicrp/d4KX15mijSNW6ARe5HCv7AUOGAuR/C6LBkrKlTzQf/4lqio8wTdo66z3/EXA6Mv2LTDl6VLWifB4xW6mT62LVc8iImCZW36fuKHGzRdh0JWfDiRCvw5rbCBmIOZ0huBSFvRoIyK0N4Skma2ajjijXNcmjtvLoUd7K9JQlcr8/A58xlOoozUYFTHS/CYzfjdfQ8h33uBw3/5EhddYJhV0svADh97Jit/ElCPoD8gVQHOwFBCrJBQFcJOrtgzZyLG8G2/P87r+KSupXExB6uV3xMP6jgwX7ReWaUfFARblKVz5hkMzfGtCi8pv4hhhg9Ki4WC4gJkicufu5htT6QFxoQf/V4o5urB010aw4DGtHLbfD5x0UBZuSCjQ5BoTuPi32TECjlrTvKvK9L/vkO/JM8zx/YKnhRLBJ4VntMmQtoqkFYAeHGw90pT+BYUlrtr+A9kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0jjWxO6xRa4fpqCjoVFRtHRXVR+xRqucOsKRgaXXulFguaAI5JWHfMa8NINi?=
 =?us-ascii?Q?HVczJg4Ps3dow12EJgisCdJp1ceFyvEI0xUsBUV3MqYkOe4xJ7wGANUX7eta?=
 =?us-ascii?Q?IE1Hnn5es+CDHTBuEGFLnv2ywZJOM6yL+LLSK9GWgvQ4FHSHupw9vn0IPFav?=
 =?us-ascii?Q?vTd48ZerxFiqLNzy26DwsojRYGjY1SmayRw+sXhngtnqWfoeWHicDCvjxNRw?=
 =?us-ascii?Q?9admirfQfj+OUKvY++OAJeHfBTG2rip+8lA42D8TPjXUj7zzFe1l7Zn5SKth?=
 =?us-ascii?Q?XEqVkGmrhFcqnEGTRd6NXHylG1A8dbSHkZf+gSAL4gQmjmJBYKHlN7gZtBTS?=
 =?us-ascii?Q?PMoRQecdchmVKK/vuhI/ID1bUBgt7MydJK17QPoqfGpoAdXmkIow30x7nWHv?=
 =?us-ascii?Q?qLK4hLW7NjE/6bL7/WQ9Xia4R/TFbG5pQZYQmXJ87JhGf5Nh/LL4CQIGFgWT?=
 =?us-ascii?Q?Wtz5RZ1o8wx/2luIMaXRbLiijkT8/VmK+R/33ngQOoAwV2fI0aFyyMrM0WyM?=
 =?us-ascii?Q?iqsix8di9lxdzkGw6Ge8x2iQO5c/oaRddP27nDriVkTttnveoX9uaXDtad4O?=
 =?us-ascii?Q?lY3uFOIvxdGSH22Pb9dvC5q+fKsoJ8YLTWrGizJItFDhTUcwE6B4Xm5PtNN9?=
 =?us-ascii?Q?PV1sDyymZyU0+ZZI5q5l5SjgrcDa6AfTCtqGaK2PoXWXetgxJL7FXQyfQdN/?=
 =?us-ascii?Q?ZrQv9e0pz9jy0OAsI0j7W9zRFf7uoZTg0rUDiOUHNojgfnAkZ2GGQhiO6gV2?=
 =?us-ascii?Q?TO9rvQmdV+1fG+kOscNwKztWQC4t/NXSJ62OHKg3Gx3weO81RkIq05uQ2sR0?=
 =?us-ascii?Q?iKW3v+Dveeo0ISyYEKflZP4PULIpt08DTsUyIgPkpMoe690RVH68UUwC9FcI?=
 =?us-ascii?Q?Kj0s/Sc5Ow8Q1jtVmIVJDiv7TBfbPdJ/TK3kIbUwyfAwo8qzvYChrwF/A8pz?=
 =?us-ascii?Q?dOsgRglrbgLxvMmCq0b4QTNMwCcIkzJMMzrBqTWBg2LPGqE5S7SLAd+8uNYL?=
 =?us-ascii?Q?LAnvscqPnVl0nj9nqNNV2b8Jh/GhoXsBz2Ae9qa83MD0KGdhHOsjs9ZAHsmW?=
 =?us-ascii?Q?9ndby5ySXo13y3FPizl9/bQviRtguGRqij1wpcskQty4Te3Vb9cO9krYs9MQ?=
 =?us-ascii?Q?Etjw98SJc3oQ+oF7nnW6Oxb0gRB/u34vBcpzaLSMcKccIyWGFimRzNImGj1a?=
 =?us-ascii?Q?WrTxJCYuukOTa55hTcYEyKemGsaznLt40Wa0Y5oHxnUgVrFAx+mNG+VlP4bt?=
 =?us-ascii?Q?0y3UUmKYKbpFxeWh2k8/iFYkgHuta6xaZbUrsinNwb9+OljnqztDNRJPzFSH?=
 =?us-ascii?Q?xcIB2OUmhdTYH61r3n6VUZIARN7UPJ0GhLSCBhOu2QKN3KyVA0Y4p4W7Pvkf?=
 =?us-ascii?Q?aAkUZ6+ujD3rc8L4c194R4RJE734VTcBZ2CVBdSOWJaoVTzxranhULjmhPvl?=
 =?us-ascii?Q?m7qOPdPWmuL8R9RX8y1ptXzVBDBNWBgzFuqLfw+BepdWwtU9XBmQkkUnZ7cT?=
 =?us-ascii?Q?kV5aihF7jytGvB8akjifnSMxTiTM5GpBmA7brDHCo/TwqNEIlIBxU2/erxgA?=
 =?us-ascii?Q?3/m+yYiqmU2Me3ca7slUwcieXHl7TxtwVJh8AIh5W/TdPVOLGRWLyZAPB4qR?=
 =?us-ascii?Q?SJTo20Ja3lfvhoiBINcWiBMEVzZfuuy5weDLScYYrVfnjSXZc13GdpdZNiZM?=
 =?us-ascii?Q?fbRH5f37G9i8Soj1qq7uH5TcFjpHILzHdopDtW/hdRo3qr6QkR54n33CryNY?=
 =?us-ascii?Q?Q9WJVeDMiQDxU1POjh4nq3HvABhXc0lxDYE3450pgyW6xxynHECS?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae00350-f767-4ac3-2aa9-08deed7e02b3
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:31:00.0650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeiEyUbS4/nyfatwdyW+2pIhhef0rkImVE1WnfeK7/RK2F81eCXn3vFOOFlddo3XmvllTlTT0o7oiwzQ/rTlaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

Under sustained multi-channel traffic on one eDMA integration, a write
channel occasionally stopped with pending work, no progress, and no
error. Repeated doorbells did not restart it; clearing ENGINE_EN did.

LL progress accounting already schedules a bounded recheck when a DONE
or STOP/PAUSE drain leaves published work running. Reuse it for passive
stall detection. When a check finds the channel stopped, run the normal
restart or drain path, kick it, and arm one more check. If it is still
stopped with no progress 30 ms later, queue direction recovery.

Queue every recovery request and let the workqueue coalesce duplicates,
so a request raised while the worker releases channels is not lost.

The condition uses only generic eDMA state: published work, STOPPED
status, and lack of progress. Providers opt in by supplying the recovery
operations; HDMA compatibility mode is excluded because it has no
ENGINE_EN. Normal progress cancels the check before recovery runs. The
30 ms threshold is empirical and should be validated on more hardware.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Keep stopped-channel rechecks independent of optional direction
    recovery support. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 52 +++++++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h |  4 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 616b0658b1ef..05b9ceb0b920 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -259,6 +259,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 
 	chan->ll_head = 0;
 	chan->ll_done = 0;
+	chan->ll_stall_valid = false;
 	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
@@ -300,6 +301,52 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
 	return chan->ll_head != chan->ll_done;
 }
 
+static bool dw_edma_engine_recovery_supported(struct dw_edma *dw)
+{
+	/*
+	 * DWC PCIe Controller Databook 6.10a-lca06, "Legacy DMA and HDMA
+	 * Software Compatibility":
+	 *
+	 * "HDMA does not implement engine enable, that is
+	 * DMA_[WRITE|READ]_ENGINE_EN_OFF.DMA_[WRITE|READ]_ENGINE field."
+	 */
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		return false;
+
+	return dw->core->engine_reset && dw->core->engine_enable &&
+	       dw->core->ch_transfer_size;
+}
+
+/*
+ * Called with vc.lock held for a stopped channel with LL work pending. Queue
+ * direction recovery if repeated doorbells show no progress for one recheck
+ * interval.
+ */
+static void dw_edma_ll_stall_check(struct dw_edma_chan *chan)
+{
+	struct dw_edma_engine_recovery *rec;
+
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
+	if (!dw_edma_engine_recovery_supported(chan->dw))
+		return;
+
+	if (!chan->ll_stall_valid) {
+		chan->ll_stall_valid = true;
+		chan->ll_stall_since = jiffies;
+		return;
+	}
+
+	if (time_before(jiffies, chan->ll_stall_since +
+			msecs_to_jiffies(DW_EDMA_LL_RECHECK_DELAY_MS)))
+		return;
+
+	rec = &chan->dw->eng_recovery[chan->dir];
+	chan->ll_recovery_pending = true;
+	dw_edma_engine_recovery_queue(rec);
+}
+
 static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
 {
 	if (!chan->dw->core->ch_transfer_size)
@@ -572,6 +619,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 out:
 	if (advanced) {
 		dw_edma_ll_recheck_cancel(chan);
+		chan->ll_stall_valid = false;
 		chan->ll_recovery_pending = false;
 	}
 
@@ -763,8 +811,10 @@ static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 		}
 	}
 
+	dw_edma_ll_stall_check(chan);
 	dw_edma_core_ch_doorbell(chan);
-	if (!dw_edma_ll_has_hdma_stop_event(chan))
+	if (!dw_edma_ll_has_hdma_stop_event(chan) &&
+	    !chan->ll_recovery_pending)
 		dw_edma_ll_recheck_schedule(chan);
 
 	return false;
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index a902a24d20ba..cb3ff23143a2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -124,9 +124,11 @@ struct dw_edma_chan {
 	spinlock_t			event_lock_per_chan;
 	spinlock_t			*event_lock;	/* Selected event lock */
 
+	/* Per-channel stall and recovery state. */
 	struct delayed_work		ll_recheck_work;
 	unsigned long			ll_recheck_at;
-	/* Per-channel recovery state. */
+	unsigned long			ll_stall_since;
+	bool				ll_stall_valid;
 	bool				ll_recovery_pending;
 	bool				ll_recovering;
 
-- 
2.51.0

