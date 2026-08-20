Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D548665F;
	Thu, 20 Aug 2026 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247299; cv=fail; b=j401MhvioY/F0jhnGo2dRd9SsTCH7PDfzpDi3HWVwDIzfshOrzeTlkRPYNhkn8psFpLxGs9+IDDEFpWzewSdrLRUNb6m5HKlGMAduT0rGo5Ro4B8dCqhjUov64qRSlO8eSgHGGXubtOmQ/v5B1ufDnsaX5NKI5rOSR+nuTvnIUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247299; c=relaxed/simple;
	bh=XXKrWEaqxa1t77sEbS2CItGJpz0icjTuI/J764xR74w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIfegzZ/EG3wk2Ei86FjsA2Kbz0qNL46Thuw8LL/sFtvl161h9J7V7vd8njRF4WVmh/eALsu/HS8z6h/4psP4UHIr9bX4XOEw7CqouFx0KAIUo0bxJn7EQ4ceXRauUqO7uZGqskzW1metUTSMB1h2ZZ2VgQpTL2K+h1UW3zoJF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=K4T7cFeZ; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="K4T7cFeZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+1MR84VQg6qGrwumT3dbj4R+tQrIAD4MFe/DVzh/saxVIXLkzvU8QwB3XTw8RX6OyW9dUchSJg7JNSmsGH9AhNR4XWkpnZEpee8AmXSn/pJ3vZBjzVZJ7d7/y7ORHFhSLAC/f3/LV5ZEZXNMYynwhlmsCFDNElvbfElbrNUVUVYgiMC8M3OarXxk1PJn8XTGKudTkXmNVU/xRwA/ZZcbJ9qOI2ieHER8QX577OQvpja7y2utRp9BYQBK3PhLb69HSX9F7DwdTFOL4IE1kvrUcHjXv4qymb4ImF5L1aOgQAH3rVelwSZvFXv4N8tSUCVAkQLt6tGOC3iB0NsuBBvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvSlO8P1+K344Lhj+bD6vFJODLgEGC1Oa54SWmceUV8=;
 b=YPruUSxoPyn5ZGqE56fx0GfLiwzIWDI4F8zOgk73UhzuCeiO8bUwKZJ6bOEbk9IVfqH+cJ5wsM+xE3gWun1DmgPUjVjxpPLw2+yQW2+H5JmtL9i6xLIrl8r1z6ur1LPKQGp793PWOsGiz39YBljYEhvuiw3HH6+UTbU7TUdVEPwtdhZBGjQXkYat1RHko881EqBjGGrNHH72T5qGpi4Ol56LoPYibOiLowzvVgcHwow346wfFi5hdMbU94+0EyKahWW5LVKzb2qA13c5HjXD0qNev1xKBuf2Dnd5oZJWIn7uQbviZXyJMoLGRv6NoAWCHMOR7YTh+NGKXL16iq5mXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvSlO8P1+K344Lhj+bD6vFJODLgEGC1Oa54SWmceUV8=;
 b=K4T7cFeZyNU4o5zKHsqR0pOJupT0nUymeEuzlGiKE0DKaK0D9kUEzJPr9voHop6NhOz7AGpYdl26z49IBC9E2yERcRZKmqOxRWt6JnZFStOwnjgq6qZtC0HHffUhNIvFZLVHndUCDnSBDAbXkzzy5yXiar3QV3DiWZf+f1urlrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:51 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:51 +0000
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
Subject: [PATCH v6 08/10] dmaengine: dw-edma: Prepare LL progress event handling
Date: Fri, 21 Aug 2026 02:34:37 +0900
Message-ID: <20260820173439.2004068-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: c527fa83-14f1-474f-3574-08defee15704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8U6h8+BcwHbD0yJBA6nPyJtZFKosDcRQZWk7MQf9RDEJ8cAvw4nUJsuyr9m3P3Ult1agLq97gBQNPJqsNFpwzyXS1vrGc1Oeyc6Fc4vF2dw7sXbS2SkrmL+cRXyjxWOf6raKgHTL3uG+hBMjYxxrk9sfoTD8gFPt+09k0LP0Jy3hPrD89aGwVVm5r/Yxck/Wi99ob3YMzqjx2JUXKQ8zqg3TeVAUyoY7kDwQQIRyNgang20j0XU9K5297o4dcBQ62OE26FEcUSc8XSxBg8CvfGsOSNAmKBecAIsrpH9yVjFNWeUHvB2Bu22y1V6+HCFEMTa/hiae6QZpr2YwlM2azWr0hdmrehexwtjtLaq5Lz2z9QjBUoICQRJsYoczWCSiXUQPzdNkL25xccJiCjba9rE9s/jGOlwGYqA9XGGWZoIUqf7RafagZ7fw1DFQnHf34ZpuHbd5mlgkbuJJ/N4sx1IdHgtpWU7ANR1CP4A/P3X8W1xHKtvTdpIFzr7T+d4gL44wZHIU0Tw9wMQkiNAtBtmnY1oFRRCvS2Tp6T7enqtZaLEKm70Uioc79KzAbLD+p27XAGw8thDW/B6PZ/x2KJG9eizV+QfykPYC13zNg72ZxyJ8Xk7MQXBfuBKsB0grBf1izdB8H2T1/2efokE8kfLz9C12fe22JpS1/nRSjcu/bUz8wYPHsktN+DGFthOd65mc34U/iBDIbyw/nhwNEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H/DiiatgHh30bN8Ybrz0oGqbKPnShzpl+qy+cCcss7MCdRFTpRgn/6E45IOD?=
 =?us-ascii?Q?SfrUc9gHJW7k0CfqzsfI283iq0Iqet945piH8bWbV+7foNFBTfehk+kgFJJN?=
 =?us-ascii?Q?0nq6NyoxqB4W1SgXk+QsBEH8g+/Tm76GUTyppOgR8Iy4tyCscC/vDmAs0YyQ?=
 =?us-ascii?Q?YAJaWvlTSk9vuMK7SXGcw5A/eEj4VZrjdqLeExkFZUq7q64h4nEfmx/mZWsU?=
 =?us-ascii?Q?7ODuB5ebKhKBnp9uiPWOA9lhYFALQhV7qh79cnwuM3OnpF/VBuIWQCXcTmbF?=
 =?us-ascii?Q?jYfhAwOxTAIyCGNYLCtm7iCoBBvjf6sK4+gBwdus2IK+nBqJ3nHUPX+STL6s?=
 =?us-ascii?Q?7CsOLgBDLhEHChGz3oda37ZbTYimYJhvIRdr2/aGVJ0Q9bd5dwjbF9gYTJI6?=
 =?us-ascii?Q?kWX4oE+LjRn1dHZEfWrY4uSOqFjIldGApeV79Ue88taB8Qq0ykClOP6KyU06?=
 =?us-ascii?Q?vWsjPOayJPr301Ewz69xVFap4666rD7oYnxXO8XKQ0ASjOMJDYII/rJGbIpe?=
 =?us-ascii?Q?NAWSLgSBAL81XSqJV9BRTFmYglMGvYM5Xo1L3MG3EImqS6j/0sqDBMEW/XY8?=
 =?us-ascii?Q?4FblH7FQ7/exfYmdyFI7o3AO5eVZdjHDsshv3aDVnBMFOMcz18OE8KmQeK9r?=
 =?us-ascii?Q?TdkDpmyL6sEW5fihwRZcRnPIONi2A1jV/Q8o6oqEwxUQiXMkG6vR5Md2Ml8p?=
 =?us-ascii?Q?o5U/5Bhs1begWUBCJrWAZ+FqL57rQtSE19gepg+ghVAs6tt6u5G6IvpxhT9I?=
 =?us-ascii?Q?OeZYdU1EbFeqTuSwkRfTf7fYW4ggTTR2mgU2ccyDtYN9tb3rKldFzPCLDaAP?=
 =?us-ascii?Q?5Z/zH8o4n7uATM8iElwtE8ppVYLdU6RDlC79k1xsj0QoyBxAfttMO586zqzy?=
 =?us-ascii?Q?318jKPfz/XsWe8lkp08AvD6OgiJr9D2etXj0JPcI814BWC8lKPXBRUxWKFhE?=
 =?us-ascii?Q?pLHikGRTdMmdqUtLaGsKa/cF0lZ+Ar98+PR4rbd3S7Su2n9Rbj7BSn3qf2vI?=
 =?us-ascii?Q?DG3Di0I31TfppugLbt27Nxl+KSwaCafr2p0nf6sSb3xXVkZVNDQjljlztTEZ?=
 =?us-ascii?Q?7uqbp5Gbv4c9mJqufn75fBWR3LQsYAIBPbAxOTVujU4G41iYFzOTSJ0CJ/3u?=
 =?us-ascii?Q?aqFlty1NONE0JQhNARsiLg3t+yKGbrck+h5MJAeAJ6oaW6pbdTDF77khiC+N?=
 =?us-ascii?Q?yDibKRir17thzzAYaYDHXUk5yBS3RceKnqI2EA/5QeyrcaU/RQu7kyQiHIuH?=
 =?us-ascii?Q?hEXhSVn1B9Q1iLRwFuyINaavbLo6/D7seMKmajW5xpWP6MIVK4yXt2iWqH5M?=
 =?us-ascii?Q?YP9ddXwLJNfrqUdi6qk5b0IS2kcgT7l5w2xwib9+oxvLBupLL6nDLNN4M+D8?=
 =?us-ascii?Q?tUCHYoZ66kBgVUZ9gP2zoYpFv5c7H6IkNXtZC8W5kXO5PnIgZWjGbNFe7IKD?=
 =?us-ascii?Q?U78OExrmRx4jDmPw3XH1thfZm4NOJfg/lUJzHIaM8La3Z7FdYxDfZ5+NT+k/?=
 =?us-ascii?Q?u9H0ny1kXK4ww1N1nt2XYKdYL+s7vlf9vrjuEDR4+/MaKD0rnJ7AQKF4F28q?=
 =?us-ascii?Q?kJmr0hwgKFJMA+RIIbMWuqZFauCIboEdqxdEXoez8JLLLTzMC2ogSYfY90EG?=
 =?us-ascii?Q?YAJnvNTk8dMPcxWuYsZseK/CXysK3rIHsCbn1Ltj4q5/Y0WuPnw+n680rpMJ?=
 =?us-ascii?Q?UI7PJO4M1ae7heC9RzbjFQEh0SU9Mz2xCq8RVgK01swLOPG+Q7bDUOfohJwD?=
 =?us-ascii?Q?k2e1a2a7pNpHno6Tm5EtuZpG14VSRXtuV4X+Rd3dBqWm2vbJk5HI?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c527fa83-14f1-474f-3574-08defee15704
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:51.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nbUxuXtoSOEBNVTqyl4XvG+U6PuzCpEgtzjKQDZWywbDXJTRSde/AqQQNM4uKlFvZE6RSybNp1YhVLG4vIjzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

A later patch records each observed LL event (STOP or PROGRESS) together
with the LLP sample taken in the same interrupt-handler pass. It needs a
provider operation to clear stale LL interrupt status before a channel
restart. Add it.

Centralize runtime request updates in dw_edma_set_request(). A later
patch uses it to cancel a pending LL recheck when STOP or PAUSE changes
the channel policy. Rename the existing workqueue event bits to
distinguish them from provider IRQ events.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c    | 35 ++++++++++++++++-----------
 drivers/dma/dw-edma/dw-edma-core.h    |  6 +++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  1 +
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  1 +
 4 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 5a8407ca68a2..bbfd82b12ab5 100644
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
index 761a5ab4bbb5..8d993e8cccbb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -163,6 +163,7 @@ struct dw_edma_core_ops {
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
 	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
+	void (*ll_irq_clear)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -284,6 +285,11 @@ static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
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
index bb86d2f60ab5..9053354eda67 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -686,6 +686,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ll_link = dw_edma_v0_core_ll_link,
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
+	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 47d7a01658eb..4acbace43519 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -442,6 +442,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ll_link = dw_hdma_v0_core_ll_link,
 	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
+	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
-- 
2.51.0

