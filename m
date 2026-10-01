Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA994C6513;
	Thu,  1 Oct 2026 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844184; cv=fail; b=jzr2PH/800d3yAGjXJ5qitoeWmjfU6fMyLrH/F8rQwIEL3pQZwYAyCRomSVDAqDHHADSv769s5eK/FB7gl0EVeWDbHKiznA/Wiplrw2wSNwhWldqx30JzovAbV53df4GLbZzE1XX5kO0z/g3GF8q+sffrCz5yg6W84hqew4iBAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844184; c=relaxed/simple;
	bh=f8TiMuVwsmH9X0/0l1o1kDhjDBahd9LgKoE96QtuZIY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qm4eWJMZtvQBPWE+lXWW0CLRGdWXZ396mrKhU1obL8kgSsWs/6kR1He0nkQcnfzcBIM5Tuy4iwdflQnXji/riAVUKkG+eub6HW2tERAd5m54gD0EywKknM5aHeVJi26eT/l3TQ7Ihih7qD9GvjdB+wLPoU/Troreo6yTzwh0J/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lo6eM+O1; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Y5L33wwJ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lo6eM+O1";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Y5L33wwJ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6918F1h01712712;
	Thu, 1 Oct 2026 03:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ETepvkEp6wjzVRAGlFgojbdmyxO/r4KjespW7wZj3
	n8=; b=lo6eM+O1732mKwD3hi8kxs2y3IeOge5xtBJW3ehHGjdt2VqlNc1Xf6PBv
	tQWbk9M+UT6fy/5e55tgvcwNLPitSLEaYVuC/KJOL1jQK/tUKRM1bVlfGxiBtSMu
	c8vAIuIkU/keVMpL8JiFBGc+XaVQDzBZ9iwwHi/Ik26jSgOgSYuKZHo4j9p0uLam
	xyWHTdh0Lo2nyGx67DsTTj2GoA+RvPlrETrNGFxn3v0USOKXX3PuZI5lR31s103d
	tSyF97yhTheHQOOjTZMXmHfBd8M2sJhYX2d3SAyImolF0wLYCNheMVWLIG6XcilZ
	wkLxGGqygtIGs/GbFKj+axmzhsPmg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h1kufr44j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yl0M9CUghq06swCOseZbgaBSAORdiNGD1ipnrd0KRwtdTpX6q46ZN3ncVHBo/wAk9ogwEg1l75rAhrIBP2isJanh6GCrzmJ/UFeOs7+H9DeobSEbLTJTHyxOCQ84YhikSIUK6qDdbvfNbHFIFMhiytfw4/OxYri8W9m5f66TGyu3PRI5xyplvvQgLnXmu/0JXJHTm0FBB7ixlhU9x8xtVsnxajO4vso1WRWct3+FM/17x6qiqqndn6BVQvU4ek8RbsOO4iXRFLmhTgWVuGJ02Ru9x0/zFy//Ao6bfd4gnB8N9Ao34uZCQfWRaUsDXx+inEsWtRTTgrmukf0VTk+D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETepvkEp6wjzVRAGlFgojbdmyxO/r4KjespW7wZj3n8=;
 b=i+HHzAGrza3aPzOz1/ed5poRL5uJPELjNhxmEfBkmxTBw6r69Imz6YeDGiPvG9jrrTETVqZN5KKnAsxY2zLbggwHXj/Lw1h1GQk4HuJKuHRynhWlj5a11KwlxzCTYBl0ZKzLtJ/hWQ0uU1ODkJ5elcoRkOBT/5cdDFUf2RluHZ3pJ6Z0nj/OKqJCehnTi7SYqG1Fwl090m0BpU01S8+oYnxCNz+TH2qbwPzsPz64aH9jgV/o4I7doUw1lA4wOgSq+Z/XkxGmanb/gvExa+gVKU/akBWwn1eDYPILlahJpYnAOCVxohqtmjwNNv4XgUs6UldrgH9d7nTlb99Wa5AKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETepvkEp6wjzVRAGlFgojbdmyxO/r4KjespW7wZj3n8=;
 b=Y5L33wwJDKV4GqPpGYUwN+yCQ+/XlVBw8fw+UZ9o4nXjW6siO379ZC3StGGOZyPleScL7YzhePTb9py5MCXje7ZduIxcpAQB9lEjyrocIb+EGn/iZOXL9KU9FIICfMsc/H9VLowNs5clE3b5XAaMlKPviJXsxorAMogm5oA0cmM=
Received: from MN0P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::23)
 by CH4PR10MB8100.namprd10.prod.outlook.com (2603:10b6:610:23b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:42:44 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::95) by MN0P223CA0022.outlook.office365.com
 (2603:10b6:208:52b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 08:42:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:42:44 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:14 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:14 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s4630551;
	Thu, 1 Oct 2026 03:42:10 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Thu, 1 Oct 2026 14:10:29 +0530
Message-ID: <20261001084105.1692228-14-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|CH4PR10MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd6f795-5f99-4539-dd10-08df1f97f67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|13003099007|22082099003|18002099003|921020|6133799003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	huBYscnT59/rh6R05Bcx3xcXKOnFLHm5pv9JMlw73dO8qdjjmijT04piPVOxjNZ8NwyVIbwoNKMiIooYgetjrvAF20c/OR+q6zHfC4Oj0ejMQfq+JnG3rOLso0HBMORfP1U6fiUxarpyX68reBmHGZFDmSAWJgwlJ0muuPPFFKWxP2vKrnX5KXcZcGQwskC3GkflMm/ckv7hmBBSlKsvCFCDJn/pkG5KJdbTPTF6C1ZPu9UdeIj9tlyR7cSX1pSU20Cg+LzDZfNVCoZlbwmXRiYZqGcuJDsUpZS1GRBSH0VJsTFyNV0KDC3jdaRdwKBGGCsiAT9e+LSQNRaBD+r73qhP4nfUoEIyI/dSfLwXa54/qgeT+kRf0BY+x+SFfFzMTMKjjXjyMip2/V2wHTn5dUFNwCpeqhJICYroswtNs+xpL8R3n2n/RO+KQAgTk3IhOJLDQ8XHhKiFIvUIVdKJBSkx2Zn1Qf/t0kHHdRWiDAQ/2971ZURD3aniAXZWCQTXwNXHf3DVyMUhKFRSiv4SYakbP2FBhneaiwnKInFl3LwN0DP/cfqdXztqINmunh3GtXuQzevM8PKZ5s2g4XjxCVPJdMAUd9ARWklZRjDCFbMS3Sg0J0yshwJP1s/6T6IMNYAWj5HAIQ59bIJBLIF49AmUuJoOfJiHoJzUQR40ga4lmq95GznTSVq5O4fQNc/o6DUHQlHUNYNHInAY5r7w3g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(22082099003)(18002099003)(921020)(6133799003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GBJQrmT6IHlXS/ZYENbRw81c3IJCodWO2z+4N2ri2NtmUULl1cSAqlSWyPI3m4UdjKm5CJQRantROVSctpa4Nr3ivEn2x0dFLQieo2uKEq1/5gTajbaR1T08aa7KAwy/o93dgIEjHWHSv7b1knzzIERm0tNWJSe16TjDt9XQ+0uvZPxi/PfsVNOeL66yekzqhTikeaNI/VyE5SU5p3h8rP0n+8VNrJjFlfPyLHE+V1GSHDAEky/DvKfxkHb7xYJzM+okYVWSzxGWOUbKE9/H1dUbzMfiZv4r4LtEwIVHvr5z4nNGCf+stGjgU04SzHrwZHIxj/xZ9Syjhn+ajPvu9pHP76B6NFQhKEqtu1Zt2VEz+GIxp1FzCPRgwnGrp8Y1AT9HIf6WVKZ7S4/m3XMJa2b5JbrIqO08QE/LcRBvYobPdXs0QiEnfM3R/aRuoxcM
X-Exchange-RoutingPolicyChecked:
	Xu97XMNkp7Gmmiexbh0PRJ8SXWsileXlvffY7fvhiCatjp8XaPinOshzyNDqk7FuQi0HXKOlMMYfcuAHtJbaJreObmbKhIp9qJLOSL/uXV+ZlQaFfeY7hgwp7VWYvp//0jY4KkLV3lfA8SRHUFfguaIvXrstBRTn+8bu7er8UNJ+AKa+jNHfkinKMkgym9Mx4HSm/a8IpAFojNbJKMz+CJ2kdStFVreO2/WRC+uAYmU64i2r5h+SJ3tsG0K05pSOtleTXMG3KGAs/gYsI04UcXr+OAnkCPA3hUSloNPpRK3AqsVr4Wh6jT5prXjz2hxrz2WBRh7Ch1xSdQZLpAcAwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:44.4590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd6f795-5f99-4539-dd10-08df1f97f67c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8100
X-Proofpoint-ORIG-GUID: FVc-hWgUeVv2EenNEvGsF-6s5yv6S0pK
X-Authority-Analysis: v=2.4 cv=I+Lw19gg c=1 sm=1 tr=0 ts=6abe1d07 cx=c_pps
 a=QD3RM0NeKQHimiaxCRpEvg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8
 a=6W6IBMoaatw3SABbmX8A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: FVc-hWgUeVv2EenNEvGsF-6s5yv6S0pK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXwvExrsH82wDh
 2vxzXRvXpIfCkA+o8Hx/VyUuB7v3pxXV5lkt8gmYtgOjoXUmbxSqHnR5T26z2L/ktTqx3nAYAxd
 abMaHOI2oUwuwX6413aja6fgQvb0Ucgt5+ORFH7kz5KzhZc79UxXnTh7pwnVRfrrUJwAhbAsHfn
 yTe2C/YVdeH35a3yW1sd7wGvgpw2jxUTaIhxekwvuQg7N0bVriVyZ1YkyhBAZJDTPZzib85yeH9
 OrpP7Xc7Kh4ppHuneoVnn4m8Soi88uQuW3lqPz6fjQEf9BdYs2uRe1b8te0dtJ69fFFeDfI+jZK
 6yJW6h5c9qX9C5MO2q2lVZfzCxFWRNJ7nnZ7r4IoffxUnE5Lu9pMpgWypfXhTZO2ooNg/pALA2U
 yA3Eu+VTu57FS8opffsd4J/5ULVB3DqNDyKH4DXgpFMjsvsRhbfyM0v0zLY5tuONCXwzu6x5zDN
 Q23Oalqc0EAfOaB95AA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX3afRwXJKKEMe
 jg1xIxg3OsfUXEQpqLPiI4b/ITGJqjgwpoGt/k1KlEzgcvN77FFbb5nrci8JyMVdob4RQxyAAL1
 +4pP4UPaV5t5DGKa1Qx/xkv+8+RCd7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.55.0

