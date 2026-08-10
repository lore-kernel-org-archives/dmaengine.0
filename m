Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090940B398;
	Mon, 10 Aug 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374952; cv=fail; b=YE6d/flQ45NunS/YsT9RMwGG1U5de6xsDRkyhbx9ScN44kFLXNvS+q8zrFMa4HNbIzdqe3XDLq3qYUN9n+BnXC9I6gSvo0su7Kzzdy2wuOgasPJgLBAuN2+podgwOv5V52wnO4xUwNEWfBp/v4eVL6Iolb67+sLJiTZpzCRKJtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374952; c=relaxed/simple;
	bh=hfx9tyedLuwQpWQzmyhpCVk7zXwPKahSmmir+wIDops=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CvuUAt9sw8n/9dOaRyKX9/evrLwhh8TuyDo/CNnTT7MuChFw4UdHO4YFqgN3qmgm42UtwPMacAnrbnCoIAEuuib16i3oFxgyQ+UeoJ35IkywcaGPSLUIGLuFE8zhj+7/oZd39zT84jPyx7PYUJoi5MZpO4ZtuKGkmT8xplpB6vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cuWrx9fF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CdIAmsYi; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cuWrx9fF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CdIAmsYi"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUbVd3239437;
	Mon, 10 Aug 2026 10:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RB
	zE=; b=cuWrx9fF+QspGAxTckHrE2u8gijidp7y0T58Hh2a4xpr1M4xw9qMATnPu
	dyohdv/9LcTbzYxYVXOcx8MnlSGu8DL6q9eR1I5rMxLkzn6cwnrGSaH6p6vecRlD
	bH7Bmk2qec6ElUcXx8VEQtuW5dFqIT0KGrF6ezH65KCtiYvUJxdR2iEmW7ANhVng
	mY9dve3xa3eDQJVqNeB04mwNgMHC/UZzifGnpp8GYnomxGzoi8jdlAdajGEZ565D
	9H3Q/WjYpKakCVBmjnNNfMd7JntcbqYqPtQ2oNSkS3vtuRKn5zd/XHPGMmMtoQof
	nzwAjX4RnK6bVs3r7Rn9K2EfbB1gw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fxku6fp4e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSqe/ERqQD1M3oIaheXiJqu9Dhw9rnXgxZkhpZuycSzF/vhECwLhAW3WHFpYtPE7v16QwEU77I/6McmA4SgzOscLLOZfI09ICOox31N8SIdjgIHCv2NGaR64jgUw3tJiFpXviALHcu0cu06h7IdPK+j24puBHn8siA2ZSHS3+hwvA9inxxgFlx24ptORY59Yyg2CAoGGt0GhnLXak/RLmGvCKDxQ5dg3ka0FT0ClvViOyFzh7jbqC2YM+0wDRCQ0VDkckKozc3IUiAGT9aBp7MK1NH8aR1x1Saz83yOgoyFVSRaZP6lknBHe9DGc52uzZI46FpArfmjiFJNP0+HXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RBzE=;
 b=gAavdnCe489AMy6KTfvdnTiv+BQQErpv0n0VmG+hRSJZnMZheOiIHWEDPhYzD+ZFauZ9UQfxN7UixMtV/Z5DrED09Nfb7mfLoW6FzPzZP9a6fdDBpSkNpaOuyRItTNs1seU+SIp5xgC2ZJ7/uPmV3hr0QR/LifSJDU/YfuoS52Y1MDqDdR9eWHhVHMAR6xr7CjcjQZZDi6SQvaaHdP2r6ibm3sKSsgynald/GCYD+oZNkQetvH6Chd9/vlqNZ8C62PUR1+Xm00RGCJ9XlWmDjZ2eIAuQZ+1nQSUIklCYRotvhhABpu5LVxYRBaACUkEhA37rXT1OJlJ3nejV3+1jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RBzE=;
 b=CdIAmsYiiaX0qOmKCfEXTpvRPe8Di2mE+beT1tGYE0OoX7D5a15Lf+J9jt8FE7G7UFYLc5drgfatrx9CTgULHNyPfpIy6opp7J/T3BXjTZTzSoPDP3zyv6G+wThQTkMwMYhdFY9izvtr1wv10tnVSnY2mnSxd5i5e4/+njlOU7Q=
Received: from MW4PR04CA0270.namprd04.prod.outlook.com (2603:10b6:303:88::35)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:37 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:88:cafe::9b) by MW4PR04CA0270.outlook.office365.com
 (2603:10b6:303:88::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:37 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:35 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:34 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW92648613;
	Mon, 10 Aug 2026 10:15:30 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Mon, 10 Aug 2026 20:44:08 +0530
Message-ID: <20260810151423.1948224-15-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: e95d1de7-fbd0-42ae-6885-08def6f23b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|13003099007|22082099003|18002099003|921020|10067099003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aXUyqXBGl2eT4ivU89ykLCX/T3zv+bLi8X/N9yUp8GtaAZ67+zx8RxMCbLt7+Fx/9+RfqxxDQL6luXDHWr2fi2pCaAh1iw86jqLLiGaC2qYWtXM9eBm3XQOJxd80t1CuFl2ZwvhZtnEaGFY2CV+TiAcZhAGP+rHjbE58QsS7PwQDxNXhbCbf9QWwck4Viy+aJ4xf6oDaociF0/6h3+CvZxAmSV22ZGMhIcnIS1kJhThGyrpfYUy/Poh98oJyvOxN1zLUS5x2P303P80NP4ma2AzqAarLpriKrjgBdlO9ebSOWjVNTq6/ATxfZhzujdhmINf4HBUcH6/HvGxjvlS11cwTrK4VmbiT6PCOfhHKOojYDS662Ju4PJatur6g6K+rvZOHUHJkzrhEjPazCgEgstYDMA9wBiOyCH2K2JmSl4AKs0JfFB/ZjctliXILWbrxRQ6nqvhhwx3pBYXUGuKgg89BgYZRhC8ME6q055Tpogc5tSUI3H1qVJOBsHwe23SWNIEW3UEQvLvZwbNXjmvKaSTRqS2AxBIZOmVI21o4KG4OXJBAe9z55z87Tews47A4aX5kPGf0g2mN2g6irA1xR/n40vvhOi5RX1Id1jXPJZ1sY2sV9+3gufsRPmA1r5hHUIO2bcjvifiiBDHKT+V3CbIrjGNejwu1bN9r1Xayk8P7EAgiSufbRUZa2Uj9qBpZXuBmumBBmHysmc7sZ48R/ClqaC4rnmvlJl6cljTJ1r7JiFoQZauE/RnMtgACsfZT
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(13003099007)(22082099003)(18002099003)(921020)(10067099003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ns9RNaGLDuHGIhShVtTR/NhMEEnwHfXy3zAd2IiYGFWAUP+xHEVECQJimRr2MfcSeqbBbNf7vmHbMhG2Km2gasjTqy+lIs4pxQojRsb8ZUnh7yUfkfoU8R6LykaRdVH4EaF/5faeeLbr4/A2kO9SiIb116Naloa+SeAJfMbsWyB0bhSsjqZ1Qxiyi4c7ZXOiAP8owsNbkLyZyKy21IrGDmLJPJhHPOjMPNtWnHpyeGm2XEqRHpbg1ijcE/mhRWYpUcDv87lhm6SoyPFQ2+BIiesU4I73Wclx1IkWoDi2wFB5VFK7CsR18Bi7RK3ZWE99XDqQKzg9YynOpcqk0bied4VZGs831LqaVHBzNcNOTxlhJkbUuFc09P5zl3mbaMuKBX7gXE/ZS+V/WHjzn+r2v54+jGADG3FT9kvuStvjd5kgZ++8gLwddT3WutMeTOEW
X-Exchange-RoutingPolicyChecked:
	Q6eNrqhxsbbyWbfbWQHoE7KWc1TONsP/SrhIfpGOGpr9NXImQhP6dXWAxoZXIZQBvn3KyP8XHfwZewMW24pdjqg+nS6hzGz/ZFMzCnF/6iKxBeq96kAQILv/UIFx8MYXjCAR3KrkSVvkLBIZpLFhzCeLG2EcorbSzcGWA1AyJms97AoY4/YYPtsPANdTnPwe91yOfcBciqoRBT9m2IIWdujqkyvzzc2eebx0FHD/H/1k0ZUR1G0ybVA9T0dpQGRshz7R2oJ67b5tSyrL2Gbhl5tmOW+UcnU8pCkKvetsOtoX1AkV/nQD7FhswTtbKTVluioU+8eFoiiHp01u6E7wNg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:37.0741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e95d1de7-fbd0-42ae-6885-08def6f23b64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
X-Proofpoint-ORIG-GUID: A9_JwzUxCgyQGgqm8p5EB-XdghQXF0Hv
X-Authority-Analysis: v=2.4 cv=crCrVV4i c=1 sm=1 tr=0 ts=6a79eb1e cx=c_pps
 a=NvljgnbIoj+kJW4KAcm4xw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=3biYmkHrlXwTjyWc3LcA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfXyF3xrA/L15G4
 Iwu0pCmbi+WpHKrhd/gN9PS0XV2WoeaHqLqSke3uZ7nbSY92/xY4ljC+pbBUHmOUcw8DzxJhDlE
 gBkiwkbXtPRIqRr003Dz0NJ2wYVN3BE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX6W7CQP2hFp4K
 4Dh5z0aiqEIsJrEBH5eZGO8SI5E2T1DaBL9+UKKpAn+rVUOEEsM6+cR58Ut1OAZnh1eDd5okJEp
 4+zgp7OedgvY15dbHF3/IlAvcqGJGsmIuWXWzYHEaCV7rE6ramX+BQ9VdvO7Ikc+iEB/UmuuX2m
 s0fDqIQYRWvm38Z/Jw9Vq1w/09/7Jj9k2apjmdLGX7zyTFrE16P9yLE+2wbP0eljaY94odZ1Mp/
 KAm++WBrDtmZnZHnxdEq2HeTqYXUYVE1lmkYjUtDKcSVg6gTjv/ulc8Rgz8CATA8eFmoFJDKzGP
 szrJABAqFbPlN9Cg5V6/39qpn2I3OeydnsY2LTdMy75waCkSn3Wc1QusXBO7ETRuhFt/Apb1U+i
 YX1Wvc7t9RND/2aedIhxzB3tSOMtEQ==
X-Proofpoint-GUID: A9_JwzUxCgyQGgqm8p5EB-XdghQXF0Hv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100131

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

