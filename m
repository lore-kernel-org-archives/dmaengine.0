Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021086.outbound.protection.outlook.com [40.107.74.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA92537CD53;
	Fri, 17 Jul 2026 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311614; cv=fail; b=MPu3T8Xkou3qN2Ml+WjCiz1jY+BdvbemRrhyFm7hlCeLmPb4vRpvm95Pemi5O36JAZqi4a/APw5+Vr49Fb/sNPaRwOyRnQIpTFK7e3JtaEMYx+VprFNDstfk9A8WlDGhLPhrzba+fuAYpHmMYSAil8CVeOB1cPz05DQVBsoVetk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311614; c=relaxed/simple;
	bh=ISaZ1YlyDGMmBE5aL5MlrCcrm8kisLHa0z9LCvxP3AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YKWzT/hqwKhaS0/R+Z4I75f3qkIYgy4bGyK2QGwZbyO3VYKgz9azveI+hyPgi8KeShpvRr7ihLK88GI5CXuYb45emKeyVihofbHAZ05SagenN3OgUv1OUqTd8GBZINxjhxJeaVCe3gT8dcUyX5nFpOjdjdQpjq5VD5Iw3xVX++s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=p0fWv4SE; arc=fail smtp.client-ip=40.107.74.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="p0fWv4SE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnE+PCXtUNyaGfFsMQ9L0o91Td5tDx2Nnf2g2XNOJPbkz3Uv6znypTr02NonGr4A0c4wMlDzWn9DNRx2wHkGFxAqoIgpZnHdtID6L9iRmsuDYlkImq2nigeJ5CZUuxWIq1OrnLuwsDx4ABsFyJh35aOoFlM8XDS2t5ill5NYvS6A3tNPi6UJXkDOz8TPWNX2QfiEpeZAM4Zl43xhRmjJmIzLkZsHjJ1fDP3T7geJsmFCFUecqo+B7jaD+iTQ4N4zCy1E5jgWHIKDBA/jDyjHWzjSyR1Z26fPHu6OxsViFuNIhmzVTtph8kz0R/c2BPRGqgO3YDhYNMgfvU3pY/yuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=149KQP+MeV5QUVJpE2TbjMJCz36gYJXylNhmrv9gf9U=;
 b=IEgk+ogw7DnwARRZfqdMOU/lw50hztZWLKO4pQO9yQpcPmU4uYSufxgzBAHIxOsRNZzf1oVifV0yXjwT5yUXnUXF9KWD7cSl1ngRaJL44VRKDe1FuJajSFopEfY4MTYhFy3KLdf2uEA1HmDzflIrf/vBA//LBusLFRgpLdLzpYQM02keHc30+2xQ5OWjVMk/3sew00v+9knREP5Z+pUj37gNJXyGKZCVIJo3/26j8pH5iZyobJ4G15J0YUt7Mb80t26STu1TM+lFFK8E21DFNpb3lgXxe+3GU17bMI+9ssj6HRdbfAVNA/TTvQUGEm4dVm4iPdaF9EOwrUEYcLFsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=149KQP+MeV5QUVJpE2TbjMJCz36gYJXylNhmrv9gf9U=;
 b=p0fWv4SEQ4v4Kv3iGZ8Pyy1mRRS5k7/32SpSnqMftYhcUVlzBAOYg1r0xD2txIsBbqYDjdPNY9QcVMZPPo6fVhOx9+ZFHYKbhBiZQk/JucEhQHUiV+TPjYzBt9tkcy5p31V7EeEIN2ppnE/m/Iy2xLK7mYUOyjeHftSSmubTGqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:46 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:46 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/9] dmaengine: dw-edma: Serialize channel state checks
Date: Sat, 18 Jul 2026 03:06:35 +0900
Message-ID: <20260717180639.2643243-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f8a10b-3fc4-412a-3a3b-08dee42e2a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tLupVnZcHYjuab0mTcnP2xYumgsuUfgJS3iBQEE7fuldOVCY2bVQBFUTfEY8wMn36tdBKCKA/wEIICxnuWIESaYsSLbithCRDmqQ8PpOxk6rNN1UyFaUmHzxhaksLdf3T4zawQaTA9dIlQ+rseDNMllQQvFlvi/BFRdN2/9Em221cdseTfvypKKve2c+BMq7rVGRxqfiJttpN89yX5awi7TUkLuuhTj6n+0g8VvJ86GFzo/+o6PgLy828cFc91wxCoQO76CT26hOFxaLLCe0f5gwoEjrNGzKGCdtwxEtPXOQhIQXrALsbysw7R6UDFO2OSPXOKj3D9cJF5+bfuvJu33Zds1ExxQXZSQRpthT04EsLe+QMaiSLQcGaGp0r8UivCS3rrY47b6Y0bLx38hn/86yEvvMt/aes6wJihe9pyzc3CjqRPdX7Z8qocb48UYWdnkz5AwygZ1afWcnGj4vlcQQG73QZY5v05eX/Nwu3qIqWtvladxP1yfOZxLu/Sr2kP0tFMK1McqMmTrkck5umGTJqVoWmRBuUAtiKNXODx/Pd4yVfOYdr5havI3Z+kiTFkCAHjg6pPF7mtRtB1y8B3LxvMgGGp+NB94L9NLixlC1dmKeic24/3LmYHeisdbURsESqgfocDDdMcGUCR7+X0AjIUPI9+guJmJ9uWRnoj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zb6UY366f/TOw+THOOmKsYOk5wMPOyK4upobbQVkoW51SrHV0lzylH4MmsyS?=
 =?us-ascii?Q?2lsXbJNZyAqZ+3BMPaTPG99dhHaZel6asXA8hPu/I0lZvC7ug9ExX8jxrebw?=
 =?us-ascii?Q?cKlUYaet8INtF+ZKwbq459xkvo+2G1Aj6/ICLJ1pa+ZficsppN6I0syoAEJa?=
 =?us-ascii?Q?7EMydriIuMhAcfOxdZqwp3tkO8GOGR1yibHTlPHodfcnToIKeUJn2HZ7XCB+?=
 =?us-ascii?Q?jRiQyguI4LbVgmBZ4iH5tTwsoFoqc/swlvohgJXpahBPJX4wr3P+tglPRXMA?=
 =?us-ascii?Q?uv1dj4Ry5VTJZ96TyQ+8Vz9BbrhR7cBVO9OzRgoYNIT/IfZLjhIKd3Lqrrlt?=
 =?us-ascii?Q?8NpS5iRcIahiem7uHJy8CuynRfKSBzb5uiGEY2SPWdDteH5kTyfhxeMNEUh/?=
 =?us-ascii?Q?noiyxU9XvXsQ9mV+Uk6ydeh/voVb/A/yb8ibh2miJAkr1HoNnUsW8wK/oWDE?=
 =?us-ascii?Q?K7xMPQ6+tjBA2ASKnxWjOv0G1hm/A3/0gRgDLp2lVOCQAmwRGHnP93V3GKrT?=
 =?us-ascii?Q?dRfF0mqJXxxzSsZByiU17bRvtWGjVcesEqlb84mIx7stV+SG7RTyd2RiFW9v?=
 =?us-ascii?Q?mCg3zGDiHVU5Ia5cH/56klP6HA386sO0285PP1OnMk7/nlUdr9j4nblaYTul?=
 =?us-ascii?Q?zj39QbTA4m4adEWQ8bZuTo2o/tVpcEtfx1NhF9PSI2Q/XtH4PXk441DK2Wrp?=
 =?us-ascii?Q?q7pveSLID6haez7CIiPtWxYvof+DGYzSpSMZwZ7YeE6qB2FMcKzn3dO5o7Hu?=
 =?us-ascii?Q?AlaPudV21fe3Job7rGOVDS32EgDth+Nwc92mn1BaeznIWSdeHdalYRZ1ZEy+?=
 =?us-ascii?Q?55Zdfr74YAlNGogerxZJtdI+A5guYGM3NG5p61y5ECERSoc2+9L5Z85Pvtwn?=
 =?us-ascii?Q?1uMDKQ+TXqrzZcAfHFpmjPlrJX0ZswHO6135lfFbFyKyJHJeXcZASD4zHMHQ?=
 =?us-ascii?Q?c/q3tH6dPflELXXkljP7i2/8jvTTqVubBzql7D9z6ciZ05eZbXargSOy0f/Y?=
 =?us-ascii?Q?PNA73EcBjT2RYZJKg/tOtLg44cfTX+3z5NC+YTNiCqRpFiWNwRmX/ht8LObo?=
 =?us-ascii?Q?1mqt4z6m2RXyDUZsbH+X3k85lDLsGY08MI8JgdFDWha5mKJI4ToNZphZIrad?=
 =?us-ascii?Q?HmO5RW71nBBzLndKwbUQ7GHzv/jDrBx3TDJgoUH4oqiEwtAZYbHGZR+rpr4e?=
 =?us-ascii?Q?BzI0ORg6kDj1O/8SpHhCleTHi8S4fSYPbQ3kF308FPzh/xn5NDsgPK1D95cE?=
 =?us-ascii?Q?8u96s+R4gGQREbnNhdgFSKTzjRj5eon0vYRU68uQE+Z/zDcWzlShVwB66ydq?=
 =?us-ascii?Q?9bmw+//wqqR9wXxFQfurY7WVbmDvPqHP1et5P2hirGOkFwVcD8kMzSiectoc?=
 =?us-ascii?Q?djc7tTLsTkWgT67axrW3XaNSC9LdZwCBDyl2zUu4m/rI/GMt84LwmCjJCNsl?=
 =?us-ascii?Q?jn0RoB9Pxoen6BmJ0KmdGfkExHEb89oLjBtHmwpKMNv0w94JzQMAGqubqZZl?=
 =?us-ascii?Q?kcaWXyeeytrlNG/w38rLCX+adsVBUuZsfIvR2mEoCOXLMwa21EUQigopUdP2?=
 =?us-ascii?Q?sO4/yHrE08z91FxSAkhJpIL+0amazRvdVWa+jbSTAG40uXAmxqzXKX9ehYT2?=
 =?us-ascii?Q?9XxeMOOmVs5GBKNoviQ+BOw6zzTC3ljMKLWAZyVNvzJbHMtqnwZlvjAm9cTK?=
 =?us-ascii?Q?3m+enslUWjbx+DRJnvcftP7RploNL3fyyDwa62Vq8UIQf/EjaLaBNZHGroIc?=
 =?us-ascii?Q?nlNmoAG3JPPsTnZDLMdcZ4ri9VAf2bHWxesVDgOpoyYI/M4+h5Bx?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f8a10b-3fc4-412a-3a3b-08dee42e2a71
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:46.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNYeb0CDfGCSutJtcvz6y1DIe7SDd9dNu5xBdDz1FMIn7Cxd5gq1jfaxwPFfRZJ1Kb6Xcykb6TTejkXgzDszAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

pause() and resume() read and update channel state without holding vc.lock,
while the interrupt handlers update the same state under it. Take the same
lock around those state checks so that request, status, and configured stay
consistent.

For example, pause() can observe EDMA_ST_BUSY right before the interrupt
handler completes the final descriptor and moves the channel to
EDMA_ST_IDLE, and then record EDMA_REQ_PAUSE on an already idle channel. No
further interrupt will acknowledge the request, and since issue_pending()
requires EDMA_REQ_NONE, the channel is wedged for good: terminate_all()
leaves the stale request behind, so even reconfiguring the channel does not
recover it.

issue_pending() already runs under vc.lock, but it tests configured before
taking it. Move that test under the lock as well, so configured, request,
and status are evaluated as one channel-state snapshot.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 7a567f924538..cd10f9c6d217 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -230,6 +230,8 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	int err = 0;
 
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
 	if (!chan->configured)
 		err = -EPERM;
 	else if (chan->status != EDMA_ST_BUSY)
@@ -247,6 +249,8 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	int err = 0;
 
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
 	if (!chan->configured) {
 		err = -EPERM;
 	} else if (chan->status != EDMA_ST_PAUSE) {
@@ -297,11 +301,9 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	unsigned long flags;
 
-	if (!chan->configured)
-		return;
-
 	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (vchan_issue_pending(&chan->vc) && chan->request == EDMA_REQ_NONE &&
+	if (chan->configured && vchan_issue_pending(&chan->vc) &&
+	    chan->request == EDMA_REQ_NONE &&
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
-- 
2.51.0

