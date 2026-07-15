Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D634A33FA;
	Wed, 15 Jul 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138277; cv=fail; b=u08RZKlINBGmThbKHBeblkNkyAjWJ5yYcQBfpTI4onn6AHmlzHM7DPM3/9dgZnrGotCE39pGMDXabgXrD7YqXvWZUB52trayKz0VfA4l1iwLVGjIn8c7YaEtKHQvBbiNnK64NIv365SVWxjLGTWyHkvnMIS1Ei0wylCrtvw1dow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138277; c=relaxed/simple;
	bh=NU2kHJ5Lx5wncDbZOG1nOgqt/sc6nonchlJ0cp4qDLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o5u5t010X/S8WEl9W6Ji00/B0YDJ0TswWDu8zzKh227IRbZjQUrORrGy8MSDyrzTY/2MlMzLEIZY1lGsQYe0WJm+9pA2vhBvbgwnCpC7fzR/KJYIRiDv/r9BVPgPzIkJWn4YTAfNSA1Ey422V4BGuhKFunKvCGpWd+frbSvrCQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=w1wahC/U; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="w1wahC/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGBsWHy2Jptc2DE1mmywvkzuJtOsLmngFNSGbonTlDUrfjr8CxjvKIcmj+toS10S6ap9wnfE5p1pgYTWmoCQBYwgZPhhyIbC49APzOyoR+o4TUPKPdEu5wxueNuYVcN9e9nibyWBE2gZOxqAa85LyAk9YPl0b4dsjUeUgjNgiHMFX8OLANoryESZcoDEVT9wybbUJWuWkkOo3aKG+/7di+4fepHQl+Sb2w1GCrEZu7aVTSbqrwMrdghCHJw0AmBuT5yiAvOJqEKvTUsUeRkzq/RhHIX+JQuGWyTU0sjnFKJOjhfYLIbSir79FBtx+oX9Cl0DwF/AtWZIk76ilm8urQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpNiWR0PFeEO68S6w4G33McWlrGxVDfsLYRS7HZyKPk=;
 b=JfSLA4RNm69CyXiUj7qg3wMH6NvNMhle1Y7Ij9EwsvXMF2PySIV9fjnqKKDJCCnDbyInAXcuMncxo/fFdGTg53w3zjaTw+tCwjZmcjsqL6uYJEJ+XTk+i+XtUjr3Mrw8lHQOzGIz8aTXppYl/K0C/7K92mqpHEo5qXd5HHsZhS+VldkNfukkUw2Wx33+Y4SW8PsN5Kl4qJh//cjjdLreURp21pQOxmFcujtgGtTj4ta+FRMB7ojivabPcyJIMUbatq2jLpNjGKUbLE1PSH3Zv23f1tKx7FZ2EsoNX47q8B35IJ99njcTHiVgJamsL4xPJi/A6wJuUj/Zt0e8d/zqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpNiWR0PFeEO68S6w4G33McWlrGxVDfsLYRS7HZyKPk=;
 b=w1wahC/U+8iD7aq+16jEh4JScvvPaB8FeH8HUBTwwXFgguDV5Kalu+dEizDWDDS/PZDMCU3GEgOYkf7KTw3YQDcjDL6kYQTWNl6zZnRCpOYEny6yFY5/6QCJPvccjcz1cS+K3Fyqw/Aj3BmUwwHiYvQkQl2ADaK7FOTUQiOsxyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:46 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:46 +0000
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
Subject: [PATCH v3 4/9] dmaengine: dw-edma: Complete descriptors before pausing
Date: Thu, 16 Jul 2026 02:57:35 +0900
Message-ID: <20260715175740.1110404-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0496f5-31eb-4bc3-ed6e-08dee29a93b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	u+zZLnhDtI1PTwPdj5V8AlSNjKIR3QPhi2eJCXuhVbxGpl6WYDw6rK6tseZlOhafTaLOcyItQIsq1jCBlHYsAHk+dqR7ZhQ4UdJu802B78tIK/5aRs22fM9DDiOeAr1XlMxhP3BTBOGxC+2gyp3ZiljkMMfoChw4Ah+JnKJYTKWrC+tnXcv5NNrd8C9A0uDzWKyTZOY8gCwvpjafCaxbi6csIV3mxeFtPGUEczkbyjqvzE/UyV1i4ngslBYcwJ48D29FUsg46q+mHK5Bttqr8hlNd5p6MUVIkDNdIVQnXaJSUGSlt/osA9F/+JF1etx6y3CUUXjLoOrEn+gCFMb+3B/+7qbPjdHoDt3lRoGIj/+OgnIod+Nap+ynj6vMwvdG7H1UCbGkh05o8tzHDP9fZJCr/rwUmVzrYXAq02zY+jo2avscWv9iEmNeBcWjsWkCA9KplPUKqfDey0Sgqvvn3+0wJEyLyoxIrQm4z/pq0VvOOQYKtoI6/EjXmkMQnoUbG77Qwn12UEDZXH8k32S8V7AyLDM0xO6o2x4TW1V4Q5XkM2ZytmFj5vVuibjnmjpJYQdDprBRL+NP1R6cdED69L3X1fDi+v0m/G01IFbF4FCE97ehCNnFsKHrzD2hNTyJOUcFYtvDJIunDO0cYlcGFDEDoUIySCcbX4yofpoY3NQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xrPyo+r6fJUGVtEeqnJ2qgzfrMhAa8VKnJiq6QG7/JVCX2freqtEQfk6ug55?=
 =?us-ascii?Q?8LVpVd+A5beGAZttSTJg0ov9MdAS0TJZDG85FcAGPsHkHn3BLv6JXSzFWgc3?=
 =?us-ascii?Q?Fgnruz5o7wMk7R+0tBMrpnhg/FrqVPSf53kvX9iVeVPcFpWX204uWm0yXaIQ?=
 =?us-ascii?Q?l4Rqun3p6xwpLw9wZjjRrsPJ8RVQeH0VL6plOjGWMEIeLRKMAKNzZTqgjwlV?=
 =?us-ascii?Q?u/Q21cDqE0DG4A469+NSAoE7eRnFcbjVyolJLCoVLumhGMXTlpWZKzeZvu3I?=
 =?us-ascii?Q?QYNRZ7Ftg7joWTtSYspyfbMk/dDF5OcY1VdPadaCdwSLbewGyyXxGk5lWYGu?=
 =?us-ascii?Q?chddjwvVhTy3RW3knIHR+ksAWgCIGdDqdKW6r69avReJ6k+smxWfqN5ecVWP?=
 =?us-ascii?Q?yppfWbqlZebOTiBeP32KYMfMAEAao974phU2TzZXgzFySP+6+GfMAOphcQX8?=
 =?us-ascii?Q?Rx+9wcd8eLeB1eZQo/C12UIMrKsfTEwDAUZYDOyj3MTo1pHVvsINme5pngdk?=
 =?us-ascii?Q?/oVE4vKl6LsQk6d98Lg4RdAfyv6ER/kStkdYXiLcIhZu/oScJosdqBZPqqjq?=
 =?us-ascii?Q?Fnbzl7nJCxyuCJu1oWu5AFK8E/SfckLlSjdMIq/ZNw4meA57ue5ZORwezusN?=
 =?us-ascii?Q?7FDb5uR8E5f42A3GR+gQ73HtpjDLGFfSFZvriS2Za9klNWrnkgTC6rfZUHY1?=
 =?us-ascii?Q?MQJ6MOssOQBy9hwIuyoAGHw5qGPvNtzY2LEb4GZrsbO+tQiSLAHjMFsdyCrM?=
 =?us-ascii?Q?toOfVCdqdJoJTGwWjzSU+Jx9cwkSVQ/kzW9VQ0E8nnNamDODEhNZoX/YvwEG?=
 =?us-ascii?Q?dFqTdvBbibFIq1EEsL0swgwKGV21AbFWg27c8wR1h7ncuK5XmkDj4HVd0VeQ?=
 =?us-ascii?Q?RAL9AnawyV0ZsBWBegiCZVGU9IGNT5l9RI0mAO1uFyc1jeBtIjTGtW7Zw5sh?=
 =?us-ascii?Q?0SFX8L4ndDHDRip2aETsPnTfKkWDHpoL2ht0Cxn2g1/bXRPJ0ev8uRD5EnzC?=
 =?us-ascii?Q?qFfWyevSiFBSomxcXfOMNQ6DWh2plAuTUtUHrFGHGBoQFIyi8va+SQcgJfNj?=
 =?us-ascii?Q?/InarVSGIhklixF6oJZ9993sHrSY+Ki69mMkVNN5XqynWBTMKRtEWRy2GhMu?=
 =?us-ascii?Q?MsMPmBy/AijpXHubODmd1OoJGB7Onic61DuGrBBFkUVfvsx9hV6oogTCDszi?=
 =?us-ascii?Q?G4yyLhaTSTWX8H0WYGHuQDz9Z8CUWR+qCvnuBNY+RTdk6Jr3LrqmsXT4E9HW?=
 =?us-ascii?Q?3ZrWAj9/UZ2Mu0f576Janu2/oat/BhXocT8K9cYK1ax5PQNHUhjytqawdH2W?=
 =?us-ascii?Q?xbYD01V/MutzbX2HR5os2F37v+kMzdZyRziPuirzh7Gjr93NL44EHIvAK4yy?=
 =?us-ascii?Q?zfm4UshsemF38NxVwICtE/sckWG61w/P70odDpVDpPJ9GG5t/tmYEOkDHqQl?=
 =?us-ascii?Q?AsarJbxQGcduUbJZ29cbd7/UYO3znfIELRiVdnmViFoU6W+UqkLd9ce7IJ/4?=
 =?us-ascii?Q?4snjvCMTjtwlcVkNVMW0N5HlEljNI0jH7UnIeQzoTFCVVKlApE9qkDhKRkfo?=
 =?us-ascii?Q?rxnKO7Yv+4k2Ph+Tk91zTo551r4jhvfhHZca9OgClQcT1g+Y4uhK2VH/Dqri?=
 =?us-ascii?Q?Sx14P6g12R9Z29NGeULMTVh9/X9ym6F8f+v2imE7a8Rg2pWiodM5lV5p4Sbv?=
 =?us-ascii?Q?c6J4A9osZcZ3nLbqTe9VVdw9KANC7XJyzzMNj1oYXA1WxRKnOBdJGWYnvhPa?=
 =?us-ascii?Q?GprJpXPfWYr3H8+S2nGZ4EyMsF+qZz7HUwbjC8IqDcItdNV0GdVV?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0496f5-31eb-4bc3-ed6e-08dee29a93b4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:46.4591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KJvw1KMf77zk9NXBMVaZy9bjc9YwwzKi3THZ2WZKd8xg7u4g4dNMecZzZidGA4i5qyRcLgn3KODZD9lbfakTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

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
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New patch for a pre-existing PAUSE completion issue. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 272b03405746..b06b299661c0 100644
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
@@ -691,10 +692,16 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
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
@@ -703,6 +710,12 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
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
@@ -714,11 +727,6 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
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

