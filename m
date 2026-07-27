Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021110.outbound.protection.outlook.com [40.107.74.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3C3EB10D;
	Mon, 27 Jul 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171842; cv=fail; b=IpEiIwtdyUqyZ5nL8FwmBhQ3JpMA0NHY4OW9r2rDYJX8Ra6e/eD/3GH+Ei6cyzzYCxVw1mspfdP+G2xM+L10PVz0QGyAQ6bWYG/vwH7igMzUtKZ7FBEpunTzVKSgcNtvxcyTSxQ+hAtFihcDkdfMjCCjkwOluXdFjVRhPXhF/Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171842; c=relaxed/simple;
	bh=ecLSK2ta4tLy+P5QjZ5tEkZmsilZnQBrTN8+fKbKnxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pvCVa29TTz/PIjZ/+TtukMF6rBlxwKm7vXZQcvSZ0ojhI0h2CWGYZNggBeTRB27aOhu0DmrsuYFURKLyiF6gwVa057JNbFLXKz/AMZUMBMRJl4kWWOCOhTZQImI4pjZHvwfUzuTD358211WeDRmmC53dnLEm3fZKdKSh8KtuSMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=C0Fd6NPG; arc=fail smtp.client-ip=40.107.74.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="C0Fd6NPG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJpt/oMD/syPKk0C2em8K9auDF+aNm25aR/HqlqqH4bcaDE94Xwbhehbuw+xr4/ERO8E5FlkrkOMuSQhBv5mQuP0Yu2GFL7i+lwgoBS8JQoN5m9udKxW1+Js6Ef2Oe/n+IfG0AfEiuSgTCUlcmqOgP+/1l8hzLIPDMBcebIjOgkPyg0OharE6Vt7nUezLd2Ht8MgYd4aEf/vNVHKZ2vtkuR56RHYCl/VEH6F7KdD9BvkiVySrASn0IaU5DnsHZsrv3jNz4xoOCawyKE/fbWfy8zhCCY/eiWG8SmFGUKSXauOMcK86KfqV69vZu4aDj5aCHjbNHdi/b+vWkTNccEzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A77ZdoIF+M/rPhnC9RbuS/h1qflBpgMOMgZLC7J6CsA=;
 b=sQ0ZE14J105ZI+elTMsCHk0yexKAMB/voDmSrJtsoyGyZJ/oHXJpSJO0aDYT0VO/ZwSoe3d+ZDRRhqvLCTYpnUIeCnd7hWA1ssZTPS4SSIjsG7xB0zDlJdHvrXcNbRtl7/Sj0vH17DcWLxl0/iup/ePL/WPNPznn3ZUyBzzyguHTO8/JeRg9cHbddeV0QQ9Ayw6EpzwHWFNPqPxLSneKr0FQW71hBmXz0ni/jRYC3tITMWV1NnfwtVn1UoEWnklMCmThB71ee57JaroAxOZCdow4OB7FuJfqIPlQYkIHksiB0umHv2aC6ItF/qinnESCeC7bEjLUKMgzXg32XcvyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A77ZdoIF+M/rPhnC9RbuS/h1qflBpgMOMgZLC7J6CsA=;
 b=C0Fd6NPGb74uzQpCANMLHtwe0tzHtkDewIdZbBDmGxipFsgOEtMfoJa6QNJpJxj5LpUeLBkQvIumFGoqyRBeyv+VbO0g3gjdSAc3KHRyL6UaI6d+nD1C5R8JJ7Gt+X61Gt8NH6QabRnlpvrgsuqy7IfmphsWYP3CsSS+FxUsq9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:50 +0000
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
Subject: [PATCH v3 23/24] dmaengine: dw-edma: Detect and recover a stalled eDMA engine
Date: Tue, 28 Jul 2026 02:03:22 +0900
Message-ID: <20260727170323.2321369-24-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: ed396180-d35f-4961-3b34-08deec0107bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nowamNGFt9JQYWyVp9dHjgVIjsybaWxQVoVGUb33sAnCakIEi+zY06Bh3gqbNidMVSKQYwvm7J819m4xkEh0/b0NaE/uL7zke5badyfNcqhoBAI2BdBHzAkVynI7SyUP/yodhFI+izfxAfztmBLi03lcvGr73zCU9JEE4WxcKk3HdgIt9s2djHJoH8T6s6X3WYXOKLQmqUL2FKiRSr/OcxLhthHnywhRJeQAHEEXw060w97jibdk7iH1JFVizP7gUrHpVdkX8R2PuwIXG/I3eGwBIl07A7B7nJV777qmL4M+V/E32GSd0j/huVhSiAnG+Ln7W0zU7o/JH6TyXeYByhgjT8WFcTOnbCNZ+c8AHpMLtbNzZls5m3St94U7RDSUw0zraZdZwCcEGaY23/1E61WG613az3A9ZUf5/X0r0k7FqyQqHhV0R4PZJA2R7KnzZBH1Or1afdKYKTElZjdB9vCEzkb0gbia/DWxWzltAJKj3mYd6VJ3KMnhqABppYSKUXIDeIHrK9UCv2eCmHezoOtB3eRwrY4LmFLly7gmx26ZWKF3iVfHIVI2Skog9LUxwpoi2uOepdKHVbJ8uPxCIfgr9OMPggAqloROSS2r6ZSCwKOpvR1s8sOiJPrEkfANQJU2d3654qw5cFRwCjMkMRrb54MfqbEC0SBn+WEfT6SjyqhOvCgLRIEKElyDJuZUQNnp76EwWyDQLE/wMdPe5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vyWqdGdo13KGyWX6bkhbpi/xhYUm867OaYNjZPB6tlFPJGCYIEr78aGYQqsa?=
 =?us-ascii?Q?pGsLnox2JYzVm4iIwKO9goXI/f4GOWhEQWtDE9nzhuqC6450faNeaCOplWYY?=
 =?us-ascii?Q?OFk4COYojDkJteVV7Hx410Gt+aiuNzYFujGm5z9ZJqhlXuoEpwnMyYxsQlAO?=
 =?us-ascii?Q?xRyhhn4KcIHzFJU+SW81a0SBrov9T4TI6ubRuW8y+Myiq6mcz2P4E50u0w+T?=
 =?us-ascii?Q?54ee9oh2Vkd0IYDXhfZNIv2LhKfvsDbS8aH6sFuN7ZQAxtgBcPqq1mEUkU/v?=
 =?us-ascii?Q?Z5optFxCs2pRm4+bFabRJZe9BEtZiywc2Cksywq60pdD2HBZPCP+itVdZJQN?=
 =?us-ascii?Q?fmZAdrP92yjwj0i1cvKIqB2mwYSKCOxf94M6pF+0LfLRFo0SzU8YCdc2nIx4?=
 =?us-ascii?Q?Y/hVpzgcPd7drT6DjP1rVela86zZMvfDINR2/nHDf1pd0Q+Wgr4pgC647ATw?=
 =?us-ascii?Q?nikFyi49hlgu+7LcnZKWO8nFz/gV7atJbs8ldwgLwyuYkbBG+d1Rz1HAhbmm?=
 =?us-ascii?Q?Vm0Offad4mRJcs+V2UCU6c+yCDlwV2zEeeSYD5NKimjJOdjoTHwYo8NSTl7+?=
 =?us-ascii?Q?QtJDZIM9pGTJ11v6PNxy7/4zHMSQWQsVcN0rEa8ia0ruDtFWSoITW8iM/2iL?=
 =?us-ascii?Q?SEGb84ZB+VCvhBBoOxvm31kbEOtIbiuwUbdJf7bzoEhptXn+C3//+AFDtg+6?=
 =?us-ascii?Q?UOGE6Ok5zHtodeZxiO0eb6AuRasIgUDgo81Lb49RALVWvQSplZ5Z/65WmIM7?=
 =?us-ascii?Q?NG2orJXJQlznBSMK90vaedEynpTsJUl1b/NVmQKX66VzLfiGBRBH0fuaJZED?=
 =?us-ascii?Q?SOMLrvEdADI3kOOVSAVAvXmhlHmJJ8nUT4V0hro5BisNEp60fx0g9rqJe333?=
 =?us-ascii?Q?KoHJ/NCo6A/IkZLb3HZaxJrZTwSVjhR2Oc6YqKR0HCG1TYEPUxS01NfNjBF7?=
 =?us-ascii?Q?vXaWOt43jVO8Pv2e/E9iri7nFDFjUKaXGe3ncm30ZGUggrHhDInEo7cL/2OJ?=
 =?us-ascii?Q?xBJkmUs6nxD9M3ip4bTnyqIefDhsCLtWGza7K6qbUZpDx/Q12ll2Kfv2I2z+?=
 =?us-ascii?Q?b0IteDiQwrmHGlK9MFOYd7KEChykFvE3VVG5TIaLQ1ytNAZWbd5BsuCmgnOm?=
 =?us-ascii?Q?p5Txo9z6cI79yoR6w08ruFeWk4OAygYCExqP2RDtDgBdY/XhFpvHoMu2aBQA?=
 =?us-ascii?Q?5ExQQCTcsDu8hnXY01PS1BuEBD5JoFNUyDtc8GS3L+7L99H1SBuPfxiAPEdS?=
 =?us-ascii?Q?u4kwcbEnXifbEI4p8/64eM0K3WoMCjSKoCgYuzvTA1ZiovJEuIZS3fTjFGIj?=
 =?us-ascii?Q?MrMWJhR8Cm7XOPDP1+IMEbdQjOr6+3URO6DcHSQQ6GpMsHjmtnTwEgPTnStl?=
 =?us-ascii?Q?/3KRMT6ePZNYTS3stDfgjcgDaD8ZZBv9uRAcKkKQb2Rq4uoO/VHqnnvkr4ja?=
 =?us-ascii?Q?KZBci6wcoWfeX37Pyc4uv608Y2oKl8eBs3DOyOi/R6RoYu5o/dMaxAS0GGIX?=
 =?us-ascii?Q?xdrirvmPO7t47jRSx/8KFI2iKOY3co8VJEWlVj1QGFLkeTUjTw/RRWVevENb?=
 =?us-ascii?Q?1xg0kzRIYOGAvyi2nR3b/0bLBhFG/wW7kkivYFw2YxCgRZMZtHja2uyzaaa2?=
 =?us-ascii?Q?t8Z6v5DSRxkIARkukxgmSP36Ce0Xa/n1EzaIBV5+Bvq/TynsSkzfg/GICE9+?=
 =?us-ascii?Q?v1yAmGT6X4ASdLFLzKf7ufJiQHMUHtSMpBnVYOQe1VB1yh8rcjFdslDO34f3?=
 =?us-ascii?Q?Kue/gSBNm4m02HfdrKknl0Otig+Pcre8XWd3GVrBk5M7dVj3pzGA?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ed396180-d35f-4961-3b34-08deec0107bd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:50.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYGpfDgEX9X+1q70ODLcwOLrCW3iJXXYV2H0p2Dc5aHqINaS0x4d+7+x4AamMWbrOEMEBvdcYFWtjre3PF2Nnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

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
Changes in v3:
  - Reuse the bounded LL recheck for stall detection. (Sashiko)
  - Queue a recovery request even while recovery is active, leaving
    duplicate coalescing to the workqueue. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 55 ++++++++++++++++++++++++++++++
 drivers/dma/dw-edma/dw-edma-core.h |  4 ++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 56032137a4bb..262ea893174f 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -250,6 +250,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 
 	chan->ll_head = 0;
 	chan->ll_done = 0;
+	chan->ll_stall_valid = false;
 	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
@@ -291,6 +292,54 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
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
+static bool dw_edma_ll_stall_check(struct dw_edma_chan *chan)
+{
+	struct dw_edma_engine_recovery *rec;
+
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return false;
+
+	if (!dw_edma_engine_recovery_supported(chan->dw))
+		return false;
+
+	if (!chan->ll_stall_valid) {
+		chan->ll_stall_valid = true;
+		chan->ll_stall_since = jiffies;
+		return true;
+	}
+
+	if (time_before(jiffies, chan->ll_stall_since +
+			msecs_to_jiffies(DW_EDMA_LL_RECHECK_DELAY_MS)))
+		return true;
+
+	rec = &chan->dw->eng_recovery[chan->dir];
+	chan->ll_recovery_pending = true;
+	dw_edma_engine_recovery_queue(rec);
+
+	return false;
+}
+
 static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
 {
 	if (!chan->dw->core->ch_transfer_size)
@@ -563,6 +612,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 out:
 	if (advanced) {
 		dw_edma_ll_recheck_cancel(chan);
+		chan->ll_stall_valid = false;
 		chan->ll_recovery_pending = false;
 	}
 
@@ -720,6 +770,8 @@ static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
  */
 static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
+	bool recheck;
+
 	if (chan->non_ll ||
 	    chan->ll_recovering ||
 	    chan->status != EDMA_ST_BUSY ||
@@ -754,7 +806,10 @@ static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 		}
 	}
 
+	recheck = dw_edma_ll_stall_check(chan);
 	dw_edma_core_ch_kick(chan);
+	if (recheck)
+		dw_edma_ll_recheck_schedule(chan);
 
 	return false;
 }
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index a2699a663260..0c9c17edd835 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -127,9 +127,11 @@ struct dw_edma_chan {
 	bool				abort_pending;
 	raw_spinlock_t			event_lock;
 
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

