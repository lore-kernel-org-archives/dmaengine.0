Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630114F7CB3;
	Tue, 22 Sep 2026 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059876; cv=fail; b=XvkDcJpwS/4g64CqiP9G/F9lqSaAedfMgHjZbYxCSUYBZRbujjq2JK/or5FC2txrAJ4OCLvVm4O1iagtl6UBTObjE64o1vMFmUjvE8vSXSfRczqhdRBXce9jug83PVyguRjbRa/n36cZBKijLfokUD1MPgj/bM08/jH+ZilMBJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059876; c=relaxed/simple;
	bh=5nWBKKrAJFQlSxaK7OHYy2/eUTeQUg5eIgUDa1P+VMo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVYytlVw15+/ad9w3mVdVHByU6YW0B84azq0bHqJZGwrGbfJHst9R2id9lNHSBXMofi4HdX2NYgHIP4WL/Lj3oHqcXpBE1S6soLvp9iDqY5kaJRbyn52vPpV/pxvcyhEAlywBW4hq5qEAL22oZ3CqkwKIt8DOryDq1QTWQVlPik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OwOqS7X5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E3ETDDp4; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OwOqS7X5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E3ETDDp4"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1qEth1436209;
	Tue, 22 Sep 2026 01:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8Z+/+NxsMMTFaprxTcIyhexb+wytEo/4At6ia3nQB
	DE=; b=OwOqS7X5YtLsqnfYUGp/E5gBaW6zrcMt4PYuS158Sc8FPMWr183o+VkI3
	icgAvrm0rxUdo6uNyLUHRE30R0B0GTZeS0pM3MUtQGSssaNDfsaJivbakh0dNCMk
	//p+vPaxF/wbgbI4P3XZWkDl5CTgV7ps4UHmMghuDcPq8B36wOJ7ZS+QAg8SM8kr
	5UwDiG1A5Vc5lhc1eFVYFm2Kv4Z+B7ZHettqii6TWzejtZak4SRC8AFhcrYwk/qu
	R0ekkTGZWkjIrTO5cVXYXejpIOjN6q/IXsLCZIJHOMXNHUVWbocUd/cPhtoH/Fug
	Bm0JPJjS8M7LjtrcTGagriRrcdYbA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcsscmk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCANB69xXb4r99fXZkPJFfgV83QphAjkK7OiZnJQxez4djB9RB01Hae2b7d+5+/7qKB7lxdq7g+F9KVl2h+vMfypV8GVzaqPLaP7bM5FuURWtZ+pd26tSmO651tNrMwiLlmx+P5e33+pQ9ThDbxW4EJRcc2gkwGLQUGnfLLeeuGJWTIjkugK7vmnUChTNPBzBZ2cCj2RImGKxpb5NBxPyRD4bduEdm9cUsuj8g2+tMiYXXCznowfyIdCABr5i6i76FI2pAVPkpdzT8xKUEOtx5xX79git7+R56xdNjJbZK1ZEfVGHgIuAUMN3OjqoqPZ+cqn9a5uv6krjEQROsAubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z+/+NxsMMTFaprxTcIyhexb+wytEo/4At6ia3nQBDE=;
 b=PZt9faU17Xibse3lWauInt3GwmtHrEXRuSY6xsvuq9IkHgTQic2VBJ4ilQNHEHekvzio1V7xnKGPqA/VEafg81T6DSXIWxkG6KZsROdfx7wf9Wo1qMbz59DjyL/7q+ZKiZ8cLAQZsCMBtGzuj+rHOuLmR5e5ZGDsfxUF7nwTBFsi9OOn847vNCJB4zg1LSSCgCJ1ifxK5BoqlW7wT3b3xm9xVpaXHYEfFa34Pi8/oq2dmhyhOZQCl5jnbfLs+rz1NyjnxbZmiO73BZlD5tkaBF9lFTdwOf8vNdRRc3lszWBKo9u+ywTgeeaKSV3FKe2sEZ9xcjrar52mITpqynwpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z+/+NxsMMTFaprxTcIyhexb+wytEo/4At6ia3nQBDE=;
 b=E3ETDDp4ZkK9TqVypAC+ARVJHSGvJUNChoVzwfl06cxhmBsVpn+X+7R+6jum/c6gLbCybEWSVfsau9OlQAfyCSfHtrTooTt4jApXGrjcn/z4CLczYeK/NFIhPL7zdD6qBCfeKieQTrGXxZqc3Ye4Hgo2hwBMUt+L+/naLH1vNX0=
Received: from CH2PR04CA0013.namprd04.prod.outlook.com (2603:10b6:610:52::23)
 by BN0PR10MB4934.namprd10.prod.outlook.com (2603:10b6:408:120::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:53 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::12) by CH2PR04CA0013.outlook.office365.com
 (2603:10b6:610:52::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 06:50:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:53 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:37 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:37 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI473626771;
	Tue, 22 Sep 2026 01:50:32 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
Date: Tue, 22 Sep 2026 12:17:39 +0530
Message-ID: <20260922064902.2719979-16-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|BN0PR10MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: fdaeac85-9401-4adb-46e6-08df1875d8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|56012099006|10067099003|3023799007|22082099003|18002099003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	/VbveqKaWWeyzdWEKChaJHvVNUpoSPgZNm7L9ADQKFf/bfjd5N4PkXpnE4xArkJyQjfESuX1LoVGcFGeVlvJJnKA6karmvt1KU3MpVvpOm8NTUSvBB+76eM4kV+AhI8bqR+mTCw9bT51PGH6q3kUXVXbgcz7ak/7ord92CT30J1Jqt+DT/JoRqWgDIoMx5rqKBy/G3t9+iXuQ2sDGI+EOb3ZuqoobCld7Idv+h8pc0u6XXYph+zKHbecN+EvLspS1dtzQbtZz26qDYEsQEpcdEoDO025lPbLLjNXkGtPRMfwYoptRv1e+tJWmYK5TJvt/Dyf4G1INCKsC3nNGe+DpEuja/x7mci0PYIs+6qKhfOHgax/A+8ygw6MAYaJSH9Cz7VtHfFxv4Ob49IXmZxa1ABwMy9TUgC0CTrKsi7eqLYlH1q+RlWOEJCT9HiL92FXZ6g112KBxgcHo6JJHqDcG1HJeD77olFcbPMV9FgGM5gKVhODLXtPcLFK2x4rRrC2Bghw46FrlqO/pboyrT6Rt/p1FNuhETv55hiMa5NSyIRNq2IT0BaJ0d61KAUoNu25yFMSmgz0I1o9xjeSawC+RJCT9OuIw0oQMhnJ4t3KEJ+GLBWY3EfRs3ciMRfQJSJNkzXXbaeh201JO5BazlzDWr1ifBgllJzMC9akXvJSeu0JLsV8uxHqX28jmeB09ml5
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2mDmK9Ldhj6tcY05ucgXDt2eLonLv+Xih4hGtshfrspbbYq16GCdukCyJ1k0Zmx/pZqbimzWAv2sGvK7eI5sRKAdoYsLGtI+56Ixch2VARXyC+wnACT8uac4i0ax8p+nGwnGbswdbHUPGeuYcYAdHkdPq6DaP74hrhcCRwLGvZXugUsbmuzeKEgOxYvAz+4G6FJKXTYnQT3Vo7AfdcqOg0Hh6dby71WSBDIUQ3/n/y6fDs/FmZK1YKkeH5wzDBeqDN98oXMS5gZk/uQeI9pcUDdaJpnayICK4OoQJ2qV7fmper1Nd8ESrSGv+z8LZSOt7iAwfO9GJtEDKL0IZpKop3eUO6w5/FBozviv+tPOBnJ29iLHvTQ4tPMuQS9ZxW2/stveVDj9vbrUWTUpOYRNLXb9x+PEVuyODu1jqR7H9z27CBDoW8tUOU20kl9mQWWf
X-Exchange-RoutingPolicyChecked:
	TBAb8fd1NgsDq8RomMCYYHCHe05SqMK0QlWoenjPrq/SMPtfIKIgs/mFZlgv2eij/8B4ILsCcGb0sbN3OewLfvsbEnXZ/ZjgcxonAEXLZaSNeiBd4lDp+sS66tlr8VVGh5GLTlXhHvS7gR21ADIUQ4cxX7HzgEL9JW+Iy/gQ6tDUzwkvbhrIL5BJGpW8OgtqSWrmmuHTZ8hA9kk9MATroRx/rb+dpZuMqlX6N341/L1FrmDS+A+3pj+uLmV8BH3LBj92UDPLhVbGAEU0O+FZs6pz3pUquls4H95MQ1+IwPydWx3hNMSJd32LF38V0UbctGc2czBda47AHZUYkO25EQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:53.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdaeac85-9401-4adb-46e6-08df1875d8bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4934
X-Proofpoint-GUID: yxYm8POdPZ2iBH6_KqHvrtYEaG3Ryb_7
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab22551 cx=c_pps
 a=aOchWjQmdX1ADhYh+yUFEQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=SxTibnW5tSAW0Is98DsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX+OjnXZ6jpZS9
 c3TFwiIepS98D4ALqV6OkgdczibJTkFTliGT2UmeXlfv0HEHfdQCL0Ai9gnI0b4bjUmD+g4kCYu
 iTx7ZW3twSyFi+RGVwZzaRUnG00bFgc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXwGFW54vFeMIV
 qe5O3xBrxlIDWS8lFggjqsVtOHkqdGFfHZuUpaZRcEap79LmL3rLGtzcU16ffgtnjsT/kuyOyg+
 yjP+PTACYUuIe1/0pcEuqX75EcrmLp3ixIC/HDp/q953a+qxwhQ7YM80nXzFkHuM2jjn2+M0f8p
 h2rjMr2n9VnM2nKE5vHHydZkXlN00yBtwQLjwYDBN5Wh/WdJ8u86y0CMKl8tHEeQbKoFwOHwyef
 M0apsJ4z3FKTgkXksXoera8ofin3XMkwI0qWUPJP9pLObJp7mF2z3EXiuxiLbinLEBokqHw+RER
 nCLA5zZK0D1ITUrxxhFe+kktmmskenkUfvW+gPn2XTPiboN3lIr3UQeRbCqmDOIGeTisMjxdUut
 yqaLuxTW/tH/zcpMCFgEgCyfsna8ZmQqeKw/WN6Py0eftb3MDcTCauGG0ret943Rq1A9/ZMrT9A
 nJLauZ5nvIGN3pVnN3w==
X-Proofpoint-ORIG-GUID: yxYm8POdPZ2iBH6_KqHvrtYEaG3Ryb_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Add PSIL and PDMA data for AM62Lx SoC.

Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
selectable fifos. Also add a new fifo_id field to psil_endpoint_config
to specify the selectable fifo_id.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Makefile        |   3 +-
 drivers/dma/ti/k3-psil-am62l.c | 169 +++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-psil-priv.h  |   5 +
 drivers/dma/ti/k3-psil.c       |  78 ++++++++++++++-
 include/linux/dma/k3-psil.h    |   3 +
 5 files changed, 253 insertions(+), 5 deletions(-)
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c

diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index 3b91c02e55eaf..41bfba944dc6c 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -14,6 +14,7 @@ k3-psil-lib-objs := k3-psil.o \
 		    k3-psil-am62.o \
 		    k3-psil-am62a.o \
 		    k3-psil-j784s4.o \
-		    k3-psil-am62p.o
+		    k3-psil-am62p.o \
+		    k3-psil-am62l.o
 obj-$(CONFIG_TI_K3_PSIL) += k3-psil-lib.o
 obj-$(CONFIG_TI_DMA_CROSSBAR) += dma-crossbar.o
diff --git a/drivers/dma/ti/k3-psil-am62l.c b/drivers/dma/ti/k3-psil-am62l.c
new file mode 100644
index 0000000000000..ee77fae3787a4
--- /dev/null
+++ b/drivers/dma/ti/k3-psil-am62l.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/kernel.h>
+
+#include "k3-psil-priv.h"
+
+#define PSIL_PDMA_XY_TR(x, ch)					\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XY,		\
+			.mapped_channel_id = ch,		\
+			.default_flow_id = -1,			\
+		},						\
+	}
+
+#define PSIL_PDMA_XYMF_TR(x, ch, fifo)				\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XYMF,		\
+			.mapped_channel_id = ch,		\
+			.default_flow_id = -1,			\
+			.fifo_id = fifo,			\
+		},						\
+	}
+
+#define PSIL_PDMA_XY_PKT(x, ch)					\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XY,		\
+			.mapped_channel_id = ch,		\
+			.pkt_mode = 1,				\
+			.default_flow_id = -1			\
+		},						\
+	}
+
+#define PSIL_ETHERNET(x, ch, flow_base, flow_cnt)		\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_NATIVE,		\
+			.pkt_mode = 1,				\
+			.needs_epib = 1,			\
+			.psd_size = 16,				\
+			.mapped_channel_id = ch,		\
+			.flow_start = flow_base,		\
+			.flow_num = flow_cnt,			\
+			.default_flow_id = flow_base,		\
+		},						\
+	}
+
+#define PSIL_PDMA_MCASP(x, ch)				\
+	{						\
+		.thread_id = x,				\
+		.ep_config = {				\
+			.ep_type = PSIL_EP_PDMA_XY,	\
+			.pdma_acc32 = 1,		\
+			.pdma_burst = 1,		\
+			.mapped_channel_id = ch,	\
+			.default_flow_id = -1		\
+		},					\
+	}
+
+/* PSI-L source thread IDs, used for RX (DMA_DEV_TO_MEM) */
+static struct psil_ep am62l_src_ep_map[] = {
+	/* PDMA_MAIN1 - UART0-6 */
+	PSIL_PDMA_XY_PKT(0x4400, 0),
+	PSIL_PDMA_XY_PKT(0x4401, 2),
+	PSIL_PDMA_XY_PKT(0x4402, 4),
+	PSIL_PDMA_XY_PKT(0x4403, 6),
+	PSIL_PDMA_XY_PKT(0x4404, 8),
+	PSIL_PDMA_XY_PKT(0x4405, 10),
+	PSIL_PDMA_XY_PKT(0x4406, 12),
+	/* PDMA_MAIN0 - SPI0 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4300, 16, 0),
+	PSIL_PDMA_XYMF_TR(0x4300, 18, 1),
+	PSIL_PDMA_XYMF_TR(0x4300, 20, 2),
+	PSIL_PDMA_XYMF_TR(0x4300, 22, 3),
+	/* PDMA_MAIN0 - SPI1 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4301, 24, 0),
+	PSIL_PDMA_XYMF_TR(0x4301, 26, 1),
+	PSIL_PDMA_XYMF_TR(0x4301, 28, 2),
+	PSIL_PDMA_XYMF_TR(0x4301, 30, 3),
+	/* PDMA_MAIN0 - SPI2 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4302, 32, 0),
+	PSIL_PDMA_XYMF_TR(0x4302, 34, 1),
+	PSIL_PDMA_XYMF_TR(0x4302, 36, 2),
+	PSIL_PDMA_XYMF_TR(0x4302, 38, 3),
+	/* PDMA_MAIN0 - SPI3 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4303, 40, 0),
+	PSIL_PDMA_XYMF_TR(0x4303, 42, 1),
+	PSIL_PDMA_XYMF_TR(0x4303, 44, 2),
+	PSIL_PDMA_XYMF_TR(0x4303, 46, 3),
+	/* PDMA_MAIN2 - MCASP0-2 */
+	PSIL_PDMA_MCASP(0x4500, 48),
+	PSIL_PDMA_MCASP(0x4501, 50),
+	PSIL_PDMA_MCASP(0x4502, 52),
+	/* PDMA_MAIN0 - AES */
+	PSIL_PDMA_XY_TR(0x4700, 65),
+	/* PDMA_MAIN0 - ADC */
+	PSIL_PDMA_XY_TR(0x4503, 80),
+	PSIL_PDMA_XY_TR(0x4504, 81),
+	PSIL_ETHERNET(0x4600, 96, 96, 16),
+};
+
+/* PSI-L destination thread IDs, used for TX (DMA_MEM_TO_DEV) */
+static struct psil_ep am62l_dst_ep_map[] = {
+	/* PDMA_MAIN1 - UART0-6 */
+	PSIL_PDMA_XY_PKT(0xC400, 1),
+	PSIL_PDMA_XY_PKT(0xC401, 3),
+	PSIL_PDMA_XY_PKT(0xC402, 5),
+	PSIL_PDMA_XY_PKT(0xC403, 7),
+	PSIL_PDMA_XY_PKT(0xC404, 9),
+	PSIL_PDMA_XY_PKT(0xC405, 11),
+	PSIL_PDMA_XY_PKT(0xC406, 13),
+	/* PDMA_MAIN0 - SPI0 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC300, 17, 0),
+	PSIL_PDMA_XYMF_TR(0xC300, 19, 1),
+	PSIL_PDMA_XYMF_TR(0xC300, 21, 2),
+	PSIL_PDMA_XYMF_TR(0xC300, 23, 3),
+	/* PDMA_MAIN0 - SPI1 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC301, 25, 0),
+	PSIL_PDMA_XYMF_TR(0xC301, 27, 1),
+	PSIL_PDMA_XYMF_TR(0xC301, 29, 2),
+	PSIL_PDMA_XYMF_TR(0xC301, 31, 3),
+	/* PDMA_MAIN0 - SPI2 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC302, 33, 0),
+	PSIL_PDMA_XYMF_TR(0xC302, 35, 1),
+	PSIL_PDMA_XYMF_TR(0xC302, 37, 2),
+	PSIL_PDMA_XYMF_TR(0xC302, 39, 3),
+	/* PDMA_MAIN0 - SPI3 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC303, 41, 0),
+	PSIL_PDMA_XYMF_TR(0xC303, 43, 1),
+	PSIL_PDMA_XYMF_TR(0xC303, 45, 2),
+	PSIL_PDMA_XYMF_TR(0xC303, 47, 3),
+	/* PDMA_MAIN2 - MCASP0-2 */
+	PSIL_PDMA_MCASP(0xC500, 49),
+	PSIL_PDMA_MCASP(0xC501, 51),
+	PSIL_PDMA_MCASP(0xC502, 53),
+	/* PDMA_MAIN0 - SHA */
+	PSIL_PDMA_XY_TR(0xC700, 64),
+	/* PDMA_MAIN0 - AES */
+	PSIL_PDMA_XY_TR(0xC701, 66),
+	/* PDMA_MAIN0 - CRC32 - CH0-1 */
+	PSIL_PDMA_XYMF_TR(0xC702, 67, 0),
+	PSIL_PDMA_XYMF_TR(0xC702, 68, 1),
+	/* CPSW3G */
+	PSIL_ETHERNET(0xc600, 64, 64, 2),
+	PSIL_ETHERNET(0xc601, 66, 66, 2),
+	PSIL_ETHERNET(0xc602, 68, 68, 2),
+	PSIL_ETHERNET(0xc603, 70, 70, 2),
+	PSIL_ETHERNET(0xc604, 72, 72, 2),
+	PSIL_ETHERNET(0xc605, 74, 74, 2),
+	PSIL_ETHERNET(0xc606, 76, 76, 2),
+	PSIL_ETHERNET(0xc607, 78, 78, 2),
+};
+
+struct psil_ep_map am62l_ep_map = {
+	.name = "am62l",
+	.src = am62l_src_ep_map,
+	.src_count = ARRAY_SIZE(am62l_src_ep_map),
+	.dst = am62l_dst_ep_map,
+	.dst_count = ARRAY_SIZE(am62l_dst_ep_map),
+};
diff --git a/drivers/dma/ti/k3-psil-priv.h b/drivers/dma/ti/k3-psil-priv.h
index a577be97e3447..970afd46a79e6 100644
--- a/drivers/dma/ti/k3-psil-priv.h
+++ b/drivers/dma/ti/k3-psil-priv.h
@@ -35,6 +35,10 @@ struct psil_ep_map {
 };
 
 struct psil_endpoint_config *psil_get_ep_config(u32 thread_id);
+struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
+						      bool is_pktdma,
+						      u32 *thread_id,
+						      bool *dev_to_mem);
 
 /* SoC PSI-L endpoint maps */
 extern struct psil_ep_map am654_ep_map;
@@ -46,5 +50,6 @@ extern struct psil_ep_map am62_ep_map;
 extern struct psil_ep_map am62a_ep_map;
 extern struct psil_ep_map j784s4_ep_map;
 extern struct psil_ep_map am62p_ep_map;
+extern struct psil_ep_map am62l_ep_map;
 
 #endif /* K3_PSIL_PRIV_H_ */
diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
index c4b6f0df46861..580fc553e23fa 100644
--- a/drivers/dma/ti/k3-psil.c
+++ b/drivers/dma/ti/k3-psil.c
@@ -28,6 +28,7 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 	{ .family = "J784S4", .data = &j784s4_ep_map },
 	{ .family = "AM62PX", .data = &am62p_ep_map },
 	{ .family = "J722S", .data = &am62p_ep_map },
+	{ .family = "AM62LX", .data = &am62l_ep_map },
 	{ /* sentinel */ }
 };
 
@@ -71,12 +72,68 @@ struct psil_endpoint_config *psil_get_ep_config(u32 thread_id)
 }
 EXPORT_SYMBOL_GPL(psil_get_ep_config);
 
+struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
+						       bool is_pktdma,
+						       u32 *thread_id,
+						       bool *dev_to_mem)
+{
+	int i;
+
+	mutex_lock(&ep_map_mutex);
+	if (!soc_ep_map) {
+		const struct soc_device_attribute *soc;
+
+		soc = soc_device_match(k3_soc_devices);
+		if (soc) {
+			soc_ep_map = soc->data;
+		} else {
+			pr_err("PSIL: No compatible machine found for map\n");
+			mutex_unlock(&ep_map_mutex);
+			return ERR_PTR(-ENOTSUPP);
+		}
+	}
+
+	if (soc_ep_map->src) {
+		for (i = 0; i < soc_ep_map->src_count; i++) {
+			struct psil_ep *ep = &soc_ep_map->src[i];
+
+			if (ep->ep_config.mapped_channel_id != (s16)channel_id)
+				continue;
+			if ((bool)ep->ep_config.pkt_mode != is_pktdma)
+				continue;
+			*thread_id = ep->thread_id;
+			*dev_to_mem = true;
+			mutex_unlock(&ep_map_mutex);
+			return &ep->ep_config;
+		}
+	}
+
+	if (soc_ep_map->dst) {
+		for (i = 0; i < soc_ep_map->dst_count; i++) {
+			struct psil_ep *ep = &soc_ep_map->dst[i];
+
+			if (ep->ep_config.mapped_channel_id != (s16)channel_id)
+				continue;
+			if ((bool)ep->ep_config.pkt_mode != is_pktdma)
+				continue;
+			*thread_id = ep->thread_id;
+			*dev_to_mem = false;
+			mutex_unlock(&ep_map_mutex);
+			return &ep->ep_config;
+		}
+	}
+
+	mutex_unlock(&ep_map_mutex);
+	return ERR_PTR(-ENOENT);
+}
+EXPORT_SYMBOL_GPL(psil_get_ep_config_by_id);
+
 int psil_set_new_ep_config(struct device *dev, const char *name,
 			   struct psil_endpoint_config *ep_config)
 {
 	struct psil_endpoint_config *dst_ep_config;
 	struct of_phandle_args dma_spec;
-	u32 thread_id;
+	u32 thread_id = 0;
 	int index;
 
 	if (!dev || !dev->of_node)
@@ -90,9 +147,22 @@ int psil_set_new_ep_config(struct device *dev, const char *name,
 				       index, &dma_spec))
 		return -ENOENT;
 
-	thread_id = dma_spec.args[0];
-
-	dst_ep_config = psil_get_ep_config(thread_id);
+	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
+		bool dev_to_mem;
+
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[0],
+							  true,
+							  &thread_id, &dev_to_mem);
+	} else if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-bcdma")) {
+		bool dev_to_mem;
+
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[2],
+							  false,
+							  &thread_id, &dev_to_mem);
+	} else {
+		thread_id = dma_spec.args[0];
+		dst_ep_config = psil_get_ep_config(thread_id);
+	}
 	if (IS_ERR(dst_ep_config)) {
 		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
 		       thread_id);
diff --git a/include/linux/dma/k3-psil.h b/include/linux/dma/k3-psil.h
index 5f106d852f1cf..36e347311f8b2 100644
--- a/include/linux/dma/k3-psil.h
+++ b/include/linux/dma/k3-psil.h
@@ -35,6 +35,7 @@ enum udma_tp_level {
 enum psil_endpoint_type {
 	PSIL_EP_NATIVE = 0,
 	PSIL_EP_PDMA_XY,
+	PSIL_EP_PDMA_XYMF,
 	PSIL_EP_PDMA_MCAN,
 	PSIL_EP_PDMA_AASRC,
 };
@@ -78,6 +79,8 @@ struct psil_endpoint_config {
 	u16 flow_start;
 	u16 flow_num;
 	s16 default_flow_id;
+	/* XYMF FIFO index (0-3 for CS0-CS3), Only for PSIL_EP_PDMA_XYMF */
+	u8 fifo_id;
 };
 
 int psil_set_new_ep_config(struct device *dev, const char *name,
-- 
2.54.0

