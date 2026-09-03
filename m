Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021106.outbound.protection.outlook.com [52.101.125.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DE03B0AC6;
	Thu,  3 Sep 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417966; cv=fail; b=iBTGp2uwGQAFyxPpO9SFdeAMgm0Ddz6QrsJQtKn8IfK//rnuQnE3Ooi022UGvusFmvebu+vCAoiXa8ZqOBQJQoLtR5K0WRQMEPiBMXnVbrzhjIjaewMoZp4ETqEwRv45/drOIW+I/BD9vFlJ7JhNfY6hNLtgMz9FneZyvVGZgFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417966; c=relaxed/simple;
	bh=OixtRfX4BjSWCvkCTf1q09FZ/x9Oq2hS6jJNpICXI2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KphCAOgViFGDr9ogNL/9vO6mhe+33lMVs2Z3TBhpn6xttRBk9LJyw33DccABqtQngXdETYt/KsdQPiZ5PcbbDL2RONgQfb1c2HdLkgLK7lXnSwIqVcy3LKuA5H4QyhfvlLTU0bXcFHwdxKWU6djjlB43y9+tiA0ql8kj3mVHH3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=bc9NZ6cZ; arc=fail smtp.client-ip=52.101.125.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="bc9NZ6cZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DL0a09dRm2X7gZloqnZhvQWsAkmzzHQsG9uTw5uVPyuslmxENwMe754fMhXPYVjq2ax4tKrlmbRdAUxwrZUnDgfxcwjuUFo0gUmc8QI/Yl4qibGqdgLxzq1sYlo/iKKx5eM5/hiwcWGWbVIMfQ6slE9UQXh36JwCx40EtTj/yupzNLnq8SqoH4lrE+NAcvoqX/S8hDhYn3YormXTpSIY/bGKxyNtCRxMi+7Op0C/+3o1bYS3L7oEFixj0KpHajQx/cJYZlTYeW8P2Y0/zk9wAdnLT1YMGbdCyhOV6UuGHc7moZcRtibAPpmGLKwmE7zlwzB/TQ/4QTJtaL4GrQlQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioIo6zrlVaE+Qxf1RTeh8uv7oD2OEIGlD5hBBebFBsY=;
 b=FyCOUhe5yku+VHRLJUGR9LFG+/XhiVtyO1pS0XxUm9+7ha2KVqVcjLF4aWn8CraEqaxLUGBt3CWAg+ZbJNcpVO7JPkrm8Et6NJcqMEGwvzUSS7v2NB+MormINmpgnc60unevPPKXrpQjnd6JpojpU04Laa9n3AytuL8nta+PUIXnlBHEA228ZTTPjnN+rTkAGRAUfiKC6rTn9gEmFYDKAFVNzF9L7w49jWKCT+bd69XqDbdz7W4bla5DfxAcLx8T85NuK4zJDmbTTN70iDo/T/+7RJR17Ez8W4A63MSfychv7caDxTVZho1hntXPmUBBlKJSTHjVYSsxf2pKlOawxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioIo6zrlVaE+Qxf1RTeh8uv7oD2OEIGlD5hBBebFBsY=;
 b=bc9NZ6cZmQuL6oVs+jj53MCBD+ubvGTT9wZy5NAlWr2+KNREaJahR+1RlmT/RG9H7Rm/ebUCubqcKceZJQJn58cPiD5AXQ5B5slSSqzf8as0YCWo29AXXzSSDhBPwJPxhYbki1YIKbLs95YAykefzPwucVQOyKj6mQx9i/fwatc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSOP286MB7980.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:479::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:45:58 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:45:58 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dmaengine: Allow drivers to assign static channel IDs
Date: Thu,  3 Sep 2026 15:45:31 +0900
Message-ID: <20260903064533.2269557-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903064533.2269557-1-den@valinux.co.jp>
References: <20260903064533.2269557-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSOP286MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2c4715-a988-45bf-86c3-08df09870303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ivFglbRXR90g+eLNyigxDwxlGk0zdSARQKTEelVQpgcf6TQsOnXySeGnCGerJW9vdBYBdyJs4KQGgA4vOQfRJ0TRQrSRKKOhp/2LX14/1RvY2L18/OgOQ55pG5dal+zD1QTusgZOUDJ7EKol7o5f6X2T0FVc1ij9LUtMtscWuTqp8OaJihPqocijPJo4331Q+l2nXwwUd1kW8FjPntUQjX44K2MLtRYadQ34FVDNRY8yN00+bj36UNZRyhHOKCeN30YeVdgikrGFMqe1CoG7E8gh1EsbuLkNFw3wYzbY66hgkMnSZvQ0MFfAg6Ikjl/z4zTc124MqaE+xUdC84c/w2bH5bjlE3GnyJnOcxPhl0uWpIXAX3HSPZ41Puowt+Dsw8qDjuki6i7icoxY1k10X4PPrzwIXMgaaPSIL026kiutujjLVdBq+iGbTmsBzPN9fsjEaQ5C7YhFXQniaNZS4P3HzH9CKurvoz+7eMwDBCFdBAjfjgWz5jb3OcTM9OMoqce2i6zobcBY3IdjJe7hbAz8DOdcc8C1Vo2k8dJgPaW27Q6bZkKQz+9FMD7dHCmuvBO5ujw6fv9CSmeBNtafHZIvtPI8pHJakE39/YQl9uFx4Zk+X5oXuxt+bAilvHIGRrhqG0PUwg8ER/ejDGqINgO7abxXHKnv5knRsJUG/+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zrTWtn3iErPrYzDW5HGe7IEedQ5SJFWxjb47Xa8inZYSWS4ORd41afSSIgap?=
 =?us-ascii?Q?iyVSTUIHjd+Lx5pO/gpoK5/YQ5koAYlksGydTmqsI3qr4alYOdw6i2sgAZe8?=
 =?us-ascii?Q?f2W0+BlfLU9X63bi1Kib/I6YRDASP1AUVSfLcK1/OiOmtgLXqLuY/wS7011V?=
 =?us-ascii?Q?KDxXq1FiOhMpXXsraeWVd7hpA9KlorciJvyZNn/5VfCWOBrkHjtLdAYXMJK5?=
 =?us-ascii?Q?RtvrvI0U7aTazaH8agssXU1n2tuhDnwcTWFyShlENaEkNW/sWyOgkXDI0ioz?=
 =?us-ascii?Q?vIJZMh2ZfCtsykFF10BfsPMSLwzMA0z76G/5saLsUgwzObEFz3VOeZ3HZReA?=
 =?us-ascii?Q?VWgmlRv6xNPth0JY3PfNkiHcaHuptHSyMohC7YwifgvpHHvF8QVSDZOEY6dn?=
 =?us-ascii?Q?a3rNaG6Qlkc6GfWqU9NAmX0oRpa5zOhf+tom95xMCErW+9zyO+t0Pc4CLyAW?=
 =?us-ascii?Q?kXx1DgZpOKAwA0uxZvAX7gA9Tte5HmVABldkHXPX6/dhzz2e9+wV3qq6wzBf?=
 =?us-ascii?Q?1dz7c6QifdfSS0biOW9JVaz5PpS7pqVGYDLnIeMY/KhbdWAbenZpCHPAoDwd?=
 =?us-ascii?Q?uOWyS8hWVqKL/nT+08K2gjzYj7ckoqmW4UISWYp5f5aXJHFthxZetWPw0O7q?=
 =?us-ascii?Q?79zNjvJv0hRgNfue5hgpS2WzyuS9EFBnIfAYsr1RAJAZGa3yYes7Ba24619u?=
 =?us-ascii?Q?lJC8DvxhxkE0yRpDsl0O0tBSdT7EPFd7ub/9YHmaVl7zTitQlX3lTd0Dt+hd?=
 =?us-ascii?Q?mcC/by2r1luTNeQ6SDwGwRoY7DOPTOH6KCq7fMWt4/UssrqT9M7VPLdQ51OS?=
 =?us-ascii?Q?uXa22QijZ0pUIEEwHmXk57vBpbn82rb9AHYrcgIf1BxWU1OkEgNtq+anIM8w?=
 =?us-ascii?Q?MEjGx82d6hEDN3/4CRvNI5nCIfxgMLGYv2oTWJGXOclJY2u3kSL7s2L9Dv6s?=
 =?us-ascii?Q?tDh/LNyE8oaqcdFexYa9x41CIaNoGIPwr9kWudAfkiT1cdn36cKi1BpPebqs?=
 =?us-ascii?Q?drxqIp/A6YmzHXi0R26APJTbmAJjqZ6ZIL5TmVoZfEK3pzmn2OyzSic5J0qK?=
 =?us-ascii?Q?NSPqeMU6BGTTri/bVRcc9WV+DLkOEu1lFGTBVDYSPMdoaKeHLwutS27vaTOZ?=
 =?us-ascii?Q?Hx4DBHoNdr4e6526FLTV10l8A5ek+jcfh5t99X5lTRm2VOdHlzfApyjC2EKj?=
 =?us-ascii?Q?5dN48iKlIMApldFRz9P8/mQlfnf7UlK1Ye6qyOp4e0urfM+mNeLm8q5mjcVH?=
 =?us-ascii?Q?bNKqjmy+mzH5d87l5zp8A78/hPHSsGP3i2ahM9kNP0GMKVuXHNDEaj6Mu/e5?=
 =?us-ascii?Q?MBnDXG/L+57EsOuLIkIu3dFGCNts7rn3FlFWT8ZLETFeOQANLW7ujgyP78ZK?=
 =?us-ascii?Q?/W6aT+N7FJ/ZCKxC/TGP3jHIriCKMfcUoJfc4eoU0zGS6pNAwLrGt3RixhwR?=
 =?us-ascii?Q?BNbm3hisUo8Ts+7Sl8C4lgKkUIDuMAiipTXmR4zYDcFxDAk7qgYEMMmwwpnb?=
 =?us-ascii?Q?dVe/3vwSL+0UICbR+NnwgfXtZNAkKd5j/lgBtxiWru+uT3L8AEK7IkY4LkS/?=
 =?us-ascii?Q?XiEUCWfw+GcMPLTmMxHNW3AKCpeZuqsUNr5ijxKD4V3t2MxvfYQXXE2kpefn?=
 =?us-ascii?Q?SRLoQVB8lZMyeuabIJF9HB6K8CifoyFjVfwr1J31hxzPh7nCreNIqN4f8/71?=
 =?us-ascii?Q?2oN7HfY7JanPRRct0246eYh5RKwI4nl+Te6OHgIUCeghhbaeN1ZC+JgvEtHB?=
 =?us-ascii?Q?ObNR/rpcVJMQ6LL5RUZhiagLaWM1Xs+jGCWXjwV2HM+NIxxfLcYm?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c4715-a988-45bf-86c3-08df09870303
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:45:58.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dOASx6kSoAgW4GUxzaIcW0Bg6mBG7zwewK46WorUv0YoDvkQ2beZw4KE8oFyVUOvdd4AkKXngZcCgBdSk5EIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB7980

The dmaengine core assigns channel IDs in registration order. If a driver
skips a hardware channel, chan_id can differ from the hardware numbering
and a client cannot reliably correlate a requested channel with hardware
resources.

Let a driver request an exact channel ID before device registration.
Reserve static IDs through the existing IDA so they remain unique, while
retaining automatic IDA allocation as the default.

For example, idma32 uses chan_id to select DMA_CTL_CH() and
DMA_XBAR_SEL(), so it relies on ascending registration order to match
chan_id with the hardware channel number.

Use direction-flattened IDs for dw-edma channels. Unlike the
direction-local hardware channel number, these IDs are unique within the
DMA device.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

 drivers/dma/dmaengine.c            | 13 ++++++++-----
 drivers/dma/dw-edma/dw-edma-core.c |  1 +
 include/linux/dmaengine.h          | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 6ffd8bd82154..cc64a4679e6f 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1078,6 +1078,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 					       struct dma_chan *chan,
 					       const char *name)
 {
+	unsigned int id;
 	int rc;
 
 	chan->local = alloc_percpu(typeof(*chan->local));
@@ -1089,11 +1090,13 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 		goto err_free_local;
 	}
 
-	/*
-	 * When the chan_id is a negative value, we are dynamically adding
-	 * the channel. Otherwise we are static enumerating.
-	 */
-	chan->chan_id = ida_alloc(&device->chan_ida, GFP_KERNEL);
+	if (chan->chan_id & DMA_CHAN_ID_STATIC) {
+		id = chan->chan_id & ~DMA_CHAN_ID_STATIC;
+		chan->chan_id = ida_alloc_range(&device->chan_ida, id, id,
+						GFP_KERNEL);
+	} else {
+		chan->chan_id = ida_alloc(&device->chan_ida, GFP_KERNEL);
+	}
 	if (chan->chan_id < 0) {
 		pr_err("%s: unable to alloc ida for chan: %d\n",
 		       __func__, chan->chan_id);
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 03b2c2188351..a678c70a78fe 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -988,6 +988,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 					&dw->chip->dt_region_rd[chan->id];
 
 		vchan_init(&chan->vc, dma);
+		dmaengine_set_static_chan_id(&chan->vc.chan, i);
 
 		dw_edma_core_ch_config(chan);
 	}
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index fe33a20abc61..f669b79d7731 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -369,6 +369,26 @@ struct dma_chan {
 	void *private;
 };
 
+#define DMA_CHAN_ID_STATIC	BIT(30)
+
+/**
+ * dmaengine_set_static_chan_id - request an exact DMA engine channel ID
+ * @chan: DMA channel
+ * @id: channel ID, unique within the DMA device
+ *
+ * Drivers may call this after initializing @chan and before registering its
+ * DMA device. The dmaengine core reserves @id from the device IDA instead of
+ * assigning the next available ID.
+ */
+static inline void dmaengine_set_static_chan_id(struct dma_chan *chan,
+						unsigned int id)
+{
+	if (WARN_ON_ONCE(id >= DMA_CHAN_ID_STATIC))
+		return;
+
+	chan->chan_id = DMA_CHAN_ID_STATIC | id;
+}
+
 /**
  * struct dma_chan_dev - relate sysfs device node to backing channel device
  * @chan: driver channel device
-- 
2.51.0

