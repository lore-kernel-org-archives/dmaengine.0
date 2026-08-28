Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020085.outbound.protection.outlook.com [52.101.228.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C1388E58;
	Fri, 28 Aug 2026 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934986; cv=fail; b=RyMkkiWQTCyn5MK6WCZnQv2y7u7mGzQk9MG7sB/jp4uHqw++e7WHdLYsYQZot/A8tNlPggNhDE3jVy5Mz3gLARG1ahP3RaYxI8NJD5sQpMCXgamJNp4GRHZdKfh7fYtaUJLLnAAyFTCWlMyikU2wful2NOEP6/TaObZNmrQ/L5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934986; c=relaxed/simple;
	bh=iLYNPMLXnDMasX21wSTHbE6aL0AaKNQB2SoiVuXajmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZhE4o1+0N8E6IzLaL1lO9YQlBrfEHxpijUY0syx+ddnCVTm/7VZmzA3ZKy7V4d5emRjOmtS20ewLRu8ipJWZYxkyL7Hz7o6cmedlD72LAxcJNg/E04a8iyvQezbdcd6K6YB3tP8E4vvw90ZCYo57x3N/PO1TyyO3YwzIgRNLILY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=je1YZFXD; arc=fail smtp.client-ip=52.101.228.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="je1YZFXD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFInmRrYKG5nnlwxW8q+Da2T02Z5cG1uPLnxjDchbbqQI60cydARDG5XoDKciHGHaPQZInIPEJgdLC6TQNK8pLMwuA0sWgU0tvpEEjpjHcxDfNk6kAKIfCSOgwahWS8nBv9BdLCXZg2GMqQnVIq/t5TKP/CpROLyqckpX/IZM8AREhfkkShDSBafJ0TEkTWuoIenWnvKqBeEHA6fdamFxxGNBpQFbozNaDWG2FhE1+D+NXpUsZUi8bQ92VvTs1ZmNIwvEHPvI+aEv9Xp9Kruga0+C1lx6wxiNp2j79Hcpu3J/MI+jriU5cxSwlL/Vd2j3JD12v8M6Mb0/d1ilO+qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa5Xk/Twd4BUh3v80A3uUAaDn1Vbhy0ZMXJDAxomOUY=;
 b=mAlbLxmMgdlmhZe4MJEbJsBfwXtIIXoO7qVMcudSFEkYkGV9ZxStf7bBjCpVd82E1HFfiWtmocP9XwtBh6QLaGfhpZlBDUPa/OwiwINV/Ik/5xfVLEwksEykhp07Exs/+HBumKwZjmxUPYigtvWPsfK2ZkKFoDSdqmdr454HrZCjIlCMrF+zYIYQpvtMOtXe/JHNNOAGWxVOC2H8kcCN3UV6g8aMEg3iL/1QGGBa1IvBMgIAUPz5JCiYQJRXy32L4qK8VHP0JZqp0F+qqxKLpjmiUZopQSHReq97FbOfQZZVDF5jt23pnSD/pe7r/JDmVo+h4l1L+Rysy7sJGKHpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa5Xk/Twd4BUh3v80A3uUAaDn1Vbhy0ZMXJDAxomOUY=;
 b=je1YZFXD9vuPvVjvPReAyvD0dTjhW9eroVA/YdouuPjGV4tr4PCjMqDdpr5a2WCJFruseKXcoUN2ZmVBfujUUfZCRp9YNUzHOISha3hbfcMS3rRLQcOOh3lqrVVQqvtO79rHIA70cyyZ3ucvb6dQ/3uP0FmJYIfJQrocxe/4qU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB7093.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:36:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 16:36:19 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dmaengine: Allow drivers to assign static channel IDs
Date: Sat, 29 Aug 2026 01:36:09 +0900
Message-ID: <20260828163611.2691264-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260828163611.2691264-1-den@valinux.co.jp>
References: <20260828163611.2691264-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 5576cb98-2468-4fa5-2cdc-08df05227cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	gxDuvnKPmk25qJrKOLh4COqIdxPMcXOCGzmN3dBheu3lxtL1p4m2Qq/KWLMw/wX0Vc0dSW2T6q5qGq1TK+veS0nw4dApGcP8QW3jZ8XSr5RxoIBNaNfJttUr/M0HMuWJSbOOtiQ6rAICthPExF0kITONiiOmUyfny7bInmIEC87CwCF/RIBLl7HYi5ddPP5vNqaAQa4OcQG82LXKkbjrZWZIxdy7KgqWWCpwCGVhrZsADaeCP3PrIrtbbA9+LeYra+gmVnWFCaPonPhDYJC3uepdsPCbdYnhgl4C141Pu1l6Bct4GI0uNTK/cQd4vRs2Ak1tj4Cn+4h3CqAD7Lvk30+OUJXFZxogIeyKUVdGL4FfOtWPNkroi6piHtPNpqwJlePKnV41vxX8UXG4nq8Bhr8M/9xA4IIi2jxA0tIQdbBQ28DGPRLAHZQb8OInTaf9SB2Sjcu1EyxX2ySFuCGPgKFswjZ96F+tphPLk/B8mWmwIAVX9I7R8/+2KRfuT/n3hhvsRUKGFu8f8TIObj0faPHQ4VqETbkFSFfWIjm06FiDJPq2DEIwD6AGEMXglsTu0LP00s+p3eMa0bUp/WSzkyX+S03vHqQpNuw61H9a7t6pMdpg4YIcthJBcqhSepEh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T21OCJ+EsjwO9oq/7pvxaDFuSbwJm4cq16dAUtSD5IJ9SJJhOMIDWu7Era6t?=
 =?us-ascii?Q?YNChz1UaMfmOaA+baGcwnw+rCNLkJN+Iruk3dBKuYixJopxODIjiU7nH4qaO?=
 =?us-ascii?Q?cHqBYE6UqRIkRaLvAU0ZNi08pXBpyy6xCl7Z4B3kBo1AoAaVv6ldjBVLnrQW?=
 =?us-ascii?Q?wdCou/tlbonmrWBHEixj9MWPKnlckJG58d7fcC/UOUSmR7Af+BPw7TvxWZrM?=
 =?us-ascii?Q?rujQaQJzHvj1thMm7xyKcgE7ITtIT8cb/rKAZ3nQt8HmJviMAz+r3hEK++a7?=
 =?us-ascii?Q?fXhs2ki4h79HBXScJs6BMe+ebkBAQBhiFdVGwey53Qawyv9QrDGyvZDD3lTO?=
 =?us-ascii?Q?r4Yws4QLEJ07GbkZuSmz7oVdH20CWT0laSXm+wgmGo5eVEYDYGWh7/Oxggl7?=
 =?us-ascii?Q?u93bi6aLMhp7OjKXzZvGmSqa0brobI3ETuBur3FuBqs6DMtjX2bbDT+Tl7+H?=
 =?us-ascii?Q?pbx2BTo1YXODolLLexHLUmIFYV8+H/02YehVF1qx1Q7zRkYyBpwjUbnn2IVL?=
 =?us-ascii?Q?II4yHFdAlkW1hjm/asptL5YBc8Rylkpy2qFTqNYRGVZ+uaWWqma9GAlRZim0?=
 =?us-ascii?Q?CokAj8B6ow9pJ9FX1aZ4tcAFiBxGTpXRhtyrDMhIQHoez/wn9nALxCVWLWp6?=
 =?us-ascii?Q?S4nFdfJePhLMA6hF1NA9KQ2hwfxudiqqxZwKobfb5GKCD80q5aMEuQWZDZye?=
 =?us-ascii?Q?xJN6rOwu0k//ShdQuPBWAYANU+OpANoEHuHA7yVlg4Wu0AVnZyz8zcGyUKC/?=
 =?us-ascii?Q?xKGPwVMPWPNz/5aLloAYuLF/QpouZn/9oDnv+gp82WUr8eLrqiv42PjoF4O+?=
 =?us-ascii?Q?IAjVxwkUhUMj9u7o5zzPhfN/jYEDB/7DkcH0aAGHT72GrkooysIRWN+k3bor?=
 =?us-ascii?Q?aY3Wa0AuvmYidtArJTIauheIrFTFCU9Uh1u2dLDZChGRp3+c24AmDYohdwnT?=
 =?us-ascii?Q?EPmTif6VmZI+HvDXgF25mVrMEvyXM/iMx0hnHAYm+ugTR0VTdHSvsFXhoNwM?=
 =?us-ascii?Q?5XwRzs9AUAj2/0FeYdLnBrcpWg2dYvYwOiuO0KTL72ZLbzM8grY9zRwyrY6Z?=
 =?us-ascii?Q?nwUr+pDaMbYV/ihfV9eoHXM69qu10/3wypZfyh8QyWpoy1yXI6M5MrqidDHx?=
 =?us-ascii?Q?o8/V02hgsR/0zk97X1hzJgiacfDIDr0PPn6wudTwKv1CfnIhztwegRPZfjK8?=
 =?us-ascii?Q?9NaP5HTz91pmZ6EzTM91bGW4uxCGy51fZYzrOkTH56J200AiMZbAoS1FbW8J?=
 =?us-ascii?Q?McnpvDe5yGf0A1iPuTGzL/6d22I3RgO6ZqAVGAP1RVGNbEcD9a2uufp2f4Qm?=
 =?us-ascii?Q?1F6RUIiB94iXzn03pxrdmWHmQmSVwnAG4g5SY5JMTvahCwPAhkoCoxFxTiTp?=
 =?us-ascii?Q?Dbxfc/dSuGTdP8YcQ/WzDzzfMIK12oNGU0jS/yPCCasQD4BLxd5aus59oDNc?=
 =?us-ascii?Q?VmRWo7FsAKfjLcsR9vHRJ7WB3KYNud92pUNoH01U5qmdN3QbtCCUpnGxIL7O?=
 =?us-ascii?Q?7+mxSaX0cnAFggSkbXP1iEFnW3mDbYAkS0EjXIgvvw3DJElA4/wPcTOOhrS4?=
 =?us-ascii?Q?nOtMQ/5vpLgAy1q36nhBe4MwdTzM3Fs0usmB927yLAKg5h/KUBTEcewa1FC4?=
 =?us-ascii?Q?FtiKaZd9p//z49nQTyrf0swNJ6BDATtRZy+0WckuX1x2HIvmwIzc5TnZ2H0M?=
 =?us-ascii?Q?+//+7DIpxP/m52owqaMghJPZtfcf3CLMHH0e7SZfABeiah6pUn9gczUywWW0?=
 =?us-ascii?Q?NIcndEt132SwikydWkd/73a2jT8gR6/vFb5G8lyusQdTvYhhLuvX?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5576cb98-2468-4fa5-2cdc-08df05227cf8
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 16:36:19.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Au5HEccM+P+x3i8dtBDwr5REdiFr/VKYixPcn+iQujytb78ZK6kZ7kASORO9bqNBY2jKOfPyssD3m9XOA5zGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7093

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
Changes in v2:
  - Carry over PCI DMA EPF v7 patch 1.
    https://lore.kernel.org/r/20260813063757.3131865-2-den@valinux.co.jp/
  - Add the idma32 example requested during v7 review. (Frank)
    https://lore.kernel.org/r/an4TXwT37vWYEzCn@SMW015318/

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

