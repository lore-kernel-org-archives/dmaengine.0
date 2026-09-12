Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021095.outbound.protection.outlook.com [40.107.74.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD434195A6;
	Sat, 12 Sep 2026 17:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234838; cv=fail; b=b+16aRXCpgldDdd5jJpD0o9OVaWYyIGyz7gcY8PWV9gg3ir2JHZbg31LN8neQqUWdBN4K/0Pd9HVkJGuec+e7YawRN9C9u4PTufr1mtdgYtF4mTOgKEsg8UBJz5poRObkEnYlwDNkQjVw2bPhVj5D23cycP9ypI4savwZGZN7jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234838; c=relaxed/simple;
	bh=uTVeKIYoGjol4SEGvMm1MFcuBwmq/3lyzYfU5bdO4Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BEfoEA0z7y8ESrTnQCpa/cPDxyQMiG2BDe5SKKU5wA2+fyxyJ3ZlUAKZNH1fT74z6bt/c5nR0oa25yahHheGxt46VgJw/VfgcAvQ8ptY+oJPtd3cUOP2PKnDQ/aTkHGwBV1MUVbZuLbFfZY2Wlzo/QsCY3aLwGgEiw2CCbQ4Z7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FLPqJaxt; arc=fail smtp.client-ip=40.107.74.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FLPqJaxt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=theC/xyguu6Yu4r16Ee/SA2bEc0eZau0uQtddfP2C1IirymG8mQb/Acx3HfFdKFVZIxIG/0pd578woSjnce0xMByeu1gtY8Xo5QrahaDZ5BUEzuoenniqcLh0Pcm79ugKfQzXxaMreXV55+Wx9xefXTSCzzfXUKkbDAsvakMkLABQsDHry+BavcYlxqhLAZUcqXI4GiFtUV7tBV+bhJiiDXxeBdxLRTMjhjwFYTG99YCcYl0sEvEB/QOZ37wigYZ9bbA8O/xCwSXRlVRamFtN2qZd3J4rDmsiadBT0lYchngsAoaDm82mi+t8rjtVnKu4Yu7VSpdoKQKPAs/SSRRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9USqAxcO4ZuRA7RKQiphGRoda3raUdq2NIHgHZleYLI=;
 b=dopRJzhjbUDrs9l8TvnwRLdcJv/R30w1i/5MNmEw70WlqJZJNxBFgH6ulcl9o9iC7qoKMjpcwRVXBh/R213rpGxrgSOtPJHvDe2+pxPxymgp5NwNYzkyz/YTG8/SwxgxSjide1k3XC7XCyee8+hiS4kF6Yb9/29qsOMjiRT9udnkEVDpOGZYSyOPEowkhOWMjkHrTWRQp+dWbd9QzWM3x7GSICtecISEv6G7STDKeXA8oEoW9PV1pqoyvjYf7XJ21swH3ZV7l9i2sZ7FqO0dUt/16LUxr81pIoxMGd3s49Y2YI+K85M99zrXLoYOzkj1ZeeXCIZ/W6kcikeb2ilWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9USqAxcO4ZuRA7RKQiphGRoda3raUdq2NIHgHZleYLI=;
 b=FLPqJaxte8g9uhm7qwg0OvMHmNle1rvuaQO+eO27sTAM3xIbQJHdqvo9hX6ucLfRCkrYWn0JILjJqfzecc9eEdawhYOVs770N3pX76JJIM7FfXiCQhHW+KS8aTF7lLlMsAau/Jd5rSzX9w0pXK0TNFfoGiiZoyerRuxFWREk4BM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSCP286MB5822.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 17:40:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 17:40:29 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dmaengine: Allow drivers to assign static channel IDs
Date: Sun, 13 Sep 2026 02:40:21 +0900
Message-ID: <20260912174023.1227397-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260912174023.1227397-1-den@valinux.co.jp>
References: <20260912174023.1227397-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSCP286MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 39eccfee-f4b4-436b-54c7-08df10f4efcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zAZUHKcw5Vz++jvvazqeogjbQ1Wd5ngCRyQ0g15noYbNyjq+i9ccygNlxyUPAwNVB/zocNhzFHMtbd9X1mfcl0fSGaR6WG236vSRMQc8P9jcV1i6ruvOq0qTImC4/a+LMxB7X+fhB+ABsRxBh20M+EmQNSLXzZsKwv9UbTWeQ28dmLvAwCxtGtY1awKfA/7Fv02Ye9U/pLw9XZy5Ewq/KO136w3LgA7abL2kkNU1DILQPDuS5DcqN5trOyh1q71bPEEaCRuNMCM3xvGp9rU06LxP9apeo8qATqQBrfTBTADgkToj3PUCD5BQJlRuTQRvAVQN5le52foakbYhEGop5VAtQyjqidftf0tq8IgTJt6YH6pn9zQ3X3pW3/sBkzZagP7dStcY8Wbmb3R5gRSfT9SshY5rqaTi1x3GJT6yDrnBP2bkkpBuJ1ps1J5ewsBesrd/SwD72eZ+nFJJJ5l1rb8xBj3c6Mw3vQuRlbSbyvMBM54G+93HINsgorK3yt/Hbdvm7MX9p6QVOkKcWkzujBaUCxx7KYjUd/4febwXo6b3yw0FYvZaATcd9n2mA4ns/8EpKz0yoSkvXnL7jjkEPVT6FW6d5HEe0X8wIu1I9bldrTc7xfC+CIESXd15RkzrAP2biLrYmQ0VmV1fVxZUVCovkOGzvRRT1YQEYno1MCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AKnwBqZ7WNjeMJcVOOP/qD9FT1Cza4s5qcpGaPCnP4DPuulg72weQjHTUFWJ?=
 =?us-ascii?Q?4CeNRqutSB9oirZ4JOosEnUEoKs3gt2MwVcr+yiIa+GmcEgURumHEUfMc4Nu?=
 =?us-ascii?Q?jCbrD6TMxqjN5mIdyL2k38YQtdnMzzxugYUXk8Nlec9SUQBKdIsm8yci6fgD?=
 =?us-ascii?Q?wHgIepWCHdVci/KPeCtEmhzIQ3L6tzXsDLbqeXVDB3SwJ3Hj8c283YLSpGXF?=
 =?us-ascii?Q?nii6dXCODvlNumjjykRP7Tk0kyf2X08RkMuz7ewfrDt3mQLBV1Ia+klFRaSJ?=
 =?us-ascii?Q?YfV0ICtHB86WNtv9fjl3apnelyCxfzN5TrxZqgyamBHjm1l/IXybjRKzAWIu?=
 =?us-ascii?Q?iHXrAOaG2uz9QC1+qr4ALdOTQ5UU1E+hnEjJALEM8FB+/UeRwjabgItNeHZd?=
 =?us-ascii?Q?O45VobLVZy5Ts5fBi/AB1vFtXiiwzHEkXirHJE4nSOXj4wBgBMCwssjqnXO2?=
 =?us-ascii?Q?rmjhK3Lh7rMcg0/gurosLxNWCrSJ4wsRgLGfx91qQzBANDc593gZQwt/ek8z?=
 =?us-ascii?Q?QsbNugNQIJ72r5NRfwOaekPK1DOBkwMN2FJRAL43xQ4CtsXGdBmZjeD7w9Ls?=
 =?us-ascii?Q?bv0uAG3qhemivqRSw6PyUEvTWQtCuzaCXUGZ31bj4nGnD+JDTweIS7ggAHfv?=
 =?us-ascii?Q?0YF7bnyvtR78hnwL/1Ai9lfqdS640Vei3VbnPbsKZQ9kOqf8iZ5uIQgvIJoW?=
 =?us-ascii?Q?s5lNzUbgmxk4fu+cEIXUhd6ad5Elw9acrGXWw3csTlEr9ooDlAvbir7+iVca?=
 =?us-ascii?Q?Aj6hoBtwqx0twfdtb8mm4xISRgkaGJWfIm6hTeUs2mmMyS8a7MU4q9YhXZgq?=
 =?us-ascii?Q?wzG9g9sTzIf59hefp/FtKERXuO52kzfaqih7p44F/AIu7CKmPl0dv+EmvLSg?=
 =?us-ascii?Q?RE259wUfBO0bNTQO1PtCjbAfE9y74fgJ8jrqomo6p6ZmLpNmngC9RCdNaUGW?=
 =?us-ascii?Q?X2ZOQFS/us3wY88BGzihnUvHbAwvqioepiXgIoKa1FxrMrYw6K1VDM88nBZ4?=
 =?us-ascii?Q?aSQyuCu85Wo1MusYtAFiI7ylRCICOSL49l2yJ81v/qqguaI5U7x+Ff/tW31h?=
 =?us-ascii?Q?Sek7sRH05OJkMMebSYUw/Wp2Od7FbPv1N7vluSWtht6T2cb//2kKbQfpZTUi?=
 =?us-ascii?Q?k9Eakc8IVeOB2ZT6VzGkb4THcCcA2pG62RRxJeGFgTcscBR+Tm9tB1JvPcl4?=
 =?us-ascii?Q?1ddCDqHg5LbilKLx5nO4UjunmIws9d4Uz7O5GelYxvhmG9VxhWlWK07v52jJ?=
 =?us-ascii?Q?b0Y5tYgqoXrX/74dQT+O4a/ZlLElfAzI3TTy/2AfcB4DJv/EZdJiuiKZQeCP?=
 =?us-ascii?Q?IQI1DAuDkLsW1TyLHQoDjRCvwqBEcCF7a/NoMb6oUPXbZU/sfj7bLVWiwiiI?=
 =?us-ascii?Q?dLALMRmNikOihBY81Y2otjXXJYUApLt8SIdZV+uQaNZ+TjTYWDSO4cROGKdQ?=
 =?us-ascii?Q?uamOXkQwIZR4S2c5TCXHiG1uB8Wivifj5UODKvxCAiDwVj7qdrkEAPR8pH7l?=
 =?us-ascii?Q?kUIMdOc2j963QPmrBzslJyXYxLC+r6HG1zb5111idGMXQW4s3uXjDSitM2Yi?=
 =?us-ascii?Q?eldqLdmH+wz1Zub7hmsm9hdWlu4pkHair384a6MI3qS0wogdsR6PWE1Bed9P?=
 =?us-ascii?Q?m6tSJnYCOCBDL4KYZes9j41XMdJDg+MG/4g6dbp3rRhgoDQihqKwNwEvlz2G?=
 =?us-ascii?Q?EKJfFP0be/juwBlzQ2tN8coKfy1Ocz4/MNtfgzufbxUlCmpZt8FBNhybMVVI?=
 =?us-ascii?Q?YCWvCncMes1pjGL7MPYjV6PqREsY7mqnXQXzkexFISNUtLHbCQQP?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 39eccfee-f4b4-436b-54c7-08df10f4efcc
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 17:40:29.1616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrIbyAlG++zDzeCJZ8nSCrebORnTp7fH8ZHOkvb7dCrBST+npJDkDSWUlaM+DqIbynLIAk3CcgoP+As+GVsfuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5822

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
Changes in v4:
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

