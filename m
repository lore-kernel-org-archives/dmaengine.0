Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196D41A547;
	Thu, 16 Jul 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215525; cv=fail; b=lluHYAwjsTY6iWzsyO+iJHxYF7vRYuDrLfxA9GYDEJqFKDwazkQ4zOPBFEJo1CheIKaDf1qw8agyPYvgVRLWnFUoF7u2pbIMw9x8b/VtRtweD8ThAlTlsUFwrlssfDu85OacH+dFLZMCCkgFt9mxOyFjIsyUK5mND0JmFDXBHQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215525; c=relaxed/simple;
	bh=t+mpeIJG0YPFLE5jyKLjqLoXmG8hT+7+qkizQFBRbV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GrHo97XFdBaz9kiPOKEAOXmJbfZcmoXFbPY4CdNJDxftGVe1wJdaLEAVgy0bFgWqflv4veuKiDZ1Kak9DLK1l2wBIwM4oKBlpFKv1StcL8J7BuIW/s7qPMIzR1eNGMamwHKYWJsd8y+Mt0HGeGCjIU7W1Ch+1Pi1mIsr4k5lJyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=XCN8ACVr; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="XCN8ACVr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nA9neHQDiVnAbxTy+39WokuevDOPA2Rxp/IFLAU39+NsVovqL5yQ876eqj8X5jU80oswA+TtuxP4/sgXAf32Qon5KSUqbPBOu+GYwnwH/tZBx0g630IIc9hVJwU6ETO/bDJjYfNIaRaZdJA6XZKBwpiSTSNPgY7l/2GVJ5Czyy2yHtG1l2YOUzfW9mOFG9Ho/oNsLIpuzQWYCYg1h0vW+rPnVGrcUF+a6/JCF0wsmzwiObIShLfVV0UNHr+bvjf5VfB9DTybEK4puN/+bKuSRU3TqBty5KETlIF6lFuIbO4/ckc/SAHFMAYJNHLtQD+FvOXMqGAcJtUYxYqIgEUp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uo34FP4/ZEDUYqABPdoSVTxqkhEcwSk+JD6+SyYZrB0=;
 b=sQdEJdv6yVvS70AE8pmzmQJNvORiF3UvblhxfdTaqzoXIKHS3+fODyURz2+H1QzNlrYcr0mowy5vU2qwJy3pbX7WKVJHKLmZu45RzcXv3mH+Ja1/rED+7hHNkCDhROdKtoV3MUs+b0aQfq2Q0n0gKfICGGa0PK9Qi7AN2RhTbL8pH1+6Cs79t0WmvoOFeYG1e5mLBrHE0u2gv4cKerjwTq0O2odxkwG3OPWLgYnENyUrpTDAswrnaE2hPGLyXUTJX77O7kHxGyxNQ09lTfO7Q5Re6JMldJvSp280sQ17gryQ/EvuN89eiPV/2mE68htzAGVFAUeO0hwkwIIaV5bETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo34FP4/ZEDUYqABPdoSVTxqkhEcwSk+JD6+SyYZrB0=;
 b=XCN8ACVrjzmeG2aKFglylpz6PCCyPZDOmGw0oeJJjiaY45US9KOwqxIFz5R3oQFQoFhZJzykF2v7p/lEH6FZE1MFoiLvCVa59+mUrhnqXaWnYpBHJEvwz8JRiX7JJX5XadsgK7+BjaA/loOfg+ghmiC46dJ7qBRHlK3Oz3XJ+PE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:17 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:16 +0000
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
Subject: [PATCH v4 4/9] dmaengine: dw-edma: Complete descriptors before pausing
Date: Fri, 17 Jul 2026 00:24:58 +0900
Message-ID: <20260716152503.1747922-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: dca06fb0-5c86-43a0-3892-08dee34e708d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+y+jqwLRyNSjvJapreb1V8hRQlwqhmTD1Ui8hIt5uVPM7FEuGLJEztxXlsIwEyCbKpxoCU2KzvOdEDmkRRE77lOPDrl4wb+Jaboz3sERsarDypWncf5G0FamsgohCYhUTaIefRhTSwjbZ3GAlPlGOOPmzXRV2RHBiExlYX551MR/m+OO0oBHuiM7g9O7v8fqRYQGzrV/d2fJH7+k43ySzzml70dchwmxeDZRTeCSXGg0LQUb7YNvTxoSbMM3h6oc98ZM56U8K+UablxmhD6hS5lyP6GuHjmK8IYMbCgslAIQyuvPkpRDarxNJcvfgHcRpJ17xUEf2NowArelEpgVPArQMtC8vuCpBW1DLVzohrJaQ+dbZlUO4M/d81QgYJjim6vJPabCPg6ht2kvuTxD+5f1ndlykMJd0J5Dtqqv1lBshTYbBFgScqvpXnREix/39C8WBJmgfy5HvTkmT0k+NFXVIrNtMso5xsmfqRl1oM22/LyAbsk1twPSftC0QCnP6ebfYiLbyrk9lK74yHUe3DLWGdiGIhAfOfp0ZIBwkUcOdURx2DRbdoznSBM6BBz5Msuo/TRBESMpbbVvoYYDevG+GzZUyuUiAWFkTG9LYqKXDG/C+gap/aKy7CDJl99OX8C1S7gUIT/oEljVbqinjYI9Phjv+ddoeS38mDfUDr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KxPwAmG5h2q/z8QWwQrd9/YUvBADiIjeL9DFNpi/19PwpwWi12YjMBKrY3wl?=
 =?us-ascii?Q?F+3zpgtsrrJT42k5SSMqpVs7MXNcvw+DbdwlQuzKzqnXKDBGiZkDwUm6MeO5?=
 =?us-ascii?Q?1SO+kdlfa84FsPZQf9kKPvxzfs9LRw3cKQmQFd1dHk5qHgrGDhi+pZxEkB8I?=
 =?us-ascii?Q?zpb/+4zjT5GGs5BxyF4DADzyULbjrd7HV/bK/lSwh6AJEgWRyKSUezTia74U?=
 =?us-ascii?Q?6e33qoiPtYDE2oV2ittXHh8no5XJ1d/taBSkHpd9fm0Ep96LYlWZ7yTkQlfy?=
 =?us-ascii?Q?fYectll+4EUsGfeheYkj0ppGknQ37666HKRAMoN5cBAhACGPFa96y5ZLuWkC?=
 =?us-ascii?Q?1tUeSZ49LKf6/yZSZ0PiBkYgWJHtptsmpWPskSLzShUitCHE2plwrkUK9ULS?=
 =?us-ascii?Q?aRwnue17DhNBURtTgWc8f7RlAH0s7my3V/HnHV5ZSAxns3x/oDzf1lH5qh8X?=
 =?us-ascii?Q?urkRhRAfsqA0aEDpV/xpg0jQ6J3ZEqglkolM2m0qjSzXp9Ylvh4eQV9eJMmL?=
 =?us-ascii?Q?Fj5jmezcQP1lA0ONx0XzyOjNPpiXS+eHDsfqJpXZARTZXGEi2BjbI3JMwJKB?=
 =?us-ascii?Q?SV4F/z3HBEduQx2csh1z990e6xw8enALllBekzUmCcvPop+A736pfwCIMwbA?=
 =?us-ascii?Q?fAzogOgSpAR3CVK9Ja8TqXRtTdy3Vx508+/1geyZZ4k7ZpkvLQkfLPcmDlBQ?=
 =?us-ascii?Q?mhPwAVq9TjVUQhN1kSPJmFt6o97F5DaQnUY8WWliPWGYAkzh91YzoU0dD63b?=
 =?us-ascii?Q?Fdyv5j6BHelS8CiMx3YcAuN4+otFkDRyAhwNJl5m6SsTdIAYFGTNttmOwf8v?=
 =?us-ascii?Q?uUDVp0RTNRgSxFqiUmkt95F18Ba8Os0TJBSNahAlifW/4+iQe6sHu7L1ADPu?=
 =?us-ascii?Q?5/8mbrqmbkC6BRKtNfh0fqVjrF3L9ftQcALXTlbNiUXC5/fZtkuO916Y7uDR?=
 =?us-ascii?Q?VV+gR/xNzHufgYiPEGX4qKj03xSLmmlm/dJqiu3l1ELo+b0+TzcwwZYa/Ttr?=
 =?us-ascii?Q?53+bLrQFwuW/fLPYek3zKByhlvN+gQMaDDqscp2UDGJOel+IK60FLQhMzWzi?=
 =?us-ascii?Q?pizdsifbwmb+ytobeDuEZTNyDIFieeWLiGRFU39lXuhe1HEjevrgnIesL8iZ?=
 =?us-ascii?Q?u3ugY66OCrPWRIWbg0AlgeYUOa5AscOjrOa4vlmeccDau7dfcxyK0rYwZ9/8?=
 =?us-ascii?Q?84vmYY/JeNWfGIjBzOKNTknOTvJNnBcmJWGuD5cd8+00WG3lNsOTmNoaM5Uz?=
 =?us-ascii?Q?7QMcSRCpOBO3tjtWTii1z8ftgOkdu0SYxzdXVjBG87QSxGMAMHXHHiS/10JR?=
 =?us-ascii?Q?VaBiejUtaHX2vX1O6NXCW7V8iPTHFxuAhAW/IOk3wWK9A9X7C4GerYyPTZ2W?=
 =?us-ascii?Q?g16bpOhzJpWX2V4sOqZItlsQznsmsluTXr7eQOcuPS20iELTqVyE9RP73fN/?=
 =?us-ascii?Q?fCpUKms2+SEfqsJyENWApxmDeWyZwfhtswJtwjnlCAUINXAAk1t5KuMt2vHt?=
 =?us-ascii?Q?zqOUCxpCBh+yndtkhy9Doh+d3i8IqjTZUT8elpz370emj5VLB/V+xaZZwzMH?=
 =?us-ascii?Q?ttld7oDhRX7DqZ/Lee8WW/tZBo5/WzURVZhHvQowAz9tQj9R03YuA5fP2zI+?=
 =?us-ascii?Q?D8pxRiz6eCCsFdKqG42WYmWhOGIsqJH02hZcS1hR6DipYcIoPKZ1bwiWmvwP?=
 =?us-ascii?Q?4BwsKcp4vw5kn3xPrOZV2RTD8WU/5Pmt/k9OypvkypDcsjX/Wco6tIQ0Vta4?=
 =?us-ascii?Q?+aIaNQkj71puLCiDgF0XcyrJ2j5nFkP3PvBGBUvGI6ESr3qMAWjn?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dca06fb0-5c86-43a0-3892-08dee34e708d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:16.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n1XJX6CfTwbbzA/20+3i+wcSOGNPvRfdFkL2elp9+tDyOwgc2QJJ2l4e2e70ZB3mJJda8nJvDFiof6TRXvAAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

If PAUSE is requested while the final chunk of a descriptor is in
flight, the DONE interrupt takes the PAUSE path without checking whether
the descriptor has been depleted. The depleted descriptor remains on the
issued list and the channel enters EDMA_ST_PAUSE.

On resume, dw_edma_start_transfer() finds the descriptor but no chunk to
start and returns 0. The caller ignores that result and leaves the
channel stuck in EDMA_ST_BUSY with no transfer running.

Check for descriptor completion before acknowledging PAUSE. If there is
no work to start on resume, leave the channel idle. Also ignore DONE
interrupts while the channel is paused so a stale or repeated interrupt
cannot change its state or start queued work.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Collect Frank's Reviewed-by tag; no code changes.

 drivers/dma/dw-edma/dw-edma-core.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index daf70df59e07..ac40a832a9c7 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -327,7 +327,8 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		err = -EPERM;
 	} else {
 		chan->status = EDMA_ST_BUSY;
-		dw_edma_start_transfer(chan);
+		if (!dw_edma_start_transfer(chan))
+			chan->status = EDMA_ST_IDLE;
 	}
 
 	return err;
@@ -687,10 +688,16 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	if (chan->status == EDMA_ST_PAUSE) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
+		return;
+	}
+
 	vd = vchan_next_desc(&chan->vc);
 	if (vd) {
 		switch (chan->request) {
 		case EDMA_REQ_NONE:
+		case EDMA_REQ_PAUSE:
 			desc = vd2dw_edma_desc(vd);
 			if (!desc->chunks_alloc) {
 				dw_hdma_set_callback_result(vd,
@@ -699,6 +706,12 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 				vchan_cookie_complete(vd);
 			}
 
+			if (chan->request == EDMA_REQ_PAUSE) {
+				chan->request = EDMA_REQ_NONE;
+				chan->status = EDMA_ST_PAUSE;
+				break;
+			}
+
 			/* Continue transferring if there are remaining chunks or issued requests.
 			 */
 			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
@@ -710,11 +723,6 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			chan->status = EDMA_ST_IDLE;
 			break;
 
-		case EDMA_REQ_PAUSE:
-			chan->request = EDMA_REQ_NONE;
-			chan->status = EDMA_ST_PAUSE;
-			break;
-
 		default:
 			break;
 		}
-- 
2.51.0

