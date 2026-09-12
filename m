Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021095.outbound.protection.outlook.com [40.107.74.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DDB37DE9B;
	Sat, 12 Sep 2026 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234834; cv=fail; b=VXw4frBMpR5/EW36JBBdMbFlfO4k1KcJvbZXY6alJj5NhriccIRgR9PWch2AJeMwkuaKPx/7aiIbQMOrwlliYoExswmGe/ewHjIavegr0BQR1Z3+kE19cwMH/BmN7umw2a9Q9+8iOR2nvnqfmV62MaP/D00HNEXlBUgbVqKzvUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234834; c=relaxed/simple;
	bh=W9weQjlMwkAjnnnkqoB0AK1iL+U2WQ72EbBqVcyIr0I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Szb2aBBYMoBBhltYFHO93nQVzBflsrjf3ewc8//LKoXK2RJkesTTt+qk43be59NfD80aDSWsfKy8FvnRlTBQAf6ghmuiyffojhbzUfAQMazcbERH7oRTJ+1jAzBuqsyyaVay6IA0qNF96LppiGhVjTVhPQynFdwgj5W+5Izn1+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=rZIo54UC; arc=fail smtp.client-ip=40.107.74.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="rZIo54UC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTKnYTHWkcneZRm0G386L3hMHGkZNg5ZODnzUyH2rLU0h/Gt1jnyJaglz9fwNmH0F9NoO0S8EEUdlQWau4UzIld6dlpOj6fP8r09rTaMcGJvkiMReqH4F2L/JImVBI6X3lgN1Q6U20oXhoJuvQC5fScC7FWt6Eo7qi+4f3HxwCTn7xzxzBF1pjctY7nw7L0uri+dcTyrXpysy+KV5bEZg3FYgAH9N+mninCMzWNXXqud/P+citK5CIkDXVrgDMh5KmUEkAan+cyYUfT3D3UV0ZywJ3cTFdJa5tz6CfRERkuSyTRhQBPJ6Gc5y+dmzuTfISy4DSNvVKLrJv1ZiPbzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F95/qXHaJ5GfhXxuQhcu+JG77pBylwrc5G1h4NgXzLM=;
 b=dB8lhclgyp7CH0WxGKHJa+//mDcj/pxzdDlc0OWnboi07T0zoVfTadUHpaON2UvGD9QrCdwRf1IrUKvHgsXvXB7e5a4ILvuPlzM1qbrInOLqWp8V0HRH7FjW0fK8GI4S07LE/8BVSIyrxWBPElwiGP0XDasbXWpRc0TNTWA5IwaEVj3TUdKA7w6I0Ij8tF2nPeR3YenPMa8cznfMwiIlnrB0ujLqT4N/1uR/zZQ1mnVruD8YSmuTdcXsYgnkUQC7z3sxglBqOJhHgrNvfaRYot3ieIVr+swDq1XSaXFLd2s5myip17mBb0GzzgFxyb4Yg/v5DiyLn/Bk4gE1n3XlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F95/qXHaJ5GfhXxuQhcu+JG77pBylwrc5G1h4NgXzLM=;
 b=rZIo54UCvpIPK7VrpDaoJgaFtxgtYsZA5U/wk/qd2Os3q6BUL0GCGTr2zl8K/xovkrPZI7YsTuf1lGVmxkiIihnL1TNxxt8CQVZYXlf3ePnR3REV0jUfGojoaSVa9Z5GLKoFgneE5B1pcaDOtPONqTkXs1Mk8nk2Fdn9mJp4RA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSCP286MB5822.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 17:40:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 17:40:28 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] dmaengine: dw-edma: Prepare channels for remote use
Date: Sun, 13 Sep 2026 02:40:20 +0900
Message-ID: <20260912174023.1227397-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSCP286MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cbffdc-b1e2-44ef-ea18-08df10f4ef55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	J9Mxj0LjnzQJvNUtoQ4RVf/dUEDcnaIWDbfhsg1J9M/6rw9VXJjg/CowVqkDpxXu0GL5kNVyXQLyw8w9A4NKiszYn6vZzUCMvEIoUGivpoEaE9E9S/XnsPV5M7kLgiRKNl6Yf6/b5unSucpqsYt329PAfI0kk++B4eamJNY4VhK70rMDJfMBRL9VFrUFfMr09IyD1CpYKN/LrwNItNvc0LxcxVPjyanEx7kVvwl4ppl3pkzYMfs0xtYCdc3Py5FgDHIiMQpGsMN2e68/1r63pDIjpHWSRN7ZQ+/+TszLCfMgghuTL/ALfe2WTgk0RFJPk5mi/CNWjU9bEG6pUKsY5IAStUjDhcnpz/kFkyPMneubHevXppD78VEnugPtL4Hv9/9sUVVYPJKIc1hA4Z4fzU3fIQFiaA5lFuF9tM3Fo+jzNPzBHWsZJppwfKH9YsZe5t2fTC/4Vg5mXyXhUoAN2O9I+rozbEBy/8tz95ip+yamzjv4ZtHeEv3jo++A3wB/FTtyCUy7Koiau0IDS3e2bqk81i8GSi81N9oIVbtuwVJzDPQZIBJzTghpkxhYFEZFDK2BSgjNC54J7xIv2HBbMsuVYXIQInM/1cy13UT/98c2vZo+aEgR7pkMc/wv4QVc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cyz6BovNyHMAI3mI+AAtPr+d5a+Q079scgnffzBk8sRmRbhEQPXiSTtOID7V?=
 =?us-ascii?Q?SI/AnOz1NlPDCpuJbo0XaJGAmgXg3YfmvnRDaVUY/fn2VhJjid+f9onKaNjl?=
 =?us-ascii?Q?wbFCANItU3BZQbw2LjJ11bYal3KJcejWrb2cUdOv7aCTEVFMst/GS8cfF3lg?=
 =?us-ascii?Q?PD5x/srG3VjRI2Kv01huZlna6wPxURUw41rs9w04sJsLIqJLqyDsar8NYZMi?=
 =?us-ascii?Q?Ygv4g0+7VCylE8EZejkyJs4FQTOQ5dygWexYlLR151XinewD4ZAKzOZnxj/1?=
 =?us-ascii?Q?kKHACfF99lDxAX9Kgyh3EJ4mC3wi/wuFNm+J+ZsETd4KES+V95uRcM0zmS91?=
 =?us-ascii?Q?30uAmnvHG9Sb05oGdAydVRgqxJPuwhW8o0jdFyTzZiUxZDbz4N0BAfSdIUUC?=
 =?us-ascii?Q?ze4Th28i7WzcZlyVJ7IQ8lJSeTIwqiRtwF08CC5MoKkzi3rwDvCeHUM+Xvwj?=
 =?us-ascii?Q?BRjZTJrdihXwBqD36kldckF8zS7OMDYVbsAkvYUTrO3hfHyqYwQ66KilypeO?=
 =?us-ascii?Q?lPfDZMFKCtqBL4YhHR0Cfq342fkeZpf2Lu08tR2HfdwcHOywfQ3zDYE+IqO9?=
 =?us-ascii?Q?z6kThur65D81rjJMgp29ooC1DjGhpU59hVjMA9uvnO6CFSU7FHfqLz1Z2+Xj?=
 =?us-ascii?Q?q8tU0yeYiQ7HCKtKPEk+eRV34xY6SaS/hBwVToko2ZJZEsFXTRp+RFFKPsvs?=
 =?us-ascii?Q?XEfY6qsMHyuVVm3+I6iNZCGP4vA6h4wMZkhNNki36DPGeEcz5gKv+QGYjuGa?=
 =?us-ascii?Q?dJSBH8SZvJZy0pH79cVug4d5ZxzSa+kRhinxNo1GudqefySBabihklcD+UAD?=
 =?us-ascii?Q?Wzmohi8dNZ1e5hCyxaTnAo298oLeImzxYlZt2nR3ivtIWBPmkl5VQ/4r9cSp?=
 =?us-ascii?Q?y2bwRAhiLbuE/i4NFTDWHJ4rNSro5S9pVY7LYctssS7hxJvekCNsNMb4YSI7?=
 =?us-ascii?Q?FTaykJ7hB3fsad8LBliL/pGDos1Q8Zk9tMXN5E9lyxHZ38D/NEeKfikhUVmt?=
 =?us-ascii?Q?A4z02UfIgZFJRosVqUvbwLUHrA3CCMWBxmRXp2Ue2XxRC3hFld0ei7vxArgN?=
 =?us-ascii?Q?qWTEqB7yr1AvVUrgo5sp3sbY+Iy8dFz5Olk0RTQ6su/mpqNOO1flFuOaBi6a?=
 =?us-ascii?Q?a3gA/+IQyAuWo5fgaW/lSFdQ35wkTmIx4W1NeV5S+P9btHWHuvoaIrye4Bey?=
 =?us-ascii?Q?Htt7f/trMmTAsaSFOW6TnO4N3VzMGh/s6wGSfooCMxlBXyxzm0SBhZ+wzvyh?=
 =?us-ascii?Q?L+VpphOgmlu/Np66z4/fItY/js5KoSvOeX94iy9wq+meI+P1Ek0GUkxvddSy?=
 =?us-ascii?Q?rPFS0FfrDnnCjLL7daWIMZaBsK+VXiBJY5FXDi1IyNcoEofdGwfRP8ENKex3?=
 =?us-ascii?Q?hwz2NOyUlHhrtyTNnJnav7kMQMlnvIwH7vo2NgzVAOBRxg3rmgROzHz6Afl7?=
 =?us-ascii?Q?xbVeTvbQ5vgJiFLyQlPevQdUl/ztE4fBj/9ERmW4ooEffT43VUnp/gSrCKyZ?=
 =?us-ascii?Q?+Op5MAS8xHvz7AoED2cdDpz6Q5jOBsf3dgY0MtEd6TnltaYgwG00kHpl2CCH?=
 =?us-ascii?Q?Qk2MwLfA9AYhQVt2gJ7dKQ5MnAYL24bDKCMUulBR/syY74IcHudaDsmnBWhZ?=
 =?us-ascii?Q?Aa5ku+4wOPIZAeNk4hfOUtYhXYK+sm2KAbRtvwIE/PfRfNxWSv75JYTxLdIV?=
 =?us-ascii?Q?ciy+pybNsQgEXDnx8wvzRxPpQgzagU4Mt292OFA627IkdRwV4NRYOs5d1a0s?=
 =?us-ascii?Q?/jKj44B+aEbN4KIEC2jE4VQATYCo5mILxM41G/dMyRswwUePmT1O?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cbffdc-b1e2-44ef-ea18-08df10f4ef55
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 17:40:28.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwvyI8DoXIjj2c1mz0FcNzIf15ZbEla4FCfPXssR/RJm6Pynznph4ZM7AtlaVoO1CEmYWCAQKsgFGV6DJX9Ajg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5822

Hi,

This small series contains standalone refactoring and new infrastructure
for dmaengine and dw-edma.

It prepares PCIe EPC-local DMA channels for remote use. The upcoming
vNTB-embedded DMA support [1] will be the first user and depend on this
series.

[1] https://lore.kernel.org/r/20260903082327.2345602-1-den@valinux.co.jp/

Best regards,
Koichiro
---
Changes in v4:
  - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
  - Allow repeated dmaengine_slave_config() calls on idle channels when
    the IRQ mode is unchanged. (Sashiko)
  - Extend patch 2 to support native HDMA.
  - Simplify IRQ mode handling, assuming the channel has no pending
    interrupt status when its mode changes. Treat racing reads by shared
    IRQ handlers and same-value stores on release as harmless.
  - No changes in patches 1 and 3.

Changes in v3:
  - Rework patch 2 to use a common channel configuration, retain generic
    dma_slave_config fields, and close the shared-IRQ routing race.
    (Frank, Sashiko)
  - No code changes in patches 1 and 3.

Changes in v2:
  - Split and rework vNTB v1 patches 1, 4, and 5 into this prerequisite
    series.
  - Fold in the relevant PCI DMA EPF v7 review.

v3: https://lore.kernel.org/r/20260903064533.2269557-1-den@valinux.co.jp/
v2: https://lore.kernel.org/r/20260828163611.2691264-1-den@valinux.co.jp/
v1: https://lore.kernel.org/r/20260312165005.1148676-1-den@valinux.co.jp/


Koichiro Den (3):
  dmaengine: Allow drivers to assign static channel IDs
  dmaengine: dw-edma: Configure remote interrupt routing
  dmaengine: dw-edma: Account for the MSI vector offset

 drivers/dma/dmaengine.c            |  13 ++-
 drivers/dma/dw-edma/dw-edma-core.c | 161 +++++++++++++++++++++--------
 include/linux/dma/edma.h           |  21 ++++
 include/linux/dmaengine.h          |  20 ++++
 4 files changed, 169 insertions(+), 46 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.51.0

