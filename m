Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020123.outbound.protection.outlook.com [52.101.229.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF037AA9C;
	Fri, 17 Jul 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311607; cv=fail; b=Epj2vAhJc5tExMM5CTp7eI2mnWIWnbrU7cTVWg17/UV2abLsWT/Ky6cP7Ffp9liDhmZ6WaPaO5UU5iQNp6BSQGXMdMas/yaxkWEl9HNHcUdO2ka2Zxq5F3O/rvtQBLLddvVzJVQgVM/xPVmDspG1y5Zu0EIYmpo6rRFIjDgMPyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311607; c=relaxed/simple;
	bh=JG0nryIIFFTtlHwVdjMyU5Ng3jrN6mYzaDysaHpc8A8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GynnAeJmrqm7es3Ak2fVMCRhiPHloVMOQSmyXrCGLKNiQTKy8hCXELgSa7yOqrTLX75gPJYChvceTuQJhd5zhM/+apTnHoAn1lElo5V8SvaA/OE1J57KGYlSefHD/tz3FGiBAy23wBk/h857EGU6zjM7pg46Y1KZp+LyP6948nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Be2Gltb+; arc=fail smtp.client-ip=52.101.229.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Be2Gltb+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMCJDgb57JkYJNo+2vj0Si/o0yD6wpoBoZfMC9c0oC47xd5iUaRmPIjOPqrnk9ODcpnydNFq78pkTqGjOyZ82OyEOJhce4PKW34atL2e8JQ6MQemoB7G/MkXkRFkSUuBunLp2bks6vDqF8uIpg3WLhVV2UOQ5wpLPR2xPzPlMjcRkZG0HYj6Ryu6gSSb5m5CvMC6louQkhA8ZPzeFzb45eM6D7Apr2WIAk2FV/yiKEQqXhiI5AW3T+i6sQGAgf2mtkw+ZS3QbV5LOGbtvMnchgEa4c8FyrueDIbEWywoIKrRfnBbmQRon3uK4a3Ol5dPxxWB7t3kuN9UEKgFA43mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce0bj/iUgnm617kaDEMWa4iDE03NY7VatXY0Lu9LfsM=;
 b=Q134Vlqn9ufCOxStoD0iuyp/NjHS6UXstvupdZrB4D2BjsUwa3Polg2MigYCKb+6wJeuye/XGjnal6OmzUUL8EyX4cJWCHgxjKVR/ZpdQO3QxLw/HWxE0Oq4jx8h7kFx+VffuQMRVRPRXYdqmh51gM9Z2nENpoN54hDQp12lsphPWVSBldiQ7TYtAwkw99Xguw/PgInG2BM+52Efo3v5rqRkXomBPFuG2DI6m8E5p/OTnI0dLJCg+MJVq65HX5TM7xKYwEJfnyWC8ZgWaw0v/JgjebqbSQ/xnxgw/HEyCBRvEnvoRktr+eur5fIIUGrGw0hTWe/ld7NZFreQJzMMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce0bj/iUgnm617kaDEMWa4iDE03NY7VatXY0Lu9LfsM=;
 b=Be2Gltb+t9lNBDQNHo0m8CvOMXL7LHHjZKnE/59twPGXoJQB3jGCg8pVo66w27KBenuJg1bAKMQTp7nq7mW/tEWpTyEKhXG1pgn30XfgQI9hNaugNn6A8QNFGZ2e3uaVIu5kFqJu2c521oPYGNoEUC/a+yuOc1Z+U7MsZZXJjz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:42 +0000
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
Subject: [PATCH v5 0/9] dmaengine: dw-edma: Fixes and interrupt-path groundwork
Date: Sat, 18 Jul 2026 03:06:30 +0900
Message-ID: <20260717180639.2643243-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 460d1afb-64f4-46ce-a483-08dee42e2836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/ddAxphSK45+N/3wABD3GDZ4d4AehkyhJmfTwIye3+SikMIQcFYq/SUPMgt9yA2uqlwP9HZetTtE7p+E/u1qx7A2BB27WQVq72mkFn8VVRXx5xxxvEDb9jc984LrzuAuSWdsuLUu6bBaeAFtqSzk8Vux9m3GCXgXUoY0Tn0d/uLUrhxukioRqNkeBSU+y0cx5aIpeo7XrhMpWg0H76XJynjkxhKQsI6JMT3RhtCc1Cp5p/cafFqGLgCyMYK2fEiKxequ6+HJR+PPgQiku8/vm2ntNMwz0rp/3a/TMZUf2uJeMbUIbwiDC0aKXrQ9MADlcUbiapaCvU4bMDJ/KWp/EGX/x7Qt+RQuQbVcO1RcYBKQDiIPpHGMiSIJE2JkBbXXh2rk2rv6JZbbmgeYu5BLfBnpi2MLhvTJ32/UKBWmWzQGbGmh4JyHBh6vgpkP6005X8v7l/dcdjVDAkBc8nEsUYnnb+8F2L9QFFyj0sWghxvvfp+Fba/9QouWxamH6i4oMMWKLJK2Z6tpKDqa4UkaIRDH9IMhVNAI01WWphxxlJYjuLJ4N8d6kLSZ1cc9p0b7Jzm2f3kQt1vTdHeaR1t9toWDE+IIHXu7Y6EvlN5xmtkbThGs+ZeLTLPjhLBKo0STotrTF3XHrloAB60x/LCV0mTYZ7K+BmCqhbSeBYLYqn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OM/Qngr52CbUSubOc24APCDduw+GlaY6MlPwJvYk7YLyYw9KtX31tpo0Ngcg?=
 =?us-ascii?Q?QJbb1oz+IhMOAeFp/OnqhdKCaZHuJuvsFXXf8LaunboANSLguvxTOHuH+nc8?=
 =?us-ascii?Q?krWRP7GtKp7T4iFkkI1iUhYLr0/Qhd6Zp/0yVjZkqqBjW5ZuZiD0RMl1e+jZ?=
 =?us-ascii?Q?TKPdwdltwVDLEo7TxmrlZbJA98FtWYWDmA48tAYjQ02zkPTwg/P1vVZv+5TA?=
 =?us-ascii?Q?NGDIDwjRvSEU2srHA8mU0wSJPcBakac+lX/ShnmoF+o6Vm3Jj3unpkMWtWl7?=
 =?us-ascii?Q?XC5JjGxjAA/9i9Fjk69v91HW6e4c4oNV+xMFLGnAf6M9NL4A6gPZSETb8Bf5?=
 =?us-ascii?Q?oDp5beCg3TEm1/S2Gqql1TEmFHI0EDcIyoH5CJuYcQ59dbvgqp5QtoORwsFb?=
 =?us-ascii?Q?KtNulKQXr/KUSpwOus1yQ/jPNlnCTm3NQ0uI3wV4epEF16+1mTvNvodNiv4X?=
 =?us-ascii?Q?qaawptjTDneuVMpnhGiYU2S9CDnVSbIhqXCM0zkNlLOzaWAAJiqbClk3idRZ?=
 =?us-ascii?Q?xVM2KdcKiQpzVc133gugEw4vrLzYEN+cUozHgap1/z0/wHHWwrhC9I8FzZai?=
 =?us-ascii?Q?jpLt7U4Ne1TVTNmiDccyMTxYcFSquH6S3Z8RAIe4Z212bNL1vbD24SpiawtB?=
 =?us-ascii?Q?muP+Nx8r4dG5ks41Q/3wRHuSr3GvsipqCPd5dgIOMkd8VxXk5nLKywf2MRtZ?=
 =?us-ascii?Q?ua4tvz/J/Jjcjt0LQdKoCKRNoODlSNqlrfLAZj1xmHa5hmJu1c4uOKwgy+31?=
 =?us-ascii?Q?r6xAiuZTX7SI0BOMv5XEqEEfYbqfw5j6ulb6JQXlDAMPzuvm0T+MVx63QweK?=
 =?us-ascii?Q?ylCyAcRY1hiyMrqh61JUU0f8oV/HdAcIWlcooc5waI4r9gfDs+I1VmJ//8zT?=
 =?us-ascii?Q?qGMQDZrhxW2ftjOcGcSVs3sNf3lzizoLkJiec4Rd8XjTPUcCcucgVYci4xk0?=
 =?us-ascii?Q?ZfXkO/4ACY6XOpZSQAZ6EjRU8IdUIVZmpsRH7LUy8nPGP+WSuHvJ4I8h/jst?=
 =?us-ascii?Q?BHPtUWIzzZC9odI7Jqb8p2gSuio1yd/8jg5Iv7mryk5QOoNct95jbwWVIbUK?=
 =?us-ascii?Q?PBalTYw7psBzMm26HEYtrI+FX3XR7FpAUUqKQU8zCrFvYb5TbCdNfcuYQzYK?=
 =?us-ascii?Q?SyHpl8UllVuvliVnPqgGfnoGM1CZJHBuxEATfhf850CqOma4LNccON3088jW?=
 =?us-ascii?Q?FETk4zTw1sj5Vr+rIunHPLNpGpwA7XD19S+dMIZsVeY9FEz8N/JvaItx/1O/?=
 =?us-ascii?Q?DPbf2vLoUUF0HBiyW9j5vKEo11Ou6xWEOsvn3R5j6xAmayptmJDse7cpijeR?=
 =?us-ascii?Q?qxRLpYwcs1dExrGRv1hPVNFgfeA1BsTg8Hg5jKoD1SJIRWMp4iwId3fbOnpF?=
 =?us-ascii?Q?guqe9iVdrNg40A8i2cksr5L6UILOEQRfNmp0EiTGeHKVjxn7SCeA8uYNQlea?=
 =?us-ascii?Q?yXacmWBbhxakm/Pnnum/CLZIekhz4pBmGBwxkBdq57ebd9v1cUQPf1rl8QDs?=
 =?us-ascii?Q?r7gjZRnmjdB/lnN+3xeU9gH3ieTS3eh5o0W7tvTvD9XkZs59yXCi9pMjvhpf?=
 =?us-ascii?Q?0Ri0nTkL2H5bkrYkd6bzWxQKldZXFLGH8g2D9wxmfgC3ojLePrvqBDfJ0Dca?=
 =?us-ascii?Q?JWcNJCr8EFeZsnIt9nJh72ZSFeucmuYfoWXmaqpr6C7w3kOS7xxeqJSsXQLz?=
 =?us-ascii?Q?8YNdBOt1W4UG26DF/zWrmE2AaISJteQwE/QyMH8unXu53z/1VozK63mv40Ox?=
 =?us-ascii?Q?OVIRwDsJSYdCv2H69HmIZk8Kkv7kBh246UX2LHTtE55MdPmMN7EC?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 460d1afb-64f4-46ce-a483-08dee42e2836
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:42.8209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTXMix3tTwKPH5GRMxM0zjNQpAojZgjxzLMI4iTH0/zCpSu/YooL5uBa8Y2MmSdjKr2VT/b3zd7GmCjEHhrPtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

Hi,

This series collects dw-edma fixes and interrupt-path groundwork, mostly
split from v1 of the "Support dynamic LL appends" series.

Apart from minor adjustments to patches 4 and 8 for the new base, the only
change is Frank's Reviewed-by tag on patch 2.

  v4: https://lore.kernel.org/r/20260716152503.1747922-1-den@valinux.co.jp/
  v3: https://lore.kernel.org/r/20260715175740.1110404-1-den@valinux.co.jp/
  v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
 (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)

Rebased onto dmaengine/next:
commit 338c853b7c3b ("dmaengine: Constify struct dma_descriptor_metadata_ops")

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
 drivers/dma/dw-edma/dw-edma-v0-core.c |  27 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |   2 +-
 5 files changed, 188 insertions(+), 48 deletions(-)

-- 
2.51.0

