Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401B43E072;
	Tue, 22 Sep 2026 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059827; cv=fail; b=h5mSH2tpvxdAkFM2sDtu/OSzt8E6oM53jIp+nkPtH1zMc/duz1u8Zarbfn0ckuYSU7wiqaQ85i/7FWO50dskskPeJVUvu5qr75cQNMQQBj17n4/d5dpZBfYq/TzsqEz2ME+uAYQwB/U4H5UTg6FxqB1aFtsS/KYE9kJ5I4k1u94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059827; c=relaxed/simple;
	bh=ShSg+QoaLIO4hbZSZgkMejppZjWjSKbs1QKIYiTDSh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEMSURRULdzDlieNjCrBt+/IbbfTx0cjJPTlXelbRnlWcdoiNgghkwojzBfIjt67vMklxXcPRbwVr7LuhXwhuepE3N1vFkJFsd/UrI74/TQ2PbNqynIa3bmKvMqKEOAnFz0rDpTJSJW5X6V6kki6nMy0kyAJvZ/Zpq5CinfXu+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MhsnKwB6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fO6FteRd; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MhsnKwB6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fO6FteRd"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M5sffx932416;
	Tue, 22 Sep 2026 01:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rCQNGoXps1QncXA4n5E9I2k+f6PXY4YgK3IBMNZjt
	Ug=; b=MhsnKwB66qSVbL0kVYdKAIjdD6xQQN8HslXQF1CKLq+NuRLYRUME+flny
	noqN4BnaXq0yo3Q3ua3KmHyTsMwDzN5d83RiH9TIGk5nkNtbGvyqFYsmNJMGkSF/
	YlVQ8lKJAv0ixYDR+vyqNP+qIRSOLWaczpcD0XCXLr3phIs2U3viZw1qw7hnMDX4
	z5HxUj14qdkieo5evxBbSfZyhrh3gp/kmeoUPsWtI84ILTw7JD020qJt0fSSIiAZ
	yIcny6Tu8D9xkEzNbsa129LkYoO+UdYSY75w+t4tCwUXCGrVkn45EWZ24/1mAMps
	ZwDlREZEQmSQGKnLes1xzqDTWdnzg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x1v2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffRRPykQCkbixkLO5CDpye1wpf4BYrLpGm3CeMja6rcCsxeBSudBZIFujBI3u02B3NFx5xi+CqeYTrL6WGlZcfpQ2Rs1VYedfvSMvOplf/VxlB/WHAzUWGUZVXWRzZpkoCa+uvl1qVrwI7tlYlCmrUZD4NKRtWPATdzjrlGc8pEHHsVULGmjqgIZEBwerxv8VI/Ob+5dQxVsBvVy0bvN3q0+twZoZgV9vc4NMSHnzoG6u3aW4NeCl5Bu3vhImI7ixAc/p36f40Yb/APE2qzgBrAfei0ZykCT0Fs4Hw/4dxB+jzFmGjKZwdkcD2T/eH+G0kxzcdOfbk8QnoO5hqxHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCQNGoXps1QncXA4n5E9I2k+f6PXY4YgK3IBMNZjtUg=;
 b=q8cLg6l5dHaKELgK/lOyC0nzu7ecWaC7rkhGBJeIrDrFrfk/XN6idMmvhMB8buw4lS7eJbyOb/8drkUerpFFJJLOZHDRrwgciZotY/UE4uIH8mw7g+4053kz0bI5c2vajit5/gwpf7gxJI2RsL8zkljQw9+JtQZHNleZz5ckwHBxq6asoS/yvo5QQKTG2IaSbUEaCE2jaW0pFRa8QWLNGZzwsVqVvt57n/668ayY4Mf3K+8ad/u/LKro1sRnzXxnTE8T59kxV6aBigEY9Rox0dt7WaiBa1mjIQmKTpFln+cxlzxe/I8IGrjn3qg4tOMKhLbE5d9eaLxRtYzm3jQ0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCQNGoXps1QncXA4n5E9I2k+f6PXY4YgK3IBMNZjtUg=;
 b=fO6FteRdtA7eYzjajDzd4MmWiIB+AvYz0bzqLuPQE82JugGldlGq8YF6+lYwdagAkwQzHNYwQas8wrRVL3bCtpVKvcCzWFtrvoInYKRHeGsI0tMfX8TIXC3vr42haQZL1UnF+vwzTVKtr9MM/VWr8UcXKY7F0ypbv7HI4sboZs8=
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by PH3PPF54E75B76D.namprd10.prod.outlook.com (2603:10b6:518:1::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:10 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::9c) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 06:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:08 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:33 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:33 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3s3626771;
	Tue, 22 Sep 2026 01:49:28 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 02/19] dmaengine: ti: k3-udma: move macros to header file
Date: Tue, 22 Sep 2026 12:17:26 +0530
Message-ID: <20260922064902.2719979-3-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|PH3PPF54E75B76D:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d275f78-cd01-440f-dbda-08df1875be1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|36860700016|1800799024|921020|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	l5j/veIUZ2EPA+KPLBoCMOL66XRf+fUeHj1rVvgZfgI3EFEsTSFxEf1A4IBcZg/lX4PdjJ5SAqOrbPVgI+J53s+kIYqRPoDiKCF5EQ8Djp5JC9Ho9w0hRPOB4u/Ehj6pnPJIkTt3NxjtcOaeAuCmpTZF1iQnk2ZNNIfUZWTjUccAAOj9b598TJ18FybMjxUgY6pMJS/Egt9nXN78/9uxyp0N4EfEtEa47E8SahHxwdsm4XW4IsYqXKtNn4EYe7sjHLC6GSQx48n/P0J3P7pr1dm0TjLC2nMeg835Ax7zX3WEKBzWsq897ZsYmPJvqFfj1NAPsason9sjSUI/U60Hamzm4GnoXUQWqIZPZBLlr9GHHhbTMEfAh8fRsT0mEqYdiFtZzx17qjLKl2Aym8qSlowNnVxv6kcI6BXjy0Zr0LYIPh14NzmkylkCCxdeHy6w8Zs0Rx1ftbjfBW5PMAyfDhpQLM/dpE926gbUWUSrcRVDrUz553teEkj+99JaQm6atyFKFvkIESDKDF0+J3C7rJncos5X9mNf/s1tiJXpKm2l7SpxIN07qINsYm5SVvHcP8pZN5l4thrVFuyswVUQ+bZf+93czf3vMFqWDiL1zuaX3mPskj9F6CtbS8JdlHPNX97GlCO9A8cu6lQ3jSi2o6FpCao9hvGJwkRQNHiddyon0BAuiRObdahhb9NJtvyI17/IoT1++2PjhkvdTUYFF+Hz1fNDbiYQEKda3GV9p0xaqYcm/j4SYdKzAsRUuQGE
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(36860700016)(1800799024)(921020)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5B77SQuVVq93JT9kSWg2T3jhBdpOZokni/V2R1xTFAQq1YUONS3BXopthEk09Hv/H+3AU8o8QMBiJfutpcFh9BNBA2PiJ4SwNsz8FSqfEOaTKD+y11m+PvXOXimPvjOlsQyQ7dUXFlP83BduyrXOdIHq/80ZH1XVe5dHoSyeMgmlVdyRc6rut30+Ns/+W5Hwmywz+/5lG9nutkXF1YfLpsxqGhso7FcimS8CRHyW4Uhtk0EE14cIyT/oybQ/riwCSrk9r1tGrPPNTYxpFu8RocaKVLcHwgpmVMns6nQoKNj6jR5YMtPJnO4/5zIvPTXEEUf3duIAisnxgCBAaesijzRPiY3obldsWj9V1U0jNV5tFnVaYnOsB9oDg1lqTpOXmBVj+rzp3wobkCe036JRmM2JZUQhpMfScucV6aQw5i4U5ZXtfnmH87xbusiFajgw
X-Exchange-RoutingPolicyChecked:
	AWOBh2WcOdgBcwLOPoK6+qNphzNvGiXUnay6sSwR4yyexrRUzQbXdm9MGtObR8SAJjshiZuZRvvSD/SISDvsa+qb6Pgo65hn9BVyISy03ncUMfndgOHyx0YfsMqFO9mUTag7WvtIxB5iQAceu5ZGM21lU54MrQOKcZmdLjIvAMansbGpxh8jGkCCFy6Vts/hz9NrkxsPYeElpk+FwzuQFeAfxdNPTIgIHZQDS44sHLc8w2/JGI8Cm5xUPGispb0HQzBD915oug0OU8iT281iKjTIL2hGQw+adtPkxYvkktgxtqMWmZXW/ZJk5gMvWQziaDlQSU/cXIJRmEKLaTHbrA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:08.8534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d275f78-cd01-440f-dbda-08df1875be1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF54E75B76D
X-Proofpoint-ORIG-GUID: NEr3JppW5uznGiMMnVMDiDkEx63607KV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX7n1511fkv0hY
 AKN4UYnP2xLJIYx+UX5zIipqZU9JHJS3bGphZ04TP8OklU8yXY/DXdGBUXp3lsjWreLzxqrXFv/
 e1ngZ6gz5mibIfle6xrvHXpUIx4wpGLFUWrY7vP8bO0+VsBvoRN8etOYpEemFXCKuUfgVwtIgBE
 +LBbFVnpncRd14Udh2frI6xv3iI9P1Nb+Nj6YmRv6gNp0Grwyc+IcGUN6PK7165i30Z6RsEBDFx
 +xNyx/HKMvi4aeLboruy2yRNf7G/OgG9UtigI96OtTPvuqe6Ft67tf7MyeuwtEYSTqUKTpmnz+6
 eHfOv6vGZwVZ2COti1/s2GEkA7tIVUl7DxmPbjAUS2IcQwvXgXZ6RW2y6KKnb72V0lA+lC3ZORb
 PY9JZczsFT/fUHvAexhL1/gYHDSN6IKYzD705rgPDowkW3zM3juLbKAPrqrfiv4lnVsshSbtwXY
 khaKhci8cnAJFdZPJuw==
X-Proofpoint-GUID: NEr3JppW5uznGiMMnVMDiDkEx63607KV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXwIHAabgqbb0Z
 5JAn1huEN9IRGcu3BMpG7arp781p/LmyAFW+iUZj61r8TnrcnN+vO61WnT23dY6bFdLhBCWVt8y
 t2QNMni0eocVnlUVLLH3NkWvKcORdMg=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab22526 cx=c_pps
 a=j8kfsx1CyBm2fJFf+vs0Eg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=u0Ry9gnqgf_Ls9jc7UwA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8457644cb9132..a1b99097a94ad 100644
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

