Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FEB481644;
	Thu, 20 Aug 2026 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247297; cv=fail; b=KuqtxI9wNI9V1r8YK55eN3ZlUNJKVgiMORFBfRMmm/ApEJ1HZROZyF37vrTWsRD1EUB8gKYviU68lmsehHnuFhndEGhQxEvYQwjvlvwsjvQseshZVx66U23mCdyCh8nplI6LAQaXIEcm5xFj0OQ7U+ivMPBdAdV+T+9PSyxEGW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247297; c=relaxed/simple;
	bh=QS8se/Lkncoah2oqaeuMsh8HcF0caQAdnDlEwOj2nyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNssFYKmVsHbJp4rT9+gIt0T0nUJYMKdOtx02sQQkCPwMXV5LkyDkuIJJXOvsh6//+D2m0ee4u61Nu6S3a/3vTnsn5lI/MBHzeicpVHuWhBABsZhzHtMCNRgd9/AP0mefhV98atNjZK0SnJ6LDkZYAF1l5xa/Bok41YO4mF9Bbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=jLl2BGZ1; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="jLl2BGZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al3w0h4hC7gg9yeLsYEtPlYbL44Hnvygl2bYjUz2TzwkRQJXaLB3uSNfDz/e28m/LK45rgASYi8Q3lP4h7Duug8+IOxFYGASu25ixJKc/tERNzCK5WxEo3H/kjySLjGvy0TFuBOdQBhIoQyxYVzzHihe9ZgqrVqb8Hb4LPnFtUvMNiCu7OyB0tmPiI3LSWotr3w2iNAkM9ymlQxtWVgSASryYDBvEtnhYqEK3+1Q+HKCOp+jAUydiZ34xqHw9KL7Rjs9w4pEXuRXe4p/rDyAD140U1rXUyEcei6l/tbQZE3Bl8j4mE3KiJArXBfO4RppsDr5Hso1HOB7eCff34CtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHlN2mjZwI3ynL49I/ecxwCEtzQeeHqAdvoXj1fpp5s=;
 b=Oi/vxpeafMJwgZMQSameDgbJ6FHOtz0RH8PF5yGgSljhVp2DAaoYMEi/h92UeHsO6ZSSSh8m1DDyou4ClGMSBnZBIRAxw0cE78N5R+pukFhqcVH5aeZDTN84VsoFAsSElwVAaGh/qRjfIMw21Txk44PYPeDg7kSgpL9Ru1kBu1WvF4oBVlQB7trhrfGOjVpnSiP/8ah6FFef8ISRb/h7F+IFXGzpg5Cnxah92srnoAudy7ibDiqgtFsL4lagx/SIdJeRy3tLbcKNnzEWWqenyULqS27iMTUIiQEWAfpoNsg/ss2nIWeD+7hD3GImNDgUd7lhPgmSnVuNg3I0oTQrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHlN2mjZwI3ynL49I/ecxwCEtzQeeHqAdvoXj1fpp5s=;
 b=jLl2BGZ1YNMaGy2XhN19WhZPrZaq5TU1bs7PnP2OVcisB5Pdi72TKPUqxm2b17rXpKoH6eBw7+NOU7AsMpUhhCGWYST59xIpCKe9rLE/AMl0Y9KQAVc75zm9iEW/VSeo0F1MrG+EAQftNEDiWuuFqokV5KtJRRskiU5C9X9CvAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:48 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:48 +0000
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
Subject: [PATCH v6 06/10] dmaengine: dw-edma: Dispatch DONE interrupts by channel request
Date: Fri, 21 Aug 2026 02:34:35 +0900
Message-ID: <20260820173439.2004068-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:405:379::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 8073238d-2fb2-4601-2085-08defee15547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FiWVQMF4BTloI3Qf+RIcHJeYSVGkIE/2GKMTJX3BE0bQMrc3WY4rJ1G2o7OhsVtyiizbasU1vJOxqPAu+yL/NKwmsa/dVXwOKtMStXpNc3YXcaHumluXiGdVu9freIUYxawMAdD3x7K5cOXFePX2lOiyb/vgwt/suGLgu+LiQbKZQURljgBuuvjOz3sJAZn+kYSfTvd6SvuBfFT2JlQPavwUuS1ZTzyVh/kVgru5JrfwRtQxrNV7rzqyaoAaC7mhkAZ1ql3XiZhLCRRvLqwJ76xUAkfrrpAduUVjfV2Kav56SOuYDx9o9JmbTYUpzP0lLWeSvw9Jhpi+cdWULKHmEpDFS7c33Ay8uE2+E3VYgTi+rPbekwWd3cAiKS5ugd8q5ZA3O8UTX+7BZaC1+VGiCeMSNTOewsO82wEJZf2vJSD3HknSKmWb78A5RrIofJ1PQZkyLv4zGJykknELrSzKOrG3uVlRxjhhzlbXiQg+z4H22wh2i76jd1dEaD0W0D609vmLAanEzKeweGuWJUSirFw0k3/vK7FUxnXWW/fQ9YiUmpB5RfZ6uY+I7SOdRUWmQbyLlh0qr+/zJPP0lmfq3KTEE39XtlS36H8AticVqObT/LQiQ5zpUYrJZsu9vf78+5dCqunMGuL9BsQPKmFkZ5Ed19u2ATPWSUVn0iuFbvAvMg1wUwjr9ENTZm+qF/dyFKBOy66o0uizphWDtjt0pg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GFiH8lSX6oI/CNaG47/4GqjhEb2xIjf29FnwZIBGGtqvgLA+bItwi1VqkJZQ?=
 =?us-ascii?Q?HmjjOK82l9/oVDnSEC7GRnbCTjTZVIINGHhmgvEKlPoiN0xAzoXc13xhYBhF?=
 =?us-ascii?Q?MTgY/l1TbVNBbQld8wpEvxJRf49/cpGqxLlIkiPWXhXY02jC/mXYcgfhe3/K?=
 =?us-ascii?Q?BI5/pm93Xxvzyeby1kf4qlJwfCrEUUPgUASNzdvH4hP2neEUIvqOHT92io93?=
 =?us-ascii?Q?SaIHMamwursnW925lRtHr9f0fDrOAqCLaIKPOHkKxquQ34gMr/uz4Uky3Cz6?=
 =?us-ascii?Q?2DOinJ9B7AKxJPl0nSUebwWT81V/Fj16tYlzqY3zWgjlUfDxXcydFNHMc9fK?=
 =?us-ascii?Q?tIqeKrWMxw37lIg1hf6E7nQZVTNKjkL0OzfxRroS0R7hMqZtEZ9ql6l7SU5+?=
 =?us-ascii?Q?x6SGZC5O/PtUQjh/bYfovIlUl184ErKYfhpSqXlvmassm8zUZ00aIOb+RmwA?=
 =?us-ascii?Q?vM780C6ZjDsY0MRoXdu0fdpzYACiNE6UdmWv7KZ86BcRD1tUsOwq1vYi2MxP?=
 =?us-ascii?Q?Gm3ZVvPRUZrF833F9cGXw9pw06DKrN6+U7ur1ehygoJU4mWX9t4/gBKxbcWV?=
 =?us-ascii?Q?QIjDCcNyRrIEqO+dChUxptX6Sld3e+dHbC4PE8G5/Ot5reRtCiQDSqlsovJp?=
 =?us-ascii?Q?C+3TkxvLD4zD32iDi9fz6nkqokMcHoFKIGZjLD3X7L8Lu0Mp532VGvTemmCL?=
 =?us-ascii?Q?rlgEeph8O6qYVPPrQpmx3HYhxgmRtbcWi6TkA8eVkzOdOA8PhyNtNR45rfyR?=
 =?us-ascii?Q?+9cp4Q3x1tjDMk8ShGkZq3puaI0q7EHIMHYY8x5r8uSlQqGczLb5/oGgUs3c?=
 =?us-ascii?Q?YTdOT9mZ86BCICHJgWPanPwDBkHpm0Ntasv+mRXsGDnP7XQJqzeDeetZNtQa?=
 =?us-ascii?Q?qWCld9JRQNNenWmCOMy7FYWrFnc7a3/w83j/1CRusS3sVnnJLcJpIUaoVAuZ?=
 =?us-ascii?Q?YH8Lx0h4h2fGM3/b1kxsbQHqf4EaOoG8i+uGyRpPGBrgI3KSG3CZsojsRq79?=
 =?us-ascii?Q?aytAqjO2bmrAlRewM0MIcUWBe94XNIuG+Lc6S8/0x+/0aCt92jpwr6IbMlDf?=
 =?us-ascii?Q?8TLvm9x0/rKLExbsQxVgIXcp6Iw5YsdXHysT8u63YojKlgbq5ODOSBsjbvmq?=
 =?us-ascii?Q?VBXG8mBZjU74RZjgqlCAR7z04Zb17h0QOncI5nURqhc9cgm8pZwWYoH3qXMy?=
 =?us-ascii?Q?o9TCm2EK9XJaX7Rc5iJCTj54qQ9SwucY71B+UJUX7lt/PUvhd4CMr3EZZTuF?=
 =?us-ascii?Q?6FphTwG1kZfzQjqnxdbQq4nxAu+iV0mGAEy1FGU6ObS7B4KhGLIg6EScTLAW?=
 =?us-ascii?Q?XTmHUWsjgWR+czoXLElyarl7Ajv30RK0NvhZ4uy/I1ga9iQqfEmU2US2SGMA?=
 =?us-ascii?Q?9cuK0BDvgkeCz/+3cQPHP2HpfOcoKeKu2UDuT4SwICAAtFIkhyyl0E6pTRlX?=
 =?us-ascii?Q?4CvRhAZ93SMuzy2lHsDpEmxk5TR9K1/5t292NY34LN3EIx6+OTJDISUNdSHp?=
 =?us-ascii?Q?M4MZB9yDJoKYDxR5s2e22nrMzSQ4Ixu7JD9fGBLGdBF2PWiaKR3bK/OdB02u?=
 =?us-ascii?Q?KQwA2aOfw++K/Or8ShVVaBY60dW1GO/582TijuPMb3d1OeIMLbCGBH5WqzKH?=
 =?us-ascii?Q?Yc6wYjlYsHnVV/AlIJSeSBEYhBvHk/udW4cqLB3cIXWd6JRjs1RQZSDKK0Ot?=
 =?us-ascii?Q?2tPCdFsepuGjTCg4NVP/pI7YWwuGL2Q6wcTCXsiIRI7Rap4iLLLAGUgCpNX5?=
 =?us-ascii?Q?0ec+YvSgT6y+8jFvGWz/DNkABL02t1mMKDADnZZDG5H2hssU+1Pf?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8073238d-2fb2-4601-2085-08defee15547
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:48.5624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQIGtHPcdbaZJ4eZfyp8GR3LhVB/Uon6PwHzyJoSnom+gNuJ0NTJTgw3IA7aWolkGaLnU0o5R2KsG+BvmTdcFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

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
 drivers/dma/dw-edma/dw-edma-core.c | 56 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index ab8e343f0196..3c1f3f728875 100644
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

