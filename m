Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F04847A882;
	Wed, 12 Aug 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550275; cv=fail; b=cZ895doRnk/4PfIh+LLrO7nGc38kAWCFPjGBuMaGK/Br9nPedVK4mEq/ulXTbzd3cInqtwXKLt9vd+qFgCPuUVF8XHxrbk3WjZcFDBpZX54TEdcG4boJ1TWCXqNzi9t5WAuDGzwxYgCK5owuX105J8pfu/IDLZ7lf2P/7YKBl3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550275; c=relaxed/simple;
	bh=CaewytvyS3x0FYwP3b6BcW+6JXMOLP6Qrg8T+rv9nxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZqsL/FXCskMSUQWghuHBrg3NdWZG8Va3yn9gVAX3G6FBWN1nOFyHd5IiviOs2iwLEPxeWjr1ctxYLeYrGdaN2uKyORTK3XMdODP1NQfwIdz9HUeoLFMSgOv/6ob9Rb12HoLXWhU33Uit3OT21sosy8SJcBkmdUhuci2Fgaf4Bmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ukVXu9Xs; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ukVXu9Xs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOnjMxAXB2IdXdkDTfrfLdOeDMyA4bGDUc4U7EggM/SVWPU6UJ/Sil1B/+q1fuqnNNwSgoK/oQ1vU0ud1FWM5xOzZvJntg8MD+FcLGwIkkzTF+kgM5OyCQPCZHCaua2YPtPXqIC/Tmww+Nqvh/6fThphyh58KPgu47uQJRc4PUfXvqUPqqHBWjcQXLcXkeRFVyHtWe1s6kMBYdI3KtweTUg9TQ19Pr0BpvuAGr+fDT7Hm7TXovUik2gFHsPV1qPYIczy7xo1V6ZcWVici/qcUn/cYsKYqWcLhokzqGEoz9jeYLPGpS67w5hmZpS8xljNz2NmiGgjiGPYpUmTDIY2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+t3lqVSI6RIl01Qv4N8WBaW6BsdVDNi5UDZzoHtL7s=;
 b=scLZ2sHx+SPlJYGURmmLX2nkxm+vKLOljJs2ORjdvjKgK55+OSXnnPTj54oVgcN8XJqslKrF027zKD26ZAgW0xxs/iM9Jry//BDbWxgjG1vki4luS6RWbbEO/kYG/tUO6w98pqGWDNz6RhHbAiqkYmIjp7toBByliV0qhDiOhDUboIbY381ZTFzPW0svr2BB18WJj9mfLIeqoZW3fGDs45SjMTl2I4+hx6rDCxp4FJAVtNd6WUX0DhG3YvLYQTiN8AGhqqpndWh9rleQw85CXsbV7aBRTONX/jRLa0+Uggxk2sHgwcqQsEKK5BN62oDnlWYH1k5on/ZTLgRWibPVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+t3lqVSI6RIl01Qv4N8WBaW6BsdVDNi5UDZzoHtL7s=;
 b=ukVXu9XstgTZelN9B3xr4cx6xtcvd6458/Say/cXz6Vv1S6VlQB7n/4vdg0PSZxlOD8KfJXqp8BlssjxnFFUlRa5sld95TAf5Ccfcg+5K8b0dgd0QsCjzkCnnvswa92aNcWJi3norgZtlh+PPu1vy4bunke36FosUN/UvYtskeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:37 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:37 +0000
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
Subject: [PATCH v5 14/24] dmaengine: dw-edma: Add LL interrupt placement policy
Date: Thu, 13 Aug 2026 00:57:11 +0900
Message-ID: <20260812155721.2807506-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1e23a2-a510-4099-1420-08def88a6e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zjfsbOofLugBgSIfXM/SRfkM7KuyxFlb+24OvEvdvPtSkN9TG5xLPHrfBqI5ynTicCMSTHczH2A0Owb16bZsdaI9zT88+8AczzFexasQQjTW741jXZjcujZH+xBjW8wuEf/8V3IOMuewr0XVSQhnBzrSc3VTMWDrQwWYw9WHIxQ7aNDMmqd7e5FKqXu5akHKhWPYwBJe8FzfwR+E6vsI8lN/EVdCyThjyZAfDjFlQD3KX6szLwXIVyY+2fj38qIm9w8gAaOqFEQcPV/UVCWqQMODWz+Wuh6B+EABIGj7aSyzCz28JRifJb7Nax8cg4I2Y/alJkd+GLZqNOxW6iOVDOnKBUYqvy/xTHZMLKt990/9GQae2bhYzQEUPvqYOv3TOBx/6XX5FtfV3wKg1ivGlWvNeJ8Pu1lGo7x9TtomDQczYQfPcodV4KLySN1N1A8GHwLHTUjAGzftWla7Iae4E/NkYFIMLVge3PcLK0ILtuaAipv2jO4woIFukwE/h0v9RzQadpJejxtLCvxMTq8L6Ci9lQW5CI5YkBbv1/0ZPCuOa+RKGUNgZD/n11dGYeO4Q6SKKhqGxo++RZ9iETzgfD+bfjprCWs2fQ4YIh0fWY0qEFlyioiwBCNrk6ctlQsN8rovrHwGxgEZGWbTJR3Bo1KqUHbTbL32GSFMAwq5XrPT+m9aCrvSblp58KYqXnSRMyWWoTnLZJ/o/14m05Agtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QFSUKhldjszJ4WvyNjLMPzuz7oiCiGHc0avAaYF6ETzL6QzMTd1FJph/2Dby?=
 =?us-ascii?Q?RDRmxmxrfyDavspDEO217zFlEXuzaIyLP1Gp1PvEnUbuE0FDPyGsffd7nWYV?=
 =?us-ascii?Q?dKuxXa+Bc7Tj6p+IL9y4AdaFrAA6JxlVcM3DDw/9pnl7Op1RFZyh3x5sEj+8?=
 =?us-ascii?Q?YDo6NpPJ6jp1MNzgI6R4JjdEntMPFyg0uW5+dm6QntpaqEl/OQwhKLk56yC4?=
 =?us-ascii?Q?og0eiXrxt6V/Px3XClkOSP0OrZQ5AhPq4hd0/M2KU4gUHYloo8HYC+s+Wa62?=
 =?us-ascii?Q?S4Zy2NUGVRVIa96ySDSecC+yB2Qep1uqaDrkpXEASlijkC/obBXNuEotUoeN?=
 =?us-ascii?Q?S9rUs7MMJgyD5y+MNTQY83wWda/01WPVXTvH58mo8fZShZOx2CrQIgWIYU7n?=
 =?us-ascii?Q?0/NVap0ByN0n1hrPsVGIFYhENdjkjFa0Pjtj8EnIjfivlndNZ2oVZY7yOPcn?=
 =?us-ascii?Q?4avwL1sGC8U+8Sm1p5eW4cq/EgfpBMhm7RVzVYQWYvI8maXU8CM/RJYYstlm?=
 =?us-ascii?Q?i8sqBALEj5iX6wAoogsh7QxWLj0umGmJ1ne8FycEGefOIAhKmPoF5UogwVjW?=
 =?us-ascii?Q?KuCGZrKzqBx4eA8UyGsNXyBuwgOWLcVgcCn8DnUwaioqf/BcTZvLY3f0gGdy?=
 =?us-ascii?Q?K9ihngzbQLMpBbahyAQDyeW3IkPlpMpFSrGHvv8WisTLT8l8oPfBoqcQGipw?=
 =?us-ascii?Q?NHrX/wLCNWQwvInNdWHizHxBF5/BWmZI1COI7TkDNpnPDLBtSKN26S/5QD2o?=
 =?us-ascii?Q?WC+Ag6B0ajKDfGia4p05R2iu5KuZyQ0E87jFGzKesQ0AGFFVKTm86ay3N7PM?=
 =?us-ascii?Q?TgP8YU8CPqcLttKG6pM26KH7jn0FCC2S6JyG9i+ThjRRuJvwS0GGysijpg50?=
 =?us-ascii?Q?Ji2GVBXlKmSFzhNqWluLVKc5c8OdW+esgwqX+GZs3C3L19SvnCsKR9Zxhh38?=
 =?us-ascii?Q?vNVJcurrIANG/IDPIjavzfeOt+x2q3l1kWf9a88+Kw0SRaP1lXga7LmKwroN?=
 =?us-ascii?Q?nESHtU6MIR15UcmpwJKYj0NIpErMcPKpSx/ShCtVmVLRaAHyqGuIMqBk5ICn?=
 =?us-ascii?Q?C0TZgqf9ZX0oeqJ6vu7h2SQc9e92g7EDXhOyppiFBaJiGI5e0fwyc5ee2h3y?=
 =?us-ascii?Q?hy2BFxBq0s4s1hnLfD1uXn+YZo1GpVpYsdk4HjwVhe+4LTmeCb0jsgP4p1on?=
 =?us-ascii?Q?Ju6Y1I1y2d8tHY66eD7tHvSpaiYdw8/QZXSqDRQaW0bRvz0DIs+Vf78e3q69?=
 =?us-ascii?Q?oZqH0JhBjgogQMbp5rHj/zUtsXJLVC54jiSm+Jt5eHMElT0niHWVAjiY7Hxk?=
 =?us-ascii?Q?oi5y7AjYDeUry+kyaxETbYiOXpWRrGsf54gIf94A6qze4fz0bZVM9SeH7Ver?=
 =?us-ascii?Q?JcB+WMXjh55ztiNTV1230e8nLsZ/65fGmeg60fKWkf7divCKHA4xiLs7hT0L?=
 =?us-ascii?Q?KsusTqEICP3ehal2EGHfbvRKni3RWaHyjLPYG8Z3pyGwZHkg6MSIEseiKVIV?=
 =?us-ascii?Q?eBqAw/H2ZA0317Sh4Pc9xaMPRQeWlW8z+W+WfdVmd2T52zcbHcS7UCPvlz6z?=
 =?us-ascii?Q?jvkksSqSbQ1Rye+lwSPtbqgkW6oLUUaPNWfnk5bqmZOdJUIGt/Kj5pG5NWmO?=
 =?us-ascii?Q?Tgy618TtV+PpkJeDPMOOutqNQ1vuPAHhudpqfQvmP2O4/xWe2l5LzugoDYDl?=
 =?us-ascii?Q?hROy0v/C4sxi9oP0n6r6QHJGBe3mj/kjzEShotyVOAltXPU1tLELFEFpe8Qm?=
 =?us-ascii?Q?w15HjhrI6B6UVzEYieBsmzLbPUIS+bik94fwFmakkY8bAMj7wCM1?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1e23a2-a510-4099-1420-08def88a6e3b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:37.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKyYajCNq4phJyEtdK9wOr+GJt1gvwDalRN2fc7d5+xc3ByTs80ckhQhXm1jCAvdHthcXfqcPziCxn2EmOQJ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

Choose LL interrupt positions in the common core. Always request one at
descriptor ends, at the last free slot, and before each link. Add one
every four entries while the rest of the descriptor does not fit in the
current free space.

Four entries is an empirically chosen coalescing interval.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 363993c64c44..13c45549e08b 100644
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
@@ -244,6 +247,26 @@ static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
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
@@ -265,7 +288,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 		dw_edma_core_ll_data(chan, &desc->burst[i],
 				     chan->ll_head, chan->cb,
-				     i == desc->nburst - 1 || free == 1);
+				     dw_edma_core_enable_ll_irq(desc, i, free));
 
 		chan->ll_head++;
 
-- 
2.51.0

