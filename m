Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE094435A8E;
	Mon, 27 Jul 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171833; cv=fail; b=pr9HneRGk1lUHwyYaLJQYI9mIhdWVJWsH5qW4mnb/yDqKHYgJQoBnw9qhhfBhsUdQurU25s4y9vdphUeXtvVadIKQVfQGU+jblbvLJqIHEo3ULjMg04CY+2sp/okT977uCPwzRkiik2OBTySwmlwJ4IP+IvheK2zrdp8j7Ph8tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171833; c=relaxed/simple;
	bh=PnsDO18gsGAZklHYtWwhmBQekQf47OqNeJW3ffXeGbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=je36E4s+GQk9LNQxHrdluPbOSRdxLCOtmDUuUkQoLnhQOpdo3JxTX20iD3RBMMG9WGkk+bfeR/XTDgPKsdEsTVHg3rU/f9a0HY3iUpaWnbwPHtTPscW2OdWdmIeh8vGRC0yc7s132WTFhKxsKdee7hGTswtLSwLSvVN/wg7RYHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=jVmSFDTR; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="jVmSFDTR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8vVxH3TvA+c2DjLuA2pYjiLWkgmNcus1jCOB0tpMBIhW+O1MxkyvpHXddFM+UnS1DLI67XvQCvifB5zP2YR6iCriPNnO3GBU0DcbhoKNKv1HgC7EeazmGaefApY2tRAjqoLXcO2P9OyzxguVfqpLNMcTqWcn7r4Db38WezqN51J1ummOe56r/fW3cZcj0S0I2wqWM/Nz6MMKnjkhhjIqZXFjwhTA3dEIkP1Kh+PMi2GPLf88J68mbK8MqXjE9AXxhGEyuOjsvQ6zHSGyfc8OSChSj4vgBBS6WyrOuUQM7dBZA7j6QFeHV7uiaKXjr996vg7x50+tk64Z8skOcU62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0j3q5UMTPPP0Xal0k/kr9ExBMLpFKlB5f8wXSGWNck4=;
 b=AkN/JuEoBoTb+XGeOTLSHGM7JfU0VTgzb1m2H/y2LIRDEaEbNRih9CDbuH6ChFP5kfoHTcBHQRfBH7haNQu5qkdTbEBiQr5IF6F+TzET6+5jin6d9lqA2YvNF9YMTsVLKME9huz2WrdGgq4urr/LrUOvNVVkWX5tfYS6bUjgAA0VVjlzbryYpSzSc45uJGw5YR7Z8Kpg+32Ogw1l0SFAkDVyPiR2fFeMpPgt16gNoKwFuXCs+qXwY78/5wimN8ImDf22wtURptVZEn++VoZSTkx+lbqgCSDJkBPcxP6exxgghfShmJleOYbiVk6PIRMBCt8VAWJxcKQ/4mu8Qd6GHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0j3q5UMTPPP0Xal0k/kr9ExBMLpFKlB5f8wXSGWNck4=;
 b=jVmSFDTR6UAy526JKTOB2lHh9YAeNeXFmfgwsQkOZmbRRuoXhiA5+4CRCmdkhZLjVib8Kipxzf1iFbkyP9UOa9i0oZD64yG/y5RNzb6XQbdxuLVrtaLoNbYs6M6A2U16Ik1vVAbt7xu6p+Hxiehz/e+D2DtK830nVogD2PKu8iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:42 +0000
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
Subject: [PATCH v3 14/24] dmaengine: dw-edma: Add LL interrupt placement policy
Date: Tue, 28 Jul 2026 02:03:13 +0900
Message-ID: <20260727170323.2321369-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ff6d84-2af9-4b10-f793-08deec010341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	/vK+0Ai1FhiJnZEss/ePjWeh6FabF96bVB9219Qv+LCgMa/iwmUR8Hee/WIDsWG+jjX+GwR/vSazJu1fWmELP4FD3Op3VQZsGmWIzz0C6eZ/FzpH8z96fagAyFvETiH1hXhIyu2Apmb1zHR1h4oVEpNloigx65zjSKbFhMkq58+tj0AKlSHUhgYEbU320sAjS1+fljrm1NI8qIumcz2pWyAkrLrbyG69g7eT8PYeFdtlyBsAihodtNf5YbuI01UdYYqhSk2TpvPnP0frvIYO+efHgm+HYdVjc7OSpYxzmzM02zsVeRJhkjNjH7LoyQgvWKY1YUTsI+fT6EDEaSfNywD26pd5C5btq/aEoMIW9YOi3XvFtAKUcYmD/ORYwBWQZKDRvSUvpNvEKy9r9sYpUgg3yQwu6+hhAiWoSeoqZCJ4r2zBhJvYQDCvD88Tni1q/p1FFosOl15z6WHKf5OTBEZo9h3QyjNNuOu2/8/lHfS4btjsHe5x4sDGPoTmUPWx7SVgpINVCwvEzU23HEQgSGCennt9mkh7CU6TQgErTxupmYgWE4h52c0wETaEc2gCMdeTHFnKcsOrzghsQ4qbSAuHCpoRYIRfEB7OlwTFwXa8zNGqk/rRWAv/pumVaQUtZ5IjmNwYJyddzTpqaPQisWgRNtqLvjcvaUkcoyvkQHKPaJTVXF4OOFknkLJwgTzK4GYkZDIIrDbbF7b/sIpHDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4TO1Eoaj8Dr+Lib85sjZglpJskSnl3BvZTHdEtq24PPQ+vBABXoF/j5+Xw7u?=
 =?us-ascii?Q?cje2lQ9BC6Gu7cfXXyJebExmd+aIHtE3lIpmWnMaeLm7dopZInDCloBe3oLD?=
 =?us-ascii?Q?Pvxc8y3ixRUlOvDjoRG5CNBVAQgj22ePvIkEvsfMkzkK67fpngIBZYd54he9?=
 =?us-ascii?Q?kKGC1uGy9I7qyeYFxaAG8UhBh4f12qm418xDVD2nKcSy9DtagEanpTD/hoUJ?=
 =?us-ascii?Q?DpD15c0dSW7su70oDjxTYaimbRFf53HGuM/6RhRMYlNKj6tihHrvXMTfcA9T?=
 =?us-ascii?Q?o4u3/pOV+5HordWT94uDw7sBEYzDxuOp9WW/9MWKDGJIQYYkn5fGHO7uxjX5?=
 =?us-ascii?Q?/KzsIYCJxOuY7FRh4kElKtlMko6P/PjIQrnIJ1Sgb5OvjRI8Sjn78yLVB6L7?=
 =?us-ascii?Q?SdOuYBRmivUvmjBtngXPvyUcytGlWe8K+tHxYqKTkdE/+lsgWbBkF/pxL83a?=
 =?us-ascii?Q?Q7OnoA5tg2bmh/zwl9uptPIMBWbjOWCph8QAtSUW5TcKA/KqzAT5TuLPl6wY?=
 =?us-ascii?Q?hyvdRD8+Qqjczetuz+X0zE4fKhMesRJA5HxaiVc+rgIYXi0XthY3A4tlVZHa?=
 =?us-ascii?Q?UfcGgIYko2NlFJJeYSwSwg/JC1A/qnb/jQkSwXqGJp3WOPcFzMLcD7higveR?=
 =?us-ascii?Q?nA1rOOp2FQcqPJ4ZqrsTA9vufYcvSpOUzRI2e7qFpQbjXbyStbJKE+wMEOw+?=
 =?us-ascii?Q?u8iBKGCgFyXSAAglCiTxsKKf4IuW+NcbGfifMEJoI+nztVI06I+qvQT+Txf6?=
 =?us-ascii?Q?sYjGluSRSsmG72T/tRfm1C/hTk00bmwxIxPCvhWlr9jcO9icG1WjwKNij7XH?=
 =?us-ascii?Q?ltfE2RPOcTRX79XSDKvPt1HtthyjeedGnI5mVeysvQrNAETkc5LpMzYWfbTc?=
 =?us-ascii?Q?4b3032fuSau53sAR3LF6A3rq1IhvRYfILd35mmeQP+OkaoEf8HJ0s2an98vw?=
 =?us-ascii?Q?8BCYDbwFvyVeufTallWkJi3eERwdoHTVfTgWn1Q4Yp5xVPm1SXGzlpU5C7C3?=
 =?us-ascii?Q?c1PkeUV31dNBGLOHtXFsLHSnEBsDXqeZ3vqMrtrU3Fe2Z6gTy400/xxlUWrT?=
 =?us-ascii?Q?4PvVbMOd5OCvkyknGgqCfOGYwnUzYHyojG/iBqUodwhhq1FzpVx/eJN9zvuT?=
 =?us-ascii?Q?AJLP2W7piqRuj91uqi0GetTqXuba7HDQvB3Z3+qWFoXWFAM94DQVdztVsU2x?=
 =?us-ascii?Q?fxc7WMweZC79ZhbjaT8L8lKFrFc8EeLCiOLqpPZCyYd0Gi64QHgjQ9wN2ayD?=
 =?us-ascii?Q?voVr1MDGZ27z+8yAxirsoQ+fTHJ9Ag/pIuIFVo7rwTZsAtnmcDH9znMJ0zFM?=
 =?us-ascii?Q?yi6nSxmOtc1DqhU1hkdP8hTl7hG7KjPE6g09SyGzJfOfDRRQA1VE0jbUaC9L?=
 =?us-ascii?Q?E8i1cdZMY67k35m2rNPeKCNoCjvhFlfd5fFf6vVHTpgF3uo0WsEOrrJFfrnN?=
 =?us-ascii?Q?8FiSFcAQmjhZWBFefkxy6QlhcsZ9P+qGdHnNKvSHDSGM4rKvVoCG+ywS6UXM?=
 =?us-ascii?Q?i2YVK0p1PRdSQU4BqW5k3u4nBi1qZcreJ6sNImZkdu5R5FMSAtsX4HzSlg/4?=
 =?us-ascii?Q?Z6mnhCpk9TScS5g+b9PT5ztQacoYr5AgEm7C0KgxVGstmGFCu3/b9rOgnINc?=
 =?us-ascii?Q?BIJtmBx1IZibnfv2Z9B0qdyzf6evyxw6bERldoHH5VgPW2qebTRDGcIJZXDO?=
 =?us-ascii?Q?yIY51bp1rvpaaoYv5Zq+tMhdEMUbyGIakOjr5h4/b8E7Ui0dnAE+i13VVFWp?=
 =?us-ascii?Q?44xQInJdnUDYwJIYnCAosxoziKzDWbdmY7U+O07E55LtfzNpa3av?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ff6d84-2af9-4b10-f793-08deec010341
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:42.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJk8/ViEzEXg/BE6/vIS9WoLXcdEbkZvdNV80tR5AHf6LMSQaJ4EQnsbC4/S6BfCCRotHbRqX8HEUx8tkPz0uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Choose LL interrupt positions in the common core. Always request one at
descriptor ends, at the last free slot, and before each link. Add one
every four entries when the rest of the descriptor does not fit or more
issued work follows.

Four entries is an empirically chosen coalescing interval.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Move interrupt placement policy from providers into the common core
    and even use the same four-entry progress interval for eDMA and HDMA.
    (Frank)
  - Move this patch after LL progress reclamation to keep the series
    bisectable.

 drivers/dma/dw-edma/dw-edma-core.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index d4c0be2cbaef..d28e3633a866 100644
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
@@ -250,6 +253,30 @@ static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
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
+	/*
+	 * Add periodic progress points only while this descriptor does not fit
+	 * in the current free space or more issued work follows it.
+	 */
+	if (desc->nburst - i <= free &&
+	    list_is_last(&desc->vd.node, &chan->vc.desc_issued))
+		return false;
+
+	return (chan->ll_head + 1) % DW_EDMA_LL_PROGRESS_INTERVAL == 0;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -271,7 +298,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 		dw_edma_core_ll_data(chan, &desc->burst[i],
 				     chan->ll_head, chan->cb,
-				     i == desc->nburst - 1 || free == 1);
+				     dw_edma_core_enable_ll_irq(desc, i, free));
 
 		chan->ll_head++;
 
-- 
2.51.0

