Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DC370D69;
	Mon, 28 Sep 2026 02:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564385; cv=fail; b=mQjOj3Q9utBelk40ge+MZHBmwMBnffd/VtmRPfvvybwLylVusZ3P8EBkwZ2fV4PMumzSr0d9nypu606O2i6huj81O3m5+6hjXLfSOCGzhJCVY1XMGDDsvjhgltLAnINuBIScOoUWEe9dc0nCrI8r7JQYSZJZapV66sGHPu/z+Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564385; c=relaxed/simple;
	bh=hfx9tyedLuwQpWQzmyhpCVk7zXwPKahSmmir+wIDops=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TL/qR57wX9GykVtijkL0H5VmaLkz9AVU31iZR7VUtcOfXAKMUkQU6g8mcexL45c3EVeGH+A9jtPAmSVmUHHvTqyhpy69/BQRLSRx6lSeynHzDK9Kn4669RBzqqGQjM7D7rOV13HDFuhltvLkQKZYZ2lR0dFrIBqirsQThxxQPF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KGtxZYJt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B4i+WxJ9; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KGtxZYJt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B4i+WxJ9"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLD7Jp2806166;
	Sun, 27 Sep 2026 21:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RB
	zE=; b=KGtxZYJtRYZ2Uf/+tDys44HcSq5gk2A2dGsGtvvX6e2Jj3naBqcAM82LP
	8kdSo0DNalROxjxvGD55Ka/MXanYGS65kPE8pr+cccNbhGIuCUvi0Ug4gjNRCfO2
	MDcuoBCrK4AltXrINikB4xvl1j+IHX8qIyuk84iHb8AW5t1c/9FFQyAVwcC/6Zgh
	mas+iCSzY2BINKDy2V5SNEK8/PB85f88BW1uDrxnPoqx53ETVdXJYEUZ/NefMRmW
	CLrREs/dFp8QUcM0Z65Hm7nCHu0Fo2jJzrKHRBURu+WbTbjz2J8od5lL/sR8RvrT
	4ZECKQNScoSfozWsgiuUnLAWYQzzw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010023.outbound.protection.outlook.com [52.101.193.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kfsu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1+CpSwg1+4m89Zc6N8of4mJxV3FNfRaAE94n7yjpj8NQ2lieeDcK/IFafJJpt0sjaPcLNZ8v9163tXjcXPvPr+/tQqWo4d/AwrKav2h9lJDocsOkeGGDnbtAaAOApg5809bG7+Kdd8jpsGMTrgKRzhNVoqbJ/m764uRnp28carIFjwPqQPi5XxCxFAmHxyoBvB6tk9HRj1wmtP8SSfnATOTCssiV63uODNj84ZGMv6+hTSTzrv/lYc8QvtIcLFT/J90qdEeithgvoyKLB575zw8VtP7zu5BwgXgrC23CUMGEAkh4MKvfnFAc6VrCQfmw5g0lG9pniIRtzOGaeidCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RBzE=;
 b=hG2FLPh1XGEu5L/KlnetlPUuFkqKxRVul8hX5OnnydhfdiTkBjFjLR32uXEaPFQlFkdS3cylyB467wNdRxu+YAO6VBDx14CT6tBAfVPSES4jphjGcmZQQ6LK8h5CWKWzg1vSnOGa1qLNGHbArn2f8EP/qpydAOmA8lAkihxbtRTIgugxvhFDSV0OuDwp8r827DJ2Dgn/2O4GAPnJqd0FX8xN7XxURFR+T9RNqOCxNyLaTA9M27NliiI6Pk18ZfrgalDYbd1Lgni8rKY9dzwMM6d67KfOVBZ/Nq8+r8AI662k1Smf5JlyJlX+bF7CZCBkYWFcjhRug2dBWNnm1lD8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWMlIJVgWFG1s20YaWxHB9JpHlwzpEvZrR2JSB+RBzE=;
 b=B4i+WxJ9FcqHd0iaX7cC5TQr77PmZegwvpgnzb+acRK+M9ud4elHUqvF34YXU7cOjAtbuOa+LMQOkhcCz6tZ2BoX1gu95LYnBYBnC3Y4JK/g3Sw5FLKrnb8lnoSGbdV5vWDGxOQSIuG46ZqcE8epD1K2MN/izqzZH5QfH3+kIeI=
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by CH3PR10MB6904.namprd10.prod.outlook.com (2603:10b6:610:145::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 02:59:31 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::60) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Mon, 28
 Sep 2026 02:59:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:59:30 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:04 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:59:04 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqL2256662;
	Sun, 27 Sep 2026 21:58:59 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Mon, 28 Sep 2026 08:26:20 +0530
Message-ID: <20260928025749.1055383-15-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928025749.1055383-1-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CH3PR10MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: eec7329d-45d8-4192-0b25-08df1d0c8478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|921020|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	tu9PSKftq3kXxvnMSSGnk1h2d0eqlgOnD8lsODGbPgo7asVzy3rWZTiEriuwbDEWqYZGywkz3usAG++t0SUNE8yNe70EkcvLIWctjR3rIaCjmz2Su4hmTRKEfurRJWR+c2hTwbPce9ROCVn+X9Vnyvo/cgHaT6QQGia+a6Q/SHn4aNSNQ9n4opyR8gx10wFBy+89Y8yx3fdOvTWBmPhD5rZFgTe1wHMen8/JyQmgwWjMvjcMnr1s0Tn8d+0PGcRvqdcnUfYVNkX3q3g/3NZkn9Vie7sx6AZMH7gUM4jo5PEMD93to2/pafs73QBzgIvyrjquP/WBKNQivyNV6VV9rqHzUQ/nxRVDOVHyzzE0c+fckAvzE4JtpVwdhYJ4p9rXKtGpUs/T3mQtXQAfZs3IpIPaq7bHOSIlrDk3k+XZwugU3uQfJr0XRGpiElniyOrZax2EC9LK9OnGnl+DDbq2TpWOGVKoM8nKTPT1b1NteTKQvinyHINeQqbHavlKHpiHcM/lH8R4P3DmExz9GQxTjyqi3zU8nVEa4rkGCYNZRvdj4Zw8YaexA36JKo/ucfNor59i6hADjhxvJsuDANbGTYWBLx1b0qRplydaG5L5V3rALhlY2gLZhUabfDVR61vM1eAoOheFToCWG2+H90n3LI50z+TIdtb5AdkpkfYLER8VoKp8Dx46fsDjjnri9ewA
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(921020)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2LuWXxWyaTgy9DPGyAlU+dOpD3l1b+gG8WI21p4eiX2AbkV0mj+R1klqlqgBYtKetbwTBqYHKEquAgePKt7TCXZ7JoRsLkgLcl7mECqhBGYtqJUVEEnlYSFfJXzll+cEsLCvr4i2c2KeRK6OUgWS2FCVSqQnlnU7ZPtSQCSaayp7iqeAp/IYxM7a5gGc4Xbe7PFF+WcLLDVuADs74YIvnN8NeOoNrDpCU+1LH8er4K1MVoYbo7MW1P/kbYqvlDyWlY8JHle9nm4oY1S0tzvUca6q89QYX1olH4Acc0lmn12D5SswYVfSLEQ6ttY77I53RUd0QfrAVFQ4Gzl0TWJjcvxq3OTo6OVnTgfsbcXEpUBD0Re0zfznMjShVv59YinDzmcsjiqXtrNWVdkiWEeF77P5m2BQH5hn9QZ3iUMIcD7iDDxH9iiU8T0df0n1xGWG
X-Exchange-RoutingPolicyChecked:
	gdpjHaIhhCEboYfGV6+HyQXIH8dm48vIWA4bhkV4SQiMlnYRERVuvh1NXKJr978UcsfLjzLCseU6rIogjeB5wqJhUFkgL/n1Tljh2kZ2shtXEECq4fPCvDQ7mBNc7AyIHHNrwlWZ902Gtw9HOF6ZyOkcmJoV8dg0TbAGXmf0Y8DWI7sF/1GyHRPpQMHZUOxAJ8s1mVXiQPk7DgVsRtX3owBCnXBOQcXGOzC7O3V0pTB5r4o17lCHJqyOIaM3244wrvogyvFm6FoSceziQPbALXQHgMNU0IENEf1XXbtNSC/R+n51d4EgREgZHKljftHdhPGMJhMnzglEbu37vV7vnA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:59:30.7932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eec7329d-45d8-4192-0b25-08df1d0c8478
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6904
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9d816 cx=c_pps
 a=ubRrNrA1i3DLWGMHTGxaeQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=3biYmkHrlXwTjyWc3LcA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfXy5GxwZqVSQ3l
 KMEWCRPQNRMJN/GDsvhcdLTvD26Ei1VxeLtU/3EUjwl0IdyZ1PPuDsv369H5y4HA/sjsrTkTLY3
 lN6z9yIq8TVx95lje4/hZUJxS7geuiw+Rovf73d3xel+V3WQOJwHhMgMOduruZpW2gcElsdOkfe
 yro2Lp+vqNXJLTdT/Q4mqk9k4GThUSgDq50adxuAiS5Tm371hq7gI8sWX3Mi8lL0XMCT9/dOqa6
 +XGukTt8j8H7Id8hfyv0xloLxS9GTMor4O1BdnAeocUaSHZStP0qm7MSbKUU+SwELyPyWPPJWgf
 sbp7CDvtZra0nv4/T3Uo7XMaQGD9iaWKuDX4CqszV5xA/BJpCAsITEgJumaIkJFG8DcookO39x8
 cDSatiK8G7TEvMRERIWtXdstDr31Drwzinj0QkgXzZYjBpmv8EHJ+lBw06udasUKIfw3mw9H1TW
 3ghxgmvLWnjB/cg5X/g==
X-Proofpoint-ORIG-GUID: 2KA_KFw-dH2PQRDREmI2Lk2tBK7Zt49r
X-Proofpoint-GUID: 2KA_KFw-dH2PQRDREmI2Lk2tBK7Zt49r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX6IMvoH+dO9PR
 XaFU1QsLw2EIgGdUoZZv3Q+Xnrrm3CVXYdKVVDtM4grgshfNyPW5GapoPxbM65imoZkl3wxDCKY
 5FeEhqzGBMx4PXJ2GIUp1NGkTTPrYpY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

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

