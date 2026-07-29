Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FF1ACEDE;
	Wed, 29 Jul 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335455; cv=fail; b=gGc4elNxkMClFiTKSVOvX05OQnvrUId+OqKtyvnF46T7j7UBKw6TMeuM8AMf6ZjdZma2xenPfc+2qHck20JTjMtdCBbO9XQLzRhM3pQ8zdGOMI70kO3qq5C27VR7qHA0qpsA/oLqNkXYxZ96R5wfGfvofe2D9dOs0giV9a8HSw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335455; c=relaxed/simple;
	bh=Zdpr4LnbwJIvz4MNgle0TfUjqGauNOMMAtwJ1kf2as0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4PWtNsHnuNivonEbcL730hoV4rZefo16aILdN68WN+ynw6BoSyxVkN9kKjpFqRoIIaFggk6vgUv9gMarwWGTgiqvq8ygairSzLmWEp3UwvCsP1YERclwfd6gioiENJNs2Nx4/RNcued8u+hgmPps0SJjK7FwDN7KBBUeNRNTEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=M5EpgdK9; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="M5EpgdK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5snzSC+70Q2fmmyOBAleyUK0BuLrVGPBSSVzmY1E2HRmG08Mns55LreUPWW6ISh8S2FGX/AVyD0mo+bsIcuUtK5Q460ypglfdcnXZqL2ofQQNZKLXt8o6HrY9viZGQPOwUXNIgzHuDqZdPtEzcEOzYzo8XhQPkRdt6d94gVm0h48dDdKwj5ZPnX/3U8I4CxHOAXNOzgee4XHpGUIvBwTuxjUwUgV5kYCT+WdsNNmGgD3SKAwlvborBWCQCF3Z9XTyNfCfWTuLDqIiI763ed2B0hNjmV2YKWWRGz2wLGuvjGw9Ob525XBIalStfEbjA7w4S58U2xnTlS1F1Ofbq/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lh1QwVyb/wYHxfjk6oCikKGoE6aK/pffdoUqs5kx+g=;
 b=BbhjBEM4B+9L12GWViBSGf1wE+nQmQ4AE6Gh1NCC+6iSn8HraG/uvviBe4rfb8S7LOTIbRcY62IrQpMY5cSHLAhYXqpTeVc8Tks6aod0w5/PESXD5haeoOyb8OvoQfqA9X4ssua4d3hnlvBjsR3JB90yJUQ7JCfUmJRmfUbLky0c+pHB9nZWzP2IgDbclTQzDlHemkIOC8YVLyIvKNPK2HJfWTtGlVS+kiN38n4PUEmjmrsdZZRWv4FJxaJNe4lXHMNSo/bjOGF4MYkq8qSf6+QuIcXqGGK5sQKOGx/JJ0wlrglVU+s5a1iPIrSexWBE8CzUeAkWn8mqk/01c7lERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lh1QwVyb/wYHxfjk6oCikKGoE6aK/pffdoUqs5kx+g=;
 b=M5EpgdK9h7cb01Lasqnryfnq6n/gOH66l+8Pu41n5vLiaIBPioLcM6qY1n8Sj27c7Lg296djocpO5n7//FZRqgoxfvWts7I5m4wtj9KzlXGS08hdc8HBXXyfs977tD2omyBcuT1/IoJpg3AbXL6sItbJFik17a+e9L2rLCpLAXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:46 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:46 +0000
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
Subject: [PATCH v4 06/24] dmaengine: dw-edma: Dispatch DONE interrupts by channel request
Date: Wed, 29 Jul 2026 23:30:18 +0900
Message-ID: <20260729143036.3087722-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0096.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 55488d7b-a40d-4103-4b34-08deed7dfa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CJDdmq5vcxACTaNeew14a5G+QIDtTxW25nAt1oyz0Ge0Auldmhfn1RK/U06Ww3UYzjfqJ2sx5NduwRTjtvQaY6NVSk/zNOaj+8zDAHPpho98d+KiP+JKkW+ilJtCANGgk8A7l89l0UctOUpATMrXA4f8K/KWdqr4LEV/ZKTVCYB6GqVReIy2cMGfKO7uVQqtYlQvIZ9u4BSvKISLGqSh9fAu65+3RsWVH4hlrYPL0vL7yo3WIh8VdU0Z+NVexVjDnQnw9byMAzWmnjJZMKKLO72g5hYUwXfrvqU4xjZgIdhYIMo75cjtgJ8JQdn1PTIerPkJg7qBmZEVAbBM0ceNyb096+9r7CVf+oWUxBOaEDTxjMLDaPILZ0prYr3a2hAYyt4oFNKnGeGFh6abHs8QTgtJSnioarA1+fuN3wM1GOVr4wt+JOgnt73FabJaduVH8WwtSEGHjzdo3e+dsctq4dKPTfQDJi4V7hn4LaTqS5WyoPYZlQfnPU/LIB4ANn2QLux5yOva2quOiD7ptoqp/ha3/Pitwh23wHPps3FWdyoNFlJmqbUAfW8UdETpsHP8xK2bt1mZa9HZLNtFq0xoMUEoB5wocl8nBZ3wjKPmaZYPMdaE47cwQlUwzQDGu/Nk7LBYwuN46cmpLJREurpKkwcpKvCvuUOcYdsggUhfK3Uxsjiq4LfpdLHE2XRhJNDRLT4ltovTzMMj8f9l2TlrDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oA+REX5UEiIKxQVPeCfk7ukEiYnHX8JUbwJfjSYpTrmabXjURlQlxY5X/y1W?=
 =?us-ascii?Q?XFfVFwhpVSyh1ApoSfGvwku2ijhzXEJi14MbaIh57n/YrzPsqh9tWiI5As2K?=
 =?us-ascii?Q?y/RppB/tL6qIexmgNE8HhyR8EsJ9lcB48wjiU1oqDDD2+/8jVqwKmVDvQulb?=
 =?us-ascii?Q?cx+XPaakfAdIrzTfoW1QbPJHvZodT/CQISFUGvAl+WJqD1bYOv6mr0fDDDsY?=
 =?us-ascii?Q?4k+hH5V9mPnLrtzfapOt56Iv/UoXVipcFyhJTS2r5uE5R4etPO3Ot1cYLuXW?=
 =?us-ascii?Q?gadl0BGO2aGodXPs0mgrN5eycvXI+ZN3XN+OcNnx39ShpXh1GcBH/8XMFnts?=
 =?us-ascii?Q?o6Qhj/y7g31OEAXgAzXdl2RUVe74Qpg0UMQm2Czs35fNVp4a882WVnvLcM1Z?=
 =?us-ascii?Q?tFYSykKwkH0b6xcHkIVKxqjSChrmABmj85m311m47CezZYhWyR9icXa20/4X?=
 =?us-ascii?Q?thv5cNIsRGO+Z2SreVEWFX3yNEH6BCnXukZnSoPpsse1/k4l+4FgXJAG1FxD?=
 =?us-ascii?Q?tqkCVNSbkfr/NiAG6uSmgZthqMnS2Y+JmTIPZV47VNGR/Cy8srGPQ1Qz6sVJ?=
 =?us-ascii?Q?rJLFxwQJ8v0yTDzRmXcy3rixbFRmBL6SRcmd7NcKHvaWokCdrtxqhtT1ueQE?=
 =?us-ascii?Q?VMeeczsSzlqyaoB55ln2uwLHaUZV9eZKX5v3WFkDMiOoY72mPK3xjjNDFS9Z?=
 =?us-ascii?Q?vRUe9ZuBslBRqq+kseDVIykKj/WitwsucNQ74lgVTYaMRl46/4WXdjO69dqb?=
 =?us-ascii?Q?zHWepsncrw7eLkk8nk9gUEcNV0ui/F5CuuEIwYcfrjsZUblrzXkliO46q+XU?=
 =?us-ascii?Q?p08V7y2YI8wBJrvfYAHgTv5KiTcB6192xPEYJ9E2LOjjhxbVdDqogpaadO4F?=
 =?us-ascii?Q?893nQ+ZUJWoWd2lz5qB/2+SCEH/VGi372c/FMKXFw3D1B1BOX7SbrbE1fXBk?=
 =?us-ascii?Q?e3sbpdWl0TE+fctt3sLb2tuoawP/P+ih51FbQntOMuh6W7Os44cIBekiA9hW?=
 =?us-ascii?Q?t9DNzzVMdTkXpxeqBwOYZlFUwXzHDhCs7bV0ttvh7wSUG5gBX1klxU8EGs2B?=
 =?us-ascii?Q?D4WN3pDrrDhz9otGSuCgEUmF0cHb9Kz8UcKq9oPw0zxx7aFM/CdehuDWiIDo?=
 =?us-ascii?Q?NtoQf7M7+dA3vYetM9sjBNAt8q+daczfWkHTJVc5UlUfkyihRjdE67cQYZjz?=
 =?us-ascii?Q?Gjl9Hfz+1Fgxfb8dWyU+mszuuKkoKfh1kO1X2nfuMMVnp8naUm7Pr26gUQG+?=
 =?us-ascii?Q?vsfCdRrpU5wfZQhs3e5c82XozwwiBhdB70I4YIm0LL8H8oQvIXhgPzH0IRiA?=
 =?us-ascii?Q?ZWCtWRbWkB3aHLmty4OzCgbyAjqpNeTjjtKtrW+MK8KfmlQQkI/jE5+277c3?=
 =?us-ascii?Q?cyH3hgKIi57N90RyutIbStvQucUrPZTG3QpxnCA4dqw/h6+aeAXJ6C17AP65?=
 =?us-ascii?Q?3F3rFOJopbWM4w28X16NuGkgZqweIrMS+7FfxgVNYRX/Wa1h1atM02fDav9u?=
 =?us-ascii?Q?A+YYVbz7F9XEMvM/DPSyugFio+DRD6B8Np/XxkHfvh0GU12XKNKeByggl0kP?=
 =?us-ascii?Q?087LUWNFi6QAmZN5AcVdb108mCjGzj/G95AIGPO6Bc82QN5yc6ZTXFclHWJP?=
 =?us-ascii?Q?yf8Sk0jVYN+HYcBNVuWU+NxRfMRPKorxBsGkm8AHlPRO6Hq7NKYE/9AH4pLL?=
 =?us-ascii?Q?4mM98DOcdpQJayS9VLT8vN72Ak6fQ3dAlGb6wTDmCGorrXv+PjwqAwZ4dYpn?=
 =?us-ascii?Q?7U4E/p11DqgdAruIEhrEFM0aWt04iX994mio2ouAclKh3FeB+Ys8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 55488d7b-a40d-4103-4b34-08deed7dfa71
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:46.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBOdMfOF8TP81hVHsVnJiMp+eOHL/hXUuWQE62HGlYNnrkZ1MOs+Q9zJOV5kTWvbyjUq2KnUN8taJIti6RdkTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

Prepare for a later patch that reclaims LL progress before request handling
and can remove the last issued descriptor. Move the request switch outside
the common descriptor check.

Keep the existing per-request descriptor checks for now. That later patch
removes them when STOP/PAUSE handling becomes independent of the descriptor
list.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Clarify that descriptor-independent STOP/PAUSE handling is added with
    LL progress reclamation later, not by this prep patch. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 56 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 6e7d1f7c20f9..b419ff2becf9 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -697,39 +697,41 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
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
-					chan->ll_done = chan->ll_head;
-			}
+	switch (chan->request) {
+	case EDMA_REQ_NONE:
+	case EDMA_REQ_PAUSE:
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
+			break;
 
-			if (chan->request == EDMA_REQ_PAUSE) {
-				chan->request = EDMA_REQ_NONE;
-				chan->status = EDMA_ST_PAUSE;
-				break;
-			}
+		desc = vd2dw_edma_desc(vd);
+		if (desc->start_burst >= desc->nburst) {
+			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
+			list_del(&vd->node);
+			vchan_cookie_complete(vd);
+			if (!chan->non_ll)
+				chan->ll_done = chan->ll_head;
+		}
 
-			/* Continue transferring if there are remaining chunks or issued requests.
-			 */
-			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+		if (chan->request == EDMA_REQ_PAUSE) {
+			chan->request = EDMA_REQ_NONE;
+			chan->status = EDMA_ST_PAUSE;
 			break;
+		}
 
-		case EDMA_REQ_STOP:
-			dw_edma_finish_termination(chan);
-			break;
+		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+		break;
 
-		default:
+	case EDMA_REQ_STOP:
+		vd = vchan_next_desc(&chan->vc);
+		if (!vd)
 			break;
-		}
+
+		dw_edma_finish_termination(chan);
+		break;
+
+	default:
+		break;
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
-- 
2.51.0

