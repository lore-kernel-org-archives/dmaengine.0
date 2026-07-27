Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555924314A9;
	Mon, 27 Jul 2026 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171826; cv=fail; b=jaVPDrmLxD3mtAzDrOEZAXAYLKtsTk87DHUudqfL+pzfcFOEdBPhPb01YCtW2FKteqVm4J2rGKcQGiRYmBJYY8dGXG5KuiNbit/4d7B6MyQmQqM0S/8Sc0QAbdKH4DBMr7zMWUiDDBcakjpnpNON0Too1rTx2G9Y9NP147jBLbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171826; c=relaxed/simple;
	bh=S+gZ1VgStuL3+a04VQPk6MagdwUvvnOLJdlT+ySpXmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1961a+YR4Sxu+umVWWCqg1lowCl45cn5+stnyRoddvfa/rHXkq9uRm9NSnliizDXuzlw9Uof/1TjOxQ/V5oA/EnFjRrhshG4NCa878iGGleE2v1hnjKaBD/4v0fbiPqy1DzW+LeQuWM7xbyac/uOkT2ml8NRMTZCVkCYGhL9IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=wVJ1CsNW; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="wVJ1CsNW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zURefv7QbZEbNNJ0ZqTIGaKfVSPT9A/wT1fMdUpMtTbOsQ4MuuuREWX1mked8lZXvh8IzF4RW7ntPE0wQiVLs7aVdN/+7u5mO9M4CUj3auC6fckSsq2Nlsg1kC4uXrrxM+rOj2ftlM55MOsh9s+cebMXkbB5qO/QJ/d83OOQPYSOd1wbb7dmzg/rV/DY/PK9uZWfcvqLVl4h5zbCe/UDs/CX9H/uxl0Iqvh83f1LM47oa5f78Pg67X3Yud7atwqsg0ElGV8Ex6Xu131Bt0dWLvy7x7JWwP89WjXkoTrFWx1boVCSbBTQJ2MxZuJjHhiHIpi34zgGf14E19fUToQKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWQ0g2Rwf1/qThT56Zj5ZMW+51NYjYtjR/m752EygoY=;
 b=Spe0YrBBnBOMfbY+uQxL/g9sW/oh0EO5PZffJCI64sVHuSfpDxJshhvncfv84LttzgCbrnRIWsGegCCJaqycAIPhAGQlyzzJAE10MY/DBgqhp0Sor+uulhq3aQ0ATizqDpgPWoPIE7m+/ZQF6kaqdAE1+Xq3mlZRAYQDPJr14A/Si06EiM/jrWpsf8QMy+1RRwpm3pKBoIqlBzSvtIKtB6lqw/heVk+eD3E0dOVyKt9GwCsYiol09PScx88719Z94g27+vnkJ1tG6Rpz2s7aYsqCSRtiG6nJxeTjMkYGZfcokqlb9UClm7li+FH2Pey5eHcUfbDAO8fq8NNPyXWpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWQ0g2Rwf1/qThT56Zj5ZMW+51NYjYtjR/m752EygoY=;
 b=wVJ1CsNWYXnDKxXhE2c0xbgxxHMXjgu3ZJYeSbfk2o6cKmM4GoJY0cT5/7jtx+2B0cfBBXyuETUns2RdtbFrEJ6JEMdbN4FaBZCiXFbx/lB2PNw1hgsilO49nGEUMqEYIYEPJy2Dw0evsF1smHqSqNrMS5DfNJp9h/yhpPSu4uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:37 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:37 +0000
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
Subject: [PATCH v3 08/24] dmaengine: dw-edma: Prepare LL progress event handling
Date: Tue, 28 Jul 2026 02:03:07 +0900
Message-ID: <20260727170323.2321369-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efe3d26-d2b5-4d5b-bfb5-08deec010034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	ZuWc1wFZgziNZVyFaam7hBbMmVrB0R1t9PWUNhvzpjPTVh8LyPzwlLD22oK2JmRrCVO7U3qntkEiXdKVOXhXvQhOTRBImFlPN4ShN8Y+YcPItRQwE/ZQkzDLkxxvz2Gd8h76Zmt6IOsDRPx7E6ySBu5y3pNn62Pb03bfp9lEI62lBarjnOBtG5IKtzPBPmpJK4NvDYoaSh1rxJqsg8WAf/GFc69JEnDTBCnZ5lP4I2IQpfVyoH2ja0s2YRz/EmEOM1dV9OMFxukNDY7ZTRU28wRy5dNf2WwqjbqMprveaqCEolJM9FE/KB/Z3rrjyhwAyZ/fT1mtP0LW4TMBSa9a1ZF/Eym1LDj30ot/ySpWEvi0nUEuLqCLm7q+V+g0R3ufvlKiVsLM0+Xw5h8aBssQoCDJ9zqzGkCsAhUWN+zyRdk7EXQ677bzNebk47H5mO6Khjdfc2b3daQbLY9OgupX711kY9hxaoSgaztK4kT7nXJ0YE8n6LmcX0qqXrtk5bjPclPti8MGxsWYqhb/G37f62SfQHL7bpEu9L/ggozLjidbsMCmvdIjSGMcEuxNsw782BS8loFNjcV1NZIAdy1Nv9SWZehUAGV2t0d7E/L7bUEUjjYheWM0Ybp4ZbpbtJG5g6znX1U3QwsxtGkD6kxi21TLnE+R8AO9/ifDUIV+LkcAH950ScMsnDhqTaPTWQIDSy1FcJoLTWY/qhHayJHSww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hcfNrA551lDdxITqDQujoZXbT/XFu0MCeJjCyUJsFlXGeGbJBQUkTsUalC1h?=
 =?us-ascii?Q?w+aMZEBbCPA5P2IDeE3c5JgeFMa/UrBspjrEC/Ll7mm5xsR1n24rwlC9++JP?=
 =?us-ascii?Q?qT6d7MfUnJgAUvzqJywWiSSiiFImV1ATbqkqy7LXnXujKOutpOToEDO7IfMn?=
 =?us-ascii?Q?oImRjMUeHv5eNIWiqNabDz1vhRjojRBprg2sEpc+aQXOL0HKlKg5+CnCOXvs?=
 =?us-ascii?Q?xo/h3cOSvC04pQ+dwTGq4pzz17vaXhPcQg0hAUY8eaGi2avp6SUR7TsHZ+tD?=
 =?us-ascii?Q?xriBdZjDt5r+BML4zfS14HFyAjK2eGuH+A4GuIfedXfWUMFwOrx5db2ia8qa?=
 =?us-ascii?Q?wfiKiV6BJTkk+AYMaiTCafhOeqEIJBTMxwNJoaS/qYP9cSVi9UXYF7VqukRB?=
 =?us-ascii?Q?cCVXQPS94zNy0MhrPXeOJDtZDQ5EGs0nPQ5YhIezy10soL+0sSDyjz7qVN1q?=
 =?us-ascii?Q?+gSTbYgqPfTjmGdF8DmYJbGP4AYuV/A+HU5kDd+WVvQnJhCTiTpipY3egVZh?=
 =?us-ascii?Q?YAeoXU6ddlRdRnC+9Z2JAVsmWrK6mvjRhEH1hONTAel2nEkQLOQ6+cM5qP7Q?=
 =?us-ascii?Q?w7ckDbFggg5LT1H7D7nhuKNrnAqpLtzKhg7aEFvaobftzHeF8Me83QksB3qV?=
 =?us-ascii?Q?kTnbOcYR+8/uEoWH0EMC+kb/sK1y6Vn4V8ImByzpwTB+DKXuUmqHu+oQ1IL0?=
 =?us-ascii?Q?oMgtjaxYwU54WGADphegI8d5JBuAaeQCpMYqVU7dI3/Dqc4dB/Ilcg/OVQP+?=
 =?us-ascii?Q?poV6IKTAAsJL4AVD3h+8pru4VFIED94j8Kg3GREU7y/ZaoDp7oS0f8fATnml?=
 =?us-ascii?Q?iLqota8VrYyrLN2Xcb+CKNpE6bWWJBezrvgVDWG/wS9yn3qVH7P4qw+cH+h2?=
 =?us-ascii?Q?W4E+XqlJH1CVFFPIyQBTSTaBeqr4Yq6o+2b0b54ABwdWcmSzcpjDLsk8nDVD?=
 =?us-ascii?Q?CUl68CrN3cbnPg9K+4bbZT0b3OuLkS99jjZR11n+/m1/imclq5/CQqN3Hga6?=
 =?us-ascii?Q?zBNkUQAspdNy2eiIXRk/RUSqB45mqa2uVo6AC2+8OmOLvNUkPj+DB4ye4pxp?=
 =?us-ascii?Q?q5f0qIZ6QYY8kbQ42vnTe+o8SRjJ4WlKU7l5OSJjlESM3mmKaGwEp2IhsY4u?=
 =?us-ascii?Q?gQbo90cFXsXe5QEwJfSbySCz65RoeWM4SH1jOiMa1kiRwLv+QKIwi15Ohomg?=
 =?us-ascii?Q?j4jZWxs7eOqQLprkEnSZHSLv29tzmlwsOinC/8InpgSNUF9fhe91b2LIgPnD?=
 =?us-ascii?Q?SB1+SXvP0JJV7cDYzsT4OlHtQ3mTHHN6kTvUGZLMathaCuunczCeAC2zd6AT?=
 =?us-ascii?Q?CxmbbxoKVXAvKSRYHQd1okrTL24Kg23VNenbkJQ+NZE2ElAHD7wpxGMUELXo?=
 =?us-ascii?Q?UImGMJaZtJjkcCqDvPX3Fjms2bC+ZGGcoUflupmxNdml6YMaoVRCD1nVZnJv?=
 =?us-ascii?Q?C/UFSVBpkUtsmxVR6MG0Lgx9rEfYQUT4oJFvtCLe1DZuX8iUR/YhmACigmJM?=
 =?us-ascii?Q?7whpWChxzaLRRVyrv5A2PrrTUx63b7b0cud161aSDocnDNUjBFm2ys2H3qDE?=
 =?us-ascii?Q?64Im7n1ynBsc4xrowRW7cLUA6/tKpCD1lp31+mwcxicc5+NK4Z+GOOLT8iWV?=
 =?us-ascii?Q?H4KtsdrZQg33MhEW/4vG6CHjOja7Lqgvgfn0Il13x99rTqzx6UWdGYe4WPmB?=
 =?us-ascii?Q?WYCqzdl7QSWkPo5dh7D4gHstCcI/XH+gyLRXUd7uOJcoD2L/iU3BKSLKxhUa?=
 =?us-ascii?Q?q6kxe9atTIBTKmuszn+akP9hCC+dIcqBsIZsN2Q7pQsL+XX5cnP9?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efe3d26-d2b5-4d5b-bfb5-08deec010034
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:37.6368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClRjipwjLGSKzbsHzKsQE6WDwIIcB+InmSxe2zVg9dNnvO9jbb4nxFA5UljWOQA56v2vTYaYhQFBt/YQNlflSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

LL event pairing needs to know whether event registers are shared per
channel or per direction. It also needs a provider operation to clear
stale LL interrupt status before a channel restart. Add both.

Centralize runtime request updates in dw_edma_set_request(). A later
patch uses it to cancel a pending LL recheck when STOP or PAUSE changes
the channel policy. Rename the existing workqueue event bits to
distinguish them from provider IRQ events.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New prep patch split from the event/restart serialization and
    stopped-tail recheck changes. (Sashiko)

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
index c31fff095b4f..d497d36f5b28 100644
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
index b2d35f0b7b6d..b181603bf2c7 100644
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

