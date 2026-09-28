Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B896D484257;
	Mon, 28 Sep 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584843; cv=fail; b=min3Ov/zSaEkRFKJrobW1fm1GiZI8+CsIBrkCzPmYasKtlOuA9l1/dtC+TPp/vzA7HmTGi3gbqK2/D2y8b3MhQ+y+SqZXFHbIoS0v92zn7DzNXhjakuKesNvHSxc7NVvknX48+KPhmjHe6GieJwS+5Xh4dYs/jse0+hzR3wsxBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584843; c=relaxed/simple;
	bh=QEEDygfSc8NK9vYnQ+MPlGdNB8U22aj1GQufiKqEfmQ=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=OmHQ5GmIAhAj76WSwcVYErmWfpy83LqE5KAvZIR31pW+NCVOJvxm17cr1R33W4EUerxw/3ZrWJKzM8+niP694OucPfdfZTAomCA6qwsvoPsIg2HTtCosIUVjkc4sn7jgRIdJlgBURVfrQ2c7rarnPO06lRG8/lWkSrgXa7V8z9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BF3u9mQF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YCl4rSiC; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BF3u9mQF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YCl4rSiC"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S80rtc1237838;
	Mon, 28 Sep 2026 03:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VvtPoLFQ9h8KoxtDQh4TCBSN9JU7ylGWVkulx4I7y
	p4=; b=BF3u9mQFUpWgX8GoW9FrLHtpoP9flDoeg2h9QuPogRv26KeKXgXAKUaXZ
	HFsaJL1NcW9SHPpfcUBFB4Xd1xaHD78gLqJmT6Z1eexxEtW3ZMTmtrTi6K4mqWv4
	U02PT0aNPLJDrvwhu7khQKAA/F7uVOUFVPei/GWl5jiQK8l2V7nG3TSOdhmQvJTy
	o/VqNNIf2QFYqH8GUkhCcYUYPV4yfp+6QthN5Ck3hvvgccTav0f4aBgoOqB3k+H6
	wXOzaxjxFAs4rTzGLh7ZsrFBIhZCcrHQVbHkr8A35HKJTKgi9MkrRygTo9TqWESu
	Qd5+YMQgJrfSnqQkeBfCSSmN7lksw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nmp03-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoBtWpExyPHob2tj+af5ceDIpmz3A/KU6dkTeCGLG6Yiadf/slWzmphh3b5bz7jn2ptC39rMmkQstr/XRNKUarPR9O4AaOSUu5pzRT9fD4eSdVerxPwA6xNac8BkmVyZWUScpqj+BEI8ItBBUaRALvPUpg7scp/SFMdyqkkWgHpJcKduFUO0x39Bnyt7jsyL+X6PnXXn+YxONaxkwOVEIpLplDXvStYX1liGae8azNUbR8BVDXCRZTZX0fBf1CuKZmf35MrVhLeybLrerJRo8BvNXReOHGDsma8q1JEzGidJH64pr7e4bhZ71gcUtV31tmm94sq84kn90vaOVXOojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvtPoLFQ9h8KoxtDQh4TCBSN9JU7ylGWVkulx4I7yp4=;
 b=qzKp3qIkjyHvNgIVMrLFdAJUVZdSHaNRRfEgsmkjrXJUKCqCpzs7u4iW/TPRXevYqtSgMwtFKHJiChsMPrUaxRq3AnO9K+QZ+H6Os9x27XxCKztjdgTQzOMzg2C/v4kgfkxWa4KXMyWSclUJ/t0EDPN37ZOMA3i/WDgpFPesRl0lzGVr8esHTNaGW0yg9hwp4ozu0LVIEeBPl11fmzIMhQJ+LIIFWFt7g1qO9M+vsJjVceeWWtgK60+2S572q0CKt/KFqTwaoCyK5+BnITA433ynHDaqpoyYl7KGX/CMQX1aqBppCOjeOisDb9Uu6KjEcqlhJr8EPse5yrruiqzwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvtPoLFQ9h8KoxtDQh4TCBSN9JU7ylGWVkulx4I7yp4=;
 b=YCl4rSiCg6s4MbfGcHUkNglG5v0/SLMR0BtlWafadxmu1j2E4Uu8Lkpoz1WiN0u9A0/qCniCdeg5Ymrz3hT7JkMcwT085qwEU6jncgJaW8CYL2vBu9e4U88pqvRjf5BKjvy5VeAnabDbsaWgcsQKGia4IJPC89rBUQ1qJMCmC2s=
Received: from BN9PR03CA0696.namprd03.prod.outlook.com (2603:10b6:408:ef::11)
 by CH0PR10MB5081.namprd10.prod.outlook.com (2603:10b6:610:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 08:40:21 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::a8) by BN9PR03CA0696.outlook.office365.com
 (2603:10b6:408:ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:40:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:20 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:39:59 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:39:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:39:59 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedg3686893;
	Mon, 28 Sep 2026 03:39:55 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 08/19] dmaengine: ti: k3-udma: move udma utility
 functions to k3-udma-common.c
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-9-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-9-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477460.77164.11377090054201942907.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|CH0PR10MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: a57e55e5-3dc0-4a46-d29d-08df1d3c213b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|18002099003|56012099006|6133799003|10067099003|5023799004|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	paea0v9CxfryNp0AtA3zngOCL91MVh2yWL5wOLf8CN3TkaYE6qQTHL6yNDlfbv2vPsGP38XzS6Lg75Wlk8eUbbrbWvKZfPLsob2Yno2tuU/mHE/HkrkpWwBgT6TGnP88yNHLB149cZqDO9QU5DZbGIPsCr4GxnLpgTd1M1cMyRbdmuYl7PW4ghDotqedTVxipG1E3xdKTpkFA8IJ5aRtuDfo0ora+fjvpWGEmgFhn9HKYRZ4x1mqMxdV7NvgemLfn1X85vHAlhegDcTcKK9CLoN294W5whVkjjuFEkfWBj4SNVbrkbYnyU03pSP59OfiIR6pryM3RnUdMRDsxFEjbyGyF7mq0qUkj6shqylqIcoD+tRP0n01Xug3unbfRsnyQh7vEns3dFfD703MYpcZnAdByt4GXaaWF9CRadNmHgDOSqQJGSv9zcciY/ejkqE08yqR/PjHA6gcwXMMOaCsrVqrPfLZt+zfDS+K3q4UjwIUdopk4OYb1GCXegCEgIfW9jgYq+BcSBV0yUR1pV3Nk6QEWbsNemixVkFFlshPc8gVRLwcbUHZiAFOxBsfAGacFiaCfZ5ZsGus3luZJRBPBRPklt/aQuaLVXn2VnXRwHVLnK+bFKty9b9Av/gBjPL/0Ycrb/SYpPPrcTHlJSh28eEShCiKimHjfBWNosjZEhuMm45liSbXIf79eSaS5KE2qtkfckwNcj7OJwxIlhsNyg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(56012099006)(6133799003)(10067099003)(5023799004)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AMUEFXgREHH05cIg/MRbCPWHT9AUQKoZGTjuR83IOEkFgrCFZY7KcwqbSl53nmsG8PVgJhk52DhPFeE1kijUqdSchv8JjWO5jiKlgw3h7jPf5kyKShnOqf81Ekutnx3+NkkqQOlbsv1Gx2KWngG/YB6m3CwH4twCdCvA9clIOXUuzyd29HnB/B4JOozHcm86Yzi795voAfwmUpn5xmOqBbO8CyuqAuPzEJLYj+3EsIYcSzvGP/q1R7a/gFMgqL9ByKN/mA6xDP8daY4pZSTAO5xM9KZWhiW0D8NhZFYotPz/cxpfwboA5ELDztBu39QbWsmAGg0l3aNXaY0Kweqjhx1IV0voJzN/s6APdMfbW+FyTJ8dBF1XQFk8aOAsNuGYK2YGl13KmqUxlJHg8ZV8CGd4QvMwLvx3h64wlKBmY7MoPp3I9yCV9iv/V6L0SAJb
X-Exchange-RoutingPolicyChecked:
	Zm5qCvEUbQbzbv/g5ksL52WzOVfjZh4IGqgOmmD93koxQvg6Rl2c9NuNs1oVWFZ9J0zC0nJH18Ojr9U57xeX/rZpGggE5+CZJgNuyxIx97UymPLv+SbrwrQ5knk66gtAQ6MiQy9jL7OFBLev3hzcG2Vao2n77iTNeh5TKQzD5iq+bvJd5VlUDlgfiOa6w3Oe262TwKVZAbXDSTro09pe3R9h46jMWQDVvKLwwf0PdR0luM1BasS/WBdBn+00xz3uYbu4HQ2d7W33wziSlYkowCO8sfj5BriafgDxbs6DjD+KEsioIuiUO99X1IrUbgmInAPgz9y/bB98rcUzB+0Whw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:20.1530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a57e55e5-3dc0-4a46-d29d-08df1d3c213b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5081
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX9MwRX8slHiFR
 g1WOdHpWHsz8vCqOU7Bf1+ErpCIGTY7IlSLagTN2SLBQwUFucOlRBp/kuY3ZfiIBMVwSOtc06ne
 hDSbaqoSOj5V/kghwRPb84uekeHhktI=
X-Proofpoint-ORIG-GUID: Djwwngq7XZXc6bufEmY9QNf9uJOUK-v_
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6aba27fc cx=c_pps
 a=3EeCZaq8L1ZepF5DamB/SA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=V9XJJtfnhT4z_vqe-dQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Djwwngq7XZXc6bufEmY9QNf9uJOUK-v_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfXz1SeC5vMv7HP
 Ow4Ch5g/OHN2gOVkFZvQxhdhto4v/54mNVtAA2scVDtAewl3aBNbTmhnF39QZC6yX/+0lluZHfo
 Dm3U53DZN+8kzkW+T1nfgVf2TtGSp2d3K2CozVqSbww819QcqBMiCS5BM2/J7BugWyqPa6J3hST
 W8/Tr5jxGX7bZVlKdzAw/lSDm3Zqs2ZwJEQ9JVMPemwM6vnqt1WZTQ4nPK2GI2NkAqKS71CWx+F
 0nozDFUjyZKyiTXxc8Dpu00i42lj86nP/aftuI7oI76bX98LmZ/kNIbDocbPzvU8rU0i39Mu8xm
 WJF/g2EyvAMH6BsgMJvSYrIwrnKrwBA3mNsD77XX3FS8CB0ctl57M3ctn0kIOs4/w8PRJYd3JfA
 VdkL5odWCkLXwVlPEvDL/qDynLbCUWFZRIGaG2Obfmshe5dhdEUdVQBUT1ThPznKJo8Gtib+UQv
 HfSvq0mTT8BZRk6ojlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

> Relocate udma utility functions from k3-udma.c to k3-udma-common.c file.
> 
> The implementation of these functions is largely shared between K3 UDMA
> and K3 UDMA v2. This refactor improves code reuse and maintainability
> across multiple variants.
> 
> No functional changes intended.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index 3ec5cc932280..dbd667d77f13 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -4,6 +4,7 @@
>   *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmapool.h>
> @@ -46,6 +47,28 @@ struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
>  }
>  EXPORT_SYMBOL_GPL(udma_udma_desc_from_paddr);
>  
> +void udma_start_desc(struct udma_chan *uc)
> +{
> +	struct udma_chan_config *ucc = &uc->config;
> +
> +	if (uc->ud->match_data->type == DMA_TYPE_UDMA && ucc->pkt_mode &&
> +	    (uc->cyclic || ucc->dir == DMA_DEV_TO_MEM)) {
> +		int i;
> +
> +		/*
> +		 * UDMA only: Push all descriptors to ring for packet mode
> +		 * cyclic or RX
> +		 * PKTDMA supports pre-linked descriptor and cyclic is not
> +		 * supported
> +		 */
> +		for (i = 0; i < uc->desc->sglen; i++)
> +			udma_push_to_ring(uc, i);
> +	} else {
> +		udma_push_to_ring(uc, 0);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(udma_start_desc);
> +
>  void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
>  {
>  	if (uc->use_dma_pool) {
> @@ -1342,5 +1365,531 @@ void udma_reset_rings(struct udma_chan *uc)
>  }
>  EXPORT_SYMBOL_GPL(udma_reset_rings);
>  
> +u8 udma_get_chan_tpl_index(struct udma_tpl *tpl_map, int chan_id)
> +{
> +	int i;
> +
> +	for (i = 0; i < tpl_map->levels; i++) {
> +		if (chan_id >= tpl_map->start_idx[i])
> +			return i;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(udma_get_chan_tpl_index);
> +
> +void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel)
> +{
> +	struct device *chan_dev = dmaengine_chan_dev(chan);
> +
> +	if (asel == 0) {
> +		/* No special handling for the channel */
> +		chan->chan_dev->chan_dma_dev = false;
> +
> +		dev_clear_dma_coherent(chan_dev);
> +		chan_dev->dma_parms = NULL;
> +	} else if (asel == 14 || asel == 15) {
> +		chan->chan_dev->chan_dma_dev = true;
> +
> +		dev_set_dma_coherent(chan_dev);
> +		dma_coerce_mask_and_coherent(chan_dev, DMA_BIT_MASK(48));
> +		chan_dev->dma_parms = chan_dev->parent->dma_parms;
> +	} else {
> +		dev_warn(chan->device->dev, "Invalid ASEL value: %u\n", asel);
> +
> +		dev_clear_dma_coherent(chan_dev);
> +		chan_dev->dma_parms = NULL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(k3_configure_chan_coherency);
> +
> +void udma_reset_uchan(struct udma_chan *uc)
> +{
> +	memset(&uc->config, 0, sizeof(uc->config));
> +	uc->config.remote_thread_id = -1;
> +	uc->config.mapped_channel_id = -1;
> +	uc->config.default_flow_id = -1;
> +	uc->state = UDMA_CHAN_IS_IDLE;
> +}
> +EXPORT_SYMBOL_GPL(udma_reset_uchan);
> +
> +void udma_dump_chan_stdata(struct udma_chan *uc)
> +{
> +	struct device *dev = uc->ud->dev;
> +	u32 offset;
> +	int i;
> +
> +	if (uc->config.dir == DMA_MEM_TO_DEV || uc->config.dir == DMA_MEM_TO_MEM) {
> +		dev_dbg(dev, "TCHAN State data:\n");
> +		for (i = 0; i < 32; i++) {
> +			offset = UDMA_CHAN_RT_STDATA_REG + i * 4;
> +			dev_dbg(dev, "TRT_STDATA[%02d]: 0x%08x\n", i,
> +				udma_tchanrt_read(uc, offset));
> +		}
> +	}
> +
> +	if (uc->config.dir == DMA_DEV_TO_MEM || uc->config.dir == DMA_MEM_TO_MEM) {
> +		dev_dbg(dev, "RCHAN State data:\n");
> +		for (i = 0; i < 32; i++) {
> +			offset = UDMA_CHAN_RT_STDATA_REG + i * 4;
> +			dev_dbg(dev, "RRT_STDATA[%02d]: 0x%08x\n", i,
> +				udma_rchanrt_read(uc, offset));
> +		}
> +	}
> +}
> +
> +bool udma_is_chan_running(struct udma_chan *uc)
> +{
> +	u32 trt_ctl = 0;
> +	u32 rrt_ctl = 0;
> +
> +	if (uc->tchan)
> +		trt_ctl = udma_tchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +	if (uc->rchan)
> +		rrt_ctl = udma_rchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +
> +	if (trt_ctl & UDMA_CHAN_RT_CTL_EN || rrt_ctl & UDMA_CHAN_RT_CTL_EN)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(udma_is_chan_running);
> +
> +bool udma_chan_needs_reconfiguration(struct udma_chan *uc)
> +{
> +	/* Only PDMAs have staticTR */
> +	if (uc->config.ep_type == PSIL_EP_NATIVE)
> +		return false;
> +
> +	/* Check if the staticTR configuration has changed for TX */
> +	if (memcmp(&uc->static_tr, &uc->desc->static_tr, sizeof(uc->static_tr)))
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(udma_chan_needs_reconfiguration);
> +
> +void udma_cyclic_packet_elapsed(struct udma_chan *uc)
> +{
> +	struct udma_desc *d = uc->desc;
> +	struct cppi5_host_desc_t *h_desc;
> +
> +	h_desc = d->hwdesc[d->desc_idx].cppi5_desc_vaddr;
> +	cppi5_hdesc_reset_to_original(h_desc);
> +	udma_push_to_ring(uc, d->desc_idx);
> +	d->desc_idx = (d->desc_idx + 1) % d->sglen;
> +}
> +EXPORT_SYMBOL_GPL(udma_cyclic_packet_elapsed);
> +
> +void udma_check_tx_completion(struct work_struct *work)
> +{
> +	struct udma_chan *uc = container_of(work, typeof(*uc),
> +					    tx_drain.work.work);
> +	bool desc_done = true;
> +	u32 residue_diff;
> +	ktime_t time_diff;
> +	unsigned long delay;
> +	unsigned long flags;
> +
> +	while (1) {
> +		spin_lock_irqsave(&uc->vc.lock, flags);
> +
> +		if (uc->desc) {
> +			/* Get previous residue and time stamp */
> +			residue_diff = uc->tx_drain.residue;
> +			time_diff = uc->tx_drain.tstamp;
> +			/*
> +			 * Get current residue and time stamp or see if
> +			 * transfer is complete
> +			 */
> +			desc_done = udma_is_desc_really_done(uc, uc->desc);
> +		}
> +
> +		if (!desc_done) {
> +			/*
> +			 * Find the time delta and residue delta w.r.t
> +			 * previous poll
> +			 */
> +			time_diff = ktime_sub(uc->tx_drain.tstamp,
> +					      time_diff) + 1;
> +			residue_diff -= uc->tx_drain.residue;
> +			if (residue_diff) {
> +				/*
> +				 * Try to guess when we should check
> +				 * next time by calculating rate at
> +				 * which data is being drained at the
> +				 * peer device
> +				 */
> +				delay = (time_diff / residue_diff) *
> +					uc->tx_drain.residue;
> +			} else {
> +				/* No progress, check again in 1 second  */
> +				schedule_delayed_work(&uc->tx_drain.work, HZ);
> +				break;
> +			}
> +
> +			spin_unlock_irqrestore(&uc->vc.lock, flags);
> +
> +			usleep_range(ktime_to_us(delay),
> +				     ktime_to_us(delay) + 10);
> +			continue;
> +		}
> +
> +		if (uc->desc) {
> +			struct udma_desc *d = uc->desc;
> +
> +			uc->ud->decrement_byte_counters(uc, d->residue);
> +			uc->ud->start(uc);
> +			vchan_cookie_complete(&d->vd);
> +			break;
> +		}
> +
> +		break;
> +	}
> +
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(udma_check_tx_completion);
> +
> +int udma_slave_config(struct dma_chan *chan,
> +		      struct dma_slave_config *cfg)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +
> +	memcpy(&uc->cfg, cfg, sizeof(uc->cfg));
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(udma_slave_config);
> +
> +void udma_issue_pending(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&uc->vc.lock, flags);
> +
> +	/* If we have something pending and no active descriptor, then */
> +	if (vchan_issue_pending(&uc->vc) && !uc->desc) {
> +		/*
> +		 * start a descriptor if the channel is NOT [marked as
> +		 * terminating _and_ it is still running (teardown has not
> +		 * completed yet)].
> +		 */
> +		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
> +		      udma_is_chan_running(uc)))
> +			uc->ud->start(uc);
> +	}
> +
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(udma_issue_pending);
> +
> +int udma_terminate_all(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	unsigned long flags;
> +	LIST_HEAD(head);
> +
> +	spin_lock_irqsave(&uc->vc.lock, flags);
> +
> +	if (udma_is_chan_running(uc))
> +		uc->ud->stop(uc);
> +
> +	if (uc->desc) {
> +		uc->terminated_desc = uc->desc;
> +		uc->desc = NULL;
> +		uc->terminated_desc->terminated = true;
> +		cancel_delayed_work(&uc->tx_drain.work);
> +	}
> +
> +	uc->paused = false;
> +
> +	vchan_get_all_descriptors(&uc->vc, &head);
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +	vchan_dma_desc_free_list(&uc->vc, &head);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(udma_terminate_all);
> +
> +void udma_synchronize(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	unsigned long timeout = msecs_to_jiffies(1000);
> +
> +	vchan_synchronize(&uc->vc);
> +
> +	if (uc->state == UDMA_CHAN_IS_TERMINATING) {
> +		timeout = wait_for_completion_timeout(&uc->teardown_completed,
> +						      timeout);
> +		if (!timeout) {
> +			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
> +				 uc->id);
> +			udma_dump_chan_stdata(uc);
> +			uc->ud->reset_chan(uc, true);
> +		}
> +	}
> +
> +	uc->ud->reset_chan(uc, false);
> +	if (udma_is_chan_running(uc))
> +		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
> +
> +	cancel_delayed_work_sync(&uc->tx_drain.work);
> +	udma_reset_rings(uc);
> +}
> +EXPORT_SYMBOL_GPL(udma_synchronize);
> +
> +/*
> + * This tasklet handles the completion of a DMA descriptor by
> + * calling its callback and freeing it.
> + */
> +void udma_vchan_complete(struct tasklet_struct *t)
> +{
> +	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
> +	struct virt_dma_desc *vd, *_vd;
> +	struct dmaengine_desc_callback cb;
> +	LIST_HEAD(head);
> +
> +	spin_lock_irq(&vc->lock);
> +	list_splice_tail_init(&vc->desc_completed, &head);
> +	vd = vc->cyclic;
> +	if (vd) {
> +		vc->cyclic = NULL;
> +		dmaengine_desc_get_callback(&vd->tx, &cb);
> +	} else {
> +		memset(&cb, 0, sizeof(cb));
> +	}
> +	spin_unlock_irq(&vc->lock);
> +
> +	udma_desc_pre_callback(vc, vd, NULL);
> +	dmaengine_desc_callback_invoke(&cb, NULL);
> +
> +	list_for_each_entry_safe(vd, _vd, &head, node) {
> +		struct dmaengine_result result;
> +
> +		dmaengine_desc_get_callback(&vd->tx, &cb);
> +
> +		list_del(&vd->node);
> +
> +		udma_desc_pre_callback(vc, vd, &result);
> +		dmaengine_desc_callback_invoke(&cb, &result);
> +
> +		vchan_vdesc_fini(vd);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(udma_vchan_complete);
> +
> +void udma_mark_resource_ranges(struct udma_dev *ud, unsigned long *map,
> +			       struct ti_sci_resource_desc *rm_desc,
> +			       char *name)
> +{
> +	bitmap_clear(map, rm_desc->start, rm_desc->num);
> +	bitmap_clear(map, rm_desc->start_sec, rm_desc->num_sec);
> +	dev_dbg(ud->dev, "ti_sci resource range for %s: %d:%d | %d:%d\n", name,
> +		rm_desc->start, rm_desc->num, rm_desc->start_sec,
> +		rm_desc->num_sec);
> +}
> +EXPORT_SYMBOL_GPL(udma_mark_resource_ranges);
> +
> +int udma_setup_rx_flush(struct udma_dev *ud)
> +{
> +	struct udma_rx_flush *rx_flush = &ud->rx_flush;
> +	struct cppi5_desc_hdr_t *tr_desc;
> +	struct cppi5_tr_type1_t *tr_req;
> +	struct cppi5_host_desc_t *desc;
> +	struct device *dev = ud->dev;
> +	struct udma_hwdesc *hwdesc;
> +	size_t tr_size;
> +
> +	/* Allocate 1K buffer for discarded data on RX channel teardown */
> +	rx_flush->buffer_size = SZ_1K;
> +	rx_flush->buffer_vaddr = devm_kzalloc(dev, rx_flush->buffer_size,
> +					      GFP_KERNEL);
> +	if (!rx_flush->buffer_vaddr)
> +		return -ENOMEM;
> +
> +	rx_flush->buffer_paddr = dma_map_single(dev, rx_flush->buffer_vaddr,
> +						rx_flush->buffer_size,
> +						DMA_TO_DEVICE);
> +	if (dma_mapping_error(dev, rx_flush->buffer_paddr))
> +		return -ENOMEM;
> +
> +	/* Set up descriptor to be used for TR mode */
> +	hwdesc = &rx_flush->hwdescs[0];
> +	tr_size = sizeof(struct cppi5_tr_type1_t);
> +	hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size, 1);
> +	hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
> +					ud->desc_align);
> +
> +	hwdesc->cppi5_desc_vaddr = devm_kzalloc(dev, hwdesc->cppi5_desc_size,
> +						GFP_KERNEL);
> +	if (!hwdesc->cppi5_desc_vaddr)
> +		return -ENOMEM;
> +
> +	hwdesc->cppi5_desc_paddr = dma_map_single(dev, hwdesc->cppi5_desc_vaddr,
> +						  hwdesc->cppi5_desc_size,
> +						  DMA_TO_DEVICE);
> +	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
> +		return -ENOMEM;
> +
> +	/* Start of the TR req records */
> +	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
> +	/* Start address of the TR response array */
> +	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size;
> +
> +	tr_desc = hwdesc->cppi5_desc_vaddr;
> +	cppi5_trdesc_init(tr_desc, 1, tr_size, 0, 0);
> +	cppi5_desc_set_pktids(tr_desc, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
> +	cppi5_desc_set_retpolicy(tr_desc, 0, 0);
> +
> +	tr_req = hwdesc->tr_req_base;
> +	cppi5_tr_init(&tr_req->flags, CPPI5_TR_TYPE1, false, false,
> +		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> +	cppi5_tr_csf_set(&tr_req->flags, CPPI5_TR_CSF_SUPR_EVT);
> +
> +	tr_req->addr = rx_flush->buffer_paddr;
> +	tr_req->icnt0 = rx_flush->buffer_size;
> +	tr_req->icnt1 = 1;
> +
> +	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
> +				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
> +
> +	/* Set up descriptor to be used for packet mode */
> +	hwdesc = &rx_flush->hwdescs[1];
> +	hwdesc->cppi5_desc_size = ALIGN(sizeof(struct cppi5_host_desc_t) +
> +					CPPI5_INFO0_HDESC_EPIB_SIZE +
> +					CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE,
> +					ud->desc_align);
> +
> +	hwdesc->cppi5_desc_vaddr = devm_kzalloc(dev, hwdesc->cppi5_desc_size,
> +						GFP_KERNEL);
> +	if (!hwdesc->cppi5_desc_vaddr)
> +		return -ENOMEM;
> +
> +	hwdesc->cppi5_desc_paddr = dma_map_single(dev, hwdesc->cppi5_desc_vaddr,
> +						  hwdesc->cppi5_desc_size,
> +						  DMA_TO_DEVICE);
> +	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
> +		return -ENOMEM;
> +
> +	desc = hwdesc->cppi5_desc_vaddr;
> +	cppi5_hdesc_init(desc, 0, 0);
> +	cppi5_desc_set_pktids(&desc->hdr, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
> +	cppi5_desc_set_retpolicy(&desc->hdr, 0, 0);
> +
> +	cppi5_hdesc_attach_buf(desc,
> +			       rx_flush->buffer_paddr, rx_flush->buffer_size,
> +			       rx_flush->buffer_paddr, rx_flush->buffer_size);
> +
> +	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
> +				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(udma_setup_rx_flush);
> +
> +#ifdef CONFIG_DEBUG_FS
> +void udma_dbg_summary_show_chan(struct seq_file *s,
> +				struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	struct udma_chan_config *ucc = &uc->config;
> +
> +	seq_printf(s, " %-13s| %s", dma_chan_name(chan),
> +		   chan->dbg_client_name ?: "in-use");
> +	if (ucc->tr_trigger_type)
> +		seq_puts(s, " (triggered, ");
> +	else
> +		seq_printf(s, " (%s, ",
> +			   dmaengine_get_direction_text(uc->config.dir));
> +
> +	switch (uc->config.dir) {
> +	case DMA_MEM_TO_MEM:
> +		if (uc->ud->match_data->type == DMA_TYPE_BCDMA) {
> +			seq_printf(s, "bchan%d)\n", uc->bchan->id);
> +			return;
> +		}
> +
> +		seq_printf(s, "chan%d pair [0x%04x -> 0x%04x], ", uc->tchan->id,
> +			   ucc->src_thread, ucc->dst_thread);
> +		break;
> +	case DMA_DEV_TO_MEM:
> +		seq_printf(s, "rchan%d [0x%04x -> 0x%04x], ", uc->rchan->id,
> +			   ucc->src_thread, ucc->dst_thread);
> +		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA)
> +			seq_printf(s, "rflow%d, ", uc->rflow->id);
> +		break;
> +	case DMA_MEM_TO_DEV:
> +		seq_printf(s, "tchan%d [0x%04x -> 0x%04x], ", uc->tchan->id,
> +			   ucc->src_thread, ucc->dst_thread);
> +		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA)
> +			seq_printf(s, "tflow%d, ", uc->tchan->tflow_id);
> +		break;
> +	default:
> +		seq_puts(s, ")\n");

This was seq_printf() in the current code, please keep it as-is. Move
any fixes if needed to separate patch

-- 
Vignesh

