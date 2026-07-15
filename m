Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8F4A2E2E;
	Wed, 15 Jul 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138270; cv=fail; b=IUyQv2yC0g63Bfj/WLMy7oKIXfhQ+I0Sj1e1Wlu314tKssGQEE2k2NlE10rlo3cql5Z9oJabz9DFZP/Pdn4O27NVI1OGcHlAHjYl/g1tFXQHTduvKB2D+rviuB+PMeOnlBZaG3jfD9f8fnL4iBPDM/xik+Oe5dlzqDzlY8wOrYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138270; c=relaxed/simple;
	bh=V4oiStmVdefy6zuBGk6UX3pLC4tEzXh1wgNwVuOFXqY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=se0uaEYGpT2+IJX+Sv/fCSMUD5EZwoB6fz1pxZMuipqNpXU1/TXD0ZDBZqY6z68exuU12uEwAWRE1po3E5KSKbWkd0iHd8X8DZI5PjScaxDY/hJADz8JkonVrKGnBiohs8nKkaYgA3cczbY0UvrSOxCeNc1VuyogJqDxljdu3WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=IPWg2Tb1; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="IPWg2Tb1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVF959RmXuDgc33aobXCSRf6vdaSlPOUJnfKW+VhETBimqXqTS+Ag91bIgWhrQaX3/pdLoUFOLZak/uv3hj5ffwJqmkt0o3ZwBx8st41aRAxzptCJYLiIFs1gVaIzrg6pAhzSBU7Jd0ZQMJw0L1xMnTJB22tor5fxWicSWWnW+OmNBIm3SIVrMv+xtRxkdI8ULCcoXEPv6oAQuaYUrZ9kyehwrN2iRa1nFHyawVWTWF5WlQhLDp7Eg1z3aF5GVUWdI+vAxD+WnG72F1PQERJZrwkdBmQGn32CwaEi+Y+EN/9Pnw1XXdLBPdCsGrwgeRQOi44lKw2PDnZY0OatNAb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj0IiuybiPLeNwgrXe6nHLYpy+m0RFpgcKt5DkqTIwg=;
 b=r6OMntmrGrr3wsKiSq5r8Mc7o9A3qHHl+4xbwxADtMSeyHbTUdFnDPG7XRpiVkm7kPeESXRE/x0zuAh5SxgND92TD5IdYt4LKBe74TINorT1NAnDU1qRSR1XP4PtCS38rZ/Kd5hSawHeyDkKNepb0bRVePye0w1pJkmHTtHLt6otGhpuR9sz3uNMvPCkxChcGeM0dfkkqLZCdDEeXbDVpSjJz4+661zH58NK7MNpixpoJ2nuRqXTSTUh9OoHWQO3PS4My8eWFBVrHgwbRKgCIuNrajdfUC2GmCUKrqjfDYFFHlcyV+wKXEPkcTJ7+tSS7qD2EgYImkPPoBDyHth5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj0IiuybiPLeNwgrXe6nHLYpy+m0RFpgcKt5DkqTIwg=;
 b=IPWg2Tb109Pq1o8rhizF4j3TekE7fvzxds5pTQZyWI2G2Q4ch35dlUQnuJYYp6MLQ5RZga2Lt8AiTMu9qgPUC194cpJSijqw3n2lq9IQxQxy0K8dfzUejjlWp0WTVvev9Z5i1JxEApFGf/+1tSk/HGP4fToWB0lR/FFTjAuvyYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:43 +0000
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
Subject: [PATCH v3 0/9] dmaengine: dw-edma: Fixes and interrupt-path groundwork
Date: Thu, 16 Jul 2026 02:57:31 +0900
Message-ID: <20260715175740.1110404-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: cba850d3-390d-4210-d723-08dee29a91c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	kubR1x3TRGDIJ9hnLJ2A2hsrmSnBobWQOleozyhukzIzBZY+DJESYKceQODTNTnY6wlCYoB8E/mz38vv2xRyalNKf7Xam+t2jXG3ACsOLsce9KNUeKINzJnlk0rr6EWmWrQoYYWzNzGDlZpO6gD9FB84ffamU8GRmzabU+502/KKkrCtzdMVVCIA4yOhaCJHrIlDeBjAi3RZs+yezv6IWhuE7VPibj+36ZNhpPsr6SMsmU3C6jRSES4ORUBi2Gey9HTs+bKZN3b0fSXdBe49/z4JMZAvDTltrpNE5Kk2mIC+oopZzbNg89JzX2KSO52KVva94pd2+lfbgwQkJtAHejNXVARxQyG7onK/+JleGYaQgXC/pTlz5h+Qk6WWmqfLhSIB1DL29WQ7z+LvFkTGST2gPWj3oy+8+g0g/HnnJ+4iVYNeRofIs6mPxk1aWHM8iaoFUGVlEhVkselhmK8ryqTiuCC1XxyFJ8+s5WENDxYxytVWB1vUuhRMq6wQoAH5Z6BGJPhhJH2bKqVn14ZjZNf48Fg4ED0cDBsfFVpmgMLdvU65b5jF1TW9cM2+GGMvzdIvWGIlymK4vjcmv6pzyCstMbOuiFFf0BXX/au4HPy4imL87GEfkRf5Q5jxmzhGXCciKJN+bm1VeMe7lrOY0SHH1gpWvNDhvwX9J7/rTbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HP8bijqqnupe2NDBo3gFXrbYXwVAoPZxkw+F0ImxM0aWS87hTuBWkk84CCgC?=
 =?us-ascii?Q?Z0wil1UFp0dVeGg3BjInB76Sh6bOpHG+4rC8hHF+/nI2+ZipZjJqbfIPzssY?=
 =?us-ascii?Q?poNBxWq6+PqaUiVIzZu1V+jcAarXt89dfycyGFuFVCZJeDh/LGKoa9h+RSp+?=
 =?us-ascii?Q?5hjMUm/w2yYbQLLmQpX4c5NKfnoJv5IXpKm+UdjNR3evcudb+TuGIh8LXHnD?=
 =?us-ascii?Q?YT3G3S0aCC7bsyeqIEpWZD5sbZ3Xt9QQEvHnqCzSJ4TTTFh6uXcY3G6ekCtH?=
 =?us-ascii?Q?QQrqtrd63ujX15zqYlVhoSxNPqVhB+3hBCTvqVzpZ5AC8OhzrTVnK+xkaLRQ?=
 =?us-ascii?Q?E9OGuHmjzu2UXpij2sLeraydQTlhJRHdmNRC5Q2NEnPqetL6DG9+Ah3qLDBi?=
 =?us-ascii?Q?ou+1Ag/kNDHZJ3oQXYv4frZCi1cPl41Y+xDrlT0T1vooMjq0a2AM6TgOGZDD?=
 =?us-ascii?Q?EOMIJ7+dIdaZR1BrnLxVlqHEIhevDt/avKRYasbjU+zzZHUSU/BAKf+NA/+4?=
 =?us-ascii?Q?l1IaxmmfiwjE/hH4e4lbUtmA2fSP2pvjnIAx3iObhTxZidGCzxDG1mgDWG+W?=
 =?us-ascii?Q?BxgyxFsA59E2JMvd7Dox+m482VNK8YDecO/0Md+O5+7Gj/oatUXB8bsHMnU5?=
 =?us-ascii?Q?MMz3RS+TNTEGPhmv4Uzg+iO27rvGsGDNVSFgz2J0HktiHTv5uVaaYd+cpplr?=
 =?us-ascii?Q?4qPB5ts3TRMDSw0d9m2K6+68yJwZ760hGe2xeJLJR1/VS4FAuhLU3EPNuKbL?=
 =?us-ascii?Q?03sFaP5QKrCKMaR3hg06hSb+jEAOtyvMy781ThWhrn9og35LDNz+AHCKmiJV?=
 =?us-ascii?Q?KVW80Xqw5jFpf9daTjhlh7M8xpf3Cppf/lfXFOobf1Q6/exm4eAm9HGXs1+y?=
 =?us-ascii?Q?QMUxZMSXMnoMtBPhCb5EGyl3nr+CO0c7OiW9CwTiIHvV1Z4Zwf248I3WzivZ?=
 =?us-ascii?Q?Qc2xvl5bMbtqNXKWF+pQuAdMyvgcPRIoH2fxJrJJgyuV9wPh1EGeElENZ5/Y?=
 =?us-ascii?Q?KiIi8pbpK6wcfrXKPhJJUSq2LKacmKNTEIpD0dmsJTVGZiHXNtQQeF/Pa39d?=
 =?us-ascii?Q?4YnEqkCDm2Gov+duw3xO22m1xc4qVld6cemA5hJ5gMCNIjJHIciaymmPll4o?=
 =?us-ascii?Q?lZJ9o1eWwrVvM/8GHi6xtEIB18qrMcpbf9forTz25M6Lb8a7OYs4nanoXP1x?=
 =?us-ascii?Q?lqZdbjxzMWko9rG6WBdFbNBuLZ21I1BzwdNFGvuhPw9pbfymEeCNPijYWrA1?=
 =?us-ascii?Q?zE6W0yS+E11Z/27EyRJ2Yj6cY+ZHZnJnvFZWSJXJsCrWqOXnKVJeJy5pSXdW?=
 =?us-ascii?Q?O6sZNmePRrVhTrmLNxNQPQXfcUyfmK6H6gBjr3KCMvomItGz54SHKgDaViko?=
 =?us-ascii?Q?sGNczWfk+AEfhTF4L/sxmuK2yBX4fuqfDtdXfHlnTshwgbJY7XolEuSqkCd9?=
 =?us-ascii?Q?8lnf/QYWZFMuGp8b6ipA1d2FsSmUKqrH3f6uzPMHGJ8Wl3IZcYcDw9CcZgv1?=
 =?us-ascii?Q?YzrbAYMEOGeshy4ADMX4zs5EKsBQCIURVwo1cfSU9i6unN1qnSVOAbj3IJXe?=
 =?us-ascii?Q?E8EjWho4ZgkNRJuQDAzgiCmJgOwpRNX96/niAczKmY96lV/l+bTo82oTdGyO?=
 =?us-ascii?Q?AsrySUtlsVzbLUpHqh9wWbqE0ZRSmqc6tRuXpdTz0VAgL2o7Ybk0WIs3ISb1?=
 =?us-ascii?Q?+X2uRkj+Yx1JkTO8sWcDN7+JXLFr6EDlKhQAfsbMHOI3QnTyQiiECLxwCPCl?=
 =?us-ascii?Q?jMwIAtiUFjVfbguX4a2NQN4FZYYEX3d84QqPLtAbJ4CkGouB2+/b?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cba850d3-390d-4210-d723-08dee29a91c3
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:43.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRb0VC+3WlRFROege3wK+ZPmENiD0N2TZjsIQY25xNVf9U9gfx3Et3Z75J2Zo8rzJ3YFdbS/TUsraErwXDq+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

Hi,

This series collects dw-edma fixes and interrupt-path groundwork, mostly
split from v1 of the "Support dynamic LL appends" series.

The previous posting should have been marked v2, as Frank pointed out,
so this one is v3. It also addresses Sashiko's review and includes fixes
for several pre-existing issues found during that review.

  v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
 (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)

Based on v7.2-rc1 (dmaengine/master).

Best regards,
Koichiro


Koichiro Den (9):
  dmaengine: dw-edma: Fix HDMA channel status register access
  dmaengine: dw-edma: Terminate all descriptors without callbacks
  dmaengine: dw-edma: Serialize abort state updates
  dmaengine: dw-edma: Complete descriptors before pausing
  dmaengine: dw-edma: Serialize channel state checks
  dmaengine: dw-edma: Clear stale requests on termination
  dmaengine: dw-edma-pcie: Drop redundant pci_free_irq_vectors()
  dmaengine: dw-edma: Snapshot the v0 interrupt status once per handler
    pass
  dmaengine: dw-edma: Defer channel IRQ handling to workqueue

 drivers/dma/dw-edma/dw-edma-core.c    | 192 ++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-edma-core.h    |  11 ++
 drivers/dma/dw-edma/dw-edma-pcie.c    |   3 -
 drivers/dma/dw-edma/dw-edma-v0-core.c |  28 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |   2 +-
 5 files changed, 190 insertions(+), 46 deletions(-)

-- 
2.51.0

