Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48640DB42;
	Thu, 23 Jul 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796138; cv=fail; b=Tk91CUYWcwq8PUeijOUkW5kTjN0/EtV350CJRGMOT1a2FeakkRkI/ToqHseMr6FRqyBjr8/rvWiL/n5I5wSLS/LAFdwebO8+MuagzPZ3zq7E96x2KAjK8o6i6N1EPwXeVDWnO6zPuSgMhSjaWcZvDtKt9CPYzHRd+ms5uta+GlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796138; c=relaxed/simple;
	bh=HhpLyB8p14HhBDm22JYiy/dI7PSKcDX0Pfhk1dWBzRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BnzhBxwUmTqSgwFqiCtjsmFrbOf2NJk8/VI9McCbqj4oQLR/FE5Qi23inEHANaJFBh+60JVh+xFakZFvOwf9x+i5KB13zF+MG72oi7xd41JWjNnFsU5pVXD79dtVzd/IYBqSvGkDcHBgKBWX8GlWEJ1TqHPhtHe6YVEjDzNMnXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=NTDBHwmZ; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="NTDBHwmZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbVvkLxjbClVrnoN2cftRwfA/kZk8LEDmdGZFIgedgVlKI6fag1+0dXMpu04foPepaKfUa8hDvV0SncqCcHzNakMgao2z67WJ1VTJeG3Sy5u7k0HW2ih/87vcHfLo7Fttz2KzdguOFK0zu66/QdrgNVXvTw1uzGedgaZt4zOBDsIHUw0kH/9x9bWBPzEQJHzPj5YPIiwuAD+tJFJHZGAEen1U8OEhPF/P+ZoZ4KKMlH8B/dQ5Nit1JkP1faNpzBhRL7mAIPFjcKpJ7gbY6YgT1FH9fyM29qRA+BJjPClWBKpSQEO4i2OKKoPJ7QrgCJFMQlJ3LRz3Qd5Ro6QRBoVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPMkLyRRbbsjy0orNkHe5kjuFcv7ih1pMf+YrC+c89I=;
 b=VPeZdSJ6AZNzHWYZugWUmp0VQVE/IoEub1GGR1TztxQ0E07FQMPWtFhMLN3Y6WsltHwD0jVAUu0Pyl6JHvb4JDpv+Wpl0p4M8a9+ipl+6AARxuJTZY87W/YaUA84bPQUf5NdppXMeklHZgWOU4IyUc1kRBWyHuN9s1cd85VuQk7g5JiAwkGhRrdCcTLXY/ki8+NsAnkfwVHa0BsMr4l0hKTMYbk5erTs6pyPd0lkF4RwMTcwng7RQt9D3KiBcaDIMYPsUWaZVD2E9LaDXHMFGhby9Aj4Fvy4fm2V1T+ZzP/aMm5ZArSnJ/FslTSfpgWNvyj+m93+CZukRjqCupfCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPMkLyRRbbsjy0orNkHe5kjuFcv7ih1pMf+YrC+c89I=;
 b=NTDBHwmZIxZxZRS7KBhvxL+wBGsHtsk10qC7zIBWcMehLWfNwosXCzkCCVH5+LdZo18P0GFH7eCK0SJSBYRKCiywYR2wGCswWdhMd05i6DBx6CdCweae9AcoV8DOd9xekClQ7maiHu/YYAI7/fiQhFPmgypQJkeadLXW+KoJ1TI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB6486.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:416::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:12 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:12 +0000
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
Subject: [PATCH v2 18/19] dmaengine: dw-edma: Dynamically append requests while running
Date: Thu, 23 Jul 2026 17:41:49 +0900
Message-ID: <20260723084150.521366-19-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 67aca03c-4239-40a4-193a-08dee89649ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3tLPCCjxDNytorwJwBfopNPj1MwV67N/PC0a772uuZhIB4Kg75oyfVN0rPDifPPn22Pupx7BkT27NV2EDwR82kL5OZlJlhYDbR5Q/H2KotSHDFZcPYYjmzRSk208nW78Isq//Y4S9kWY0l0KY2Z4Cb/KpwIGFSK0bPmxzQw2yIBCXdQqiXtzNFuZ/pnnE5csIQMgWFPHMvQER5p/GyLZkiRcnt4klW6Yko2sN2aonzIQugkXORH/oUsDOVAd93uRajCLY+vGsFEceBCWLQUXMu1ms5UL7NZqDZ08PPJO0jaQSlPuy/PLeX+APGiD0hexdUQDQRInn3z6gEHDWDmzWrUohOAcpNn5ytP5KLqyvIlHsKNusKs0nuIwWy+vhit4RzEP98kVIhd4rBYX/7qK4c6oWoi+/Gw9Hxt1xAc0uOXTXOXb8yocvgIQUuOsX4ZO3sbpD0RWo7o9bjWpWH+XA9+esJsTPgJrcnOZHcWaIf9VKgZx8cKktf/hlrhzaE8wHUKm/0T+K6ykSGnX282BN5QUB3VhYR5jIkeiSVJbI4Ocu8D/W+OZQ59uAAeUTFG9MvfTFqe4HQVhja5ADkP0GF47AZK4GZ+MCdQOpRIFLO+Scv3vvGxkimQaebzgRgd13XzJ2+Vx8A8fK9YMapT5zbXRuvq/9ZC9B1uPUl/gDVJa/H/V3IiS7NwNqJgbyZWS+pCWrwM0yCPSQVKK6w0o3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WXg3UK+3HaOBmtAbfokZm7jC3uyny+QVTwcRGs0vUtmJBO3V3h5p75JTUWF9?=
 =?us-ascii?Q?BC/W0LSgnfReesTNxcQhI4kr/8g1J9AidYg2l5/2GhWCnc+63AnNpEeNNwN8?=
 =?us-ascii?Q?mGqJEE6WkVGVFtOET3GkTH9e6BapOH3T5foo6Xu3kshoUG21iZtuiKwZugbh?=
 =?us-ascii?Q?z1AaaQuogf+bEj1RzZBfPB3QrSkHnC0+kIG6ub/syUVVBGx5aypmxir67d6/?=
 =?us-ascii?Q?fEr6D9axDiroteAyKU9Dzjlqn3ZzBe5HoG22zl19WN64kE5Mq7wOhh3etdvG?=
 =?us-ascii?Q?JSDG+TjvSuauTP1BIYD0T1B+OUcKJ6bi1Vy6STGHJqkvUaQf1a0RsZov9WD/?=
 =?us-ascii?Q?rM2dG54ivhlajDCLFeRfTnwHsvnFzHbKPKbOBrNM4CFTnLMNaq514lP/KCDT?=
 =?us-ascii?Q?v0znMXcMt99ZNE34+tiBu0p4MTRzCppec/ZOF7EK8hoaNPu0o135EVUb4wTi?=
 =?us-ascii?Q?fI2J16pBQ7h6EZn5jFUJ00LROCffY8SricgiLu86QtvrJd0XftZfvyCilCZx?=
 =?us-ascii?Q?JALbdDawVYU2uk3CKx/cnFgSbVWXFeAv5x6lvRf+bVT9OUmRSNwOjnlClJ7x?=
 =?us-ascii?Q?ZfupcZ4x0Ba1rOzOE6Zz+WK5hrDONZ3SoJn2tBvuuS15IOI2EU9iVXEAAWHM?=
 =?us-ascii?Q?51DDvVj1tp7DaKRqGny7+mc1/nm5/q9+P7b+xeAKGhwEcc6YsDwpVkDs99oa?=
 =?us-ascii?Q?re7ZNpOS9qyceMw0oShMtIoDtmp7GLSQZ+oqoMoS8qRIPMVDiH8F9QoDJ5dz?=
 =?us-ascii?Q?KyQKYBmzBieqhuhodbBqvnTbs576ROKqTBn7+BFn7q4j1qSTXxbx8W5lFEo3?=
 =?us-ascii?Q?iQepn4iKON+VITl0sLkbXxHS30Nwawl8nQIgpprP9XMluEyHFcAv72a2e0G5?=
 =?us-ascii?Q?n/RJm8BfGre4twcdzSmg9Tqek38+XqDww/uWbNJZ3wDLWp9AHnk0NBvxNH32?=
 =?us-ascii?Q?k0lR3kGxz0kaHBaraq43m3kDNr2qY4iZbNpkQcul+i/j78wtxsoK3gPGhkhl?=
 =?us-ascii?Q?tcLq8Q6lK1plxaqFZwPoFY9SXkPGhiiIopjdYkxudhon1i60ls27Qp9NSr/O?=
 =?us-ascii?Q?WIS7Z7F+hIeG/JOwNATVngKnB4DWSIvpBiCXIGymI6QSsRq97qqXynbnDOIH?=
 =?us-ascii?Q?wN0GgAVAjsxpM0nMg6EaDYur70IaCc8W4vsiP27/2x/pfQgP5Ep+MzPdyis0?=
 =?us-ascii?Q?2VChpvSK0tcITSKegCqcVxBdG8vXs7vsPy5QtbJd8J5KqojAoterQGvokTiG?=
 =?us-ascii?Q?XdSr6Mb31k1ARgfftuTq3W1ojr+EEvLLzQ/RwhISjuEyaSbr4Ha/iORDaWDK?=
 =?us-ascii?Q?22sLq1TBHglBFbN5AF0gO3VqMs3USdVU6qIOXMPZNh5ZfuNgj6SVFV9g0SAa?=
 =?us-ascii?Q?AQxxW99hIHcQgdFsMX9eD8pkRnFMtDVI/3xa3UmrwujEMhAd+MQmsbQ+Etaw?=
 =?us-ascii?Q?TzcfUaxVEGwQMSFbDxqgUG6ejCMWVGsJT5+AfGLELjRz+JXdCdN+3XNseJvb?=
 =?us-ascii?Q?NUJVngXCAN/vddYTnbTyhU/uNJrpTB8zx6JRuac2OCZIrdKx6YVNjCyQtrM6?=
 =?us-ascii?Q?mL/jJea8Z+ReaXNrTtCvvbFFHr0iZMvFJkLGVN5NH+OT6PlUaMXxouOMJfAw?=
 =?us-ascii?Q?YfRqmfuYEd0AhV10rr0DZ1bXDCe78zB/uPD2AoVpxK4UKR19nPCWCQjH6sNk?=
 =?us-ascii?Q?ctgdRaBVaphCsLWzf10b7bc5AfQ8/t3QJ8Iv00cv+95fjKmoRI2LRDE2FUao?=
 =?us-ascii?Q?qQZIvc+lbBQhzNexSDAD/ipsV2pF5FBEiJ3OZm+ZzX47613iihvT?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aca03c-4239-40a4-193a-08dee89649ea
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:11.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTugGsJGFcMi2zkMHnIVSJwMRUOIp51on7ZHv1NQ4NCzskIoOJbBm5VirrHWVIrJKmwdm0tjl2TiDIU/SCXi6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6486

From: Frank Li <Frank.Li@nxp.com>

Publish issued descriptors into free LL entries while the channel runs.
Skip descriptors already fully published and continue with later ones.

For LL channels, dw_edma_start_transfer() reports only whether this pass
published entries. Derive BUSY or IDLE from pending ring work instead.
Let issue_pending() feed a BUSY LL channel when neither EDMA_REQ_STOP nor
EDMA_REQ_PAUSE is pending; non-LL channels remain IDLE-only.

All kicks still use the common doorbell path, so running channels continue
without another kick and stopped channels use the reconciliation and
recovery paths.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Enable live append only after the progress and recovery support.
  - Keep non-LL channels on the IDLE-only path.
  - Base resume state on pending LL entries, not whether that pass
    published new entries.

 drivers/dma/dw-edma/dw-edma-core.c | 47 ++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1b9ba34b25c8..1ccd3783181e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -323,25 +323,38 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
+	int ret = 0;
 
-	/* Stop publishing until recovery can rebuild and republish the ring. */
-	if (!chan->non_ll && chan->ll_recovering)
-		return 0;
+	if (chan->non_ll) {
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
+			return 0;
 
-	vd = vchan_next_desc(&chan->vc);
-	if (!vd)
-		return 0;
+		dw_edma_core_start(vd2dw_edma_desc(vd));
+		return 1;
+	}
 
-	desc = vd2dw_edma_desc(vd);
-	if (!desc)
+	/* Stop publishing until recovery can rebuild and republish the ring. */
+	if (chan->ll_recovering)
 		return 0;
 
-	if (!chan->non_ll && !chan->ll_valid)
+	if (!chan->ll_valid)
 		dw_edma_core_reset_ll(chan);
 
-	dw_edma_core_start(desc);
+	list_for_each_entry(vd, &chan->vc.desc_issued, node) {
+		if (!dw_edma_core_get_free_num(chan))
+			break;
 
-	return 1;
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
@@ -908,6 +921,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 static int dw_edma_device_resume(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool active;
 	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
@@ -919,9 +933,10 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
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
 		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 
@@ -994,9 +1009,11 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	/* Only LL channels can accept work while already running. */
 	if (chan->configured && vchan_issue_pending(&chan->vc) &&
 	    chan->request == EDMA_REQ_NONE &&
-	    chan->status == EDMA_ST_IDLE) {
+	    (chan->non_ll ? chan->status == EDMA_ST_IDLE :
+			    chan->status != EDMA_ST_PAUSE)) {
 		if (!chan->non_ll && !dw_edma_ll_pending(chan))
 			dw_edma_ll_irq_idx_discard(chan);
 		chan->status = EDMA_ST_BUSY;
-- 
2.51.0

