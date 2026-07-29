Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B244D2EC2;
	Wed, 29 Jul 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335457; cv=fail; b=I/2ydUhBPAugTXUvaahl3Rg9X6UxCKHNLwrdyB1/1NpZ+xPmCWY6dKmJvwmfRYQqYGf1KpFU1pk/VrFNTQVARhfjUNI0gCQoXhQN9l78PZt5Vxo205D+t2ixQLRpCUF4p8c7wevsqQOf0ehK4X4Ooc6vqcoEqgVo5ogFSHv7ijI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335457; c=relaxed/simple;
	bh=2TcFvfkp3iyAKY+B99dSTt7mby+e5jdQAfROvJZR8CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I2ora2lrm2/8P9ALpelTIzRNqLKj4PZFDGTjcBoKGnrne77mAAaFYcxwD9gAJAV7DZr1IrelYEtFo3+clBd3TtFLwIYbtK9AtvPuRiYOAQ9dfSWolZMxEQHnF1m7QkrsiywEK2C5v/kIztpIkRTzkFdEYD2iSy76QUwnz3HfZZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZxIiDyqx; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZxIiDyqx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9u/lwX+fnYOtYdxIAI3fCH7nf3+YgnqkFTJCJdXd+lQIWB4JW+SkSYh0sItRHtOGd1UJ5cNRiNwvibJRGNcKh3+PzYmXrrIYy8jskeRRCR4qZR/FidkcN03G/MBfaw+y1ob2MsVMov44NDZ1iVvke8ecR94Glr2VYlTAoIeHMrQ2Gxix+2UvqqjiG0TzVik3Vya1UtxWSJoXIdU5DI5zZ2DyLE3xEQddm4y6Mkaqe2Lo38S0ycRpW4J/WY8dj5AZNjI78hVCjMNQvAMoTC+dTEdpwWSkR7S4h5vVlyEIVf0b2YmucnMjcHTuwwyNAa0IqBNzmH64oAzrRvdsGvYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSB/OaRPZVkEcw/Ftw8KaUn8jY4SijHHXue04//BEDs=;
 b=DAKRmlrsYKKYNr1YUYm4fVOqkWKF4InoPn08M7RpyG187R/da37ehwdQ1fgFvsNYQKT2tkLqlE/2g1ZY3n9KYYp6sDtG231WMx3vTmRm15IuKqtCuy1SVVttjRV38rWFaZysPx0SrcfCFPk50A0ltAxuxqZMsnd8KrLv0jp87vZnoaU6r43drGp/F7qC5T/AU1QwRFkppEEbVvDevJSlwu9U1KggqYAsbcqJsg0euFC3yQhL7xSd0Kvf8VnOtsNgEinP6vbq+y912M9R8zgYLddoX41E31GPGws9YWxBfW62fgsC8M7XLyiUX3j2MQW4cXxrWj7pZBYwfDO7IXILoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSB/OaRPZVkEcw/Ftw8KaUn8jY4SijHHXue04//BEDs=;
 b=ZxIiDyqxGgEnXe7xykp4ZOHtQI9E3rWBj1w0gIwc6UQE0kk94t6OpewAUs7WeFZl/CYPPHGiaVOhA9DqFRwA43BIiIhY6H5Nis4U9aBqzh5O6cX6dajiY8BuCRb8RyLHT16WTVp16UBfRQtS9HkHrrAQd4MAqOUIfHSqTGOvGeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:47 +0000
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
Subject: [PATCH v4 08/24] dmaengine: dw-edma: Prepare LL progress event handling
Date: Wed, 29 Jul 2026 23:30:20 +0900
Message-ID: <20260729143036.3087722-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da07d81-9df1-47b8-afaa-08deed7dfb6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x3jWs2bPPRi4FLduHtAUlPjojMX7vFLdq69CyMN3O9rw/CO0XNjTPdNUpUZr3+BRNdEGEw1zZJmbtnZwc8vSAd6F3ZFUbFkjEcT6QTEQ3u9m/AhpjHm7LpXt/pBD+yR7nHxlkByemUXFNfysXFzN9xo/S9J8Z0HQeCSVyyDIfb7Aq/Zxp18a0Q/UqIVAm98+MoFk6Xu2jjfy+NDa7Ei1PmNBN6AEN5zPP4Z21FEYer0BkRCe1drfIoX31/gx+Dw0Mnh4bq2UcOu27HHyl0GZp1LOh+TDb0XzKLQQ23J7w0MbtXddeN8lBFEu/1f9CPWXt5IJymTUPLD/gWTG1tCFD/vUWmerNyQTlsAYj4ORu/H+r+NDtPWJrZDPlD5u7pfa5eVuNaYwqzS6wtphYcQ7ve0g37TuxMrF1DiMN5b4sAo1CLUJdpgWSf8d5+FVK7/RXRpIzNbUmS2ICgzcLGz/9kIY3e5gXN2Hv2An2b4x75rJmo1/ksWhYytEIGqNIvxGB7IC8VzajtUWOU0rn6e0eouWii+aQRvp71WXHgbCQTCa+fjS75cFLrvtoGGV9v5PUxREYTtN550eooO8wdKwZmUT5fKxxNkvhB11HQbZQLXBz3qYxT6m3PqzKtOoqTUo4k+zNn6abMkcoblAfYBxHb/J0BqXu3b+tnWjlN3YmD5IfCgIYTCKLrrfoC0uhtk1Pyvoyvi1+PL+LwLMNLX+Sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+u74zOGxyXyN8Oao5uTtxVAfWHSH5Jp83fdbjdrKfJNWtSpKyJcl1PhM2RP?=
 =?us-ascii?Q?WOrXsROKHOCKPnsdOGb7GLaA634IRXtioGamRHIpdQicWZR3XCVSYQFoMrdZ?=
 =?us-ascii?Q?9Gz0l1YPcbR8z2PocVugepv4LC8ENT51Z+pJzzZkn1wQy7nHaszp8dA2IvuP?=
 =?us-ascii?Q?ycqSC11faC1z+8G1C7LAgTPL/3IjFIRM3goXx119SgDYuciHWVzi/oQUhcpV?=
 =?us-ascii?Q?xf4d6I6j3CEh9LtlOUy25AQmVB4LL8MN2ifzsAl2rrCzESrv5JduR9BWBUO5?=
 =?us-ascii?Q?AgbLqNQrhrZVCb9I7JDwUvT2vRJZd3bgyuPqMa+oRFoxapVhRxSnQALA4MRp?=
 =?us-ascii?Q?ewKHy0M+n0hjDnG/UfvidPmGS49B9avGf9ODaaUmIpeOcd0LBIkwF4Dqa6fr?=
 =?us-ascii?Q?X9Om/8JzUuVR6BIpsqzgMCxq/dag2sN0YLkEd7tEfkCpczWMISF2rmtaKL8K?=
 =?us-ascii?Q?7t8bCCiV6CoNlGSRweE47uUOoO5nxn4pjkqGg+uhDgIEYD5qnh/jqDUZGypf?=
 =?us-ascii?Q?ewhH3eWgRGaNW+3yijSuRrvhn6Bi709z8Fp0CYdvH8O8ZFpNlKGvUL9G/lzS?=
 =?us-ascii?Q?VPI4Af5Ji8MT8vq1z+mcOVplVPiZfSTjMXQ4K/eIzC0/BHm4QK+JR7CXWB1L?=
 =?us-ascii?Q?ZZxnKLq19mljMH2KYzyLqxA7x0RidmRZJlWXvVhhJwCq2ibNO/0vpS7ixcZE?=
 =?us-ascii?Q?2QeAVvf3Fd/uk6H6xCaOO5O35W0wO9qc7oi4fUMb6Z/waRAiWBJMvgRW/ojw?=
 =?us-ascii?Q?IF05/BBzhhrvdJ5tu0CJLCOmllii3pYhHGGuyxWpmrI6eLrLL4yvQZ0HC9jq?=
 =?us-ascii?Q?zDO+57RfOqNs9MkzQ83PrTnoceBumQZzSkjeIAU2V91YtByVEeiT+r353cIB?=
 =?us-ascii?Q?mgpYlCnBC+vj9tXQWmE2Qyku2kT0FXbIpWslfRPtaHgmab9hG1H0bbrel6on?=
 =?us-ascii?Q?2AQc/vNcciH/nozd3uEQbBJzILX5euwashxZLQ/RvZortKEO+VF+J2AKo8/x?=
 =?us-ascii?Q?hDW+NTG5nOlyRwL/qIPZF7kPsANDpxLRVup7q7lPDCtoeVgZl2GJhIKKBMhI?=
 =?us-ascii?Q?0/7SpaeWPb5bGwK2JCcumOoErHs5Dj2O5D9VoZfF3EIQHBy+3Ypo9k5aYUQu?=
 =?us-ascii?Q?K2cdqo/EsjJ/nlUDMHp+rHqUog1gO8cBScOEP6FQTKIbJ6/RMBsqDAjpBBbE?=
 =?us-ascii?Q?1+bH5rg269kn9raW2uXY68YXtuH3jDQbGrjFyBWt6YD9jRDLXvjVAu2fPJ/m?=
 =?us-ascii?Q?P9ONxeLJMX4POgvyIE1vf6UZyRr85772vBvs3g6kdJD7NMHHcqpaF54nwbDU?=
 =?us-ascii?Q?gZwiiMh5523DUt7xdwRDWUkmOm88whesCJMYVdkokHirYGOrTyBise+vsxa7?=
 =?us-ascii?Q?1NxeAlEvQORNzUgCq3kSlwE/9aWnbVRRcpNoi8SsYNJmBJSEpw0UccTCc4iR?=
 =?us-ascii?Q?QhVWC0Cj2fzmmwcHagkSy1SG9NImLPyYyQ1KjopwiEPadVmCCsZl4zkc01dW?=
 =?us-ascii?Q?RL9pUwgete8P1sR4E61Fbt8gyCfHI4B746v00IJB0UgvEhZYCyej0L8WyEUk?=
 =?us-ascii?Q?Bf1ffvzWGpdgkyHPbKBJsmWuICVuO8IbdWHnImj1J//de6D2m/+JlmFII0F7?=
 =?us-ascii?Q?K4FUb2/8ZKZqLZph9tDMAnHLKIPeQrrErsnEpDRoety/BBJAa/JcXXwNZGX2?=
 =?us-ascii?Q?0B7KJH/RVv7inSzsSHvepXTcgD7mAO3uU/s5BG4v2larPHhTVFp3VVvV6Vnc?=
 =?us-ascii?Q?FlG4XFT7IYth9+eB2bVUogZ1B7OTXN/bcO3+wY7QVzADFAW8r/7+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da07d81-9df1-47b8-afaa-08deed7dfb6b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:47.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VWvFTqfayseQwJVG0yyjEW4ot/PnOr1rDAYyJc17BbgugrNenuQWHBvwxnrV4OLxq4skySteh1JMvYdoERGAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

A later patch records each observed LL event (STOP or PROGRESS) together
with the LLP sample taken in the same interrupt-handler pass. Serializing
that capture with a channel restart needs to know whether interrupt status
is shared per channel or per direction. It also needs a provider operation
to clear stale LL interrupt status before a channel restart. Add both.

Centralize runtime request updates in dw_edma_set_request(). A later
patch uses it to cancel a pending LL recheck when STOP or PAUSE changes
the channel policy. Rename the existing workqueue event bits to
distinguish them from provider IRQ events.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Explain that the LL event and LLP sample are recorded in the same
    interrupt-handler pass. (Frank)

 drivers/dma/dw-edma/dw-edma-core.c    | 35 ++++++++++++++++-----------
 drivers/dma/dw-edma/dw-edma-core.h    | 12 +++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  2 ++
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  2 ++
 4 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index c036510dabcb..b84aed59bf77 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -30,9 +30,9 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct dw_edma_desc, vd);
 }
 
-enum dw_edma_irq_event {
-	DW_EDMA_IRQ_DONE	= BIT(0),
-	DW_EDMA_IRQ_ABORT	= BIT(1),
+enum dw_edma_deferred_event {
+	DW_EDMA_DEFERRED_DONE	= BIT(0),
+	DW_EDMA_DEFERRED_ABORT	= BIT(1),
 };
 
 static inline
@@ -73,6 +73,13 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+/* Must be called with vc.lock held. */
+static void
+dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
+{
+	chan->request = request;
+}
+
 static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 					enum dmaengine_tx_result result)
 {
@@ -243,7 +250,7 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	if (!chan->non_ll && dw_edma_ll_pending(chan))
 		dw_edma_core_reset_ll(chan);
 
-	chan->request = EDMA_REQ_NONE;
+	dw_edma_set_request(chan, EDMA_REQ_NONE);
 	chan->status = EDMA_ST_IDLE;
 }
 
@@ -360,7 +367,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 	else if (chan->request != EDMA_REQ_NONE)
 		err = -EPERM;
 	else
-		chan->request = EDMA_REQ_PAUSE;
+		dw_edma_set_request(chan, EDMA_REQ_PAUSE);
 
 	return err;
 }
@@ -410,10 +417,10 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else if (chan->request > EDMA_REQ_PAUSE) {
 		err = -EPERM;
 	} else {
-		chan->request = EDMA_REQ_STOP;
+		dw_edma_set_request(chan, EDMA_REQ_STOP);
 	}
 	if (chan->status == EDMA_ST_IDLE)
-		chan->request = EDMA_REQ_NONE;
+		dw_edma_set_request(chan, EDMA_REQ_NONE);
 
 	return err;
 }
@@ -724,7 +731,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
-			chan->request = EDMA_REQ_NONE;
+			dw_edma_set_request(chan, EDMA_REQ_NONE);
 			chan->status = EDMA_ST_PAUSE;
 			break;
 		}
@@ -764,7 +771,7 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 	}
 	if (!chan->non_ll)
 		dw_edma_core_reset_ll(chan);
-	chan->request = EDMA_REQ_NONE;
+	dw_edma_set_request(chan, EDMA_REQ_NONE);
 	chan->status = EDMA_ST_IDLE;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -778,15 +785,15 @@ static void dw_edma_irq_work(struct work_struct *work)
 	do {
 		events = atomic_xchg(&chan->irq_pending, 0);
 
-		if (events & DW_EDMA_IRQ_DONE)
+		if (events & DW_EDMA_DEFERRED_DONE)
 			dw_edma_done_interrupt(chan);
-		if (events & DW_EDMA_IRQ_ABORT)
+		if (events & DW_EDMA_DEFERRED_ABORT)
 			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
 }
 
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
-				   enum dw_edma_irq_event event)
+				   enum dw_edma_deferred_event event)
 {
 	atomic_or(event, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
@@ -794,12 +801,12 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 
 static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
 {
-	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
+	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
 }
 
 static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
 {
-	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
+	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 761a5ab4bbb5..95bd4bf47ea2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -41,6 +41,11 @@ enum dw_edma_xfer_type {
 	EDMA_XFER_INTERLEAVED
 };
 
+enum dw_edma_event_scope {
+	DW_EDMA_EVENT_PER_CHAN,
+	DW_EDMA_EVENT_PER_DIR,
+};
+
 struct dw_edma_chan;
 struct dw_edma_chunk;
 
@@ -155,6 +160,7 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
+	enum dw_edma_event_scope event_scope;
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t done, dw_edma_handler_t abort);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
@@ -163,6 +169,7 @@ struct dw_edma_core_ops {
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
 	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
+	void (*ll_irq_clear)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -284,6 +291,11 @@ static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
 	chan->dw->core->ll_clear(chan, idx);
 }
 
+static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
+{
+	chan->dw->core->ll_irq_clear(chan);
+}
+
 static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 7ca4b6823ece..27c57f755d83 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -680,11 +680,13 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
+	.event_scope = DW_EDMA_EVENT_PER_DIR,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
+	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 67a3a7778280..c8b9f6c42494 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -435,12 +435,14 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
 	.ch_count = dw_hdma_v0_core_ch_count,
 	.ch_status = dw_hdma_v0_core_ch_status,
+	.event_scope = DW_EDMA_EVENT_PER_CHAN,
 	.handle_int = dw_hdma_v0_core_handle_int,
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
 	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
+	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
-- 
2.51.0

