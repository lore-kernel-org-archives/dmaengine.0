Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021095.outbound.protection.outlook.com [40.107.74.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1137DE9B;
	Sat, 12 Sep 2026 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234840; cv=fail; b=iCcF/EqixD48MDeEiFr/4qBfFRwqK7CILxUtHBJrNeoLXLZzTeuyClh7XBc9GPU25kIn419ntGCTlgmBXd7iZ81TgB/rvUXUWH40xzafUroCP4XuUykss8Pxgz1nEUAJ6WDdIB+e/nl6IE3cQJzuL8mEUWdFZjtBAveAceTvgtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234840; c=relaxed/simple;
	bh=TSW8R05FzO/deQr0AxWYU0TI2f0RXbSO1VOlVGh/DZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BGva0UxQh53X5m2aA3T89UmVQ2RHUQGS0H+RUT7J8P/GCX1CYONZbxwBkUty1102YswK1pshoKr7NjMJjP4F7+TeVw6xcg571LiRTUQoVMGjMxAd5nd0QEavEMjcukTuVGnxaNLyPgsDPCC1GYb8pwKYdFawuB6ydnUrdUztpwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FnHbd76D; arc=fail smtp.client-ip=40.107.74.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FnHbd76D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLWKwyqXmmzeEg/NQLZ9d5/Vh0po/MlEbbPK6j1hHXubZWDjHwHfjuU/YOzZEgy91udjj+rLWDuYs+iUl2BVqth2BFl1GPSgveQ8WgEMHK+L0JjbEp/6ApZDHiu1K0LkLBLwI+jhGkJ+vuVZfrEMEbEiY6OmNKlgGLmH9w6xtMgRYgupwG+0vkMUVFm9oSMgBqaqhOcAvPJT5FuWa2NVHvb6BeteG7Q5IDpE2V4JEYV7BLZi2eYlbol4adUebw8pr9sWg2k72SlhOLzeUqrfKsnU3SZwTTSTTtFbQtekFCFELSIw6zFMjFm91uDHANzLqQS117R52Wje1w196SjvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjrH2TsKPP0zQusO8vekpHVf+dOnEEJQuxvtabcnEr0=;
 b=wvIb+k9szvGPwSEl1amWzOGwekI/RR7Vz9IsGmWDvHPk+xmWyz0MDcvDq2QZT8O6Qkbb5EyqbuZhdOKpJkhLh7zPkR5kFSEZJ7D2hfWMg078KXllWmTL8fXCYxZv35sEXZSOolsWIIylTyIcwQQ+VZF3kHFfk/ry1/J39OzHvoxkOpLF1zrxlKjzr4glo4Philg1ZHk8VoNlRugfYu5OzDCSAm8F9JmTcyQ2r+gC0eZGdwy/bik9iIUHUKOPyNcYcH0NJ87oEwsiLIuHrfTloQqxs7YsqO54Uv9vI8iIFwkxBx/HDoOebIXbivvPUw/lpgstRiDJ6zT8o4afdDYL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjrH2TsKPP0zQusO8vekpHVf+dOnEEJQuxvtabcnEr0=;
 b=FnHbd76DYqTR3FyYurbhJpcxDZhDLq4kUjwioX/VUxWVQY4aOtEWufPCg6wBGkQ8Ko1ZBMnSVFZJed0S1j1r1itPsoTcGk6I8Mn0HTebMkvoCkd2RcG0JD8S45YbYQ7Ofrwgy5AxhwkR1TyiGZ0/4os/O3F0WkDuomJRZ5nfcts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSCP286MB5822.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 17:40:30 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 17:40:30 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt routing
Date: Sun, 13 Sep 2026 02:40:22 +0900
Message-ID: <20260912174023.1227397-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260912174023.1227397-1-den@valinux.co.jp>
References: <20260912174023.1227397-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0067.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSCP286MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a6bb44-c27d-41b1-a0e6-08df10f4f03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/F2xM/8EEE9vQz2kKBxbyHSBDXajpJLr01O4utIaqyd9T0I33LiCdswGwfqXnKOioySChvHKEQuSH6X7Mb8KgIUG3Q9gLJbhEffNHxYXs8P520YO9OhQSX86bmFDjb6yFMjICoI/vuWkrCkLoI4Zm7pnOUvclJErxlepBpW6C5pCfbNPZBqe1ARPn4W9atpQ1bezsuIaQNTs6AN0wnZMYUTMa7Ta3Dw0Ebmrbj2xqp7I5kUdJGkki8x+bbCTC0j5dEoq1WkajmHst4zzAISaQRAictmJg+RRkHfJxWvMwtyKQ3sNsZpdYdP7rnxeZGKQNuUFMPMPzJuAsEiWXHdJ7E6j8cvqVuf5+f8YbsPuAwIrH4+b9l7ofTyUciNWKGK7RbrY9425iQ9hCYUPIWjMrWDzRBy6jghxuaa+kl5CTXpff2sBfpobIF/syDhiSf9wFkWWZOJmFXAbDgNE6zXv4oaX+hIfbKpokoU8DDV+yY+eAJ84y3sqYmulr8bqhEtWHBb8em7qVShEXqeFfsGqDq/LcPG9fP7EQ103l/9QI3JDxdMPfYFkQf3KZabbN9ctQ0UIeqNwbNI2gEOYeRwgrkO5LB2P66XVYdde2lfNVLY27ZeYHcLwOIFfwmT2RbbZlk76e6Cz/M1a8g/iWaxwJPlYVa14SWe9ygszIzCmbd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AdE7K1ENksrgXOSTTKTsfeGWHFuicUnx/nYdSKKeWCk/7vUqzWlPp6CVLacT?=
 =?us-ascii?Q?BSvrJjaDx1T4FTFNKxPLFeL017K/GyNUsHxUZg1cYA7LJtCSKDR4UoGLE47T?=
 =?us-ascii?Q?4FuZ4cVe+SISx0obhjYRV6FeXz8w9HgLeFfagnTeWn3ILNs7g2NiswcoUUiB?=
 =?us-ascii?Q?4zm7bXCHdEmKiEOUstkNujRPkvdEItFFfvTyBVFf4JhnxtoX4hRqG/6pDsu7?=
 =?us-ascii?Q?OWyPGTDUwyj1gSYahuPQiQ+ldR1RROJffRbdPTaFsBwCIwOQAzTeEzbCxHhI?=
 =?us-ascii?Q?nNf726IfFcdYiTLgT6EfUV8VlheCP36b5j0ctES2XeOTvMqPR0cXe2pxvqXu?=
 =?us-ascii?Q?0Ry9uVD6qsRAy35bhVs2eQW1zohXsChd3hPbl7CVKIeDdck7KhkH+Z7bx7zL?=
 =?us-ascii?Q?z/EHYtxWudiS4EYvZg/twRTBSV2fsVRSEJIVqKSR3haTuswFq4Tu26oQwMhg?=
 =?us-ascii?Q?fmcp5CuScazNBFy7+ilL8t0iS0DM+jdCrLU3932g4LtAPT5uckMFJDM8Q82l?=
 =?us-ascii?Q?UwE0sSa2GiXi05OCej2X2eOtI1Wt61G5gkyt1rev77CEmb2sZT1nT+LGW0L2?=
 =?us-ascii?Q?4jJ0xMNmYWhxOO5zPStXi4kWEApqEZCG5nxgHa6kMluA2SUxTKPQcZZaDhuU?=
 =?us-ascii?Q?gHOZ9eHKI8GmU369eMS3LHQcqWyK0Da1H/SAPaH1Y8Kw9s+NCdIuipvpVxNa?=
 =?us-ascii?Q?Ohlrn4tbjZr2zqLVHZ4p+AUo2qZaaFumIKpWclimKDLK6hPPf9HxHj0BDPqq?=
 =?us-ascii?Q?7ClrCKPs3vpquwO2QXUh096WLyhdQdn1U2SpYvRoRfEoafUpz6NrnULFlWmB?=
 =?us-ascii?Q?0ApKwCDvv7EdJxzW7jbm+eC/f6YdXe/2DSHpFe21xOB5qWGkjWEnzcn/T82g?=
 =?us-ascii?Q?gSVGsu7hz9uvfsmRfXNtHQ74uG0r14Rh+iv5034EYEvsO530Cu7t5FYETMNk?=
 =?us-ascii?Q?N8ebubxPylZ0tBgLBtF8OJEAsx+nCJ5YLJR2yM0c2hhuArDSAQdcNTpkwp2W?=
 =?us-ascii?Q?rP+akPWmd9c93BzWm1NRGC5hRwFapQCj2wpJ+BCMxLlKhf9f2NbjaZBDrtVS?=
 =?us-ascii?Q?lP5065Ffsy7GmObJj9tQC9BMvRBzA2dpJ9eLpiDwIbwahclQXa9gge83tyy+?=
 =?us-ascii?Q?5a6/DutckZi67oKSNthmT+kHq6gkgKjTWwkWsaxAyF3xV6jZ9Ian96Y2LsuW?=
 =?us-ascii?Q?iCYQtcDrFvrzp4nMfpWj4+5CaNhewEQCm1+T8a0MAYEayH4hyoLuoqEWD8QR?=
 =?us-ascii?Q?A9MOptqr0gJZXI8sgiCzNA/y57CWCZS6C8meVoycalH44kNZ7pF42fDONVJb?=
 =?us-ascii?Q?9rKEeAOoZr+ZwlxvktRT3vcAYFIAve3waJwN5ZFQlbZO4+e/MUlyIwL285h4?=
 =?us-ascii?Q?RO5T5f8K8rVMUVz4lI4ovDy9MI2LZ/hFKdbsJQ//ipxf1TggaNZFpdx5iGEo?=
 =?us-ascii?Q?6MCyQALUAFbsiXPvmYDcyL9dlSQ6jQA+0ER21H362PEBXm8c/iMe20dnlC/0?=
 =?us-ascii?Q?fdR0xSI4oko7ilninJ9Dug1fkTrc4J1fi3KWkfqiJX9kHTCUKFZtrID6cG1t?=
 =?us-ascii?Q?zzEUv55SqLqF4yHV0+thfIIoD/84UKxSvx6oQh7sSpeTzI2M/0D8XQfeMAza?=
 =?us-ascii?Q?W01nJ8dMS3f3Uj6f0E5RbW8+ODRBvvuL7DIyLkIL7rs/H5OFMBxnkTy3p/N0?=
 =?us-ascii?Q?T0fFuW9TCbIbWZNHcih3qAisiIxNtKSOowlibrWm/Qwj6GLWuGLVGntkgG9Z?=
 =?us-ascii?Q?RGS/j+QM957xbXwvFFhOTbUHIMhaBdqWvgxsMHbX17rldQHTbCKj?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a6bb44-c27d-41b1-a0e6-08df10f4f03a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 17:40:29.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 408TUaM2U2RIZYp3k+N7bX7mr6fRd6/kl3Wfw+vbJqexA1/nFgCGFE1tHYpDCGj/DXgaZZl1/ITSPEIS8Pko8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5822

An endpoint function can reserve an endpoint-local channel while the RC
programs it through an exposed register window. Such a channel must route
interrupts remotely and ignore them on the endpoint.

Use dma_slave_config to set per-channel interrupt routing on idle channels
of a local eDMA or HDMA instance. Releasing a remote-routed channel
quiesces the hardware and drains its local IRQ before restoring default
routing.

The eDMA quiesce may stop a complete direction. The caller must own every
channel in that direction and stop remote programming first.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
  - Allow repeated dmaengine_slave_config() calls on idle channels
    when the IRQ mode is unchanged. (Sashiko)
  - Simplify IRQ mode handling, assuming the channel has no pending
    interrupt status when its mode changes. Treat racing reads by
    shared IRQ handlers and same-value stores on release as harmless.
  - Support native HDMA.

 drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
 include/linux/dma/edma.h           |  21 +++++
 2 files changed, 125 insertions(+), 32 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a678c70a78fe..c978da30bac5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
 						  DW_EDMA_CH_IRQ_REMOTE;
 }
 
+static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
+					  enum dw_edma_ch_irq_mode mode)
+{
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
+	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
+		return -EINVAL;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
+		return -EBUSY;
+
+	/* IRQ routing cannot change after the initial configuration. */
+	if (chan->irq_mode == mode)
+		return 0;
+
+	if (chan->configured)
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
+	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
-	bool cfg_non_ll;
-	int non_ll = 0;
-
-	chan->non_ll = false;
-	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
-		if (config->peripheral_config &&
-		    config->peripheral_size != sizeof(int)) {
-			dev_err(dchan->device->dev,
-				"config param peripheral size mismatch\n");
+	bool non_ll = false;
+	u32 flags = 0;
+	int ret;
+
+	if (dw_config) {
+		if (config->peripheral_size != sizeof(*dw_config) ||
+		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
+					 DW_EDMA_CH_CONFIG_IRQ_MODE))
 			return -EINVAL;
-		}
+		flags = dw_config->flags;
+	}
 
-		/*
-		 * When there is no valid LLP base address available then the
-		 * default DMA ops will use the non-LL mode.
-		 *
-		 * Cases where LL mode is enabled and client wants to use the
-		 * non-LL mode then also client can do so via providing the
-		 * peripheral_config param.
-		 */
-		cfg_non_ll = chan->dw->chip->cfg_non_ll;
-		if (config->peripheral_config) {
-			non_ll = *(int *)config->peripheral_config;
+	/*
+	 * When there is no valid LLP base address available then the
+	 * default DMA ops will use the non-LL mode.
+	 *
+	 * When LL mode is the default, clients can request non-LL mode
+	 * through DW_EDMA_CH_CONFIG_NON_LL.
+	 */
+	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
+		 chan->dw->chip->cfg_non_ll;
 
-			if (cfg_non_ll && !non_ll) {
-				dev_err(dchan->device->dev, "invalid configuration\n");
-				return -EINVAL;
-			}
+	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
+		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
+			return -EINVAL;
+
+		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
+			dev_err(dchan->device->dev, "invalid configuration\n");
+			return -EINVAL;
 		}
 
-		if (cfg_non_ll || non_ll)
-			chan->non_ll = true;
-	} else if (config->peripheral_config) {
-		dev_err(dchan->device->dev,
-			"peripheral config param applicable only for HDMA\n");
-		return -EINVAL;
+		non_ll = dw_config->non_ll;
+	}
+
+	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
+		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
+		if (ret)
+			return ret;
 	}
 
+	chan->non_ll = non_ll;
 	memcpy(&chan->config, config, sizeof(*config));
 	chan->configured = true;
 
@@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
 		 "timeout waiting for channel termination\n");
 }
 
+static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+	unsigned long *mask;
+	int i;
+
+	/*
+	 * A shared handler may retain this channel's status across quiesce.
+	 * With nr_irqs == 1, it scans both directions even if routing and
+	 * delegation are direction-wide. Drain it before allowing a routing change.
+	 */
+	for (i = 0; i < dw->nr_irqs; i++) {
+		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
+						     dw->irq[i].rd_mask;
+		if (!test_bit(chan->id, mask))
+			continue;
+
+		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
+		return;
+	}
+}
+
 static void dw_edma_device_synchronize(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool remote;
+
+	/*
+	 * irq_mode is fixed after initial configuration. The free path
+	 * restores it only after synchronization.
+	 */
+	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
+		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
+
+	/*
+	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
+	 * the hardware explicitly.
+	 */
+	if (remote && dw_edma_core_ch_quiesce(chan))
+		dev_warn(chan->dw->chip->dev,
+			 "failed to quiesce remote-routed %s channel %u\n",
+			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
+			 chan->id);
 
 	dw_edma_wait_termination(dchan);
+	if (remote)
+		dw_edma_synchronize_chan_irq(chan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
 	vchan_synchronize(&chan->vc);
@@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
 	dw_edma_device_terminate_all(dchan);
 	dw_edma_device_synchronize(dchan);
 
-	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
 		chan->configured = false;
+		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
+	}
 
 	vchan_free_chan_resources(&chan->vc);
 }
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 3c8e2ef9dee0..43831fa57357 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
 	DW_EDMA_CH_IRQ_REMOTE,
 };
 
+#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
+#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
+
+/**
+ * struct dw_edma_chan_config - dw-edma channel configuration
+ * @flags: fields selected by DW_EDMA_CH_CONFIG_*
+ * @non_ll: use HDMA non-linked-list mode
+ * @irq_mode: interrupt routing mode
+ *
+ * Pass this structure through dma_slave_config.peripheral_config. Before
+ * synchronizing a remote-routed channel, the client must stop remote
+ * programming and own every channel affected by the hardware quiesce: the
+ * entire direction for eDMA-compatible layouts, or the individual channel for
+ * native HDMA.
+ */
+struct dw_edma_chan_config {
+	u32 flags;
+	bool non_ll;
+	enum dw_edma_ch_irq_mode irq_mode;
+};
+
 /**
  * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
  * @dev:		 struct device of the eDMA controller
-- 
2.51.0

