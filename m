Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F03E764B;
	Wed, 29 Jul 2026 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335472; cv=fail; b=rnRxEcJt3WEf4wPKcGY6AJ4eygW0ysSF+493FGJKE9amRqpYWPCASidZ7XNYrPJLyTAjsh6kK7V68rxu5QPTmdEfxxfx4cmEFwpUi47PVp3oAU1VZggtr281nNS1nW7WJMV3rmNUoeyxAR+1zs3bVFP5Nesp02WOWiekUFVQGcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335472; c=relaxed/simple;
	bh=sfzKWMPm229hMxye36N5H4zxAnpg3pA6qI3iwWc1FI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCvmm6BLOMyQ+wIim3DidEGeOG1Sci8dmpT44WuAfWZ/avVdz0HueKDWmTEUDw7uaHxxGB2uDMUGihf5MgqGUMf02igfnoqn7e1901IIj7oU/swVGTH8tiitnHjPhfg7ORn8k6EwxhyIO65jrpzh79Be5dZUwfkeLGLeXnhM+h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=cgBh4cjd; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="cgBh4cjd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9UBzNPbExnYcTeqtDW1/n9q8fPeNil5E1PRcakW3hTOZeKZ7BpV3G4XJi7EQUajSfBxdryNt7LrEC7QvcZzsjhODZKG054jg/McoIqZ04vzU4Gs/Cr/kLJFgRMV6G1k/73ZJHWmVFIi3MqjX5p6V24iptQQAxX7I1Is05SOd28RtaCN7LOqwKgVnpEV5O3fz1P+eOzMleEshxSXnsa3XqtAGy43aNotkp5+HHLniW3KOzQf/3O9J2W798xKwRD90gG8lzvvH6INeF1E2e5aGnPBU2lXfl48x40LQRRT0pt7/zKUatmX891p9L8v1pSQxTjwonSpeFBXrET0BhOeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWg4Aocl0skNJ4Qgn2oQqJ7MUSe2qC0rtmrbJzOXkok=;
 b=LNW1K1ZzrM4Fo6E0Bp6WKPBBtGgcU1dpRGFh6f4jBAzQwkRCFg2bKJ8G9qUrc7oVT0YYyYv6DzMTz9mRPZMsdRF41qlwHt73OP10AH1WsAYkCP+nX5odkBpMy0Bajzrr6YyKuZMu6xl1i9HPX0bnLo5YVuyVNK4aOsB7dMQFIEbywksZbogAqc19eV7aV23eBffOcUI13faUlIdJmRjAqQQF3SmDHcI+gKgmj9DEI4v1v/lmLOoCWCkSJ9UYOW5lQjRKp2yTh+HtiRg4FonTAuBW/wY+a05Ncz1eODZXh/MtryAFam8rMlfzVrbfl7RF1KHsVLM22oOGKJwZHOXhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWg4Aocl0skNJ4Qgn2oQqJ7MUSe2qC0rtmrbJzOXkok=;
 b=cgBh4cjdHMxJyC+2ZTAG7bE42Ltz3fY7LldpKqIbop/rJxWp0+jmOexBXKpqQYa4OCdNXms0VBsIceRCESLCSgQXmIXy+i0Maz18pr9qqYO6QLANSGdqpszRnZoM6NMMTW3eF4eaACLV8C8rtaNqK6oX7iXAVwJWuLR8YQ8ASow=
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
Subject: [PATCH v4 24/24] dmaengine: dw-edma: Add trace support
Date: Wed, 29 Jul 2026 23:30:36 +0900
Message-ID: <20260729143036.3087722-25-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 89beb525-e218-4c8f-862b-08deed7e0326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QPS6P4r6AQSnvj3L6D0rMRQ4Uw8UnoszTMtKaZ7ja9xkNxvW74WDyxrSam28EtppwZEgXF7MlBi5Bx11JbcnpIOE879CewM7s+1tsSsrs+uQDHu4BR85aKhpCIbB+CBZOUGmR/5NJ8qrKXwGoqyKDXUFmNWMSHenf4RL3xL/lYvYP5MD7sddilfRw33Pwjc4MXl0Acd5d8s8dCylbIUROu17bQ4WURSQSzvH+eTWF8PNeL01tk5hbuCasJt18njTbEyT6fBQ61d1hGwKwq57lX4KXiYeo8a90boAz65wdYMmONntvxr+IyCyqNvPbGvNt0Xfpjbj2qZktIuXUdljM3a5BIaRmm6nGAs7yHpFImVUspkyizG/SxtpL91cgLysukhb9BGamTzDbq9ppZjTUpb5I+X23Cn+pxHDNG23x4dPNmSnWopayO8rqj2ldiY5/JS8+njO9z10+OiKKHYSh0+9aKCPivMqjn43G/fk6zC4yIBTG05qXnXr8j6Q5L2YONVNiP+PxypGjq1DB+GSuB/MtW0hXVKhreC/fWPlj4Xxe2ovdOE5ke/F92ImW6JcVtB7LfaxtA1ve/tOWbIRxrzk+Ias/2mAYHjrweR8ZO6VZXd1NCpz60OtPXqWsqIWMQcKFZweoyr3iahUxM8tz9IWADMS9mPpin8SIrdebZ0VcJoF6vokplnzNzwhFCSWqRGANnJmD6cSuxWoSKeIGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UuZYGP9MoW0l7hbksHD5ff+cUAR3ZWsutq9037qafol7s8KaHdxaL4ZBEosA?=
 =?us-ascii?Q?xZOZkfYye/DjltokfEi8DXAbjXmhcEA5Hq5uNOr9iJI5wfA6CYDXUDaUjbdx?=
 =?us-ascii?Q?SHVu8M4pnNqfRg55HtRW4ImbEPx6prakL+vZsfHpANpVGcHBRXz+1Nlc6x8p?=
 =?us-ascii?Q?w1ZKeIqN+t08bmVsiELtHauZcKawGmDwMx/U0NvksSEJLQYiVXbGpftoGHge?=
 =?us-ascii?Q?Xa3nEAcG44v3P1RObQbVz78+W9DOBZfgLT3T8/V01bBTGJtBcwsYiwKGIPS3?=
 =?us-ascii?Q?L2YRuj/JdyhywlisMhvMhyOYOrR+RRzlaWSqNyV6O/0KDbZHAT8YisafmFmV?=
 =?us-ascii?Q?qmvvUL0K4pSnhTXKLDVAIN9w59f6AOkOG7YrutG5Ywo4MdRqGyyRN5YIgjjv?=
 =?us-ascii?Q?L0xL+Iwgem/1lJHIthD+1EZJ71f5+BSU9SNGMh5HFmf2SPIv9sfYxsOK+eYC?=
 =?us-ascii?Q?9Gm3PdOtXQ6Hdtq2VOht1lsAZchiAW28Z2OFas6jkcWYtfnV4khE5UUVmsnN?=
 =?us-ascii?Q?Ul0heo5Fu/OgHt8v9xX5XQ+Yj3ytQOGflw0+7Pwcl/3q67E+9B/wuBsWFdYR?=
 =?us-ascii?Q?1yJtrlSdxduUJ4+s3hFn4ANqY6Pp/Xa2gWGNumEVDOH2VQ3gata25kenqt3L?=
 =?us-ascii?Q?Ge3nLAkzUuruNJUg8sZVNI8WUnFKup/m+aPlHGIcWiJWQcSe7M3XkU4lKvf5?=
 =?us-ascii?Q?cXLu+39Ge0EJxGXbaZlnNBZ4qA94VOVk1pAn+cMsQuFVYU11ncdsMiWkgPEu?=
 =?us-ascii?Q?+hbOepzNpvD1I39nKzhaI/uPc+lRdOS8dY1b+secmaGNZtI8BAt3hsy9mgXN?=
 =?us-ascii?Q?sIZf7r7DEb2OwARwLCzJVN8EMgR618XXlVjlu0AnOFQF5rhz4ugyRLl05oNy?=
 =?us-ascii?Q?vemxqLM9O9TgWjk8O+qbFD7VfO5vpAMo7NsqSG0k9BPVRZrAQvEihzmDImdw?=
 =?us-ascii?Q?IJEoV9zp+QQboe+ypw7mshw8tGpNtrL1aLiP7w4/jbYXhoK1HvYPe1ChYDMr?=
 =?us-ascii?Q?oaBfFarErKjOuUPNLajtFZAlNEtfS/a1gS0+9gdjHWb4LobK8RSky2IY55rY?=
 =?us-ascii?Q?Rgw5ZTecztLvJNIEBjSpKbnVSj5CK6sPdbsTB061lU7a/XOEaxCxh3UlVfCl?=
 =?us-ascii?Q?wYoum6jPlToP0VZy9Leoz0Pd/nYvSYjMgmxcMdEDS1AkZt6HORpta3oJCDnk?=
 =?us-ascii?Q?DR04dW8ooiGLgdEECYRYvkbG7Ma2oEkUUV0l+fjuHZtPQ2Cj/HxyqtDj4ZMP?=
 =?us-ascii?Q?PftiwJOcmoBWNSeT0mBTfkw85MirUjhrjq+8+U0T74ig+Q0fy/UMRNWP34H/?=
 =?us-ascii?Q?q0RWvJ0O2GgmqQBzlfGdIFba5EW/FLJHGbZ+vpP5c/zyXENl8rSqTCJF6HFX?=
 =?us-ascii?Q?SrnIgjHSOlbTyEGVcG+XDGqmsjrsSEgJCr848wL5V2Tb1+xOWit3B8yPSK31?=
 =?us-ascii?Q?2QNJSP03Moqyi3rMXukJxr08OqYrinckfDa3/MqZ7XMsLWg5i2lp1Odbdhqv?=
 =?us-ascii?Q?uuwOME/5Xzo28yPZfZpOAleCZWkfW90NM3k5YCUZSx5iM9VsKHSvlaFVI51l?=
 =?us-ascii?Q?OEWpgFiypJi7L0c22fIpIcEX1cyRZr37G+9I7yQ+UF4W/R9tdHp6de9GJIxq?=
 =?us-ascii?Q?pgW2MLTQ/kP5SrU9MXM4MXNeg5ulQ1JksiFag4XKorTbt1N8Eg1A0eazZeBl?=
 =?us-ascii?Q?ahko1vQy6PDvF9eWhe6jYkGSrtyAbDL1ccz2Igqq2BAJ99uxIPaI7OSdHRPs?=
 =?us-ascii?Q?1IX8qcXxfPXRaoohbfRsw4LzfVsbQ4eL0785RsB/xFhLhPV3MUGa?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 89beb525-e218-4c8f-862b-08deed7e0326
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:31:00.8300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cO+z0T1FiraZLu8fpl8mu4f7jFQqz2kaAx+v12qQWW7FqAwstyGgPA/65mSCz0POY+f66jVCUPp2A5rwB/NSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

From: Frank Li <Frank.Li@nxp.com>

The circular LL ring has separate producer and consumer positions. Add
tracepoints for LL publication, descriptor append and completion,
IRQ-paired LL events, and engine recovery. The LL events cover both eDMA
and HDMA.

The recovery event records configured LL channels before a direction
reset. When disabled, static keys leave only a branch at each trace
site.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/Makefile        |   2 +
 drivers/dma/dw-edma/dw-edma-core.c  |  49 ++++++++
 drivers/dma/dw-edma/dw-edma-core.h  |   2 +
 drivers/dma/dw-edma/dw-edma-trace.c |   4 +
 drivers/dma/dw-edma/dw-edma-trace.h | 169 ++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+)
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h

diff --git a/drivers/dma/dw-edma/Makefile b/drivers/dma/dw-edma/Makefile
index 83ab58f87760..5f395fa1ede4 100644
--- a/drivers/dma/dw-edma/Makefile
+++ b/drivers/dma/dw-edma/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CFLAGS_dw-edma-trace.o		:= -I$(src)
 obj-$(CONFIG_DW_EDMA)		+= dw-edma.o
 dw-edma-$(CONFIG_DEBUG_FS)	:= dw-edma-v0-debugfs.o	\
 				   dw-hdma-v0-debugfs.o
+dw-edma-$(CONFIG_TRACING)	+= dw-edma-trace.o
 dw-edma-objs			:= dw-edma-core.o	\
 				   dw-edma-v0-core.o	\
 				   dw-hdma-v0-core.o $(dw-edma-y)
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 05b9ceb0b920..a53c5b96886c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -421,6 +421,12 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 				     chan->ll_head, chan->cb,
 				     dw_edma_core_enable_ll_irq(desc, i, free));
 
+		trace_edma_fill_ll(chan, chan->ll_head,
+				   desc->vd.tx.cookie,
+				   desc->burst[i].sar,
+				   desc->burst[i].dar, desc->burst[i].sz,
+				   chan->cb);
+
 		chan->ll_head++;
 
 		if (chan->ll_head == chan->ll_max) {
@@ -482,6 +488,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		if (desc->start_burst == desc->nburst)
 			continue;
 
+		trace_edma_append_desc(desc);
 		dw_edma_core_start(desc);
 		ret = 1;
 	}
@@ -611,6 +618,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 		/* Hardware has consumed this descriptor's LL entries. */
 		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
 		list_del(&vd->node);
+		trace_edma_complete_desc(desc);
 		vchan_cookie_complete(vd);
 	}
 
@@ -945,6 +953,44 @@ dw_edma_engine_recovery_drain_irqs(struct dw_edma_engine_recovery *rec)
 	}
 }
 
+static void
+dw_edma_trace_engine_recovery(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	if (!trace_edma_engine_recovery_enabled())
+		return;
+
+	for (i = 0; i < cnt; i++) {
+		enum dw_edma_request request;
+		enum dw_edma_status status;
+		bool configured_ll;
+		u32 ll_head, ll_done, pending;
+
+		chan = &dw->chan[off + i];
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll) {
+				request = chan->request;
+				status = chan->status;
+				ll_head = chan->ll_head;
+				ll_done = chan->ll_done;
+				pending = dw_edma_core_get_used_num(chan);
+			}
+		}
+		if (!configured_ll)
+			continue;
+
+		trace_edma_engine_recovery(chan, dw_edma_core_ch_status(chan),
+					   request, status, ll_head, ll_done,
+					   pending);
+	}
+}
+
 static void dw_edma_engine_recovery_work(struct work_struct *work)
 {
 	struct dw_edma_engine_recovery *rec =
@@ -1071,6 +1117,8 @@ static void dw_edma_engine_recovery_work(struct work_struct *work)
 		return;
 	}
 
+	dw_edma_trace_engine_recovery(rec);
+
 	if (!dw->core->engine_reset(dw, rec->dir)) {
 		unsigned long delay = 0;
 
@@ -1693,6 +1741,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
 		return;
 
+	trace_edma_irq(chan, &snapshot);
 	if (chan->status == EDMA_ST_PAUSE)
 		return;
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index cb3ff23143a2..da2a9ec54adc 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -204,6 +204,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
+#include "dw-edma-trace.h"
+
 typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
 				  unsigned int events);
 
diff --git a/drivers/dma/dw-edma/dw-edma-trace.c b/drivers/dma/dw-edma/dw-edma-trace.c
new file mode 100644
index 000000000000..2620ad61a943
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.c
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define CREATE_TRACE_POINTS
+#include "dw-edma-core.h"
diff --git a/drivers/dma/dw-edma/dw-edma-trace.h b/drivers/dma/dw-edma/dw-edma-trace.h
new file mode 100644
index 000000000000..e5b3eb57df06
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2023 NXP.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dw_edma
+
+#if !defined(__LINUX_DW_EDMA_TRACE) || defined(TRACE_HEADER_MULTI_READ)
+#define __LINUX_DW_EDMA_TRACE
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(edma_desc_info,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc),
+	TP_STRUCT__entry(
+		__field(size_t, nburst)
+		__field(size_t, start_burst)
+		__field(dma_cookie_t, cookie)
+		__field(u32, id)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->nburst = desc->nburst;
+		__entry->start_burst = desc->start_burst;
+		__entry->id = desc->chan->id;
+		__entry->dir = desc->chan->dir;
+		__entry->cookie = desc->vd.tx.cookie;
+	),
+	TP_printk("chan %u%c desc %d nburst %zu start_burst %zu",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->cookie,
+		__entry->nburst,
+		__entry->start_burst)
+);
+
+DEFINE_EVENT(edma_desc_info, edma_append_desc,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc)
+);
+
+DEFINE_EVENT(edma_desc_info, edma_complete_desc,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc)
+);
+
+TRACE_EVENT(edma_irq,
+	TP_PROTO(struct dw_edma_chan *chan,
+		 const struct dw_edma_ll_snapshot *snapshot),
+	TP_ARGS(chan, snapshot),
+	TP_STRUCT__entry(
+		__field(u32, head)
+		__field(u32, done)
+		__field(u32, total)
+		__field(int, index)
+		__field(int, event)
+		__field(dma_cookie_t, completed_cookie)
+		__field(dma_cookie_t, cookie)
+		__field(u32, id)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->head = chan->ll_head;
+		__entry->done = chan->ll_done;
+		__entry->total = chan->ll_max;
+		__entry->index = snapshot->idx;
+		__entry->event = snapshot->event;
+		__entry->completed_cookie = chan->vc.chan.completed_cookie;
+		__entry->cookie = chan->vc.chan.cookie;
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+	),
+	TP_printk("chan %u%c event %s head %u done %u total %u idx %d completed %d cookie %d",
+		  __entry->id,
+		  __entry->dir ? 'R' : 'W',
+		  __entry->event == DW_EDMA_LL_EVENT_STOP ? "stop" : "progress",
+		  __entry->head,
+		  __entry->done,
+		  __entry->total,
+		  __entry->index,
+		  __entry->completed_cookie,
+		  __entry->cookie)
+);
+
+TRACE_EVENT(edma_engine_recovery,
+	TP_PROTO(struct dw_edma_chan *chan, enum dma_status hw_status,
+		 enum dw_edma_request request, enum dw_edma_status status,
+		 u32 ll_head, u32 ll_done, u32 pending),
+	TP_ARGS(chan, hw_status, request, status, ll_head, ll_done, pending),
+	TP_STRUCT__entry(
+		__field(u32, id)
+		__field(u32, head)
+		__field(u32, done)
+		__field(u32, pending)
+		__field(int, hw_status)
+		__field(int, request)
+		__field(int, status)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->hw_status = hw_status;
+		__entry->request = request;
+		__entry->status = status;
+		__entry->head = ll_head;
+		__entry->done = ll_done;
+		__entry->pending = pending;
+	),
+	TP_printk("chan %u%c hw %d request %d status %d head %u done %u pending %u",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->hw_status,
+		__entry->request,
+		__entry->status,
+		__entry->head,
+		__entry->done,
+		__entry->pending)
+);
+
+TRACE_EVENT(edma_fill_ll,
+	TP_PROTO(struct dw_edma_chan *chan, u32 idx, dma_cookie_t cookie, u64 src,
+		 u64 dest, u32 sz, bool flag),
+	TP_ARGS(chan, idx, cookie, src, dest, sz, flag),
+	TP_STRUCT__entry(
+		__field(u32, idx)
+		__field(u64, src)
+		__field(u64, dest)
+		__field(u32, sz)
+		__field(u32, id)
+		__field(dma_cookie_t, cookie)
+		__field(bool, flag)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->idx = idx;
+		__entry->src = src;
+		__entry->dest = dest;
+		__entry->sz = sz;
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->cookie = cookie;
+		__entry->flag = flag;
+	),
+	TP_printk("chan %u%c %d [%u] %c src: %08llx dest: %08llx sz: %04x",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->cookie,
+		__entry->idx,
+		__entry->flag ? 'C' : 'c',
+		__entry->src,
+		__entry->dest,
+		__entry->sz)
+);
+
+#endif
+
+/* This part must be outside the header guard. */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE dw-edma-trace
+
+#include <trace/define_trace.h>
-- 
2.51.0

