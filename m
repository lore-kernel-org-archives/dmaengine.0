Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021115.outbound.protection.outlook.com [52.101.125.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94953B14CE;
	Wed, 15 Jul 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138278; cv=fail; b=EEH8M1HH3XWF4Kjj3f+WEWub5S5MI9BTC5y0ljRCktXkKE/8M5fT363HnpZY1qcW4UNNa+1oCJQlFv92bQbSfVBWu35DsZ2n8HFpFxt0/joyZnOh3Xj1RPKBr5U8AR98VCG71s6zCq/Dqg/M8/udPxV9jYKncFYDTSXOW6/Rl3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138278; c=relaxed/simple;
	bh=tOrVhJfrM9MJY1ZCb6eSRgG7psUweY3Mm2ascEZPjNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RuTOxd4ZlKXXDxsiPL+yzSEe0RuMJuLCYCPSNzpUBpu9q1DcKhhnTUASsNanFwhd2ikO5RWmOzEXnk25cxXIBVdP/6ejwrQ9L7zNnYlQmKb0uUTJtpZ+ECX76xDCxHzLx7RjK8LjEZq0wJJkIHo1tyexssC1u5vmJ3Tjft10Rd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vgG0tk3v; arc=fail smtp.client-ip=52.101.125.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vgG0tk3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbZfqN6cQsLeS+tNiR6ynJJ9p4zKdIylTmhBeii15e9lOb+Un9E+Gk02nU7XLx+JHY1TXOdiffGTFI84Fv8qgZx01JpmBAgJZBzLtsFo7O5wQS2X6gn7rsnVAaRcAoa+kkwoUgNHtR/9uM0rj1Qb6xEioN7P4M24Mgr6rTIhGNPKC4jT3oT/vDY/WVsZwFE2+WzH16+33pb25Q++c60/ssEzxvp/dZvnmiD2TUhb+qgF0qRd2bGD8MAsvTapOV5jrv558tB4iXFsAF/Yj4zBgiZf2SVdZ2YU0NJZgPsrDOxA9uXaI5suVvBiye5cUyEGSJ5fRtGUdo2OjWfdzKtexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkvgHqdlWvqEejDjUuRgNJatkWVB2d6xdGVQJbrExFo=;
 b=WCwDjMCrDWfB5ULiivD5xf0ekzbJthNM0Y5iX5vftdYRIlETwsqnRFKVbVCAEGzHJMZ8EJWoGjzC2DWDHj9JTQx+6KZt1+3Co7RIBzt+J08FZERoc5T04MvL+gHwgTVkgr0X/s7y6RdhIiy8jAjZ7T/dsptz5/HH6+sav8ijDWoSxhtIGttS1LUmcfWII/qFAnzJBuQJycF3dPT1BsPfhes0Sr2AhzXVaaL5YBSx7MaOPMw9Me+2DV8o9w8DLsVHcM9/lotqxUmpnzSMuFbFJKX/s1a3t3hhBFUoWZgK8CH8i5xt99OEeJVpkxKoM5aYiBGrhlK6H1/v91rPTtuAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkvgHqdlWvqEejDjUuRgNJatkWVB2d6xdGVQJbrExFo=;
 b=vgG0tk3v65aPSYYGBjSOL/3FLqB29lg3+KxeMxC+7EyXqQ/IKFNibp5A/QRCh14EevwVFcJ9yn+7bVBkQwhGvw+cmPDrUB9GIH9G2T3XKwxySq8mcDy7TPHWHgBHBqa9CBc+7/4INfcM116FjNK52TTAxAnLoO58X1NJ2smbKY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:45 +0000
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
Subject: [PATCH v3 3/9] dmaengine: dw-edma: Serialize abort state updates
Date: Thu, 16 Jul 2026 02:57:34 +0900
Message-ID: <20260715175740.1110404-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adf1af8-560d-49e6-eeeb-08dee29a9337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oPmIU0Yv8aKtuQ9prB5cIlnLI3Ae99Y7Ucbgdsq9iM3ldDyjPvgHIDqbhyFApQhH+milsQ1B6smsAVppTp//KjjFkJWc3WkwGbM0ibFEHtOwsGhsdjOSbfK+2aNTpI4nhX/HiMQjM3u4x54JDnXCwj5C/CQeNZ7u3Lgfyk81a5GTls1UWTTrsZQFQp3xgEwKDa+9i6vzNuFCTBVChDpcriCdTgz7yryQuQMur7e36rjuctWWToi8vJjhnVycfJg/6ME1sF1nrBt/O3juY+YAOFPf/yQNrdRj7heJKZnUp3xa5+NDaXdQaOPN+cgdkAEb2zSJ6rIwCFMSLWHFUkwpDQEOwNSnalNXVMnS4QBlwjDyCp638HEWqz+cOaJxYcnc4ouFr8cxWnxdn/tvfxe4FMwcrTokt20NRn56ywkX9njFm7Nf/yeA9vh9LPqRSkRT1Kcr4cz0PpvHH+E8wxREe9UpfiJIJv+HI65K0ZbF/hm7OqxdSmuzLbmLrtr6z40A00pv2ERTKk+yPlq4SSlU5ih3j1wrNMlATvjRBp3OH3j/F9ebQSMyJ+EmPurlFKwEwrIXzwACBcpvoUh1m3YoVIw+rff5G89SheR203IbXsOj2XcEU5LaSCCdzlDWzSF/HF5L2/FchVLGkil+gXgJRTyhAlz0NRU5e36lQlJsfKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aWfOCUMhyzGGFZaw2QjdEixlb3J3+yNDHa8ujfl++2h7QFg6Fq1arHgVhCf0?=
 =?us-ascii?Q?FdY2yIAku1URXU/8+m+CdPD3OdnvzvOViUwgRIEgny0Vs8i6vfAJlVq9Zro2?=
 =?us-ascii?Q?RKC5bykzNzXZSjApC4eAwhyne2xcVxAHqzr/NEujPDO2dgJ1k1rNyLToPaDP?=
 =?us-ascii?Q?50d77uQn5I7VvHOF7wFVJyKOyn7aWaHG4jY0BPhBNja4WMF9aZH8p+nK+FLE?=
 =?us-ascii?Q?KqjrD47DuTdq77Wy8v2pWccBSWIxvi9t5EpZcgtJ3InwIjHOfosfMMtNE+Zu?=
 =?us-ascii?Q?xOHRAZZRWEKRVxlQdpibvg4XFvg/Cl8pHRVkBQyx0KHokMNQ71ukF16KO9fN?=
 =?us-ascii?Q?kWtkU6Fyxr2zmlHtMmoBU1I1Dzi4TP5FP8M7YPOF4ve7d/6SBL2t7D63CB/m?=
 =?us-ascii?Q?JCz+Ebatq10+8GDzOERVelsxXcW+qQVXT6teAPKW+/+WQsVIO4VLZDFem3yn?=
 =?us-ascii?Q?UAnxp2H/o5M7j1AsMgR6b00VO44EnL/D9NGB0dMXOHF6WD9ExmJtfGmdr+V2?=
 =?us-ascii?Q?pGhBKJ2Wwlc5U2n0GoDvLk2m+DhGPp/4Rp4KxFrtF8xBgoQ7AdldHhwTCyNk?=
 =?us-ascii?Q?g0RmmH85EWfLeGRQyRckhgU7PFHWWnza5zpc6lZ7f+2uQE1/dr64KoJGcVZD?=
 =?us-ascii?Q?8Ve1gn5FsDouZzNCOFZ1DZlwka+VNFVezW5MUSS48tRwHyjPmQKAnR6hroNQ?=
 =?us-ascii?Q?qBK1pn7SstY1TaI+b3Bsnbclbxhlq47/X5kNRQ9yJN8A5e/AuSj4V/QKFcyu?=
 =?us-ascii?Q?uCXA7m7/QowLlTTQCTZEbZzqx39qGbhWvX8k0rklpBJG6RGx3psRmNRlnfU/?=
 =?us-ascii?Q?OYygwRivKXIhOuV7BKiqdhMpae5Llfk3uPvE9zsCEEB5ebF3dJfCV3lFQJMe?=
 =?us-ascii?Q?jB5R+GjVuwU15x+usWxAYkQgnd0rRscFIaU5Xur+nWN/OpnMlZriwjHnmHIB?=
 =?us-ascii?Q?udgUbj4z8eikHqTlihVZAUp4IGGU9Xnm+4qd9jP4e6V3aMdOrY4617M3fqDG?=
 =?us-ascii?Q?+9mpkkrIsRnR2o4rwcgN7j5q8PLxaJG2FFULIxndumsmeqzfwL6aBLWX7CES?=
 =?us-ascii?Q?6+hGzO+fMCUfOItAuTOQRz2ZobJlrEleloc0MPX/fwYGO4Em809dx2cYu3HO?=
 =?us-ascii?Q?jn/ooMTQOW/xjQo/hlxsxUWWYfm0/L9Afz8EyTCKCWtO55MwaD9SztpBB/dz?=
 =?us-ascii?Q?JLMqzNWpmdoXEI7LFQvEenQ05OSvmVhoeAXIKB4OlaKo4WkLg/tVOEPQ9Bvn?=
 =?us-ascii?Q?vceCEt76Bze8aI9xlKyrbdDyOl08ivNSqwcoEubASzfdWiHlzL4jR++k3BAz?=
 =?us-ascii?Q?lVx9k200fNU7UMI9YjH8/BSdz4pazdM6qIhvJB2snjYdZ5S5Bl4pAGnbrqC5?=
 =?us-ascii?Q?o3dKBXy7oeKzLRq3nROhif4md4dEs+CKt7fpYDp9QslNay9wnAHsV5ocqJ/z?=
 =?us-ascii?Q?KMuN6/oB1l4GVoKh4Ae0AxL7t8N0YibZI2G/wnLOqjFByJBwfD4Ldzg5MzWp?=
 =?us-ascii?Q?7bdiofESqAhOFeoi/tllKtVkdtJHOQ96mnrGpiqoYTw/RhWAjnI5vPtV5E2H?=
 =?us-ascii?Q?DNZrBn17XBybgjrKDt+IFoU9lWg8HZSd6C7Ok8psvguYwzh9Pqk7ib5LTctF?=
 =?us-ascii?Q?TO4mfj7ypUsTsWKAmy5PQ6EkgjHAboqGTiOQ/jnjwYTmAtkEwtybfy1E2Bry?=
 =?us-ascii?Q?K92G7L+0BPaAEPDcJN+fUbG2U23ydI3be0Jzs8zNPDX+/n0Oyl31VOKkOlId?=
 =?us-ascii?Q?vWwyzKzeGK6QB7FAqT5EncrDt/ji6dp6cWaiX4qCgQWfcSulIN5F?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adf1af8-560d-49e6-eeeb-08dee29a9337
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:45.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPKfVQi0voOnknR+Q/Qh0uwLCNw3J3OZhyyyZPFrgIGm1cpa/r5IPj18UEZSHm65i5HydjkF8zojBaoSX1eY2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

dw_edma_abort_interrupt() drops vc.lock before changing request and
status. issue_pending() can acquire the lock in that small window,
observe the old busy state, and skip starting queued descriptors. Then
the abort handler overwrites the channel status as idle, leaving the new
descriptors stranded for good.

Keep descriptor completion and the state transition in the same critical
section.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New patch for a pre-existing abort state race. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 44ef5fbe3fd4..272b03405746 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -740,9 +740,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
 	}
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 	chan->request = EDMA_REQ_NONE;
 	chan->status = EDMA_ST_IDLE;
+	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
-- 
2.51.0

