Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C541D65D;
	Fri, 24 Jul 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888607; cv=fail; b=Zc2xGeD/pqLe4rHDMIuLIfZPO62atvoRLhOCceB4LpG8K1+bLegCB+jm0o8QBopT5lignMtrjGlcJKI5iDKaLQP8NSsj6nrASwZ3k1VKxwLgcRF1r/nvxaTFrqDhmP9y/f62NFsnDnSZLvQtXGnMt2sfEiopYi8sZtck6/a/CFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888607; c=relaxed/simple;
	bh=UdzNBMuE64PSapCQLmvMR5dK7I0CESelKeukkQ8ipm4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWOVPTbrwapGebttoJa3XRSnx+PDb/sUYdSorf1QJMOhPJaff28ioQ+o4ON1GiFARIT544cyFheO9mEyD8hDA7quw7TfA04o7ww1p356VzefBEiXAuTH5b0E7ILiXcZ/f+mis9SCedqgO8xueoOyivx2I4z2H4TCBOzU3M832M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KnMCBMGU; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G/w4L914; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KnMCBMGU";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G/w4L914"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAF3Q3821212;
	Fri, 24 Jul 2026 05:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mmVTWlnyzo+ApeBnFdQhkC7FsPHnp6KdcChlknerY
	Nc=; b=KnMCBMGUKVCZWojzWDZiSALLFkSB865LKhhMCfCrbpLePelLITrxFOrP8
	L64mTX9LwjnBbmAHfXigNeeuzpOANFnfK1OAgAFc1m2gnbjecjYN8Nfh7pH/yCa/
	5+FK1CWuZze6pCLdCx6NuiSGHCgzLaAqhnC+BT1v1vr5uweBWfvg5pRBW/1Tlmgi
	mUeAhnKkqSCs5CydHlruro7VNuG+rc8yCs70KIyjdAGK8SpfIOwFRmvI+7aGLdhT
	WmZ+Oiercf4CT7itOhQ7BuW4pm1LM7seHgaCD/J1WIPQ47nwnrCy94p6X3OkvTtH
	+8IJdAGBDJ4shrfXl7nTq/cKZsBOw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fm4vw0d6x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:23:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvlmfmHv4w2H94X14ODYLJpTq9RacuXp56w7nX1wxGYJbEy6rHTqC/q2cCKu7DlIdp200kg8dNO1T9GjMcbtoPsrwu5J7QiAMQC5wn9zV4kUk4swH3EESOeMTaMTKHavQRDrloADajJreUk9FJOhkBH5gIrSVUhCNvxempmTSI6RS7+poWp8s+9LXmVSKgC2+gbRP9ySeBXzDrRQTli44/Mb36t3sWkFlDAUmKXv5EdduiTfedwtC9mQZqVQRCnOL+DV4V+YfpYdAVQTm0pGYH0umrIjZ05zBLPhaHTZQ1t5r8aJvpuWzDTZg+NG7cCsA27G9crMvQOz+67Pfm4e5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmVTWlnyzo+ApeBnFdQhkC7FsPHnp6KdcChlknerYNc=;
 b=XFMIZrfRMNQBc4L/8gKV7A8igccj7ZKXOi/uFb4dW1H8tFEhnFVfwHbRrqyD/TkklObUt3CoqJ/TDdetuQuAoVQX5U3L90dQ56/yMloVr7A8b++qKlp7VUX4tZrmU1yNjCceoS8db8Jm/qPBSAFnUrAF/TTXpChxF1YlX0Qtqgxqh4K1+pP6l1uUTbanLFwcCxsdCr1F1AneF8FIEIMnGxoEDsuns0hqSFkBODX7zCyhmwgD8vcvdLPJzAY/ZiojBQEP+CWCvqmLihvybxWgsXXjzl4Y6KlYBLzfbsjF8L0KqYm+SelFVZitgqjBj/b7VAdvdIgpP3gdYRexAqer/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmVTWlnyzo+ApeBnFdQhkC7FsPHnp6KdcChlknerYNc=;
 b=G/w4L9140uWNeF5/vkdkMA8tbwEjT6EN206/ENKBlZ18zyiNnANWZ3guonOUGXv/mcwQDcCTqkxilVdsydFTvdbljlU4faPVq1T/pqpJvFzApgu5XZxSqzo1Gn6qp3GRYO4t74R4Okcx8OPLDkseCpaMOwI8x6wV6gRX5An5A7s=
Received: from CH2PR18CA0032.namprd18.prod.outlook.com (2603:10b6:610:55::12)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 10:22:56 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::ad) by CH2PR18CA0032.outlook.office365.com
 (2603:10b6:610:55::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:56 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:55 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:55 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFW3017088;
	Fri, 24 Jul 2026 05:22:51 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 17/19] dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
Date: Fri, 24 Jul 2026 15:50:50 +0530
Message-ID: <20260724102115.2854-18-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3c319a-475d-415f-faaf-08dee96d8752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|82310400026|36860700016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OqLlMAwdHGWVMJ3AMkQoFPCXglOXT3+3Fo/PUZqF+9h5nn9vLoK1gtWQOSjuaAqOKVli17ZhkHc9kFlbDDb/FXNdJvmYwiMv6wO75nuj4w1GjUJEF2yoW/fVFXBkx4kPmZx+xG6cRX/zm29DX2GIEcIcDl1fLd+qBmayn7jQXlCA1LVEt3PWgFOuOwwsJ14q7OPFUyPc2xXwOSjPbyxOMqpcUnBa6jJlnJnM/76AfMknB0LN+0oX0NSGNjjcvXBo4IEmndFIRt4ASfiqBuHc9MgWKkk/OCb+EIcb6+JiK8b7wcW1CLQVT1jisEnKfgmk2MIaSTz2a6PkbFhw2X44a+tq6ElKNsEaRqFij4FuS6MkyiV9MTqF4O29/ZEu/2d9CV085AnKil+r0OwJlBrKTKlCLmVY9DJhFrceYxtlOCjHEj7GRyxZtW7DXSKJJtJCPV3BWAkJdvo766cvLofI452JSpKMEypTN4eploy+TlFR1JCXg8aNq09dOOp3RLUT4yPsc8D0r1VFJ+ftBNBsN2pNjWemNSOcKd0tPrFhwh4PhUkfS4AYby8M3tGEnx22CYmMbJ/RqAyHh+1FprzQb45A3kas42Syavjnl1CVqTve/1hd7n9P6mky/Rf6Pdo0gx8JCpk/H+hDD6LHjZRgxFxwuvOk+upd8IGC/OSnaeoPV0J2stwcusO2nPJnjCrJ8eq+hJDvqM71YnoDDWU57yxYEOAoYSQHr6dM/ZHgUpcVUc6tAOkrU+SYx0S9DGrO
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(82310400026)(36860700016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ggzqXIiNYWOd0YcSTsmad6s975nocyeoZ3fIkLGrXwE5NYuDW8GHdRh7MBOmU112dUhAZiiJFKoiuAuHfawyHsZW2F4+bRfSCMgVmuwgz4BKggFsrvGzZrl5tMPOiPqEQZu34bloPOd/fjCuFlT6/auWLapbB6sNaTKRigrgRm1Fl+HZMwk+QHL9dt9AnJ5xAPLCOpAVZFdhUA7B0vc1Lmk0DknWdINdY92Q98g45EE5fx73hX7BY2C4T9wSRggth3G1qTZz2kEmcNvY4hIw+HH/tIQVvuOvWs//nYDVpxs8MaPL9O2DOnbRUvrqk+7HP4BfqB8EvC8UT88UYRl2wwSvXDlbffqaMjnkZFpzeAw42V0M0LlqNzqEN/5HBNqP1r7nBT8I1FFV3bLMhbxaIqzJ1MmkVMfNT+RyxH+ZFtaJFJEoD70tlviBLN+fLpA3
X-Exchange-RoutingPolicyChecked:
	HY7zlceGZKaTK3tpZ/7Xw1oltKzyA+mP3v/Kjl+GaNuaC13kScFY09AmDeC3fr8G/EM8SXg60UcTdGMXrD2YVUz1FD8mcy3nRKMlbzMwLysW3hxQS82/JMdDNe3VvsaFMDDC2w5r3FPWVzrtRwx8sEdYqrNoHULQc/JBCJ8pQcjGFPSiqeF4CAfqaoyQUgOgtq0xZbcrk7i2mQfKUICx1fmy7oNvkD9T1zTydnvKfAzDgB+EP/8hpqHpnH9M7MEhbXWZlYuEb3TmrXIXOwPO2m85hN6qgRH5oO5Lhkx/TmApllaAGpJz0KGemxBpVBDwUIuG4nmTfMYteNuk5ctmNg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:56.3093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3c319a-475d-415f-faaf-08dee96d8752
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX5U2EACEWEeH+
 ++Ct96ECk4GZTA7Y0uG2m5Yv/mxahW8myr+iFnQxABb70SQm5h/KASsa6QSCVesbqVYpEqB17s6
 V1GHzz/wGp6DmajGo9yvT3mqs6WDBMK+8/Xupx3BiQUmrp3A+gCfRPXBQCvUuVGsje1zxesxvfW
 nsfZc6F52V4HNYrioO3bU+7DizTepbKXL9ZN2l7tcb+jLqhAvjjNUaQBxgx9MFXYKoSGk6CPIWG
 d2MZezvYDZM2MFGQlYoaK0tyqjCyRlcyfYrO9SNVBSK84A379clnA9Hago5LlKCYFrkk0fQ9e0g
 nUxvTCKMgm+0nPlZlB1q9cp7lhuIVBlMdVa3TF9zcmSGy0mgtVOggkMiif9d4gOXArnB9ykOqCX
 QWIoPuWrCrxECEBiZXKCV+oa6qlYziSPeARcOldaaT/Ean8TvZ5l0YJtQj0RkUJfpL6ZjKaApAR
 8JbsISfcuAdvQYPHtCQ==
X-Proofpoint-GUID: TNHJA3ySjq1Tw6_cYspkrBRKB5YegWVd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX8DAyDi7U7YY/
 QfpTzeGAEG0pTOmJE3t3FfYwRnonjf73YtS2cK3jyFDJafGSilF4owL1u8iaXqfqSsrJq9CCDBU
 UfJ3Fmylbr3xS5YM/2zSBnGhAyuHfB0=
X-Proofpoint-ORIG-GUID: TNHJA3ySjq1Tw6_cYspkrBRKB5YegWVd
X-Authority-Analysis: v=2.4 cv=feadDUQF c=1 sm=1 tr=0 ts=6a633d05 cx=c_pps
 a=UC1wTn8whqDYkpYF2DSMwg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=kuJ5fwJTF0DCxNmv2DYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240094

The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver.

The changes in PKTDMA V2 are:
- Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
  needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single
  peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to
  PEER registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c  |  42 +++---
 drivers/dma/ti/k3-udma-glue.c    |  23 ++++
 drivers/dma/ti/k3-udma-private.c |  12 +-
 drivers/dma/ti/k3-udma-v2.c      | 221 +++++++++++++++++++++++++++++--
 drivers/dma/ti/k3-udma.h         |   3 +
 5 files changed, 269 insertions(+), 32 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 10a42fff128aa..d7c148ad694f9 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2453,21 +2453,25 @@ int pktdma_setup_resources(struct udma_dev *ud)
 	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
 	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
 
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
 	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
 				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
+	if (ud->match_data->version == K3_UDMA_V1) {
+		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+					  GFP_KERNEL);
+	} else {
+		ud->rchan_map = ud->tchan_map;
+		ud->rchans = ud->tchans;
+		ud->chan_map = ud->tchan_map;
+		ud->chans = ud->tchans;
+	}
 	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
 					sizeof(unsigned long),
 					GFP_KERNEL);
 	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
 				  GFP_KERNEL);
-	ud->tflow_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tflow_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
+	ud->tflow_map = devm_bitmap_zalloc(dev, ud->tflow_cnt, GFP_KERNEL);
 
 	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
 	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
@@ -2558,13 +2562,21 @@ int setup_resources(struct udma_dev *ud)
 		}
 		break;
 	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
+		if (ud->match_data->version == K3_UDMA_V1) {
+			dev_info(dev,
+				 "Channels: %d (tchan: %u, rchan: %u)\n",
+				 ch_count,
+				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+							       ud->tchan_cnt),
+				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+							       ud->rchan_cnt));
+		} else {
+			dev_info(dev,
+				 "Channels: %d (tchan + rchan: %u)\n",
+				 ch_count,
+				 ud->chan_cnt - bitmap_weight(ud->chan_map,
+							      ud->chan_cnt));
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 686dc140293eb..bec4deb480e60 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
 		goto out_put_spec;
 
 	thread_id = dma_spec.args[0];
+
+	/*
+	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
+	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
+	 * PSI-L thread ID before the common path checks the direction bit.
+	 */
+	if (common->udmax->match_data->version == K3_UDMA_V2 &&
+	    xudma_is_pktdma(common->udmax)) {
+		struct psil_endpoint_config *ep_cfg;
+		u32 psil_thread_id;
+		bool dev_to_mem;
+
+		ep_cfg = psil_get_ep_config_by_id(thread_id, DMA_TYPE_PKTDMA,
+						  &psil_thread_id, &dev_to_mem);
+		if (IS_ERR(ep_cfg)) {
+			dev_err(common->dev,
+				"No PSI-L config for flow %u\n", thread_id);
+			ret = PTR_ERR(ep_cfg);
+			goto out_put_spec;
+		}
+		thread_id = psil_thread_id;
+	}
+
 	if (dma_spec.args_count == 2) {
 		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
 			dev_err(common->dev, "Invalid channel atype: %u\n",
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 44c097fff5ee6..41299d3c3d91a 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -174,16 +174,20 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
 int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
 
-	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+	snprintf(irq_name, sizeof(irq_name), "tflow%u", udma_tflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
 
 int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
 
-	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	snprintf(irq_name, sizeof(irq_name), "rflow%u", udma_rflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_rflow_get_irq);
diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
index e7989b0b34cac..879042bff79a6 100644
--- a/drivers/dma/ti/k3-udma-v2.c
+++ b/drivers/dma/ti/k3-udma-v2.c
@@ -753,6 +753,145 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
 	return ret;
 }
 
+static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+	u32 irq_ring_idx;
+	int ret;
+
+	/*
+	 * Make sure that the completion is in a known state:
+	 * No teardown, the channel is idle
+	 */
+	reinit_completion(&uc->teardown_completed);
+	complete_all(&uc->teardown_completed);
+	uc->state = UDMA_CHAN_IS_IDLE;
+
+	switch (uc->config.dir) {
+	case DMA_MEM_TO_DEV:
+		/* Slave transfer synchronized - mem to dev (TX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_tx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = ud->psil_base + uc->tchan->id;
+		uc->config.dst_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread |= K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		irq_ring_idx = uc->config.mapped_channel_id;
+		break;
+	case DMA_DEV_TO_MEM:
+		/* Slave transfer synchronized - dev to mem (RX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_rx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
+					K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		irq_ring_idx = uc->config.mapped_channel_id;
+		udma_write(uc->rflow->reg_rt, UDMA_RX_FLOWRT_RFA, BIT(28));
+		break;
+	default:
+		/* Can not happen */
+		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
+			__func__, uc->id, uc->config.dir);
+		return -EINVAL;
+	}
+
+	/* check if the channel configuration was successful */
+	if (ret)
+		goto err_res_free;
+
+	if (udma_is_chan_running(uc)) {
+		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
+		ud->reset_chan(uc, false);
+		if (udma_is_chan_running(uc)) {
+			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
+			ret = -EBUSY;
+			goto err_res_free;
+		}
+	}
+
+	uc->dma_dev = dmaengine_get_dma_device(chan);
+	uc->hdesc_pool = dma_pool_create(uc->name, uc->dma_dev,
+					 uc->config.hdesc_size, ud->desc_align,
+					 0);
+	if (!uc->hdesc_pool) {
+		dev_err(ud->ddev.dev,
+			"Descriptor pool allocation failed\n");
+		uc->use_dma_pool = false;
+		ret = -ENOMEM;
+		goto err_res_free;
+	}
+
+	uc->use_dma_pool = true;
+
+	uc->psil_paired = true;
+
+	if (uc->config.dir == DMA_MEM_TO_DEV)
+		snprintf(irq_name, sizeof(irq_name), "tflow%u", irq_ring_idx);
+	else
+		snprintf(irq_name, sizeof(irq_name), "rflow%u", irq_ring_idx);
+	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
+	if (uc->irq_num_ring < 0)
+		return uc->irq_num_ring;
+
+	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
+			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
+
+	if (ret) {
+		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
+		goto err_irq_free;
+	}
+
+	uc->irq_num_udma = 0;
+
+	udma_reset_rings(uc);
+
+	INIT_DELAYED_WORK_ONSTACK(&uc->tx_drain.work,
+				  udma_check_tx_completion);
+
+	if (uc->tchan)
+		dev_dbg(ud->dev,
+			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->tchan->id, uc->tchan->tflow_id,
+			uc->config.remote_thread_id);
+	else if (uc->rchan)
+		dev_dbg(ud->dev,
+			"chan%d: rchan%d, rflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->rchan->id, uc->rflow->id,
+			uc->config.remote_thread_id);
+	return 0;
+
+err_irq_free:
+	uc->irq_num_ring = 0;
+err_res_free:
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+
+	udma_reset_uchan(uc);
+
+	dma_pool_destroy(uc->hdesc_pool);
+	uc->use_dma_pool = false;
+
+	return ret;
+}
+
 static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
 					 dma_cookie_t cookie,
 					 struct dma_tx_state *txstate)
@@ -847,6 +986,7 @@ static int udma_v2_resume(struct dma_chan *chan)
 }
 
 static struct platform_driver bcdma_v2_driver;
+static struct platform_driver pktdma_v2_driver;
 
 static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
 {
@@ -856,7 +996,8 @@ static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
 	struct udma_chan *uc;
 	struct udma_dev *ud;
 
-	if (chan->device->dev->driver != &bcdma_v2_driver.driver)
+	if (chan->device->dev->driver != &bcdma_v2_driver.driver &&
+	    chan->device->dev->driver != &pktdma_v2_driver.driver)
 		return false;
 
 	uc = to_udma_chan(chan);
@@ -1009,11 +1150,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
 	.rchan_cnt = 128,
 };
 
+static struct udma_match_data pktdma_v2_am62l_data = {
+	.type = DMA_TYPE_PKTDMA,
+	.version = K3_UDMA_V2,
+	.psil_base = 0x1000,
+	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
+	.flags = UDMA_FLAGS_J7_CLASS,
+	.statictr_z_mask = GENMASK(23, 0),
+	.burst_size = {
+		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
+		0, /* No H Channels */
+		0, /* No UH Channels */
+	},
+	.tchan_cnt = 97,
+	.rchan_cnt = 97,
+	.chan_cnt = 97,
+	.tflow_cnt = 112,
+	.rflow_cnt = 112,
+};
+
 static const struct of_device_id udma_of_match[] = {
 	{
 		.compatible = "ti,am62l-dmss-bcdma",
 		.data = &bcdma_v2_am62l_data,
 	},
+	{
+		.compatible = "ti,am62l-dmss-pktdma",
+		.data = &pktdma_v2_am62l_data,
+	},
 	{ /* Sentinel */ },
 };
 
@@ -1032,15 +1196,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
 		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
 
-	ud->bchan_cnt = ud->match_data->bchan_cnt;
-	/* There are no tchan and rchan in BCDMA_V2.
+	/* There are no tchan and rchan in BCDMA_V2 and PKTDMA_V2.
 	 * Duplicate chan as tchan and rchan to keep the common code
-	 * in k3-udma-common.c functional for BCDMA_V2.
+	 * in k3-udma-common.c functional.
 	 */
-	ud->chan_cnt = ud->match_data->chan_cnt;
-	ud->tchan_cnt = ud->match_data->chan_cnt;
-	ud->rchan_cnt = ud->match_data->chan_cnt;
-	ud->rflow_cnt = ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ud->bchan_cnt = ud->match_data->bchan_cnt;
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->chan_cnt;
+		ud->rchan_cnt = ud->match_data->chan_cnt;
+		ud->rflow_cnt = ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->tchan_cnt;
+		ud->rchan_cnt = ud->match_data->rchan_cnt;
+		ud->tflow_cnt = ud->match_data->tflow_cnt;
+		ud->rflow_cnt = ud->match_data->rflow_cnt;
+	}
 
 	for (i = 1; i < V2_MMR_LAST; i++) {
 		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
@@ -1094,6 +1266,7 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->reset_chan = udma_v2_reset_chan;
 	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
 	ud->bcdma_setup_sci_resources = NULL;
+	ud->pktdma_setup_sci_resources = NULL;
 
 	ret = udma_v2_get_mmrs(pdev, ud);
 	if (ret)
@@ -1101,7 +1274,17 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	struct k3_ringacc_init_data ring_init_data = {0};
 
-	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ring_init_data.num_rings = ud->rflow_cnt;
+
+		ud->rflow_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(ud->rflow_rt))
+			return PTR_ERR(ud->rflow_rt);
+
+		ring_init_data.base_rt = ud->rflow_rt;
+	}
 
 	ud->ringacc = k3_ringacc_dmarings_init(pdev, &ring_init_data);
 
@@ -1110,8 +1293,10 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	dma_cap_set(DMA_SLAVE, ud->ddev.cap_mask);
 
-	dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
-	ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	if (ud->match_data->type != DMA_TYPE_PKTDMA) {
+		dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
+		ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	}
 
 	ud->ddev.device_config = udma_slave_config;
 	ud->ddev.device_prep_slave_sg = udma_prep_slave_sg;
@@ -1125,8 +1310,18 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->ddev.dbg_summary_show = udma_dbg_summary_show;
 #endif
 
-	ud->ddev.device_alloc_chan_resources =
-		bcdma_v2_alloc_chan_resources;
+	switch (ud->match_data->type) {
+	case DMA_TYPE_BCDMA:
+		ud->ddev.device_alloc_chan_resources =
+			bcdma_v2_alloc_chan_resources;
+		break;
+	case DMA_TYPE_PKTDMA:
+		ud->ddev.device_alloc_chan_resources =
+			pktdma_v2_alloc_chan_resources;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ud->ddev.device_free_chan_resources = udma_free_chan_resources;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 680d776f7ae8c..fc8f0cfe7a36e 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -27,8 +27,11 @@
 #define UDMA_RX_FLOW_ID_FW_OES_REG	0x80
 #define UDMA_RX_FLOW_ID_FW_STATUS_REG	0x88
 
+#define UDMA_RX_FLOWRT_RFA             0x8
+
 /* BCHANRT/TCHANRT/RCHANRT registers */
 #define UDMA_CHAN_RT_CTL_REG		0x0
+#define UDMA_CHAN_RT_CFG_REG		0x4
 #define UDMA_CHAN_RT_SWTRIG_REG		0x8
 #define UDMA_CHAN_RT_STDATA_REG		0x80
 
-- 
2.54.0

