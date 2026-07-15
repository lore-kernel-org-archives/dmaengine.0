Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D74B8DE8;
	Wed, 15 Jul 2026 17:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138280; cv=fail; b=PQwG1i4lstyrSbVlqRzZAUNgpUBNScqZUQ9sk5Te5FTu8TreyBkWU74gyd5gnR/kM6FgU9jFsajw+cV0X9k+S30lsVVj0TCyFis/Q3sPhttUsOW10YYM3MWrxk2uP3B+K3FqqAzsU6Lx1m5EniX+fF+v5qsqNcNAvmsHPlGDNAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138280; c=relaxed/simple;
	bh=ydlzQksLDtOmaJRkfAWdDW0hZgwCQjIfqL68cQ1lo+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hFEBzHiIjto6/VrzysRGG61LRUjTADC4mLpToPmnDuxO12FuEDQb2c+UgbRJjVMouhRq7p51JlIc8kVPKu1pkR1l0gUi023vgjMAfuUhgIG+ad2TAqUcUEP9hnUkGN/uuqoHv7YQuzTD3562CVRWz0TGcIdz6yBaaunsx3421wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=UYZIiWzA; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="UYZIiWzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiwcu80IjA1nZsAc2j7hL6jdS5ZWo1DJTnS6O6FxonXg+kPq877vqHTe1Y+fSOAThy5lUeWwY6P9S15nVwQtPDoS5oIwuACa9ecINFBxbbnJI1rE6M0gYgUxeVB6XZxzulsdWQeFVdISLJrbedoNPntIVo9a9+UNTffHROlb60aQrSwDmkXeJ9JjHFfxpJGE5xhKVqykwv1kB0Iyq9TC5/Q5SjPpmnnVLjaOo6MoJsWBydTdxOXzfK0ewAbIDSEl1wqRQMaCtrRYnR4g/4aDnOztgX2QSTJP8J48e8gdi3N9EPQ0F73R95lV+/3BWdU7gnW4MYozU+B4qy+qshkesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7fc23ng8OFIKjs18NY9ot+ds9DQlfc6WGuDJy9q/Uc=;
 b=OFfjPJQed0jn9wwhXeSf7J3MD5whTO1GoMRd6dHKIg2vrDFNF31AjtJMyakbM9IEpmkXQyPqSwcpSCDwpYrb6prhOuHN7z6HiKqXf7I9szNR6SYgKvp31TK39Es3+OTi4MmWPobb8kHYgGTgCUUNy7b8UEybfFBt8bDFgOhgfQcnK4wqCEDANXNgSndtaSCXd/4l54e/eZYk/pfDZNshjr5fOOnMhSmiTIldsQ84EwXd4FwUyySZ2QPGRJoIR8ur7yOxIZEHYinRey0FUcHC9nK4A2hewZb1P1qxAM7C6ffW7KaubKdqrmPama+8JXmu08EMdliyd1PJsfP9Uc8Hjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7fc23ng8OFIKjs18NY9ot+ds9DQlfc6WGuDJy9q/Uc=;
 b=UYZIiWzAXwrKlYSGikG1a2WnZ4eV2hg7nkrbH5rLOkaxuTqproFiea3DZdkblDdYUN1p/D0nRjknFllGVyZr3KnyXlZcSvmKeRTqDmZ6xNPk/adf3N9F1GcKBOv32GEDhf9Ns1TO2B15Uz27hQmggKiFftEqJPykZJevRTy3LRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:49 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:49 +0000
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
Subject: [PATCH v3 7/9] dmaengine: dw-edma-pcie: Drop redundant pci_free_irq_vectors()
Date: Thu, 16 Jul 2026 02:57:38 +0900
Message-ID: <20260715175740.1110404-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0734bf-6319-458d-75a8-08dee29a956d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8OyGzJbQd3uF0gcOhT/UdxnIO7Zqfu6L4IpryIlnuWZfvP3YBz+uuz18bOcYcF29l1HW3niF7w3yaXsv+VwfOq9M0mFlIsJrCsdzTMY6JmO03qT01ONMGuhhRHBrB8n3qPlvqCnfONg3dO+jbn4Q3TSfTLHwUA2SrEfKlJ/w8qa1JUv015Rdwl/M/fcSYVlZ49ehy7L3/dUZBaDiGBw9y6dJsEBIlC5iHgKKWL9HGP/sehxXf2VFa/JS+pm5J+JXveoUySpots7ooSlDQZZhOrXX4E1/rwYvAlYisj6amP7juhD9HIbytSPr2tev4kvwZz7EkkpAfpIosYO3+xVmvRc+8dqnlcuV1OssGHTYC5b8KbTRnzS96+UJbFrjlZm/565p48iUSFI/ZmP7zu/zAFbgxXt5fLFCAyM6IGHdoTzT6Hli0BlDF1GEo236p24OX2uVnPoFWdnMuhvTJrCntPz4nH7+RKruqPqv1w8/IcfXwssysfmaFLc7ui0+Adp2KTpyq2mbvEfAz+zHJTvRNxymt3Pw/P9kA5PQNXg0VMcjRpOozGwVc0SPkC9znnqU3N8/YcV5BMKTKomuEaYGvQUhTRBQ6NqL1sAzXDABEr2B5ofov9w/IsHsf5fsmjI+bUdHEnuyUdaPIwt6kmP7vRN3GnKpxEu7MEsJgRo58fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2YfwNJRBE+jGB+b9RDj9sW+qauPMIwHAVhB6GVcmh3ZmECriGzYoP04xywON?=
 =?us-ascii?Q?pVKeI3AGUYt4AuSalD8/9AOOYY1PtgWs4I4He80F4hhxh+4ZdiG0tZuZYaNh?=
 =?us-ascii?Q?yPE5wwnmt1haQfIwqievWHr6eSbUg1vh2nZAWydMXw+9FALkcM0Zw0TRw15l?=
 =?us-ascii?Q?zLRiJdyTjOLc66aWAMKKHX5X2+hLC5eZxvh6s736ZeeDFUClGpIRBIIu8TKY?=
 =?us-ascii?Q?ws/nqGIp0P8SO1rq22ZttIyoX429raouubqjOpUMAj2bxUtHYBdNMADq4FUF?=
 =?us-ascii?Q?fH3WE0iqb7CufnOZXRU8izzWfUwRTN6tEzJRPONddihYXnczPPKz/EEBMO9w?=
 =?us-ascii?Q?wyrOSOExWs6risEIFR63c3KFiytD3DqBy1hNtvM6dx07ipVEshrDPtCb+EuC?=
 =?us-ascii?Q?x9eTMak9+DJFdAdOjOwGMv56AEiiXG/VeDzbC9+2XCKYI6JsU22zBLLmo+f0?=
 =?us-ascii?Q?7WG8eCKze+V39WGVwsR81sMJoXJ5qqQggJ7Gtj62GMvgwQ8F/l25vRNo47Ua?=
 =?us-ascii?Q?90WdAm44TNimTpkSKE+R756nyxNDv1jMmN0ZgFakIfSV5Cm/iOdcrGZ0VLmQ?=
 =?us-ascii?Q?HBi2cWYwtKL2f7oyzbC02F3TpAbTf4wYIhz3ZxSxR9KC5clMwJqs2HHalMGJ?=
 =?us-ascii?Q?Yb4HfWtaYwrpDzh3hJriIf9fmj8sR3rema6NMXqhZDT2nhmkfj7Zs7sMvsBj?=
 =?us-ascii?Q?hs8og1gfOuWTKw+yru2jYwo8oY2rnsljrX7o7FxE9fNzkKz71tIs7Q/WZIX0?=
 =?us-ascii?Q?xKtTz4jRXGtYQ0+0RY1O+Lzd/w32mI0JL9fqYjToC3QIENq2OKGltw8B1psr?=
 =?us-ascii?Q?2yatGAaeZk0dDxh8sVbZB89kb+G1eeeoHGf5rLA2U/6RKQKpPFQQ53QjETqE?=
 =?us-ascii?Q?p12OSeV5QcWCwwgnBwUMjMEnWBvlkbcgd6qHrL378ozonvnI3RIwk/MONvYL?=
 =?us-ascii?Q?hTOgrrFKJne8z402II1jblger7OIJcK0u03MVublHR2mH9CX3fASf/p1gnNs?=
 =?us-ascii?Q?3ohutDj/fMbXNmw0lDW67Lt3Ta/IiQSh0B1qXdxkmU7Xmpl06NjNwDp8ocDq?=
 =?us-ascii?Q?ZMdL8bxaAFfBiD2hKyokTKWHEaZFynuDefczMLUeW+N4+cX3wtaEuUDXm03n?=
 =?us-ascii?Q?vn5OnirqyyUfIRw997HVd4TMq2c16pmJkF7LPFWzyD6djfnVg/QJnGduWD3t?=
 =?us-ascii?Q?9BO98wqZExOCBV1CdD7VgW6laydy2gXYeBQsthvl1b+d9HAGCNwLULghUfbi?=
 =?us-ascii?Q?vPDQs9X317/44XieJZC0Ixu422+QHnWH1+HshIcsVMnMdu+OTq4VKkzdbxck?=
 =?us-ascii?Q?iBvLLOB09xklKNnX/aSlNypc541OFKh+uBY2DCCTZmkRMIVIRdWSW40phnzp?=
 =?us-ascii?Q?EO3lsst01gbV/Sfpb76QXy5QFpfKL0ZXguGx6RZCljidV7gr+ztvmOg43pdp?=
 =?us-ascii?Q?ZacAvxeVc0PApePpE8cwqj/fcJzFHOL9H+ct/8O6GwcSplhH9kW6YT1tM4o4?=
 =?us-ascii?Q?9zqK5WU6mhOGCJHCKD3LPWh4mMMNN3/rbynZgA9k+77fTHJ/EtjnzrZYrRrQ?=
 =?us-ascii?Q?E2CrpXfkmmYCPnp2fTyadvP8rjCrHN0BSLBvP4BzoeWuKex3qA+p1KLeKsMO?=
 =?us-ascii?Q?hfzIUdUBCAif7m02qB1zkQz3CxSArvvUi8rcZLhY2prlQM9IGdd5JL/KoYkg?=
 =?us-ascii?Q?hWdjG/LLSsvImub9ietBXzVy6psJPco4LC1855oQuGQUmVuoTo+nnQ8gEZoh?=
 =?us-ascii?Q?MpRAaWyNx2VjnS3lLWY/v5dfBEKGMBExJFAwQ2vjs20RBBxjsjHr?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0734bf-6319-458d-75a8-08dee29a956d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:49.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PbN7wZ1IfQdAK3BQXJX8QnkS4AjpUncf+VCt8u1SPHTdmPCv/eC5NToaAqc13ry+fmYeuuSSRJ1OIcxszpS6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

dw_edma_pcie enables the PCI device with pcim_enable_device(), so IRQ
vectors allocated by pci_alloc_irq_vectors() are released by
pcim_msi_release() on device release. The driver should not call
pci_free_irq_vectors() manually.

Drop the redundant remove-time cleanup and rely on the managed PCI
device lifetime instead, as documented by commit 03e4905402ae ("PCI/MSI:
Clarify pci_free_irq_vectors() usage for managed devices").

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - (Re-)collect Frank's Reviewed-by tag.
  - No code changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 791c46e8ae4c..5e81a433a957 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -555,9 +555,6 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 	err = dw_edma_remove(chip);
 	if (err)
 		pci_warn(pdev, "can't remove device properly: %d\n", err);
-
-	/* Freeing IRQs */
-	pci_free_irq_vectors(pdev);
 }
 
 static const struct pci_device_id dw_edma_pcie_id_table[] = {
-- 
2.51.0

