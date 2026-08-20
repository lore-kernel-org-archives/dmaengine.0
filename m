Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EF1481FA8;
	Thu, 20 Aug 2026 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247294; cv=fail; b=tHSGU174sJewbXAit+8FK3XnWGYa8+MX2om/EFtI64XzITwwaY/ebRB/obTmO6T3O6s1j5KxpGN6X7XrNb8vO+8wwaRIEpwehtnA45rw7/b1pBIZqaGR75+309fFbg1zYcGmyPwBVvPa3WKpGfgxmg4Z6N2e79pe/Rst4cJooo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247294; c=relaxed/simple;
	bh=LmXkBzEplLc+P22F8dXmEeTv4mUl1MS5Ke6FGnIfgJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B2APIn2B43CxKDCG/LJywpA+kXXRQW75qF2IcnXnmWYWjn/Qk+6uUVuUtqtanWBOKg98MH1egk4/ghdisH4uIser6/IfdoEXjKCg37IiBe9SFfyXFfO50ecAbkoFLuJKUDOWDe3LinMoZdo5dU56Kt66PAOYuU/gTLpl/CIbAKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CdZITj/k; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CdZITj/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NA9gQ6oHY55kIGK1+EgHcwLsz1m5FBlTA6gs/3KBV/+IpBoXwLrSgsa4s5ThbdTXfuqfZjxviaxqaxHqYOewTVSbXjiQzRwkxSNsKih9gSfxTIlo848ab/UCspJ7i/LOi1TzgbLYx9YHbcvIFaLAfNoLx7Dpi/SiWstaQvkfDLGc+XZFbd5mhVxJfHp9iiEiu4tNvq/98HPDK6JCttZU0yxyQjoHjjnxIvO65wdycccOZnzbT7im6IyvkMdFTS3gi+DtG9zV71a0LkwsAKoYdIQ9cvCX1ZZhdWltLSCPNO/kb6I3dYL93YZ5OXTp3Enih/yZBPTpYqOtPE4eAzpa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3+o2NYurq3UqKalQnxyZdrxpr7OwWCKlVqJEsTuJP0=;
 b=q++IYByQwaEewAu7DEsy7Aiug05m1LTnPl7RV3RU8EyUknnCNsGWQzBYoEMgqfWqAIyVbHZMrcReSEuRPf/62P63ikGCI2byFkIsZeZuo2xhXvTZMvskYy92axiw27CIb3AWGWSp3x11SdML50TGJwB7dcTUAcTXRfyz4FPEvGINqZvEzOHytrXlzQs5aVea1nGwYxCbFWfy/iI7YY/I76OV8GsPca6hvS1guTirqEleR5uDPe1G0MKQONyxse3LiZqTAoCd2mb1UHd1u6CbEjmgDdn3/tWezxjtleMEOclWX6qy5aC61GB2RvOUQ3aSQ6cGPjTVbFtWZZPGl7DWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3+o2NYurq3UqKalQnxyZdrxpr7OwWCKlVqJEsTuJP0=;
 b=CdZITj/kSjrG6eqFdBK2LOv0WGCaw8hYUjSGIvUbAk+skkD0Q17ZGJl2+rrKob1U2FnoxIaJdDjY2WUHLce/1zVLHBRzIOfRAUz2VNYn6lYzueaZ0VugsfMcQFthlZhhSGZBzK/chPmvarN9d8/tF0RBgjB//P9VvlYnIMXAAEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:46 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:46 +0000
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
Subject: [PATCH v6 04/10] dmaengine: dw-edma: Make DMA link list work as a circular buffer
Date: Fri, 21 Aug 2026 02:34:33 +0900
Message-ID: <20260820173439.2004068-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6b76d3-9650-4b63-8eac-08defee15405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	o/BSkdD6JHhLL23hPctUvaAYdVOasUkKPbncfZdCFrwigTQqLnJc848x1x+OGWAd9ip7mgP50DtiK5EyJrBCMIuuYttXVLzxclMZzeGn9pC+rvvdZVgv2wJoG5x41lZRsao0LQjde9KkiOvfu3dnErqVrz9P2VzLU8QaiE/qf33vPeSy5OyMGOHSWU5h4CeTTanxrrWPUkD6JlNY1mK6Ygec4/754+jPYgGtkn94jHlepuFWHuOW6wXSeYY8cxJPvbt2taiaIsm8GTNJvQXNlMq2y0SxF7keX/jYX4hb3YybnMM8YWnsoTfpzuITPEoqzi+OGZ2QtVyYxMqAG47HzGP7MaU9J5EammkqfpD2kiFeRF/N07kkfocS86Zs2eXx7pLdO9UD8ePQGXtcSG41du7awsTOrFl1nffFpnyJe8s+53/K+4dm2XXucy9RVuHPsZYNyMxj+CJYcyjDHlN3h0ClJDGpndV4yS7aklLCiit8ISCuDziQqtKLzXqpcT3E6pGj2fzr2HomaRINeoL3f80fCBxwk0dFUrsEZK/vTzBmcIqWTdcDpFpQV4lI1QaVKxJSmUGIEfhBnKI+flRae/GJB7WqCTgy5Y/9ySGr59w245z1E51XmaSkdatjIvB8YUYN8Fgiw9lCtbH6e7+rDixBF8w0QvY8vg9XIVivSHSqk4mW6txNKvzishenkdRU3b5J6BhTLZ/Ah0XkhuFh+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F+hYqP1L22ewCOTiJQ9TiIBJFJpk32szfM9gcX8LT22TWZX9BIAmZ8knQpYt?=
 =?us-ascii?Q?ZRaTV+3mYh6tQLnsd9mFvLyo5zEYAw6QDo2eh2AHs0bIaUuVo8d1yvNO1gJR?=
 =?us-ascii?Q?Xr5LRjtRA6HkQ2WUucBi2RXtX2iNIo5JVEDoc/oZl8c0a62l1OtKVFxmBpxO?=
 =?us-ascii?Q?pOA6DE1zJE5WjI8UnSS0T/DLzO9ll5Y1sa2M1oDSCuEK4io8ObM3y8EJ8+q7?=
 =?us-ascii?Q?YzAWYHXofEqPnNvLRfRcTW2lcbhvW9Gv1e8Olw8y8xG6KSa/sQAuPTKtGLTk?=
 =?us-ascii?Q?L9+pa3890wJa9Mlwue9ZfLpIby4R48czPMeWZkFkIzkjHvs2R4tY4Gkzrhla?=
 =?us-ascii?Q?IZBNHPw+3XX4CX4s0oay7i0VDDUzVv41rvzIQeqotQhx5vGp5K3HB2jd2V2M?=
 =?us-ascii?Q?dDBygZ6LkMxz5EJddaaXus7B8ThdauqjurvuCn0ihzNNyOXbTfPNmHPQHwie?=
 =?us-ascii?Q?cXuLBlQNng+omk4Ron9lBCUS4C5groTk+o4KUNse4uHh3Phbx1rhy0PpCzxN?=
 =?us-ascii?Q?b4VCcL93RCKgCa7aOJ8IKmekEI5DGbWBZ/UJ0c1lf7x2GLCFwu4Cxp2OF66l?=
 =?us-ascii?Q?0VWOsTF+NTelz8d8TBJ+ai1SOsH6DPXxbi4xMBeiRM2tY66JT5vtNvTyyDCl?=
 =?us-ascii?Q?31dOtOeYqyc1JOByhBO07FlOvYSbT2lMPj5vKvydZAnfZmmTglvgHruoFowc?=
 =?us-ascii?Q?c87d/XJ08RexFT76wwH1P8itJo9riY4Liwb5tC3OwzBEmvoVHLpc6JywNUv5?=
 =?us-ascii?Q?jo2LNGFJOlK+4Yur/kDy5le9sM+7xJGZelzHtdQ4bzHWUNcI0AoWIi+skWCD?=
 =?us-ascii?Q?BzrohH88dFxmG51GrC7BsPZBWoegnSphXu4yb0TM8YUrSY9SEsYx6zRlKg9Q?=
 =?us-ascii?Q?YrUWzxSUCI1021kWgA6jdaBhaafS4BCkW+PQ0dR41YdTaYq+ljBCRmgzZGgc?=
 =?us-ascii?Q?Z079gZyX1AO3Yl0XELsvbxwT3AznSY0+DHCo2oGKR7kEL050+qRifx+S+TZY?=
 =?us-ascii?Q?VIBFU+B+eocD7z5metl0+QFenWjlDo3tKrnEK35ptL+sTpqn/m3/Io+oP1aF?=
 =?us-ascii?Q?LXFlP3ENwJbI+GCugtlSq5lEbjhpaQ5825m/xgubOK5flrEMev8ucRLY2qHh?=
 =?us-ascii?Q?YPDv5qRLXZkRJnzSsmzTFkwAZUj5KFOjB/d4ZR1m39AAVshQUKsXyVheJ7nW?=
 =?us-ascii?Q?GzlwG8KmazleD1ZuXmnJ0Rze3ZlxS3lJkJYtcTi9ebQlnwHUnGQSDUr0G/Qm?=
 =?us-ascii?Q?/+UI1hDHpKjOjXvVz66nD2WIGIqnvvtbVxEkvoGHaaJi5k1KmSjQ8Grk5HIQ?=
 =?us-ascii?Q?MMt4yOEieLYj58rnYH/10ml4GRcOW3IBuMYVV1OCU2NZup3Xs9Eqa9si1Cm0?=
 =?us-ascii?Q?D7/ScgoLro0GJyFoycSvwPBotECYrfTCIKWPsxQcoHO7GEsXzNp0lIVAcE6c?=
 =?us-ascii?Q?plYI3utvVLPXHPMw5lkK1ySJixZC7UJoAInTCJmAhV87QpVlYeqrcYQUTf/+?=
 =?us-ascii?Q?pApnr+rAxQTPylgtKo7Yr054FFg2Ebe0NkHxie6vz7xmwGLFW9t7LgHMwcSE?=
 =?us-ascii?Q?UsFbA52QvNxIWAYCF6j8HhzgAznNDo32TDvO/z0bzF+livUou6C1zg7oxcEj?=
 =?us-ascii?Q?ogsyZmbdwR/QJJmrAhAZ1QjHHE8XPLLqlxYp2pmy3QF+rshPLHWp/Rd8e1Pa?=
 =?us-ascii?Q?Th4WNEG9thNH40cRwL9k3woYXgPhCri+JMkCWFrJWeamdvPt+vzBWNtLzFKt?=
 =?us-ascii?Q?x0MJjnv/wFKkfFYiKeK8N01eAsERk+3UTa4ZRO4v0y6teMttUIsw?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6b76d3-9650-4b63-8eac-08defee15405
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:46.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbDfBmOGKZ5S5jval2GUJ/1xUZT4lU2K+MGmK8WSSmcPXgZqr7oa9E08jdzWTc8ozu1zWkQqv2E1Uekq0RLBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

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
 drivers/dma/dw-edma/dw-edma-core.c | 125 +++++++++++++++++++++++------
 drivers/dma/dw-edma/dw-edma-core.h |  27 ++++++-
 2 files changed, 125 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a6bb68ffdfe2..1af262b6e881 100644
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
@@ -872,6 +937,9 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	if (chan->status != EDMA_ST_IDLE)
 		return -EBUSY;
 
+	/* The hardware context may have been invalidated while unowned. */
+	chan->ll_valid = false;
+
 	return 0;
 }
 
@@ -963,6 +1031,13 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
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

