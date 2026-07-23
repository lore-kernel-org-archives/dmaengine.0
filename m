Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94440DB30;
	Thu, 23 Jul 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796133; cv=fail; b=CBMOzmew5LVCRkcHhJeTtIResuiiVeze2C9mdJqDTvIY83jFgGuEdSYLxKiFIQBvmIjY6fTQl6lZzI7afaLycNohr8iG3dPDOO1U2PbIptU58Z7hwqyHvQB+8LqAiPyKGyVTORgK1BsP137vYKzO7DLXHl7AtcWWZYxC0cNB+jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796133; c=relaxed/simple;
	bh=d2YxuU2+QLYPBsmU63r3yG8n5nT7+aJPBwS34VosyPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XQbwmukrc8gl13yOt8CHqTfJ1DRr2JpTc511vnnBSjdjjfL8kTLTvWYPVwJc3ZWnytc+qsBGzwf/4qAx957DtzgZMbL8xDi2gDGw+lKwKd6A2ZUZSsTsu//xSpm6w+QocqNkNK8xqHXEZzr9KbkQfy0H+In++UzdUbUWRfrqeqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=l2migA7g; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="l2migA7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVrqBBvF42so1u6eXLJaitTkDdhwWW7mBS57i8MP0FZwYWKXlpPNgD02OSbHWe1ZyF52vMJTQpRKfqaVCZX0hV7sO1wbhcAXPL/3ghva2RJu7hOCilavhdQehC9IGRJGjLhweaOs9BGlo8YXjzdRdpXfIHP4z+/3pSy+gyEnlVYowKToewDLmY1ADF3ZOwjtJPG/DpygfZdRbgPAcm5BAwnHhyA+2of6eWwPDOJ5eF1yQ7N08J4anKmMjDDubELLq82n8fVgXqbbj4lE3ARB+INiwCZX8G2++KcZVzXTstjY/jEGwsKkr4UyNmARHNAAzJXA3q99QRPGyYm/eocW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmEeJ+1AWdvlC3B5QSJNYAdrLyvtbClazpYXr2dqoQw=;
 b=j/XcrOeertOGK1tu9zJC7IX3ctJ3TEtcoGF8cYY/lQ9/R2Y5gCTUImNzKhvZt/AJ9ChXjdpBWdetDcXOBaXfytCqxDMOut99CMllPgHaR5rJGU4CX+ubukId99Px3sl+wUKoZBmj08lCj18k/Ope9Hg+mXLZoNxVjoPX0S3b4aAOET2fiNMZk5W8QBOExrtuxz3bbNIA2fORnosWT3zTgmUN03fA6ejs8yVPZna/ZN5rSkMn9gS2rMN+SG3Dlg8v2PgWWKB0zGIYXYGWVxQVhKlAKlmqyY3etLrBN5bEJMEI7hOagqxdsHAgSKiRlTNvIyewTn1A9kz2AHnmn4ttcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmEeJ+1AWdvlC3B5QSJNYAdrLyvtbClazpYXr2dqoQw=;
 b=l2migA7gALou1C8JLYO8oW1Y+IrOeENjq4Jgk/QRlUNT35Iu7kLJZZnyF1OrmF82DHfrHFuKS3j/KjtMxPQMnlAx5rU5LD0nNGVVL9G2YrYvge8RMJZz3RB7WF6e134QITvlh/Er4udp2FeQzRN93ic6Z9flCSgisTknc9VC6Ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:02 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:02 +0000
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
Subject: [PATCH v2 07/19] dmaengine: dw-edma: Dispatch DONE interrupts by channel request
Date: Thu, 23 Jul 2026 17:41:38 +0900
Message-ID: <20260723084150.521366-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 72260a52-1eef-42db-7465-08dee8964428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hqRuLhK1JNTbHy3qSQTSOxC3sRpzx+/RuwjIG2wV+wpWOGTO81J+DNXTuRt6+V5ec3rC6bdfCPJhaSIT0u4oMA/Jx4+60D+TRpZ2f0+w8K0lSiAs9YOEWi15Oag27V2G01HPfLCI9sLaSpgejcK3XfqyomTbJOSVCwwz/s2aNcQFOgVQemK1VqNQ39kaCkHhliOUtuhxxYTaaOFN3q5dJCuPDk+leNFJWrXchIJT/eKxxdTlnX/mVsn6iyAvSDgho+JfCCYdYgXwjXPZa7IditRY5CuSAPHSyncUaad2/OwrdJ8tRhYxPNGUv6okLzhIz3SfUnWfXAYq5afolXiX+fQELMHM2UUeRTHZ4ObHM8egTUYmVrJl95elksTzNQe+3aeqgqjmU4048Lq7S7pZD2Lbt2ELvwP3Fl4Ls6x209JN3VefGQIOUC0R3O7yFi3Nb1HqTQl6q/eVK4kIoCHoeO8nRt84ZnAEm0FV8ighCpTAmpmtw3aE39oP4zGvlvpxiIvCttLHfnTfKvR5cXnj6O0HOIuGahYdBR1h0qdEKfZwkWxKCKVaFf/OkS9qXiZxe6HpmYTzJ1OzMaOS0WlmOv6oDv5FfqMoo0FW8Zxp2Gen0xK+Tyw6el1DQlLqjYM2umRWY1AtDLjpM37H6IpHHYrJmes3FtwaglSiKeWUeyRRjlwfMBxRaLR+e7ADRPYi1+y1O+0gaBexjzOMl5/srg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9yRyg2rHxlF8g4IoHTgJ17WUXMq3VAfqsJ4Gf2YH+qnZgAgy/sskqA6NWPvI?=
 =?us-ascii?Q?oMZpGVydnD/UMhs2Z75NF4mjlhlhfev1OO5Y0ZGsn7HiFfwf3fzreJYxYUES?=
 =?us-ascii?Q?cojbYbQcXjXfkiqWXXpPZYQ/R4ARrCNrKclw8Bkb+2kmIANSDSCWQNVRZLrI?=
 =?us-ascii?Q?3HqcfbO2eSGYJ8wfY8XRTaUPaF4dFEYFXPtLeZM0qmFk4qdZvbQt7ZjGE/ZO?=
 =?us-ascii?Q?ZCTWx/M8hvwOc9c8SujqbHEKrM3VkRxCS8dI4A8CFPrTpnG12wi9gLxC2Axr?=
 =?us-ascii?Q?HhS0dAYKRR7uP7x0PSEwnxcnrLDVTy/q5iej5V1IsG3rcmgRXqBE9S0i8QL8?=
 =?us-ascii?Q?/K5YN9Fsv8VCf667H4r4pcBMBin+6xykZ5OovsJ9DNeRRSP2Xw/Xnc9yzMoT?=
 =?us-ascii?Q?Ch3wkXb6aiBDOOuglK5KUGwv66kWhtYNgUkfiBFCt8URMpQTkSn8I2vyi5Kz?=
 =?us-ascii?Q?v3ETMY+kNkd8aiM42mU41O1usWI0CY/s61mq8Q6opkLzoMJtTCevMcsf4fV3?=
 =?us-ascii?Q?oQOurabmfqtZa9oTe+tAj+wmgax5E9Kxy0k3QyBPsZzQR/J5unRrY5ZGkwf5?=
 =?us-ascii?Q?ltzGK1ppJsyOLI9davCnYFogfz783TYTSg+lLXoBVccBARYPvCkURqn6SJ4Y?=
 =?us-ascii?Q?B1f95DVkAVLxiHjxMcBF9l4TEiaputBIUXkWOW4gu+n3Np1Y3FYXbgfcgo97?=
 =?us-ascii?Q?QxqgX8EZfIlHJdlNQ3WFXSHglDYxtX6a59holoHYu/aILjtD6obq7ZoixCkz?=
 =?us-ascii?Q?wCc/v3YpTxA33W44NUIuQ0Kf4mdSrL6cxgZXC5k/7AiTnPpFggEt3lm2JlhK?=
 =?us-ascii?Q?JeyxC/9PG9+UGE7RzLpxJKQnaMJvRCMwe01zzRIRv3duQxYr4XXrwBEXK3cZ?=
 =?us-ascii?Q?M2oIM6ODDymnHUml7aXZPnVG65tR2ULqCoKV/UuF/MLa3vbW0t03WewlZfGa?=
 =?us-ascii?Q?j9ZFzyJPYr+76AGuimF7KFHSXQUFkw8bJgka4haBBMQykxC7lA+RIOaCtBaU?=
 =?us-ascii?Q?8A8fkHhOYurzGOGfWp+Kna8jLf3IbJaXPd40FVedDg1Z2yTlBDW1i+Z79qdk?=
 =?us-ascii?Q?LgI3LovBfOl8lXKnVswR5UMy5a0vMUh6+w3WhxMF826GnFbHbsIF65x1X0Lr?=
 =?us-ascii?Q?+HmzvP2dgBj8sp5R/rze2JlB3brOKRRZFzvJhMYmG/1NWD2fpAy3PZeI/CCN?=
 =?us-ascii?Q?oQ71pdUkrTqhxXklPlwI8q7M8g4GvbuZ0V68H5tcaYkGYs9Uq1IBtb0ioJZf?=
 =?us-ascii?Q?p12FY0SuyPkecSQjsL0HvB985L83vfj4f6MNG5omMu8ctpcvs2R11FnCXnl4?=
 =?us-ascii?Q?Bat6ttRWgCB3iaIixA+BFSxzXOHfIOG5uYZaC5bomVKzZVZC67r0vzRgbs79?=
 =?us-ascii?Q?ZPTd21S2ZkVjo8rXGE9POd+Nw0pAwnS8FQJncOocFUwfBCUUA4siwikamUOr?=
 =?us-ascii?Q?Zl4/sclddCyKyQ6yCLz0PqUfyS6tdoAqikNpq1P+dXfqvEKkx7mV22Rcs/qm?=
 =?us-ascii?Q?65ib3QDVNA1USP7oaE68/Xb8oT7hM3yk7a/a9Kjgg0K8kFvG6Lv0/fug8I8v?=
 =?us-ascii?Q?ymHRZw6wfCHU0KVGzPS0ZshpvPWuqyOx6dF2LDAG6Dy8Vny5pcgmYpflAFJl?=
 =?us-ascii?Q?qSb9N0UwgRsa2Zomd8ljMr79jHVuTIuyfd0RA1NvonHuLNBT1OpM4pWbmfX5?=
 =?us-ascii?Q?kGtvCwJdhcCzWnJKSEhciZE4/dxeJn5rEOyCK1cKjdGMuuNwNsH3p5TYqfmj?=
 =?us-ascii?Q?yr10DNljpDkWeTOJbsxkRzZaf6vMBJXH+NxfHxCh/VT4XIN+7VKf?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 72260a52-1eef-42db-7465-08dee8964428
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:02.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DF8wJF3UOpbWgQTzkPylsXEcrFWj3/ugZF4+6lzam4laM8KnIwDJN8YNmmwpnwADtD8Z4CN5f0Nzlg/fkHN/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Handle the channel request first in the DONE interrupt path, then look
at the issued descriptor list only in the cases that need it.

This keeps the existing behavior, including the current STOP and PAUSE
handling when no issued descriptor is present.

No functional change intended.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Limit this patch to request dispatch with no functional change;
    move LL progress and empty-issued-list handling to later patches.

 drivers/dma/dw-edma/dw-edma-core.c | 60 +++++++++++++++---------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 29f78405e9fb..fa104af4146e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -682,41 +682,43 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		return;
 	}
 
-	vd = vchan_next_desc(&chan->vc);
-	if (vd) {
-		switch (chan->request) {
-		case EDMA_REQ_NONE:
-		case EDMA_REQ_PAUSE:
-			desc = vd2dw_edma_desc(vd);
-			if (desc->start_burst >= desc->nburst) {
-				dw_hdma_set_callback_result(vd,
-							    DMA_TRANS_NOERROR);
-				list_del(&vd->node);
-				vchan_cookie_complete(vd);
-				if (!chan->non_ll)
-					chan->ll_end = chan->ll_head;
-			}
-
-			if (chan->request == EDMA_REQ_PAUSE) {
-				chan->request = EDMA_REQ_NONE;
-				chan->status = EDMA_ST_PAUSE;
-				break;
-			}
-
-			/* Continue transferring if there are remaining chunks or issued requests.
-			 */
-			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+	switch (chan->request) {
+	case EDMA_REQ_NONE:
+	case EDMA_REQ_PAUSE:
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
 			break;
 
-		case EDMA_REQ_STOP:
-			dw_edma_terminate_all_descs(chan);
+		desc = vd2dw_edma_desc(vd);
+		if (desc->start_burst >= desc->nburst) {
+			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
+			list_del(&vd->node);
+			vchan_cookie_complete(vd);
+			if (!chan->non_ll)
+				chan->ll_end = chan->ll_head;
+		}
+
+		if (chan->request == EDMA_REQ_PAUSE) {
 			chan->request = EDMA_REQ_NONE;
-			chan->status = EDMA_ST_IDLE;
+			chan->status = EDMA_ST_PAUSE;
 			break;
+		}
 
-		default:
+		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+		break;
+
+	case EDMA_REQ_STOP:
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
 			break;
-		}
+
+		dw_edma_terminate_all_descs(chan);
+		chan->request = EDMA_REQ_NONE;
+		chan->status = EDMA_ST_IDLE;
+		break;
+
+	default:
+		break;
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
-- 
2.51.0

