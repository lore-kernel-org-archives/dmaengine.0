Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BFD4AF68E;
	Thu,  1 Oct 2026 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844187; cv=fail; b=GMEMzF6mUG8BwBrgHLLEJytxv5gVJjf3H5yF4gBzxxJI3uxS0NYX8Drs4w84aFCD6RghKfTPlQh6wN5fE7Tu5LQN4jdBmJWu6AFFaRAFbYVAVf3n2af7q7HcvxE00XuS5tqn9tUITEmatpUsis9MFK/Ri7LOl9JMZ881ZSye9Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844187; c=relaxed/simple;
	bh=+5z65Zo7uM2+AWmeb5LWkJrCDpwqybj4sj4YDnwJd0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ja6rbNN5OUMb7wjSTii1tIdOXruYsHrX4OGjhn4U8D0Ri1zPKRhCwypMDU4xuT2U1ifVf2katehulr33nqPV3o1O/Rb3eMKvmsrHJApn6Gv3ZG+lVcFbHZU1brBjaGKco/OheMsx0jM5HR7KZ2UehIT/jQ2kizqc3HHoDn+8esc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=h8Ll9DGv; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=jOjMvgvl; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="h8Ll9DGv";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="jOjMvgvl"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691710F01294534;
	Thu, 1 Oct 2026 03:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=88Cra6DSF83g0CQUvWV57RXQjokmQ1yalUQxDlTvc
	4U=; b=h8Ll9DGvF9qXziCYJ52lF3W2MWdvWrjAZ22peZgrO7nPm9DcwnwD61DjL
	y6Ism44lX7i148eEsOV3lHl7LUkJVVrMPDTKon1dPKRNEtAjkeU4eFmx22+AEUpk
	zkUrLgncpFt09rNTfLO4071pCz4w3JmzBkTVgpcGxwqEAj0xsGRQuIZTm7+z+Hir
	F5be82po72wegZ6d2lng4C1P4ACvhgdFUO4o5clLCxgXDGrqq+TgxlX2O2Mjw7y4
	+/yddmzJHxkNSnpMgrHseo+u3VlMfHVZjoseOhpmSvy8hXpK5eXMeNtGKSIIn6WN
	Bqgf1LhhSzksCZaIeYiybLx8uB8gQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h1eur9pv8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfxenPAVCaR7CYrUu2U1yD5FA/7uTPTmh7djeTiMTyCUNUV4kGpEbSp11VTu+3uHkOgb1Sk3cmpfSgSB0+s79xzgxdIpt5pppv4fu5ztDk96u12nfoGbMpPKZc0xXo+d65FgiyGHDTxJ7ikFQbfjFjfNmo5gsfDcOUIhDfee5UoWdC56PU9FjyH+zZs1oiy5vHohXKT5jVQaHgKKeOv1OYVKILtZJ4p4EObHEvaJbhrqPNiOsLiMWTjg4hh6ExgLRIyxzAge0WxfQo6Uol+lcO2KOhjj5D5cjzabeTjAPCV4+xx9AZXg9CD3KnAIND13zuBdSaW+eNZOU8CthkXMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88Cra6DSF83g0CQUvWV57RXQjokmQ1yalUQxDlTvc4U=;
 b=NcyNGLbJwkvhTHl0PsKAgqAU2ZHjstNGGhNI3M5iZpclLniK+231KrdA2jGdHMekT9Qt6PkaK6ELKBO5Ai8eZ51nqclcI7v71Pf1vVtXqk7a6wT9gxdsNoHYtbA4Kb+2zs0xo3LXq0GXABo/Zyh6Pne/jikD2EXe01CVUQiu+DS0Od/2OauT/OHbwfhfu4z59Hivc9+pttNUbCQBzRMiQeHiEjHYfWLJ5Y/sZVKilouifhkgW2PWOr9cRdN8UpyE1Yt7ee65sSRqfop26ohnU2BBHD49N/983xC/Eoq9qcjQy9v6jq3EaB2TvhtU4BMXKHY0cd3WOk8MreX/47OnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88Cra6DSF83g0CQUvWV57RXQjokmQ1yalUQxDlTvc4U=;
 b=jOjMvgvlHYW9k5QxLrhREgodNQfoZU5svcSPgl80ZdpnQ0xq8ZFOZT4TyY04peGC7nnGyBLFwQSPUHZttgvvRIpieQMZD07L05lFKiibJDNtq65Sha9jyOhuYF4c/7EYwMpkLd6rBa+o1GNSz5SZt1vSpbK7k792zjtMcFsH+Aw=
Received: from BN0PR04CA0003.namprd04.prod.outlook.com (2603:10b6:408:ee::8)
 by DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:42:38 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::74) by BN0PR04CA0003.outlook.office365.com
 (2603:10b6:408:ee::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:42:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 08:42:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:00 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:00 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s1630551;
	Thu, 1 Oct 2026 03:41:56 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 10/19] dmaengine: ti: k3-udma: refactor resource setup functions
Date: Thu, 1 Oct 2026 14:10:26 +0530
Message-ID: <20261001084105.1692228-11-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DS0PR10MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b86669f-91bb-40e6-f6ec-08df1f97f1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|921020|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aa3wzDGCNWya2fzFmNqWsQ/uJ86sgoJGE1RQ/ub9KdIVZN9W+2ViUiF0/xBap/lBqQGJx1vRD4IFhn1B7zaVWJfJUtqbELD79XTSHgsPoI/x2wQwbWD2pKytHq/EwhrEgPUWaL8/ILyENp136HTId0ArSP95qZIFVSWChXE2k2sqj/3H0fFEYTy6SRK7295P6XvcH0vFKcLy1U76ptj5/Yo6MC+dEvxh5as1aQXkkfOF4xwCGDx6SnAdVET12it9T8iAqtdd+enPhfSn+fPuxaJqI/8Lkas+KKK+gPUASYtoKnTJKlGC6NMZjJi6TbxdGgz7gCJ80IgXXWdPBCo4qeLIt4pAHyoboiNsfceQOdO5a47FxTmVXLfLjSJCK+v2ZBpBnqYzhF10LSO6Qj3Dkcn6NEHt8UEQcpiaqm/jhl9zK282JaI863YYgeosp/QNabQTnVVXf30GZBX3/lwcOkTjRTq2L5c7F6r+thryS4sqfxtAvD8OpupeKWsX1djRK5J2UupegSE/m5GoZBoMsC3D9dPlKdwsVq0mVJilmK0OefPCQi+XlXw6RlEwqRToBw6BAhdL1i6Q13x4Hq4aKpDlwRaGs0Gk4Iwa5mGerLme0SSXWCZ0Zdt7j9FN28p5dMPOJPUIRgKErS6HeuzCPhc8sarGZH/qwSpWEkjPwhGt3wHLs5X9LmArCwQQHU3HgdHpma0//XwzIjBF98ohcwlvMeNaQeJfn/cz6te05FRgKdsAJdjf1OVgrUUbZ3Ke
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(921020)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pBvH6ZDxbvoW3YYiwifblSsjeAXfQRmqGlxX32+jSaFIQoASC7o5wrlt0YoEykE6CPWkzCIgLTziz6igJNmVLpo4OQwtifIvjEsMF0pSdAWE5FNATLm/GKZfIJfWthgU994bLMyvIlo1GVnQ3dg6X5PTHEAIDS2nz4WowWOwQRlGL9FnUOQUg0Zgt8Uemkgc3q74UbOycDgYDqTLGfnELbZq8d8TCHI/rwYI9qAljqf/R+zebWgp9HSg3IqibXFpmZgsfUppF3EJfqpnT6tmlvdDQr1T6OBKeRAcuy46BCkHltX6tzuQNN9ne3zZ3ZzdmVQFwGb8bsqqcLejystDciCOZRMQgi1G0VVv/lYfXsa0JgU1aZLolI1ZEHSo3JCpbQzsIjyyZ9PwdvMbGXgsLrglRbDEmfhuVlvU3dh8mgDsI9BI1ZR9aW5GDE8WLBQU
X-Exchange-RoutingPolicyChecked:
	l7fVYcB9ip9YCJlzKbDQwKrLv6p+ACSjGj6yvUdWsKfI/hmCQTszsTcJJDpoh3q1GNDYS+vB9I8LF+cyN6dM8zBOSrwZRsveU1Sc8+DzLAtPESkFzKmi239dEOnrgDcrbhWtbDrIRitGcoiyBzwk+r+zaK5yfxptf0dBdt7RfkIvGVyfpx21khj68BzpALad3M54x66aNkoWVP6ww+5mFXGlXnPGz32W+yMM4lCeN397+Z3f7hvodz43m9rBpN0apyvUfye4tQeCHqlKL+adB22I4A+32oUCJD2pNlF6IdgohZvPwELlvKTBLb4KdsGySDgnyjQbJZj2W/zyoeQczQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:36.8515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b86669f-91bb-40e6-f6ec-08df1f97f1f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7933
X-Proofpoint-GUID: L1KNSRRQSpnPAV5SKseYv1Q0phhNjG9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXw3G/wQrVjA2E
 kZ1vazb/jLbHvxJurwu6Q+FTIEzotU/A1zV1BaMllcMgUzj74Cp/T+dMnooX5cIBsaxkNH+70m2
 uVYmBHBq8LrqOP80x5O8EH255vvlLJHnipvk7P3FW46TTqi3ZNBA6bWHiziEFPkyF8OeyJZSqEt
 cRr5698hVGz4XGiwTNU4gquP0bZqlCtAaNuGkYlLr/iyammi7LitEro2kpu2uanLthAYlzHeh48
 IBF2UnLHSXgRgX1v1PFOTyUG+w+PtEIO6jUuNR21WNb2d2MNll/xF2XWZj5N5G6J3w1mwFLBhj/
 F6D5hp/hwiMuyyF7KDA99MliO/ll37yEanVkf72zFm1D4BDfhOsFxwxFSQYXKYuG1iQ1yxE8yZ1
 ZhfBHRbNPnWqCwaFYBtGlOq9M1bJgpuU77uXdk7J6I/+VGX4ylix506UVxToJhiBZy9ZJEQ/pnK
 Hg5GKq7RTH/02AP7Yrg==
X-Authority-Analysis: v=2.4 cv=KvzYSmWN c=1 sm=1 tr=0 ts=6abe1d0c cx=c_pps
 a=ouBVT1c3MJkzDXWVqRnxag==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=I_B2hWj7ayHADsQg9NcA:9
X-Proofpoint-ORIG-GUID: L1KNSRRQSpnPAV5SKseYv1Q0phhNjG9L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX0jBXjnxWgiqG
 dZnfesDjOAOLgq8ZpHifGcM0Vegv49mTU87fQo2uNUyjZwOuejhlMJ82fSiMI8X8F3ewMuMtjJS
 UnynRfNVaL4T/RPwI3Chu+O/q5OWXSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

The implementation of setup_resources, bcdma_setup_resources and
pktdma_setup_resources is largely shared between all K3 UDMA variants
with the only major difference being SCI resources setup. So,
- Move the functions to k3-udma-common.c.
- Split SCI resource setup for bcdma and pktdma into separate functions
  in variant specific driver (k3-udma.c).
- Add function pointers for setup_sci_resources in udma_dev and call
  them as part of the actual resource setup implementations in
  k3-udma-common.c to retain the existing functionality.
- Also since setup_resources call udma_setup_resources which is not
  required for all K3 UDMA variants, Add a function pointer in udma_dev
  and use that to call udma_setup_resources.
- Rename setup_resources to k3_udma_setup_resources to avoid polluting
  global kernel namespace with generic symbol.

This refactor improves code reuse and maintainability across multiple
variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 206 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 184 ++--------------------------
 drivers/dma/ti/k3-udma.h        |   6 +
 3 files changed, 219 insertions(+), 177 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 975c2e799076c..2c009daadbfec 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -8,7 +8,9 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/soc/ti/ti_sci_inta_msi.h>
 #include <linux/soc/ti/k3-ringacc.h>
 
 #include "k3-udma.h"
@@ -2339,5 +2341,209 @@ void bcdma_free_bchan_resources(struct udma_chan *uc)
 }
 EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
 
+static int bcdma_setup_resources(struct udma_dev *ud)
+{
+	int ret;
+	struct device *dev = ud->dev;
+	u32 cap;
+
+	/* Set up the throughput level start indexes */
+	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
+	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
+		ud->bchan_tpl.levels = 3;
+		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
+		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
+	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
+		ud->bchan_tpl.levels = 2;
+		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
+	} else {
+		ud->bchan_tpl.levels = 1;
+	}
+
+	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
+	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
+		ud->rchan_tpl.levels = 3;
+		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
+		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
+	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
+		ud->rchan_tpl.levels = 2;
+		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
+	} else {
+		ud->rchan_tpl.levels = 1;
+	}
+
+	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
+		ud->tchan_tpl.levels = 3;
+		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
+		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
+	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
+		ud->tchan_tpl.levels = 2;
+		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
+	} else {
+		ud->tchan_tpl.levels = 1;
+	}
+
+	ud->bchan_map = devm_bitmap_zalloc(dev, ud->bchan_cnt, GFP_KERNEL);
+	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
+				  GFP_KERNEL);
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	/* BCDMA do not really have flows, but the driver expect it */
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+
+	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
+	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
+	    !ud->rflows)
+		return -ENOMEM;
+
+	if (!ud->bcdma_setup_sci_resources) {
+		dev_err(dev, "bcdma_setup_sci_resources is required\n");
+		return -EINVAL;
+	}
+
+	ret = ud->bcdma_setup_sci_resources(ud);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int pktdma_setup_resources(struct udma_dev *ud)
+{
+	int ret;
+	struct device *dev = ud->dev;
+	u32 cap3;
+
+	/* Set up the throughput level start indexes */
+	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
+	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
+		ud->tchan_tpl.levels = 3;
+		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
+		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
+	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
+		ud->tchan_tpl.levels = 2;
+		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
+	} else {
+		ud->tchan_tpl.levels = 1;
+	}
+
+	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
+	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
+	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
+
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+	ud->tflow_map = devm_bitmap_zalloc(dev, ud->tflow_cnt, GFP_KERNEL);
+
+	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
+	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
+		return -ENOMEM;
+
+	if (!ud->pktdma_setup_sci_resources) {
+		dev_err(dev, "pktdma_setup_sci_resources is required\n");
+		return -EINVAL;
+	}
+
+	ret = ud->pktdma_setup_sci_resources(ud);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int k3_udma_setup_resources(struct udma_dev *ud)
+{
+	struct device *dev = ud->dev;
+	int ch_count, ret;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
+		if (!ud->udma_setup_resources)
+			return -EINVAL;
+		ret = ud->udma_setup_resources(ud);
+		break;
+	case DMA_TYPE_BCDMA:
+		ret = bcdma_setup_resources(ud);
+		break;
+	case DMA_TYPE_PKTDMA:
+		ret = pktdma_setup_resources(ud);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
+	if (ud->bchan_cnt)
+		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
+	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
+	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
+	if (!ch_count)
+		return -ENODEV;
+
+	ud->channels = devm_kcalloc(dev, ch_count, sizeof(*ud->channels),
+				    GFP_KERNEL);
+	if (!ud->channels)
+		return -ENOMEM;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
+		dev_info(dev,
+			 "Channels: %d (tchan: %u, rchan: %u, gp-rflow: %u)\n",
+			 ch_count,
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt),
+			 ud->rflow_cnt - bitmap_weight(ud->rflow_gp_map,
+						       ud->rflow_cnt));
+		break;
+	case DMA_TYPE_BCDMA:
+		dev_info(dev,
+			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
+			 ch_count,
+			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
+						       ud->bchan_cnt),
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt));
+		break;
+	case DMA_TYPE_PKTDMA:
+		dev_info(dev,
+			 "Channels: %d (tchan: %u, rchan: %u)\n",
+			 ch_count,
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt));
+		break;
+	default:
+		break;
+	}
+
+	return ch_count;
+}
+EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 21978f17e327f..9a261747c8709 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2083,7 +2083,7 @@ static const char * const range_names[] = {
 	[RM_RANGE_TFLOW] = "ti,sci-rm-range-tflow",
 };
 
-static int udma_setup_resources(struct udma_dev *ud)
+int udma_setup_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
@@ -2245,74 +2245,13 @@ static int udma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int bcdma_setup_resources(struct udma_dev *ud)
+static int bcdma_setup_sci_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
 	struct ti_sci_resource *rm_res, irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
-	u32 cap;
-
-	/* Set up the throughput level start indexes */
-	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
-	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
-		ud->bchan_tpl.levels = 3;
-		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
-		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
-	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
-		ud->bchan_tpl.levels = 2;
-		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
-	} else {
-		ud->bchan_tpl.levels = 1;
-	}
-
-	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
-	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
-		ud->rchan_tpl.levels = 3;
-		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
-		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
-	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
-		ud->rchan_tpl.levels = 2;
-		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
-	} else {
-		ud->rchan_tpl.levels = 1;
-	}
-
-	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
-		ud->tchan_tpl.levels = 3;
-		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
-		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
-	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
-		ud->tchan_tpl.levels = 2;
-		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
-	} else {
-		ud->tchan_tpl.levels = 1;
-	}
-
-	ud->bchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->bchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
-				  GFP_KERNEL);
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
-				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
-	/* BCDMA do not really have flows, but the driver expect it */
-	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					sizeof(unsigned long),
-					GFP_KERNEL);
-	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
-				  GFP_KERNEL);
-
-	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
-	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
-	    !ud->rflows)
-		return -ENOMEM;
 
 	/* Get resource ranges from tisci */
 	for (i = 0; i < RM_RANGE_LAST; i++) {
@@ -2476,51 +2415,13 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int pktdma_setup_resources(struct udma_dev *ud)
+static int pktdma_setup_sci_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
 	struct ti_sci_resource *rm_res, irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
-	u32 cap3;
-
-	/* Set up the throughput level start indexes */
-	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
-	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
-		ud->tchan_tpl.levels = 3;
-		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
-		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
-		ud->tchan_tpl.levels = 2;
-		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-	} else {
-		ud->tchan_tpl.levels = 1;
-	}
-
-	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
-	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
-	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
-
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
-				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
-	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
-					sizeof(unsigned long),
-					GFP_KERNEL);
-	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
-				  GFP_KERNEL);
-	ud->tflow_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tflow_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-
-	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
-	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
-		return -ENOMEM;
 
 	/* Get resource ranges from tisci */
 	for (i = 0; i < RM_RANGE_LAST; i++) {
@@ -2631,80 +2532,6 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int setup_resources(struct udma_dev *ud)
-{
-	struct device *dev = ud->dev;
-	int ch_count, ret;
-
-	switch (ud->match_data->type) {
-	case DMA_TYPE_UDMA:
-		ret = udma_setup_resources(ud);
-		break;
-	case DMA_TYPE_BCDMA:
-		ret = bcdma_setup_resources(ud);
-		break;
-	case DMA_TYPE_PKTDMA:
-		ret = pktdma_setup_resources(ud);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
-	if (ud->bchan_cnt)
-		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
-	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
-	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
-	if (!ch_count)
-		return -ENODEV;
-
-	ud->channels = devm_kcalloc(dev, ch_count, sizeof(*ud->channels),
-				    GFP_KERNEL);
-	if (!ud->channels)
-		return -ENOMEM;
-
-	switch (ud->match_data->type) {
-	case DMA_TYPE_UDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u, gp-rflow: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt),
-			 ud->rflow_cnt - bitmap_weight(ud->rflow_gp_map,
-						       ud->rflow_cnt));
-		break;
-	case DMA_TYPE_BCDMA:
-		dev_info(dev,
-			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
-						       ud->bchan_cnt),
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
-		break;
-	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
-		break;
-	default:
-		break;
-	}
-
-	return ch_count;
-}
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
@@ -2747,6 +2574,9 @@ static int udma_probe(struct platform_device *pdev)
 	ud->decrement_byte_counters = udma_decrement_byte_counters;
 	ud->psil_pair = navss_psil_pair;
 	ud->psil_unpair = navss_psil_unpair;
+	ud->udma_setup_resources = udma_setup_resources;
+	ud->bcdma_setup_sci_resources = bcdma_setup_sci_resources;
+	ud->pktdma_setup_sci_resources = pktdma_setup_sci_resources;
 
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
@@ -2876,7 +2706,7 @@ static int udma_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ud->ddev.channels);
 	INIT_LIST_HEAD(&ud->desc_to_purge);
 
-	ch_count = setup_resources(ud);
+	ch_count = k3_udma_setup_resources(ud);
 	if (ch_count <= 0)
 		return ch_count;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 0b0626b67ad19..4dd597ef435b8 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -358,6 +358,9 @@ struct udma_dev {
 			 u32 dst_thread);
 	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
 			   u32 dst_thread);
+	int (*udma_setup_resources)(struct udma_dev *ud);
+	int (*bcdma_setup_sci_resources)(struct udma_dev *ud);
+	int (*pktdma_setup_sci_resources)(struct udma_dev *ud);
 };
 
 struct udma_desc {
@@ -644,6 +647,9 @@ struct udma_bchan *__udma_reserve_bchan(struct udma_dev *ud, enum udma_tp_level
 struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 
+int udma_setup_resources(struct udma_dev *ud);
+int k3_udma_setup_resources(struct udma_dev *ud);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0

