Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8101341660;
	Thu, 16 Jul 2026 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215521; cv=fail; b=ljot03Ado80/WzMqfsXMnXAW9lbgfGIWoWmD9JcWgXqVkvWEPUU5ZJNgatzSsxYrEjYgS8JEK6B+bKxoHDaNPUvsRNySyDpVLhBpxK8WRBxcikCswfjPb/osJIZo4xJPYIgh5d2fggauiJ7YPkhh10lc+tjKIgPi0xpn3l3z508=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215521; c=relaxed/simple;
	bh=P0vki80dh4t0KxHJyH1Af4nCg3YpwL6E/RUDkwAEKaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NVgx/3hhmTcPOqSsgdzKYpIIiGsNedfM9XArE+RkRYXSGnA3KkqS09aAX5jIO8lJeYLumyvORX4oFVeUPL03GPdmGSdsd7jKilMv8izd8gx5w/QnWNub/zt/COH9nq3e656DS4zIDtLG07LD0LB7kALxdM0ThBWwve47o7quoFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=RX/dFERD; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="RX/dFERD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjw+g8PiGBiUy6lsbs13DTaQRriJdbGqDuodbLgxh5caC67PNiogHwEEH399x6HgN24AvWmEZdzrjlIRgWbThOsjvhlzIeF92UWSzZfMAEoUeKTkgt6QPfcD7yJr/j6LnK44xKNp6eH1JFnGGIjCgVlJbgDr35pdjYl/TJx/mfUB60wRZiKTr2CFz0eEN9F6uth8EoGeF04kdi3PzKNpZ8lwQfOMZQtG39W5bHV4QG7rmpPazdKAxAOq5yXaILoAmC7Vnxz9ftqNWxy8STaqkN/hbTwS52Y52zTiLvBdPje8GJhL3cFtoveQ7nZMH2VV5uJC8vbQg9yMTRkXSWu7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L+kVdLvETYJRr+pGMAPfTsbwVouX6gU4Oinhaxvoto=;
 b=qt085KQqCfaMsWHorzVRoeq1epbFI+JdF1ASKcHTDSHmcI7Z8yY8D+sJPCf2wVSQiMLYs8/H75uxxqE6qZDnwOuvsLL8KyKjhXAaDoEoSAirzH2Y5gVGAUd53uVglCHFVRaQKkJaLtw1wNrcD2+k5/+JFhbn5l1CA0Eque+BuTcmnsp44NZe4yQls5UsCJIIeVNVm67NbNv0TfuM3xeoeNv64XNXgCRoCAHx090u5OMLX5D7jGY//zF2i7y6YcGuZxuuDb9Dy2j6nOuNw9XUOP1/++I8Kogj4RZD0iYQAWFjwNW8dKAAc6CFP01KOeUL6+r1erb6+IxXUZDFKKjX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L+kVdLvETYJRr+pGMAPfTsbwVouX6gU4Oinhaxvoto=;
 b=RX/dFERDiJHfsAGR4REDX4+xPlfxum4nI9By6zLyLHETzdrb9yDHOaCGg7O4/z0Yu4NZplVNEWxYP65klAF00UyJpLFHbXNAyn0fwg/QYRA8EG3gHiyNezNxZlmArZvIoqwjAmIZrmYwDHHQqnF+OjJscTWHH4x37b2fYfWlhm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:14 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:14 +0000
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
Subject: [PATCH v4 1/9] dmaengine: dw-edma: Fix HDMA channel status register access
Date: Fri, 17 Jul 2026 00:24:55 +0900
Message-ID: <20260716152503.1747922-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 12eb7e31-f2ce-4354-7d5c-08dee34e6f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QF1z0Y3s5iD7Vt1fjf0yNR10K7XDegIbwSJxyXl8fSL2M36FdE9YFt8KgSTJqPe9yf9nEWtSknS5gTfKSEp1O/3p6+4gZ5G5Q3o+m2OZGoAMrN9V4MgZJOpV/wNroexLW2BGk9CiG/z9i8J8h51z8HoKDvrus/Mz4ED7Wd1c4U61JAAvmqlIs1Dv1uuhGsn+/9IPzvCkjIFvD0/Esczo8i2sBGrYIaLMMD7QXpGwX4QAUDrKCQbBUPDKmihzcCf5aIxEuMUy6z4MkF6EvV4g9mVWNMFhHOhHSLBGnIS6dfiHG6BhjuKC0fiBWHviXEW00v+0Jh9LzI20SJ+c3onq2v+NCx9r6V+8yQjEGaNzjoJILwY9rUPNp7ocPQPGUNJk00tXIxN4cO2J0yjsawAUVtsAOmCTIJX6t8C6aj0er2glz/YCyrMvhJs17TdZvMdQ9ItgwDlvb/20Dt6kC95e1Rh/OWOl4vi9TUCx5pQm3AWvTwhyGDO76ZvevMewKDbPt09YuHjJBseipCWjebWjWaO9JZsjMQdTS0kBsxL4BWB9FhkrHNh2OMpWSPcUnlS6RQT1P/G7hT8AkCxAJuG6sTARsDbKQwa/tKilSvaIzoUKTW9bwUByJQviLapTJ/ejS8U/j7YgNgDgP+Lj6eAlUqEPuL5wbdRoXkf9Lpn6rf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H1v83reqmxVFJwdlmvK+OHCDQjdJ/ybUZ9ClPgPxW/f4sGVd5y/qxYlLH0FI?=
 =?us-ascii?Q?hJecv9cjdVdbXEMNjWH3eOfLJ0WeOf4US5p6VThwSoX6JwD9hqBIgteqbXwo?=
 =?us-ascii?Q?Ch5Y2NqQv66XN0M9J6jrn7+tFCg4b1q1dJhux8++I5pTgtAuf/2DMGMSAXr8?=
 =?us-ascii?Q?XIWzgjrbfRTw42ay/vl+z+xNQfB+ODDfO44EJbqezv92ZG4ZpAn1uZeUw2EW?=
 =?us-ascii?Q?vmV7gGuHaNDWN6jH/MuIqUbz0Dl7r2J01w7KfUWA9kOY5gwiOQR59psrjUkw?=
 =?us-ascii?Q?pOadUQmphjKrquPxuH2y6p83DDPfLN1rIobambdalgAGkIdLzb2vLtqcNj+L?=
 =?us-ascii?Q?MLVOhLgPyarkNiyGJIWkRusLwNA/EYWUiThcRAQtM7w8HvqMBDCxOm2BnqTk?=
 =?us-ascii?Q?Ivx1D8KCIRBEC7v2826xQkJ8sA1O05O480yB5ZgPjGQyx0KqsvVRsBeF9prc?=
 =?us-ascii?Q?YtZnHo8WBDSEMX5UhfkQDkPL3RrI1c7cJtSETVObpTv3zEbzg0bF2WLG35Ym?=
 =?us-ascii?Q?5A/PweN7D0qBJoaSHt/Tq/BdYlFuZ/ynanFh2uT+6X6CtoJ8C4Jb+YGmLYn0?=
 =?us-ascii?Q?nWMRISMdreDEoa4vr20vbJu6p9M1ltPnt0e/aRKx9i4ljV0twk6JWN3Icy/T?=
 =?us-ascii?Q?4d/5usKh3XJZn5LFKtXZ6v+k2yM0ikFqN4/hlwKBFx/FOjpYFE6PbxXXyTLb?=
 =?us-ascii?Q?BCC3+NZ6FDnMwHoDMa/15KYO0i9o/i5op1Lc5z4yPeYn8Klfp5nkJ3ADiLTd?=
 =?us-ascii?Q?8j42b3vSHHkx/arFJRTKRO1oJkZjEZ5EVLcVLdMVkA6by7IhrK1qWF0H4Fi7?=
 =?us-ascii?Q?DqjYF6kTU7FJAt5/2+CVPHeFg9jPh3lXIwIUc/8qm/dLvdoY1IoViNK57ToL?=
 =?us-ascii?Q?mof996mp2VMiIZogrUFbby1bklfq9sinXZeiIfXx30Zrk8Y0qXLDby6n6r6t?=
 =?us-ascii?Q?g3Z5HLvGJV4EMO3k/mGX7ALW6OGWjrvwwOzD5MRnF2pFzPA6NoDboKQXqat7?=
 =?us-ascii?Q?4EXXdTv5qBlsRZelKYHPhA8NpDajlZRDqOYTKqXmL9+8kwvtBbGieNBxOa4/?=
 =?us-ascii?Q?Pf0GgxFlfdXefS4YeeTWMjtxG/Tmdk7vsgEhEhz1kYuXrHPikuuDjVltoUir?=
 =?us-ascii?Q?QgaHE0weZuaJnsyJQOjheYhzpyorQ4LjxmpdneVRshcMyKJ0wg9fy0ifda3T?=
 =?us-ascii?Q?29B8YqyjfAC1cfUh4zTf5aRTEHstJ+LOjL75zCU9L9Ojt841YJtJEPf90D1z?=
 =?us-ascii?Q?4sjS32ft3JIiPXB9oBsswjTD1JRh+5e6J8xRanT2Gf1O6KnBlKTJ5AlE/w3M?=
 =?us-ascii?Q?BVgqOgiKVXje9Dg7ziohtWen90gUAOssrOUThcedxtQZfrESAAN3816tkVaZ?=
 =?us-ascii?Q?rLqE+ysEhscUtiVTJ2l1LxYHLWFNtUilMnsYe0pSdVpERAV7o8Zp0nyEZVjV?=
 =?us-ascii?Q?mA4Bh9ux+qDaFFkghKHA3UsGTWeWL256gbTjutxPZS6nTjiuq6+FxPoQwUTz?=
 =?us-ascii?Q?jNDCyFcDBcD8Z/G3Vw0S7lAfzvOSbd9hvywupH/4XXaBb6fTI7JWokdK0bQp?=
 =?us-ascii?Q?wdURwiXjInCxmQPP+CC6VKWb4HNrw6CATVl9HhWWeYro6tclXKnOBk6KcLKT?=
 =?us-ascii?Q?jA77VFEluLeIe08Aba8i/RNILKDEAVM1PVsG3mxMzGylMjDYIIVf49tI96IB?=
 =?us-ascii?Q?CpAPKhhpJJcGtocy/an12Jvc28lnJuqA7IQ4ZI7jPMQlH4TwxyhJmzCAQTy7?=
 =?us-ascii?Q?xFKi1u6Pdv9lADIP5/GANVC6ttMGOwyDSoLdjLtocyPmKGumC1YQ?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eb7e31-f2ce-4354-7d5c-08dee34e6f33
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:14.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHiQURHFVd48VRWbmZgMhEbacUHA6yJntLTjY2tJoDDReIFx42eoowMcQrA/EFPJPIKPCbbARpqjOOhb7CTkew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

GET_CH_32() takes the direction before the channel ID, but
dw_hdma_v0_core_ch_status() passed them in the opposite order. This can
make the status callback read another HDMA channel status register.

Use the same argument order as the other HDMA register accesses.

Fixes: e74c39573d35 ("dmaengine: dw-edma: Add support for native HDMA")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 632abb8b481c..2beec876b184 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -79,7 +79,7 @@ static enum dma_status dw_hdma_v0_core_ch_status(struct dw_edma_chan *chan)
 	u32 tmp;
 
 	tmp = FIELD_GET(HDMA_V0_CH_STATUS_MASK,
-			GET_CH_32(dw, chan->id, chan->dir, ch_stat));
+			GET_CH_32(dw, chan->dir, chan->id, ch_stat));
 
 	if (tmp == 1)
 		return DMA_IN_PROGRESS;
-- 
2.51.0

