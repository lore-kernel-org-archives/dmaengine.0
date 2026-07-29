Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C504C6F09;
	Wed, 29 Jul 2026 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335453; cv=fail; b=GUjlyWwV+vYgNMBqe3zpCzTCzPXSUxZnU7tkuRcRn/dA+xatzhNx5Tc0pylI/vbA5jfa1HOa+oELsd4F87GZUe+O+e8hZ5DLv/oNKj3nACsi3/cLs3u+AATV3+2y+yvb0bMMR2BN9ieVNNW3mfFCXHWJAIfVn/VvKiIUNYvsW5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335453; c=relaxed/simple;
	bh=vCWyX8k+dyBWLSD7CNsgHWKR3ykFv6pT0Ipx9ZZR69M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPtoK2xqKxuIEbPhPZvVxf7aRdES75V4+UDq0aB/t2B7cKskV/3qGYJlmfMbtwE8BUyKVmkD3oYKYDiUKniMQAXsNHMfnKN95znt1/txgpsbg3xcMr86JyTu/mYX3QM0RpJoftBAUWtb+BlP8vdaCpFYv/Hhmm13SX/0Ctiamy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=bPGmr3fh; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="bPGmr3fh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtrlcPcYoU+NvHogn6KmxROhckW38RYM0B4oQz2F+pxh1rc9XzidkZ53TOSY0YCAXbmpgWTlh5cwLjzXOzwf3psd0/KHops8UlLh36WAHYqf1ee+JX6guNimAMmzjKU+cBh+bai7wtwWm3M0djb5VjuYOQH/TfNLKsELbNO/+TUsItvWYpxUQaY542c2DJhmwjqwEleNg/BXTYqZ6ou6mWdmqBEGwRU2WZOvso/mTJReU3v30nuwWbhKYWvqB5QLJbqNlDFTXeeMz2WMFdL240yEASc+/1GgWznKHJie5eoGw1POkmFlRabaEhE4k5QrjeNHA1saEeO8Fo44bS428g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rxWTXD8pM0PXuXoJpReVygqQ/iqcCNEH6H6hE4pwmk=;
 b=NwyslelGWSZyQkdsClDzn0X6pvo6lMVVe4WS08QVhv6dy6q1k9QhDVQI4fUyF2FzyFD6Id9/hglNmPagPGjNAh4vFyJoND69j3TbGxTyknvcJB7Aqj5jUkvH5LW/82/cX7F4oRZmB1pI/xh9KehavmWaFf0sjWx1+l1Wv//GFHjwTm6JbfFNb2kiOZA1XocphQuAyXEFLK17RJ7c0GEEDT7rc4YhMbEcqSddXFe15aZ1aevSWrzYkIHyKDkBnyjN+r1mXgmkHkfqK8+4vqVeXPUqqaYkJiPW2YugcS+6c/a3zp7fF0Pnetd/krVoCBEmsIfTfQSV9rZewWa+8ehT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rxWTXD8pM0PXuXoJpReVygqQ/iqcCNEH6H6hE4pwmk=;
 b=bPGmr3fhjPa5tUo6anv4pN6A5feeOsaiWn7NQG0dew+Slyd6XYT2DQXWJMTiDyNgI04xZyrtLV7uc2rlefmFes48QeUUoPJ8rplTbgx+3Q7z0CrH3ZoW3zxoSQvoXOIiF6BlPTEDM0WeuzFIl2+WH824/5cT7aG/jFGpdUyvHtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:44 +0000
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
Subject: [PATCH v4 04/24] dmaengine: dw-edma: Make DMA link list work as a circular buffer
Date: Wed, 29 Jul 2026 23:30:16 +0900
Message-ID: <20260729143036.3087722-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: c3319f25-f9bf-4482-a0cb-08deed7df983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5O+10D9LYnQ6vfj+/fA+wJxrTCdS0FxQDrazk5RlcU5PS/2IcelFFe0cyiEWHSiRs+LPCSx8llTyIJXB6+2alhXDO1XRR/KUQkhGtFTJbd/Y4XW2uL1ghaAb9XR+gsJBbPwYbk+/eSImlKJteAal9lRdaHKinSnNn9CbUi9c8X0dYXxHC6d+XXNyM/44JS60WRQPZUXU0UTWt3ueC46L2KTrM3vTVOJuW0pkSV61pJXZE8sjJKZN7aAhRAC+rNTNayeI1J7Dgn7a1gCKYGEfdp16+5Q0LN3uunSF6efSNhcnOGIU/SWaVVw3uujLvf/mb144waItdOUzRAzhYH3XxQyyH/1ZwcnIYfrHbHKfqQ8XsSbPIdUgie8iAFgSQmLoc311nfn2gCLiBNGfyewx7YoRJ6XTFMMRmUspgKvtP/uNHY93+cEkUyT6wm4me5xFxMw3+lwWmr6l0tuElamdPTAeBbn7WvtW8+WqAe18LHLKiSo5By1Ilwpx3T5YDgGy4pXN3iazA1wXvqvVZAcotXniIkpY0nmVEJ399IbJ1DwZcugTXWY6s3zvo/UzCuqpMElqZpJY9VTjpxzcFU1LJRIXCDifbfB4DlWk8uqD8pkDjCe4xYk/Q5l1bBQxrve6mXC6h41jJU3b8u+FJxayzfJjkcbTJTdOauMXpdYyfjKZZUKcAoVRG2y6zpZjHytbws1e8G+cX+CiNfuEDKNGCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YGlHSffTox/MfNs10kekY5x2qBcNPxLtAn9+gx1t7ilvOKww8GqYreMop8lE?=
 =?us-ascii?Q?OTHBjc7lcFIWTaGx7CKu3HSF4R89NZ6/J31n7ObwBMtvLqWBHYj980KC1z5J?=
 =?us-ascii?Q?MIo1GfGleRYjleg7geHf+q68ZUU5M4q+QbFboJTG6IljDTbOxm8KtnEfRhNZ?=
 =?us-ascii?Q?L2jy/B5xtiyEejGAfbFd+8TBPdSDuAr3Pj5C4LZVgewNdqmHgMHJ56VbLz8W?=
 =?us-ascii?Q?j4IpJCF6E4n+Q2k0HDkOsgrZ7gx7PBvVi900QkZ76ug0aHCcuESesb7W+diM?=
 =?us-ascii?Q?wYl5aLuXqtXZ9HIP9m1ww8gaWhaSu6WFDmxRC8GfcHvuiuKq30NQonmVTeKh?=
 =?us-ascii?Q?g0+SYxkbUy2Ei1BSpZPbLprbUe8Om4uQhT9tanJ0+vyuonCdO2+HpNNjYElN?=
 =?us-ascii?Q?Qj0ki60A7THqx2kSeuUwofXiJaQBCq7kjSfB8v4tGXIjWBKZIISmzGDZhJ3d?=
 =?us-ascii?Q?m5bI6lY5ox9JxEgUySCD5iM9Mawcf0yQRXyxCtvlyFKJIsh/XBOQI1oX7p4G?=
 =?us-ascii?Q?2vY6il+nd4i1IPovRy+O+ck0csdogmk9dpRP8GdZo/3A4+3Jk95EdYPyXam3?=
 =?us-ascii?Q?7zpc26/SERHQnLF0pLvMgt1RxGx0D8XNOj46yjp1eHF/tLyIKT5wb4fBV7Hq?=
 =?us-ascii?Q?gG4K5GEj4Kalrqa8YGHohMwE4mmM+qF5CxT61u05mRLedt6fSfLZyuJU7n6E?=
 =?us-ascii?Q?ZsYJVhpPckIZAFw2fdiC8DySURVXENJHL4nxZEfXqur499f6t0XJbQW1zj8X?=
 =?us-ascii?Q?lP+BCfrJhHG9/YOnYiI5KeLgjKsBYTDv5FpAQrNeaZ4q3JZMf7rxApKIDx4r?=
 =?us-ascii?Q?pkezJqX48jYX94kooxj1XzmghfrdNrtESPJ0tQzCOOYr4hy6+nTRW0KB6GNA?=
 =?us-ascii?Q?yQX7Crs5L7DudXke2HY2KE0nkStexDLQnUsKtEhRgvCrXVBOdd9IzV0xyDGN?=
 =?us-ascii?Q?GgxU9n7ZI6sRb65kBrFcDv4e0cPpWy9eQd/4LjazltoDx6UihSK0omDDXm8m?=
 =?us-ascii?Q?/dYfZevWUwLdmAETr8oSPni5rIV0rOPIBjnEe3viTWIt05Opw/Gcj1N2pduY?=
 =?us-ascii?Q?jN9T6LErfEg7YCCdUr8bSTdaZd9LHrH5IErlFUZmBifQVfLxqm5UKO/mt/2Z?=
 =?us-ascii?Q?JJbkvHphfmppRoxGFnSMEZzS380jl8fwZi3A44EuIakd+w0ZLUe8W1he/Swl?=
 =?us-ascii?Q?vAkC/2BWbEirAbU1GyVo1lwBFNKVQAeUHdq+9Inc6nhOLpMG95YAuwzSbvMF?=
 =?us-ascii?Q?c65gIOZ53yhBAI4pdTFhtxQ/n8lNgF8sbhojU2YcwDBJXUX85hkpc3+P+qAT?=
 =?us-ascii?Q?9wswua0UbEYp9aTLafnZDs8tPymoGLNoz+doOBR7gaZPbzqKgIMeYVJyE12e?=
 =?us-ascii?Q?rqKKbiuKfXYWQ/A8H1u862OUMydFSg2LtutAtaL/9DFiAti/7LtYo38a9Qkt?=
 =?us-ascii?Q?EPYrIO2yY1FC+Uhh34Yveeo6Jya1Q7EqF38+DVz2ydtnI0ts2W+ScF7z1aGZ?=
 =?us-ascii?Q?LZPi9H2SdqEbNvCRxsEnheOcIBlt/g8LyL7s5WPpbDypUZmg8FXvaeYVXJbY?=
 =?us-ascii?Q?dw7ghLnx87j44L+qRoXvWAeKlnhNmYh5IHb4sHpYQnaEeqkqLnAll5P5zmOJ?=
 =?us-ascii?Q?D9Vfuq6FYcYhKdRY8J9RtCfGQRsYDjmjGv3AgiEax02diVVB5WqKwULgGNvz?=
 =?us-ascii?Q?M3X7zDwtopb0vw4qh7oFhca0zh61GzUYDm//HnJj51dJno5cXAhFtrjypmCm?=
 =?us-ascii?Q?IJ/nLp0NWzHB/CsDmJ3UYAnjstF4LAHjclAKJIyH26bi82nM5iIW?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c3319f25-f9bf-4482-a0cb-08deed7df983
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:44.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JzsoAy5P5/CntJuL8I/i1e3doSWzg70BxMpuD/m/SM1Dv9+RVRvHNE6+0c9ur9FFp0qNNG1c8kbz5AmHjv7bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

From: Frank Li <Frank.Li@nxp.com>

The driver currently rebuilds the whole linked list for every transfer.

Use it as a circular ring instead. Append entries at ll_head with the
current cycle bit, and reserve the final entry for the link back to the
start.

Clear control words before first use so stale cycle bits cannot become
valid entries. Reject rings without usable data slots and, until reclaim
support lands, descriptors that exceed the usable ring capacity.

Termination and abort can discard descriptors while ll_done still trails
ll_head. Reset the ring after the channel has stopped so the next transfer
does not inherit occupied slots.

This prepares the driver for appending requests while the engine runs.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 125 +++++++++++++++++++++++------
 drivers/dma/dw-edma/dw-edma-core.h |  27 ++++++-
 2 files changed, 125 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 6a25a050b89c..d7a8a43b71d6 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
 {
 	struct dw_edma_desc *desc;
 
+	/*
+	 * For now, a descriptor that does not fit would stall the channel
+	 * forever: reject it up front.
+	 */
+	if (!chan->non_ll && nburst > chan->ll_max - 1)
+		return NULL;
+
 	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
 	if (unlikely(!desc))
 		return NULL;
 
 	desc->chan = chan;
 	desc->nburst = nburst;
-	desc->cb = true;
 
 	return desc;
 }
@@ -67,30 +73,75 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
+{
+	u32 i;
+
+	chan->ll_head = 0;
+	chan->ll_done = 0;
+	/* Drop stale CB bits before reusing the circular LL ring. */
+	for (i = 0; i < chan->ll_max; i++)
+		dw_edma_core_ll_clear(chan, i);
+	chan->cb = true;
+
+	dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
+			     chan->ll_region.paddr);
+
+	dw_edma_core_ch_enable(chan);
+	chan->ll_valid = true;
+}
+
+static u32 dw_edma_core_get_ll_dist(struct dw_edma_chan *chan, u32 from, u32 to)
+{
+	return (to + chan->ll_max - from) % chan->ll_max;
+}
+
+static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
+{
+	return dw_edma_core_get_ll_dist(chan, chan->ll_done, chan->ll_head);
+}
+
+static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
+{
+	/* Keep one data entry free so equal indices mean an empty ring. */
+	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
+}
+
+static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
+{
+	return chan->ll_head != chan->ll_done;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
 	size_t i;
-	bool first = !desc->start_burst;
+	u32 free;
+
+	free = dw_edma_core_get_free_num(chan);
+	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
+		/*
+		 * Refresh the link element before filling the last data slot so
+		 * the next lap has the updated CB value.
+		 */
+		if (chan->ll_head == chan->ll_max - 1)
+			dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
+					     chan->ll_region.paddr);
 
-	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
-		u32 idx = i + desc->start_burst;
+		dw_edma_core_ll_data(chan, &desc->burst[i],
+				     chan->ll_head, chan->cb,
+				     i == desc->nburst - 1 || free == 1);
 
-		if (i == chan->ll_max)
-			break;
+		chan->ll_head++;
 
-		dw_edma_core_ll_data(chan, &desc->burst[idx],
-				     i, desc->cb,
-				     idx == desc->nburst - 1 || i == chan->ll_max - 1);
+		if (chan->ll_head == chan->ll_max) {
+			chan->cb = !chan->cb;
+			chan->ll_head = 0;
+		}
 	}
 
 	desc->done_burst = desc->start_burst;
-	desc->start_burst += i;
-
-	dw_edma_core_ll_link(chan, i, desc->cb, chan->ll_region.paddr);
-
-	if (first)
-		dw_edma_core_ch_enable(chan);
+	desc->start_burst = i;
 
 	dw_edma_core_ch_doorbell(chan);
 }
@@ -123,9 +174,10 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	dw_edma_core_start(desc);
+	if (!chan->non_ll && !chan->ll_valid)
+		dw_edma_core_reset_ll(chan);
 
-	desc->cb = !desc->cb;
+	dw_edma_core_start(desc);
 
 	return 1;
 }
@@ -159,6 +211,19 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
 	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
 }
 
+/* Must be called with vc.lock held after the channel has stopped. */
+static void dw_edma_finish_termination(struct dw_edma_chan *chan)
+{
+	dw_edma_terminate_all_descs(chan);
+
+	/* Preserve a clean ring; resync only if entries remain published. */
+	if (!chan->non_ll && dw_edma_ll_pending(chan))
+		dw_edma_core_reset_ll(chan);
+
+	chan->request = EDMA_REQ_NONE;
+	chan->status = EDMA_ST_IDLE;
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -299,17 +364,15 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	if (!chan->configured) {
 		dw_edma_terminate_all_descs(chan);
 	} else if (chan->status == EDMA_ST_PAUSE) {
-		dw_edma_terminate_all_descs(chan);
-		chan->status = EDMA_ST_IDLE;
+		dw_edma_finish_termination(chan);
 	} else if (chan->status == EDMA_ST_IDLE) {
-		dw_edma_terminate_all_descs(chan);
+		dw_edma_finish_termination(chan);
 	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
 		/*
 		 * The channel is in a false BUSY state, probably didn't
 		 * receive or lost an interrupt
 		 */
-		dw_edma_terminate_all_descs(chan);
-		chan->status = EDMA_ST_IDLE;
+		dw_edma_finish_termination(chan);
 	} else if (chan->request > EDMA_REQ_PAUSE) {
 		err = -EPERM;
 	} else {
@@ -645,6 +708,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 							    DMA_TRANS_NOERROR);
 				list_del(&vd->node);
 				vchan_cookie_complete(vd);
+				if (!chan->non_ll)
+					chan->ll_done = chan->ll_head;
 			}
 
 			if (chan->request == EDMA_REQ_PAUSE) {
@@ -659,9 +724,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			break;
 
 		case EDMA_REQ_STOP:
-			dw_edma_terminate_all_descs(chan);
-			chan->request = EDMA_REQ_NONE;
-			chan->status = EDMA_ST_IDLE;
+			dw_edma_finish_termination(chan);
 			break;
 
 		default:
@@ -685,6 +748,8 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
 	}
+	if (!chan->non_ll)
+		dw_edma_core_reset_ll(chan);
 	chan->request = EDMA_REQ_NONE;
 	chan->status = EDMA_ST_IDLE;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
@@ -871,6 +936,9 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	if (chan->status != EDMA_ST_IDLE)
 		return -EBUSY;
 
+	/* The hardware context may have been invalidated while unowned. */
+	chan->ll_valid = false;
+
 	return 0;
 }
 
@@ -962,6 +1030,13 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		else
 			chan->ll_region = chip->ll_region_rd[chan->id];
 
+		if (!chip->cfg_non_ll && chan->ll_region.sz < 3 * EDMA_LL_SZ) {
+			dev_err(dev,
+				"channel %s[%u]: LL region has fewer than 2 data entries\n",
+				str_write_read(chan->dir == EDMA_DIR_WRITE),
+				chan->id);
+			return -EINVAL;
+		}
 		chan->ll_max = chan->ll_region.sz / EDMA_LL_SZ - 1;
 
 		dev_vdbg(dev, "L. List:\tChannel %s[%u] max_cnt=%u\n",
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 089f913fd247..761a5ab4bbb5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -60,7 +60,6 @@ struct dw_edma_desc {
 
 	size_t				done_burst;
 	size_t				start_burst;
-	u8				cb;
 	size_t				nburst;
 	struct dw_edma_burst            burst[] __counted_by(nburst);
 };
@@ -72,8 +71,32 @@ struct dw_edma_chan {
 	enum dw_edma_dir		dir;
 	u8				func_no;
 
-	u32				ll_max;
+	/*
+	 * New LL entries are appended at ll_head. Entries between ll_done
+	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
+	 * owned by software.
+	 *
+	 *   software-owned      DMA-owned       software-owned
+	 * +---------------+-------------------+---------------+
+	 * ^               ^                   ^
+	 * 0             ll_done             ll_head
+	 *
+	 * The link entry points back to the region start. ll_head == ll_done
+	 * means all entries are software-owned and previous DMA work is
+	 * done.
+	 *
+	 * Software always keeps at least one free entry, so the ring is
+	 * never completely DMA-owned. That keeps a hardware-reported physical
+	 * LL index unique within the current ll_done..ll_head producer window.
+	 */
+	u32				ll_head;
+	u32				ll_done;
+
+	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
+	bool				ll_valid;	/* LL context programmed */
+
+	bool				cb;
 
 	struct msi_msg			msi;
 
-- 
2.51.0

