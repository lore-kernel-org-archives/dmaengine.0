Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC836472F78;
	Wed,  7 Oct 2026 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369109; cv=fail; b=NQdmxG9cV6Yj4M7cskNgo3ETiSZqzw91536ChQtI0k6LBfNXkfQblXOGQoO1SXpBB45jOZtbE0R03RumG5c9x9Utwfd4NCTMK59S4MG2r4+2DCKhOQfQ9GUyENlZFxvorfNyXB5ELJoroyBWzlk2qNnI+IoNj/g8nBh5Uk2Ipq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369109; c=relaxed/simple;
	bh=f8TiMuVwsmH9X0/0l1o1kDhjDBahd9LgKoE96QtuZIY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMRLnrb1IF4qE7AUj7dwiXhaE7YuBlBxNjd4JHveRdMQB7n4iyHkkkUFvJkBcFvI0NCNm+dih6pGMIf0UQx0WItVXGexS58Isgarje56WQYFy0Juy3rleBuV93Rz4dhG2Kfx72NlDov9Y4eSU4wdpNgwhDP27zuWpXUzngMW8ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LxJZvggq; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=JXxLehZE; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LxJZvggq";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="JXxLehZE"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977ktOb226269;
	Wed, 7 Oct 2026 05:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ETepvkEp6wjzVRAGlFgojbdmyxO/r4KjespW7wZj3
	n8=; b=LxJZvggqBGaAMidSiL6snJS1S+RX+wpPGlRZ0/1/7bnAgxi7A7XAkLDeJ
	60Y5YJArv+dMZ+bydJhaZPNpooaAgxzB4of7oG/mSdOMe44I8muQfjQutHttgs/2
	9FIbazbJNHXzAZCBLp6u6sB5M0q03DjUdm0MK23GobHRDzrXQ6/tdHBO8Q7iOMhb
	fm+mBKyDY2bimznVJ4MEQ8tqmomixOi0cJn4ojFCZp5Hvw7jAGbygr0vPc6D2qKW
	TGUU4BIItQ+nLd5ZcT5hYYGB2xkHGWMhPAG51lPW2XSEg8r8oTbVscXriG3KibVk
	UrL0mVME27P2JynJ+wV1k4NHkqxpA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5na2hc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGovzQThVwXqntKWeBDl+TjKhb3mD/X4pC8kdjywkpmlobczg+29nSw9wcNfznbFqm/j3/CMPhGH5iZ9+5A0YiejR2ChvI7adxGxQ1QG4mifhIyVB2Kt9q72PZQ+6S60Qtsn+biC9nc5FSqLFjeJqmCPD5OWOGqAbloVo5X+BVm7j/x9LgUAG8jrxilJZn/u7gClwmdwVu9y0ahLKTuT0fR+6X9bZsa4mBBor4oniLdRjhACX9Kit7R3iK7RYPHTX3QW8v1tUgIWjqgErEK5xbyqXsLDEbRSPuq1HVmmajmR/BYNr8jtMPC4Ic1A8lrCFEhQw51LQ9vWIXk1N5n4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETepvkEp6wjzVRAGlFgojbdmyxO/r4KjespW7wZj3n8=;
 b=sBJmcsxKc2weNlNA5zatcSz4azbcR6XkCcuKs6lpKlRXq6IcPxUETPvks8i3cqHE2tGXL4Di7JgahaLgo8i0R9Cb9gsW9Jr9H+nrDQ9F8bjSB5Waw8WJGB0LTp1FLjU5dKe8i6PLcX/Di8B93qyTCUb2TcdFed46knglxsZgBjnkwAHSzX0qA96INmCY84VOeD/ekP7z2v7MzgUhyGpVj9YYoBpfTBaozTENF2Md4O6HwmnAJz34dHf1KF2hF+Z9Zym5zLgzteVA5xoCNtu8xrn3ahscHmEGNudM02yWpGUNCJYN+abptI01T1nX1UkqY7tGD/e3xYj3j0hjs2MgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETepvkEp6wjzVRAGlFgojbdmyxO/r4KjespW7wZj3n8=;
 b=JXxLehZEfq2jLidj5YyxFnr+CwFTxTUZiqGLfCOkc0HAtuoVIiF8GQf4BIYLAGpSzL5Z/Eez8VC2Y3pLqblREjQMLSRiwE3Mn1XRtkRL9CE4nGDPzugZtUVVnLvlohLeX9PQcSYRouWOfX4tHkLVeXuTURedNPtClKUMWvSyaDE=
Received: from CY8PR11CA0023.namprd11.prod.outlook.com (2603:10b6:930:48::17)
 by CH0PR10MB7534.namprd10.prod.outlook.com (2603:10b6:610:190::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 7 Oct
 2026 10:31:04 +0000
Received: from CY8PEPF00000050.namprd05.prod.outlook.com
 (2603:10b6:930:48:cafe::2) by CY8PR11CA0023.outlook.office365.com
 (2603:10b6:930:48::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:31:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000050.mail.protection.outlook.com (10.167.247.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:04 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:54 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:54 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSw013473;
	Wed, 7 Oct 2026 05:30:50 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 14/20] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Wed, 7 Oct 2026 15:58:55 +0530
Message-ID: <20261007102936.2402427-15-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000050:EE_|CH0PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 53648b28-89b1-479c-d214-08df245e1734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|36860700016|376014|10067099003|56012099006|3023799007|6133799003|921020|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CrwKzNI4+YTXdH9enuwUBIxX8nGeM2axwLhhcW4nYM2DT2OzVNwU2f37yMiRG7xdcktUaBYv8EHEYfOwrvNAKgfD5sB8TWP71MKNPAd2QUMvX3m+MVDuJVPFH0uB5X23ES2DDTHXVVYNeA0y8YrSdk2uZVxgT4GImIMNbvpKHwCgylkUO3VpQKh2AGUobRvRSHvZ3Znp2XxrCx3xEcWf/Feccxaii9V9h82B+8u3M0cLNH+XhGhux1jMlVAIhXI43rqpnIs0jN+k5eiaMACw976tdQ99sokcFrwTcqwtaijNe15NZlvA+yBBwspjul91XeVUXcoTDaFVjht9Rdj40lqKp34VaW3j9EcYmZeMZhgxoie0yVgD8KUd4pdqOy6VImGlDuSxAE6qmOcMVatYEnwQ1BlMWSq8MyiiELclbm2b9saELP+4oBRvO4NuD2vbjjqC5Jqkdmk30IK7KqEImZ7zZtUElCb8efZ8YrHPS/l9kOh+uf7RL+/DJnQqFFDQS9GQw46tZVaxo6M88QRfvn+0fF4Tu7zXKTCKfCn94Rde16bQ6IKaF018IwAN9HVLAEC0RwIoxd1L+AizUYuZuDbwN8kmiLw2y/zx7tXnN8pCN3tULwYQNex93+Ed2cGVtixfOpB0tjtjFmrTgavLiCp8gtGLyucsw3K+Zdq9ZB3g+hdRC0N/oU/acbMoC8Ae4RfwW9YiD0+YjnRAp60i4Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(36860700016)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(921020)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nohL/gm382G/ZVK4qBOGGUqVV+Yj63T3YZdctO7w6hQvtE8JAfJgrDUbDWo5uw81cRq/MzFYk0zOKWTI5fp2whEDJubLp5Uy2gUTyLwOltMKfoyTIyfLs7mON2p9Oi+0DoKYjqnMfMDlZR7yNLq/zrUaCj0e/Zslm9VvXvbDCZkULRsvwqnJ5P2agAZ7SVmHeuU8xydzt2WbttY7bbmyAfX4XdibIC7iJmvJMJYh+BC/2B93yChazsdEmIfNkPu/hp3Jo20Vu8CyAI2EWBcU/KiGy/OOqngNRMFdbjF7RMgoGSMhLbWQIf+ublYRTiyLA8Men2RGhQGXDuLG2RYBbnQih14pZcs7ct41OkQRZsW9OrB2pjhDZkAxTLOAWHmOIUoZSpJPOMGSJSsr+FYggfHhQVQ7z9BHcBcdM/EoOq8fvAarQaFEkmUFOs5MatY3
X-Exchange-RoutingPolicyChecked:
	QU4nKvfh64rSNdcSPDJciQ0OlZ4s7k4dx6BBfR//t/K2b8p6i7sjRuSDvbjKO2HX5kePBXWmqZ1gT9sy22u5DAzojBwVLIb1VodYGO1Cmr6lYXKdofP8CKYdXD8lMLaujTXmN9sKxEcHpZApMUZZO0qjQWV/UUrm0qeKKh5VJ39oUfDGNONFY6k2OiPVPOU5Q2dCvNXXuN7zzH8HJ4GdUC1nVhRtjeASkY9JQpctSm5aSHccfTubaweHekrLkxAdbRcvdQrf4bXugZzffmIQQ0wbiqqrO6mGNlcS2RMVq/ULjmLWA3eAmR6hY6iV4ni8Z3pTk7m9LVyoDX44KqDUCA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:04.3837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53648b28-89b1-479c-d214-08df245e1734
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000050.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7534
X-Proofpoint-ORIG-GUID: kM8bt8tspgEs5MvMCf7tlMgun3TAQpdi
X-Proofpoint-GUID: kM8bt8tspgEs5MvMCf7tlMgun3TAQpdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX6ZBOuho8YZa8
 6nE8YYl1vs6+sell+9sqf4HCEjKM/6tzhx1HFwttbne+eV2s4ykvxrD5ZrphtfgQNlSd1SSuZQP
 sAPJQ1eediKp33bv5JjxmhE5uhpPTGoPqg/zxwoj1pYeITjbxbPHDxEbc3XaCEWjj3Hr2bg3gG7
 Id3abm/2Qrls34d5P9hw5PD4vjwiMAJ7HNtB3W+IhItUAEJq9TmcWTTiqJhHs0t7xAqTEUr5jBo
 TakgjkA/q3Amx4GTll+1KI4kDX1dQhxcNx9bR7cGOg9dKcWmZo5s3evKTII1s9NMScWmOSJxIPR
 45NBSgbnw1I6UN9KhrIlpUj777TXzv6hK7RiLgodjGlvWEiJFXBxdcNW0reSyFGhhNX7N3QurV2
 /KwIW82Xk1W3PjXmbFTvmCVtpc8k/XW5qfSQMoqtBeqmOLzrtdSaUdJnb8AEzkeJ1yy7ZITkoIc
 gD2K2R2qBBYTbYuKY+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXwTfpsrIU0pG3
 cFL3RD+FCdrUAlm0rPmht4hA7DlHh9Q1h5dmKV8qE18vbTz8N8c9B9dGOqlaKHQR1eQ6Id+UlpQ
 Qyi5cqOVbisGRqgZqQ0xYX/rF2Wkm0Y=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac61f73 cx=c_pps
 a=PNGgPGJBypDwtINamOK0jA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8
 a=6W6IBMoaatw3SABbmX8A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

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

