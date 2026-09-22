Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21724F5DF0;
	Tue, 22 Sep 2026 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059915; cv=fail; b=WxC4zNW012MNXF/zlvsnuwHeqtcgd9QCGjUf/w198zahh70fnwu8c9rMS0T/Mysl7BFqsptWUJTp9D5j2WvHPEPiuEm3rtysS//1x8oCXyJ98nLvwNK9PNFFlD7MIXMwkVfeJbySD5qTfs/VE7CVo7VEMyWnCySv/lHUdnfNAww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059915; c=relaxed/simple;
	bh=hfx9tyedLuwQpWQzmyhpCVk7zXwPKahSmmir+wIDops=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duDoR4xI5OKZ13yCwcZSY8pOQhaSUkz0oKUbc0f+i5kQrYfIfyOL0Nrt7HQSqylmyAnqzw2qZWDE7QvhMRJBOhV4WwisUzrbxFLCT4r8KB2AhtBDsckCozPQwI3iopCeTO0x1T27FqYCkVI5fh2q9L9lPM2icxZc7gtYVdHclis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pdDsnxvb; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mg1lYx+j; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pdDsnxvb";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mg1lYx+j"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M5SuXP2149826;
	Tue, 22 Sep 2026 01:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RB
	zE=; b=pdDsnxvbGWGSEtyaQ/k7ctDQEd8r0Jq9v04RZ38prW8S+0HXcme+pF8/x
	nOCjzQzzITx3d9bsQZ0rd6kBkJvjWOeu9azFMH371Yba19OysJc5OQN9JcoXjEtG
	BsMeiA7tcrDycjEb3Txmr3IGvAe50CGBavgTRT9qOW5sgEmbI5d2WADLJ3pt13GX
	uxeTFrWhbjKac0aw3PCBpxiJczI+rJUQtT9slkQVfyqTUo5QFoqRhj/drJhcfzAP
	xqeOBuCsFwzPnYjeJ5fwIKKB/q9rNSswaMgg/lh8PlRBAmAv3GYdMxktGDN/hbe6
	IKI8D75N0bl4X3ufAElctIhpEcngQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gu9cq429u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:51:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTSoE6R902mVBzYN9uFAxs+UCrLvIzhs7BmJRdYQu0DiofcmB37ShK0JVS4GT1f+0VXBOPBruNNJlu2nKwz0BCKwbYgG/8ron31iUH6OkJ9UNY1wA6UwyV3DsFPvOARn1p5xkSesO/9bV9s/L4MPz2KDxrg1FtAVB1yuoGAkhxqav2egwyxwhuEOWcuy1idvjVWsqPTU0ByOyoIjvt50xYwjDeBgEqFWP0qRY6aaZ8flKOEl6BRLIu8ztypqd9vs22wNzpUrIEQgz3HXQh0PQcA6vNVSKKb2a6V2BpTnMpTPlOpQGfA2Au3F1cuYz6KsRtu5EOshFKSWxB6WhWLJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RBzE=;
 b=YE4QaTwNntpeOQl4XzTOs43Q+nc9Zh0RiknJqlijzot/e6KYWqqufI1ZLWCIUrc5/L0POthIeDqp+aE4GcfMHalOsKhjNf8Vw3RGk8G7PgXeqEHkq1PnywftTu6/ku80j7Cuoa99065iAdp4EHobfs8Snxsk5HLHxB6QWxCd0mF8ff7buVVnMFbL4kHqWrhXaA9N0CnU5bHaoAOMT8OhfkH5mQOQsCcPdR/E6MW+O6qxJxM8QHC9bcLAPhJdM/rx7NzTEFtpzur7p/v0B3NW1d61CWXZU+ehhGVXR5RZ41uVS6B19JZTSKxy1yDO6FtMVF07+mke8lsDz9lNWLm93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RBzE=;
 b=mg1lYx+jnqvGRZRE5BoUisii7yq6cfwKkmpIN3p5/ed7AZ/EwqJTnQ0mTD1bOzWhNJuKXmcx/HtKjc8jdBsjFUk4TqVZGw4objsVwRPBfuTnPOHzBpkSgOP1yzzz60LORhrXRdhgsC/MSbETRqN+Ende5As/tKtnOXtsCPg/gzM=
Received: from BYAPR21CA0008.namprd21.prod.outlook.com (2603:10b6:a03:114::18)
 by CH0PR10MB4987.namprd10.prod.outlook.com (2603:10b6:610:c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:51:21 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::ae) by BYAPR21CA0008.outlook.office365.com
 (2603:10b6:a03:114::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 06:51:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:51:18 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:32 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:32 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI463626771;
	Tue, 22 Sep 2026 01:50:27 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Tue, 22 Sep 2026 12:17:38 +0530
Message-ID: <20260922064902.2719979-15-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CH0PR10MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 5214f917-52dd-4a38-57d8-08df1875e7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|921020|6133799003|13003099007|18002099003|22082099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HLLqkbkunnYGjo81TNDnx7RDOlOv7pGH3eObd/DztnmU3MGLKA+YsD5/rWNx+AD0pPloO7zIbBly5QbWlMizAwkY3Q/Fn5FqvP9qWjJOUBBXzYRvaJGqM2Y+kMUslbOSgLb/JNeqWqCEilPPM+CinUyI4jMTMQKga9xBfPgYD1mWZAHL4QZ+4gbIWL919mS+gi4e1nm6yFOXxekezEfr4RZbwaxfzfi5uIwEXV0xkdJXwlmgujS+6ZMq+BZzs3RJF2CZaU6JWNVcN1vBr0NJ/sS9tbe+J4mxKJeirtf9isUxWJzLKNHlT4ZKH5CRHMLtYlGDz3pBAUo+TXR5MbR9CuAQZnWqwG9WDAgRtwJyZCNwYiV8/obxCaIAp6RbdzFfiZ9gMaBEJLdqmeBYbXJsC0KBXOYIQPOe48RWzuEbn5WvE5gq1flWIUrg0fzbZm7j485AEk3bXZSvJLkYAymOlLmbvphYZGdia1aO7SHH3YQYKWyU/7FaSVyKvgxHR93ntU5X91eAZ+qyjTGKgHJtRaggqeOlDdaF8T0ypzqjRjNoHPcjG2PX5ubvzCh+UeMM9GfBnPywbbaGHZdzyT0U/Tz9z7tLI0Beoiy2ClSb6Sxr2lsdJItj87yw/yoSYhrZzVF8iqhWHBZo33CNV3GFptrY9WR/X6HRh0+QenbRT0H7qvnbhG2T3vGddq6uI5vK
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(921020)(6133799003)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bVsZaYMRIZbcLFYRMHGzd6HTLhKBx3pT8DL2kk2c+V9w8/wsuGK6L96VDYW63foQqVNF9D/EQD3kyMDxQmiFReSHoi7W/G3+mC1vaJYNhwPB66m0NtofQOgeB+xgEvUtqvpiGN6pQulj0JuCyeQrMqH7taM3kWBh1BwZqn2N1o5JB/vxK8b5YuxeCp8MKidKxBCu80C5Vt+h8Dx3eLWlSxPfkf/SzW7JUHryigVjbikpcP1ecWZP54am5YDTxE6r/eYsMxNAN/i8Nf1NxnG60UI7nfwJS0bu5ck+f8aR+iyj7gkg1vjfrRSHZYDz0FopZRu6avQGZFtjdirdQoJAFoTI1W+3p6gGfWuXx+31XEKiWMw09wgHTJbZ2pClVesK1ZJnNBK6qU0kvqXbLAG+Ig2ZZdZgsX3+mOq36QDLHyFJBnXUyqo7x/scBSC9Ondr
X-Exchange-RoutingPolicyChecked:
	pL0YUKbrrLVpMRr9DCGbVcfJIm8JgLc+Q8YQ2crh//ahV1uaWH+saSsLsOHwgwjmwRsHWvEvFqFnNhZpNCnNYtDS4uhUhxVa8IxlLDa2s4LoISBDhiNlgU1ljRYfvRSDfBhBRjTOS9yidkKs/PYyVCvMPFf3kBBStG/tQqP89D7xqqJiVHVkmFdKcAkb39dQx9y+iAgOYA0wg4p+8VljC5vKxNn/Nl+ZjI2b0mpfB/FHXUWAwW/1LbgYL3jOODuVyLenCuxV35YaGiKUbTwrNOVY8UKINjfQMCA3oe1kwk3b43Mvp/LvBz9nm7hW0lcmLszKNOoyA+EoMDkhwTIWyQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:51:18.9093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5214f917-52dd-4a38-57d8-08df1875e7e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4987
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX110keRT3iT79
 lLpLwokSlGN7nGob41cA/SprTsM1pPdLUXz7fjox2gjgj+czsIz0jFvOWCsDlPXudi9NH5BlFEY
 NsK38gNzIgbWKCxzuzi+kSh6NAFqU5M=
X-Proofpoint-GUID: 3-R9zdBfDNwDV7kdBoERd2kNFDhWW6So
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXxq7cZWHtf8T3
 JYkJrtbeBE2fVY+7J+Fd08xGm3lcckfevDwMSJVEN6jCn099ixdYeZqv1R7OzK9Xy1rZlj1mhxi
 lDwaHmkoWW49o4e5CFtGyOOZLtYeIoP0Czl+IkGF+X/HCWeDmKa05KLGLQqqWni5lrZMKx49UEG
 dLUd3xPF6PRVrsJLKrFDYpWuEi1rNm5u9pVcnIlbWqRlf2YJZ79caun6EycsEcFKpmVJn/DhOlR
 qtU+a8lBoSrBbVfFRTCQZtSmx47MyZrvABVhAOuZniTUnJPq0BK/vhnZwnLWSMwoNV3RINvNOU1
 2vKnG5SvyU6AsSWayZOzWXGWE31FRN1jLXUK7zlIFdbehiDFxXTiYMTxFiyht23H9mo0jf9q35n
 drpLwJAqpN5eUKRyaiPwpHdNBP4uIdBb4DhdF8OlfEWTF4BLj7pYJM4gweTSljhtPo7lUztaN92
 vEdX/KtBBR8R6823W0w==
X-Proofpoint-ORIG-GUID: 3-R9zdBfDNwDV7kdBoERd2kNFDhWW6So
X-Authority-Analysis: v=2.4 cv=X+PHu2Te c=1 sm=1 tr=0 ts=6ab2256e cx=c_pps
 a=NooIwpZNnZK4GOBrdp331w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=3biYmkHrlXwTjyWc3LcA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
new file mode 100644
index 0000000000000..caeacd4cf5ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-pktdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control & Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Flow ID for the peripheral
+        This is the hardware flow index assigned to the peripheral. TX and RX
+        flow indices are mixed across the valid range. For XYMF peripherals
+        (SPI, CRC32) each chip-select/FIFO has a distinct flow ID; use the
+        flow ID for the specific direction and chip-select being requested.
+
+        Please refer to the device documentation for the flow map.
+
+      cell 2: ASEL value for the channel
+
+  interrupts:
+    maxItems: 78
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 78
+    maxItems: 78
+    items:
+      pattern: "^(t|r)x-([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|6[4-9]|7[0-9]|9[6-9]|10[0-9]|11[01])$"
+    description:
+      The name of the interrupt corresponding to the DMA flow.
+      TX flows use the "tx-" prefix, RX flows use the "rx-" prefix.
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
+    dma-controller@485c0000 {
+        compatible = "ti,am62l-dmss-pktdma";
+        reg = <0x485c0000 0x4000>,
+              <0x48900000 0x80000>,
+              <0x47200000 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+
+        #dma-cells = <2>;
+
+        interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "rx-0", "tx-1", "rx-2", "tx-3", "rx-4",
+                          "tx-5", "rx-6", "tx-7", "rx-8", "tx-9",
+                          "rx-10", "tx-11", "rx-12", "tx-13",
+                          "rx-16", "tx-17", "rx-18", "tx-19",
+                          "rx-20", "tx-21", "rx-22", "tx-23",
+                          "rx-24", "tx-25", "rx-26", "tx-27",
+                          "rx-28", "tx-29", "rx-30", "tx-31",
+                          "rx-32", "tx-33", "rx-34", "tx-35",
+                          "rx-36", "tx-37", "rx-38", "tx-39",
+                          "rx-40", "tx-41", "rx-42", "tx-43",
+                          "rx-44", "tx-45", "rx-46", "tx-47",
+                          "tx-64", "tx-65", "tx-66", "tx-67",
+                          "tx-68", "tx-69", "tx-70", "tx-71",
+                          "tx-72", "tx-73", "tx-74", "tx-75",
+                          "tx-76", "tx-77", "tx-78", "tx-79",
+                          "rx-96", "rx-97", "rx-98", "rx-99",
+                          "rx-100", "rx-101", "rx-102", "rx-103",
+                          "rx-104", "rx-105", "rx-106", "rx-107",
+                          "rx-108", "rx-109", "rx-110", "rx-111";
+    };
-- 
2.54.0

