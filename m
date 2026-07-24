Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E74427FB8;
	Fri, 24 Jul 2026 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888537; cv=fail; b=POpRb1G+z7VxQDFPxgESWAj2zHCUn9CPI3rRyYy6qkavZ0Cp2LhjhDLekP3ugAtOSQtl7L4araD9PuESapEivhuqZk4eJck7oPTmb/NpfSChj1xn+GG1Si7UVNrkdklze9/K+5Jj6uMPKzcuONf9ZK2ww+FQrsSsRjWm0ovwvQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888537; c=relaxed/simple;
	bh=WJY3AKaNC/gLHlGSPe/4jNEwo2M0/91u1xIHBwRpW6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f2O58S09aobtxREtuLnIbFWjcoKSzbUG/IOFTVvUq9kmIiQ3fEO6kW0FBvAf8iY8Fwsd/RpU60r6IoZ2k34CskN0WapWqW9QCxakZq9iieVeis/lCaEqS0hURSaUyZEmS0g5VKy1/drR4MGqODN89c2tQKXScM9byeqstnEnECM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=C5EB/Lhu; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=X3Uvx+sb; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="C5EB/Lhu";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X3Uvx+sb"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFsFj786385;
	Fri, 24 Jul 2026 05:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2ovHrghrGMqdefLDMIOud273eAp2uf6U5cQKsE+TF
	zs=; b=C5EB/LhuiuEjj6DS2KYAIM67evVlj3raU2GHonS/60Q8/F/Cp9p+2dOmW
	LCC/0ZPqGb7cxZICOK+ofnm5QapxdlCxRY5vS555wRgj4H7Q7YjJkYPH2k3LJh/C
	buWjQUgwhHDRo2TDzJkRNfLYgw3rl9hekqJzCEQfy5Xw/gkFGeUCXc4RpruoQWwD
	fc0xqop6ugmneNfxpHtZNtmaGqlxI3WUPymXBrBcy+EvR+CuyepEBOm7w+Q6jsB1
	lvRBFiE0nzjNryROq5cWUuu3bHOOuL8N3KBhXzkllc7tVOAyc6P47KbUf+xgdQnY
	syY11EqYbcALNnpLU4rxy9AO3A+bA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fm5p304hh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:21:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbaJ+o4X+sdceTngdoiOUA8R+cvBKgdBU9RO9dOOYfcJVnihUqe1PRV+oLcAO20Gg6QIFR0CEu3Ljv808CvxUWGqe/0WoovPab/0J9MgfQnARzg3Mu/ICl6dSrVbhidWP2wne9Tz/j/UMJK9SAV8kstQE6/Ay/MO2X41E7aoxfL6BZftRzQ7ZjV7NoQQ6VjRzbOZxehlPs7ndMxSMETA/C9KJiLAUy482ioE6sw1WAs+GcPQzkDJik06GZ+Gv+YqhBkt4VbLK1rFBacimVsyMllmyjQpJPmRvyxaqSEsglkRKiOxmbl5ldoz+Q5CsNtXkPCfOPfXWXgARGboCKQ7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ovHrghrGMqdefLDMIOud273eAp2uf6U5cQKsE+TFzs=;
 b=MYFc7drkVd68BLonOhc7nu06KfanBm8GYELwBHd366BpxFqnb7FPTLUWKGkwS/b1+TUZ8ppUOKUHpHVT2OZICO1a7V0NKV++5prWLZKBElOoBFR4bCWMJzA+VLOMQj2ZNarftXLeUCg7Bawzqq+v6bryrw0RwWu4HjPAFH8KaSMT/S5t3cBP0FGXnenuBFL5N2SlidMbNBPOjscY5sk1wyen+jv8725CH23vUbJ/rICMCNAntOY4XjXC0kvz8ataor+M9fQe5kH1bC5/DVCL7p+AJBl+ytOrZUS7PPApm6E0eoQ/0f/qj7qqdOqWl8W8FcRW0+aQxBU7lBhDdcKNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ovHrghrGMqdefLDMIOud273eAp2uf6U5cQKsE+TFzs=;
 b=X3Uvx+sbDQZjzE1Kre7ayDlLm9DQVBHpUMQs9KwqHkL/AzSPFVb5shjwzOVhVG1SaDqL0A7S4MpbWIUJ7j4r+l1gqzKZULDjBnuKMDzFCWd6+rCBVrnW8cZS68Sh3Tz4fvzcJmSJ9P5L/mj570bznl9DeGtLue+X1rzvogDHU+M=
Received: from MN2PR06CA0018.namprd06.prod.outlook.com (2603:10b6:208:23d::23)
 by PH0PR10MB4487.namprd10.prod.outlook.com (2603:10b6:510:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:21:40 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::92) by MN2PR06CA0018.outlook.office365.com
 (2603:10b6:208:23d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:21:39 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:37 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:21:37 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFH3017088;
	Fri, 24 Jul 2026 05:21:33 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 02/19] dmaengine: ti: k3-udma: move macros to header file
Date: Fri, 24 Jul 2026 15:50:35 +0530
Message-ID: <20260724102115.2854-3-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|PH0PR10MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 24026b8f-0938-4a29-123f-08dee96d5996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|56012099006|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	rmXZgTqqLh/BeYjYNwEOoYTQPDqwsI4g/qoiy5qTGyEjp7yyAh4po0nD5PpA93EMTMc9pj7KaUaKu+y6Tvrepl08fXZup6EcK7PWmdHvL/U7/TTzdUukAJAVyK0pSskkzFOn9N94bFMTfkeP6PdEhvCZigv8y4TgozlTOO046Hz4EQ9YomhS2qtr4XySpobPfnWjWJbLVV0CHxDy7dnkp+4aJmD59CYEy2ISVxegERhS81Wcc+rN61s1P21oUEdceEoIv7bo6UPilKEtk3Z4v4aNpsMNgBtJe7XyMP0RPb95zDXBsLb/yaFwAGZRn1UlOSLbvSb0cuQ1fUA7+AMOBLWCXzjyTNLWozAWTcJMS4gkf7bVET4uEAl90QlkyeggsE1tZiuIuzDRLuCi024UiP+Ivx8yIFbd9AB9Qa8R6lRX50trnHXLMxeDnGDq+X5uvDGa2vQTklh3Yb9y3+VE3syzOeMFDar2Pw8TM4atTrmAdaghyMttyPCiwvMNEyeeo15CAmfmbsE5XWwEZ6yeX4Z67yvOfbCL3rm8Wi8sIVM3QtHghqVlCq0hlKoBCObdHSK8/ynDnQF8bPgVNa3GI2uT+b28Bz3zDjcMjAhxfN0fkHn27ksQLbxxGpYCEzv5YzkjObByIJqNoGGm/WbgSRyIRUbmRPPRHM35b28IyYb3A30kflFKdxBqADkeXSCauohGVhQtgfsMeCrCRc3P/HBn8DEZQSAiHwRpu7kaLBzR7q2v3v2I5+4ulUlLk2lb
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WiHWqWdMEp4jJfaQ6LCvz/ZvmGsX2hHWVV0Ht1TktueTE7PPDl0D9k2pc72ke7Lc3khC1JhLXwnEBXv0GGEV6TDPVh1n4LcpzPnlSyoXBFD27ALa30jbL0TY6NLE/lpkhkDBtpeNcPwDlc0QPL9hSal3jMPCuH27QuFCD8bEaCWe/EikIkyUD13leuFv+Rop2ZX66tFb6xvVhJwhOLVYyUIcv1RMwadjdGPvVmTixySYMAX91jwmh2G6KyIUG8ot37GKCidQCDLiMz9gonWU1cMmcy2NPnNqhOrCMWCIraF3uKDem7V6bWsSbem+som7f70TONfDfwLFE0RG2D7K5Y0v4F5Yoe6F23CiigRaWc+byA8pOoJT7SQmwmcxpTOVj2XJOIunIvvYMIh2HRXpnQS3XLibs9Kx3JbHerCls+IMFOxzP/vMRJDlDVN2r7Af
X-Exchange-RoutingPolicyChecked:
	rXQObPWttAMhyI/iq3f/NSc4tunpK2Kx8dVs5Ljd+p2iUokxVY2oT6SNXCSf1mvRtcHJaS4JJNDijU55WhGIaeL4ZrN2mbTIGiCUygAYlgy2p5X+/22nOtlapa9sQbTaCBvMTgTu9KaraRg/r9SK+6HAMzjavszrfA4rcjM06xO/1PSYC4350Qf0uB1159C2DB1ZPQQf9XneYPsGrvzIEc7/cWpanuhihmp3gOPomu01M1sHFquQgJMUcrvP0mBZK/Oq/kSo6ERtW5yHwWQ1dlaLIHm21tRUwJQN3i8wTAJOV9KZDOQQa02AqwmEisq9Pdc8SrJm0tdI/YYTi3AnGQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:21:39.5785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24026b8f-0938-4a29-123f-08dee96d5996
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4487
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX/akKJ5+4ZL0r
 svRM/jCrzHDHSFMHi4KYIsW422Yo65SSAGhBBM0kmt3VyU5xWiw0koqzAzyYvmp8VTVQoegVt79
 t0nfJLAo796gesiI+DmdhNSarkV0cAmGlt0ZvRxrJmTUJizxMWmzocb026qNMOM+6iT8f/yb7oX
 5sTkZzd6Pqug/9gutxqAWaapuBEQ5RAfv/DXryiKBz6z0KZfCJG6nMCJu7pjkqWUfrbg4wVNHhz
 JnN19klQVxKGOeQjt8r4JgYtTcIwbPYqAbXzJLEq4APuc+FpyHEiLQskxqCiiiy+K66QQjiueyb
 noPjYtMBGMQLzvd1Q8rI+MCh1CjKXKj8ftKEgSlSHJ4jWEILkmkl6Hi0J5Fl5H942/icwjZq2VK
 hCLxzfvujc0kSN3wI66XYWdJUmq4Z9Qv8OYpTg8WbUAm0U6ivkJ2feu6XYT0UKpkrACL1hJ/Iub
 HYH/YM+naaDTb9OCowg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfXxFNKi5LrNa/z
 ZzbCPedkoOxm2LASV4fWRA7SmHQZyG6fU4hj66QShRNj4OvTGMUvRMQmwXjfFa9PzqxP04/p/t1
 zmkVednU93QtUQNWRZ3PcTdI72b8e3c=
X-Proofpoint-GUID: Gy4hQJtHK_zIfuzNCv98z78ckLxsTi3U
X-Proofpoint-ORIG-GUID: Gy4hQJtHK_zIfuzNCv98z78ckLxsTi3U
X-Authority-Analysis: v=2.4 cv=C8PZDwP+ c=1 sm=1 tr=0 ts=6a633cb9 cx=c_pps
 a=u5a0R1DJIqwdmu/eAz29vw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=u0Ry9gnqgf_Ls9jc7UwA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 48f4db777d924..a066862e2c699 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -39,21 +39,6 @@ struct udma_static_tr {
 	u16 bstcnt; /* RPSTR1 */
 };
 
-#define K3_UDMA_MAX_RFLOWS		1024
-#define K3_UDMA_DEFAULT_RING_SIZE	16
-
-/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
-#define UDMA_RFLOW_SRCTAG_NONE		0
-#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
-#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
-#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
-
-#define UDMA_RFLOW_DSTTAG_NONE		0
-#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
-#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
-#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
-#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
-
 struct udma_chan;
 
 enum k3_dma_type {
@@ -118,15 +103,6 @@ struct udma_oes_offsets {
 	u32 pktdma_rchan_flow;
 };
 
-#define UDMA_FLAG_PDMA_ACC32		BIT(0)
-#define UDMA_FLAG_PDMA_BURST		BIT(1)
-#define UDMA_FLAG_TDTYPE		BIT(2)
-#define UDMA_FLAG_BURST_SIZE		BIT(3)
-#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
-					 UDMA_FLAG_PDMA_BURST | \
-					 UDMA_FLAG_TDTYPE | \
-					 UDMA_FLAG_BURST_SIZE)
-
 struct udma_match_data {
 	enum k3_dma_type type;
 	u32 psil_base;
@@ -1837,38 +1813,6 @@ static int udma_alloc_rx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
-
-#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
-
-#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
-
-#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
-#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
 static int udma_tisci_m2m_channel_config(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -5398,12 +5342,6 @@ static enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 	}
 }
 
-#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 9062a237cd167..750720cd06911 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -97,6 +97,69 @@
 /* Address Space Select */
 #define K3_ADDRESS_ASEL_SHIFT		48
 
+#define K3_UDMA_MAX_RFLOWS		1024
+#define K3_UDMA_DEFAULT_RING_SIZE	16
+
+/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
+#define UDMA_RFLOW_SRCTAG_NONE		0
+#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
+#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
+#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
+
+#define UDMA_RFLOW_DSTTAG_NONE		0
+#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
+#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
+#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
+#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
+
+#define UDMA_FLAG_PDMA_ACC32		BIT(0)
+#define UDMA_FLAG_PDMA_BURST		BIT(1)
+#define UDMA_FLAG_TDTYPE		BIT(2)
+#define UDMA_FLAG_BURST_SIZE		BIT(3)
+#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
+					 UDMA_FLAG_PDMA_BURST | \
+					 UDMA_FLAG_TDTYPE | \
+					 UDMA_FLAG_BURST_SIZE)
+
+#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
+
+/* TI_SCI Params */
+#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
+
+#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
+
+#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
+
+#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
+#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
 struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
-- 
2.54.0

