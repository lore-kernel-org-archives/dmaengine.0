Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020085.outbound.protection.outlook.com [52.101.228.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071F38DC49;
	Fri, 28 Aug 2026 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934997; cv=fail; b=PH/zWazQZ9vOCjW28euZXTfSo4X0Q4fgjenOr/CWlcde0jRR9JxPU6ehEWPm0nKyJe0hsR1Q2bhsLRg5Wp2b0M2kdYJozQtrFKhvWmk26+rkWxR2Oz1yvElxPT3yi5hcCpZ+CdcqfZWTZq8P+LOw3cZxK9HknR+zMAnJGs6IjaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934997; c=relaxed/simple;
	bh=E+PdjsMMqe2OEL+1cuoSo6h/w/wwIseGJIUk+iOL2Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m37nf/nFRnwUBCgUIWZxnT4mW6QN1thZnn6yDmM2R8IFXaQZd1mqh7eMNgnPMc/bA7xD9iM19gKBpn5NPsm1i/UsQFl//ebeF688uBEkTUc2wuTL6BbP2XNwTJTmprercQTuIu1QyyanagC1ZP8cPyIK1+1v9F6UiVL9K6C6+DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lUxb0X1c; arc=fail smtp.client-ip=52.101.228.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lUxb0X1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNG7U5muM6WTRuiaJ9h25iOF0b7j1MvSgQbzEpXSJEQXKDu9K/eW51/4VEzP/ukmy6C9k8BvwPuw+1+Tibw7wshumtWLXMQonat8w/+NexZo3Hb9IY0BoYCcyosd6izIPS+3vNDCEfvL5/Q/ijatcSFvhFt4s6YUZUNqIe3Usq8Rzj0SROq83YRmzUUz9xWfCHFIQEBlfPbiUmtGC1xcq8Tdh0Q1UlrLuUWoIE6XvYHj9iOk1rGGQqcVkhCwRjFTwCAsL3GMinn+UJBiG838lpwUXm/GMJDXME61dw9MoFBo9YXJHm0J7sg+uc5kF5G3thiO7vTdHVH2g12jAvxEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5u9IMIo4Nnd/OQyyo9QiDjDV828TzZqPrCNkBNKTT4=;
 b=aTe5YIB7Di9kVwtS355uUZFD51uxnKaTQKn5QomtWs4EbVEDbucO6cbq4XdEX9edTBDqFDWyOeD5gyNTqqVxMtvF3CvwJy/yr/vD7l1lUIRYZMRlP0ne9e2zMAchF9FU6UUFlvCZRAp15NGanK0lfpDL+7wEL8WIgWy2YBh1FXzU4wf1/b1VamNuIH6EZKHqOB9AEeD0B4NgIUZT4J5FoHrZ+0+Zv0mPL/k0iAOw0VESUg7F18pg+vqi0GtB7Cijufg4pavJPBfj4LvbblYg9ol24eGrj+OYC7R/8OJK842vvvUcH0CMXOqNcFLghAY/k42lOyggbl+Mm3zLLbLvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5u9IMIo4Nnd/OQyyo9QiDjDV828TzZqPrCNkBNKTT4=;
 b=lUxb0X1cTY052lYshsN1nxurCEoQFgM3JPtSQw8ZfTaVPKfYEkn9Wvs4Sip700SNR3FFlJnDz6/YP4K7tskfWNhxOZ9MBBB5D6ROAaVV7BrloSzcUwqgVY2ic4d15mWRlAvyetxhqVyGZso26ydIFbkDnOEVEWTFPlz/sJS7h8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB7093.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:36:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 16:36:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dmaengine: dw-edma: Configure remote interrupt routing
Date: Sat, 29 Aug 2026 01:36:10 +0900
Message-ID: <20260828163611.2691264-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260828163611.2691264-1-den@valinux.co.jp>
References: <20260828163611.2691264-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f607b9f-08e6-4d43-97e9-08df05227d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|18002099003|22082099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SI6XalpEobwBkXYPN+Ac9zWVZDIii9K7dUw6gbDSZMDX7XPwSk3UFFtN97A06HY4nc/8fsuQI5m2tdN/BqzUO4cKM10kTFe3DgJIjR9qccRDf3ccRVRmoqerinY4B65uJ8ZTYK2Y2NzmHr+vCR2vMSMUVCTnilkxWVcVZTExYAn15zunwraHAwfDYmpQcZ/FSszz/b/naboMk6WjzMEoJrnrKP/hm/yWtt1KdQshyYeLb45gnCLY2L3OxibEsxJZBOBiIwKI5auJ34f1QmzWA5SpY0uagH02oL2e67G9YFjNSXYfNijZ3J1jNMBf6ixiyPZrijD6FX0/RZdVM8s58z2JqY4rXs/g+eUbWnL7IgV1uWHh+BItXu6eUCzm/0MbfRgmtjJSHKsUtaoKMnS0BgQpuLciSkiCz5zEkX2ngARfQmZoDaojl4gq40GLn4ZXQTsE2/jo6JDXAPzU1G6bQZZj3mDw2P9GAqmO6aJX4S84JrAmfAG2PwVpKhZNG39ZxjXBl/G3U/c5DZF/IxGpT6580Q2+2APdvcyXMRU87bJnD5kfY9eF2cj3BtaPjFBhgtiqdR4GnXAYkcJ7uoHzjaqeAdx6cPCUqVKPxW51n7+cni8u+vItkPKS18DQCcch
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UN98jKiJBbgamXCt4sTFDPDm5C2+bfWm/BZHsJLAfmq4ya8jDhymKHDcMrAV?=
 =?us-ascii?Q?PL8Ht81j7V0DqMX3aHzYE3oC8hE9R1HJQCSkd8j5oXRsY0TkaJDZmeDJUrTI?=
 =?us-ascii?Q?LmNb3VeIhFqVFlTLJ+F2uxCOuuEEdHf0d8LARiG5bagPKWQ/bEk0/XZ1757k?=
 =?us-ascii?Q?KTVm+S1GOfQACQvCBg9tngUFY+6UipbWujDbn2RhvWs6zqtHPJR3RXy9RIsm?=
 =?us-ascii?Q?YPvf9WqeVK6DjM7Biqmad4kC/rU2eUql38RH3meiRWgPpN5HqizOQ33t5o4A?=
 =?us-ascii?Q?cDTpQF1iOiqv8f9r26R+YKfqsC+eV3j1EiIp+JgepZnJnST+viPlqbUiQuNt?=
 =?us-ascii?Q?zaMMb3Y2pH/gni5MPmt/4EeRgfoo87Uc+S8Qkq89x723Dal7KqMUKn2WWk6Z?=
 =?us-ascii?Q?HpLJUopztNoUaEgL5g9hRqupyOmWQvF4LdGSJJpdwACXzdPmErRe/2pCjFL+?=
 =?us-ascii?Q?kBNSWkxjku6psezjhLFCx4GvNavmII0Lt8JpaYAJE8K1Oj0sFAOEa39eVgnv?=
 =?us-ascii?Q?u9id5OYY8x6LTJCJPFeKTe8Z1qA7yoRp3j3VI9IOOkvu07rcqxvmIcppqqjW?=
 =?us-ascii?Q?uPZCAftA3szMnkz9SWhXgcCLwKbqY5Dq1IYb7riJnEvKGNFKSWe6x/uBDUlm?=
 =?us-ascii?Q?PT8kFGtqRUsMDKqu02tpNNNIvrCye7BTEt8kn1RcuOOuvZVumqGyxvy+dEVQ?=
 =?us-ascii?Q?fR1CHV61huraKte4FH1wJjZcA81Y3fM9cJJpIeDbN7KSDe5Y+mkctDooCNZy?=
 =?us-ascii?Q?sfLZZGcnXR26DhzuFLhx4OvkziPw4Gzywbu+c9ccyZafheK3ab7VFmW/WmUm?=
 =?us-ascii?Q?4j5vTjijSF2bZwh4tT4dqNu2HMbGfJpNMsw3Q9xRysKzANlWpkIOm569QB8y?=
 =?us-ascii?Q?gNLct8KvQXEZxq3RRQ0UV45iM5D3d8S7H8ApAbcNxAYpGuYU5pt67tXz6vIT?=
 =?us-ascii?Q?PEpx9gqf/rKrK9FqfJoE8hT9W8vgV0jNYOLpVKlKg2dHqBhLRVXwTQ8YSgqK?=
 =?us-ascii?Q?jz1nDdbKY6DrZmVhn2T4mKEkohGIkHxI1CWGq58sCVuTjHzrh/gzvkT+bA3c?=
 =?us-ascii?Q?Lzsmj/WqWXl4m6o2jcTDty4qmjgIbNtVA4Bh3ds3IIpGuUrFE0SYzg0+6hxp?=
 =?us-ascii?Q?/cbu4YcO2byusINs0Xr/QRhQnqeKlDXZSE+ZeEfC4fYOUpcA6l1iwmzm5vt7?=
 =?us-ascii?Q?971ZBpDiNgKI+picnzR4P4hrKMUPwxIrXqdRacvzHUomXiMCFghmd4L3c1Al?=
 =?us-ascii?Q?/ZVWcfrX5tNoB19Hr1l2QiBqCfxNX6OsVLGVVAXEYDPGbl2eS7elpdUYZPfT?=
 =?us-ascii?Q?CRAGIZmOGMKuLnLP+D3D1M0HI6aWBn1sSCqe/hgYSV/YC+b5NIu+1FxE1kLl?=
 =?us-ascii?Q?cUG1b1w8nNWD+EitBvyaoiqq34CwEouoccG25D5MpscnMzAGIp9RP1bBpXF4?=
 =?us-ascii?Q?VWA4T0dbxmAlzUr5oLetpZqLK1UQmOzyFY9pcubSFV0k/qvzMTxILe7k8v7i?=
 =?us-ascii?Q?kAV8Plhn4AXYiqClHMhfHA2bwH3UKD5iBPzMWxQj4hc/HKXk2q8J0TjEQDR3?=
 =?us-ascii?Q?NMFIGVo9EkgjILoOMyxPeRVGii4ORpawUhzRpfq+z8zuVaBipFZqAicsbsDS?=
 =?us-ascii?Q?Uka2wMZQawu8EBZ5vGOer2I0SlIOqOT9bGye23dFDcAyj0HpqSATFvSoYgNT?=
 =?us-ascii?Q?EZIe3rFSNZyVa/Z4Xi76+92AV72znw2T3jjR8w8l7SD+sTvvGjVv+oS981yo?=
 =?us-ascii?Q?YHu5QmMjqLS41t5i1uhkCWH3S+s9bDCFGVAvFgqfuwQY/rpO/po2?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f607b9f-08e6-4d43-97e9-08df05227d6c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 16:36:20.1798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5upyn/zLWe64Cf58Dm76nbYRgKxE3FXbMhfO4PxBk84BbhuRamKZ5fbXdjIcD8i+mgJAP2YkbUuLhpiF6ZR+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7093

An endpoint function can reserve an endpoint-local channel while the RC
programs it through an exposed register window. Such a channel must route
interrupts remotely and ignore them on the endpoint.

Use dma_slave_config to set enum dw_edma_ch_irq_mode on idle channels of a
local eDMA-compatible instance. Synchronizing a remote-routed channel
quiesces the hardware, after which the caller can restore its routing and
release it.

The eDMA quiesce may stop a complete direction. The caller must own every
channel in that direction and stop remote programming first.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Rework the channel routing from PCI DMA EPF v7 patches 5 and 6.
    https://lore.kernel.org/r/20260813063757.3131865-6-den@valinux.co.jp/
    https://lore.kernel.org/r/20260813063757.3131865-7-den@valinux.co.jp/
  - Use dma_slave_config instead of private delegation helpers. (Frank)
    https://lore.kernel.org/r/ao2nHoCwfTEEiFSr@SMW015318/

 drivers/dma/dw-edma/dw-edma-core.c | 51 +++++++++++++++++++++++++++---
 include/linux/dma/edma.h           |  6 ++++
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a678c70a78fe..a8c6bd508fcd 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -177,6 +177,30 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
 						  DW_EDMA_CH_IRQ_REMOTE;
 }
 
+static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
+					  struct dma_slave_config *config)
+{
+	enum dw_edma_ch_irq_mode mode;
+
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
+	    config->peripheral_size != sizeof(mode))
+		return -EINVAL;
+
+	mode = *(enum dw_edma_ch_irq_mode *)config->peripheral_config;
+	if (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE)
+		return -EINVAL;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (chan->configured || chan->status != EDMA_ST_IDLE ||
+	    chan->request != EDMA_REQ_NONE)
+		return -EBUSY;
+
+	chan->irq_mode = mode;
+
+	return 0;
+}
+
 static int dw_edma_device_config(struct dma_chan *dchan,
 				 struct dma_slave_config *config)
 {
@@ -184,6 +208,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
 	bool cfg_non_ll;
 	int non_ll = 0;
 
+	if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE &&
+	    config->peripheral_config)
+		return dw_edma_device_config_irq_mode(chan, config);
+
 	chan->non_ll = false;
 	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
 		if (config->peripheral_config &&
@@ -213,10 +241,6 @@ static int dw_edma_device_config(struct dma_chan *dchan,
 
 		if (cfg_non_ll || non_ll)
 			chan->non_ll = true;
-	} else if (config->peripheral_config) {
-		dev_err(dchan->device->dev,
-			"peripheral config param applicable only for HDMA\n");
-		return -EINVAL;
 	}
 
 	memcpy(&chan->config, config, sizeof(*config));
@@ -893,6 +917,17 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
 static void dw_edma_device_synchronize(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool remote;
+
+	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+		remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
+			 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
+
+	if (remote && dw_edma_core_ch_quiesce(chan))
+		dev_warn(chan->dw->chip->dev,
+			 "failed to quiesce remote-routed %s channel %u\n",
+			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
+			 chan->id);
 
 	dw_edma_wait_termination(dchan);
 	cancel_work_sync(&chan->irq_work);
@@ -903,12 +938,18 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 static void dw_edma_free_chan_resources(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	enum dw_edma_ch_irq_mode default_mode =
+			dw_edma_get_default_irq_mode(chan);
 
 	dw_edma_device_terminate_all(dchan);
 	dw_edma_device_synchronize(dchan);
 
-	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
 		chan->configured = false;
+		/* Avoid a redundant write racing with shared-IRQ readers. */
+		if (chan->irq_mode != default_mode)
+			chan->irq_mode = default_mode;
+	}
 
 	vchan_free_chan_resources(&chan->vc);
 }
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 3c8e2ef9dee0..54491c9e4b5e 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -92,6 +92,12 @@ enum dw_edma_chip_flags {
  * handed over to and driven by the remote side, and the recipe above is
  * applied by the driving instance.
  *
+ * On a local eDMA-compatible instance, clients may pass this enum through
+ * dma_slave_config.peripheral_config to switch an idle, unconfigured channel
+ * between LOCAL and REMOTE routing. Before synchronizing a REMOTE channel,
+ * the client must stop remote programming and own every channel affected by
+ * the hardware quiesce.
+ *
  * HDMA linked-list watermark interrupts have the same LWIE/RWIE guidance. HDMA
  * non-linked-list mode has dedicated local and remote stop/abort interrupt
  * enables.
-- 
2.51.0

