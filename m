Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9D409E16;
	Thu, 23 Jul 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796128; cv=fail; b=ScrQiBrlArQKsFdX3ZA+S+ar5WNdTU580v4vT9ZjrqxhjlzfzLkAeo4/o2Dk5FYd20j4kj7WXFlEopeQVjG3ZI7exYnicbNl1WOJWSddQoobo3SBmQ0gSEiC/LgQzfYjHpX+Yd9Y+8/JhXHNpk0nVy+QtksrGK2uJaTsHKfuoTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796128; c=relaxed/simple;
	bh=1cI0OI9ubG/2btjKT336977wCsnyQV8YNg33EVdi7ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PV0dPvFtjdw9zq2S4jnVnqCPF4DrFOU8Gm7uqbjAU6RzS4QPT+EVm+Y+zku7g3i8HJ4LwALLGn6/nO1Riq47leF6J/DtEJ3rsIdrh7sehepdNieZ6eahTyMMJW+7Qc3b7BPgGRjsvHfdT6fFiVZavv3mrsBCbMUvdPWIEhNPtEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=dku05PCq; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="dku05PCq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+GMNShetdT96avAV5egl/o6KGobo0lFAwUxuLzhISO1cTYruXVU6jsnEoCva5pwstftzP1epyXB055+Drbg3QSEVwT88vjLmHZ5Q8Obw5qCyTd58g7MiRs2uaEevacFEfcIOzWZtWgbMBFfp30ZR+/6NbIIUOLaC/EasUSObrnrA8d7spiIlCgXJ+94dAT+f8tao4xVLd+05r1HXgXnwLC0kR63Fen2c7GdkC1s8GSAHmmTlTG2s9x3nLvqlPTolp8FtvzzNOINmmpUg+AtcCHndJPqp4s3otuh2/0SYzY2FnfpZbtaY+zv/Im7dsIF7dxVzS7UqgQ+2wir1yDvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGi0iz939jGWbiSA+9tsjrqSSGHoFQmcsIHNy+HByww=;
 b=XPGsT9VVEaVZi9LKc5CSfSOIgRoh4/42GlR5GTSdd/JfWNG7DkcvVld2AnUkpP89lCImVuXAf3qWLGzF8kwNpJ8nCXyyFCw09tj3Iz11WAbshoBzy+D+ZcfC9cFLTwIWl0YdRBJgzz/4Xfuvqd4rKXLSPM4oF6N64GQwCeJ8377FmFD5GhcfwZbhpSp4nv29Zd1ILkksL0a5hK1jMbJxnY9XDaBcAhz26FO1MTe9hxbFALuCPBV6egxkB6RaeqkT2DYI9Fr8SrCoToBQlSWaCdgaY6PdMb2pvsG6dmFVliIRapM20vNJNC7phRKvCiSkadEQVbkGp+3810wI01XT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGi0iz939jGWbiSA+9tsjrqSSGHoFQmcsIHNy+HByww=;
 b=dku05PCq1s0GvqlqYm3WOmDx7d/qt9Ktsewom+bYt/SPAMeCauVG5HsdEd9Z+GMQw/hHA7fF3zW+camzIphwy5dpx1m9s7LiEAksS7QDCJnwyZaY3DvocTfwJ2WB0PJTzbEVVQOjOl9uFUO+Akq1tHixMe5DC4gG9bWbFyn3u1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:41:59 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:41:59 +0000
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
Subject: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work as a circular buffer
Date: Thu, 23 Jul 2026 17:41:35 +0900
Message-ID: <20260723084150.521366-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: e49f65ae-04a9-4ff7-e7c1-08dee8964295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uIw89wK4efsyMkOw70ONzNPjk/ap7nlEUbPrTlnJuQ9WSc7hxl7FJiorFFIJGeFqETV4uUzUOWW1mqiY5qFflxX6+qQgLTE/tssiH0NzH/0XELcblRQt0kVkkfLkG1Gv/wEeiDGIYk6EzP/VrZ94MSqp0WU3X5xU1tHVWAOITWucy/g5nb2JmbS9EZW5QhJeR+voBO69Exb6HE8PuK5808uVPmPZ3NPZqJUGoMjlp3Z+Ga8J55mfCSWdTkA2C83U5mpfNhVVHXgZIdfhhJBFYPiIcr4FLwGHsSZLa3FxDyUFbGrCOdlGvjKEdK1+z1E7jSLJGqflgR2fXhEIYN0tQ3B9cunMvtzafugbv72XFJZ7SG0Vh74Dbeg2aODvXUQ2f4F+j6LGP5CL55dxcHk9MdbdcoUMKf8/raOqaXXywXLCWomY8FPLGsN7VxHntERt3vtu9LoH4RMLKWlHcVPr2BRp1d55/uT7YzNGEh0PdWp2EBdkfDqXE0VCi/HpZMWKUD9fG4EPtRdDpsFdmi1fTloefQy5YRwNiHvObr1+zWUAW6vYz+hDG93ju1EYgQ0nsPbax1zJIC6DbL99QGWfD/t6UKGL+8uOCckhJljikWX07V3aCNY1x4pJaRrEzFnkvzX9ttBf7DiG3G0SaAa7zV/ZqaULaQ+6aXB1OVORZug/yxwnykhy1Vbez9wolH0AOlK1Dkhri3HzmsNdKrXvjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ggwS+gs6sQnlQ/BFKaqjEXpohWLW74ACib2Mg0TTljZFZXVPoTXUhWuOigU?=
 =?us-ascii?Q?pglf1xm046ypzjkchKveAI5EiKeNr4dh9+K8aCLQE//aqcQR3zXqpMfKAasq?=
 =?us-ascii?Q?QQnefgpVzPRC2me3qB0oD0psU8S+eigcHYGyoOmuIugzsrkT4vBRZ+rlni05?=
 =?us-ascii?Q?CkHUJcoLj5aCsPqUZYi6q53ZH5QWoDgdqjbaXhZcoSFZULkIYkdcZ6uIKdTH?=
 =?us-ascii?Q?ZetdHlmMlh+hzZWFzsJptjd88CBDeWj54f4lOe/1yJO1XRbD1syCiVIcyMyZ?=
 =?us-ascii?Q?4JI3C1meJDkRV7bIu+1p7v4D565sme/6tIIebOjXhZuHIQbqsIcNwjiE5BEE?=
 =?us-ascii?Q?WHsdkWo3inY8TfIGpXmEmugVG38rjVfv60SjDxpreBLbfjBaM9sCnglBM3pZ?=
 =?us-ascii?Q?TZxW5Gbv4eqiyvVjXnvqqRAbuirLHpXe96gwRjqSLztM1kznIS0dHhyzgAYC?=
 =?us-ascii?Q?ohE+WBrLYpimKmqNjD7Ol8j/kLe8YoKOjdfktXfWzgMxflkc+WPLvHgm2jGa?=
 =?us-ascii?Q?AH7LMS2IzJEs6jhWlzemlzRSd7vA+dXgTsreb09qJaNO9XDmbwbp+DLDnmze?=
 =?us-ascii?Q?qmpEsJZ7PqLIKCctHFqn8I7AulgJL5ytZuIeOBgBNYm+VfmEFrToxwI9Na9u?=
 =?us-ascii?Q?W+taVf3BbQl/KtX5U+QVlNfzxVQjbrIpeQ1EMNjnBp7Wg4dxOIL68f9EWB9a?=
 =?us-ascii?Q?tYBCrTdTNvwDeep81rVfs3YTR5DgycJhy9wq48cKKqSAnhv29X/HT4oTW1dV?=
 =?us-ascii?Q?9etMfCCfBCa94EjkeTaFzgIlvb88yCc42iDxIY9MJYtObIWWGbsmppxOphXJ?=
 =?us-ascii?Q?JyEcwT6jE9QokTb3I0qXOKTI5BU1i9ckv3Id0iY9uyqlX3hH0vFcZ5SBKnui?=
 =?us-ascii?Q?NKBniyT3sNrKdIYhvQkBSXn8MuaJnRb5h+qhZDgrxljZf4K6jxjGfSiL/c1t?=
 =?us-ascii?Q?BD8oaf3budcaoVmRi1+8D53UAvIDs7kC9OaxX7qJlgTiVHnkA56TFcBqP+j6?=
 =?us-ascii?Q?qADAuYsPpSI0UsrSk84KT0x7eGx89nSe81LlD81pgU31pu+RX77W+vOtorG0?=
 =?us-ascii?Q?SCM2+xyY/4oNO4RWfDivisY57XHRR01taajpicm0Q018ukWDP8dSesVK8myc?=
 =?us-ascii?Q?YbKQWp7F3DGOnJno2nrXs/oETcp4Ez5o4PxbhY3coc7MKbQ2Rk5QuVp8raJp?=
 =?us-ascii?Q?YQsTeWcGDkhZ8hGw7WGTuTobmA6fm0FvePCOEMCDZZWeRJFOXr9bteA4WniY?=
 =?us-ascii?Q?9rl88X7T/orYULFzUj2K3de9IGtFu7kgZGdxPPqLi3902XjP2vrF9kiF/arX?=
 =?us-ascii?Q?eZj4op0a+0nsh8/KWmrcGeeJAfcijOwp4EOf1FMx++8iikCK69iLQkb2jAZ3?=
 =?us-ascii?Q?ImeeFVH8uTsRcrr/lNkgH5MYqz5fZvPnxD5iMqdUHQyCTKAKPpy6uweEOhnv?=
 =?us-ascii?Q?+HItTT188423twQomOH7k1YziJDORq2LtjBDKolHrFV/2QSdPq97BhL7rglI?=
 =?us-ascii?Q?SLl1JFk/Eof0NnjBOmB8hu/hpYn89Xo7FlxXUDaA9nsv1Hs3XCa0/m3h4MLD?=
 =?us-ascii?Q?3xazvetIrdlOkJ59oTZDwjySNBCFyXtzwSvlBY0XrkRRg8sqWmpw05uZX00M?=
 =?us-ascii?Q?qEslEiBz1DRmvNygrlcGFn9qQZoH3lGGMzQAF1yj2zPvLQr1fRte8/O7Yk18?=
 =?us-ascii?Q?YiZD6Q0PlBJt2zXZkAXm49kiHV6Nl9xXkbgQxEguboVsFTyVX0QkheozB/7A?=
 =?us-ascii?Q?201rwkTvzaVoWgPhVeT4tEyXk42xd+27E9zgDUHkeuok30wvqnbK?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e49f65ae-04a9-4ff7-e7c1-08dee8964295
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:41:59.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbfwsXY1n49QX44jtgd20GZjGyxCfvgwPf/DGI0nLlHQeJTQ1vdCaalXe47R/4vWYOw2bVTL/9gu0/73dpYvmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

From: Frank Li <Frank.Li@nxp.com>

The driver currently rebuilds the whole linked list for every transfer.

Use it as a circular ring instead. Append entries at ll_head with the
current cycle bit, and reserve the final entry for the link back to the
start.

Clear control words before first use so stale cycle bits cannot become
valid entries. Reject rings without usable data slots and, until reclaim
support lands, descriptors that exceed the usable ring capacity.

This prepares the driver for appending requests while the engine runs.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Track first use in software instead of inferring it from DMA_LLP.
  - Clear stale entries and validate the LL layout; leave non-LL
    configurations unchanged.
  - Reject oversized descriptors until reclaim support lands.

 drivers/dma/dw-edma/dw-edma-core.c | 86 ++++++++++++++++++++++++------
 drivers/dma/dw-edma/dw-edma-core.h | 26 ++++++++-
 2 files changed, 94 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 6a25a050b89c..a9f25a65294e 100644
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
@@ -67,30 +73,65 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
+{
+	u32 i;
+
+	chan->ll_head = 0;
+	chan->ll_end = 0;
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
+static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
+{
+	/* Keep one data entry free so equal indices mean an empty ring. */
+	return (chan->ll_end + chan->ll_max - 1 - chan->ll_head) %
+		chan->ll_max;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
 	size_t i;
-	bool first = !desc->start_burst;
+	u32 free;
 
-	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
-		u32 idx = i + desc->start_burst;
+	for (i = desc->start_burst; i < desc->nburst; i++) {
+		free = dw_edma_core_get_free_num(chan);
 
-		if (i == chan->ll_max)
+		if (!free)
 			break;
 
-		dw_edma_core_ll_data(chan, &desc->burst[idx],
-				     i, desc->cb,
-				     idx == desc->nburst - 1 || i == chan->ll_max - 1);
-	}
+		/*
+		 * Refresh the link element before filling the last data slot so
+		 * the next lap has the updated CB value.
+		 */
+		if (chan->ll_head == chan->ll_max - 1)
+			dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
+					     chan->ll_region.paddr);
 
-	desc->done_burst = desc->start_burst;
-	desc->start_burst += i;
+		dw_edma_core_ll_data(chan, &desc->burst[i],
+				     chan->ll_head, chan->cb,
+				     i == desc->nburst - 1 || free == 1);
 
-	dw_edma_core_ll_link(chan, i, desc->cb, chan->ll_region.paddr);
+		chan->ll_head++;
 
-	if (first)
-		dw_edma_core_ch_enable(chan);
+		if (chan->ll_head == chan->ll_max) {
+			chan->cb = !chan->cb;
+			chan->ll_head = 0;
+		}
+	}
+
+	desc->done_burst = desc->start_burst;
+	desc->start_burst = i;
 
 	dw_edma_core_ch_doorbell(chan);
 }
@@ -123,9 +164,10 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	dw_edma_core_start(desc);
+	if (!chan->non_ll && !chan->ll_valid)
+		dw_edma_core_reset_ll(chan);
 
-	desc->cb = !desc->cb;
+	dw_edma_core_start(desc);
 
 	return 1;
 }
@@ -645,6 +687,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 							    DMA_TRANS_NOERROR);
 				list_del(&vd->node);
 				vchan_cookie_complete(vd);
+				if (!chan->non_ll)
+					chan->ll_end = chan->ll_head;
 			}
 
 			if (chan->request == EDMA_REQ_PAUSE) {
@@ -871,6 +915,9 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	if (chan->status != EDMA_ST_IDLE)
 		return -EBUSY;
 
+	/* The hardware context may have been invalidated while unowned. */
+	chan->ll_valid = false;
+
 	return 0;
 }
 
@@ -962,6 +1009,13 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
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
index 089f913fd247..f2c2d5af1fff 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -60,7 +60,6 @@ struct dw_edma_desc {
 
 	size_t				done_burst;
 	size_t				start_burst;
-	u8				cb;
 	size_t				nburst;
 	struct dw_edma_burst            burst[] __counted_by(nburst);
 };
@@ -72,8 +71,31 @@ struct dw_edma_chan {
 	enum dw_edma_dir		dir;
 	u8				func_no;
 
-	u32				ll_max;
+	/*
+	 * New LL entries are appended at ll_head. Entries between ll_end
+	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
+	 * owned by software.
+	 *
+	 *   software-owned      DMA-owned       software-owned
+	 * +---------------+-------------------+---------------+
+	 * ^               ^                   ^
+	 * 0             ll_end              ll_head
+	 *
+	 * The link entry points back to the region start. ll_head == ll_end
+	 * means all entries are software-owned and previous DMA work is
+	 * done.
+	 *
+	 * Software always keeps at least one free entry, so the ring is
+	 * never completely DMA-owned.
+	 */
+	u32				ll_head;
+	u32				ll_end;
+
+	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
+	bool				ll_valid;	/* LL context programmed */
+
+	bool				cb;
 
 	struct msi_msg			msi;
 
-- 
2.51.0

