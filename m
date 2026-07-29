Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB734DB548;
	Wed, 29 Jul 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335462; cv=fail; b=n7497RMi7nfZoFw1oA4sf5cr9P9jaJcC5ED64mDixS2UiWahtDM1hkGESFICqqZEbUqhq6fzbVwTy3yXZRw2jQs00+lXmEGbnF8tWn3yd+DTbDGVpayk8tzhpQrv87Urx2Ugx6e2N4gFwK8qEMB7lFqjS79bGLRdPw2dCjdu+ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335462; c=relaxed/simple;
	bh=jOMynub4UnOSDN/P4APRmN4nKH8Ax+kuv1GOXhYtn8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nllp9TktVVUnM6qapkBC3/9t8CDCTszNcozkLW3SUmFUBdacJPF8QGC3wj0d3EQIyXi0WzJVJ/JzoqcY7zwoj2i1PseXS601JktMvFqTup9+sAWXbAQ+Q7IQhQO5RtFGjy//JfGfRyxnbjlFxzX9qx66FFvbxJC0VSqs/Dj77Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=XrfqovoI; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="XrfqovoI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEHLQuUaUr50LFI4lGcXqjQYyhD3J/POnPAMaLPHXsneyyrnE8is3g4CpcWPDHwJQ+sIdd6k/LvjG92n6M59AaSH9piyp1/3QOMOUKl+csbxG4Q9M8bsE8CAqO2w7vSUKkinyq9QOd0q4cAD6WlSC+Qne6n+Dcn2x1zCT0XIg4EgAbXanqO+SWR18gcqoTykEXNEwL8ql1YoHytlRV47DTLYWSdQQa+vHfPs6xGRQv0AKKyFd0EwNIAxIYmvB/5HcyuS+CQAYM64YCzw6ZVU9HzLmsAdvxh3y50dcnEO2rMbwP2R0dQXxeK6FfRP+Xq5UE73AlYeuJ28ZC92rBoGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTEDo1zmpfnsnhheVZuVWOJAIDWUf51G0A7m2RZTS7Y=;
 b=Wtb9W6jPG7j9/TcwK0KWPqLf7nZlZEtjjAuaTPk6bSy+euxJUgFKzQeFUieVsqiWVf1lrRQ3pNQz8Q4lbNRq1vDbJKratyvIDnqpkjBs06/62JZ9Jg3zrad1MPR4ODmUdxDcwcqAFrg9XFyhigBQm1Ntep24TuLKVKiQI5cPMYZzIRyxXzvCbvSu1kiMInOf1HyU8UxgJMqFE5N7SQhiz62WAv4Ci1QRY9/4O5tPW+U1dR9T0Cwj/euHYZeoVNff8aykDbDciPaXGPjrkrPAD1biuE4xtXXMirNudwxS0w3+57Lmqfo5Pp2xpcrAmIc5hOZqTmkKz9SR8QBClVs75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTEDo1zmpfnsnhheVZuVWOJAIDWUf51G0A7m2RZTS7Y=;
 b=XrfqovoISl1zFGjPaOA4LYd4JV1PNO1SqMOwF8cMpIRpyi3Vg6VIMkemT9PHhR3alNTdXfRspwJhU60i1jpLGMaE0ez/o9DgCnYa4BBkr6co4FPAKnWT1WCLHzVv7XTw7NA2OabJicbbE6FAT4rTEnDYXUjdaRRRiLZL3vBqnsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:56 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:56 +0000
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
Subject: [PATCH v4 18/24] dmaengine: dw-edma: Make the LL ring reset a full channel resync
Date: Wed, 29 Jul 2026 23:30:30 +0900
Message-ID: <20260729143036.3087722-19-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbf2c62-fe68-46fd-83c0-08deed7e0052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eo71onc5Uc6NoPc+tvlRC6YdNuQo6dAPo6cMcmeZf7hGImbEI71hh56FnLLU46PQ3yTIqXDYNXND6M9qcNNLDvcRDmyIcg+nzXwsKhH7gilRxZc0fFCVvOnXD3D/39/qtLVvMAN+ro+KYK6SdaLTFagWTYRjxiGhOxU3+9Q0cOecL7yUiA7gw4jPsmLY4vLnMNUFCHY+5w+/tFiFoP7igH+Wv6Ea8zX6KdLhkysnUWipgiDt+szdncvOSuY0VGdL29or4e9rJRuBhJKlijQQYRWYgYir7kRVvngtRr28CuWYzthHeHDJIBPQPBwupn/Arr0x27ABrxFEqHu0uVoVh6mlkAQ8tqtt3S4yBLjgCcWja6Q1ElRqL8zommrhg8P3sXSdgkKkk6O1dJcSlMnQNLBJhtStqoHKLbCj1qaNnJz2QJWhfTulGUrpKkcooBLL+Uc2ZaZqrWFLPiOJSAwt9fN5ugGa068OSHEKTw6leh0F3Z/br4dRumDP//fVU/7pwTubagFu2VnizKS7aKjrgc5GLujEDzcBX5MkvXekIeJ8YVCIslmS7h7GgnVvAY61CQgio83JHXkf+/a04MV8kMV+LQNg9OM0JPKn4B0e+76jjLVUcUxEUQCATVgBQoxELK+m5Vk0vqikpIjByBHk3+14M+b6rLSL9gqxn6G5ac3s/4/aPoi4/um1IQZdNFh5Z4HBx458kwEX3BYY2Zl5TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oonjGJ557kCiIvsKEwR8ofTy89Xckt7QRwu5bnbw5MZTUORaMbYf4+vAfDal?=
 =?us-ascii?Q?L/4NH9vbb4o7i1oAqzR397pKnre4w861oyGPOFVRrfhLgRWZIQCePEAyf1Ps?=
 =?us-ascii?Q?mXZLe+x4lpwCJtY+QGY4xWgHNvnhYR3BN8EKkQP6DxH5IL1sSEM6Au4PnkVA?=
 =?us-ascii?Q?fauFvA0u/zoJQZnq9XV9CgwIUtLwErBc1XHr0HfH9Yh+UvxZaB3wTG4nboZg?=
 =?us-ascii?Q?X4tscEi64Nbc9WmZGHYoUmvt+uJTN4/QTe9FpMxFqtzOU6wDb4ZnQNSNsd1w?=
 =?us-ascii?Q?TUPxNIzTBBV1Rpk/BDE4MRvKbhsIwBpGV1E2KhE+TGrAhLS9EqEUw/lTysWY?=
 =?us-ascii?Q?Z/JoUzbeJZ++7ZEBR2kNw3FJFtkI1dqV22gj2dh5jTYYJv0/VkWU5lkd05/z?=
 =?us-ascii?Q?QA9yyN97OOEFKjHaKtYISK73WuWfArhgAG+MMY7MGWKX8JrsIoOvqFHsQfD0?=
 =?us-ascii?Q?h9n1JNyIuRyttGIDOV/E69jHvV2WHISXg+JOhR5hNkNkQ8vWEHYyawRz+aKh?=
 =?us-ascii?Q?XIts77ZWO6X8H3kDlWBI77kyT0+mpPyDnwMrOONo/4EQbbU+p+9Uskx02kF9?=
 =?us-ascii?Q?5gaAfCd/g1gWFWCobodO6xwaK6DxIRv1mHIRSYtt8XBi4Q4GkL/iHVSMqklV?=
 =?us-ascii?Q?CIKnXNiWeRBU9rjwmoi88FKQXxkWOktglSZQ1wuFijhshZ4qHQoSkKs6cagS?=
 =?us-ascii?Q?S+zv//a5su49PSzuH46oYh5mDsty68qOGJGTJiTAeyvU6pbIPP4d4sKVVX+g?=
 =?us-ascii?Q?KBh38l6vgkkyaJjDJoRDXDkeG0r0bgnIJG+C1VfIEx5rAK4u1ty2+RP/yCbN?=
 =?us-ascii?Q?hkxJfrXXtang4xc9VZEoxvjxR49+Qa05KdNbAN4Frlyq5iUXOm2iFcxpTSas?=
 =?us-ascii?Q?H7IYPauSRqERt+9TI2S3DLXVIodP2U08AgFxhuQwDY55sL2o5a/vhq8eudNy?=
 =?us-ascii?Q?/b7asldtJQCJ6gTaf9h/EqsIVnmr6nOcAxQ8giwsCtO0KHf7MFMuBYD/IY+m?=
 =?us-ascii?Q?e1k0kN0xScw0dlQqUEHcr0PegCnD9Y6rQVlZ8KO+k7noQsAbrMCbnt/APVAd?=
 =?us-ascii?Q?p5Robq89tI7jIj5QrOveJObyludYcAkbLV4sQw2palfRv1XvCNV9MRbiTrhq?=
 =?us-ascii?Q?ryvPZuMyHFOL4351ekdgxVwLXaLxQb8CP6rQwo+fyCSEc0DMF41OjxRJW1rU?=
 =?us-ascii?Q?z66cnuexMGDEuxs0lZvDfUf9/dk46POHCKLqGVLgTDxz1BcPPHrrbpPhF6YO?=
 =?us-ascii?Q?gqu+5vkuX2Okfk+8PiPTYku8Kq8jXYUq60x9YSX3uqbYAZ9E9usx/83HmxIe?=
 =?us-ascii?Q?49Oa9eU628zuUY2c+y9/wUXgPkHf7Jnu8TgvtPRxp+LW2VaMeJ3i9JRNMpcT?=
 =?us-ascii?Q?QaxOVZD2qO1E8hurL0mfM1sSo0vjxn3JRRpukMoirJCy2By2J40NEr3OEqTV?=
 =?us-ascii?Q?e2uDgMphsryP6hxbebTv6LMCYfbkOcWN+7OprdtZ4zGNP6IxekDpHqfbzgnF?=
 =?us-ascii?Q?kdqr4GazfcJABgEmAgoHqSnIS90WDQ8YCGDgBoCmB9gNsRDegaaAodYnRSwF?=
 =?us-ascii?Q?4SDzZyJqXlMzlxy4k8ddQHYCtpXiH+lUuwI97RcOpGUFT8GNXd/SMQpANnnW?=
 =?us-ascii?Q?TKpE6K1ykhk62YbDwNeSepl0nXc6aI2mif1kBqvIecBFlbrtsThg8EyK1q7J?=
 =?us-ascii?Q?F0HbEluGYrsCy5MNaB9MC3jvT3ZBuNFCsgEPvBn2OdetZJoVBQyhud2VdFXU?=
 =?us-ascii?Q?bA28NgcUfpynrU5T3en1IaaGyxuxvHeTCzDjZKlAilWTaFhslN5M?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbf2c62-fe68-46fd-83c0-08deed7e0052
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:56.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjAwjkiOyHzHLTECJds80vqPokobXDH3fwWAm9L5N6tfxOTACCL54nps8L8d3lRogcXwo8s+8ga816ENTm+0UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

Reset currently clears the ring but leaves issued descriptors unchanged.
A descriptor with published entries is then stranded because LL progress
can no longer account for those entries.

Cancel any pending stopped-tail recheck before replacing the ring state.
Keep descriptors with no outstanding published entries so their
unpublished work can use the fresh ring. Abort descriptors with
outstanding entries because their consumption is unknown and replay is
unsafe.

Since resync can complete and remove descriptors, reset the ring before
looking up the next issued descriptor.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 32 ++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b90b33460d22..b0e3f67d3942 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -214,10 +214,29 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 
 static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
+	struct virt_dma_desc *vd, *tmp;
 	u32 i;
 
 	dw_edma_ll_recheck_cancel(chan);
 
+	/*
+	 * Software cannot tell which published entries completed before the
+	 * reset. Replaying one could duplicate a transfer after its target
+	 * changed ownership, while keeping descriptors with uncertain entries
+	 * would block later in-order completions. Abort descriptors with published
+	 * entries; untouched descriptors remain available for republishing.
+	 */
+	list_for_each_entry_safe(vd, tmp, &chan->vc.desc_issued, node) {
+		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
+
+		if (desc->start_burst == desc->done_burst)
+			continue;
+
+		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
+		list_del(&vd->node);
+		vchan_cookie_complete(vd);
+	}
+
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	/* Drop stale CB bits before reusing the circular LL ring. */
@@ -361,6 +380,13 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	if (!chan->non_ll) {
+		if (dw_edma_abort_is_pending(chan))
+			return 0;
+		if (!chan->ll_valid)
+			dw_edma_core_reset_ll(chan);
+	}
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return 0;
@@ -379,12 +405,6 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		return 1;
 	}
 
-	if (dw_edma_abort_is_pending(chan))
-		return 0;
-
-	if (!chan->ll_valid)
-		dw_edma_core_reset_ll(chan);
-
 	dw_edma_core_start(desc);
 
 	return 1;
-- 
2.51.0

