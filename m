Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CB547078;
	Wed,  7 Oct 2026 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369104; cv=fail; b=VZI8JwhEcBrqxkF7wxvBLzTvz8UVU3I1qRJUR8LKmw1JkZrZir4t+J5D+YQYhK0OZk9rwMDiOredCgSiNhK0p6xnEuKY6FlcgXJ8Mpcirbr94PxIz91PMmZ2/YH6j8bel5nAgUT9atVGkugnwkM5G6wrIR87+2cXWNh+cbP+DsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369104; c=relaxed/simple;
	bh=7AsREp+TW4x9X7tZKtI5IiZPNQjeEgz8miD9tewlo1A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaYJC8Vdffao3OIC6YhHb7V1exz4jZj4ZjW+i/1Vh69DdkGW+pSMXdvEZcm3LBT9jK8XD3j088trYn7qTpZQLgvibPC1EJUcImqJQg9CRD+Q6QcyJYbV21AB18hMq889gvjS2CMU6ggmC+dihi3BKzVAZS/iVKPG4IRBKi/uQpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Jv2/PM0y; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=HmwtRV4Y; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Jv2/PM0y";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="HmwtRV4Y"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k6sJ753362;
	Wed, 7 Oct 2026 05:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Go8xxMkENtdkO8l7/rzp3/pe+XE3QJAhV7mFkOhOo
	V8=; b=Jv2/PM0ySJbCf7dmYRU8R/L+Rt5f7f8XHq1RReJYjE9GCpPTQQ5HRYFGQ
	kSGzA+iebWRIWF+OpRf75dKqYXiYsI6WaBTCuMgcW7urC7rgdN0Hx7JQpPlI/ht1
	PdmqHHDmvNmx5qcaRSOTLeONj9uOycxLQoXPRUSOs3TvZKJm20+L3209mAoSVxQu
	oTt6WcSi18Uk4XlYwXRNtmVTEUIXxmQNkz+cdASYLXtkcvcwuLIB9XxE0wG/13Lf
	NOu//+JdlnkLYXROZwFO9NCdG/pYP0/nWAvSj6rd21mtjfFydqMhL2c5j5IpI2MO
	cjTNvuL0JA0YClw+DcRNxxT+iaSeQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78pu7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmKcym08NRWmYsPDGS/aiuSVac5+//9SY5VSlXxMnpniwOHu0y/Q1H9vdT4Vm26RMRRYfR6bfH6eFhXWnt+Zx+IJ125rQ4cVVHrVWxZnUt5DJCZRGECGvUyk3t7oAMICjTYNqwsXkQZ/FqLFk43JIiB0YQ81BOg4lkBpoxgQRHvucJDEqHlZHQTfa3HuY0M/O+padtu1x/ud4KoGN5NbZp49iW2x/A0HXT0plX4lv2OvlsYSRkkaPLeKfg0+YEPnu2MIMudeJiURNwq55cC78j5YbHeJUazSdtDBtiyeaao77qdA8Zc/Bc951hV4xYlmFukkaWVRNTsOx1Uix4wLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go8xxMkENtdkO8l7/rzp3/pe+XE3QJAhV7mFkOhOoV8=;
 b=mmTKyAQQRpW6NOn0ghTBcklZcJ0SOdWYldm/EaYyavG6tVT1p18narVTic454bxE9iYY9PkdoeEc22MyvrWtx5cBGAdwPZgtUgV3KRnFVae8psUXSIel9vvsyn/S2/NVyoWOM40pzaP7PyYqI1DYRpIVE8M7gB/sXYbInghuOKEiwgn1rTZOGe7Z19zDM46EALlPFGGqs10ZpPYmH1czInU79Dw6ff6GzIoVIAnc20srn9dNLBbAHpuDe7BErUbsjtOhggo4+b7dAog159r8QK6fDoME9SqRY4jqo26/rbylqiOrETfx4ovOhR4DyEm9Z3wQr8ZCqgDn148GwX+09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go8xxMkENtdkO8l7/rzp3/pe+XE3QJAhV7mFkOhOoV8=;
 b=HmwtRV4Yc0cH6U0wjJSMucJulNdPhSgxfvfBR7/ygg+LANKbJAdxVoYIcUxS4Xt2GUbk1hUcL0FuQYlszKLH+a9qgC52sNyaENcCReG58mjDAZwv10XNYo6BmiZUpYS/zRBO3hJ7iG+WIhR5/EMTF4KQ3h8xb8dkDR5sjJNq/m4=
Received: from BY3PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:39b::17)
 by PH8PR10MB6624.namprd10.prod.outlook.com (2603:10b6:510:220::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:31:01 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::55) by BY3PR05CA0042.outlook.office365.com
 (2603:10b6:a03:39b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Wed, 7
 Oct 2026 10:31:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:01 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:41 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:40 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSt013473;
	Wed, 7 Oct 2026 05:30:36 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 11/20] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Wed, 7 Oct 2026 15:58:52 +0530
Message-ID: <20261007102936.2402427-12-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|PH8PR10MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 5673be4a-cdf2-4e8d-ed05-08df245e1558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|7416014|82310400026|921020|56012099006|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vdERPb2J27IvJj/m/kKjgOwueP092ys5GZSoGK1gO88Vs4R0pXYDuz71e/UH2eYjy48lQVklEnYwYszdhmuAIPKew7XJvhA+GYvqWMJASi3lzXBQ3zVHgGPZHjzduCAd9imsQnSbWCM/tu0kf0fcgTy7JA8f6MyRfw5ppA54gm4dUad1pSagOEm8RwMD+Ne+oeLpJrMbdWfpuhuucUR7WnIM35Ts4hCEXBkMOmypY3nQuADVTMsVMy4yuUuEF1Dvt689yXqVfKGMai7VDdP7HJ/h1i1udHc+S2UWDgdNr1ac8dBqd43dMAodv5hRK+m8fF6bmWpwaALZ6ANIQ151IovjswGS+mEc9qV2McpVrpbAeXcS2inlDwDKr28DN4K9XNcXHRafNK4gOLX9ABmzakt5+rFaRNgmFHVpm9saWWPs3tUmW3IniFu4eqkboPZZnnNU3/Bp8IREalACHqYGNd7sWGRDjmwVFj7RQEVLGXL7VW3CZwDuI4XdAdl0Es6cVnwl2aDFgxgyG9gTsQqVHux2oNREoXELLA6BRF6iJOPuXm/zJLR0GH85E43ACenWzQEjpZHVPxduXsyeM/DOoFBUdRS+l0k5+hpO2BPzwPGEX9eZwbBzQrqp5OdZ0jaWCwe+1HQ9QOsoV/8c/3aW9WPfJ7rr95k6qHRQAu6V+CXZq+AEnr7ePo4s9P7aucaRm7NsJzwKnl9JaQKgs3/MMQAChjaO84GWn+oUpRelc/bG0EN4tCZ4nZMYceegg+vx
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(7416014)(82310400026)(921020)(56012099006)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tpw0l0BRMzLnKpayux8M1q05NpjT+UVHA35cOU8R5fqT4/pg902EycfFbhQWvU0CqT5igNOCH/40KmnBBFPsczSUawsxV5t/Y/SM4qD+ul01t7WQrO305j1UCwTqmLl2QpkHw1y9+d8tdaV9DFYwAovZVU+cTLdPzDnQhUIO/w0KKk4NOE3AE5J6icF6HQAiYCJgmVBzZzXkzXqXqFTpAVg3vWP0gB4lfjFL3V+LyU09CrxZm40ZgMrKkboaZPjPPIa19C2Ul+YXraYqOlyKr/BSHzhzggx9ztPht05WBysBp/974lk1L/emhO23ZTkE7DGr9poVe0wRVhoaf3Qzf8nAdVGn2Yj7G6bCHF7+hG8KkIxlko6q9nf1gNnGkR8pLqCrvPAJEPlUaTCQH8njDEAkimOOZsuM9Xnad6dzLAsg+461y+7cLJbz88LlRdxC
X-Exchange-RoutingPolicyChecked:
	ZkuudKHExBBfEsKqi/9pilaaOLm1fQHke7zsyv1kn+8rLPFJvrXpG9HM6suWjSlWxlAKp2bb2dzU4ina/E/Rw5b/yctze5dBVHzlH02PgkvCT+Y4Z2cb8acgnuuZcadBU2QZeyTTzrSS3GsUCLM450Ebujvp1jW8PZab9eBcKDb6oXbv67UiWTiNCzW5Xq4PqtccFkk4Q/gi3dZZN6qfIdbGWhxurIDLx2z4JXvoTzW5q4EsDPJoY9xlKL7P9yOK4YMhTvM33oHwr9c6Nv295jjJt47xIKUuTLq5IaajHcBCg9ZBDabXIL1ndLj/nclHJDHfpRXif37/Kf33Rk/QdA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:01.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5673be4a-cdf2-4e8d-ed05-08df245e1558
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6624
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61f6a cx=c_pps
 a=Gv32SYzo0qTo49aZOIuVGw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=tBjUjbL6H5YkyfA7LM4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX9dCzn0uo6Az7
 3HRNG9+OmnzJcvMDbqWrS/8UuDHqKepYEHopmrpmQXrTd97503akoNwZFRg7ZS3FPKLEHgmBirX
 J3ozX/Fhj6bQS3AWyUYeBEEEI84W9Vo=
X-Proofpoint-ORIG-GUID: kGtjburUo2kp4SI1yz96UF6RP2bqivet
X-Proofpoint-GUID: kGtjburUo2kp4SI1yz96UF6RP2bqivet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX9+Xntrq4lnRr
 odb8wBOX1KvVikf4ZWb9fvnSAoVx6OHkBfPSP16boA4hrtHDOwrULxzpCgB/wNJaOQ0fjYPAyzO
 A2+2Lq0Oxo1TwUXnw9O3crVQWul9SytLSo8mHTWNuclSNAtXibGbMGCKcEHLc/4zroWkcVU/a41
 m2/AjzhIl9FgLK+8ZBFfDicJafc4Q9An/yj5WZKupZoJuI8lIji8/LNP4MF88vznzjnJsQXm4g9
 KJgXvyXfyDK9NN8TCMcRu8Ew39nf/yY5ZV5AyekunYeyKauIGMi+AiJU6CzhTEpQTyigcQL8qy8
 gghvhWhf1gtA6Jz8sHbhUkxnHm4ZLx8HzpOHg1+/kWcH9DTAQ04WCAHRkTsjytoajVhBE+lDvgX
 oYf2n4RxK1J6ZVQaCXkGLvP6zHCjKOuIJZCBK2ebYC3j4esoB5/OZ3grOzQQbFoBdYzc3uekDVp
 qXDD3+Ij8SPuuK/19iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

Relocate the #include directive for k3-udma-private.c from k3-udma.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and
prepares for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index fc4c3c0f571de..5c6af4c88d780 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2548,3 +2548,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 9a261747c8709..ddedd51ab26d9 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.55.0

