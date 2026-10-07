Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20048E0FD;
	Wed,  7 Oct 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369125; cv=fail; b=mxoz5r5kd/C2cQ/7Ro4j7pnUyMgwN3Ka+cvPfiqFrURlC0Ds25fMOICr10B/c7ndnKonXlZ6bjg64Azj93rv/2sGcOyUNtrVsvSksPUh4jS4YKFI0lxQgVSiUtoaR9cA/Ayvfj2t5g+YH8dcJh0ric183klmV12nyHTE8i+Xyzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369125; c=relaxed/simple;
	bh=+UeEGrlWbdi+Oktf8JfMZ9QRNkPpkzIMKCp5w0fO8h8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWRB0wZg6UZA3KQIki7Boie4cO0O7C7KPpMZlHvp2qlSQ/PTLYW8KzQ+GhkScEnclkQhZ7FEGji83A30Gbsx4EWocgoLGxNxnJd54F2YymbOwgDW6nZeXFL+CBrPSw4g2Mu5TjYkkHtq8UEGIq8OJW+2/jeSwEADjbo0HY/v8U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZQMKlBQ7; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=XiKfmcUe; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZQMKlBQ7";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="XiKfmcUe"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977ji88557662;
	Wed, 7 Oct 2026 05:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FVlJ8IsIXkrdbOk7VTO7wi9f84fr51M2YkLD7xdx5
	IQ=; b=ZQMKlBQ7c+RWWQczwcOsxgTVHRsRmBENdkstOaoaYxP37k2tES90kqhOF
	vBUQZ6sCv5FmE/nBDSc8t+yxnpihXqjGyIyX7VMv3vvGx7IAtOO1TKXONSySqXN3
	kBaUPxjlBwGHDS8/u4n8Pfw3cSAAYg2RYHZ9D8oQHe9Ryt5mk/AZk5VLWK1POGLb
	lsFwbTu0R3DhGfEmJZZbymxQjnjrJQRl6DbMeItonXda1mFkN+jSvWZiLKdVekf+
	/vGnoVtI5jIfbyphQhYp3SgID7BFos5+lB5dR9jy19BhLPpbSgbOXa2j93chkfn2
	piZWyFzLvVZu+moj2nTsIJS+F2pkw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011066.outbound.protection.outlook.com [52.101.57.66])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h54a6w2c0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhsHb5CHXu+gEeImYgQ00tz1ggP15rIwntEHrdv1i3XeaRrbs3l4jYDRg0XelsfD0qpU5l0ZRo+xF+al4nlhlhsAuLgw85yWGt5f/msjoCcF33b5L8vzc7iIS/zR83Oe1q2WpDve5ckwYZ8aq8b8/JKT8VWb1++XSGwRRw4cHTFZXqxO0ApuBtfxfiAXT2FGTpzcsyVFlEU6v3KTwFq8vjpcs4zvOHqnWOoTCf0eP/ySE/bRVsTV6h+UffpzHAOuh2JBQwRXxDsGaYz9Q2J/AgvHROomgOavHQ0RohEYqOjhlab5+207TCuvoSkDKQkdBvaRI7YsHVQthD3n4bt2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVlJ8IsIXkrdbOk7VTO7wi9f84fr51M2YkLD7xdx5IQ=;
 b=TUA3hEpjAzogVDTO1VNEpCMpfTWMCybdeBBIm/CK5T8bJ22+2UIB7kjgdQMeMNAZ9w0EdsSH9iKs4ljuDYq9phxdFPrR6aEAA+7LmuFluijLP9pPZmyeBYsSHU1qFuSrbBAkyeLBl376j5903B8j/zPK1qMmIjZJc5Kd+sKhysXpcDnh6uw8+goDgSW464FunD0/75IDJWsb701lHHihsBGaMtyiPlOeHAkc4rLBSPNgK9CNb405NLM08u94mpPTSPEqTT4PN3sQtdoIvkl+QUFblaMcw6O2WDS8BbeWAxL4KPc+1np0ulxLoTGkXmkYtiEYdfFz7wK6sFTHk7KSkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVlJ8IsIXkrdbOk7VTO7wi9f84fr51M2YkLD7xdx5IQ=;
 b=XiKfmcUe+br8gLZo1Ml10QEXk2ZHfeGhO7hF/CWYt0QGSNCQUwgmVNi34vRcIhx/rGuKfKdkXCxO4qOfzg52ctFDV0Fhb9j/MVgaPisK78TJlAXTlERVrZ9pViluZQDJkb+Xx2PR2J01nYLZPTK6jqQjcM60faqPifvVd6EZWdw=
Received: from CY8PR11CA0013.namprd11.prod.outlook.com (2603:10b6:930:48::14)
 by IA1PR10MB6710.namprd10.prod.outlook.com (2603:10b6:208:419::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 7 Oct 2026
 10:31:14 +0000
Received: from CY8PEPF00000050.namprd05.prod.outlook.com
 (2603:10b6:930:48:cafe::ae) by CY8PR11CA0013.outlook.office365.com
 (2603:10b6:930:48::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:31:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000050.mail.protection.outlook.com (10.167.247.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:14 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:59 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:59 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSx013473;
	Wed, 7 Oct 2026 05:30:55 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 15/20] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Wed, 7 Oct 2026 15:58:56 +0530
Message-ID: <20261007102936.2402427-16-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000050:EE_|IA1PR10MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f7ad9f-10a9-450f-bb38-08df245e1d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|36860700016|376014|22082099003|6133799003|18002099003|13003099007|3023799007|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	rMZOZpQP3/RZe0BA4z3GYmJWNbkT/E8sLOKz6NV1CRav7fe4v6iIwpDm5xi7QdoiQRomKmN5cl+Ho1OjpNhFm0dl4l27XJS4EEx/wuoepayKYnLYNUzEC2xWsXmNhn17PX7TWRGXxu0P4+KL/vjRp6hcZOLYjj6uM4eoht0ci/55FlQa+Egxx2JVG9og34pwMk28hr/KO8ol3OGCIQefbDCoCj5BCRZuR6abiUQZm1o+ADgtD+qO0/8PlS0TLL+Tv6hfc+wReOeNTHNqQ6SrJi03dBUX5kgs5QPuv6ABy0F/yKiDscjWRC+wRRQRuQIMfaHX4ScVEBgPCuvFnEcRlwEgM6xxiwcxBLC25kKYh1vbtQeSfiRab+Iz459CvVUx2lC2/u3aoJXoqjpcA66x7hNzK+cVg2Nqz8JN9xbnKmWSs8EOkEV17JHEgBjo3nCyNqaVV0QQTbGVrB8PWZ8nfmoEUwFOTzjyYJIvdzwln8aAFh3xzsbEAm1Ip4mmAgjqHtHViY1Ea90xiMklQZ6Hd1xkXDown+zwMKhO+G3YeJxJt9Yk/CLoJEhJ+JyM80k7QPFop6TXlgJGkXMORFvj1oN2E8u4KdSoOqkBeN/WZTXoeZK9lg/hreUzyFDeyFHc/0mzONgXlf7jewUPq54HXylh4RB1zSlWpOO7u0aVBureRjk5A4nT8sdVNr4MZ+Zm
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(36860700016)(376014)(22082099003)(6133799003)(18002099003)(13003099007)(3023799007)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7CK3yHpdJKhyMwEJY2DXLmyTcF6O+Wgfy0ovOxh+pq83PKBQ0nPUEIGxypWKl3VXsbOnxvky2FtSIOMNOOeojsL4Q7h/PLS7kK9/JyjoQOdvG7RKiG/gga0aHaJ/paJSssIMLGp07ki3hwNvIhmjWFnEEAARwU3MMoLbFh5YidH6jco/7RW4JrjLkb0B1Duk4tTfbGMWm/ZyggghCG9w0i1Hg3adZ8EpSTClnu2jBDhWEmNqL3p8qrI9vYWV7E4BBB4AVrO1dKr70QXGUf/ImR40L2c/Luela/Z9TAHMDC6lrPrVUsaui8Oe8jTzPQvNhmTTLmJ489j3eZBJSKE4yRDEqlHLFNTLetidXX0/uOrwq6swfVBLf8jzbf0e0X6HWK0k1CyZPWVPEoy72RAnWAniLYgfLIqw3gInoIDaSA8apC1XR03F9HjvTbbiu7x7
X-Exchange-RoutingPolicyChecked:
	VvvHPr+oafXViPapI3ADD0sF7h50rD33TJj2MTJZDtqxi/YTafG/Mv9/ccH0bmWlR2ho8pt4L9c1Z4+8MlJCvwvkrkXW4HQnU3fK9P95HaFsa5kpzDOfzN8P8TGK3ZNonIDYz9YFuTbQHYnn7FHGrHIbSM6JPZ9vzpejKx8q7jJ/bKrx4KwhZFujuRakh6GQm3UTRSQCPTNpBT6qAqIGYRXXvkZaOqJqWdxj12jsx77EYg6NpXa8RL/PNy4PqvEzolRG+/DAFjW+d2hQdze0reg5uPUo1sK7Z8HmCuba7GHvR37IQTRFgMYWeAKr55KwmklkEklaOdfkz6El4XtLgg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:14.2857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f7ad9f-10a9-450f-bb38-08df245e1d1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000050.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6710
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX1AmhCiXZYa16
 hz+yiyndn+t3IAHM6OC04AOg7h8c2ZpM7Y8q8Sf5lwdfpSkYPKbvC2zsmCFPstMnmC120xhfSdb
 /+qwbZwHyhDrdtBOitOVbi18joIj1+xNw+R6QK4cqsHYbz6rr8L6/IKsEkQ1e9H5m4zpAI90RFB
 ozT8DOArk0+nZYA+Yu2FjRf6dtGJF74LyOJAGb3eOHnm8AKsbVp1MvrzCBxXQiLHNJU+yglKuim
 eeiuLRQ4UcZqu+/7Im8nQ0Z2Kl+sznElE0aeHX/g26ythto7EI6/PyuD5ZBAOD8v+evp3Uw5OhA
 p5t3ZwhiulP0yS50usr59rJ/Yf47midkx64cwJSy05G3tJlM2/kGe4pWRw2UGoI6bqQp6fT8808
 gvQQzFHg8uZTQObYtL3GfBKd+KDMVZipEFPFPbIXyrfc+6KQrlyVXMauEtpefexcAFAOekCyMRG
 8oXUYOQIx34hgt0yP9A==
X-Proofpoint-ORIG-GUID: 2HPho_YC2K8cZjKk4XQckNzXq9us4IVp
X-Authority-Analysis: v=2.4 cv=U88Hnuru c=1 sm=1 tr=0 ts=6ac61f7d cx=c_pps
 a=YlXwlwCmDr4vNaLG4mezpw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8
 a=tgGeiVbHXLEZap8J-VEA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 2HPho_YC2K8cZjKk4XQckNzXq9us4IVp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX88dctcv5+J+L
 CsmnLIOLWEgPbdOBIVO28KZ7+sVuMWUshHFPRjiB31bOjLbttxGVEtYAYRVvaPg/t4H0ZtpHOQ7
 8vjvBgL1pUWPK7qWsdOcP7f9OFoZPUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.55.0

