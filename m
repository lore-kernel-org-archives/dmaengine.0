Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876C9438001;
	Mon, 27 Jul 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171835; cv=fail; b=vEreKv4f0WoKftLO76ECmf3XUvcFXgxQ3Q0QFYzJEeoDWWEhpzqcx9XexEIXITzHpFfMSvgPfEKN+0vgM/dq4rF6g++J7OxTHFp4KXhqPVD6+6iYIpGkGKsbfv9y1hN3OdLdEEJU6NRrUvIDkhLk9F4nrZug3VDLbqHtPFUAo+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171835; c=relaxed/simple;
	bh=2627ykscgXqGcDr9iLHer6yEdHhn01NNMkRpPedFnx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XOXfLEglEnyv75RgUNz1cfqxQ377X2ewuXmBoh1ZLhzgCTZCOERm6JnrhBEqhmkWkUzikfZm8RaOBwJw1EP3R8B77FIQZj04+UmZQhZo3gr5UiabsybaUhxN+Dk0Jvag3Ec1wdkQa+x1pX8ZPsBLrnKrykTw3yxnD4Yd9v8r4zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=oNb59Crd; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="oNb59Crd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0o1MurnieuhmnfJ9IbOw19CiN3ctAOc1QuknHNNSglD7cvPjlmdtPDyjF5h7U8Hmf+liMxp5VfwZQ2X5OqGFLvv3UgBeNEBzwUP9ElsJygc6FHsZ9xWYQJZQUlJ0PM4g3uqpzY0HkQBjLoAX5JZvKPRpA3bxS/k9YKldvPL11SsmZhHvuu4+NzyR05N6+fHfPnK3NVk7VvXtdvfC8/+hP8qMOpFRWrOV0GInSMJdVpJW8a29r1fPSKi22NZO6Uw1mRI4flaj3fsI2bFjvxb4tF5jY8f5nGu0LGt+ClUa3jRfXzCDZuMpo/nGAOu8l1SQFefQKxQbxFM13R6/Z3MKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWL5MgVC9xwE1YJwui81s9a5t6Qy+6vS6xzVNJz+GbI=;
 b=dSmiKoaD8IhgVG2DE36Q5soQpkM5TR0oKosrd3tu/IN9RfLHgvrZv+7/aIfyLldbjWoC5nmUPLOL4rt4qrLWCXoaatM0sRyw024yd+fkBrcQ4Y1xDZuxcy7l3KgwKp2x991dBkUrDkmuZGnuIeVUbF1AdI+Inpc0cgJaVVC7TxrrP4Fl28r4GNdibcYSeJqk+9zB02e0JJax6dXPI/2RrWm7JnwBHYHx5Q1iOn30jtlYJNll0zZ2W9PlsajL/Hg2lKqWuatRhKUZkdrKD+c52azb6V+j8o2RJPrMShgmwmJ7+OKcUtU/h+IWZ2klU1FQrQHeAygzwpre29WXKSDIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWL5MgVC9xwE1YJwui81s9a5t6Qy+6vS6xzVNJz+GbI=;
 b=oNb59CrdQ22cDu2PwGFOh8w50JdNoKN8V8i/blFynoyWTP1TA7ZPj+px918FffjVfygG9hcds7DZlzTWXW0xSJg0goKI9YkumObdjzKITDTXWFdjQ+ltcfVCqEnCiiDGbZkYzncP2DpCGygj92Txhi+b5dYqXzcRwmXYmFVGjIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:44 +0000
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
Subject: [PATCH v3 16/24] dmaengine: dw-edma: Use HDMA watermarks as progress events
Date: Tue, 28 Jul 2026 02:03:15 +0900
Message-ID: <20260727170323.2321369-17-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 337d93e0-9794-4f5e-e125-08deec01045e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	jpsXjSgOZbILeSaOAT/VcC4xVn+t9uL3w+eAWTG6qwdAskhR1BjYl0Ls5kiB0dJdhyjNG218gist1QS61GAu7PicR7lHBGmCx7bvm2Qbx5jayTgU3bNS1N5CbIq0yzpNTNjLig6/iO0at3GKmEoUHwBcRv1vs0Svkjfa2YeyDD2RqPo1PctewYi+6GIjQqQCGLzsjYq/SUTZiewvDKJQzd2eBtUSqgvCJ7JArJiMY2zQai76YJLGNYaPM12r++hbNi+8XVYLOIjAm123Z6UBemL2n0lPhnqwgjE7ecHvvRCLe3opl9EC+UgsAjz1dN9qzMUFAdAu/AjWeG8vNjl7ks0VrPfwjR0YwlsMXNHMJN842Gn/izUTRY1RvBzaoNVZW/VqmrnkYL7Q7iI69KE98m+CUHUYtIg7jRHf+nydoXscrMF8H3ToPKhgjuggsxO+4hc3qj37nFx7thVdC03KH0YLqgqpCRNBjp6fuEuiRear8OehWSI40jzPbImjkx3RqIbThJMaxIccoL2vghSlmIZ2aCSApVdPrv7iS/jKyl42q0NBRD/SIK/BNB+J4N9U+WVW+HiOll0gr6rLrFOHZ6CH+fPPWzFD+QijwEQr5ylj8rm+Qlc0W9T66XxhbcQu1zIMQ0ALFZSgrk+Soi856rvj/phg8XGwhd8dMahni0A7uLnwIM28scf2xrGQ28owJWbJ54sHeSzmb0bzAFNNgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3VmsH7bDhp7vB9+FvlKRIHxZoVEYgTBkcxnQDVT0Bb0GBkCgGCN/RMGuTYb7?=
 =?us-ascii?Q?Osc8EXTxE1wDt4fn4by5TzIKWTjSGJhw8FeKBQYZ6fLh1RSufLpNPAc1bj48?=
 =?us-ascii?Q?mCmeP/3eVhWpahG4uI1ERY1If0LuUEbbSJ2NKhPTzBB4FY7CjKtpwbczgTdD?=
 =?us-ascii?Q?QK1LqVdR0m0BbnJ+MCjspVyxH+sU1j+PsysL+F40PCvV1JYcU0v4M9n8uhT3?=
 =?us-ascii?Q?DIeK2sr8aqJjLeZKsfFNGHx5ylxN8nzonHKih/qAiEOno7J8hb45mxFie1yx?=
 =?us-ascii?Q?Mx591+yjzR8lq0uFcdwFU4UwyMfz5NWuiujYC8jQofBQjZ75+ZDPcpgMFZa+?=
 =?us-ascii?Q?vwzPjFc2QmCnzA+526xZT8SS1kESGtpQDqSZBOu89CdzFhE9/QOrP5UzfroD?=
 =?us-ascii?Q?WdVqPfSuwFZhQ366OhZfDtxihpD6fXWTIuttDmg5+Jo4qGsjb1chnYybpsYg?=
 =?us-ascii?Q?+wCAwf6wssyguplFWk1bQ55Ei3pjd3/0wclvna29VBvrZcE0Q9GQb3u5zHVa?=
 =?us-ascii?Q?QYmgReUj5OL35gfbOjEJ9YVRS+JrmgGgbqRiqXbrL5RZGSLcYPVd0X2w8nK5?=
 =?us-ascii?Q?9FUVgObRQQqf5xGnorqk1SYgXc/LBOAL4OI+a3jp0Y6b7fSXF1vi7Km5aDG9?=
 =?us-ascii?Q?pLpdPdwT5avDgsTeL+j5rlZXFLTN7naWib/V+bHi4qMxJESfejzRV6YVcy8A?=
 =?us-ascii?Q?utUUaTvjFxKtZO1JloVPkbKK4L/p21qyIElkG25Sr3P5fHVDN5+F0Gv837CQ?=
 =?us-ascii?Q?xAKTRHiRTofbRrnPA4LNwuv0xjjfvs5ZDDfi3LdHEkLVj0xbrsyQ1pI3XdiE?=
 =?us-ascii?Q?rWmGT5Oa09+ab5NETKliS0IyvQxgqd1PLoC5As4oUUXeoFRYPq5r/gZ+EJFa?=
 =?us-ascii?Q?kVf/TN6su+QMeF0ILDJug7v9KgKw3VjL4q76QY64EG0UvdFWvNvTkS9KmsgK?=
 =?us-ascii?Q?+j8pywewVtCZI1SA8ot8H6z7ghH+084no1liyD01xEOkJRWd1BU1rVfJWIyR?=
 =?us-ascii?Q?q/DRm+oYVSCHNm8hhyvPFJYl5Fzsl9TtqC5Mg6dzuxUZ5Tnn+VdnB2SKHLy2?=
 =?us-ascii?Q?NyLxK+mXHUMsVHYD7mET0a1MSKY0BbCe+2qquIk2WVBx9rtzWcDMIyuAdbse?=
 =?us-ascii?Q?Ei7PXdfeDkJ8d8jZv81aiQWwr+rd6OVS7Fz3wdFnwe+Fv925e2eQYrFHy07M?=
 =?us-ascii?Q?Oo9B7wykDKgzV0h4CLY93OUhwVgFIX/X0/x85HZAAttObes+2bBWtLItKpeE?=
 =?us-ascii?Q?eoP27qXHYIF0fezB7CKEauI9oOCNS44WYMjSry/U9wzifiP6fOfPF/cm6M+U?=
 =?us-ascii?Q?X76ZzXxekImGWAJJCpH+0gUreDcR84jVlUJGS9HyjTWLY73kVsba+3OiYvPq?=
 =?us-ascii?Q?zz6mzz8fVtSze6XffpILebL8/6r/NwMfx8vGr/s/6aeP0ow3nE0nskg3Vp0R?=
 =?us-ascii?Q?bd43ShlN/10bb2y2LT1jhOxoZKpJykWHr/hxFLnJ3YQ5QQysyjMYSdWRq4RI?=
 =?us-ascii?Q?Zxe0ingo9qBFQ04qvDoippl5lYrFVtTJ8pXa8m08Hhh83VbM7AZ0iRyLsDtn?=
 =?us-ascii?Q?4eta1pe9uS3RotrD4DEtDOqvH9iSV2bfdPnc57Dw0VMwyjzWFN32BG/XKYBb?=
 =?us-ascii?Q?RphnJ9LrfjuWeL/7LrGeDq8wsJkPx1KO+ht1qOmCl5BI/IuMg7IzCx1qeLu9?=
 =?us-ascii?Q?O7XU5YSdTJ+4NLO2croxETlAsl6iVMZra3PmZHDvH4Ruu6dXR+o1j/FUxxiT?=
 =?us-ascii?Q?XKbn5arDUSMpuT9B9c8zkuebQExTvQICF5oaPbBTVm0ZOUY2K/EM?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 337d93e0-9794-4f5e-e125-08deec01045e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:44.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ek+w+7U3fEZP0Y1YX3yT/429vpm3uA3uFZ9PhWn2kmIcAzk5qT/XKXCof4r9sbB1vb1J0Vlbu+5wMxS3tFvPIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

HDMA reports running LL progress through WATERMARK and channel stop
through STOP. Wire watermark setup, clearing, MSI programming, and
LWIE/RWIE into the core interrupt path. Record WATERMARK as progress;
STOP remains a stopped event.

DWC PCIe Controller Databook 6.10a, Section 7.2.1, permits recycling
LLEs through the watermark LLP. Testing on a 6.30a integration found
that boundary unsafe for DMAengine completion: clients released mappings
while hardware still accessed them. Keep completion one entry behind the
raw LLP. Once the channel has stopped, LLP points to the next entry and
needs no such margin.

Leave EDMA_REQ_STOP and EDMA_REQ_PAUSE to the STOP path instead of
handling their watermark as normal running progress. The eDMA path is
unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Record HDMA STOP, WATERMARK, and ABORT status under its per-channel
    event lock. (Sashiko)

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 69 +++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  1 +
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 5d0d7575bae9..cbf9ef109e08 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -53,7 +53,8 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 {
 	val &= ~(HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN |
 		 HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_REMOTE_STOP_INT_EN |
-		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK);
+		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		 HDMA_V0_STOP_INT_MASK);
 
 	/*
 	 * HDMA_INT_STATUS.STOP and .ABORT are latched only when LSIE and
@@ -63,10 +64,14 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 	 */
 	val |= HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
 
-	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE) {
+		if (!chan->non_ll)
+			val |= HDMA_V0_WATERMARK_INT_MASK;
+
 		val |= HDMA_V0_REMOTE_ABORT_INT_EN |
 		       HDMA_V0_REMOTE_STOP_INT_EN |
 		       HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK;
+	}
 
 	return val;
 }
@@ -76,10 +81,12 @@ static void dw_hdma_v0_core_ch_off(struct dw_edma *dw, enum dw_edma_dir dir,
 				   u16 id)
 {
 	SET_CH_32(dw, dir, id, int_setup,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 	SET_CH_32(dw, dir, id, ch_en, 0);
 	SET_CH_32(dw, dir, id, int_clear,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 }
 
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
@@ -90,18 +97,26 @@ static void dw_hdma_v0_core_off(struct dw_edma *dw)
 	dir = EDMA_DIR_WRITE;
 	for (id = 0; id < dw->wr_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 
 	dir = EDMA_DIR_READ;
 	for (id = 0; id < dw->rd_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 }
@@ -158,6 +173,22 @@ static void dw_hdma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, int_clear, HDMA_V0_STOP_INT_MASK);
 }
 
+static void dw_hdma_v0_core_clear_watermark_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_WATERMARK_INT_MASK);
+}
+
+static void dw_hdma_v0_core_clear_ll_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK);
+}
+
 static void dw_hdma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -214,6 +245,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				dw_hdma_v0_core_clear_done_int(chan);
 			}
 
+			if (FIELD_GET(HDMA_V0_WATERMARK_INT_MASK, val)) {
+				if (!(events & DW_EDMA_IRQ_STOP))
+					events |= DW_EDMA_IRQ_PROGRESS;
+				dw_hdma_v0_core_clear_watermark_int(chan);
+			}
+
 			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 				events |= DW_EDMA_IRQ_ABORT;
 				dw_edma_abort_event_mark(chan);
@@ -282,7 +319,7 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	/* Enable engine */
 	SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
-	/* Interrupt unmask - stop, abort */
+	/* Interrupt unmask - stop, watermark, abort */
 	tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup);
 	tmp = dw_hdma_v0_core_int_setup(chan, tmp);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
@@ -343,6 +380,11 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_chan *chan)
 	/* MSI done addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.msb, chan->msi.address_hi);
+	/* MSI watermark addr - low, high */
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.lsb,
+		  chan->msi.address_lo);
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.msb,
+		  chan->msi.address_hi);
 	/* MSI abort addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
@@ -362,6 +404,13 @@ dw_hdma_v0_core_ll_data(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 	if (cb)
 		control |= DW_HDMA_V0_CB;
 
+	if (irq) {
+		control |= DW_HDMA_V0_LWIE;
+
+		if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+			control |= DW_HDMA_V0_RWIE;
+	}
+
 	dw_hdma_v0_write_ll_data(chan, idx, control, burst->sz, burst->sar,
 				 burst->dar);
 }
@@ -444,7 +493,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ll_link = dw_hdma_v0_core_ll_link,
 	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
-	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
+	.ll_irq_clear = dw_hdma_v0_core_clear_ll_int,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-regs.h b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
index 2124c162a62f..60dc054adafa 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-regs.h
+++ b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
@@ -18,6 +18,7 @@
 #define HDMA_V0_LOCAL_STOP_INT_EN		BIT(4)
 #define HDMA_V0_REMOTE_STOP_INT_EN		BIT(3)
 #define HDMA_V0_ABORT_INT_MASK			BIT(2)
+#define HDMA_V0_WATERMARK_INT_MASK		BIT(1)
 #define HDMA_V0_STOP_INT_MASK			BIT(0)
 #define HDMA_V0_LINKLIST_EN			BIT(0)
 #define HDMA_V0_CONSUMER_CYCLE_STAT		BIT(1)
-- 
2.51.0

