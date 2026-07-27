Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021110.outbound.protection.outlook.com [40.107.74.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1DD433BCC;
	Mon, 27 Jul 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171830; cv=fail; b=FZxBIJzMs3vfxtmcWq7G7YzQ2WXEfsx8CZQuZFQ0CMqA5nBkn6egD7FxOH8r9TZ3CDchPzHA3cUedQ3tMaRHwArNVUhGD0BM7gR4ec5MbrvbBpydscSa7JX95sBzAHrABUrOpmPfzdrnUUCOMmYw1gnLarVkLc3bY1NrRBZBTF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171830; c=relaxed/simple;
	bh=Y+EvUSsUG02m5apWLrSNzSolIbZIpNsFqBlXBP8q0x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctFsyA+zvbiOxWQe9VmKhRhLIwDh760neXKvzxXyBEOeby1hOh80HSxVEm/YR7VERwa69iM2hj7fbohCQt+UfCxhDmymZ76WWjupz9QCscyahz2MxPLyVu3odGmoh5qbCeYDHirBhe8/pzL7GeCpYezyVudINSEUkOx232SzU04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vj3iOfxz; arc=fail smtp.client-ip=40.107.74.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vj3iOfxz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxIePm/nupMOFuORNeL1vIqbB6tIoUB4Agzh1XnCzn2gO57RwNVeVH+MvB42n4dzzv4P8sfmP0F1dRU0RISn2Ibpdq8QShWqvUY/KFMk0FieRAD77b+FVBq/x67RiGMMstvMoUIPum3ZhfnX9NuZPF0sWe887zYW2SOtD026JThuF14D+qYkU+rge5R34OlhQsXfUhLIaPJjcUbc+VdtjJrI9QR6QElVFphUEY0hH5ooC1INRPGsNJdrdUHcqEJnNLx741dVpU6QbhaqU3jBk67AtX6kVAzRGVHGauqbCt9Xhq7GQ148+ZFFxCgvYfqIRCzeByfDh+yiSYsVozmXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3v7odcUTAzDdPArX9kMqXTMYyh8MkGwazjLVNneEkU=;
 b=dbc4FHMfB9HZX35zxmiYmYYIkHl/nXdwJjp19qkeE/TMh0sNsRgt83MXVNo/f4AXJKw0xREGhGVQKcEDPNBUSJaSUylrUEfq0hTeff58yfbZQvoUv0u8kQkm0qvNK3ki41OxxPZ+RnQ4h4sA8wDLpik7dlUzOQuDCEXB5xvhPHlBGHmIQXV9CpRU9KZisbzfBD+S5OfK57QuaSwSpM3wYpk3fcXLcbK1FOoemP0ztkcYCc4cR57rcCBS45Z80kC1LvH89BB2iEf86oh5uaAZEs7TFGZ4JV7Ji0RZqxq1VOANDf0OEDZC6Z+HtADznkSy6ZcC8eVTSw9qSC1DJOzluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3v7odcUTAzDdPArX9kMqXTMYyh8MkGwazjLVNneEkU=;
 b=vj3iOfxzjeIl1M5TDe/RrCbjX0mDf4UYeE7NJRNB5u8NDU/AYzLI5Bbrm9pt39/xx/RmMjudQXHxYPwBXN08M6TVuGBBMWMcU/px/G3UVq8Ej+4pR8Iggc7FzKi91UWTVoKyicGT9RzVkQHWuojxogiy2X5FsN4DpDT88h3tg7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:45 +0000
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
Subject: [PATCH v3 17/24] dmaengine: dw-edma: Recover stopped channels from tx_status()
Date: Tue, 28 Jul 2026 02:03:16 +0900
Message-ID: <20260727170323.2321369-18-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: e4321d8b-8618-421a-ac0d-08deec0104d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XQp8YF2l4QyA5B4BbqOmMc5TI43f1kj9q8DHe+k8zBoZMy6U208TBBDgtsv62E0R2Cj/dl/CLQXrHTIQjb5dnQ8Whjv9m+/MCJgyxl7QpZvcwKTctohrfyRRlM9CFY8HBSl26Tb11Q6cm5BAYW/wVwnvF7h3KXTz+1Z68aoUeT1iRMrT9gQbuSH5O2r5/g8k2w1CYYFJpExuXKjatA58vjG3GSJGXgAkoFCY0ucQ23CTWfZHBklkySDBbVRWNTW46rqz+9B0giLKHeTG93OeqUAreaaoga618pJyLzHvxipT3FWjRbU63M87e/im1nNJdgi1xZsFe/iALPfc+abfVjPF7b5OA+W2yEpeIc7cTNUJCn4p00OSx4Ipoe/KyzJD2c4uPiDRdwkwAigrhBq9iI3Mb1gAySXz4EWuorOd09b1w/9wEFS311jNup8ZA8qWOP3pnDZcVFUQm43cve7XI4TduOMm6Hn8B1PnfI/IKQFhgIwkk2iM6MJdwUXQXpr4ITeW/vb4qBY+gKpZiaZZll3ttkCmcAYtCGOUCsCsdnfxnplx4fbIzME5F1NuSI0SXBvtZ6Xf7yISW0DttYLwPXIpdtPoQF99X9VRYUdJNIE507KriKn0HiXbYVnAfPhufsQwfG1GtXhKErqF4frxB122EHOfhMoGcsQxJ7M8/E3Pp6cD3AcLXzDGg+Gx/PRLkxTnLYY775UwWiX1cGniIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L5NzYgaej7quSLceb8WuTRkuri1UTeJqyStc9r2uqo8XqOaQ6/hLEWF+5QdV?=
 =?us-ascii?Q?cSLlP6soiaxfpl8McQLy02rzD71l6m2rIQMkQacIf3YxkWj31l81OF/1NSpa?=
 =?us-ascii?Q?ruTI5wOqmZ1eDCQ4vgXhO3k6Iy4A1w+2VGRU3zvXjCD3XWJo9XdQoIpuKEyB?=
 =?us-ascii?Q?FwBEJoCesLKy9Byv5jjfYi9kFcq0DutGaFFWfjTq1K2iP6bNXyNkPxoFv100?=
 =?us-ascii?Q?rBJA04G7LeorOPmNy6IS/rlWvCCqhMkgfcwQiXQmShf8h4ihQsKpXn2m8uF7?=
 =?us-ascii?Q?pmNU4sDec5Lla8Pm36usuIpBlThWxoT21Rc/0fe/njTtJhKKJDgCIP0bl+tz?=
 =?us-ascii?Q?G37G27VsLpIEtnpbLWV5ayU5Ky8grYIMXMX7aS59L79kQkqAcoM0K9CN0OPv?=
 =?us-ascii?Q?plMSBtDDz95x7j1kVJJAq8Nj3E9GT3voWACsl4NlXiTeXhqhFymCh/bnDFay?=
 =?us-ascii?Q?nbTp9WmsxXiV7nRilQ5I5Qphxy9exu111eimT0/bT2ORpS5gaR1DSQE+a7uZ?=
 =?us-ascii?Q?FCHVum/r2XzQ7zbmdVOR6jJCsPUZHDXxqTmd7QVn0bC+qziYzuIgIElT6DxX?=
 =?us-ascii?Q?LhrO9l4+IuY3n7k43xCa1QwcJerZlQmIQ4gWe00WIpoQPI1U77AXRExF6phV?=
 =?us-ascii?Q?U5qelrYs5GHjdkcIMvNiqj1MxC4x/1eGUhK4BEgAF8kLQnIRk966BPjQJ8is?=
 =?us-ascii?Q?8o/L/9u8JBKOmWP7JckeORzZXHsqJbtnWUGM9OS7rkghT6xfhqnIYoJZ2qOY?=
 =?us-ascii?Q?kbRCop7YZcJylGjCFDe0W56jy8A5k3MQUmAgxqckEXS2MhPkzcBlkARd1kmx?=
 =?us-ascii?Q?ZKUeoRD50lYB33xG9AbL3wfDRRJ6dWx0FkZjEQopJCE/+/9tuH2//ng319Wl?=
 =?us-ascii?Q?QlGBR3RUQscuhNuOEs07JY9OiqY+DSGG83fe/+kwX0R3VrH2TzzCtJW3q10I?=
 =?us-ascii?Q?WDS5F+I0kCsvS/82RpwbtOT/fGrlRIfvVW/Y8u0WF8GMC7+HiRUbkP5NSIQ5?=
 =?us-ascii?Q?ncOIEN3D/l/9F7s5JHcW4u6DjFC+pIbIenuYbm4c5RfwphaOilVIJ3/+49IC?=
 =?us-ascii?Q?OU9ZUwvv36JbTy0YUwS/e5AGIzApmFEAKQXWjwb/6WCIA1ZOGYQbt37uo+Gv?=
 =?us-ascii?Q?DV+STf6KmMOIL7znShtzqXDrVb7Zr6GQP04yITa+bIqYMY3QGS5J0jV41Zl3?=
 =?us-ascii?Q?F3z+FvOHU/AZuc3pTcfyDVSRsgDgM3UFhvG+4GUKxA7q+QdSJy7KaRiV20cJ?=
 =?us-ascii?Q?UM88+Igwi1l7VuHQjKvHCYJ+Cib5N6C4yN2JU7hYNypXkzAAQXgAky4rwvR7?=
 =?us-ascii?Q?6Z+CwYQpA0+wbg9g0+WaA1pvyPQOC55Mc4Vg0jMw3hypKKAlXf/KFIe6PB1j?=
 =?us-ascii?Q?lcGPnP9eLs28knBgBrKP1pVx4r7TStfRnNKH5BfbmTO38O2zokn9RVjtgXeM?=
 =?us-ascii?Q?+5YgyYRfD64aPjuN6XBXESIhOZuR6iF8g/AMISoHSzk2jKouFQfmTAJb8T7M?=
 =?us-ascii?Q?LA8o1uMXc+RhWerUSf44tIkeTBaiM5D1ctstxUqynJ1Tb1qmWW9pC2JJ7liK?=
 =?us-ascii?Q?L0iPowIY/QX/63R0FaTSouyRXIwO9znx6l9qglLyufrveVUTV4qzhr1VeEJS?=
 =?us-ascii?Q?pgUek3kNq1fwA5xxfnNE9R8zsOovCTt+V1UNu7Tx+wBztMq6wqRcYASCzQ4z?=
 =?us-ascii?Q?tbPvUz4Y0f3d6WBbD8NdopAYGhKrtARFaUZlJZpba41/aQ7ZOZSIzipRs9VU?=
 =?us-ascii?Q?UpgRVxgb3K0XKkyCPc1Z6F8Wsyk56D5yUbGXYK/Uy2GtGnaQlEW4?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e4321d8b-8618-421a-ac0d-08deec0104d1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:45.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMuGqgK/mWEAqZ81qdEZgDQsNXoaSjvkvJ2DRM7LdcC3GvfxOIyHUS2BKFOeVZXe1E7QPXo68w676PlnIUFMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

An LL channel can stop after an append without another interrupt. A
synchronous user may then time out with work still pending.

Let tx_status() consume IRQ-recorded progress under vc.lock. If the
channel is stopped with pending entries, reconcile a fresh LLP boundary
and re-kick it. If it still reports running, arm the bounded legacy-eDMA
tail recheck. Do not use a running LLP read as progress because it can
move ahead of payload completion.

Refill the ring after consuming progress and update BUSY or IDLE from
the remaining entries.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Use the serialized LL snapshot when tx_status() consumes progress.
    (Sashiko)
  - Arm the bounded stopped-tail recheck after consuming a snapshot.
    (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index dbccd11aa92f..fc8bea495aac 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -302,6 +302,14 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
 	return (chan->ll_head + 1) % DW_EDMA_LL_PROGRESS_INTERVAL == 0;
 }
 
+static bool dw_edma_ll_recoverable_pending(struct dw_edma_chan *chan,
+					   enum dma_status ch_status)
+{
+	return chan->request == EDMA_REQ_NONE &&
+	       chan->status != EDMA_ST_PAUSE &&
+	       dw_edma_ll_pending(chan) && ch_status == DMA_COMPLETE;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -919,6 +927,38 @@ dw_edma_device_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
 	if (ret == DMA_COMPLETE)
 		return ret;
 
+	if (!chan->non_ll) {
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			struct dw_edma_ll_snapshot snapshot;
+			enum dma_status ch_status;
+
+			ch_status = dw_edma_core_ch_status(chan);
+
+			/*
+			 * Do not treat raw DMA_LLP polling as normal progress here. Only
+			 * recycle progress recorded by the IRQ pass that consumed the
+			 * status event.
+			 */
+			if (chan->request == EDMA_REQ_NONE &&
+			    chan->status != EDMA_ST_PAUSE &&
+			    ch_status == DMA_COMPLETE &&
+			    dw_edma_ll_snapshot_take(chan, &snapshot) &&
+			    dw_edma_ll_consume_progress(chan, snapshot.idx)) {
+				dw_edma_start_transfer(chan);
+				chan->status = dw_edma_ll_pending(chan) ?
+					       EDMA_ST_BUSY : EDMA_ST_IDLE;
+			}
+
+			if (dw_edma_ll_recoverable_pending(chan, ch_status))
+				chan->status = EDMA_ST_BUSY;
+			dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
+		}
+
+		/* dw_edma_ll_clean_pending() may have completed this cookie. */
+		ret = dma_cookie_status(dchan, cookie, txstate);
+		if (ret == DMA_COMPLETE)
+			return ret;
+	}
 	if (ret == DMA_IN_PROGRESS && chan->status == EDMA_ST_PAUSE)
 		ret = DMA_PAUSED;
 
-- 
2.51.0

