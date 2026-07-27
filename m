Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58FD4302E1;
	Mon, 27 Jul 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171824; cv=fail; b=uQXwyjR5xS2EOU6vvk7FnMmpEQM78t9VKHZ4Nxc78ut+Ali4O5RsD5HFiGh2tlMPp4HiB4W1KqBUY/OVKOj1nVak07BWq3SRzD9dQkdn6tyRcLQDS8DqNGV4Gv+3xKcXySzCCC7xJxKscwmPPsQAkW5QEsWXPCkltEoy9BqjczE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171824; c=relaxed/simple;
	bh=f3z4eTUu+uC4oi34e9ic5JWlAKWzwhZe9HeArloRszk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pvxoqygBh4S0NUFrPE10NEXJxyXojATlVsNciY6Fc2geGkjiaClpBF2zpKr/4gSP7c+NtkDZKHILNTPEnEWES3PKhn+h35p9b4T272Fca811k22SGXuH0Uz5n15BKMMw7CUW7GLi2KumOR+2uLRPnSP5P0Z9jEuWg4dIc/QwxEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=J5m3WIYI; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="J5m3WIYI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTpw0maqbrVU5QEaqkvagur1LqjPnk9Bu4zwnySlpRDO019LSuEO/84JcsX8V3YId068dZ7C2Hqx+6Qy1jiUh9nEoNs8zDJXRopfF4k5u8YN6F0Z7GFhvLAEIiJ+9+yyfS8OQQezBZYY397XSZWq5VrnRjeNRp9BxkJyIF3oBW1MBufqRasStmgDn2pAKPdxDbj0FbQ5rxPh4CiB+ONLFpC6vNXZv4akkF+sPDnrarlzYsvSVtZN9zWYrHzN4WFT8+5ZgJyjdmNjnf6rG29KW8w7uM1R6eT26cQJ0WoUy5xohVczKFf59KDqzZLKsRWswkrPDcZVNaPLvJiV95gCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SflBc5V4iyzFIINku5CH4e6OrtFZrllW5GBY/4SvH3U=;
 b=xxI+VB4TqPGoo6dkvB+J8Q27s7QOoW/gfqekcFxHoEwQZTnplcYA7UBnmElvVMiOXTFNASm4bMRMnYAW/2N7XT+P/Mb6kX7HNJxIs7ab3mqAZL3KjkThl2kdXOD6wYqExa0QFDo2ke7NOyeEpdmz4p0j1v+uo3tYFPTzlVQX4DLFsMB6z2nZEaSZasUnMyMd45ukScw6kHbo+xkIBFs3DgOzTkgIjD0Eed6kqoYrdtuNvmQNRASbvkzIH+Tcx65QuxFM3HDfskYofjdbxsk1vCEuxH9S7koEmoo9idTTve+oP8Kd2GrKIqx65ESAwEGi1SQghF6BrWGvvVGHfz6/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SflBc5V4iyzFIINku5CH4e6OrtFZrllW5GBY/4SvH3U=;
 b=J5m3WIYIqcAaO4xduwWeHh+A/U/RYqqUyFmJSlwvG0Ji51tCFNzo3wjCFtTUNV02kOjpiKquyP1zDFpGIsuaT1psMxj6yhLT5K0CRKnZ+tml2R2V4JMEI4dnYJUdi7X0kZp318SXN9YZzpk39YxwsLLlqzqiIgGnbRBS/PZd5xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:36 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:36 +0000
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
Subject: [PATCH v3 06/24] dmaengine: dw-edma: Dispatch DONE interrupts by channel request
Date: Tue, 28 Jul 2026 02:03:05 +0900
Message-ID: <20260727170323.2321369-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a53e59a-d47b-4219-29eb-08deec00ff4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	eZ4pJZ5LoimZ95opo3w9cSIaZGu41HjnfRe2AZdzv+z8OJhxRyPpCamxotIAGZjWe8uCgIxhMCZkoF1tZcp+2Je5Pi7x9wct6MTIQBRpF+9vdE5BDCDybCAgjitw0z1wLt/V+fev5KMTCrhMQjM4a30/j3yKHI+YcrIub1mD9oBfH4/YkXRrOD07GNR1cmIEoDFLlv4YeTI+EqlxImxyV/vPxXSNbxDpQq46eX8GSdCnnSRBQkvjlSDPQdKBNAjuqCcvTddt27hztCd6/+3yqXa9ArC8PHl81JsbitCqEkALyQl5bvE4cTFVf1/ZqRnkp7CtBwwKOoNNWhWVgW4JB2B2OszEJRW10iTjKOXC07jZ7kylZdOJaubpkMGkLK5s9e7Eydt6nS3tExnrNtiKsk/7XNNAcz+sV2RItBKmUdXY0xIZbBT2+lAkYpQ0FFN8xYbbxqHzWyaxKIBplOxQNeWMPg6MorsE99Quymw5MHyy6pXHg6syKHv7b3aX+mjH7hw9LhxDBN6MAnmDh3sWQAGhthnffOTqCt6fx9cTLUNQJZQozGSWwTwc/oTFCqhhT6UiJLThwSK37Zak9TXC80mFGf/K5NYzIYNRQnKgZSqlpzcFFQqb/9AaAfDY6OSzD3keWwGbxgYUlqons6LkeM3qcmlIFthZB/9hHNGUHOGb0Y7YuXeEgMdQygQcjENXIaCbpnH4WcLOXHtiX62Myw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YxAIy+wuVESp+LwYDKScsBx8i3zg/GdZBC54uDh/G80KqM6sAt4iVd+1pmPY?=
 =?us-ascii?Q?o3H13gF3DgElDQx5sHIh1tMi6VbpzPWSRGpVj7AQBAcUwJ8fQ5/O63LhDA0w?=
 =?us-ascii?Q?hyLGtuZEIReCycYoHLW3seRw6TTquFXileb/JixQqPGRzBDUSfyDOkUV6BB/?=
 =?us-ascii?Q?aklDDE5VhBlRpiTPTQCHBen0Hl3j4+bMAwi2qNCG5PpHMhqwjab/mPzf+mdu?=
 =?us-ascii?Q?3epBSdMStIBX6ZU19TR9v3Rl+6wqGOiDkFam6PqrAwzAC6bt5nC16yNTI0bf?=
 =?us-ascii?Q?GBJM1w6O7Oi4QXyzC2+PQDlDL8uQa9WHdNInTXklja/3bOxgHRBKFMIpqINw?=
 =?us-ascii?Q?xntZDLZyhcJ2Zh0KAhJcAreOFjW7l/CjuR2+iZsNqWXTe2sNOVHxRWdEgZJE?=
 =?us-ascii?Q?UgKF0zQp79WpHQ5ACC8kWyvxi7YFCZwpOgf3NC+71lKJ9NTAA93NePzT5IZY?=
 =?us-ascii?Q?Yj+eCTFShJRKJRLZgopTgzl/O0YzECAm8lNxnXasENcK5msCQtBJiqDxBEqz?=
 =?us-ascii?Q?o3kl8CuexNR0Mw6lmIU8mEs0oYicsK7eTd8phOflP/FVtdmiXjAgd72tqlQL?=
 =?us-ascii?Q?ZEZHZqPd0BXMQ4vZvPY98ip7989kEfvHGhpznbJiURThv7m5vjL5rSbP8ofh?=
 =?us-ascii?Q?WxQYPj1hnpxU515gjtQ0VekewCHMj7tPt9CRolkNFNqse4zACF2PeEz7Dn1Z?=
 =?us-ascii?Q?A8aQTzknegkMfJdrcMPme+5u9fhC7G/zT3JlBWlty0UnAytNEu3jJsU5Pt/+?=
 =?us-ascii?Q?iEnT4Xiqg0WzaV2gbki1Cgb7+DvRsmvpi7R+U5crQSSOw7mSE0rX+9RM6mzw?=
 =?us-ascii?Q?T8obVbZYz7PhPw7oMYn42hZy3LX+WnKf7OOx+wRyUxWPC5/4eADSI7kX+NgR?=
 =?us-ascii?Q?OSVKfVzvWZRz2wjXZ7K6lDftbDUU6hR2KJeyZXW2UCJGnwa9T4JpwQiSlWbF?=
 =?us-ascii?Q?Rps0GNGQBFBlbc2FKVvqFdm83HGffiFyC7kXPdGmtbk/ZTHAg0t2fp8VOs1r?=
 =?us-ascii?Q?7yH8rIEmxDAG+tbdD1Fi991IqfmAIX/DHVPGvrhbRafIS776FRh9WqRKWsCJ?=
 =?us-ascii?Q?jJKumKKjQCQN/YU37hADX7jgjTazKCKrOOprKz61YG57aANliq9RACCHXx6g?=
 =?us-ascii?Q?KFXMTjvbqrFipdGTK2Q+Y7bvvjDhyg5HpVy6sjQbMqyvXGyuDRvCB0D5POXl?=
 =?us-ascii?Q?uoPdubXam+hYz3Hj05woQs4chWcRE4wJQiex4vNdwlWPRT6k+eQ9stKyCfBh?=
 =?us-ascii?Q?QymQcGED5hPw8eMuDWCrfXLra92i7tjHkRDHgRFonxL0t8Hew3MHAh0S5Xjm?=
 =?us-ascii?Q?L//aCtfKbZz0FJiWvU7WQjc8Y7xHCMhKOr4KRzi5rO1GaB0wcOwtIncoVglj?=
 =?us-ascii?Q?nQHA0ehPU+eNASePXMpeAH7uwfSx9+oLYcvxtPNUiOPjwr49Mvfsy+uBYFPZ?=
 =?us-ascii?Q?tbfiaLYhSuXr6Lva0n9UhMGJ7XB1datQ/aK/ugYKAuyJOKd5duru8mtBUVo9?=
 =?us-ascii?Q?bfMVr2FWtX7ZG49rqI9Rqi8Acy0XIJX1G5HX8rtrw2D7UQDP1pB0VEzPUdiV?=
 =?us-ascii?Q?mn0xCGssZlrRlEL0JojoXejQkNrebSqvY5J6NWpb+LOvaHzoIuab+j04C95n?=
 =?us-ascii?Q?YmwWKLWZzG2K7+LbENyoN2x/3WvWxgXLngGUwRcWj7Vpn5eiKxUsb5kjNfKV?=
 =?us-ascii?Q?R0LJsrC+Qeh6lrQCX3QU/2BnRcs/pGXxSU769z9/d2wryU299qqZ3Ndwycmq?=
 =?us-ascii?Q?hpVex9lqDQQZuC691y9X+qBdY8ItpIPEyOf6JZ01MPBKGXM7JiLd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a53e59a-d47b-4219-29eb-08deec00ff4c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:36.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZ/a2BvJKZMgP43Uo6NEKH0O2y3oMQaOsaFsMqY9m4i/DqK2k072ykK95Km6cupy2sPEJMUzQ230IYumAnAwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Prepare for LL progress reclamation, which can complete and remove the
last issued descriptor before DONE request handling runs. STOP and PAUSE
still have state to update even when no descriptor remains.

Move the request switch outside the descriptor check, and look up a
descriptor only in the cases that need one. Keep this non-functional
reordering separate from progress accounting.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Explain that this reordering prepares for LL progress reclamation.
    (Frank)

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

