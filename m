Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B924DBD74;
	Wed, 29 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335466; cv=fail; b=ZE1QoXTn2vCWWRp98Kdssj2guYyrci78ENf9ZryteKhFAWIwG0TbFqxDWvBS2s3TbikM7YGrfxyFrPNGo/aVa9BWFD9t05qLEZnd5FJO7Tf9P9qoVlddziL9mLDpxLSGQ/1d5x0H3jpYafV2SfHSNfpvxT/rxagAUAW++Rxjr4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335466; c=relaxed/simple;
	bh=iMkY7LUaEgnE7JoDvmZ3vQ9acBHMAH3pkpPc1Vyq6tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZP/4BUllzWfL0C9q7Hc9GJji5Qx+yh7KSMBdQQGPeFmgFrOCJimADw5VkMNdTNPfiPxKoxBylVI49brWcsO3RnN9nrBD165e8hgY/nA+0G0Oc+E89SNQXREFJDyHD8ENyL6hzc5asno/Zo7pMMqzJDoHna0QntiMTr+UjbifunU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=WwQThbP0; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="WwQThbP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPa0dC6jctLi4Jj+hhWcSHY6RusgRVHYb/Ii+jF6tjm7akApfObQ9fOlwg1mX2Hsi5S85SQ1hYOG9XwuHFUCUB/AGEvybw1WV5PG1jTGsGRuKUGiZyhZNfck7PwUaGXDmJKvZcenLS2K2UDK5VZhMkiRnjf3ux99kOdWZ1B3hltSF/M8iYYgj+OxkebNMpQkxpCEds+P+kUoKDwGjDH8qqOxUyfdGK6LoCmalXST7YbuxqAnnB1UJNh8aLpv/0HA/Rf1QhWEguogW5x5OqAr/h2zr2Q4irkq/M7oZjiTOw9l0I1W1k+G2RtFRZUex+wiqjFa+Q7iH9KYfs8eJ/J2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anlyWpkcYXv59vkiK84Z1RRmI9v9U1SnBmjQ569Igwo=;
 b=AdVo0106NLvIZfMmADvQy3xvWgYUDUQN6gnvgotepbQo8amonRWlNgmQfjSEmr3bg0Ml1POOsB8FQb88QIXbspzLyrox0SGbePVfw9mMYQyzKzVh7MBdZw1NF1ETc0or3yr0z0Q8NojjA0DzFc1vKkScDEsgAbVWTOQR8E0In49spidbPanmWy7RVML8CqW8darPr3G/r5ALzyTlZVh1wM11wAW+OJni2rQSH5JVco895PYgMdybOc0uWNAf2dDQ8iXskn8wnV48sy/bs1QrLHdtbURe/teXeth4iNMCMM4pzF/nM+Vw++kwCr8wIkw9DXj5OttAW4wqKyYzKkZzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anlyWpkcYXv59vkiK84Z1RRmI9v9U1SnBmjQ569Igwo=;
 b=WwQThbP0JCrTK6YKSmhBe7O4qd1HSDg4e/srtCB3mfG93za4i/+9qICJlp0lKwPFQU6x+f74ZRf/Ql9QCp1sv0zrqura4b+JSrexrNoDsSLRENxI1Dy/xZsYYEoQT8S4tKhHPGyl1JX+H6OIfI4UJ5vzfm1jdToS8lsC04R06Og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:52 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:52 +0000
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
Subject: [PATCH v4 14/24] dmaengine: dw-edma: Add LL interrupt placement policy
Date: Wed, 29 Jul 2026 23:30:26 +0900
Message-ID: <20260729143036.3087722-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 3738a422-6122-4d40-7bc7-08deed7dfe37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L7nsWsZsBoEJ13OZa1fE0eV4+t2kM2M/9GELQSLiN3j+MZ94LqKE8qEEqfxW0PvJHS6qpAf+trBtfctoLKQS9ynnhMBxy9RzORwmn4aoots1ksOah2HXyl4ObtZXsd14EqgvZRDC32nnl1cIWzVPGPFQl/lgmnFpgabDXtiGCzZ5I/EUyZF8M+gjTKFVTKjET7JRzGrO2vaAFmrsrJtKVv7MZn8tfPxMQTtxpLMi0JnxwOFS2JktHTKa+ehMDjLR4dz4+xE8oL1y+UgLAzgQ9m6N5bnNa0nVqHxs0U5Y+Q8r0Dps1BD3QPj5urrzyJNoA1yr9nAzqu9UrJbJDKtAF3lIX72+phN4CKmZRjm3mDK6zlyCJW1DKEOjjBBEiqwaz/cXtnzza5mZ4cyHZWRvVUeH6LP2yB0wyykZYUfnOflYCf7YXvtF14oYNYnxjsP6wq83rXIOLK/sbhs+ZBC/eY2BLM4eH/1sf6qAu6sdKGIM3M+gBNxA28Gs+lQNLD560lBHCpiyxROwBDZ4UOfJuaaXDDyn9HyHnPQT9DmSMHclM3Ga9d6FtI0Dl5tQveDFnQAKIBwnEMFyTpbQkemkGvbxxEop8qwGcHPwdSvQp4Q6tN5t71kwr0kCTG8vOmLoOWoRTDN+lDeH2V5EqW4ceLn3DVnUPNQ38ujxvWHN51QlrUlyFvM6It2h2Ynfufu485eskAmcqSZjMQeBX2IEmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZRg3iRduX4YKRJfa82AkrULa26W3fl9CpvJnyIEYTu7GGLzHDZ2G6dTV7VQo?=
 =?us-ascii?Q?zZqmG1mwdDFwF1D2R7n2tHEdbxOj1CR5nIuUoc+8/nN7KEiSH0i82agGIIQv?=
 =?us-ascii?Q?7bcRvyJcAam2O4CjPZwLwHmQyyJyvzrfLIYch288Iajng9d0xqargptiJa36?=
 =?us-ascii?Q?15OSreUsPJmzUX9W4Ck99vv4C+Ox7MLwAxK0i8QN7O3vUBetjIOOzFlsN/Tq?=
 =?us-ascii?Q?9DzPOVsHFoyg4ZWDvOtD4DK3XCp3PRRQErV3uNjkBF1KiiXZgPkPfdKgWJHO?=
 =?us-ascii?Q?vqX035rwjKlP06n+WAK27uCfDf+qzQ9rbpApS5EjoLMQvKzZ4J8he3ZuwBQk?=
 =?us-ascii?Q?mpJmKHdZPn1Psax5AgSHtwvbJqi1mjS0c6mVWdtBYGQiYHzA1xXmNfY754eI?=
 =?us-ascii?Q?nBrMGBjzm0YMSBEl5KYfs3qTbsBOUB8D+fUyKOgozK/VRLUjzK83c/fwGpS2?=
 =?us-ascii?Q?OdYuc9VX4GRdcVMx3Z5h2StK75uDNtdaqbY7wosEvQsfkidI2+tEnf8++h2F?=
 =?us-ascii?Q?HQN4wdX3PKufgSN05TewhAAXWxFK5DPpjrrchGRBf4iTr2DPQDo1thvq3yGg?=
 =?us-ascii?Q?eXPzRer6epXwmDIlVZkUPuL3xBNseS5df6qFpdF4+UHWjR52e2VX4e4FZJWO?=
 =?us-ascii?Q?j+3D6+2yVCtbZ2yysKFRRXjZSFgSwGQ9vGWJHIknqVsRvRB9tYwfEj8amcRv?=
 =?us-ascii?Q?qc3RVUtMXsB8L8h9clC/X52+9OzG9UM9lLDdPpHP3we+xL7jD5PtEYptUsNQ?=
 =?us-ascii?Q?uTnAWkK/4GF7GVllFtOIViaZ5p1zZU36EF6wovXyXuch3H4VOWnPGCZOwsX+?=
 =?us-ascii?Q?a5/ra2s8n4QUsPx14QqdO03GidbsCTGDxtRye26GeRGqPkd1F24P2VIT5wW3?=
 =?us-ascii?Q?gaA1X/KcLD8LqM0dKjPIgZnGi6+CZhWvqASp7/edpv46OgpbbMKTtQtluatc?=
 =?us-ascii?Q?H6CJU14D0Q9Jc/jdHzMl2UqwQFnRbXSx9HkGRSQ35An1lcrJuFZS4UkEQ/v7?=
 =?us-ascii?Q?ZrOseutI2PxgeZvAC25fZJ3hb5Q4NxNsfROIH0+JwqngR3YQFN4XdXDb0h7D?=
 =?us-ascii?Q?2+7/twZDJD5TE7uEKWZ90bvzKQ/3nvknXqZwFSTg+ry+/DZ3o1w7HNnU6UJN?=
 =?us-ascii?Q?C7Q+Cv4QNVtUkrEJym1cQB35NfPeV+LozBQ0Ut3laZvCH86UnnOTxTOJDwq0?=
 =?us-ascii?Q?uHdwvml9HqM2vdyLE7iH36wrCOJiyFoD+4cdM797LpXycLIIGKO86hojRCNm?=
 =?us-ascii?Q?FhNSclHFJDEqWsZz6A7cbKf6EOTmlgRn8Jk1jbbp7gY0p+CZ/DBLvFjcyotD?=
 =?us-ascii?Q?XFzCEM1PL0ePL9jijI6lLuvV34Lb3zHf0vGfd2PKjq2EJwBKtpZub11Eic74?=
 =?us-ascii?Q?phJTSkluQeSlNQptOxMqbf+wscyO9VNP4gMtCY8X8c9CTkm/UKSMiG9nx0Os?=
 =?us-ascii?Q?WTdqRYSqfnyuGIh/Nbq8N3FgbLgg7w/xbn8qov/6hAmtDS/ZHbav4h5pqaoc?=
 =?us-ascii?Q?Z8nTuifz52kd0iQiKeOFbWiITFmjs+BSeRi80xlUCn27NNZSPSShvc1YCuPk?=
 =?us-ascii?Q?Pu1E9042j0SS4S1+E1ZNJadJYIbsDSQkUGurktXAb/AeQGeEmIFRcbVKV6iZ?=
 =?us-ascii?Q?61J84xi29H9v8w0JC+x5Bgbb1eMeBy3nTyRu3xRm32Awd5bRN2VRAyFA2dsb?=
 =?us-ascii?Q?hf6OqoXIsy7r9GIdfpk3Dwk34X4DgRqElrYFhpDJCo9EkDENQVwyfCqkm0dc?=
 =?us-ascii?Q?1rMfirqVf8h2YtM/gAwLoQCfrb+cHdLLsV/GU4L/gUXMxYu+v1r7?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3738a422-6122-4d40-7bc7-08deed7dfe37
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:52.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNSMWuomS2gFQE66sonvH55EsW2oPDakVwO081/bcr1EWgc3kGKo/ZMXK1aWpVaMJvZDE8MyBG3Jhi+DUGmRKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

Choose LL interrupt positions in the common core. Always request one at
descriptor ends, at the last free slot, and before each link. Add one
every four entries while the rest of the descriptor does not fit in the
current free space.

Four entries is an empirically chosen coalescing interval.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Move the "more issued work follows" condition to the dynamic append
    patch, resolving the bisectability issue pointed out by Sashiko.

 drivers/dma/dw-edma/dw-edma-core.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 75d659f65a6d..16d3d2a8d1c2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -25,6 +25,9 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+/* Empirically chosen progress interval. */
+#define DW_EDMA_LL_PROGRESS_INTERVAL	4
+
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 {
@@ -250,6 +253,26 @@ static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
 	       dw_edma_core_ch_transfer_size(chan) == 0;
 }
 
+static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
+				       u32 free)
+{
+	struct dw_edma_chan *chan = desc->chan;
+
+	/* Always report descriptor ends and the last free slot. */
+	if (i == desc->nburst - 1 || free == 1)
+		return true;
+
+	/* Keep one progress point per physical ring lap. */
+	if (chan->ll_head == chan->ll_max - 1)
+		return true;
+
+	/* Add periodic progress points only while this descriptor does not fit. */
+	if (desc->nburst - i <= free)
+		return false;
+
+	return (chan->ll_head + 1) % DW_EDMA_LL_PROGRESS_INTERVAL == 0;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -271,7 +294,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 		dw_edma_core_ll_data(chan, &desc->burst[i],
 				     chan->ll_head, chan->cb,
-				     i == desc->nburst - 1 || free == 1);
+				     dw_edma_core_enable_ll_irq(desc, i, free));
 
 		chan->ll_head++;
 
-- 
2.51.0

