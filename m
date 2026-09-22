Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE94F85B5;
	Tue, 22 Sep 2026 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059884; cv=fail; b=UAweQ1oBH1bxmDnJOSyBYuVY8Gn5jLgp12wmfxKPQGU3nQn+FKup27NKL2sfJS/BFnZq+snSs7f3S554xvBnYuM7PQqopUSgAtNGtCavJdHVBq2FIKWaURwEG7KisSe79jbvCd0rdoXtyU9UcWfMUolYs62vu0BvB5Y7mhhJLdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059884; c=relaxed/simple;
	bh=RbGkKXStC/0O8P9NjO0Ab0RAy7+5NfpvNWK3i3tvuZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jq227HiByFemwpump/yAxTyYhCT2fjx6+5OwKK27/G4t2cKrZGuTxMpXfwa6hwpWegkXqoDTwaOk9OQn/xEDkK0AgfphBembPtMkbdyY5iLvqc9n0araGZ5Lxm/2Bbcvz4p9eEx3/Drr3nxwZyby8FtT+kRIIdRaArQD9lQWg4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ROpe0T3e; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vtXWWuRA; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ROpe0T3e";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vtXWWuRA"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M60USh932462;
	Tue, 22 Sep 2026 01:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZleSMW4/tBH6B6BJFKnmATz8bvU/qqVwclISm4zGf
	9g=; b=ROpe0T3esauNtYodhHD1biOaoUievpeWIaqxN6pPOtCsA77vB33BpFNoS
	IdHZBIYoZOn04zbhvj3CwJLGHC2X/45r7QwticC5DzdiqJfnDJd/1kHB3leKyDc6
	pyRFOvpQBozhS0k4SMo2y9LoIasclQ7rJaIO9T18bVPEb8NIV1dxUmEQuE/GVA0t
	nvTKUnda8YEENy2UJfw3rE7o1ehOUyaTNloXyPWCpCmVzEp8Ne0BemRzExgp4lmj
	S5yMhVso+eZ8G2xcHSJqwoyjLv8wEhwn3p1b9UzXVwJaIimzRwBgsjfHg/zPGVJ7
	jgwDCqlFqzJoktTBpXGIiohhR5XeQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x1v7v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:51:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/oAOp62Z7N+8sfjb6aDrD8hFinxxOaavgqy6WjMf1PUK7trby1Ejn6HayUa+dkvn/Qiv1VHR3IblXRx5l4YA7+hjGMTwc/6b+YRVzjBaUEEYzRHbnTuanfeIzg412fxtZ7lKC5hRsQiKF6t3ZdayCnIZe/sVxmNJMOH/9xgfv7MZSYsEmwK/fau+P7CSR/OHoFR3x6ljh2naxW4VC0V/+gQPEk1q5qyHgnLOwoQWUw3cAJAz6aJHLvmVdKH90yuFqBH+CMiX8l0+HwJ/kHSQVSPaHsePZxCqGtWA4QLoPg+bcXU0vJH3MA5EaPe2JLYBeVnTYhAnpQlAL9EII9jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZleSMW4/tBH6B6BJFKnmATz8bvU/qqVwclISm4zGf9g=;
 b=y+/9i94JAj7sUfCvjWyJTWy0UPIlm7RdWguiNelRMBiJEj5BwmVcp6QrpSUheWzisHksg8bV1vS6HgU6BIbd3V5XqxP9dE3JvFWnZQ8ovSR2c3CQ8ziCUpCQszHVDia3FPZ1ooDS+n+nPSC0kYDBBxN41YQ3KYQ9C0gfKjz9iBla2NjczlG8w9bXnEexAdfDCjK65PdslA/WHTXWE1Yxy7OpszHRU1rH5liT/4V5LGO2B060RaIEP0zxK1OjpRkSrI0OGTTAuUR354q6Z6NCItSwjxhckkV3aswNUtGU3pnPcAXlc7B+wM/KS2utqkeXcQ59kkGfb3yY/gwyQmJZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZleSMW4/tBH6B6BJFKnmATz8bvU/qqVwclISm4zGf9g=;
 b=vtXWWuRAxilfEFwFzW1SaClsdW954WjyrjvmuI5/3HwkNk59AROFOnqN/s9e6NynqXbYZPwe297bLX47LuulT3s5r2Q4bv4Yq2tyXOhZT4uooWPaITQ460GZWiEA4LBSu3LkJgy9mWjQ4dcR8Ajx0KALiGMsK/4aNZ5sF9mXwxU=
Received: from CH2PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:59::11)
 by DM4PR10MB7507.namprd10.prod.outlook.com (2603:10b6:8:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:51:08 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::97) by CH2PR03CA0001.outlook.office365.com
 (2603:10b6:610:59::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 06:51:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:51:08 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:57 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:57 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI4B3626771;
	Tue, 22 Sep 2026 01:50:53 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 19/19] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Tue, 22 Sep 2026 12:17:43 +0530
Message-ID: <20260922064902.2719979-20-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DM4PR10MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 11528352-8693-444e-8f38-08df1875e1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	7s/zGmr/HgxrvB4Xs/i1nyQbl/AnYSNDYQCifNocmVdXhYVe+PEI3MLzQyZzuqLiLOVBjZqIEaX9uCnG9kG1uxyWiPcSUlUt25FJTomPTEU35LyAIRlfPGNrm/W54GMwWTN8m/DgTo8f7ZOrfKMU0Cc/WgMww12VqYN9gBlAnOz1GLqcvGhH4FDNpG49aKDK+SNK+63vDWbg/nceoLJea4RJwjl/9m5M6v4/oJAT2FmvRNDaoVwjEeaMQSBKhM+tqWi9xX6sUHf6cegL+dYu5qzI026mi8/x/NNhpmHbgPuUNF6xySFoyorPsDGzXQI8wTiIyeH950aDmSQQezhWJP3t4CdRpguJM2Phk9OLo0hpkBmDsp/pmf/+RCeH44rQIC2l/QqcHt2DlbvyAAnav66hJbly2vm7mnkNhnkeF+BrSprGDOJW08UUabB3+Pae97izdDpvndnoQtimZjJ++Ja5S85+FmUUqmX51NBZPIzD+EAAVrwtUgDEc3iNyuaUXBOOES8YPSvQ1ZAoz8ZensCPUto4Rb8VNtf+ib5+CclbMjCOfd8PuXnKbAXHMBauvbde1LZd6dRmOlsbXXxDdkmGnxieAJ8yj7Sn54hMfqEMnu+RufqOmmnWJpVu9jJSnUNLJV4oiTEA39mQiVa8ufbbRLJdvlSPOPRvv9wcJbEwWhsKjxVw6PVZvniXf442m17hcSSRjQRHitoQSb5etI7v8oQi4kUXLHdjMAnYTOAJPol98Od6Jq0/lBxA9K0k
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iYS7Br0hbmiVaVdHtjloJYgbGKeob0gjAFgBbnpQGjYtV64ExJPYd227VdP94GULZlFjQuGCTFuLU1qikTUUrv8D1AtEqS+PxLdhOBUkhbVXC8Cr12vkWYp4sdz3xPzgSXTvlX5bp88jqcVB795vJl0rkIlQ5tF1Sjd6LDtvqTAFbx8pzhdhmoTD1RrJ6y5TbsJx0CVb0IsLpXclP+lhlFUOUrY2j7FsjVpIBbCWEAH06jrTpy2nQAxwH4KVWnqotJeeulUdkLsaEvneC9WY5aTq6kw1Afx48SSOhJvRsShRhDOGMRasAP6jCy7dzJjpbQUwA6kHPP69gOZvLKiXve85sQ4ymO+HJbzHU3th11DJScqEHxyaNYHglKLSZefZ0+UtUKo9pkFgktvB7dthS7AS2daUzKKeq8G3zyBJ3vZcEMyBcRsZzpJi7osmCoAA
X-Exchange-RoutingPolicyChecked:
	rqJphfPVzNGDCvrzh/IB9NJjyys8r2c+cdXCwEJU8eND8vC/8L/Q5Q/SzrUtUwBFuqh9sslqsgsPsuZS3d4XsI2t0V5JoEDAUcgi1kfeDa5N65rbTVL+BcZTW0EDz666OEJcSdWGHJm0aPrMraqMIO0Krs7chcbFToTSt5YkJ/L8Sc/i/B+yjbW/a1dD+Gpq+M0aZnIHFlV4bLtM7M70gWVPXjVnaTuz518CJA/wPfTVeot41j2yXpKSKPIfxTMJiA3HUnniBWtA+j0A77E7A7Y4i2sqexJ+J70CqXrRwR02wWI/NiCfaRu0Jyn5ShIRJrBlS7vNKD7zXONuTemEdw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:51:08.5638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11528352-8693-444e-8f38-08df1875e1b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7507
X-Proofpoint-ORIG-GUID: k5KcjZ8TjhXyF9WypfbNh0lyMKCDQQEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXzjjo1lIySImx
 tDOpMD25CP/mXUh14VJo331+bVUSadONEQuGzDKRRpUNeP0x0CgaSabq+3/kzdV+lP4NmXn/wrW
 AV+kByQDLo623QzvRjpXlHdMKqbbxOgs9eCkKaju8jGdN7O1ODLyJx0mO6I7UrHKpU7CqSu27w7
 X6sRhXAatooek1sh4JzfvP1NynBhH9+vx5UZTBes1UOSzPG79X+yHro01HdpY343bYQdWWzMetV
 eK7YXd/WYzoxl57pDbOiQoJ+rv9VZ1fW9QNIAfNAwO1uSQeuhYQxByxG0tZGIb3CLQbXMSVxcco
 qMLHd4wnn1jgSkudBFOd0ZSkSPRH7Bkz075VCEDAzrz87vervJJRJPxClljVvAhghviAH4OwS5z
 gU8sz3NdLVgAg2xBLmTEQC2gBJHozQcDOtiFDHed0d0oxzG3ZGlnhJYlY08AXyZC8hRUDFFVrC3
 3+YLTkxVdIvWDY6c0DQ==
X-Proofpoint-GUID: k5KcjZ8TjhXyF9WypfbNh0lyMKCDQQEd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX1NcOfc64oOB7
 dzIfRF8v2J8CH/Nfgeoh1B4i/z5scQ7IeD34hhTASw+WmhX0IVEn+kWyyGQHuvfgmvMMngKt3Fs
 8tcXcTIXTADBLXEEHhznhUAvnQ3oIEs=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab22561 cx=c_pps
 a=56tib/hgGBcemyuyLZC9AQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=awo6gdX1Wv1SqJAOH5YA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 1220ac13c5fd1..74aa700bc5d20 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2016,9 +2016,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.54.0

