Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020123.outbound.protection.outlook.com [52.101.229.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA537F731;
	Fri, 17 Jul 2026 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311614; cv=fail; b=A0NQbFOMOLlZEx5qFtM0JCiwuxagBaYYusnQAH2uslkh/yU6UIVErAqbnGe5l2a+K5sVBqXaz3fHGRMPDWrJEiNLhHZ2Oku7/HEqCOfknAk1GoQGTjVxLku700ZcaSXmjBrSI3KUf5ZmAvIFg0sPVgiIgF28yV2YgfQo/byWOPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311614; c=relaxed/simple;
	bh=baDa5HrNcSjo+UzAly/E6i1UzEVc8AJjchdrGnPv98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d7wAa6zUuB6U93mxBMyFQPYYOhv4vFz65703jrisgQIRSxcvh9QuUaLKE8FKpIusBwj4ZR6Zq898T09uQyPV0Ii1cnZYRostXvzxcTTOatF5Wo2SD1Y665VnXciJfFcAQrC2GRq7JUWc0dlrrrRBrdtW2vsGd2eLPS0N+gy9JTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=akcUH6jZ; arc=fail smtp.client-ip=52.101.229.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="akcUH6jZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8rFGRHOXFLJAlTpjPtVxJSBpN7sHpZHpoyjXohTkNrI95dCEoazGmipKfdkShCTieTzIA+Oop7zAE2eS6bvIhs2SgTU7Ig8Ma/OL7/3uJNPuTGHnT7Feb+QTrYsVI+kPK2lTIOXFU0Bl0dywCzHbdUMQhoHnZOggiyXVqe43fgn8LnTjxhEcW1kWVv08QiOk5vZEjKZUVlQKc57IC2xJyB2yTDiJNJU7ei0ljK3AeEYViqbgNgt5o66ludEnuImGuSH+0QSKC+WG+b4xw0+ADT3nuHs6UePcpbJGmbavYUiwKy+6/KXQjZkvNTTZBoH7azBb75+6Fx8FTcsemsDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSlFc0IZM28XC2QY0wN0xNqZ7t+pIYF9AvNlLY0tYkk=;
 b=gjv3I3in0RNb8fqRK9n3H94vtlNDI0eHY3bGsF8SH+VctbdBgo95jQFmD7/qJE18fGFdi4zcafDYwDkHsKU7qKnZY2Izo9GMAf5S5Lc4OHOixK1161mbRjsGCz4pKX0EAqak223zSbGFwv+VapmEX+q9Jux+zS+VSAOaFnvo9Kr/dz+44evbFQRuGIxkiM5qvnL6p2TVrE2MLDi3zQEr1SunjgzhxsMEA8YusfXrUwBXZOf//DcK+UzNgMmBe9WORMvJkx35xJvVqMrGVkoZZpj2WDOJWiviKRP3r+abpfuFlIbC4QBfyhbyUM9s/6AzryYqrA3hBovRwcUQRf7BOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSlFc0IZM28XC2QY0wN0xNqZ7t+pIYF9AvNlLY0tYkk=;
 b=akcUH6jZfEObKz5ye7EmXJoT6D91Qggxz9UOqhyEYoFrMRHoU8Bm/AL50WltOB3HcYZhfwv+VcmiZB4SPRIgHnfVyvEBzcCNwXhbe0CzmX9zfDQtx0IcCIMPTqAdq5wt1gBjZZ0KCCMA9PghcgX0sI2QUVEKXizenRJiYU6DgSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:45 +0000
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
Subject: [PATCH v5 4/9] dmaengine: dw-edma: Complete descriptors before pausing
Date: Sat, 18 Jul 2026 03:06:34 +0900
Message-ID: <20260717180639.2643243-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8f51d0-f1f1-4232-627d-08dee42e2a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xW7ebq1EUwBEhijGVmC8AIIlkCNJmEJiEuk3IxX5fvUqJxSaFdgLJggdS4UotAlXfPR2qwkt/IUd4/aCzVQLqMvyk81TnMKtQX7DwaGI5Xbf0H3PNSDnSOb/eBWl7vMEaqnOthojscfKjK8WPcDWz7kBp3uTLonmTvDrGa7kwh3x/QXEkjH059/X/7RR0G9OUoIk8ow0UQqaxSkIcwEQxAiKuvPQuFVOFb/mqQYZyyxq/YibuVD9Ryr6/AXjWgkC6uzxMjrdxFvQvRqyIQ+/yS64oVim02ynqUvtZH32DOi6hewf9iuUduTS1HPxOvwlehM/ahS7kEiNCekhtrea+/lGGTE4JGSMhdIkHE9R1W1TIiGwpqMkkiLuhQjgdqfPPyOE341+8DzWMgEAX2N2EzqvweScErRoICWZFyP6s/ZxNUpaKtBt+WMyXG5w5gkxAmdmNNUoQFzuEKZqMLnCMnBwqBdSbppMW6LkHIsjH92QcOkt/T7bIPeOn3Xev/7Z0/n6+VnLyZHKm5IwedCg1fxtXoPAVrCiIZUSFrnfbUvAZtUaF+zxmGaEZekI5KPm0oV3mDxUcTje0rhN7Y6TeFo6jT4c95aHDZDXuI/RRkgklfCrXGD+Von635T1SeS1LYh8AAvmxq5b36YupacgS7HEWLuWtqwiv/7OVOHlibo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rNIJMOhhxkjfzS4tJD8OGjJw/nik5Q/EmfUlTC9Ai5zqk1x0Fluo36FJMz4X?=
 =?us-ascii?Q?E13yX+/qjda+PXWmwZRALOa2R/uZVzNfgdvmL5pW+w2QuuCP1oTtsfZxtbfk?=
 =?us-ascii?Q?obx2rpuSES/NKttGmXRIjC2c51/8ojnMkXTGef6OQ6NCImWx7DbywY4VGW9H?=
 =?us-ascii?Q?fTC7y613k2OR6VoA7HBhYX3rOobYmy7FPU1DJhW+Mx+VmATv7r07TdOBht8K?=
 =?us-ascii?Q?WRE+npo3TzX1jvpDfcWwmZ7gN/RZ8r3SDIVQ51u2rAR+DXS+iTajuim1fKiB?=
 =?us-ascii?Q?P3IctZas+r78GZoJCYlDo4xDShr2FhuPwaTTusai2j9Oam6sAOU5aN7AZEoP?=
 =?us-ascii?Q?ZzPFxR4QHHkUXSV5SvoMeZoByr4eYitdEpFnRu0WeN7H54ccdiZvWO9m58iE?=
 =?us-ascii?Q?SRKNXU8oSClhdjJZTxXxHIXhQU0V7HFPlod7gIjy5XPyk11fDrfJJn0T9SwC?=
 =?us-ascii?Q?9SqgOAfnmjzYI1dW5Vn61Ur4WKGpuCk0GqWF6BYNni0uno4CILKr8dDkW9lA?=
 =?us-ascii?Q?RnbZXuKOd6Hk6/nSnHE14bloXRt6vpYs9zTTvbK7g3pH8V95vAyMAUnS+8Iv?=
 =?us-ascii?Q?87DA4TnO6w6CNdgGel16aqMmW5FJRZm8ljqCs46lTapjYv6l27gjusVZacbm?=
 =?us-ascii?Q?ex5CHcgwqSoBqyw/U3AcvcclJD4bGzMkqnQW9ftgSXzxUsoFLnx5o9tpZ6eD?=
 =?us-ascii?Q?twdJDZa/xjdyY2pCP98KBqBujLJIbtMBRhwvFTP54A5/33JDLiimwWQ1jaww?=
 =?us-ascii?Q?L8tKquwdW688EYvjuJJE2AlAYFEJHU51nt0JxoId19ScElHOjgKURlu093VH?=
 =?us-ascii?Q?SVY063rm/eMmXE7b3s9WvYsIbtCXi6j10La830c5GSZwVcaT50RsZArjmSbO?=
 =?us-ascii?Q?3FmXlXPSmS2B7YXzpapPi8SrlhYhg2JuRcXKksJwjFrU5b4HpW0bGqnpSY3n?=
 =?us-ascii?Q?HzdUQvD84gfS5EHEY8UFhnJMasdY14hgpLHiJE7ByK6h0BlazHZIRDoeAnJ4?=
 =?us-ascii?Q?eozVc1sOx1oybDXDHavS91NkxWvKFeJJYHiV0rGtGSJ3TNKPTcgnimsjoNJS?=
 =?us-ascii?Q?rxM064faS9KtKIGZBA24fpxAm7R59Bl2PKbDqKKMcLiNfARuDnJghq421X76?=
 =?us-ascii?Q?PGSdUGbRBaMfN2wQqWsvoGMcm8ZV/r94wzPS/IMegobfw874YMHZ0ahUB8dR?=
 =?us-ascii?Q?rXBds+y1vpv2211GCUbTg5slHzj5X+LgY31HhwSXnm69hKDzJY7i4/HpIY2v?=
 =?us-ascii?Q?N+JTmjTd4/R0mtJLUtSsJ2voEjcPDRPhibvAwq+wHS/1WGP/AM0FbGkOfZUv?=
 =?us-ascii?Q?jjHRkbLe3EyYjNdH7mZaECtwP/Qhcxkd7jriddWFiMq/PWMAoHv1icYNEYlv?=
 =?us-ascii?Q?vLHnyksgRiCh6wMWjXvJaSwS9uSQfVCM+VIMWAlvTt6mSaXRl+SC811iUbaf?=
 =?us-ascii?Q?w8Ew9p9P0MXrUbA0AxyHgAbFNL08A8rZBe9ZqL2UmnDa3LjFpPCUvhxSx4Gv?=
 =?us-ascii?Q?Py07x+VKp/OKAkkIE/ckPY7k1600IEH1hgw/mSvCa9OW8bj2TK26a4mSrAl2?=
 =?us-ascii?Q?8Vor7XdWjm6ta2S+9F+9XQ4UXU9SiPYRcSL/k3iiIsE6dgaihlOHaa2RtzG2?=
 =?us-ascii?Q?6HGRMycbJjpkNnLo5b59M36kR7bHTVIPLR9fJIymTAPYOjjTGN/sTZtx0U+D?=
 =?us-ascii?Q?6zy8so0lZxDD9L2ctOPZSjAapeNWxgKQKeDci/eyVm3iPV7cDAQTmUpuYZF0?=
 =?us-ascii?Q?Aeq/hfEnoyuQA37o4B4q9vKgyZMZcVUCa1KNyUtEPAau9vOu3lE+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8f51d0-f1f1-4232-627d-08dee42e2a02
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:45.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvEtTG5BW+X3Y/JP6WabY7SwwFoYkITnOcfWYD26cjKn+ah+1NKAS256h5zsc3DT2P8wafXif7ZHbGuxq+e+kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

If PAUSE is requested while the final burst of a descriptor is in
flight, the DONE interrupt takes the PAUSE path without checking whether
the descriptor has been depleted. The depleted descriptor remains on the
issued list and the channel enters EDMA_ST_PAUSE.

On resume, dw_edma_start_transfer() can select that depleted descriptor
again even though no burst remains, leaving the channel in an invalid
busy state.

Check for descriptor completion before acknowledging PAUSE. If there is
no work to start on resume, leave the channel idle. Also ignore DONE
interrupts while the channel is paused so a stale or repeated interrupt
cannot change its state or start queued work.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Updated the commit message for the flattened descriptor
    representation in dmaengine/next.

 drivers/dma/dw-edma/dw-edma-core.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index c0d9f7e373f3..7a567f924538 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -255,7 +255,8 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		err = -EPERM;
 	} else {
 		chan->status = EDMA_ST_BUSY;
-		dw_edma_start_transfer(chan);
+		if (!dw_edma_start_transfer(chan))
+			chan->status = EDMA_ST_IDLE;
 	}
 
 	return err;
@@ -601,10 +602,16 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	if (chan->status == EDMA_ST_PAUSE) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
+		return;
+	}
+
 	vd = vchan_next_desc(&chan->vc);
 	if (vd) {
 		switch (chan->request) {
 		case EDMA_REQ_NONE:
+		case EDMA_REQ_PAUSE:
 			desc = vd2dw_edma_desc(vd);
 			if (desc->start_burst >= desc->nburst) {
 				dw_hdma_set_callback_result(vd,
@@ -613,6 +620,12 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 				vchan_cookie_complete(vd);
 			}
 
+			if (chan->request == EDMA_REQ_PAUSE) {
+				chan->request = EDMA_REQ_NONE;
+				chan->status = EDMA_ST_PAUSE;
+				break;
+			}
+
 			/* Continue transferring if there are remaining chunks or issued requests.
 			 */
 			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
@@ -624,11 +637,6 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			chan->status = EDMA_ST_IDLE;
 			break;
 
-		case EDMA_REQ_PAUSE:
-			chan->request = EDMA_REQ_NONE;
-			chan->status = EDMA_ST_PAUSE;
-			break;
-
 		default:
 			break;
 		}
-- 
2.51.0

