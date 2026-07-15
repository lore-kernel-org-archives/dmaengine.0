Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D04A33FD;
	Wed, 15 Jul 2026 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138278; cv=fail; b=A9mqJlbENZjQEtTgmv6m92ym1flOHAWY88kgsZfnhTr6ovm0ia91AEQQ+z2B0XntnsNjSX/uwZz74ZRkAsX5LO2oVQmpmLH//TOPqoKu4knBy5FU6v0BzppN/Ob0dZm6bvz5++v7hF8x5cRYZlsO9ceXg+nEnFe9hOqXVVakJbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138278; c=relaxed/simple;
	bh=GMhy7JwSh0QqU8Is6emhpsorYPbIPCw8YCPeurn+6ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3xzqQpPgQ8cyDuwByqOY/OsoabA2UbInTUTzN+bHXCjnkbNqLZQyR7PDLQJYbKFZNO1p5kCdtIo6x/kND5ODqTfSnd2skzzJyTCKc8cJjuXHIG6/VQHXtAZhiQfl3LdZCFviZfOmjwWUmDu4LhaNm6rbkP3JQQPQaYPc8kRrp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=QohTykIC; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="QohTykIC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsNtz8FhFnQTl8D91WMl188e60d3HHAe7q5TsDAOPV5Ef2D42lgvi11Y0IwWanNM25SadBHBwXuQWeL5v0UkASY6BGyop0jIUg/GeKx3tnNqnpdJAmXi+NYDVzfL/FvZgpifX3hgLmW/ld8W1OZZH8uPdHYLOc2w0171Z62tddq6XTQ8mTVunHCFbqBpSK96QjWkZnRhk7in/UTw1rSFQKIwY5GHAHJaYfH5UhtwRX3jzoGpX+Yi6dq9c1Cb8rfPTaRLG5L+32BlJsEjXqH3vLFkzsW1rhDP47rNcosiV3wz1Bpqn8IwqlPKZe0bFqOrnxLgnIr+POMFS6Lx+NQ71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDlV/0ErrWRNvwSqcaQxj5BJeVjGuyCeTBoi59l+Ajo=;
 b=BA0KnSPqKwG4NNEAsxHb+QJhco+TKtWSpfNVz9PlVIIwt7jS+F8E03bZEyVqTMYEcnF+c0zJyAyyIW+7IFJrn4DGgUBdMzW4Y8ChJtoYO0qUSU8hurg5TQTFc8JUpQbEelSRFl7JRCD1Rspk9mPDYJH7TZkssu5AdeI+/P2jc9Xxtk+fR5nD3R8czDMRR2KSOD/45CzbEyWTOp2V+iKGocFArKr0Y07UfkkP79ewk5BhhfupZL+daJsQ+oWBDa1CRY9y1Ygul1Qau0vBUxmKg7lSUNRquJTc05TZZnYb9e8jwwnXnRZGouVYNe8fSDaiFxe5nDTqDY2YKVL8kIX+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDlV/0ErrWRNvwSqcaQxj5BJeVjGuyCeTBoi59l+Ajo=;
 b=QohTykICuCFZAo8q/+3/dACBBAC3xGgOxmyWsRJUKyJU1SG3oCGVYybGb4eIeVXLgm00Wm/f1e/rhcTNKBcZ67F10c13d+wxRHTYKII2hCiHGLR/q/cqWR1L5zsSxYDiHQsu/IAzVsOFJ+75fNNxjEs8IcJulbTKsqokarxMOE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:47 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state checks
Date: Thu, 16 Jul 2026 02:57:36 +0900
Message-ID: <20260715175740.1110404-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e6866a-d0f6-4d52-f5c1-08dee29a9421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3ao1UtiMA3II7TKMXC1MGfEONKeTk4qQzbKf+eM8sC+HYIbecCQ2aNNwu7jOYL2KQHuICQcmAqGgpdLBy9ZWMX8YMePcx1fv4DeBHgsZloyIJi+eR+OJitK+XUALJqjPQIJZB26jkWjEb9kHordoGClLmTJb5TwBeWQzMMBnMaKnaN6AKRbmDe36hLUkMcomCdB02LNKBIRYceoEPw9c5ARswIYTlp2QuVWtXr7K4RaeoPyw2QIdX6RLgOPt2HObs8MTs01yIUuQMAPxV45RdBxtfa7G3lzdLMuZbhvHHBaTR48zb9koU14BMACBLvXyD5qFxW2UFi8f5Wdzp7BskRWMU5fhfCTYPFF7G1ODQ3zXy01VwWl8c+ODG7RNBHePLcYBQTeQ2RRD8BySN/XSY4v/EXLUmvfvxEnHWrenQotuJshWJ2bOgCFGkcnSXqxT0BSEDNz3i31BWLXfB046om18TQ/8sEIEzi4HwdQMYZGuKussBxpQxBKjMvOQa2+PYJZGZlP7rBLnO7L552kDl1ChRgndUAiMd9kVqO+uPeOcSXIICQFrN/pMbkWSouBRsbFwMBV0mDvXxiFdos3lCbFOjamiythaJRRCdj4pbr+k/aT8EN3REPQTyAYsNyjaKoRKTGx1AHccqIgqvcmM1O2l2T44YFDHxKRYQLhAQNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yjTkMv4XfIkQ83XvlGkGqwKxctX4JdNKhBLc4tL4iNVQUcJSCrfE0wQ3irqE?=
 =?us-ascii?Q?s4smzAp6lo0OUlVV/V5SO5w89ktNDG+hwIvBVgBuxVz0PFtM02sidGwYWU0T?=
 =?us-ascii?Q?Mp60yfQUaS2dV5q+VGZOdw2PvtmbW02UAO7QBQoa4/CoJ/zeDlQ3icQGKu1b?=
 =?us-ascii?Q?NL6rWfTwJ4OYqePP5b7xBPBLkFx55F2oBz3MovIdYsgyplDG1+5cIouJzhS7?=
 =?us-ascii?Q?kJhYd8p04r0276Uv7E/5afY71IXsiokZlcGsDqxrOVulNySxabgVyb5F+4Sq?=
 =?us-ascii?Q?jwO+Xt1IdiD2vSJAdeh88zgerFuUj7J1PvAZDw74C7yok90XF+P5iZgn2kFy?=
 =?us-ascii?Q?ltoWruaOt7cRirtPqGh+maV02M/R5UQWb+UuVt63qialBgqHGlKQ65c/4xnJ?=
 =?us-ascii?Q?ZmijSaw733IS1fFFgUj7VoOKOCrqZr91f/5+9SmwFmZ7bSBNvoYGiNuql4dB?=
 =?us-ascii?Q?ZVbokLFPDXYjHJcv6NETt1fWIrGZC6PzJO6k5Cfwje3JtxAlbJL4t4OBuUzD?=
 =?us-ascii?Q?eN8CgsdgbKCzC9SAR1x9C5qh1n37oCkUHmAx/YeiRIRaoIPkgRv5HoRdYiEw?=
 =?us-ascii?Q?XZW80hI/JHCb6Yb5QINKULgZSVx/bsRUr4Idm5+7XdtpWT7qPzgJRnAK2sKS?=
 =?us-ascii?Q?soVttW+coO1dtQDl1PEMQe7J6bSg0G6ijSGIYQdGNsyYNbFo2suRhHYK5tC6?=
 =?us-ascii?Q?LALujr6Hx19q/ng7sIvrNOYayiRoIn8ifqSf8qETxMtp/aiVg3IhiT7Zb/Ip?=
 =?us-ascii?Q?1jb7FVAAHj/sO5feqFR7v6TnuwVPlCBYsjZA8z5hD3Y6ojtiC7fPxX4Xfz+u?=
 =?us-ascii?Q?BCNoWK+GEguqA2M/xISQPt+5ClJouuI45Xt5lLyTyhWRRA4cJIZSkP+Uoa9n?=
 =?us-ascii?Q?BFoiZArDmerTmkKI69zNcPQtwydaVKqDezVSYztG/TGqlfYcMZckFG+oWG4i?=
 =?us-ascii?Q?/+bQFMksg1PjooFyQCxhglcxvpsa7Ut6ig9fzIN96a7tPnBXXof1tLSZUB3G?=
 =?us-ascii?Q?NfWDQgVwOCHG5obbKY7SEc7RRBl2WsTrMlLiVAfkhWUOyUyBJv1MXusHkcaA?=
 =?us-ascii?Q?PZZfXbwCHMeHml9HVLWctCegb8o0zFnVrHevQW+O7XBy7FYr01pgdRCyGphz?=
 =?us-ascii?Q?bO9QA3HAPoq7hzBK4eP6nVrZIvmgf0TMy86ftBMUJ/eCO3zPelEU2MHRocZJ?=
 =?us-ascii?Q?b+Kf2JXjjzG7naeFxV+1L4KYTfRtqXUbfaqxfiQqTKlMMNOsQY2DQTMkbdSq?=
 =?us-ascii?Q?IUdBYAjcr/FlVPHQx5pLdFw+gxH8vpIbhUAI9HaF45/44KebSGT2XOlY9ysl?=
 =?us-ascii?Q?cA6NojeNmN/qXq4R8bTh4IBsTCiv62nzKC1QOOZ+1OkwF5dMIp5lxC8/TN4j?=
 =?us-ascii?Q?C03bvQbw+OteVUU5mxFNvflh2lbafMtQgLU07IzYetKOvNSptHbRHLwcXoU1?=
 =?us-ascii?Q?CVmmBWK3M9yTxZz3zK2hnc5RXLT1VHn8WsOGbA/rHbuqq7OP4ujOs5cJNvN6?=
 =?us-ascii?Q?+ACV5O9nTzlr/81yKhYZtO7FvXAvQUhzzCXUYt/m9oEd6b5Tjlrkoho5Aa67?=
 =?us-ascii?Q?xB+JOVolX6YMoMuaNPG+rtKCiGzLf6taPRnfhKsjtt02zjqJarWYcF8J20SY?=
 =?us-ascii?Q?xNjQ8JN1AQl4qbf/VCsBGLPwv6dM4JLtJIohVdRzI3diNh2R26O2hVBhmHio?=
 =?us-ascii?Q?+sQSQpSn+Tf5XWPLNwQdHj8+mIC6/BmUoxanWktq8UHDBCkVds9hld5OqCN8?=
 =?us-ascii?Q?ovzBuzCWxqJLBqK5tmf1IkoDy8Ussay/ywPe5afYHnhTpyv9lsX6?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e6866a-d0f6-4d52-f5c1-08dee29a9421
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:47.1924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytXhLHdS5Iva/mYoOmyxaoLJWKMC5EaiAIkznaUv3e4XbmsFFN80sBXdHCs2lMPDspv/Il/wJXnjfXcz0ZotZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

pause() and resume() read and update channel state without holding vc.lock,
while the interrupt handlers update the same state under it. Take the same
lock around those state checks so that request, status, and configured stay
consistent.

For example, pause() can observe EDMA_ST_BUSY right before the interrupt
handler completes the final descriptor and moves the channel to
EDMA_ST_IDLE, and then record EDMA_REQ_PAUSE on an already idle channel. No
further interrupt will acknowledge the request, and since issue_pending()
requires EDMA_REQ_NONE, the channel is wedged for good: terminate_all()
leaves the stale request behind, so even reconfiguring the channel does not
recover it.

issue_pending() already runs under vc.lock, but it tests configured before
taking it. Move that test under the lock as well, so that the decision to
start work is made against the current value rather than one observed
before a concurrent terminate_all() deconfigured the channel.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b06b299661c0..8b0e2af734da 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -300,8 +300,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
 static int dw_edma_device_pause(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	unsigned long flags;
 	int err = 0;
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
 	if (!chan->configured)
 		err = -EPERM;
 	else if (chan->status != EDMA_ST_BUSY)
@@ -310,6 +312,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 		err = -EPERM;
 	else
 		chan->request = EDMA_REQ_PAUSE;
+	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	return err;
 }
@@ -317,8 +320,10 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 static int dw_edma_device_resume(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	unsigned long flags;
 	int err = 0;
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
 	if (!chan->configured) {
 		err = -EPERM;
 	} else if (chan->status != EDMA_ST_PAUSE) {
@@ -330,6 +335,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
 	}
+	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	return err;
 }
@@ -373,11 +379,9 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	unsigned long flags;
 
-	if (!chan->configured)
-		return;
-
 	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (vchan_issue_pending(&chan->vc) && chan->request == EDMA_REQ_NONE &&
+	if (chan->configured && vchan_issue_pending(&chan->vc) &&
+	    chan->request == EDMA_REQ_NONE &&
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
-- 
2.51.0

