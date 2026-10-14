Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E15172D3;
	Wed, 14 Oct 2026 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989632; cv=fail; b=c3/xOxdXm3znJWPkxXr8LNnFCPBh6oxuHuS2RhCficYReayJq3nbzIRHLL6zaUW5tUKM+GyTnIE6dY2G53bv1uO9ohaaxk/1Ii9o6HtVq3IujFwl+tS/DMeTfdVFXByRYHYaVKz7BOhpu15KtSbef0sJB8gf+ica8I+NsKUIaH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989632; c=relaxed/simple;
	bh=fv3n4MUMP7RhEOL1Q7vQrcsthC7LauXXZyvPaLdqPRM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Dw2vsj7L1pC08+zk1MzbvBGO1z0LDXX0iUzeuK327LqPzByewy2KJ66pf1rMQMC5dcIlhm1o1awuCSDld3dBn5Xpty9XDH5HxmWXOT1Koz3l574ofSkLJSAC0ziB6t5w5tgOe9U3bTCu7SaCT0pHZeUUyzJ084AI7SVtnYzM1VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vaqX1nHo; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vaqX1nHo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBvJ+vzdId88VtIB1alqz4BgZKqJOR+hD9CaNrSy0oU3WSRdZSRoXf8dHAYrh4oF1D1QCLZaXee4quwnS9WXjOJj/6CyglP7waqLCaSaa78t4ipxuSneVymKn/Xr/cNanzzZZ41VXxpwywovft9FP9GCh7nJ+J56cxeknIwSm28NXadiOGx8Wa61uwgflOegTYQ/7vTWhVczO1uI2jWyHBEcEx6jrwu7N2XbxnkrCVnKt6s7Jv+2crPrYuE7PMdwMnAOl3uIGeagx2/K3oQhWLdKbV8o3IVjB1isrPosOPDcK1ttilEvVydgjRhbsGrRAypQJuC8xEJVPDRoAuwCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTt4PT9BPvdHWTIC76KTMmzz681/IhtCMV7AxDGCRtk=;
 b=ebENIeYt9wA57KYWRuARORrJqmbG0nsAeG62lANrw83jdi8NhYdNoXEsFqgm6DJ0hhbPV9vMJaRkouZMWUSpAfG7Y6lYNCWhtoLMb7jehLmFFlkngXJrd874hz9UeGR/eBT6TIi3iHw7CLDiXhv0f0sUwZFV12M6m985rFInGtcxdADec1nr4cXpcQG9+Jjnbs0FRJ82OKFwadBinksGIda47dieOl6rzkKypIPMKWKfK0rfTVJh9Rc07/vojmvfXDQotOV7iqlmnvaZLP7/jUE9Ht/W5Rqr+iBIcnlzlP9h9VBUjM+JzTQRZHMQDttpZeAmKOBltn3czWlrvUFOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTt4PT9BPvdHWTIC76KTMmzz681/IhtCMV7AxDGCRtk=;
 b=vaqX1nHoyVVYcItrT8bseGHCcl/5TaCTUf1dLeZcxAQLeisxNE/OwltHC9ZkpFwVLMWrSaj6ARutq3orc7fICy2U/lM+qEncGanV6HJGxa7H8iOZAP6qY4Ml2tqo0O3tCY8Ojtl+sBQuYsdQNoivvNDv1GT9KqTkgW/siPN+xsosri33UW+HmeKRsQ7mYmqjkup7vDB0ejTll01fxsDvaQih2vcg9WvqMdhoCiaR3ngNbuPInawxK5248ayS9X71S7g2MkQlcPiSS+gyeRo2+hhkV35YQNiC3TogaE0XHKwfTl02OBSvlmYl9G1yMAA73x0lGhd+G4Hgf9cDIxQAPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB757610.eurprd04.prod.outlook.com (2603:10a6:290:e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:53:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:53:41 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dmaengine: dmatest: use dmaengine_submit() and dmaengine_desc_set_callback()
Date: Wed, 14 Oct 2026 10:53:33 -0400
Message-ID: <20261014145334.1449465-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:930:d0::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB757610:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9bb648-2c68-48fc-d83e-08df2a02ef95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AEoWXLOZ1eU7MS0L1mA9evTpKVUt8STZgx/F9LRqKUYGHyZ7RUNO+OuLUNO+todRIe3OCzs/cDkUZS4pi667iL9HfXtXIgw/l8Ub+jd8UZb5KRGrdz93xeZAhIi+F2bQFFU8uv1L1GLKDThM5T16rZJi2eqYqVgfms8CdSObJhwHeI5ublGy65vCUNz1jj2Xx2DDJRWlz9xVfDeVN9anSUGKIzKP+H31psK7jGJHhD9FUbNf4QcAwlh/T6pyYAYxpv8TUMoZZbm/iJxBSbiHC/4sghQhO3jOLTOFG4UFVqNZqKbgHbuZ6dnEO007gWlecTwD+7YGESPSjf63rSaCySkOuY3IVn6bofXKDWg9PGkFd0PgCEepi6jvDnVEwqKvFzPzU1H7JFqIvg8p9wSJrq6r0TPHLisUyVc4+vkHRd3oD5Kc3fHCdLjzt+0Np6xOKlWSjyrDAIoj2Tr+FchZNhZ/tdRE+zSCwV6pb7rfP4/ffsDy5D+MywrDWeATE6djqdNQybDu5iJAzGz/rMWBR+3PXpoY5YHZNsywupS1TNyZ0YEbfSero+zgcVKSRG843jwV9hCvIQ77Km78FPXulVKKa+ySiQSiqxQeqH3Vv1QyEJRuKwbOZPNKR8yKy6P/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E4MXOWuaKE4FAQNoy7vzhd4sYUUeUJoD25giem4PuNCOX/enjXZicJW7xm0p?=
 =?us-ascii?Q?H/EGCbGGkP8VTgWfTWb7lj7DhMe1yzS94CbKs8EcucPIiW6uMywnZxwrEiAc?=
 =?us-ascii?Q?Lduw7UnsXyS0HJrih5LpMg+bFCKGCCtTDIdCrxfZGzDik95/qoz5I5dZlFTG?=
 =?us-ascii?Q?GcxlJlskXyQlI7n8ho7PAURXfMbf2rVwcF7Md968i4bUuQrpcx6GtBBSZXI5?=
 =?us-ascii?Q?ffLY0pCawB/8gAlzxUdw03Qf22t+upyqJrRJrFPAguujGfETvzGZSE1DJ+jM?=
 =?us-ascii?Q?FvA3KwkhdH7N0jdDVcMTniJtY/QlVbwIW3VoblIQF9SuzCaG4PUK27f6CiLL?=
 =?us-ascii?Q?XQRsFV1h2m9yj3qY032XWcRSLxFGroesWXr1F84XXxtRER8N7Kt/udx8Cqb5?=
 =?us-ascii?Q?8jEqdZ5XGdd332Xhco4580y9kTlllS9sWs3GqsXQ9pglDsJx3N2D66M7Sh6A?=
 =?us-ascii?Q?do1hzrt1W7uX58L8lJGpGQSOmaoC33JGPj4aJktqXBG8a1R8xjLXGc3XjEbt?=
 =?us-ascii?Q?dZsIInm+rftB/dthgGtKwZTH/vysvXXv89zuDXaw37GOu7VLlk9LcPvZaci4?=
 =?us-ascii?Q?KCKBiaN75PmMFd7Ao75rkpyX40TkJhM9dhodS3nd4KzENBkuTNqDG1zuxg4c?=
 =?us-ascii?Q?XXyjh1vXQbWriZhzoMmSUJW6lrIyPUFItlZUjuFMe2nhGawAjrRTh3wCSHPc?=
 =?us-ascii?Q?nMiktRA+wpi/d0AXhp+HyH8PWoJa+WcIZqFFed+phYmzNnnsDI+a4L2kszTv?=
 =?us-ascii?Q?307hEZJEamriFs8QyjZwc/SGm8XgnprERDAZgtduOQRsHaNZM16h27UdmnI8?=
 =?us-ascii?Q?WHIKcwUbS1Oqc0ZFSwdDngAYh1pNDgrFPFFQi/w2plLoziC2f/QC4d+mf9mI?=
 =?us-ascii?Q?pRqXTNEuoN077esvirRHZm4NgkunHKPMpRv6eBX+p3HNZWvGIjOVQG6hwJfT?=
 =?us-ascii?Q?vhZ8zuhbUZf2wqwmcIkZ60dD6uv00zAqJ0VP2PSSoLk1r5INBHaUT9FJABPK?=
 =?us-ascii?Q?L473wmp0Uj8jxy2eoS1lVwqPyI5zd5gLA7x0lZFg9q3C19ExFcsiAQ8w3Lwj?=
 =?us-ascii?Q?DEs37VQ8gN4Ehx+ybPMqltsEuULmKC7c3HCylCuMy0dS/nBTp/ZLpkl9U5I8?=
 =?us-ascii?Q?2Sm0TZ2dYzg8lQibKspPbtePg4pEmHWjGcaWGr4Azr9W6lKFjfUNzPf32gSM?=
 =?us-ascii?Q?iCg+PsdhprnLjcHwI8A4b7nbc+/uYaBSpRuHtQz27MlYY9OlNDxj2202dp6G?=
 =?us-ascii?Q?xQKP5ERV5BDVv44Dj1LK6bJ/tP5cCZpI1Nk1DlB4gbacZYw++EWhkfF9UuGs?=
 =?us-ascii?Q?jkG/aKiROF6ogMO0WlNemcIHmKdMWEJPdaTNeYzAjBGXbb6EdMPBK6RIv2K0?=
 =?us-ascii?Q?+oRcISf8PeyzdrIhIlm/lsVzgKVHwKU/BarL6IN4d9rjQzLp/d2/YWSBNJ4h?=
 =?us-ascii?Q?RtI9LyG9RDvASjv4Io1gwE7cqhIIxENKV/3/rBStR/6GxFGKyQ5Lvcay+d/P?=
 =?us-ascii?Q?d0XXp/snpfOf8r+5z/CDnGIwa+jgitfuwUrnQCGVniLExbdyHYcgc9x9U6Dv?=
 =?us-ascii?Q?F+RXYhEHfR9PaK+0UZFSdZEMNUS9a/hxfao8LWLm3xMURpH0EDSb5HZ5eJXj?=
 =?us-ascii?Q?zfXnDcVut+eGI90xj92mpHYGMQrpAGu+bLDuBsZIPJFIlClDV8s3wQX1Dc0C?=
 =?us-ascii?Q?Vfrn1wg1sqj3Ie64IDaePdu+AqaYAQDEVs2RefhCc3yHNoJpwUOpv/ZCDZp2?=
 =?us-ascii?Q?8COmfcTkFsEo3ShTbzLEVXyKPcVjEE+qoxU3QqT2SaTHjnDwWRC7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9bb648-2c68-48fc-d83e-08df2a02ef95
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:53:40.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMIRKrmGW/6G+No4flL2LZfH6oemH+2dKzZJ6ZQs286M9Z9waCcbFz5sDdF0XucGJIOL7nnYgzyaePpBNYhwiYrDO+EV+OLNL01O0LiBf9RNzE7xL3hDI70CGXQDnWMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB757610

From: Frank Li <Frank.Li@nxp.com>

Direct assignment to tx->callback and tx->callback_param bypasses the
dmaengine descriptor API. Replace them with dmaengine_desc_set_callback()
and replace the tx->tx_submit() call with dmaengine_submit(), which are
the proper interfaces for dmaengine clients.

Prepare to make struct dma_async_tx_descriptor private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 base on https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/ next
---
 drivers/dma/dmatest.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f37..3f0b7e15abf05 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -822,11 +822,11 @@ static int dmatest_func(void *data)
 		}
 
 		done->done = false;
-		if (!params->polled) {
-			tx->callback = dmatest_callback;
-			tx->callback_param = done;
-		}
-		cookie = tx->tx_submit(tx);
+		if (!params->polled)
+			dmaengine_desc_set_callback(tx, dmatest_callback, NULL,
+						    done);
+
+		cookie = dmaengine_submit(tx);
 
 		if (dma_submit_error(cookie)) {
 			result("submit error", total_tests, src->off,
-- 
2.43.0

