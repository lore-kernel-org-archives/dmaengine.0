Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B54756D5;
	Wed, 12 Aug 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550267; cv=fail; b=gRdnXiZH7qEnhdGYpKLImKFUzwOCEZYg52M8nfKCk0N/z8FLJn1yagqtT9UKzokc9ZIMvYug/qw47Sow33L71/iLb+mlqo6VYdvXEUXYnN8mR+WkVO+O/5ToKvePZnQoxnYxedqHW8X2Kf2rARNm1oSrAwXSsWp8uRDpvM4KBUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550267; c=relaxed/simple;
	bh=7ppYB0zylSxr6UEHqSqDE5h4g73fH+sZWWwMhqBOs8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z9JOiEZHgh5s3edwu8P6FcX+ZdlCCwcL6HqTejt5hYWtjFjOYW1Ytp/ZKvJuL8+3WPsmfPMX74ezKoWM7CLyYG//HBhv1DZRWm9n+a5/nOqhGM44xUDRN4WIq28FPNySkjcOyJcEN+oTpFmusH/k+J8oUCd3aFgEQR32EzlEwcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=K2U7Nkeo; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="K2U7Nkeo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6SA7UbZ7VG3U1ay4yfL8ttuHUrxLQ7m3bpYMa1Bxbg8dV9hV8PqJgqT/Tc5WwvsnobR+Jfz3zB0VxCCMZoQqHJgK7pZGbVGcKATk/MIuTeQ1aDCqG3n3Gtftlk8uPMA5dv1sUapMtLVT/y9xt6phlh/bb1pRWM1+ZG+sUxPr6Vw56om/PnORcpEHFuPI6rJOn92JSKX2coJnHK+YAlxWfLXyFIkeQNo+jl1O/N+I6a4mEZv6TQ32Y+iLABybpXleILJ3kYD32cBOsR/BQY8wZnYdP23XF/KaTX8yZ6RCUdcYm2QjnYj+tzzlkJXa6ZQjaDy96jmo/T0lJDqWMF/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zKxay8s2mSAPuxqXbGZqjmZ8zhyayZRqwBBKCe7m7Q=;
 b=OaLVsiXQ3T4g9Vx5OdJilHLmfuOxJwxJGYfA9YS7eKW5IYVbSO8njSeaxSJg9M0aOvdqH44xZWfKxD1lvQmrk0yoGc851AOByZjS7wuO3w0qjtCaONBMquerhDgzLJoGvAYlg0VyE1N2nFRBBXWJW7Ck3cAG+ngx8zp4zlm4y1dbrnJ1cm6PIgGFuvfhaERXTzRiGMohRHnXqmzO1QwhKEgbPBcTnPDHmhXfjCLyExEWuD9T/vnjtp8YAMiVzrMOMln+YJ/R1iDSzaTLCI5uCSnuW4bF2ZuvgspLNeYNjcs4Q9yE9zWwbZt1oH9K2IsnrskQfwbTaYIUmKV7EeHbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zKxay8s2mSAPuxqXbGZqjmZ8zhyayZRqwBBKCe7m7Q=;
 b=K2U7NkeoREqayKU+iJ0uyj/mVP7tZ6R/OHwq3sRTsnKLqsxwXUdxdml+adACV2t6jPNVtx0Kpe96DFDnSkrgTKJyqEsBTG11qeoXThGhGwqLoQZ5np8rwKQwmJtWLu5ZsChiGKZtcDS5nNPs9aZRXmulAtohVtPeDM9po3x8DMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:32 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:32 +0000
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
Subject: [PATCH v5 08/24] dmaengine: dw-edma: Prepare LL progress event handling
Date: Thu, 13 Aug 2026 00:57:05 +0900
Message-ID: <20260812155721.2807506-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1cdc37-ee3e-4f2f-4571-08def88a6b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	kOwlJnesBY1E6nj2w0jjt6G2lujXYjl7kxLjrANzJlSm5zQGzJi0L4slM3YnfDgJQA8FwzMcrYvVKyp380kCwyxOGZUq86PxxqPQW1cgqdMtDhb7QOCST0JFmh/PrLrTWMNlLk6KqY+xE++MecHGDYODVPih0nUXKJxQpXHotTNwflh8R5gLst+VomwWk5nQadKNzyQzosz2S+0jRHGGIRCkaRBXFBAw4xTxbv6pSvXDOJ1ossljDJb3C5oZaGT3X9A9E9ICS4iOgYg1VrpBCgEsPq0Ms3jEn+BFowU48/0fOE3ShA4B0memjtLf0TCvmtgpcPfQZUQYqLHpjMfryVDGWTho6RxSOjKoqgFsgzExYVvsH8BworvVE9zrCbyUy4lmtwuRfDZ96TxkNGAsDHhM1pYp3ZTFzx7Lgk2g6EwitSmIir78Pg9J/Vn4CiUGt7X5cgwC7pMArooYptZ3Yc9Tyo7vT2LobjA5oL5z9khXJoEUAAMeta+E7Fe1FkV7TzuZmqmoj5U3ZGsLiANdyABqU9uD0vN4nNnmBlAEI9p+OvJYL5+5D3HMyuF4jkhhtfDFBLgysq3/l/aJsOrEre6y8lSQMoCFzM1e1HnPXHa2KlxqdJheNDz1PaY4m4MYtRJ91BVU6mMOmInjHkXgts8WEYDo8Lj+qUqaU3sMwnvYi4SRO8dn9eKBjDSY+sjg3ZZHdcncavJJQ02jtlebgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dlD6ALACwySMrA/zhlj0YFmZFjjsm3n8Kz10cXb3BwoRP5m46zF+GnEEeYqd?=
 =?us-ascii?Q?c04/ai9EmtbwFY2YvxKZEAXrZjkN7AMh5sQ5f7N9ZEI15KSlMuHtVRdlq91o?=
 =?us-ascii?Q?Mpki9YtFnHoouuDjA8KAUJMddZHsXUJl2PPLDhuRj2Q71nnSioszz3w042lz?=
 =?us-ascii?Q?/WHmMYS86dnmyUYFPcDMrvRnHORw99o64RNzmrW75f+RJhZLVU7TghUY8fSz?=
 =?us-ascii?Q?KS5u58zYPeQsC89JPhcQsJCq2QhuCgXJcjJZKRHve/7mFqP1z8wZ8AyBDwc0?=
 =?us-ascii?Q?A3LphqKXAk96iasn0k+q5E+EhJmFHr+hGxiF+lcKn0szN7S/Ko6tLVa3aZcp?=
 =?us-ascii?Q?5nAkhNGPy9PM2gVmUon0ceFnPoFRQ7fyga4qlk26fbyWIEoXX48vOYqdd7g5?=
 =?us-ascii?Q?CrZrUTFzsXgm6y0WIS2Xof9BpFmoaBRbBmLlArzrRLnUD27En3hA4rsz6uP3?=
 =?us-ascii?Q?hUdrn5VrK/u4n6DSnAExUNBsaB0IkaGu9l6ItiJzOPyF4Q8Iu1LluBA2ge+5?=
 =?us-ascii?Q?/0ylEhwmWNIrItun2U2xE9siBDP4WMCFPBcNBSt0uWf6aIUojApR8wBbJX8h?=
 =?us-ascii?Q?LCDPTzkvyZ0vjurkSGG2kkJRso/c9vsbmOZyyjBlJfV5NmVyLCNQ9iAiheoW?=
 =?us-ascii?Q?a8jLtu7WuB4+676IGo24Yv7FFb5z0u+SmXXKK/QhJx7Qja4N/6j9JhWRuAv2?=
 =?us-ascii?Q?CE6hI7vp+Z/Wlc3y38qKPPgScxugPw0WH/kA2ps+nM6iKF0iwuCQAuRm2JQN?=
 =?us-ascii?Q?JmcamPK//hgPXUzE66pgNVuVJsGybvt2ICmRhbRLWAkKqWHfIejxRFTdUYwY?=
 =?us-ascii?Q?gn4qDjdQzRoBAKSeX4Jf6+1SFaNPpyaahJxVHy6VtG0upwnMTjO2glHsmcPW?=
 =?us-ascii?Q?hC4P65K/jqPUnuiUz8bvHfSjh6Cvf9WsHUJAHAWP39svkNCtzb/0JbAxrVfe?=
 =?us-ascii?Q?x6rEV5+EZQV7zbDfQnklrhTydbUUIo3BgZPlNHahKMikeT74JFu/gdOj0gHr?=
 =?us-ascii?Q?+fjoWnBs4H1fjeBQWyTUtZgaKvOmq/teEq7+/PXxG4Imr/aFJXKZZcCWWic2?=
 =?us-ascii?Q?h+R3rrIYjyfuJk4EGas3/D9RK03sNoy5EqUIm7v8jc1pEgPBYTZydlZFxF2i?=
 =?us-ascii?Q?UTAFy4sar5fjk4dqqEeTS6iIqM9Q5ClILmSGV0eYOxuoUgLlXt/v/5Kpf081?=
 =?us-ascii?Q?7OkYsOfEk/A1u4xmZ1Nvu5RYsAe6R5IMzJnuwK6PCQI++OOlZDJwuyFwVoXO?=
 =?us-ascii?Q?JeZFIQaCvfEWunMq88Ri8f34Q9tJXMcl7UCfHDlPbcn+aHOQ1ijf4VwPN055?=
 =?us-ascii?Q?p00rLhlEUgPIqBvQT/jQ/+ij+bVuqttSQoTT5AAm4O+7NdMJhSr48ctd3POf?=
 =?us-ascii?Q?e9WndBnZO8sa9mIKjKIi5VYecwAmX8IuQQQ9spW4TdFjGM/f5S2kMvqafmV5?=
 =?us-ascii?Q?kLZVTjKt3kpe4ywfDW9OhO63nqWViwknHrCEe8xVD+Ws9m0uQZtvH4PooDX0?=
 =?us-ascii?Q?yvKlpgovVVO+9EHqcRCbhpWlVnQyP6vpNSOAMWjvbpQaw/BVxLPfoBvBRsCS?=
 =?us-ascii?Q?YOp8Fv3gDsiFHNVsrjQp4/96ay7BL36Mnybymu+eAM+zmQw48Il1VqbVrRq0?=
 =?us-ascii?Q?XiMDGfDelcYZ/Ow0k0CrAz33MW34sYkhH/wvvz6yzt6JQhN6f4JVHmg2gmBc?=
 =?us-ascii?Q?SgolyIO3O7uiU1GtCdvfj3HjRZ7sVfBl8Og6zKllyh88fySqOnFYgHUGZP9L?=
 =?us-ascii?Q?hOKZ1XyVNzCrkWdmQ8+hrMjQA4pijE4HWGLx3EnzXKAigSMDrTRC?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1cdc37-ee3e-4f2f-4571-08def88a6b91
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:32.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwS3K4OvCsXyuylXKK23crXWio0sZzTbfc45xdq0m5ONXFDAsoSEq5uXeuOwna6OR7Lxw/ckzZsThZswEMY+9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

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
Changes in v5:
  - Drop the remaining 'event_scope', which should not have been present
    in v4. (Frank)

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

