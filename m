Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3445436344;
	Fri, 24 Jul 2026 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888623; cv=fail; b=LP6Ls7z32RdPuNN/Vt6CzhhPGne3r0XhOFBVE6n0bj0OxPPG5I70E8BPAwmeNRwUDbPmW5vRucaR3UrmXA26GUebIHNWOdFBQhyRPlQqMyruVhRuMoQvEPzeGD1gq5ePVrsGG0XA0SxRnpo047jvouoEnKCpmNGYDESQKMXbW7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888623; c=relaxed/simple;
	bh=CiO6ry1YOOKsrffI8TGO5d9U0qf1KsG35D6VwptBlFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ronAZ7w1qVTpOth6Ggzu12yGLmsy0HTuhQ/nJ4K07XZ2irjrAtozlDzlQalN1OQqcZkFtcjuUQz8eKhZKHLR1sYngZg2PaLmW7JtZsOs75KqgmJQNNtZJdng8ltNv7vVtCjFPY+IUG0039Vn+vfcnl2ubR/k5Wgv8rXCrv0Yzfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PfLLP+BU; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=px0OPFs2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PfLLP+BU";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="px0OPFs2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAFC4h2796788;
	Fri, 24 Jul 2026 05:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GXGdgG58ROBEJqgorcVLSNLilXa2FQL79ZhqkIfPh
	xU=; b=PfLLP+BUSIRrXA4Joe1/iHn2wCmyMf8kWvjsh7SVTCksHP0QE4dzUjxhk
	Y3cYV2NOEtxRJ06G5OG83ZdroiEnkeJZIzrc8nj9NPT+L9u2Jl9AqnMVNh4q0e+l
	SBPZjSsv9UsNuWuFDFn6/NsHAvHhBoVYI/9rwTzt/QyLIBBL/UTiWOIZrkJy8tus
	l9Bf9epWeoCHOH5u/tIOxZkKOzB06x4c81klpSNuWi8HVp534xuVAp8ZLy3kDUmD
	bfaaYd4RKhMF1Y7/+sZgth53qW9hgfOs/kU5Egz0h9ljV4+P4htK/102rtAzCOu2
	z+NbbERKnwGOzK9NcaSjghBUSdTjw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fm3v38pyg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:23:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqatNUMp/QD1wNoEriWdIKkEvBjKX6v8hdo8JZl5OhKgMyBXhdYrD8wZEpzODHbaAhBMyhNP7299r+jo757+h+FFCJJ19NjVMr0Xjx7V94rQWbPoSw+dGWukpxbnORvmUZuaJhj/ubl3bV9P+EGjNJnTQR5pxqBJTlTOEzvqiiPbx4Boes08IC3iZAaiOPBlAerzqN+p/fnMsJNK0m+HMHIqXWzz3XrE3DfU5F8Ued1zQTkaewy4VPP5eE3gGDoZWA/Vx5X1CfERCVDgnr8Rq/A1Wa6M0ppOz026ldGvxM+5v0x60J55/xlrI4XzyMXxgG/1+d+6kgr/Is0rveegfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXGdgG58ROBEJqgorcVLSNLilXa2FQL79ZhqkIfPhxU=;
 b=ObHD+e4TDV8s/dKw9g9jgRx2QdS2sUaOTB6yGavKdcUO3oDwM1TuzJdwm+g/ckG2k/iVD8uDBHD+ICPrI82t7RR9+iMf9pdCi4pHhnAMD2PZ/5+lJlOaIqhNWMfbuDcAHQtsH5uIw5UFPNhmvSh8RpDQpHRqZpGLP+JXrIutJv+d6W9InE1qWozoiR8pF4oWSRVVPf2CIyXWUPpeWsy5ypUoT8VrVMjOBkp8ZhEHFNUH9SvAuCF0S7/BqviZ9teBdTf1Z1oW3hfelrgHOsmRHK97zeuwexeV5oqrUN3OsdgZRyXAsoTU5wouKRyky6zwYXoUWGuM1jPIia6SPKGJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXGdgG58ROBEJqgorcVLSNLilXa2FQL79ZhqkIfPhxU=;
 b=px0OPFs27qrMjA+++nsFKzBNkGE3fxRqT6TVa4lv0jAJBy6xo8OkkVMUtF6oMrcQQkZRErVgF+Xjc7d+TpO3HPkbNUdbKToXKPSzjhi+dckdULKkA+x+OvWcgJJYq14cZXVsqhediSd5jS21Cg3xk2TwqbC/HtSyhaZeMCwd9Hw=
Received: from MW4PR04CA0105.namprd04.prod.outlook.com (2603:10b6:303:83::20)
 by DS0PR10MB7341.namprd10.prod.outlook.com (2603:10b6:8:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:23:15 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::7e) by MW4PR04CA0105.outlook.office365.com
 (2603:10b6:303:83::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:23:14 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:23:06 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:23:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:23:06 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFY3017088;
	Fri, 24 Jul 2026 05:23:01 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 19/19] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Fri, 24 Jul 2026 15:50:52 +0530
Message-ID: <20260724102115.2854-20-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|DS0PR10MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: d71907f6-c44e-4734-abaf-08dee96d91e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	5mghoabT5Gm1Ukfqgs6IVXp2JwQk5WcdIsyIGjTeQALtOmns4moGqOya+NNQSS+pTE7TI3dQ7WPHiuKNl5xEQUvMpZnF4ilVpVZQDibkrM1oUMQn09F7ZQI6TWSG1c+u5h+0ql5jDpjLzaJbKaR1d32b9/0iy+OMmfnoah6bCG6lJP2F0YGcnK+59ITKa1l1nZd5/m/MYLNxF7NZM+4yRTXFIe5y4Y0pe3SvSwnNtkGGRNPmirrj6GDHN/HRzN5q6Pk9v150ciankIBF4KUpqsVExwGDotuum7zkD1JKRrNXhdkSMrI5yWn1VQBDS6MPEAiXQWsoom8zSktOYo0lJYoctSyZOB1Yu6pm2bUKEztomaQhpXssj+JT60+jEQ7iuJ3LxRTrIC2IrSviOn5UP/V1fq/NO6ceQjfIaLC/A+toE1ih01RE68G4v8XlotJd9TaJOiWM9M5HR7b+Jn2WmY9xsxQaCJLM26C8fGee++hlkFKa24ZjZet+N56p4gLTiEcQVZeVDENB3rKUPaEkh6+4yUxWYaH53tnuBwq8Eef512tsuABV4XnNQShlujaPdJBbLPy8hrnT4xXij/u8QjTeE7jG3M5WUPJvyfE301hPJcfbB43hiuY8UelTZhllDJ7AjGP2W/KtaWzRaO/6sdi9HKMrmVVn/EmUvKkBPEFfBtr2Sb0oMX/CzMSPDoPTeiOoCEWUAy0FQYvdOnBRfPE7rDejP3rBDKxJ8PVTb76rwKVcxxI5p0k4eHylBdHt
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nAvJlMa9UrOSDTIB4zNyS9u8EoZ8MnHtZhdh2VDydddoNbye/A9iigUVfsV9codsH9LZXPiDqkr6Zxr8ISJCuR1BOHsV8aek7061+6Or77uKUbZgXTFLSvpeTtEEBZf37s/6K79dSzyr5hyuJsELSzAXd5kA4rCyfAd59OsDEIbviufrMG/JuWDP4FCZC91Vz8tOPZzfbINaZVw4e2aVVZOobvffFf/mzyfYRHCp8dx6ASTejGfslumHHTsLT0970SZRGYh9tHIM9dVbQfslsguzcBo3G6QJOX4nbkZZiYau2iPoITtUAmF5/YccczTQGmhLnMcBPZrGX2U6xe60D7ZrPkYg3VTxzH/yR+9Fje32BML8jzwco4cfBKCWJjacmnDVAuzbFDIIKX3rXu56IhaNZoSFU4tS5Dt+Uv/L2Sw+Yc4YTLsI+LQxNdoxL51Q
X-Exchange-RoutingPolicyChecked:
	H5mhCexc1KiiN8ZXTPT/kKxUhcCBdZvWVMZlOMxO4bqq3rI/xRPDQpv7ULDj8iDWDBxhUCcWMiVxS7BEc30z8tQViR/YGWHUiGsTbVQm3CwiXzLivXeErw2yePBQdKgQ4Y8Ls5Cqt/620gWPD0fZXqLlKMMpcoZBJmorU2qHqp4ZDF/aAboCezZ+977hhVXO/lzcmrg7JZkwt1bjosEfNbIH8AVLjDoUvi5gXRIaFbyAFquQAMjwsUMp/ylpwnRPoCDoz+zzcXhcGwKfKSsOCmIN/8vP2IC0mWIraL2oXVoEA9lwYx60hgFKvwIS7CXD4Yy1S3GTPK0R4s6TXP7A6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:23:14.0239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71907f6-c44e-4734-abaf-08dee96d91e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7341
X-Proofpoint-GUID: oDpF9f67rtiIcZOCI1sCxOK4W92YUkyT
X-Proofpoint-ORIG-GUID: oDpF9f67rtiIcZOCI1sCxOK4W92YUkyT
X-Authority-Analysis: v=2.4 cv=dLWWXuZb c=1 sm=1 tr=0 ts=6a633d17 cx=c_pps
 a=9z8yexD6E2gW5LInT/Y/IQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=awo6gdX1Wv1SqJAOH5YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfXxURmZCO7pMEd
 5/IOMkHOkuqsVShfFNvVjqB0aM12GOhO/ANwVQCYgZKcdIzMH4lj+z3glBuAl5b7X7epMk0gCu3
 +eX+YCWH8MQRi1UcdrTZaTiRjVvI/mxZr9F+TRfbfOL59bmdw/cKVyBH/0FqtS2iOyD4fGQ/+/T
 e9QrGW1Kbjush1QTcEUu94QaW/iPhUbMKaBMmM90yHt/jI30zfqAMXc3+RPDHQX5V5K6Vce/PvH
 4EZs4uzGaXNJvwyQwQ/Nu1xCNJFg00dIPS7kHCp226KhnW/Po2v6nHFcyorXYmwl2TOiO/ytTlC
 P/cwEuqxr+xziobfGoDIW0gTp6MQlGHNOJDDp2cct7ro5wuF9QLb8vVDTnTCMXN5UjO5SCCXfxn
 E6YGr/QN92QC980xNzdIUGQAanKIL21KkQRz/Uvoym6yS9WJNdPw2QjsWdcWs/iTIhPVKL/SALv
 h5X1zz/RP7SanZfYZ5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX30CC5xElnDwS
 4VQBv648y3T6ev/+fxpR9khiyqULf14CpdsL4JchudUhAk6O5y44tE6DQtwz4RGmsGNgM9/ds1a
 nxBcn1AUhzM6ifPbMVf9BEDwNrpSudk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

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
index d7c148ad694f9..dec4c2ed24e04 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2011,9 +2011,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
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

