Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A1411691;
	Mon, 10 Aug 2026 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374946; cv=fail; b=QXQ2fVfAeb4DfyIw9RwKDLsfdKVSP1ZMbVlusHrxJRtw7ZF7t22J/T98scMv4DHKZ7bOlT8kR94D/dbQftAmQ061MNrC3IHrCo8m6c4TU/JfajzbI7bAAeVG74+Fsc/m/IP4R2YiiRT1r9YFXMxZdBx5oabnK5zwvh1eqz53bvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374946; c=relaxed/simple;
	bh=aUnG7MWMn47ZVA9lxz5xXbnKuNK1NiNzJOe3WvNH9Qw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dpvx7MK4Y07J2f6X34egpMyDC6Us2Ur1jXamigYridnALgXiHXIxsgVW/Cw2e3lMacaVEg3VnTkNz2iUgnXlTggDmuwCzFMX6eg189LL4d7Y/9Tn0xKZRvgtbldQv80LWpUfhq8pOReG9cxvi19i9MteaQ5FMlOQVMAT+aLxRMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Pimw2MhV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YwdQxIxJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Pimw2MhV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YwdQxIxJ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUXCL2888540;
	Mon, 10 Aug 2026 10:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QvCKvs+rBXhJYX26qyG1RNRHxJcdWlig4QMC2oxSX
	vE=; b=Pimw2MhVVEoREkdBxBNkSZMCwQfTzTYZPlshgqx/Vk/qCKRPZgizVyOAL
	pzvAGRbuOYwQciCDo8fG9f/RTFuOBt4FPjRnDMRpBWMe/T+Ss/nwtqTVB0kHaSbY
	yREZdZyRuULnWdzbxy2+NI3F50Ox3RozAbhnPk/MT3Oz2nATVTQvHUoYYrno+rhc
	bPCLFMlK5yTKObYrWgpnYZhrHNyJmxrc7+X3PhgWSFDCTikBVwKuTbwwDo/zB9Zm
	LEEiOFKggbhR/Ib+3j4whuZk4+R1PjUkJSjOMAxj3NzBgxnLevSxLjRUrB3MkUDB
	2PSrA0D8129+/oQpRnppRm7kUnZDA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmsh7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+0DwkKGu6CZzv4Kc2y6exjJvLbtTfXm+S2xJH9XoDTCvJ7qMUDFwRiSWLeL+iZ+piTiMSn/0sVl6CRJKCnmd9LDuX3w1fsti0akzU7Pooy3UmaAGkTXpXCjRynrOTm2Q6zZT6CQRAbL0/MvFW25s5C1GS8ASCh+v2NEwvTBtHh2dz+/LEcWqoD8MVdwcwrGIydawkk2cvvfAI/PNAMyJbhqBAfAdvAvkO4iTgwoWgozg+EgHSj1vbcj/LCWPhy0ab5sXnlrBLqYIw58JLT2w3Ow1l4oJKM18rsreqG548FrLQU6iXZ8DmgP1YBvOb2SMY4yL1+ffj4eHmXIu1b9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvCKvs+rBXhJYX26qyG1RNRHxJcdWlig4QMC2oxSXvE=;
 b=hwYtp2HIpLrqWGIVvg5nSc4QKGw7Vo6spYeemnj32jqasPuh98Kqwvq5s464Xvz/LJ1VkaMrMPGQ7XSfxKNFrCpcxunQ3maiqGEWt8xCfCFJmOl+xi6JAGnxqU+1DJ6yXzWvmvp7httUhbZZcYJZ6ktUVvP0tR+dgne8KIk5a4ly4lnuaga87W3jMbxYshItme51POyXyVo9+7kwSkdVHTpHonw21TzuGL1FDB9gDclkRcdQnKh//6d4S9+hCm6xQjAXE0xMO8WuMKv4s/bgCU4AWNJxbTlcv5Qkwd2VA+0LcsaCY0wMNhCmShzgixna7NVQiJcfgNGjYedcMCY27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvCKvs+rBXhJYX26qyG1RNRHxJcdWlig4QMC2oxSXvE=;
 b=YwdQxIxJ1xI6hsS/HTT4DF4Kp+XJLBzhZMW6wYT3qrsTgZxtVvT+7uECgrw9Qz5kb941TctITjyr4rXPSR5gX/9E7vkYS3Lznf/qnKy48WfQZKqA2cks71H17CBA4yYWdSkve/ZdEQSlNpvcXd6j0wmHF2W8lGGzH1874S8+Dx0=
Received: from BY3PR04CA0002.namprd04.prod.outlook.com (2603:10b6:a03:217::7)
 by DS7PR10MB4877.namprd10.prod.outlook.com (2603:10b6:5:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:33 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::9a) by BY3PR04CA0002.outlook.office365.com
 (2603:10b6:a03:217::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:32 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:30 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:30 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW82648613;
	Mon, 10 Aug 2026 10:15:26 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Mon, 10 Aug 2026 20:44:07 +0530
Message-ID: <20260810151423.1948224-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|DS7PR10MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8989e9-7b97-4a10-fd5f-08def6f238a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|13003099007|921020|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OqAdYCKV+fdSke1JHYG4A+uwL8D2uuhcJgYBY4NWHZggh69gwGXq8zKEj9l9Q4yZUUoYD2jWVSXAxMDs6fVKAAFg5MRPBWrCr5KjR7NTXGnS4zMI/4YHmDDUCNGthN/1t+bbykQQjgn5YsvH15qZw0XgBcxvICT0zBtwonlQ103etoUzaz3TSZ+PZvVw4L4yZIxvx2eN+STgYOjUL2VcXAMfTfqxpVzRfFG+9ZGYrLWu0PVUQn4FEkS4SsNLp9Qj+wOtr8nqTMLHnJn385TkdcieEg3AsBHLD4n8PLc7bSByWgBkD2pB3roeZYSn4MR24wBxg51jhE8+Nz5VGR/UJTu6XyVqLUQihartgl+IzvIneoJ5WuxmhSQFofsWb+KoxmTeo/AVcLvxdxFtJ1nbNUGhkue+v30STEryOE40PWHNyR9oeLsMcw3OIY6Vftm2ivP1rMS9pHXrIAKuZn0wGAni5zJsG5F8dv80/4hLLD6bLD+eGvZJyOb6lR2iqvPEzuJjgdyT/RyXOOxbpAMX6rXxngZ28K5zqv0F0zNHzlv3xr8ARFxlAQrA0x/7M32sukU/65CyCHThVtRNYTYHsrvLFzsH5YpkFjQ1A9ESF59AxkOGzTgF3PxjRVr3z4ViJ3K19e2N5qxivHAK0hIydYKGRpeAX6SDfOVhohY/pAOPvMwBjjLZmgUGkJwc4mNjB9W9OVUsBnvs3jLVdccbII8LOpIrYek8V20gBh0XNnLK0HPnR5ptD3tZ1iPGYGsu
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(13003099007)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HArNf14uIy/B7v2VGZMQk/8BI6zrqCqf6HuETfFZoBnZWiWSfSiRJMGUVLl++i8Ge6tvhXgIT0dTn8siAXPKzvKS3BpV0faSJnWvSSSQc2jV9xjzGa28ElWN0IMlJXIpdw2o3e9yJjuomXQY72ijittHl/2hl+fRm3EY6k7mGTmwpwlBq2hPGU3Vfo+WFAiibHuWH91Oxd07Dgq5BqQ32cPHehUfoK5ghkdJEsQL4I8gDpxkWY3BojFKhA+1dcQRcIPO0XOIo1ZpZpoKpXGjaIgWpZqdD60icCBBFUN7nF6/qwJYm7n/p8B98pRvAcMdRjEF/6nYwfvYy8etA+X+N+mSEg7yUrHNJ+7+SnJjBcvM9AGoPbxcEjIWLH+3yqsTzr7lFwFSwBO6YdFlxuy7jDpN9Gp6RZRUMR9TU8Km1yJZgMvktcYbXpiR1+dVj78E
X-Exchange-RoutingPolicyChecked:
	kO+sDai50dSRKEhox0VyLZOHthKsPetlxaiQefS/7eX9HLMYn9jKl7tTs4hv6ersxQw8Rm4fupGIGksNXV/9OOYHntRNzeZrRv8+uB43a8fdR2pTgcjF8MiXp8qSJMGK7Q/WyScevK1NpKn9mXS26i6cpLI2ItBfZsBzAu32CTLZ5PW4CMeZIkhzFkdQlARlj6zheNgxqASjQI7k5sByha77fgGDR95suPlJIEYhD13myomSk4MnEAQYjVWzEZz79Cps8vJXCaG/VKpIIIE0AejAb2LzU/AlUDv4mpHqYA8oSkMlIuVl7/EH8tKyCBuZyG1UkLFFnMeLJsyrQm8fyA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:32.4463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8989e9-7b97-4a10-fd5f-08def6f238a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4877
X-Proofpoint-GUID: HrUSATvSWqP0_tvTbCRFG3Z5kPF5t4kB
X-Proofpoint-ORIG-GUID: HrUSATvSWqP0_tvTbCRFG3Z5kPF5t4kB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX+zP6OXwOT7fS
 ebJWRbbCGy3yw0KouW2C7D35734bvdX/6PiUKzfRqC7JWcQZGnKbpeHgm6TOLuBOIKvHsOSh4kK
 VcHgzQb1/B7Q8CDyMLZ4GybSucgLnxmGsdgHlcXmuIGTkrRyNbKBrB3Zwy8yC56/ZrSa3mibVW5
 HvoCKa/EmuHKvtIjKT2Ax6aKUPJ2a6Grx9vzzpYEfMDxT1yG/FeyqVHIbTmbNBhy4FHcGHndRsV
 5DkZ4/IGgE8ncuyC21yGr/O0rPXvC5xdabPzh45oNTgHT8N+8n4dnmNQWMknQFPtlECeuRjN3La
 slFH7kFkjl/U7t283lO72vP/Gmj0/0t5y/wkFm0ajaYK22Xh+r4C3oVO+DcXQ2bpeBamFlJ3dDJ
 pBLJXMHGXNm1oJQshaR7CqxsQ2RDuYE7IV8IAvwxKJADyR1k8fDpTAiG05TCzAx+cwZCaACRXFt
 QxDWSBSMO2tQP7cgjdA==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a79eb1a cx=c_pps
 a=97Y4xzKGYTGm8d2IOhb7pg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=hcTNyZL6kbs_FXLRU4UA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfXzUwstGAjjCU1
 b/My+YlZo4HuYxzCFNHCKfTxe6bLt346qNaxnYbeUAAi/NEpFnE6v0YQLrb7M/ZrA0a3pPeihpo
 I0sp8yU56dwTU8HFELRFkaP3K+/qCus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 211 ++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..76184485ebcba
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel ID for the peripheral
+        This is the mapped_channel_id assigned to the peripheral in the PSI-L
+        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
+        has a distinct channel ID; use the channel ID for the specific
+        direction and chip-select being requested. Use 0 for triggered
+        block-copy channels (cell 1 != 0).
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupts:
+    maxItems: 75
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 75
+    maxItems: 75
+    items:
+      pattern: "^chan([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|4[89]|5[0-3]|6[4-8]|8[01]|12[89]|13[0-9]|14[0-3])$"
+    description:
+      The name of the interrupt corresponding to the DMA channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #dma-cells = <4>;
+
+        interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan0", "chan1", "chan2", "chan3", "chan4",
+                          "chan5", "chan6", "chan7", "chan8", "chan9",
+                          "chan10", "chan11", "chan12", "chan13",
+                          "chan16", "chan17", "chan18", "chan19",
+                          "chan20", "chan21", "chan22", "chan23",
+                          "chan24", "chan25", "chan26", "chan27",
+                          "chan28", "chan29", "chan30", "chan31",
+                          "chan32", "chan33", "chan34", "chan35",
+                          "chan36", "chan37", "chan38", "chan39",
+                          "chan40", "chan41", "chan42", "chan43",
+                          "chan44", "chan45", "chan46", "chan47",
+                          "chan48", "chan49", "chan50", "chan51",
+                          "chan52", "chan53", "chan64", "chan65",
+                          "chan66", "chan80", "chan81", "chan67",
+                          "chan68", "chan128", "chan129", "chan130",
+                          "chan131", "chan132", "chan133", "chan134",
+                          "chan135", "chan136", "chan137", "chan138",
+                          "chan139", "chan140", "chan141", "chan142",
+                          "chan143";
+    };
-- 
2.54.0

