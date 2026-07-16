Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046128A72F;
	Thu, 16 Jul 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215519; cv=fail; b=cpjVTgv4r5ph93pyoS3Amxyqrdxyd7k8+tgEC6AvFdF0t6S4/uhfIuWNuwnodmcdfoY410DnMSRKnrB5VKetiPl7sY+bYko7LrB5046xLNZuOc8WORaWyOuAxva22wrngXGSafN9u6DPoNY3XB+W8qCPZR+Nzu+McY9T532CR10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215519; c=relaxed/simple;
	bh=TDdCQWCNhfAhW+P8UjkZdx6QgbwZqnLuQer8N9th+0s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AQ1aVy/F1tT8rsMl48o7Ic9t5o+h5uEHTuRcXNYs0D6G+EPQzQhDZ5uLk2M2mx8+xE7CTcWQQK6QDz6tI41HmhD0+0yK+YerN25jD11fTVwYx6ZvmiX49R+dvxsZPyjOjRv07//G3vNWNqV6O0EempmviTcdp7B9kvxZItUYt0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lgW6TYiv; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lgW6TYiv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzs4G7YVJZZpXri3965NHIBfUkL7QxXu1ziL4PdVqok7Uud6syt5EnbhqIK9IeNKB7f/u5b0e5h0bBWIvVU1swORpzHoBCOHo0u5Ws3pI+1kc5ESFtnNvvuQ1hv/r7ztlXsRNu9nbtSuNCs+ehZxuUo7Mqkosp2BxYEDfOPDFvfSG+QHDlDWYuu09dzwjEPlNtVbFiOCW7wC3Kmrwu/nojxz9JzDP+2nl//dH3UM6UFCfQo5A3XejWbRKB7LgmFwcJ92e8b6wwuRJpB8IdFFvivKX+ozWCuW3glygEZA1wL0/aIQ3JaEijUo4Rzl7UXQoUhYmjLfMyR40dKBIb+z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s56NElxdhjRkGMNtYyRow3ZhNFNwpYbgQBJlzL6DEyE=;
 b=vZ6/K7zFMcILyakSfrMXitlIw3UIC60dExr1zt6SwxV2HEp/mi4JQ74PwkEdey6v+Qpdr1dpjlfrcPbVdrsT2vqtaS3sheqxIpgEratdEp6b/x/96W9V7J6p9OvbGF2Xl3MORE7UwXjs0KIxy9R65WF6chabr2E0gz0MaE4rRz7ZPHfyWrUsL8RHm3NExH3O4BvBqJwQKeh66ujQap0IHBzPcd2B8iJ/N7ATqvuySb3UXR9yx3aETVrSa0RMT9Ao0/xSiM7DhmPrOlXGCKxqq6PCB+YfRrhaf3fBv0jV4lKCywCQjQ1yWL/7pYtDtRBWFC5SlCYI/3Nx6NkkmeYXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s56NElxdhjRkGMNtYyRow3ZhNFNwpYbgQBJlzL6DEyE=;
 b=lgW6TYiv3CCbWg3kpOfLzY8xpSrBywZ+yYaex5vSLququ4zeAf+2FKvgo333lShvxMVTpqtFJhrPkJcJhYYb+N74Fj+88/7Lg6C67O6tsb9PnZ7JTgzAEYFYe1O3aJtpfWVXjZxJgQ/JAShnl+q0CqjEDSzr4X9E0GP152buU+w=
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
 15:25:13 +0000
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
Subject: [PATCH v4 0/9] dmaengine: dw-edma: Fixes and interrupt-path groundwork
Date: Fri, 17 Jul 2026 00:24:54 +0900
Message-ID: <20260716152503.1747922-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d86e7ea-80c1-4606-a26e-08dee34e6ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	TC1E44dYFuevH6Rf3K7FvQqDaAuAI6Z+zT2X58O9XvC/b7Q71JCLMoh4w2NZmQ8UMvJI9tWrD5XqHVAxyETpUcPrHx4qo+jpftAHvVAvpnOz8YX/zN8aIGOwSaq+bdZ3pZRNEUiEmhvTa5fNpKpy3kfoz61wyc5KDAKJMKl4UVYnPet3rRbOD2pT1iA05+7Lfb/a2S0CV4CnW5uK4RK3ntMdFUD5bW1eNJrbwHA6MM9XZISnk1OwGM9hZf2Jk8BJFNWDnRzhd7PntLn8RdhnVVcPCHA3XEtbLgOkzGvN55SwG2ftPunSKBjGdSoETxZNCq48VYgvD/oX6GOKXx7zrJcLHrZIR8TqO+Qv1JzeWp+T1NBJBx4kfS6e70gn1l4bhwuesrKJ8FjsOihZvgRrenxEe7tUoWKqYOHA5DkL6+tq0c1wC1bYaXOxGwrzNF80XYlS+pOz0IzJmP9pKOXJmo2RpTr/mXwXjvh3sYGz1F4byG0ox1m3YJEdCRGpF5tDwyDSBBA1WfDz860B2DumdCJn+WicI1BHHiiBiCRT4Zoo+0mRYP9JG1nzMGfWQcK4vhvkRRI0ULs1Mvg/hYhPnj9LzpDiorMSceMVTXm+1slYo4Fint0cE8QRkc6e1WLupeRcWH8c9Qe2bMNYhm053prfP8badFcyAD4nfVmm7cg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OAoIrU5HJglx4Sl3/8QEq3nohs0zqqNwogS9umqGEmFtncLzipvLG5OgITOS?=
 =?us-ascii?Q?9fXfaAb3L4amG/2pItZRlSFQrat5TxNqq6cCmZBm4jbGg28dAPY3dS0fA9Y8?=
 =?us-ascii?Q?BUEXbtwxIbXEcsmtAws8wEvVshAAmedKcVOG0Vl1ag+Zi3g4ycT1CrJZTP0N?=
 =?us-ascii?Q?r9tM3oe0cSP9bAPvZZ91wPICXQISY2vc00+k+kwZDkAIh397k8uP9nFW6PPQ?=
 =?us-ascii?Q?sh0dltcuk6eZ3HqT1nXqENEpc21LxEy0A2g2y2fnMQoADTKqueo2aPtpu7k7?=
 =?us-ascii?Q?PzioBiDEWkf0+r3koV9pXCgcLF1S2yPB9sRO9JNChHryRj10WZbBce88FMmv?=
 =?us-ascii?Q?Kf6//7Xf7TNZVxPFrOLWy2E3wygugUSh4Gij0UwMwvSY23tE7cQrg6s94BZM?=
 =?us-ascii?Q?uhrpwjnT0DZwVVdvxlzzakYG3KSUWkCdboCUyfab03mSIoPU+lF0pBCzpFo/?=
 =?us-ascii?Q?wzIe1yrpOuCrNUaVwq76mo8hc4Z7tpo80OzbtbIeIR0XrgxzVtjd+bppdJdU?=
 =?us-ascii?Q?NolEmXztnTlHhN0DkdwNK42sENJoKQuNnCwFczu1MHqLyZrk5MoV5VPc6vj5?=
 =?us-ascii?Q?MR6Aco0EwOEZxSfdzc2XBin6gg4gcCxN/I/t20aJv3NNbkF2fXaNnPSzJPYh?=
 =?us-ascii?Q?WQIpuQHJIW/TrnPs8ah++LoxDML2g9Qxs1cHl870gnnhrLARLZNZXjCImtBN?=
 =?us-ascii?Q?gJBTFWz+kCvqXM7m9zYzHcJDjR6mNHlBOt8pZhGm6Cx2xU3S8EH8q7xdiI0m?=
 =?us-ascii?Q?Z+vZbfIUY8/3kJyLsuWIHht8SDI88zyZPkzzB2YnHhxHUMF6EJ8BbR1DRE6n?=
 =?us-ascii?Q?4R0OrBGggZ8C+2c8PlqSNCzjQWVb9NvvIbqdUVRVCktsK/58U1HDGiEqi6yZ?=
 =?us-ascii?Q?goSF7tPecXpWs+kDRlRuEJVcWEjE1zFl6sXFyifICJgEkwgMGiov8q/vt5UM?=
 =?us-ascii?Q?HNIZ3bkoNwKQuw4AFRfSRtODIBMsOZzoDjDkoijf6S4RmmVLeh6CylVFhHb0?=
 =?us-ascii?Q?bZv9jy2KXJIohcZ1VSiB1/LfGFpzPiXSd+4ko+tjaIwMYQ3WBPrHLpNjOSxm?=
 =?us-ascii?Q?D/CVrP5FfIYFba7g2WLFl3RzYMbsyHbTZuBMH3v7msdGoajKNyvbNKp8IyCC?=
 =?us-ascii?Q?CSot+FgwI9OiGBIO75FuE73Llq1rjwf6QQVj2NdB9My0SG4zYIJG0fuNKUCW?=
 =?us-ascii?Q?XP3voYrsrTLYYTQSa2+vVGS7Po8DBQG0V6xqiJLzvc1tg15cbkcTXRJ6/Q1N?=
 =?us-ascii?Q?csgAUwloLZx7cbVk5LzTzxHEFhnusc26YCFSI4TL9+wb876R6N8fyg4ar7cV?=
 =?us-ascii?Q?jqXaU84Q4tRzYjgrLSMElh3jZr/hTx6+I/WXa/aggUtPpsrrffCeTrAWbCiF?=
 =?us-ascii?Q?PWZCPtWD70hQMk17A4zpvOdTa4hQszVo6SIRaLCwL780jh+EQgSrqv8G73We?=
 =?us-ascii?Q?d+l8nARwYfk4k06RAvA9tQ6NAX+1Vr3HGJ9C7DF+DFcGAc5GhuN79ViqrzdJ?=
 =?us-ascii?Q?96SHAPJ+evRAWkaF0LXTWifu31fwTgIi3g0LySxD97mHpTz6dHGALIt6JROw?=
 =?us-ascii?Q?p8MVPcRRqbx6zGhLE7Xe38IYj+gFjSqILHtEIurHFgmUnkY2pRpvnz7MX5Hs?=
 =?us-ascii?Q?DZaKvSOYVuasj+3UN30zx196cCb2G26PoSl9Si16tzusDqtCCrf8QCop8fPP?=
 =?us-ascii?Q?NqwtYA1Y1jINkxELgSzZfvbF2Is0e/HiOsUXsN5LcDNKZLx2HkLbndSlY5x0?=
 =?us-ascii?Q?vz2k34vRazNpzlkN9yYIkqiMtUyRrdhemmmj2Zh+km8f0zv6sX6I?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d86e7ea-80c1-4606-a26e-08dee34e6ebe
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:13.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EapsvSorWStvVcr7mFXgIK+BahaZUlzSlYb7J1bXYW9FksyJ2+8xPeUUAPg7Dp2TGvlLylcvK5hlF15eMS72ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

Hi,

This series collects dw-edma fixes and interrupt-path groundwork, mostly
split from v1 of the "Support dynamic LL appends" series.

Most v4 changes address review feedback from Frank and Sashiko. I also
collected Frank's Reviewed-by tags.

  v3: https://lore.kernel.org/r/20260715175740.1110404-1-den@valinux.co.jp/
  v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
 (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)

Rebased on the latest dmaengine/fixes:
commit 867621ba2030 ("dmaengine: qcom: bam_dma: Fix command element mask
                      field for BAM v1.6.0+")

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

 drivers/dma/dw-edma/dw-edma-core.c    | 193 ++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-edma-core.h    |  11 ++
 drivers/dma/dw-edma/dw-edma-pcie.c    |   3 -
 drivers/dma/dw-edma/dw-edma-v0-core.c |  28 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |   2 +-
 5 files changed, 188 insertions(+), 49 deletions(-)

-- 
2.51.0

