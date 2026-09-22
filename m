Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D04FB9D3;
	Tue, 22 Sep 2026 06:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059855; cv=fail; b=GOJ/tBibXH5H6+PJnHigm7p2JIJwtgeHuWMoaBfFt4Z5pod4B8BOhbyp2RWmWBSkRmGTbGoR214zw/Tn+xdzB/4gvxKQ7j2Icfwn0Z2lSunCHRWOo65kIfDkz4yPUuWWmhVhdvXPosF19dsuCeFiihiap7nlqNmyPAMQBW6pavE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059855; c=relaxed/simple;
	bh=oOVkMmTaGAXp5/IPFcWjjYID0tc7XJq9PhiQXfYL74M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGNPj2IOq6KbTZYs1ICRetNPuK2kstOAm03wO7kmsFGhcRw7NUHsA+vQZoh9361AXS3VAk98EsIhJ8MO9I1cB3VHaohPrkRF7A5LhJczVaCqcI54p+oQ+QhloCCJ9GfWTi/JSVjuGDkbqWzmmpMqNq/PS+fvUjhU0vo3q9i3UE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lktrgWab; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s2FxEU4G; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lktrgWab";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s2FxEU4G"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2URnk1035305;
	Tue, 22 Sep 2026 01:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HmrWC352jGNFSwZ8VO5JUAExUZ3Gk8JbL9ClBlqAw
	DA=; b=lktrgWaboP7+ipKKR18fd3rUj0fxO6G/roviJMuKSWSodGi5Ry3L6VZx5
	2h8EEk/KaPs0JNyEwF38PlpTeLr3MyqvCHKv9As3XJetOm0d9zdOzLUkaQl6IELJ
	JqRgWLj/yotGrFt55OpmrpZTOYeia1PWYkZn2sM0VQxWyjCazY6wLKs46rJPGatQ
	GFEj559vR+/Hxrqcs234AtZLMpggx4ij00mB3cwKuDqRDQEw2AkWz0vACSN9m7nY
	JmG4+uNW6eRZBY/fM29c/83sWKrDMh8rQRJkWVlugvgzntoUahEanRKOscWlL+Ip
	oSA0j9LNfDrTGcTT4rEIk6XPPjiGQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16ms-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwyF71I/INkehbe7V1yeRyEps30oIrkmommAZuqDTfN+oVXx8Ify22+zesJ/D8f020EVBB4F30lSd0AI9ZP4un/EN01hFuVMmSG531PUrKnbADjkoBU6TR4/8cJNnCWikkFoQlkD/0N3BZZ5OgugGSR82Dh7cEWAaWUjPXb5hX67V7zNfEGOYIvGyxE9rk/0jbmYFBKNWfLbIh+JrO+09N5tCil9n2CEZ7UwNTYfprKg1Nv/tCIICR6TggBd1GxT3pHeCv1yfoBTEVZUBcQaqbOYHcJk6ZKNP1apm97+aCnKAVGvgqzoFRUUYbF4VfFKaHuy9IH/b0aYaM8S8jfIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmrWC352jGNFSwZ8VO5JUAExUZ3Gk8JbL9ClBlqAwDA=;
 b=GXofcVbxi9u/MnaTHPR+OeyyCE68MLMPB7Yd5M68aaNYLKQbGH4Cwe2CiR/9FhhE3DZKmOAKg55vO/4rQzqD5idnr202vRLbk0jPutB1rP5tjwaTfwpQyGd7kqKIUTDLJ4/F8ULGzn37QhRgIaPn6uU0RX5ABFjiQ+pxY7H+uoe6HZURW9ZM/SsKmrO+38+UhB0YMpgwr8rqr/NyTsa/JB1ze7uYZTtBoxmkj9Jyix0a/n+mwdjR3mnRdRSS1G45BErra/eet/BVEpxbzbCycOr1jxB9q1uYS16R6Tnfz43RYgwST0Mu1pDPQMFI7ikD4LpRz1naX8giXeqlqhS1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmrWC352jGNFSwZ8VO5JUAExUZ3Gk8JbL9ClBlqAwDA=;
 b=s2FxEU4G5TEp9HiP0X/HV9YBvvyYdGnuIk5yFhYqJanQbnYOYxynZMcUVpoRypTfOPW9dLJmTvYsaUxJY5lSNpfgyIXX0QUilj1qOeGd109ngBQpBzBZhlRa2kPL7+yS/QmWXu8yDhaX2Yn5wPM+cJTlIa6vvu4CEh8MrFvSfrY=
Received: from BL1PR13CA0115.namprd13.prod.outlook.com (2603:10b6:208:2b9::30)
 by MW4PR10MB5881.namprd10.prod.outlook.com (2603:10b6:303:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 06:50:21 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::31) by BL1PR13CA0115.outlook.office365.com
 (2603:10b6:208:2b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 06:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:19 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:48 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:48 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3v3626771;
	Tue, 22 Sep 2026 01:49:43 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 05/19] dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c
Date: Tue, 22 Sep 2026 12:17:29 +0530
Message-ID: <20260922064902.2719979-6-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|MW4PR10MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 83de2a07-234e-4c41-45b3-08df1875c43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|13003099007|921020|6133799003|10067099003|56012099006|5023799004|10063799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kmIE8irdD9P5gVgidhdrSC+xMjDMHmZRonliixsh1xCtCu/MGd7kMEllmbG0FoTyVyEPOSXkCxj6mBzNkmlGzCNp6TxamTe5ZNez5bBQkZWdqf2bhbQnPWt1WxjJKqDvMmh0037NZ6+SSnPPwey/wAo3l5ODHsixvli58cVGYJj8fwaATtoUSKEuqNvSHiJYHVHDhRGfJwiAK2kuC7q7WCRIE1110iDdbIPCzhhkmAvNlybtTUzAPznXJEWaT2OlKgw0aaBqtatMe7A7mn8wwDFcR10/1Jk8YquoD8RLW4Tbp2t+XorbUirgPGz33D9Szfm95UhEhWOVRH6M53szGMoz7gWLyezsuWb2YxjnKfhn2g4smAIjEhHdrHJuZvenQ2NTI8tc8OA/uE3cD9Pbg+nuJxuKTVT2IMVfhfn1UeswD06DlaWXwncO10qGtaQxgObtlMHUDjb/zyFpFkrNu+xxDcp9wYz9zKOzBPlsbqfA4jF1IvUKUZhIsuk658GhQwJltgjtGJq7Q+ampmjpjibmFoYAyr5aWZlROJIOVhGNo2i++AKrmX7xLZqtqDAnEZPhhGqE+4zsjsb799SO3fti40OvdjFen1f1Sdb9apGnG4PvlR3ahFug2iHVhnFxUjjG9DAOnZxajfEvOOVIIdCIu0vuFkAIWFBrYwef8QXxXi6VZkBk8yBbZtEjqczR
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(13003099007)(921020)(6133799003)(10067099003)(56012099006)(5023799004)(10063799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZgmmGv4GtucebeScjLkdI4N0m8XA0hbJP55knPNxNwZZEUfwjQb2TDVkM5LIB8eua5jQ3BO8p/E6Jh/vGooeV4wu3Bh6UERXvEoxmUL6N28VzCK2TIFgb4tRyaO+32Nge7grYYKbqnPwO9dDolKQbownFyAt+U43ARvkvroxvMY9akhseaS9P4OdhPW09NnHlF2zOb7tzOalzP/d+PN0BWjiACA8pR96tK0gS2/tG7g7D+3Kolb+uz4dY+SuCjzInVSDeYtA/kKhXL7o47tr5ICPV8c4oBUscOVI5xHG0sx1j1O5EmUw0uwyWx4V1fZOCFThnOjrZ1uxJjSztAPmhqAo7NJHQbn13hKBwzFdIXrgU0Py2rQzp6YCGEErriQFAfKyRsUDSnPhT7iHmeTNR/kq0ExVCeBYYoqfZXbk/o2hHQD5gZ4WOZdeMeGrLwIu
X-Exchange-RoutingPolicyChecked:
	GxEwn1CjXqtpmfktdfgchsLRqvGPuAOxnLe554tLSC2XyaVh0nJNBLbPnGI8CFs0mYLzjUpkxZiHtDWfTqyaVyKHreEY0tMQYAtgDs0pmxkxeAURQL3TYfplRjnHu4slSWoZFwouksPWLwoKF9ZbN4Lnh5q53x2wjen/Gr2Uxfx5MXCoGPJMmLJS+q5HB1KAaqZoblRyzemrOkR5DmCiegCJmsV/zw/2qGz8F/qyVUXYsgRRJCfkT8WHVRefD1h/PDQQJZSqgk9P2c6Byt7BJbOVGoBvgshn+2DmjRRZqrzl7PEptXG7IbAfWWefmcIrFixilcH83gTpah3qX9Mm+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:19.1011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83de2a07-234e-4c41-45b3-08df1875c43a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5881
X-Proofpoint-ORIG-GUID: Ou0kUUT5bU2-0xD_SnVOdRS5x5656Xgo
X-Proofpoint-GUID: Ou0kUUT5bU2-0xD_SnVOdRS5x5656Xgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX9e28YYKJY/5c
 4+iYLtftp30kmng623IHFvQ91f4NcDOJolLUEJToxjP6nmUDD2Pw9riM75eTgh4CjHn4C1PTJtc
 fFqvQ/Tq7/X7iL0hXti3oy2x8ugEhnl1s2vZAYSaNIIPoZz3LTUCOCQJ6IlkZclAjnx0L9aQrSJ
 UUa1Qt4PmSryZNoxXlZKNpn45c8rfXDlVuDiBYbd0f1rdBudslMy1vghdfn1InZNRcYBoXhbboG
 9/SNq2N/CnW4bxOW1+tq37V+FyKJ0wd4z7DNPUB0RYcP3pTNeqwIAbZzTdAXWzS+GGB+Vc283/y
 +p+gHcC9VsVrmaE/KSPdg7KCdliqHN4ucckfNbd5jM28m3TgsYgdppdRgE0YbI7hXVUhPYk9g7a
 buMD2poGS6lB2/RH8s7F2smZO2R5wj/oPHWrzRzB5xBWPZT79nQgeQZS1bI8/u7Y+w5CCg4MGgc
 dAqaFM4IF6SCCsDxdhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX135NK9Np0EOy
 sDs4X3xf/hJYPdZGfld5hu4S1cfW3Wiet/l8/m/qa98YyoYQVSPbCfpwg9rHMicWViRL8isAmlt
 sVGSxaLD4/FmqNDpIPrg5fq2Dr58dIs=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab22537 cx=c_pps
 a=7HTsEC4o+G4Ts3XEwqQVug==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=9fA4dagTuIDSJ7NYoQoA:9 a=x_a8ZKo73Tz1WADx:21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Refactor the K3 UDMA driver by moving all DMA descriptor handling
functions from k3-udma.c to a new common library, k3-udma-common.c.

This prepares the driver for supporting new K3 UDMA v2 variant
(used in AM62L) that can reuse the same descriptor handling logic.

To ensure this common code works correctly across all build
configurations (built-in vs modules), introduce a hidden Kconfig symbol:
CONFIG_TI_K3_UDMA_COMMON.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Kconfig          |    4 +
 drivers/dma/ti/Makefile         |    1 +
 drivers/dma/ti/k3-udma-common.c | 1243 +++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 1218 ------------------------------
 drivers/dma/ti/k3-udma.h        |   54 ++
 5 files changed, 1302 insertions(+), 1218 deletions(-)
 create mode 100644 drivers/dma/ti/k3-udma-common.c

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index cbc30ab627832..a389ae04ec930 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -42,12 +42,16 @@ config TI_K3_UDMA
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	select SOC_TI
+	select TI_K3_UDMA_COMMON
 	select TI_K3_RINGACC
 	select TI_K3_PSIL
         help
 	  Enable support for the TI UDMA (Unified DMA) controller. This
 	  DMA engine is used in AM65x and j721e.
 
+config TI_K3_UDMA_COMMON
+	tristate
+
 config TI_K3_UDMA_GLUE_LAYER
 	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
 	depends on ARCH_K3 || COMPILE_TEST
diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index d376c117cecf6..3b91c02e55eaf 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_TI_CPPI41) += cppi41.o
 obj-$(CONFIG_TI_EDMA) += edma.o
 obj-$(CONFIG_DMA_OMAP) += omap-dma.o
 obj-$(CONFIG_TI_K3_UDMA) += k3-udma.o
+obj-$(CONFIG_TI_K3_UDMA_COMMON) += k3-udma-common.o
 obj-$(CONFIG_TI_K3_UDMA_GLUE_LAYER) += k3-udma-glue.o
 k3-psil-lib-objs := k3-psil.o \
 		    k3-psil-am654.o \
diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
new file mode 100644
index 0000000000000..3130805a8ec40
--- /dev/null
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -0,0 +1,1243 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com
+ *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+ */
+
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
+#include <linux/platform_device.h>
+#include <linux/soc/ti/k3-ringacc.h>
+
+#include "k3-udma.h"
+
+static const struct dma_descriptor_metadata_ops metadata_ops = {
+	.attach = udma_attach_metadata,
+	.get_ptr = udma_get_metadata_ptr,
+	.set_len = udma_set_metadata_len,
+};
+
+struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
+					    dma_addr_t paddr)
+{
+	struct udma_desc *d = uc->terminated_desc;
+
+	if (d) {
+		dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
+								   d->desc_idx);
+
+		if (desc_paddr != paddr)
+			d = NULL;
+	}
+
+	if (!d) {
+		d = uc->desc;
+		if (d) {
+			dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
+									   d->desc_idx);
+
+			if (desc_paddr != paddr)
+				d = NULL;
+		}
+	}
+
+	return d;
+}
+EXPORT_SYMBOL_GPL(udma_udma_desc_from_paddr);
+
+void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
+{
+	if (uc->use_dma_pool) {
+		int i;
+
+		for (i = 0; i < d->hwdesc_count; i++) {
+			if (!d->hwdesc[i].cppi5_desc_vaddr)
+				continue;
+
+			dma_pool_free(uc->hdesc_pool,
+				      d->hwdesc[i].cppi5_desc_vaddr,
+				      d->hwdesc[i].cppi5_desc_paddr);
+
+			d->hwdesc[i].cppi5_desc_vaddr = NULL;
+		}
+	} else if (d->hwdesc[0].cppi5_desc_vaddr) {
+		dma_free_coherent(uc->dma_dev, d->hwdesc[0].cppi5_desc_size,
+				  d->hwdesc[0].cppi5_desc_vaddr,
+				  d->hwdesc[0].cppi5_desc_paddr);
+
+		d->hwdesc[0].cppi5_desc_vaddr = NULL;
+	}
+}
+
+void udma_purge_desc_work(struct work_struct *work)
+{
+	struct udma_dev *ud = container_of(work, typeof(*ud), purge_work);
+	struct virt_dma_desc *vd, *_vd;
+	unsigned long flags;
+	LIST_HEAD(head);
+
+	spin_lock_irqsave(&ud->lock, flags);
+	list_splice_tail_init(&ud->desc_to_purge, &head);
+	spin_unlock_irqrestore(&ud->lock, flags);
+
+	list_for_each_entry_safe(vd, _vd, &head, node) {
+		struct udma_chan *uc = to_udma_chan(vd->tx.chan);
+		struct udma_desc *d = to_udma_desc(&vd->tx);
+
+		udma_free_hwdesc(uc, d);
+		list_del(&vd->node);
+		kfree(d);
+	}
+
+	/* If more to purge, schedule the work again */
+	if (!list_empty(&ud->desc_to_purge))
+		schedule_work(&ud->purge_work);
+}
+EXPORT_SYMBOL_GPL(udma_purge_desc_work);
+
+void udma_desc_free(struct virt_dma_desc *vd)
+{
+	struct udma_dev *ud = to_udma_dev(vd->tx.chan->device);
+	struct udma_chan *uc = to_udma_chan(vd->tx.chan);
+	struct udma_desc *d = to_udma_desc(&vd->tx);
+	unsigned long flags;
+
+	if (uc->terminated_desc == d)
+		uc->terminated_desc = NULL;
+
+	if (uc->use_dma_pool) {
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return;
+	}
+
+	spin_lock_irqsave(&ud->lock, flags);
+	list_add_tail(&vd->node, &ud->desc_to_purge);
+	spin_unlock_irqrestore(&ud->lock, flags);
+
+	schedule_work(&ud->purge_work);
+}
+EXPORT_SYMBOL_GPL(udma_desc_free);
+
+bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
+{
+	if (uc->config.dir != DMA_DEV_TO_MEM)
+		return false;
+
+	if (addr == udma_get_rx_flush_hwdesc_paddr(uc))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(udma_desc_is_rx_flush);
+
+bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
+{
+	u32 peer_bcnt, bcnt;
+
+	/*
+	 * Only TX towards PDMA is affected.
+	 * If DMA_PREP_INTERRUPT is not set by consumer then skip the transfer
+	 * completion calculation, consumer must ensure that there is no stale
+	 * data in DMA fabric in this case.
+	 */
+	if (uc->config.ep_type == PSIL_EP_NATIVE ||
+	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
+		return true;
+
+	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
+	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+
+	/* Transfer is incomplete, store current residue and time stamp */
+	if (peer_bcnt < bcnt) {
+		uc->tx_drain.residue = bcnt - peer_bcnt;
+		uc->tx_drain.tstamp = ktime_get();
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(udma_is_desc_really_done);
+
+struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
+				     size_t tr_size, int tr_count,
+				     enum dma_transfer_direction dir)
+{
+	struct udma_hwdesc *hwdesc;
+	struct cppi5_desc_hdr_t *tr_desc;
+	struct udma_desc *d;
+	u32 reload_count = 0;
+	u32 ring_id;
+
+	switch (tr_size) {
+	case 16:
+	case 32:
+	case 64:
+	case 128:
+		break;
+	default:
+		dev_err(uc->ud->dev, "Unsupported TR size of %zu\n", tr_size);
+		return NULL;
+	}
+
+	/* We have only one descriptor containing multiple TRs */
+	d = kzalloc(sizeof(*d) + sizeof(d->hwdesc[0]), GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->sglen = tr_count;
+
+	d->hwdesc_count = 1;
+	hwdesc = &d->hwdesc[0];
+
+	/* Allocate memory for DMA ring descriptor */
+	if (uc->use_dma_pool) {
+		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
+		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
+							   GFP_NOWAIT,
+							   &hwdesc->cppi5_desc_paddr);
+	} else {
+		hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size,
+								 tr_count);
+		hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
+						uc->ud->desc_align);
+		hwdesc->cppi5_desc_vaddr = dma_alloc_coherent(uc->ud->dev,
+							      hwdesc->cppi5_desc_size,
+							      &hwdesc->cppi5_desc_paddr,
+							      GFP_NOWAIT);
+	}
+
+	if (!hwdesc->cppi5_desc_vaddr) {
+		kfree(d);
+		return NULL;
+	}
+
+	/* Start of the TR req records */
+	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
+	/* Start address of the TR response array */
+	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size * tr_count;
+
+	tr_desc = hwdesc->cppi5_desc_vaddr;
+
+	if (uc->cyclic)
+		reload_count = CPPI5_INFO0_TRDESC_RLDCNT_INFINITE;
+
+	if (dir == DMA_DEV_TO_MEM)
+		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
+	else
+		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
+
+	cppi5_trdesc_init(tr_desc, tr_count, tr_size, 0, reload_count);
+	cppi5_desc_set_pktids(tr_desc, uc->id,
+			      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+	cppi5_desc_set_retpolicy(tr_desc, 0, ring_id);
+
+	return d;
+}
+
+/**
+ * udma_get_tr_counters - calculate TR counters for a given length
+ * @len: Length of the transfer
+ * @align_to: Preferred alignment
+ * @tr0_cnt0: First TR icnt0
+ * @tr0_cnt1: First TR icnt1
+ * @tr1_cnt0: Second (if used) TR icnt0
+ *
+ * For len < SZ_64K only one TR is enough, tr1_cnt0 is not updated
+ * For len >= SZ_64K two TRs are used in a simple way:
+ * First TR: SZ_64K-alignment blocks (tr0_cnt0, tr0_cnt1)
+ * Second TR: the remaining length (tr1_cnt0)
+ *
+ * Returns the number of TRs the length needs (1 or 2)
+ * -EINVAL if the length can not be supported
+ */
+int udma_get_tr_counters(size_t len, unsigned long align_to,
+			 u16 *tr0_cnt0, u16 *tr0_cnt1, u16 *tr1_cnt0)
+{
+	if (len < SZ_64K) {
+		*tr0_cnt0 = len;
+		*tr0_cnt1 = 1;
+
+		return 1;
+	}
+
+	if (align_to > 3)
+		align_to = 3;
+
+realign:
+	*tr0_cnt0 = SZ_64K - BIT(align_to);
+	if (len / *tr0_cnt0 >= SZ_64K) {
+		if (align_to) {
+			align_to--;
+			goto realign;
+		}
+		return -EINVAL;
+	}
+
+	*tr0_cnt1 = len / *tr0_cnt0;
+	*tr1_cnt0 = len % *tr0_cnt0;
+
+	return 2;
+}
+
+struct udma_desc *
+udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
+		      unsigned int sglen, enum dma_transfer_direction dir,
+		      unsigned long tx_flags, void *context)
+{
+	struct scatterlist *sgent;
+	struct udma_desc *d;
+	struct cppi5_tr_type1_t *tr_req = NULL;
+	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
+	unsigned int i;
+	size_t tr_size;
+	int num_tr = 0;
+	int tr_idx = 0;
+	u64 asel;
+
+	/* estimate the number of TRs we will need */
+	for_each_sg(sgl, sgent, sglen, i) {
+		if (sg_dma_len(sgent) < SZ_64K)
+			num_tr++;
+		else
+			num_tr += 2;
+	}
+
+	/* Now allocate and setup the descriptor. */
+	tr_size = sizeof(struct cppi5_tr_type1_t);
+	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
+	if (!d)
+		return NULL;
+
+	d->sglen = sglen;
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
+		asel = 0;
+	else
+		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+
+	tr_req = d->hwdesc[0].tr_req_base;
+	for_each_sg(sgl, sgent, sglen, i) {
+		dma_addr_t sg_addr = sg_dma_address(sgent);
+
+		num_tr = udma_get_tr_counters(sg_dma_len(sgent), __ffs(sg_addr),
+					      &tr0_cnt0, &tr0_cnt1, &tr1_cnt0);
+		if (num_tr < 0) {
+			dev_err(uc->ud->dev, "size %u is not supported\n",
+				sg_dma_len(sgent));
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
+			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
+
+		sg_addr |= asel;
+		tr_req[tr_idx].addr = sg_addr;
+		tr_req[tr_idx].icnt0 = tr0_cnt0;
+		tr_req[tr_idx].icnt1 = tr0_cnt1;
+		tr_req[tr_idx].dim1 = tr0_cnt0;
+		tr_idx++;
+
+		if (num_tr == 2) {
+			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
+				      false, false,
+				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
+					 CPPI5_TR_CSF_SUPR_EVT);
+
+			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
+			tr_req[tr_idx].icnt0 = tr1_cnt0;
+			tr_req[tr_idx].icnt1 = 1;
+			tr_req[tr_idx].dim1 = tr1_cnt0;
+			tr_idx++;
+		}
+
+		d->residue += sg_dma_len(sgent);
+	}
+
+	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags,
+			 CPPI5_TR_CSF_SUPR_EVT | CPPI5_TR_CSF_EOP);
+
+	return d;
+}
+
+struct udma_desc *
+udma_prep_slave_sg_triggered_tr(struct udma_chan *uc, struct scatterlist *sgl,
+				unsigned int sglen,
+				enum dma_transfer_direction dir,
+				unsigned long tx_flags, void *context)
+{
+	struct scatterlist *sgent;
+	struct cppi5_tr_type15_t *tr_req = NULL;
+	enum dma_slave_buswidth dev_width;
+	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
+	u16 tr_cnt0, tr_cnt1;
+	dma_addr_t dev_addr;
+	struct udma_desc *d;
+	unsigned int i;
+	size_t tr_size, sg_len;
+	int num_tr = 0;
+	int tr_idx = 0;
+	u32 burst, trigger_size, port_window;
+	u64 asel;
+
+	if (dir == DMA_DEV_TO_MEM) {
+		dev_addr = uc->cfg.src_addr;
+		dev_width = uc->cfg.src_addr_width;
+		burst = uc->cfg.src_maxburst;
+		port_window = uc->cfg.src_port_window_size;
+	} else if (dir == DMA_MEM_TO_DEV) {
+		dev_addr = uc->cfg.dst_addr;
+		dev_width = uc->cfg.dst_addr_width;
+		burst = uc->cfg.dst_maxburst;
+		port_window = uc->cfg.dst_port_window_size;
+	} else {
+		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
+		return NULL;
+	}
+
+	if (!burst)
+		burst = 1;
+
+	if (port_window) {
+		if (port_window != burst) {
+			dev_err(uc->ud->dev,
+				"The burst must be equal to port_window\n");
+			return NULL;
+		}
+
+		tr_cnt0 = dev_width * port_window;
+		tr_cnt1 = 1;
+	} else {
+		tr_cnt0 = dev_width;
+		tr_cnt1 = burst;
+	}
+	trigger_size = tr_cnt0 * tr_cnt1;
+
+	/* estimate the number of TRs we will need */
+	for_each_sg(sgl, sgent, sglen, i) {
+		sg_len = sg_dma_len(sgent);
+
+		if (sg_len % trigger_size) {
+			dev_err(uc->ud->dev,
+				"Not aligned SG entry (%zu for %u)\n", sg_len,
+				trigger_size);
+			return NULL;
+		}
+
+		if (sg_len / trigger_size < SZ_64K)
+			num_tr++;
+		else
+			num_tr += 2;
+	}
+
+	/* Now allocate and setup the descriptor. */
+	tr_size = sizeof(struct cppi5_tr_type15_t);
+	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
+	if (!d)
+		return NULL;
+
+	d->sglen = sglen;
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA) {
+		asel = 0;
+		csf |= CPPI5_TR_CSF_EOL_ICNT0;
+	} else {
+		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+		dev_addr |= asel;
+	}
+
+	tr_req = d->hwdesc[0].tr_req_base;
+	for_each_sg(sgl, sgent, sglen, i) {
+		u16 tr0_cnt2, tr0_cnt3, tr1_cnt2;
+		dma_addr_t sg_addr = sg_dma_address(sgent);
+
+		sg_len = sg_dma_len(sgent);
+		num_tr = udma_get_tr_counters(sg_len / trigger_size, 0,
+					      &tr0_cnt2, &tr0_cnt3, &tr1_cnt2);
+		if (num_tr < 0) {
+			dev_err(uc->ud->dev, "size %zu is not supported\n",
+				sg_len);
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15, false,
+			      true, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+		cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
+		cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
+				     uc->config.tr_trigger_type,
+				     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC, 0, 0);
+
+		sg_addr |= asel;
+		if (dir == DMA_DEV_TO_MEM) {
+			tr_req[tr_idx].addr = dev_addr;
+			tr_req[tr_idx].icnt0 = tr_cnt0;
+			tr_req[tr_idx].icnt1 = tr_cnt1;
+			tr_req[tr_idx].icnt2 = tr0_cnt2;
+			tr_req[tr_idx].icnt3 = tr0_cnt3;
+			tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
+
+			tr_req[tr_idx].daddr = sg_addr;
+			tr_req[tr_idx].dicnt0 = tr_cnt0;
+			tr_req[tr_idx].dicnt1 = tr_cnt1;
+			tr_req[tr_idx].dicnt2 = tr0_cnt2;
+			tr_req[tr_idx].dicnt3 = tr0_cnt3;
+			tr_req[tr_idx].ddim1 = tr_cnt0;
+			tr_req[tr_idx].ddim2 = trigger_size;
+			tr_req[tr_idx].ddim3 = trigger_size * tr0_cnt2;
+		} else {
+			tr_req[tr_idx].addr = sg_addr;
+			tr_req[tr_idx].icnt0 = tr_cnt0;
+			tr_req[tr_idx].icnt1 = tr_cnt1;
+			tr_req[tr_idx].icnt2 = tr0_cnt2;
+			tr_req[tr_idx].icnt3 = tr0_cnt3;
+			tr_req[tr_idx].dim1 = tr_cnt0;
+			tr_req[tr_idx].dim2 = trigger_size;
+			tr_req[tr_idx].dim3 = trigger_size * tr0_cnt2;
+
+			tr_req[tr_idx].daddr = dev_addr;
+			tr_req[tr_idx].dicnt0 = tr_cnt0;
+			tr_req[tr_idx].dicnt1 = tr_cnt1;
+			tr_req[tr_idx].dicnt2 = tr0_cnt2;
+			tr_req[tr_idx].dicnt3 = tr0_cnt3;
+			tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
+		}
+
+		tr_idx++;
+
+		if (num_tr == 2) {
+			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15,
+				      false, true,
+				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
+			cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
+					     uc->config.tr_trigger_type,
+					     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC,
+					     0, 0);
+
+			sg_addr += trigger_size * tr0_cnt2 * tr0_cnt3;
+			if (dir == DMA_DEV_TO_MEM) {
+				tr_req[tr_idx].addr = dev_addr;
+				tr_req[tr_idx].icnt0 = tr_cnt0;
+				tr_req[tr_idx].icnt1 = tr_cnt1;
+				tr_req[tr_idx].icnt2 = tr1_cnt2;
+				tr_req[tr_idx].icnt3 = 1;
+				tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
+
+				tr_req[tr_idx].daddr = sg_addr;
+				tr_req[tr_idx].dicnt0 = tr_cnt0;
+				tr_req[tr_idx].dicnt1 = tr_cnt1;
+				tr_req[tr_idx].dicnt2 = tr1_cnt2;
+				tr_req[tr_idx].dicnt3 = 1;
+				tr_req[tr_idx].ddim1 = tr_cnt0;
+				tr_req[tr_idx].ddim2 = trigger_size;
+			} else {
+				tr_req[tr_idx].addr = sg_addr;
+				tr_req[tr_idx].icnt0 = tr_cnt0;
+				tr_req[tr_idx].icnt1 = tr_cnt1;
+				tr_req[tr_idx].icnt2 = tr1_cnt2;
+				tr_req[tr_idx].icnt3 = 1;
+				tr_req[tr_idx].dim1 = tr_cnt0;
+				tr_req[tr_idx].dim2 = trigger_size;
+
+				tr_req[tr_idx].daddr = dev_addr;
+				tr_req[tr_idx].dicnt0 = tr_cnt0;
+				tr_req[tr_idx].dicnt1 = tr_cnt1;
+				tr_req[tr_idx].dicnt2 = tr1_cnt2;
+				tr_req[tr_idx].dicnt3 = 1;
+				tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
+			}
+			tr_idx++;
+		}
+
+		d->residue += sg_len;
+	}
+
+	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags, csf | CPPI5_TR_CSF_EOP);
+
+	return d;
+}
+
+int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
+			    enum dma_slave_buswidth dev_width,
+			    u16 elcnt)
+{
+	if (uc->config.ep_type != PSIL_EP_PDMA_XY)
+		return 0;
+
+	/* Bus width translates to the element size (ES) */
+	switch (dev_width) {
+	case DMA_SLAVE_BUSWIDTH_1_BYTE:
+		d->static_tr.elsize = 0;
+		break;
+	case DMA_SLAVE_BUSWIDTH_2_BYTES:
+		d->static_tr.elsize = 1;
+		break;
+	case DMA_SLAVE_BUSWIDTH_3_BYTES:
+		d->static_tr.elsize = 2;
+		break;
+	case DMA_SLAVE_BUSWIDTH_4_BYTES:
+		d->static_tr.elsize = 3;
+		break;
+	case DMA_SLAVE_BUSWIDTH_8_BYTES:
+		d->static_tr.elsize = 4;
+		break;
+	default: /* not reached */
+		return -EINVAL;
+	}
+
+	d->static_tr.elcnt = elcnt;
+
+	if (uc->config.pkt_mode || !uc->cyclic) {
+		/*
+		 * PDMA must close the packet when the channel is in packet mode.
+		 * For TR mode when the channel is not cyclic we also need PDMA
+		 * to close the packet otherwise the transfer will stall because
+		 * PDMA holds on the data it has received from the peripheral.
+		 */
+		unsigned int div = dev_width * elcnt;
+
+		if (uc->cyclic)
+			d->static_tr.bstcnt = d->residue / d->sglen / div;
+		else
+			d->static_tr.bstcnt = d->residue / div;
+	} else if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
+		   uc->config.dir == DMA_DEV_TO_MEM &&
+		   uc->cyclic) {
+		/*
+		 * For cyclic mode with BCDMA we have to set EOP in each TR to
+		 * prevent short packet errors seen on channel teardown. So the
+		 * PDMA must close the packet after every TR transfer by setting
+		 * burst count equal to the number of bytes transferred.
+		 */
+		struct cppi5_tr_type1_t *tr_req = d->hwdesc[0].tr_req_base;
+
+		d->static_tr.bstcnt =
+			(tr_req->icnt0 * tr_req->icnt1) / dev_width;
+	} else {
+		d->static_tr.bstcnt = 0;
+	}
+
+	if (uc->config.dir == DMA_DEV_TO_MEM &&
+	    d->static_tr.bstcnt > uc->ud->match_data->statictr_z_mask)
+		return -EINVAL;
+
+	return 0;
+}
+
+struct udma_desc *
+udma_prep_slave_sg_pkt(struct udma_chan *uc, struct scatterlist *sgl,
+		       unsigned int sglen, enum dma_transfer_direction dir,
+		       unsigned long tx_flags, void *context)
+{
+	struct scatterlist *sgent;
+	struct cppi5_host_desc_t *h_desc = NULL;
+	struct udma_desc *d;
+	u32 ring_id;
+	unsigned int i;
+	u64 asel;
+
+	d = kzalloc(struct_size(d, hwdesc, sglen), GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->sglen = sglen;
+	d->hwdesc_count = sglen;
+
+	if (dir == DMA_DEV_TO_MEM)
+		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
+	else
+		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
+		asel = 0;
+	else
+		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+
+	for_each_sg(sgl, sgent, sglen, i) {
+		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
+		dma_addr_t sg_addr = sg_dma_address(sgent);
+		struct cppi5_host_desc_t *desc;
+		size_t sg_len = sg_dma_len(sgent);
+
+		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
+							   GFP_NOWAIT,
+							   &hwdesc->cppi5_desc_paddr);
+		if (!hwdesc->cppi5_desc_vaddr) {
+			dev_err(uc->ud->dev,
+				"descriptor%d allocation failed\n", i);
+
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		d->residue += sg_len;
+		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
+		desc = hwdesc->cppi5_desc_vaddr;
+
+		if (i == 0) {
+			cppi5_hdesc_init(desc, 0, 0);
+			/* Flow and Packed ID */
+			cppi5_desc_set_pktids(&desc->hdr, uc->id,
+					      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+			cppi5_desc_set_retpolicy(&desc->hdr, 0, ring_id);
+		} else {
+			cppi5_hdesc_reset_hbdesc(desc);
+			cppi5_desc_set_retpolicy(&desc->hdr, 0, 0xffff);
+		}
+
+		/* attach the sg buffer to the descriptor */
+		sg_addr |= asel;
+		cppi5_hdesc_attach_buf(desc, sg_addr, sg_len, sg_addr, sg_len);
+
+		/* Attach link as host buffer descriptor */
+		if (h_desc)
+			cppi5_hdesc_link_hbdesc(h_desc,
+						hwdesc->cppi5_desc_paddr | asel);
+
+		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA ||
+		    dir == DMA_MEM_TO_DEV)
+			h_desc = desc;
+	}
+
+	if (d->residue >= SZ_4M) {
+		dev_err(uc->ud->dev,
+			"%s: Transfer size %u is over the supported 4M range\n",
+			__func__, d->residue);
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return NULL;
+	}
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+	cppi5_hdesc_set_pktlen(h_desc, d->residue);
+
+	return d;
+}
+
+int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+			 void *data, size_t len)
+{
+	struct udma_desc *d = to_udma_desc(desc);
+	struct udma_chan *uc = to_udma_chan(desc->chan);
+	struct cppi5_host_desc_t *h_desc;
+	u32 psd_size = len;
+	u32 flags = 0;
+
+	if (!uc->config.pkt_mode || !uc->config.metadata_size)
+		return -EOPNOTSUPP;
+
+	if (!data || len > uc->config.metadata_size)
+		return -EINVAL;
+
+	if (uc->config.needs_epib && len < CPPI5_INFO0_HDESC_EPIB_SIZE)
+		return -EINVAL;
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+	if (d->dir == DMA_MEM_TO_DEV)
+		memcpy(h_desc->epib, data, len);
+
+	if (uc->config.needs_epib)
+		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
+
+	d->metadata = data;
+	d->metadata_size = len;
+	if (uc->config.needs_epib)
+		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
+
+	cppi5_hdesc_update_flags(h_desc, flags);
+	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
+
+	return 0;
+}
+
+void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+			    size_t *payload_len, size_t *max_len)
+{
+	struct udma_desc *d = to_udma_desc(desc);
+	struct udma_chan *uc = to_udma_chan(desc->chan);
+	struct cppi5_host_desc_t *h_desc;
+
+	if (!uc->config.pkt_mode || !uc->config.metadata_size)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	*max_len = uc->config.metadata_size;
+
+	*payload_len = cppi5_hdesc_epib_present(&h_desc->hdr) ?
+		       CPPI5_INFO0_HDESC_EPIB_SIZE : 0;
+	*payload_len += cppi5_hdesc_get_psdata_size(h_desc);
+
+	return h_desc->epib;
+}
+
+int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+			  size_t payload_len)
+{
+	struct udma_desc *d = to_udma_desc(desc);
+	struct udma_chan *uc = to_udma_chan(desc->chan);
+	struct cppi5_host_desc_t *h_desc;
+	u32 psd_size = payload_len;
+	u32 flags = 0;
+
+	if (!uc->config.pkt_mode || !uc->config.metadata_size)
+		return -EOPNOTSUPP;
+
+	if (payload_len > uc->config.metadata_size)
+		return -EINVAL;
+
+	if (uc->config.needs_epib && payload_len < CPPI5_INFO0_HDESC_EPIB_SIZE)
+		return -EINVAL;
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	if (uc->config.needs_epib) {
+		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
+		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
+	}
+
+	cppi5_hdesc_update_flags(h_desc, flags);
+	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
+
+	return 0;
+}
+
+struct dma_async_tx_descriptor *
+udma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
+		   unsigned int sglen, enum dma_transfer_direction dir,
+		   unsigned long tx_flags, void *context)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	enum dma_slave_buswidth dev_width;
+	struct udma_desc *d;
+	u32 burst;
+
+	if (dir != uc->config.dir &&
+	    (uc->config.dir == DMA_MEM_TO_MEM && !uc->config.tr_trigger_type)) {
+		dev_err(chan->device->dev,
+			"%s: chan%d is for %s, not supporting %s\n",
+			__func__, uc->id,
+			dmaengine_get_direction_text(uc->config.dir),
+			dmaengine_get_direction_text(dir));
+		return NULL;
+	}
+
+	if (dir == DMA_DEV_TO_MEM) {
+		dev_width = uc->cfg.src_addr_width;
+		burst = uc->cfg.src_maxburst;
+	} else if (dir == DMA_MEM_TO_DEV) {
+		dev_width = uc->cfg.dst_addr_width;
+		burst = uc->cfg.dst_maxburst;
+	} else {
+		dev_err(chan->device->dev, "%s: bad direction?\n", __func__);
+		return NULL;
+	}
+
+	if (!burst)
+		burst = 1;
+
+	uc->config.tx_flags = tx_flags;
+
+	if (uc->config.pkt_mode)
+		d = udma_prep_slave_sg_pkt(uc, sgl, sglen, dir, tx_flags,
+					   context);
+	else if (is_slave_direction(uc->config.dir))
+		d = udma_prep_slave_sg_tr(uc, sgl, sglen, dir, tx_flags,
+					  context);
+	else
+		d = udma_prep_slave_sg_triggered_tr(uc, sgl, sglen, dir,
+						    tx_flags, context);
+
+	if (!d)
+		return NULL;
+
+	d->dir = dir;
+	d->desc_idx = 0;
+	d->tr_idx = 0;
+
+	/* static TR for remote PDMA */
+	if (udma_configure_statictr(uc, d, dev_width, burst)) {
+		dev_err(uc->ud->dev,
+			"%s: StaticTR Z is limited to maximum %u (%u)\n",
+			__func__, uc->ud->match_data->statictr_z_mask,
+			d->static_tr.bstcnt);
+
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return NULL;
+	}
+
+	if (uc->config.metadata_size)
+		d->vd.tx.metadata_ops = &metadata_ops;
+
+	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
+}
+EXPORT_SYMBOL_GPL(udma_prep_slave_sg);
+
+struct udma_desc *
+udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
+			size_t buf_len, size_t period_len,
+			enum dma_transfer_direction dir, unsigned long flags)
+{
+	struct udma_desc *d;
+	size_t tr_size, period_addr;
+	struct cppi5_tr_type1_t *tr_req;
+	unsigned int periods = buf_len / period_len;
+	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
+	unsigned int i;
+	int num_tr;
+	u32 period_csf = 0;
+
+	num_tr = udma_get_tr_counters(period_len, __ffs(buf_addr), &tr0_cnt0,
+				      &tr0_cnt1, &tr1_cnt0);
+	if (num_tr < 0) {
+		dev_err(uc->ud->dev, "size %zu is not supported\n",
+			period_len);
+		return NULL;
+	}
+
+	/* Now allocate and setup the descriptor. */
+	tr_size = sizeof(struct cppi5_tr_type1_t);
+	d = udma_alloc_tr_desc(uc, tr_size, periods * num_tr, dir);
+	if (!d)
+		return NULL;
+
+	tr_req = d->hwdesc[0].tr_req_base;
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
+		period_addr = buf_addr;
+	else
+		period_addr = buf_addr |
+			((u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT);
+
+	/*
+	 * For BCDMA <-> PDMA transfers, the EOP flag needs to be set on the
+	 * last TR of a descriptor, to mark the packet as complete.
+	 * This is required for getting the teardown completion message in case
+	 * of TX, and to avoid short-packet error in case of RX.
+	 *
+	 * As we are in cyclic mode, we do not know which period might be the
+	 * last one, so set the flag for each period.
+	 */
+	if (uc->config.ep_type == PSIL_EP_PDMA_XY &&
+	    uc->ud->match_data->type == DMA_TYPE_BCDMA) {
+		period_csf = CPPI5_TR_CSF_EOP;
+	}
+
+	for (i = 0; i < periods; i++) {
+		int tr_idx = i * num_tr;
+
+		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
+			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+
+		tr_req[tr_idx].addr = period_addr;
+		tr_req[tr_idx].icnt0 = tr0_cnt0;
+		tr_req[tr_idx].icnt1 = tr0_cnt1;
+		tr_req[tr_idx].dim1 = tr0_cnt0;
+
+		if (num_tr == 2) {
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
+					 CPPI5_TR_CSF_SUPR_EVT);
+			tr_idx++;
+
+			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
+				      false, false,
+				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+
+			tr_req[tr_idx].addr = period_addr + tr0_cnt1 * tr0_cnt0;
+			tr_req[tr_idx].icnt0 = tr1_cnt0;
+			tr_req[tr_idx].icnt1 = 1;
+			tr_req[tr_idx].dim1 = tr1_cnt0;
+		}
+
+		if (!(flags & DMA_PREP_INTERRUPT))
+			period_csf |= CPPI5_TR_CSF_SUPR_EVT;
+
+		if (period_csf)
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags, period_csf);
+
+		period_addr += period_len;
+	}
+
+	return d;
+}
+
+struct udma_desc *
+udma_prep_dma_cyclic_pkt(struct udma_chan *uc, dma_addr_t buf_addr,
+			 size_t buf_len, size_t period_len,
+			 enum dma_transfer_direction dir, unsigned long flags)
+{
+	struct udma_desc *d;
+	u32 ring_id;
+	int i;
+	int periods = buf_len / period_len;
+
+	if (periods > (K3_UDMA_DEFAULT_RING_SIZE - 1))
+		return NULL;
+
+	if (period_len >= SZ_4M)
+		return NULL;
+
+	d = kzalloc(struct_size(d, hwdesc, periods), GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->hwdesc_count = periods;
+
+	/* TODO: re-check this... */
+	if (dir == DMA_DEV_TO_MEM)
+		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
+	else
+		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
+
+	if (uc->ud->match_data->type != DMA_TYPE_UDMA)
+		buf_addr |= (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+
+	for (i = 0; i < periods; i++) {
+		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
+		dma_addr_t period_addr = buf_addr + (period_len * i);
+		struct cppi5_host_desc_t *h_desc;
+
+		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
+							   GFP_NOWAIT,
+							   &hwdesc->cppi5_desc_paddr);
+		if (!hwdesc->cppi5_desc_vaddr) {
+			dev_err(uc->ud->dev,
+				"descriptor%d allocation failed\n", i);
+
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
+		h_desc = hwdesc->cppi5_desc_vaddr;
+
+		cppi5_hdesc_init(h_desc, 0, 0);
+		cppi5_hdesc_set_pktlen(h_desc, period_len);
+
+		/* Flow and Packed ID */
+		cppi5_desc_set_pktids(&h_desc->hdr, uc->id,
+				      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+		cppi5_desc_set_retpolicy(&h_desc->hdr, 0, ring_id);
+
+		/* attach each period to a new descriptor */
+		cppi5_hdesc_attach_buf(h_desc,
+				       period_addr, period_len,
+				       period_addr, period_len);
+	}
+
+	return d;
+}
+
+struct dma_async_tx_descriptor *
+udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
+		     size_t period_len, enum dma_transfer_direction dir,
+		     unsigned long flags)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	enum dma_slave_buswidth dev_width;
+	struct udma_desc *d;
+	u32 burst;
+
+	if (dir != uc->config.dir) {
+		dev_err(chan->device->dev,
+			"%s: chan%d is for %s, not supporting %s\n",
+			__func__, uc->id,
+			dmaengine_get_direction_text(uc->config.dir),
+			dmaengine_get_direction_text(dir));
+		return NULL;
+	}
+
+	uc->cyclic = true;
+
+	if (dir == DMA_DEV_TO_MEM) {
+		dev_width = uc->cfg.src_addr_width;
+		burst = uc->cfg.src_maxburst;
+	} else if (dir == DMA_MEM_TO_DEV) {
+		dev_width = uc->cfg.dst_addr_width;
+		burst = uc->cfg.dst_maxburst;
+	} else {
+		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
+		return NULL;
+	}
+
+	if (!burst)
+		burst = 1;
+
+	if (uc->config.pkt_mode)
+		d = udma_prep_dma_cyclic_pkt(uc, buf_addr, buf_len, period_len,
+					     dir, flags);
+	else
+		d = udma_prep_dma_cyclic_tr(uc, buf_addr, buf_len, period_len,
+					    dir, flags);
+
+	if (!d)
+		return NULL;
+
+	d->sglen = buf_len / period_len;
+
+	d->dir = dir;
+	d->residue = buf_len;
+
+	/* static TR for remote PDMA */
+	if (udma_configure_statictr(uc, d, dev_width, burst)) {
+		dev_err(uc->ud->dev,
+			"%s: StaticTR Z is limited to maximum %u (%u)\n",
+			__func__, uc->ud->match_data->statictr_z_mask,
+			d->static_tr.bstcnt);
+
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return NULL;
+	}
+
+	if (uc->config.metadata_size)
+		d->vd.tx.metadata_ops = &metadata_ops;
+
+	return vchan_tx_prep(&uc->vc, &d->vd, flags);
+}
+EXPORT_SYMBOL_GPL(udma_prep_dma_cyclic);
+
+struct dma_async_tx_descriptor *
+udma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
+		     size_t len, unsigned long tx_flags)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_desc *d;
+	struct cppi5_tr_type15_t *tr_req;
+	int num_tr;
+	size_t tr_size = sizeof(struct cppi5_tr_type15_t);
+	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
+	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
+
+	if (uc->config.dir != DMA_MEM_TO_MEM) {
+		dev_err(chan->device->dev,
+			"%s: chan%d is for %s, not supporting %s\n",
+			__func__, uc->id,
+			dmaengine_get_direction_text(uc->config.dir),
+			dmaengine_get_direction_text(DMA_MEM_TO_MEM));
+		return NULL;
+	}
+
+	num_tr = udma_get_tr_counters(len, __ffs(src | dest), &tr0_cnt0,
+				      &tr0_cnt1, &tr1_cnt0);
+	if (num_tr < 0) {
+		dev_err(uc->ud->dev, "size %zu is not supported\n",
+			len);
+		return NULL;
+	}
+
+	d = udma_alloc_tr_desc(uc, tr_size, num_tr, DMA_MEM_TO_MEM);
+	if (!d)
+		return NULL;
+
+	d->dir = DMA_MEM_TO_MEM;
+	d->desc_idx = 0;
+	d->tr_idx = 0;
+	d->residue = len;
+
+	if (uc->ud->match_data->type != DMA_TYPE_UDMA) {
+		src |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
+		dest |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
+	} else {
+		csf |= CPPI5_TR_CSF_EOL_ICNT0;
+	}
+
+	tr_req = d->hwdesc[0].tr_req_base;
+
+	cppi5_tr_init(&tr_req[0].flags, CPPI5_TR_TYPE15, false, true,
+		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+	cppi5_tr_csf_set(&tr_req[0].flags, csf);
+
+	tr_req[0].addr = src;
+	tr_req[0].icnt0 = tr0_cnt0;
+	tr_req[0].icnt1 = tr0_cnt1;
+	tr_req[0].icnt2 = 1;
+	tr_req[0].icnt3 = 1;
+	tr_req[0].dim1 = tr0_cnt0;
+
+	tr_req[0].daddr = dest;
+	tr_req[0].dicnt0 = tr0_cnt0;
+	tr_req[0].dicnt1 = tr0_cnt1;
+	tr_req[0].dicnt2 = 1;
+	tr_req[0].dicnt3 = 1;
+	tr_req[0].ddim1 = tr0_cnt0;
+
+	if (num_tr == 2) {
+		cppi5_tr_init(&tr_req[1].flags, CPPI5_TR_TYPE15, false, true,
+			      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+		cppi5_tr_csf_set(&tr_req[1].flags, csf);
+
+		tr_req[1].addr = src + tr0_cnt1 * tr0_cnt0;
+		tr_req[1].icnt0 = tr1_cnt0;
+		tr_req[1].icnt1 = 1;
+		tr_req[1].icnt2 = 1;
+		tr_req[1].icnt3 = 1;
+
+		tr_req[1].daddr = dest + tr0_cnt1 * tr0_cnt0;
+		tr_req[1].dicnt0 = tr1_cnt0;
+		tr_req[1].dicnt1 = 1;
+		tr_req[1].dicnt2 = 1;
+		tr_req[1].dicnt3 = 1;
+	}
+
+	cppi5_tr_csf_set(&tr_req[num_tr - 1].flags, csf | CPPI5_TR_CSF_EOP);
+
+	if (uc->config.metadata_size)
+		d->vd.tx.metadata_ops = &metadata_ops;
+
+	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
+}
+EXPORT_SYMBOL_GPL(udma_prep_dma_memcpy);
+
+void udma_desc_pre_callback(struct virt_dma_chan *vc,
+			    struct virt_dma_desc *vd,
+			    struct dmaengine_result *result)
+{
+	struct udma_chan *uc = to_udma_chan(&vc->chan);
+	struct udma_desc *d;
+	u8 status;
+
+	if (!vd)
+		return;
+
+	d = to_udma_desc(&vd->tx);
+
+	if (d->metadata_size)
+		udma_fetch_epib(uc, d);
+
+	if (result) {
+		void *desc_vaddr = udma_curr_cppi5_desc_vaddr(d, d->desc_idx);
+
+		if (cppi5_desc_get_type(desc_vaddr) ==
+		    CPPI5_INFO0_DESC_TYPE_VAL_HOST) {
+			/* Provide residue information for the client */
+			result->residue = d->residue -
+					  cppi5_hdesc_get_pktlen(desc_vaddr);
+			if (result->residue)
+				result->result = DMA_TRANS_ABORTED;
+			else
+				result->result = DMA_TRANS_NOERROR;
+		} else {
+			result->residue = 0;
+			/* Propagate TR Response errors to the client */
+			status = d->hwdesc[0].tr_resp_base->status;
+			if (status)
+				result->result = DMA_TRANS_ABORTED;
+			else
+				result->result = DMA_TRANS_NOERROR;
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
+
+MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 5336ec9fe79ce..a8fe919f307f6 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -131,105 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
-						   dma_addr_t paddr)
-{
-	struct udma_desc *d = uc->terminated_desc;
-
-	if (d) {
-		dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
-								   d->desc_idx);
-
-		if (desc_paddr != paddr)
-			d = NULL;
-	}
-
-	if (!d) {
-		d = uc->desc;
-		if (d) {
-			dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
-								d->desc_idx);
-
-			if (desc_paddr != paddr)
-				d = NULL;
-		}
-	}
-
-	return d;
-}
-
-static void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
-{
-	if (uc->use_dma_pool) {
-		int i;
-
-		for (i = 0; i < d->hwdesc_count; i++) {
-			if (!d->hwdesc[i].cppi5_desc_vaddr)
-				continue;
-
-			dma_pool_free(uc->hdesc_pool,
-				      d->hwdesc[i].cppi5_desc_vaddr,
-				      d->hwdesc[i].cppi5_desc_paddr);
-
-			d->hwdesc[i].cppi5_desc_vaddr = NULL;
-		}
-	} else if (d->hwdesc[0].cppi5_desc_vaddr) {
-		dma_free_coherent(uc->dma_dev, d->hwdesc[0].cppi5_desc_size,
-				  d->hwdesc[0].cppi5_desc_vaddr,
-				  d->hwdesc[0].cppi5_desc_paddr);
-
-		d->hwdesc[0].cppi5_desc_vaddr = NULL;
-	}
-}
-
-static void udma_purge_desc_work(struct work_struct *work)
-{
-	struct udma_dev *ud = container_of(work, typeof(*ud), purge_work);
-	struct virt_dma_desc *vd, *_vd;
-	unsigned long flags;
-	LIST_HEAD(head);
-
-	spin_lock_irqsave(&ud->lock, flags);
-	list_splice_tail_init(&ud->desc_to_purge, &head);
-	spin_unlock_irqrestore(&ud->lock, flags);
-
-	list_for_each_entry_safe(vd, _vd, &head, node) {
-		struct udma_chan *uc = to_udma_chan(vd->tx.chan);
-		struct udma_desc *d = to_udma_desc(&vd->tx);
-
-		udma_free_hwdesc(uc, d);
-		list_del(&vd->node);
-		kfree(d);
-	}
-
-	/* If more to purge, schedule the work again */
-	if (!list_empty(&ud->desc_to_purge))
-		schedule_work(&ud->purge_work);
-}
-
-static void udma_desc_free(struct virt_dma_desc *vd)
-{
-	struct udma_dev *ud = to_udma_dev(vd->tx.chan->device);
-	struct udma_chan *uc = to_udma_chan(vd->tx.chan);
-	struct udma_desc *d = to_udma_desc(&vd->tx);
-	unsigned long flags;
-
-	if (uc->terminated_desc == d)
-		uc->terminated_desc = NULL;
-
-	if (uc->use_dma_pool) {
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return;
-	}
-
-	spin_lock_irqsave(&ud->lock, flags);
-	list_add_tail(&vd->node, &ud->desc_to_purge);
-	spin_unlock_irqrestore(&ud->lock, flags);
-
-	schedule_work(&ud->purge_work);
-}
-
 static bool udma_is_chan_running(struct udma_chan *uc)
 {
 	u32 trt_ctl = 0;
@@ -303,17 +204,6 @@ static int udma_push_to_ring(struct udma_chan *uc, int idx)
 	return k3_ringacc_ring_push(ring, &paddr);
 }
 
-static bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
-{
-	if (uc->config.dir != DMA_DEV_TO_MEM)
-		return false;
-
-	if (addr == udma_get_rx_flush_hwdesc_paddr(uc))
-		return true;
-
-	return false;
-}
-
 static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
 {
 	struct k3_ring *ring = NULL;
@@ -674,33 +564,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
-{
-	u32 peer_bcnt, bcnt;
-
-	/*
-	 * Only TX towards PDMA is affected.
-	 * If DMA_PREP_INTERRUPT is not set by consumer then skip the transfer
-	 * completion calculation, consumer must ensure that there is no stale
-	 * data in DMA fabric in this case.
-	 */
-	if (uc->config.ep_type == PSIL_EP_NATIVE ||
-	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
-		return true;
-
-	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
-	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
-
-	/* Transfer is incomplete, store current residue and time stamp */
-	if (peer_bcnt < bcnt) {
-		uc->tx_drain.residue = bcnt - peer_bcnt;
-		uc->tx_drain.tstamp = ktime_get();
-		return false;
-	}
-
-	return true;
-}
-
 static void udma_check_tx_completion(struct work_struct *work)
 {
 	struct udma_chan *uc = container_of(work, typeof(*uc),
@@ -2344,1047 +2207,6 @@ static int udma_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
-static struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
-					    size_t tr_size, int tr_count,
-					    enum dma_transfer_direction dir)
-{
-	struct udma_hwdesc *hwdesc;
-	struct cppi5_desc_hdr_t *tr_desc;
-	struct udma_desc *d;
-	u32 reload_count = 0;
-	u32 ring_id;
-
-	switch (tr_size) {
-	case 16:
-	case 32:
-	case 64:
-	case 128:
-		break;
-	default:
-		dev_err(uc->ud->dev, "Unsupported TR size of %zu\n", tr_size);
-		return NULL;
-	}
-
-	/* We have only one descriptor containing multiple TRs */
-	d = kzalloc(sizeof(*d) + sizeof(d->hwdesc[0]), GFP_NOWAIT);
-	if (!d)
-		return NULL;
-
-	d->sglen = tr_count;
-
-	d->hwdesc_count = 1;
-	hwdesc = &d->hwdesc[0];
-
-	/* Allocate memory for DMA ring descriptor */
-	if (uc->use_dma_pool) {
-		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
-		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
-						GFP_NOWAIT,
-						&hwdesc->cppi5_desc_paddr);
-	} else {
-		hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size,
-								 tr_count);
-		hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
-						uc->ud->desc_align);
-		hwdesc->cppi5_desc_vaddr = dma_alloc_coherent(uc->ud->dev,
-						hwdesc->cppi5_desc_size,
-						&hwdesc->cppi5_desc_paddr,
-						GFP_NOWAIT);
-	}
-
-	if (!hwdesc->cppi5_desc_vaddr) {
-		kfree(d);
-		return NULL;
-	}
-
-	/* Start of the TR req records */
-	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
-	/* Start address of the TR response array */
-	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size * tr_count;
-
-	tr_desc = hwdesc->cppi5_desc_vaddr;
-
-	if (uc->cyclic)
-		reload_count = CPPI5_INFO0_TRDESC_RLDCNT_INFINITE;
-
-	if (dir == DMA_DEV_TO_MEM)
-		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
-	else
-		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
-
-	cppi5_trdesc_init(tr_desc, tr_count, tr_size, 0, reload_count);
-	cppi5_desc_set_pktids(tr_desc, uc->id,
-			      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-	cppi5_desc_set_retpolicy(tr_desc, 0, ring_id);
-
-	return d;
-}
-
-/**
- * udma_get_tr_counters - calculate TR counters for a given length
- * @len: Length of the trasnfer
- * @align_to: Preferred alignment
- * @tr0_cnt0: First TR icnt0
- * @tr0_cnt1: First TR icnt1
- * @tr1_cnt0: Second (if used) TR icnt0
- *
- * For len < SZ_64K only one TR is enough, tr1_cnt0 is not updated
- * For len >= SZ_64K two TRs are used in a simple way:
- * First TR: SZ_64K-alignment blocks (tr0_cnt0, tr0_cnt1)
- * Second TR: the remaining length (tr1_cnt0)
- *
- * Returns the number of TRs the length needs (1 or 2)
- * -EINVAL if the length can not be supported
- */
-static int udma_get_tr_counters(size_t len, unsigned long align_to,
-				u16 *tr0_cnt0, u16 *tr0_cnt1, u16 *tr1_cnt0)
-{
-	if (len < SZ_64K) {
-		*tr0_cnt0 = len;
-		*tr0_cnt1 = 1;
-
-		return 1;
-	}
-
-	if (align_to > 3)
-		align_to = 3;
-
-realign:
-	*tr0_cnt0 = SZ_64K - BIT(align_to);
-	if (len / *tr0_cnt0 >= SZ_64K) {
-		if (align_to) {
-			align_to--;
-			goto realign;
-		}
-		return -EINVAL;
-	}
-
-	*tr0_cnt1 = len / *tr0_cnt0;
-	*tr1_cnt0 = len % *tr0_cnt0;
-
-	return 2;
-}
-
-static struct udma_desc *
-udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
-		      unsigned int sglen, enum dma_transfer_direction dir,
-		      unsigned long tx_flags, void *context)
-{
-	struct scatterlist *sgent;
-	struct udma_desc *d;
-	struct cppi5_tr_type1_t *tr_req = NULL;
-	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
-	unsigned int i;
-	size_t tr_size;
-	int num_tr = 0;
-	int tr_idx = 0;
-	u64 asel;
-
-	/* estimate the number of TRs we will need */
-	for_each_sg(sgl, sgent, sglen, i) {
-		if (sg_dma_len(sgent) < SZ_64K)
-			num_tr++;
-		else
-			num_tr += 2;
-	}
-
-	/* Now allocate and setup the descriptor. */
-	tr_size = sizeof(struct cppi5_tr_type1_t);
-	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
-	if (!d)
-		return NULL;
-
-	d->sglen = sglen;
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
-		asel = 0;
-	else
-		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-
-	tr_req = d->hwdesc[0].tr_req_base;
-	for_each_sg(sgl, sgent, sglen, i) {
-		dma_addr_t sg_addr = sg_dma_address(sgent);
-
-		num_tr = udma_get_tr_counters(sg_dma_len(sgent), __ffs(sg_addr),
-					      &tr0_cnt0, &tr0_cnt1, &tr1_cnt0);
-		if (num_tr < 0) {
-			dev_err(uc->ud->dev, "size %u is not supported\n",
-				sg_dma_len(sgent));
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
-			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
-
-		sg_addr |= asel;
-		tr_req[tr_idx].addr = sg_addr;
-		tr_req[tr_idx].icnt0 = tr0_cnt0;
-		tr_req[tr_idx].icnt1 = tr0_cnt1;
-		tr_req[tr_idx].dim1 = tr0_cnt0;
-		tr_idx++;
-
-		if (num_tr == 2) {
-			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
-				      false, false,
-				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
-					 CPPI5_TR_CSF_SUPR_EVT);
-
-			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
-			tr_req[tr_idx].icnt0 = tr1_cnt0;
-			tr_req[tr_idx].icnt1 = 1;
-			tr_req[tr_idx].dim1 = tr1_cnt0;
-			tr_idx++;
-		}
-
-		d->residue += sg_dma_len(sgent);
-	}
-
-	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags,
-			 CPPI5_TR_CSF_SUPR_EVT | CPPI5_TR_CSF_EOP);
-
-	return d;
-}
-
-static struct udma_desc *
-udma_prep_slave_sg_triggered_tr(struct udma_chan *uc, struct scatterlist *sgl,
-				unsigned int sglen,
-				enum dma_transfer_direction dir,
-				unsigned long tx_flags, void *context)
-{
-	struct scatterlist *sgent;
-	struct cppi5_tr_type15_t *tr_req = NULL;
-	enum dma_slave_buswidth dev_width;
-	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
-	u16 tr_cnt0, tr_cnt1;
-	dma_addr_t dev_addr;
-	struct udma_desc *d;
-	unsigned int i;
-	size_t tr_size, sg_len;
-	int num_tr = 0;
-	int tr_idx = 0;
-	u32 burst, trigger_size, port_window;
-	u64 asel;
-
-	if (dir == DMA_DEV_TO_MEM) {
-		dev_addr = uc->cfg.src_addr;
-		dev_width = uc->cfg.src_addr_width;
-		burst = uc->cfg.src_maxburst;
-		port_window = uc->cfg.src_port_window_size;
-	} else if (dir == DMA_MEM_TO_DEV) {
-		dev_addr = uc->cfg.dst_addr;
-		dev_width = uc->cfg.dst_addr_width;
-		burst = uc->cfg.dst_maxburst;
-		port_window = uc->cfg.dst_port_window_size;
-	} else {
-		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
-		return NULL;
-	}
-
-	if (!burst)
-		burst = 1;
-
-	if (port_window) {
-		if (port_window != burst) {
-			dev_err(uc->ud->dev,
-				"The burst must be equal to port_window\n");
-			return NULL;
-		}
-
-		tr_cnt0 = dev_width * port_window;
-		tr_cnt1 = 1;
-	} else {
-		tr_cnt0 = dev_width;
-		tr_cnt1 = burst;
-	}
-	trigger_size = tr_cnt0 * tr_cnt1;
-
-	/* estimate the number of TRs we will need */
-	for_each_sg(sgl, sgent, sglen, i) {
-		sg_len = sg_dma_len(sgent);
-
-		if (sg_len % trigger_size) {
-			dev_err(uc->ud->dev,
-				"Not aligned SG entry (%zu for %u)\n", sg_len,
-				trigger_size);
-			return NULL;
-		}
-
-		if (sg_len / trigger_size < SZ_64K)
-			num_tr++;
-		else
-			num_tr += 2;
-	}
-
-	/* Now allocate and setup the descriptor. */
-	tr_size = sizeof(struct cppi5_tr_type15_t);
-	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
-	if (!d)
-		return NULL;
-
-	d->sglen = sglen;
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA) {
-		asel = 0;
-		csf |= CPPI5_TR_CSF_EOL_ICNT0;
-	} else {
-		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-		dev_addr |= asel;
-	}
-
-	tr_req = d->hwdesc[0].tr_req_base;
-	for_each_sg(sgl, sgent, sglen, i) {
-		u16 tr0_cnt2, tr0_cnt3, tr1_cnt2;
-		dma_addr_t sg_addr = sg_dma_address(sgent);
-
-		sg_len = sg_dma_len(sgent);
-		num_tr = udma_get_tr_counters(sg_len / trigger_size, 0,
-					      &tr0_cnt2, &tr0_cnt3, &tr1_cnt2);
-		if (num_tr < 0) {
-			dev_err(uc->ud->dev, "size %zu is not supported\n",
-				sg_len);
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15, false,
-			      true, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
-		cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
-				     uc->config.tr_trigger_type,
-				     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC, 0, 0);
-
-		sg_addr |= asel;
-		if (dir == DMA_DEV_TO_MEM) {
-			tr_req[tr_idx].addr = dev_addr;
-			tr_req[tr_idx].icnt0 = tr_cnt0;
-			tr_req[tr_idx].icnt1 = tr_cnt1;
-			tr_req[tr_idx].icnt2 = tr0_cnt2;
-			tr_req[tr_idx].icnt3 = tr0_cnt3;
-			tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
-
-			tr_req[tr_idx].daddr = sg_addr;
-			tr_req[tr_idx].dicnt0 = tr_cnt0;
-			tr_req[tr_idx].dicnt1 = tr_cnt1;
-			tr_req[tr_idx].dicnt2 = tr0_cnt2;
-			tr_req[tr_idx].dicnt3 = tr0_cnt3;
-			tr_req[tr_idx].ddim1 = tr_cnt0;
-			tr_req[tr_idx].ddim2 = trigger_size;
-			tr_req[tr_idx].ddim3 = trigger_size * tr0_cnt2;
-		} else {
-			tr_req[tr_idx].addr = sg_addr;
-			tr_req[tr_idx].icnt0 = tr_cnt0;
-			tr_req[tr_idx].icnt1 = tr_cnt1;
-			tr_req[tr_idx].icnt2 = tr0_cnt2;
-			tr_req[tr_idx].icnt3 = tr0_cnt3;
-			tr_req[tr_idx].dim1 = tr_cnt0;
-			tr_req[tr_idx].dim2 = trigger_size;
-			tr_req[tr_idx].dim3 = trigger_size * tr0_cnt2;
-
-			tr_req[tr_idx].daddr = dev_addr;
-			tr_req[tr_idx].dicnt0 = tr_cnt0;
-			tr_req[tr_idx].dicnt1 = tr_cnt1;
-			tr_req[tr_idx].dicnt2 = tr0_cnt2;
-			tr_req[tr_idx].dicnt3 = tr0_cnt3;
-			tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
-		}
-
-		tr_idx++;
-
-		if (num_tr == 2) {
-			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15,
-				      false, true,
-				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
-			cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
-					     uc->config.tr_trigger_type,
-					     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC,
-					     0, 0);
-
-			sg_addr += trigger_size * tr0_cnt2 * tr0_cnt3;
-			if (dir == DMA_DEV_TO_MEM) {
-				tr_req[tr_idx].addr = dev_addr;
-				tr_req[tr_idx].icnt0 = tr_cnt0;
-				tr_req[tr_idx].icnt1 = tr_cnt1;
-				tr_req[tr_idx].icnt2 = tr1_cnt2;
-				tr_req[tr_idx].icnt3 = 1;
-				tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
-
-				tr_req[tr_idx].daddr = sg_addr;
-				tr_req[tr_idx].dicnt0 = tr_cnt0;
-				tr_req[tr_idx].dicnt1 = tr_cnt1;
-				tr_req[tr_idx].dicnt2 = tr1_cnt2;
-				tr_req[tr_idx].dicnt3 = 1;
-				tr_req[tr_idx].ddim1 = tr_cnt0;
-				tr_req[tr_idx].ddim2 = trigger_size;
-			} else {
-				tr_req[tr_idx].addr = sg_addr;
-				tr_req[tr_idx].icnt0 = tr_cnt0;
-				tr_req[tr_idx].icnt1 = tr_cnt1;
-				tr_req[tr_idx].icnt2 = tr1_cnt2;
-				tr_req[tr_idx].icnt3 = 1;
-				tr_req[tr_idx].dim1 = tr_cnt0;
-				tr_req[tr_idx].dim2 = trigger_size;
-
-				tr_req[tr_idx].daddr = dev_addr;
-				tr_req[tr_idx].dicnt0 = tr_cnt0;
-				tr_req[tr_idx].dicnt1 = tr_cnt1;
-				tr_req[tr_idx].dicnt2 = tr1_cnt2;
-				tr_req[tr_idx].dicnt3 = 1;
-				tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
-			}
-			tr_idx++;
-		}
-
-		d->residue += sg_len;
-	}
-
-	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags, csf | CPPI5_TR_CSF_EOP);
-
-	return d;
-}
-
-static int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
-				   enum dma_slave_buswidth dev_width,
-				   u16 elcnt)
-{
-	if (uc->config.ep_type != PSIL_EP_PDMA_XY)
-		return 0;
-
-	/* Bus width translates to the element size (ES) */
-	switch (dev_width) {
-	case DMA_SLAVE_BUSWIDTH_1_BYTE:
-		d->static_tr.elsize = 0;
-		break;
-	case DMA_SLAVE_BUSWIDTH_2_BYTES:
-		d->static_tr.elsize = 1;
-		break;
-	case DMA_SLAVE_BUSWIDTH_3_BYTES:
-		d->static_tr.elsize = 2;
-		break;
-	case DMA_SLAVE_BUSWIDTH_4_BYTES:
-		d->static_tr.elsize = 3;
-		break;
-	case DMA_SLAVE_BUSWIDTH_8_BYTES:
-		d->static_tr.elsize = 4;
-		break;
-	default: /* not reached */
-		return -EINVAL;
-	}
-
-	d->static_tr.elcnt = elcnt;
-
-	if (uc->config.pkt_mode || !uc->cyclic) {
-		/*
-		 * PDMA must close the packet when the channel is in packet mode.
-		 * For TR mode when the channel is not cyclic we also need PDMA
-		 * to close the packet otherwise the transfer will stall because
-		 * PDMA holds on the data it has received from the peripheral.
-		 */
-		unsigned int div = dev_width * elcnt;
-
-		if (uc->cyclic)
-			d->static_tr.bstcnt = d->residue / d->sglen / div;
-		else
-			d->static_tr.bstcnt = d->residue / div;
-	} else if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
-		   uc->config.dir == DMA_DEV_TO_MEM &&
-		   uc->cyclic) {
-		/*
-		 * For cyclic mode with BCDMA we have to set EOP in each TR to
-		 * prevent short packet errors seen on channel teardown. So the
-		 * PDMA must close the packet after every TR transfer by setting
-		 * burst count equal to the number of bytes transferred.
-		 */
-		struct cppi5_tr_type1_t *tr_req = d->hwdesc[0].tr_req_base;
-
-		d->static_tr.bstcnt =
-			(tr_req->icnt0 * tr_req->icnt1) / dev_width;
-	} else {
-		d->static_tr.bstcnt = 0;
-	}
-
-	if (uc->config.dir == DMA_DEV_TO_MEM &&
-	    d->static_tr.bstcnt > uc->ud->match_data->statictr_z_mask)
-		return -EINVAL;
-
-	return 0;
-}
-
-static struct udma_desc *
-udma_prep_slave_sg_pkt(struct udma_chan *uc, struct scatterlist *sgl,
-		       unsigned int sglen, enum dma_transfer_direction dir,
-		       unsigned long tx_flags, void *context)
-{
-	struct scatterlist *sgent;
-	struct cppi5_host_desc_t *h_desc = NULL;
-	struct udma_desc *d;
-	u32 ring_id;
-	unsigned int i;
-	u64 asel;
-
-	d = kzalloc_flex(*d, hwdesc, sglen, GFP_NOWAIT);
-	if (!d)
-		return NULL;
-
-	d->sglen = sglen;
-	d->hwdesc_count = sglen;
-
-	if (dir == DMA_DEV_TO_MEM)
-		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
-	else
-		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
-		asel = 0;
-	else
-		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-
-	for_each_sg(sgl, sgent, sglen, i) {
-		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
-		dma_addr_t sg_addr = sg_dma_address(sgent);
-		struct cppi5_host_desc_t *desc;
-		size_t sg_len = sg_dma_len(sgent);
-
-		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
-						GFP_NOWAIT,
-						&hwdesc->cppi5_desc_paddr);
-		if (!hwdesc->cppi5_desc_vaddr) {
-			dev_err(uc->ud->dev,
-				"descriptor%d allocation failed\n", i);
-
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		d->residue += sg_len;
-		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
-		desc = hwdesc->cppi5_desc_vaddr;
-
-		if (i == 0) {
-			cppi5_hdesc_init(desc, 0, 0);
-			/* Flow and Packed ID */
-			cppi5_desc_set_pktids(&desc->hdr, uc->id,
-					      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-			cppi5_desc_set_retpolicy(&desc->hdr, 0, ring_id);
-		} else {
-			cppi5_hdesc_reset_hbdesc(desc);
-			cppi5_desc_set_retpolicy(&desc->hdr, 0, 0xffff);
-		}
-
-		/* attach the sg buffer to the descriptor */
-		sg_addr |= asel;
-		cppi5_hdesc_attach_buf(desc, sg_addr, sg_len, sg_addr, sg_len);
-
-		/* Attach link as host buffer descriptor */
-		if (h_desc)
-			cppi5_hdesc_link_hbdesc(h_desc,
-						hwdesc->cppi5_desc_paddr | asel);
-
-		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA ||
-		    dir == DMA_MEM_TO_DEV)
-			h_desc = desc;
-	}
-
-	if (d->residue >= SZ_4M) {
-		dev_err(uc->ud->dev,
-			"%s: Transfer size %u is over the supported 4M range\n",
-			__func__, d->residue);
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return NULL;
-	}
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-	cppi5_hdesc_set_pktlen(h_desc, d->residue);
-
-	return d;
-}
-
-static int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
-				void *data, size_t len)
-{
-	struct udma_desc *d = to_udma_desc(desc);
-	struct udma_chan *uc = to_udma_chan(desc->chan);
-	struct cppi5_host_desc_t *h_desc;
-	u32 psd_size = len;
-	u32 flags = 0;
-
-	if (!uc->config.pkt_mode || !uc->config.metadata_size)
-		return -ENOTSUPP;
-
-	if (!data || len > uc->config.metadata_size)
-		return -EINVAL;
-
-	if (uc->config.needs_epib && len < CPPI5_INFO0_HDESC_EPIB_SIZE)
-		return -EINVAL;
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-	if (d->dir == DMA_MEM_TO_DEV)
-		memcpy(h_desc->epib, data, len);
-
-	if (uc->config.needs_epib)
-		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
-
-	d->metadata = data;
-	d->metadata_size = len;
-	if (uc->config.needs_epib)
-		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
-
-	cppi5_hdesc_update_flags(h_desc, flags);
-	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
-
-	return 0;
-}
-
-static void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
-				   size_t *payload_len, size_t *max_len)
-{
-	struct udma_desc *d = to_udma_desc(desc);
-	struct udma_chan *uc = to_udma_chan(desc->chan);
-	struct cppi5_host_desc_t *h_desc;
-
-	if (!uc->config.pkt_mode || !uc->config.metadata_size)
-		return ERR_PTR(-ENOTSUPP);
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	*max_len = uc->config.metadata_size;
-
-	*payload_len = cppi5_hdesc_epib_present(&h_desc->hdr) ?
-		       CPPI5_INFO0_HDESC_EPIB_SIZE : 0;
-	*payload_len += cppi5_hdesc_get_psdata_size(h_desc);
-
-	return h_desc->epib;
-}
-
-static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
-				 size_t payload_len)
-{
-	struct udma_desc *d = to_udma_desc(desc);
-	struct udma_chan *uc = to_udma_chan(desc->chan);
-	struct cppi5_host_desc_t *h_desc;
-	u32 psd_size = payload_len;
-	u32 flags = 0;
-
-	if (!uc->config.pkt_mode || !uc->config.metadata_size)
-		return -ENOTSUPP;
-
-	if (payload_len > uc->config.metadata_size)
-		return -EINVAL;
-
-	if (uc->config.needs_epib && payload_len < CPPI5_INFO0_HDESC_EPIB_SIZE)
-		return -EINVAL;
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	if (uc->config.needs_epib) {
-		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
-		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
-	}
-
-	cppi5_hdesc_update_flags(h_desc, flags);
-	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
-
-	return 0;
-}
-
-static const struct dma_descriptor_metadata_ops metadata_ops = {
-	.attach = udma_attach_metadata,
-	.get_ptr = udma_get_metadata_ptr,
-	.set_len = udma_set_metadata_len,
-};
-
-static struct dma_async_tx_descriptor *
-udma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
-		   unsigned int sglen, enum dma_transfer_direction dir,
-		   unsigned long tx_flags, void *context)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	enum dma_slave_buswidth dev_width;
-	struct udma_desc *d;
-	u32 burst;
-
-	if (dir != uc->config.dir &&
-	    (uc->config.dir == DMA_MEM_TO_MEM && !uc->config.tr_trigger_type)) {
-		dev_err(chan->device->dev,
-			"%s: chan%d is for %s, not supporting %s\n",
-			__func__, uc->id,
-			dmaengine_get_direction_text(uc->config.dir),
-			dmaengine_get_direction_text(dir));
-		return NULL;
-	}
-
-	if (dir == DMA_DEV_TO_MEM) {
-		dev_width = uc->cfg.src_addr_width;
-		burst = uc->cfg.src_maxburst;
-	} else if (dir == DMA_MEM_TO_DEV) {
-		dev_width = uc->cfg.dst_addr_width;
-		burst = uc->cfg.dst_maxburst;
-	} else {
-		dev_err(chan->device->dev, "%s: bad direction?\n", __func__);
-		return NULL;
-	}
-
-	if (!burst)
-		burst = 1;
-
-	uc->config.tx_flags = tx_flags;
-
-	if (uc->config.pkt_mode)
-		d = udma_prep_slave_sg_pkt(uc, sgl, sglen, dir, tx_flags,
-					   context);
-	else if (is_slave_direction(uc->config.dir))
-		d = udma_prep_slave_sg_tr(uc, sgl, sglen, dir, tx_flags,
-					  context);
-	else
-		d = udma_prep_slave_sg_triggered_tr(uc, sgl, sglen, dir,
-						    tx_flags, context);
-
-	if (!d)
-		return NULL;
-
-	d->dir = dir;
-	d->desc_idx = 0;
-	d->tr_idx = 0;
-
-	/* static TR for remote PDMA */
-	if (udma_configure_statictr(uc, d, dev_width, burst)) {
-		dev_err(uc->ud->dev,
-			"%s: StaticTR Z is limited to maximum %u (%u)\n",
-			__func__, uc->ud->match_data->statictr_z_mask,
-			d->static_tr.bstcnt);
-
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return NULL;
-	}
-
-	if (uc->config.metadata_size)
-		d->vd.tx.metadata_ops = &metadata_ops;
-
-	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
-}
-
-static struct udma_desc *
-udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
-			size_t buf_len, size_t period_len,
-			enum dma_transfer_direction dir, unsigned long flags)
-{
-	struct udma_desc *d;
-	size_t tr_size, period_addr;
-	struct cppi5_tr_type1_t *tr_req;
-	unsigned int periods = buf_len / period_len;
-	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
-	unsigned int i;
-	int num_tr;
-	u32 period_csf = 0;
-
-	num_tr = udma_get_tr_counters(period_len, __ffs(buf_addr), &tr0_cnt0,
-				      &tr0_cnt1, &tr1_cnt0);
-	if (num_tr < 0) {
-		dev_err(uc->ud->dev, "size %zu is not supported\n",
-			period_len);
-		return NULL;
-	}
-
-	/* Now allocate and setup the descriptor. */
-	tr_size = sizeof(struct cppi5_tr_type1_t);
-	d = udma_alloc_tr_desc(uc, tr_size, periods * num_tr, dir);
-	if (!d)
-		return NULL;
-
-	tr_req = d->hwdesc[0].tr_req_base;
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
-		period_addr = buf_addr;
-	else
-		period_addr = buf_addr |
-			((u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT);
-
-	/*
-	 * For BCDMA <-> PDMA transfers, the EOP flag needs to be set on the
-	 * last TR of a descriptor, to mark the packet as complete.
-	 * This is required for getting the teardown completion message in case
-	 * of TX, and to avoid short-packet error in case of RX.
-	 *
-	 * As we are in cyclic mode, we do not know which period might be the
-	 * last one, so set the flag for each period.
-	 */
-	if (uc->config.ep_type == PSIL_EP_PDMA_XY &&
-	    uc->ud->match_data->type == DMA_TYPE_BCDMA) {
-		period_csf = CPPI5_TR_CSF_EOP;
-	}
-
-	for (i = 0; i < periods; i++) {
-		int tr_idx = i * num_tr;
-
-		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
-			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-
-		tr_req[tr_idx].addr = period_addr;
-		tr_req[tr_idx].icnt0 = tr0_cnt0;
-		tr_req[tr_idx].icnt1 = tr0_cnt1;
-		tr_req[tr_idx].dim1 = tr0_cnt0;
-
-		if (num_tr == 2) {
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
-					 CPPI5_TR_CSF_SUPR_EVT);
-			tr_idx++;
-
-			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
-				      false, false,
-				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-
-			tr_req[tr_idx].addr = period_addr + tr0_cnt1 * tr0_cnt0;
-			tr_req[tr_idx].icnt0 = tr1_cnt0;
-			tr_req[tr_idx].icnt1 = 1;
-			tr_req[tr_idx].dim1 = tr1_cnt0;
-		}
-
-		if (!(flags & DMA_PREP_INTERRUPT))
-			period_csf |= CPPI5_TR_CSF_SUPR_EVT;
-
-		if (period_csf)
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags, period_csf);
-
-		period_addr += period_len;
-	}
-
-	return d;
-}
-
-static struct udma_desc *
-udma_prep_dma_cyclic_pkt(struct udma_chan *uc, dma_addr_t buf_addr,
-			 size_t buf_len, size_t period_len,
-			 enum dma_transfer_direction dir, unsigned long flags)
-{
-	struct udma_desc *d;
-	u32 ring_id;
-	int i;
-	int periods = buf_len / period_len;
-
-	if (periods > (K3_UDMA_DEFAULT_RING_SIZE - 1))
-		return NULL;
-
-	if (period_len >= SZ_4M)
-		return NULL;
-
-	d = kzalloc_flex(*d, hwdesc, periods, GFP_NOWAIT);
-	if (!d)
-		return NULL;
-
-	d->hwdesc_count = periods;
-
-	/* TODO: re-check this... */
-	if (dir == DMA_DEV_TO_MEM)
-		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
-	else
-		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
-
-	if (uc->ud->match_data->type != DMA_TYPE_UDMA)
-		buf_addr |= (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-
-	for (i = 0; i < periods; i++) {
-		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
-		dma_addr_t period_addr = buf_addr + (period_len * i);
-		struct cppi5_host_desc_t *h_desc;
-
-		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
-						GFP_NOWAIT,
-						&hwdesc->cppi5_desc_paddr);
-		if (!hwdesc->cppi5_desc_vaddr) {
-			dev_err(uc->ud->dev,
-				"descriptor%d allocation failed\n", i);
-
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
-		h_desc = hwdesc->cppi5_desc_vaddr;
-
-		cppi5_hdesc_init(h_desc, 0, 0);
-		cppi5_hdesc_set_pktlen(h_desc, period_len);
-
-		/* Flow and Packed ID */
-		cppi5_desc_set_pktids(&h_desc->hdr, uc->id,
-				      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-		cppi5_desc_set_retpolicy(&h_desc->hdr, 0, ring_id);
-
-		/* attach each period to a new descriptor */
-		cppi5_hdesc_attach_buf(h_desc,
-				       period_addr, period_len,
-				       period_addr, period_len);
-	}
-
-	return d;
-}
-
-static struct dma_async_tx_descriptor *
-udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
-		     size_t period_len, enum dma_transfer_direction dir,
-		     unsigned long flags)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	enum dma_slave_buswidth dev_width;
-	struct udma_desc *d;
-	u32 burst;
-
-	if (dir != uc->config.dir) {
-		dev_err(chan->device->dev,
-			"%s: chan%d is for %s, not supporting %s\n",
-			__func__, uc->id,
-			dmaengine_get_direction_text(uc->config.dir),
-			dmaengine_get_direction_text(dir));
-		return NULL;
-	}
-
-	uc->cyclic = true;
-
-	if (dir == DMA_DEV_TO_MEM) {
-		dev_width = uc->cfg.src_addr_width;
-		burst = uc->cfg.src_maxburst;
-	} else if (dir == DMA_MEM_TO_DEV) {
-		dev_width = uc->cfg.dst_addr_width;
-		burst = uc->cfg.dst_maxburst;
-	} else {
-		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
-		return NULL;
-	}
-
-	if (!burst)
-		burst = 1;
-
-	if (uc->config.pkt_mode)
-		d = udma_prep_dma_cyclic_pkt(uc, buf_addr, buf_len, period_len,
-					     dir, flags);
-	else
-		d = udma_prep_dma_cyclic_tr(uc, buf_addr, buf_len, period_len,
-					    dir, flags);
-
-	if (!d)
-		return NULL;
-
-	d->sglen = buf_len / period_len;
-
-	d->dir = dir;
-	d->residue = buf_len;
-
-	/* static TR for remote PDMA */
-	if (udma_configure_statictr(uc, d, dev_width, burst)) {
-		dev_err(uc->ud->dev,
-			"%s: StaticTR Z is limited to maximum %u (%u)\n",
-			__func__, uc->ud->match_data->statictr_z_mask,
-			d->static_tr.bstcnt);
-
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return NULL;
-	}
-
-	if (uc->config.metadata_size)
-		d->vd.tx.metadata_ops = &metadata_ops;
-
-	return vchan_tx_prep(&uc->vc, &d->vd, flags);
-}
-
-static struct dma_async_tx_descriptor *
-udma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
-		     size_t len, unsigned long tx_flags)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	struct udma_desc *d;
-	struct cppi5_tr_type15_t *tr_req;
-	int num_tr;
-	size_t tr_size = sizeof(struct cppi5_tr_type15_t);
-	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
-	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
-
-	if (uc->config.dir != DMA_MEM_TO_MEM) {
-		dev_err(chan->device->dev,
-			"%s: chan%d is for %s, not supporting %s\n",
-			__func__, uc->id,
-			dmaengine_get_direction_text(uc->config.dir),
-			dmaengine_get_direction_text(DMA_MEM_TO_MEM));
-		return NULL;
-	}
-
-	num_tr = udma_get_tr_counters(len, __ffs(src | dest), &tr0_cnt0,
-				      &tr0_cnt1, &tr1_cnt0);
-	if (num_tr < 0) {
-		dev_err(uc->ud->dev, "size %zu is not supported\n",
-			len);
-		return NULL;
-	}
-
-	d = udma_alloc_tr_desc(uc, tr_size, num_tr, DMA_MEM_TO_MEM);
-	if (!d)
-		return NULL;
-
-	d->dir = DMA_MEM_TO_MEM;
-	d->desc_idx = 0;
-	d->tr_idx = 0;
-	d->residue = len;
-
-	if (uc->ud->match_data->type != DMA_TYPE_UDMA) {
-		src |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
-		dest |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
-	} else {
-		csf |= CPPI5_TR_CSF_EOL_ICNT0;
-	}
-
-	tr_req = d->hwdesc[0].tr_req_base;
-
-	cppi5_tr_init(&tr_req[0].flags, CPPI5_TR_TYPE15, false, true,
-		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-	cppi5_tr_csf_set(&tr_req[0].flags, csf);
-
-	tr_req[0].addr = src;
-	tr_req[0].icnt0 = tr0_cnt0;
-	tr_req[0].icnt1 = tr0_cnt1;
-	tr_req[0].icnt2 = 1;
-	tr_req[0].icnt3 = 1;
-	tr_req[0].dim1 = tr0_cnt0;
-
-	tr_req[0].daddr = dest;
-	tr_req[0].dicnt0 = tr0_cnt0;
-	tr_req[0].dicnt1 = tr0_cnt1;
-	tr_req[0].dicnt2 = 1;
-	tr_req[0].dicnt3 = 1;
-	tr_req[0].ddim1 = tr0_cnt0;
-
-	if (num_tr == 2) {
-		cppi5_tr_init(&tr_req[1].flags, CPPI5_TR_TYPE15, false, true,
-			      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[1].flags, csf);
-
-		tr_req[1].addr = src + tr0_cnt1 * tr0_cnt0;
-		tr_req[1].icnt0 = tr1_cnt0;
-		tr_req[1].icnt1 = 1;
-		tr_req[1].icnt2 = 1;
-		tr_req[1].icnt3 = 1;
-
-		tr_req[1].daddr = dest + tr0_cnt1 * tr0_cnt0;
-		tr_req[1].dicnt0 = tr1_cnt0;
-		tr_req[1].dicnt1 = 1;
-		tr_req[1].dicnt2 = 1;
-		tr_req[1].dicnt3 = 1;
-	}
-
-	cppi5_tr_csf_set(&tr_req[num_tr - 1].flags, csf | CPPI5_TR_CSF_EOP);
-
-	if (uc->config.metadata_size)
-		d->vd.tx.metadata_ops = &metadata_ops;
-
-	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
-}
-
 static void udma_issue_pending(struct dma_chan *chan)
 {
 	struct udma_chan *uc = to_udma_chan(chan);
@@ -3587,46 +2409,6 @@ static void udma_synchronize(struct dma_chan *chan)
 	udma_reset_rings(uc);
 }
 
-static void udma_desc_pre_callback(struct virt_dma_chan *vc,
-				   struct virt_dma_desc *vd,
-				   struct dmaengine_result *result)
-{
-	struct udma_chan *uc = to_udma_chan(&vc->chan);
-	struct udma_desc *d;
-	u8 status;
-
-	if (!vd)
-		return;
-
-	d = to_udma_desc(&vd->tx);
-
-	if (d->metadata_size)
-		udma_fetch_epib(uc, d);
-
-	if (result) {
-		void *desc_vaddr = udma_curr_cppi5_desc_vaddr(d, d->desc_idx);
-
-		if (cppi5_desc_get_type(desc_vaddr) ==
-		    CPPI5_INFO0_DESC_TYPE_VAL_HOST) {
-			/* Provide residue information for the client */
-			result->residue = d->residue -
-					  cppi5_hdesc_get_pktlen(desc_vaddr);
-			if (result->residue)
-				result->result = DMA_TRANS_ABORTED;
-			else
-				result->result = DMA_TRANS_NOERROR;
-		} else {
-			result->residue = 0;
-			/* Propagate TR Response errors to the client */
-			status = d->hwdesc[0].tr_resp_base->status;
-			if (status)
-				result->result = DMA_TRANS_ABORTED;
-			else
-				result->result = DMA_TRANS_NOERROR;
-		}
-	}
-}
-
 /*
  * This tasklet handles the completion of a DMA descriptor by
  * calling its callback and freeing it.
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 54e1757c3de38..62c15b0cc9ae7 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -560,6 +560,60 @@ static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
 	memcpy(d->metadata, h_desc->epib, d->metadata_size);
 }
 
+/* Common functions */
+struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
+					    dma_addr_t paddr);
+void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d);
+void udma_purge_desc_work(struct work_struct *work);
+void udma_desc_free(struct virt_dma_desc *vd);
+bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr);
+bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d);
+struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
+				     size_t tr_size, int tr_count,
+				     enum dma_transfer_direction dir);
+int udma_get_tr_counters(size_t len, unsigned long align_to,
+			 u16 *tr0_cnt0, u16 *tr0_cnt1, u16 *tr1_cnt0);
+struct udma_desc *udma_prep_slave_sg_tr(struct udma_chan *uc,
+					struct scatterlist *sgl, unsigned int sglen,
+					enum dma_transfer_direction dir,
+					unsigned long tx_flags, void *context);
+struct udma_desc *udma_prep_slave_sg_triggered_tr(struct udma_chan *uc,
+						  struct scatterlist *sgl, unsigned int sglen,
+						  enum dma_transfer_direction dir,
+						  unsigned long tx_flags, void *context);
+int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
+			    enum dma_slave_buswidth dev_width, u16 elcnt);
+struct udma_desc *udma_prep_slave_sg_pkt(struct udma_chan *uc,
+					 struct scatterlist *sgl, unsigned int sglen,
+					 enum dma_transfer_direction dir,
+					 unsigned long tx_flags, void *context);
+int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+			 void *data, size_t len);
+void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+			    size_t *payload_len, size_t *max_len);
+int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+			  size_t payload_len);
+struct dma_async_tx_descriptor *udma_prep_slave_sg(struct dma_chan *chan,
+						   struct scatterlist *sgl, unsigned int sglen,
+						   enum dma_transfer_direction dir,
+						   unsigned long tx_flags, void *context);
+struct udma_desc *udma_prep_dma_cyclic_tr(struct udma_chan *uc,
+					  dma_addr_t buf_addr, size_t buf_len, size_t period_len,
+					  enum dma_transfer_direction dir, unsigned long flags);
+struct udma_desc *udma_prep_dma_cyclic_pkt(struct udma_chan *uc,
+					   dma_addr_t buf_addr, size_t buf_len, size_t period_len,
+					   enum dma_transfer_direction dir, unsigned long flags);
+struct dma_async_tx_descriptor *udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
+						     size_t buf_len, size_t period_len,
+						     enum dma_transfer_direction dir,
+						     unsigned long flags);
+struct dma_async_tx_descriptor *udma_prep_dma_memcpy(struct dma_chan *chan,
+						     dma_addr_t dest, dma_addr_t src,
+						     size_t len, unsigned long tx_flags);
+void udma_desc_pre_callback(struct virt_dma_chan *vc,
+			    struct virt_dma_desc *vd,
+			    struct dmaengine_result *result);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

