Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66D4908A8;
	Wed,  7 Oct 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369169; cv=fail; b=YOaK+asWMmOGYbD3zs1k0C4z9K1jNjX1P2S4Nn8Solu6KZ6Tw6Qe8IvBhJr40jwEMIAmlXosP7wivJHWSdgAwhv6qwJKohUSKN4vkZn2x9/2JfpCM1Ozzzg+YyLbx76AEJ8t+bNbQKhnvoIo7ItK2M/tG8dtEEgOOZEVZSE9AiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369169; c=relaxed/simple;
	bh=i2LPnaLAnKwQO68ApHeiy+VlQxlT1QHckjudp84Hl2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SZjUKbB8LDesQ5eVKD1uOpb7AKYISMqcoip8T+K7lwAb+6Id+nNOprPb6tWIjjZnEJ0kqQhjTKLzjoQ1wrb3eeWnqTk/S7LQqzCsPA4bqstpjHQdgA4hoWSQj0AnjA+m3OczSCEON79DaYZEb2QKYuAjnkNb+ZyhLUfWM1q6XyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AzojfFrW; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=qfM7WT7J; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AzojfFrW";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="qfM7WT7J"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977jhg3494488;
	Wed, 7 Oct 2026 05:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DpSY1ILhS+4roJk5hBN1daHnmxQOAUD9RnOxC7Rey
	+4=; b=AzojfFrWsTp9QO+dKC+JODK2k8m2s/gaXvAcjdsa0DspS6an3eLE8xPSE
	y5iXd+/18pk9IQ3KNNgBSX7qvmj7B4TjRGmGAf/wfODcoP35H0Qyvb8Uq6IgtSml
	hSFkIMv+VDyZuTCKB4dwOHg2KiX2A8uD4ZIWjq4k2DK4C0SXLUoun17SjxMf8axB
	fI20YuWN7UGCvGZPPv4ci8ABqmzp+ldNPQ7sc0Fk90r2GGxTzWgh3u9Jnw4Jydv2
	0Ofi52v3YCDU4c74Gu3zHqC1FK6xiffeSERf6YVpeRetJQUi7lgqVStRadbYQNh0
	uv/0vC2GpjWSQHDpdwG4Rdvg2xXpw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5dk4sx3s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdnv24AhAESFanreFDZamLl3AQLAqvRpH/ggYMMq/QXw4xfslp66mXo7FqX2kRVZF15EZvo2Aor1Mlf+YmTxJ0heoKUtPZZmdPDsYhpAdHZI9UGLs/MsUbNl3XelvdYjMznoSxefWDCDnpcWRXh3zYJQ9T+S4u7xRjvZTTYRS7KhwuhWGetgW4sxZqbV1pXEEHHeWApVZnqrtip4YIxOhtvIhRf9c9g2yBSyQvzZRFQX45WgMnG1zqRgNvZYvxGu+LAfP/CZgViuoh0i8FshIIeSPx+1ch0yDqFkVxrPZYtN6l3ykx+4Fz8qezlr8w20FzDWYN0pDqqlOlmzQXreiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpSY1ILhS+4roJk5hBN1daHnmxQOAUD9RnOxC7Rey+4=;
 b=HOn+aqhgtXJbHA+8m0ADZZNORNgjwwjTKO1IW3BVLTcuaA55zlvuI1iSgU96DKZFlGrP1cmHx6Qaqi9J0j9eqHRPHNDMo2xEwQJCCEZvuFoIJ979oa/NKg4mPXJDgWzlECDsd4zMBiRxCicUhApFfaXQFjpYskXxGzlvxWwqcWsYNpAtSR/Pwv2sh3wLqiM683efCoC//uCYWX2wtByO8uFgRr2ERrnlNBDQOYnrTjqieYmZL1FM0gZA1kuprKtlob8Yrk9J1i6wRLdrH0XR6RFeiM2GkCLxtEXitVMxb6to5rwgE/iZAZvHa8mewd7ctQyak/6+Uzq3BMB0q6B2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpSY1ILhS+4roJk5hBN1daHnmxQOAUD9RnOxC7Rey+4=;
 b=qfM7WT7JiR6zDwaFZRZAoVO0DXtqFqm7bYiAKszLPGltoagSXjzJ9dR4FER1cDuZQBWNkUpalhPpTZLjdq+ECareHZG0X1mWyqbrmOzN4fuoR41/22nKDLDtSrucevHHbWUD4HGQhs5JzEGGOq2rhjG3iVgsLJS9phyw6kvxDsg=
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by CY5PR10MB6216.namprd10.prod.outlook.com (2603:10b6:930:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:31:23 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::81) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:31:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:23 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:04 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:31:03 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiT0013473;
	Wed, 7 Oct 2026 05:30:59 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 16/20] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
Date: Wed, 7 Oct 2026 15:58:57 +0530
Message-ID: <20261007102936.2402427-17-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CY5PR10MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e16db19-efb3-47ac-a387-08df245e2260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|10067099003|56012099006|3023799007|13003099007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	QQhqc/ryleqqm0JunraisFd83fmQ3Ucn+JGdhGxUB8E4eEPHHSd2ld6Ge2tGEZK/vMPwnh/JHmJt7v73Qhg776GuiMUKwaU+enZC9J+3Uzyrl37+0y5q41Sgk+IcspFvM+8F2cJ0rgmrS85JLZqR2gbWUdmUrveHBYR0d2t7+3yny7IQvcsUr2Dd3TJLAZd7X1SVZCSIB/n7lslmT+DvdFCVb64chfBZSL3LmwfM0UqYbfNBldzHPhYTjxeHhjEwTMAAESdhIwKkplHpF3/4jejiqxkco898Dq3Rbq6IZq/oWtyim4IbbDYFCTmKCIOa7mFaDhOUqXW0TGDu8m1Rcwv5N6/a4RdHoacUdvep5K3cGLi/B8q67+nH/1f2Z/sbS4PW0Pocdl1xePOa9vxR5cgnx5dgwP0P/T8+3Jhl+r9U2ZZ/nyI9IaWSjqi/mUpEiAEIrxJ9CJ4g+mD0TtDFU7WAwMG3wrglS6QyNYX6oDOPeUhjXM3tfMalBadq4XpHPLE/B29jGhkGZYEoJvnBPMbP/JZMywlTQ8jBmehECS6H4YF98oCMdXL3t9x3YIJ6xvnet23ce5fWqCZ3D45piv2/VeHM1HbIxrzpch24rsyxfnssyPvqm0FujACIWtrm59nkTTB1h8Ici3tfH7gReJ91zpzN7kSgJhHLd2Lb9tIxdOiuF31hMV7npe9AWCHx
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(10067099003)(56012099006)(3023799007)(13003099007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9gK6m4r9N6nPkUwdGBeCnrbNe/DFwqIamR1bbX1CexO8efD0xA/72/3qQ5GXeIDfOD7cEXwFDa8V32VOKjFjT2kNcE6KLVQYvzmc6m98RyhZp5xXoxrFz7WYjn5/taISf47Wh/e4qaMc846VMluk05Q4QRk7FP6ZR55GK1ESddNup/NM1fa4Cw58Z/PNy8/vvEI+Z1zyzinHXe6p+5tJqvGW/sPxw2p9hVIJwCmsxUBEm1y2OFPYzX4skLALgocrJC5Wdl4TI76pDGsQbZLLG1rNifYH6WRwWt1Q//bgwQrG4slc03Ry7vxdU8aKmhQ1K2nUDWNcQ9s8TwY2HQP3AiDmGEKqtO3yEAoABL+ajIPwzhZykdJN1qP/5n2a5Qc5HVOqAbqjbUJ9u6LXLi74BXHxwvQ5nnZ8P+cbhoMiHrXLCW1GwRyTI4oPIhrTVEUU
X-Exchange-RoutingPolicyChecked:
	WS9niGAHQp5+TiUQWkZ+DH5BGGTd9/FZduK2AMMp7f+0OStyqd/ZVvHpGA/par4P0DRKLclhiGmbDv6kFHgc/lSPdAHsTaJDSu6+22kAVSMJRFzsIpJdkfOsOOR7Y8rlvDznnzDL9AhdzJuN2LR5+uHQqd49JRrcCpGd7TTkPfZgSsmxwaOSpM6edV9HkNPX1jb1eDAmQ7RlFYZjOA20VATPzN9y2N9n8ZAZID186FlIaPtQQ3tK7PvqgkputGLDEikIeF1k/OsUog8G6pJfV0bI+LCHSvt4Nd7b+TWJ4+Z1pJeLzsM+uRRgRPWFfU/pcXL2moEId/gXioNIUEbqGw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:23.0823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e16db19-efb3-47ac-a387-08df245e2260
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6216
X-Authority-Analysis: v=2.4 cv=TaYDJhQh c=1 sm=1 tr=0 ts=6ac61f9f cx=c_pps
 a=UyUtkpB65yKBl9uddpDweA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=MKZzBV7iI1zLNhNYVM4A:9
X-Proofpoint-GUID: 9364hqf5YPqVLFeOb7U3KQWulbVMF0vq
X-Proofpoint-ORIG-GUID: 9364hqf5YPqVLFeOb7U3KQWulbVMF0vq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX0Afmjq/2UfvF
 efzKuLrOQEs2EBiS7zml2HSkEJcplgXVt6KYksQbZasF6jNcRpoIrYRGkjWa8etALRD0WGP/RNm
 H1A2SlhqKc8+FEarXboUL3hWLiZ20to=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXxwBhoIC2wPjp
 4SJ11LaUYrNKRvDIr1ToxhKW0yMnRXP2wDQgbFLUCMdkG5ApqqLP9nLkkBACTeDvK50PGv/sAC5
 oHdBknHWcn62nvBqMM6q8pATZstsa+RUetXrsf8GIcryvxx/86b9KKzAJQKsqIBOPUY0hdG2vW6
 wKhPQ3wlzRAN56CXstYpMQVsX6MdT3XIaQjTtc8HxYTXtAGwWO9VBAt8Ifnog1Rg8RcK+C6UELY
 nYIdEA9wXHfuwzin6/lbKSb6h+vCpdaUFG9/FwEheUa0jXCk75SQCXdwRmYrRkARTq49dx7nUcy
 8t2D6TysbiByEB+lq4OV40W/zTOAk2K27NbNp6USe1TmxwhK0tErmSWkV/zob+wreSklO8suJmN
 XaWa8hP49anDXyzPvCn0rowNZllAo0rrkS7uutBMdyEkf5QmcUqZfSOTq1n2SHZJt/Adt4sS24z
 2RLnnjLQkzbuW2xsLYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

Add PSIL and PDMA data for AM62Lx SoC.

Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
selectable fifos. Also add a new fifo_id field to psil_endpoint_config
to specify the selectable fifo_id.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/Makefile        |   3 +-
 drivers/dma/ti/k3-psil-am62l.c | 169 +++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-psil-priv.h  |   5 +
 drivers/dma/ti/k3-psil.c       | 106 +++++++++++++++++++--
 include/linux/dma/k3-psil.h    |   3 +
 5 files changed, 279 insertions(+), 7 deletions(-)
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
index c4b6f0df46861..1c4ae124d172d 100644
--- a/drivers/dma/ti/k3-psil.c
+++ b/drivers/dma/ti/k3-psil.c
@@ -28,6 +28,7 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 	{ .family = "J784S4", .data = &j784s4_ep_map },
 	{ .family = "AM62PX", .data = &am62p_ep_map },
 	{ .family = "J722S", .data = &am62p_ep_map },
+	{ .family = "AM62LX", .data = &am62l_ep_map },
 	{ /* sentinel */ }
 };
 
@@ -71,12 +72,70 @@ struct psil_endpoint_config *psil_get_ep_config(u32 thread_id)
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
-	struct of_phandle_args dma_spec;
-	u32 thread_id;
+	struct of_phandle_args dma_spec = { 0 };
+	u32 thread_id = 0;
+	u32 channel_id = 0;
+	bool by_channel_id = false;
 	int index;
 
 	if (!dev || !dev->of_node)
@@ -90,17 +149,52 @@ int psil_set_new_ep_config(struct device *dev, const char *name,
 				       index, &dma_spec))
 		return -ENOENT;
 
-	thread_id = dma_spec.args[0];
+	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
+		bool dev_to_mem;
 
-	dst_ep_config = psil_get_ep_config(thread_id);
+		if (dma_spec.args_count < 1) {
+			of_node_put(dma_spec.np);
+			return -EINVAL;
+		}
+
+		by_channel_id = true;
+		channel_id = dma_spec.args[0];
+		thread_id = dma_spec.args[0];
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[0],
+							  true,
+							  &thread_id, &dev_to_mem);
+	} else if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-bcdma")) {
+		bool dev_to_mem;
+
+		if (dma_spec.args_count < 3) {
+			of_node_put(dma_spec.np);
+			return -EINVAL;
+		}
+
+		by_channel_id = true;
+		channel_id = dma_spec.args[2];
+		thread_id = dma_spec.args[2];
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[2],
+							  false,
+							  &thread_id, &dev_to_mem);
+	} else {
+		thread_id = dma_spec.args[0];
+		dst_ep_config = psil_get_ep_config(thread_id);
+	}
 	if (IS_ERR(dst_ep_config)) {
-		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
-		       thread_id);
+		if (by_channel_id)
+			pr_err("PSIL: channel ID 0x%04x not defined in map\n",
+			       channel_id);
+		else
+			pr_err("PSIL: thread ID 0x%04x not defined in map\n",
+			       thread_id);
 		of_node_put(dma_spec.np);
 		return PTR_ERR(dst_ep_config);
 	}
 
+	mutex_lock(&ep_map_mutex);
 	memcpy(dst_ep_config, ep_config, sizeof(*dst_ep_config));
+	mutex_unlock(&ep_map_mutex);
 
 	of_node_put(dma_spec.np);
 	return 0;
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
2.55.0

