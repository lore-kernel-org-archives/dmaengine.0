Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2207F48488F;
	Wed,  7 Oct 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369082; cv=fail; b=uPzK4B+wSr8AdhorLH3IloT9L/9r/Vt1Z3qOcO0FeM+Hu7wqI5PBPoD3UHkuDGqlwFgGhpUuuchQbHIHTSc/Y/QATfcgm6nyl9DR4EfHr1lWv2gImseKrsbiPWn38YHv8TvzcX+LYYzna3Sw35cJfW8Rnk6KqJQHldUo4j0jrm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369082; c=relaxed/simple;
	bh=wxhUS9Du+vMDdEYOZ+YhM8yPRYSxCY2AqSwHWr+MAnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=drrG6jEk24gx3PGwGBzBAp9OBC+kKNc+U3ObG25vcwliLd++d0xQ5AyyxH5be+AEpC39JSrqj5O8XBYxwwxEQgOU/rW2vseiyEPeOMcOocfE56y+J6ruyVb3rz9ZKcgaE7bMnoYDSxiuvnAyJRFfMRYs4P349iagGK/tPRJv8uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DIRvjlL0; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=bcvb1uQi; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DIRvjlL0";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="bcvb1uQi"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977kpK8226184;
	Wed, 7 Oct 2026 05:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1E3CgotAWWgE+bzkgZlkCsEycNIdVDlbq8xXzcTSW
	RY=; b=DIRvjlL0PiYirZmuoVom7XeKA4d8trJTruwiNZsNlkUR4PojfNq96XZmq
	7K7Bdb0syFigmc5QAN9uqtjp2X4l6FRDslwpGLW52czo8mDzenFS1eNQGsGTjFV2
	qXfX0fggNsAipZdS10Jh97YMY7jO1IGQ1oenCarPOK2BdWF04Ij/OfLAUZxquYA+
	JSDfcGxTB8suPaiNFAjE4R85i6ixjG+WLDoznGFR/W5Te1o67HwWmcyqpepjyNOE
	Xt19wubkOJ5JAIF4gKToAsXiV6fHID8nXaV+h9+fBseNh8TXAm2FJgqkWNaJSlm9
	42c1B03Hg7zWQAiofuPaHjigguhIg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5na2ec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By5Jbi5p3ZFJaCsKWLOznv0BJNXi4IzKfgipHI8xRCshKSOwUqGCc3HvfMVQ0L0Bhg58R5uAq0KHxExNea5ou1mxbMnwbKi4kEOk/vtQ7MFds3opUrKzL0z1WHF/ZbEtXS9KD254fVAe9hLC7ncJ0+VwNZIjBkP0nbcjO8hmO4KrngVPO42n13bUh/9V3C6AorOMWWaVYIQHN141tRMYUl4tSdFVhry0J7Lmuhw9ej3gM+e0cL3XiW7aD6K0/+ngxuesEGYz6GNFUM2ZsfHbptCrkjtjaYF86nAhDTLM/RiqYJIrLKK8UrnUPW3Vv6SCP26bMvuiAgERObSu/5O/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E3CgotAWWgE+bzkgZlkCsEycNIdVDlbq8xXzcTSWRY=;
 b=P2OpgNprrMTMqdAw9ObqadxGjrWQigDrAxhkA4O5L9X7mAr2LWoRnvLt38xBne6xPQrGksbVJX9X7g39XiEQroEikXYkL73C/Q2EzLwJOY2hfrwjuWtDHzVJE7xWud2ikpxwLhErYq1DvzwA1JSooEG5DJD/WmC59AV66cj3qKqfLSP6V/g1XTGTaMXRrXrYwuHF6mu05v+BVj41C73oSN3Sy5upNn4khfMK/WBbwYW08tMDrgJykzETCT4Y1at91ddapU9EW0AD9GpvNIHBIG6mlg7dr2AWhS2fFuB54f0RLc4zKKD0Lql4qFSH+EPGPlgWtL61Qm1kMj5uffym5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3CgotAWWgE+bzkgZlkCsEycNIdVDlbq8xXzcTSWRY=;
 b=bcvb1uQi78CdkqeghDvT7OrVVTqDH8UUJt/cXIxmlaKVvcI7RTpAG0WN6t4g+0A2ferRSP2RM7s0WbcS873fWKBSyA8CjYYDwj/M3f5CV1tgJvmfCz5vnZj9iNsmdUOxKnXCIfZddFtp8XTS18YHZ8JyAPukFFIp/7Di27NuxKs=
Received: from MW4PR03CA0058.namprd03.prod.outlook.com (2603:10b6:303:8e::33)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 10:30:18 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::a7) by MW4PR03CA0058.outlook.office365.com
 (2603:10b6:303:8e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:30:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:18 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:04 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:03 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSl013473;
	Wed, 7 Oct 2026 05:29:59 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 03/20] dmaengine: ti: k3-udma: move structs and enums to header file
Date: Wed, 7 Oct 2026 15:58:44 +0530
Message-ID: <20261007102936.2402427-4-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|PH0PR10MB4744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e330e00-65d3-4917-0654-08df245dfbaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|23010399003|36860700016|22082099003|10067099003|56012099006|6133799003|3023799007|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	hBq177m308IZTe5HeZuXkoPKrya4KilI6+G1SI7OEBCYumdnVnOnL0RETIpzA3i+vOKF5zlwBIrzb0RqUFf7IlO1OsmD+6PbmRJp5oiLju08z40t/vrMUxSK/TDE3zcMeQ1AzGLFQ/LpKdLab0o+7hL2bdoCKIrNPrxOgvt1JqP8TxhZQE6euxTmL0o1qBS5UjSFAOQTWyqM8Ythw4qCTilkDZTkyguleEWjL8uJnpgBw5GLQHdW7OjJk7ieylBOY9uQGrPK5TAmjg9mx046zIdeF/5Aws0Ym7Pe8d+b0eOOj4JK/yy59i4V6p42Ke8s4m1aqIU3d45462yPm+pc7BPWAHv1xMJQ/7UFdBG2U3Q/fbB9PdbhVx9eEZMlDGqwZFVWxExlF1+4mbMMNpSM7mm3S0Qq93jfuTWl6kxMwimwsoPooTuIs2q7cKsVpPfiKp3NhgM7fHKKReopM5gqMERReC3SlvEKz/yeZUhZRCwG2+VYuBX1YMCtww9J1MyxRY+YZ6hvFj0FaKbxOyfm8a8Dr27oWfTGJaP1hGRwWMB+qY2hw+1YcZtvKfFCW19CNEcqmOVQsJSiGeNTaQDaWhSFMu3PAp0Irr4diH2BszuJQ2FGekYjWagBZH6GzF/cIzF5BAmSqwdGzJofEDIruEEoRrvDsP9tTyaSBI+xLea4ZlKI0T2eYjJlQnLhvP3EzGp6OCSiV+yKOe5/p/T64YKCvGCmdRrQ7Nu0waYSZU0MeC14ROEWKR9r0h4Pio4G
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(10067099003)(56012099006)(6133799003)(3023799007)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i3/E5TL/IoGwwXakPWUIIhqD1bNleaInMSEId2DmP9aBmF2yhhWVQiNKkWQzy+L6iSjQgmuEIeTvvVS9/PyYBQ8ZbmCTDHUdeOa8y/zdYSYOnQg+2u8kot6OAnDq/K21s9IsCL37qCmNVwdExoVwY9u6wzfZR7Pz9bDSJBzR1N1FaaFM0M0r3jvlVbcPhh7gUA3TVLqjrWWbtbvpgiwUTaiKWYUdsVGaYynbDOHTY8ihc7ahFVsLFTmmIVdYAYu5uwYlUurRHmkUWlCko4El6Hcpeijn9a1bQ56ut8vxgQ8Qdo02dGvdvIpuPU468EiU9e/zWZUbnXsXA64LHEW5vBFl4JEtfMobkvk2CDbJHAT1c+WIIiNmG5Kt8/Af8d3KoTsvJlNTq0XULIpH50jz8x2QqOxb3kxwbKlEx0STJDLVMIxq4KkEYxZd9yRKeKug
X-Exchange-RoutingPolicyChecked:
	oCeFfdVZmDBdmNRvHGY5+YhGUhedMlnMI+9SQ4zN1opRTaDG4ItG8zQUGQ0o8Le+3/zm9DqQKgM971NYvxpBlMXe9istkxmKythqEFYrkUyQFwak4Mf8Cg8NxO5NDXmGim0ZKmBrKb+sttzy1BIzsBkn72tE+KBcyzMu/CWXBOxoYyIW3sDrWet8LldcAWRd999uwhh+wUMAooCEZSD2BkShiC4ADHM04HTuqXCYs81hTYVooPm+LSGtvtz7nVuFjyri+iWqNWI3ifqXWE3WJEBR/t1eXB8SMl3llXylbpWyVN9120/Z1iwN+DGC/d5jNzi43k1FQOxJK0zsjEf6SA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:18.1630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e330e00-65d3-4917-0654-08df245dfbaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-ORIG-GUID: W9MhkBaox3Kql43TTcvyJx70lfEqs1Zd
X-Proofpoint-GUID: W9MhkBaox3Kql43TTcvyJx70lfEqs1Zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX+PWPK0KWHekJ
 xYEDpHKlDwq5PW0DrRQyYSPJBaBQFxycrgxfBLD09py8rjXrH8c95VwaqmGFZ7yidItfYRPUqtB
 Tz9kpLBXuhD9HrXLjc24zHRi82AiHTi9q2xCwTgeon/sXuPjh7hxxBmfBsbawHOA6jLd5YpOlDO
 CP8Am+TeUnG+CZyi27ndT4M4SwLLg6xyBxpPECWpNWfyjgx+13AkeBAbrb7Lorq8keOH+VNQUeX
 XDkwBiVDpHNV70IsmLhjcBnlq5AZB+3DkK3L6Uzaka89pyZdFJimcaDE9Ro+cpZOZ8RaDM2WFUP
 ND80dt0CrAUCh7GOdec7H6ZH0jWp6A+5Ehbx9KC68zSsTFEtVbPuFp21I3/HbQZ3X1IHty4bg+V
 G/ISU3jn+gZlCv15gsihYnLhLdcIDc/XB7T+gK5c+zPIKur+of8ewVuOzfgsp8TMjeb50iHPkx4
 cz1694jNGe17Me0fI+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXz2x3FTrZnMDi
 clfcRskgG+66OjOjj3cwGtReWcppa5TTdjh7E9PJhVNKEA6UcdPpm44o2VW3KHGdbF43xxJbMiq
 m5BW6JG8EHj2vfsOU8KbL6xVbC4+/PQ=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac61f3f cx=c_pps
 a=wPn5mG08gX1eKnPfDThLSw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=8AirrxEcAAAA:8
 a=1JpllqVW-1LRWXCuGuAA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

Move struct and enum definitions in k3-udma.c to k3-udma.h header file
for better separation and reuse.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ti/k3-udma.c | 259 +-------------------------------------
 drivers/dma/ti/k3-udma.h | 265 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 266 insertions(+), 258 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index a1b99097a94ad..d7c153c5321ea 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -24,8 +24,8 @@
 #include <linux/workqueue.h>
 #include <linux/completion.h>
 #include <linux/soc/ti/k3-ringacc.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/soc/ti/ti_sci_inta_msi.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/dma/k3-event-router.h>
 #include <linux/dma/ti-cppi5.h>
 
@@ -33,28 +33,6 @@
 #include "k3-udma.h"
 #include "k3-psil-priv.h"
 
-struct udma_static_tr {
-	u8 elsize; /* RPSTR0 */
-	u16 elcnt; /* RPSTR0 */
-	u16 bstcnt; /* RPSTR1 */
-};
-
-struct udma_chan;
-
-enum k3_dma_type {
-	DMA_TYPE_UDMA = 0,
-	DMA_TYPE_BCDMA,
-	DMA_TYPE_PKTDMA,
-};
-
-enum udma_mmr {
-	MMR_GCFG = 0,
-	MMR_BCHANRT,
-	MMR_RCHANRT,
-	MMR_TCHANRT,
-	MMR_LAST,
-};
-
 static const char * const mmr_names[] = {
 	[MMR_GCFG] = "gcfg",
 	[MMR_BCHANRT] = "bchanrt",
@@ -62,234 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-struct udma_tchan {
-	void __iomem *reg_rt;
-
-	int id;
-	struct k3_ring *t_ring; /* Transmit ring */
-	struct k3_ring *tc_ring; /* Transmit Completion ring */
-	int tflow_id; /* applicable only for PKTDMA */
-
-};
-
-#define udma_bchan udma_tchan
-
-struct udma_rflow {
-	int id;
-	struct k3_ring *fd_ring; /* Free Descriptor ring */
-	struct k3_ring *r_ring; /* Receive ring */
-};
-
-struct udma_rchan {
-	void __iomem *reg_rt;
-
-	int id;
-};
-
-struct udma_oes_offsets {
-	/* K3 UDMA Output Event Offset */
-	u32 udma_rchan;
-
-	/* BCDMA Output Event Offsets */
-	u32 bcdma_bchan_data;
-	u32 bcdma_bchan_ring;
-	u32 bcdma_tchan_data;
-	u32 bcdma_tchan_ring;
-	u32 bcdma_rchan_data;
-	u32 bcdma_rchan_ring;
-
-	/* PKTDMA Output Event Offsets */
-	u32 pktdma_tchan_flow;
-	u32 pktdma_rchan_flow;
-};
-
-struct udma_match_data {
-	enum k3_dma_type type;
-	u32 psil_base;
-	bool enable_memcpy_support;
-	u32 flags;
-	u32 statictr_z_mask;
-	u8 burst_size[3];
-	struct udma_soc_data *soc_data;
-};
-
-struct udma_soc_data {
-	struct udma_oes_offsets oes;
-	u32 bcdma_trigger_event_offset;
-};
-
-struct udma_hwdesc {
-	size_t cppi5_desc_size;
-	void *cppi5_desc_vaddr;
-	dma_addr_t cppi5_desc_paddr;
-
-	/* TR descriptor internal pointers */
-	void *tr_req_base;
-	struct cppi5_tr_resp_t *tr_resp_base;
-};
-
-struct udma_rx_flush {
-	struct udma_hwdesc hwdescs[2];
-
-	size_t buffer_size;
-	void *buffer_vaddr;
-	dma_addr_t buffer_paddr;
-};
-
-struct udma_tpl {
-	u8 levels;
-	u32 start_idx[3];
-};
-
-struct udma_dev {
-	struct dma_device ddev;
-	struct device *dev;
-	void __iomem *mmrs[MMR_LAST];
-	const struct udma_match_data *match_data;
-	const struct udma_soc_data *soc_data;
-
-	struct udma_tpl bchan_tpl;
-	struct udma_tpl tchan_tpl;
-	struct udma_tpl rchan_tpl;
-
-	size_t desc_align; /* alignment to use for descriptors */
-
-	struct udma_tisci_rm tisci_rm;
-
-	struct k3_ringacc *ringacc;
-
-	struct work_struct purge_work;
-	struct list_head desc_to_purge;
-	spinlock_t lock;
-
-	struct udma_rx_flush rx_flush;
-
-	int bchan_cnt;
-	int tchan_cnt;
-	int echan_cnt;
-	int rchan_cnt;
-	int rflow_cnt;
-	int tflow_cnt;
-	unsigned long *bchan_map;
-	unsigned long *tchan_map;
-	unsigned long *rchan_map;
-	unsigned long *rflow_gp_map;
-	unsigned long *rflow_gp_map_allocated;
-	unsigned long *rflow_in_use;
-	unsigned long *tflow_map;
-
-	struct udma_bchan *bchans;
-	struct udma_tchan *tchans;
-	struct udma_rchan *rchans;
-	struct udma_rflow *rflows;
-
-	struct udma_chan *channels;
-	u32 psil_base;
-	u32 atype;
-	u32 asel;
-};
-
-struct udma_desc {
-	struct virt_dma_desc vd;
-
-	bool terminated;
-
-	enum dma_transfer_direction dir;
-
-	struct udma_static_tr static_tr;
-	u32 residue;
-
-	unsigned int sglen;
-	unsigned int desc_idx; /* Only used for cyclic in packet mode */
-	unsigned int tr_idx;
-
-	u32 metadata_size;
-	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
-
-	unsigned int hwdesc_count;
-	struct udma_hwdesc hwdesc[];
-};
-
-enum udma_chan_state {
-	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
-	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
-	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
-};
-
-struct udma_tx_drain {
-	struct delayed_work work;
-	ktime_t tstamp;
-	u32 residue;
-};
-
-struct udma_chan_config {
-	bool pkt_mode; /* TR or packet */
-	bool needs_epib; /* EPIB is needed for the communication or not */
-	u32 psd_size; /* size of Protocol Specific Data */
-	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
-	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
-	bool notdpkt; /* Suppress sending TDC packet */
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 src_thread;
-	u32 dst_thread;
-	enum psil_endpoint_type ep_type;
-	bool enable_acc32;
-	bool enable_burst;
-	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
-
-	u32 tr_trigger_type;
-	unsigned long tx_flags;
-
-	/* PKDMA mapped channel */
-	int mapped_channel_id;
-	/* PKTDMA default tflow or rflow for mapped channel */
-	int default_flow_id;
-
-	enum dma_transfer_direction dir;
-};
-
-struct udma_chan {
-	struct virt_dma_chan vc;
-	struct dma_slave_config	cfg;
-	struct udma_dev *ud;
-	struct device *dma_dev;
-	struct udma_desc *desc;
-	struct udma_desc *terminated_desc;
-	struct udma_static_tr static_tr;
-	char *name;
-
-	struct udma_bchan *bchan;
-	struct udma_tchan *tchan;
-	struct udma_rchan *rchan;
-	struct udma_rflow *rflow;
-
-	bool psil_paired;
-
-	int irq_num_ring;
-	int irq_num_udma;
-
-	bool cyclic;
-	bool paused;
-
-	enum udma_chan_state state;
-	struct completion teardown_completed;
-
-	struct udma_tx_drain tx_drain;
-
-	/* Channel configuration parameters */
-	struct udma_chan_config config;
-	/* Channel configuration parameters (backup) */
-	struct udma_chan_config backup_config;
-
-	/* dmapool for packet mode descriptors */
-	bool use_dma_pool;
-	struct dma_pool *hdesc_pool;
-
-	u32 id;
-};
-
 static inline struct udma_dev *to_udma_dev(struct dma_device *d)
 {
 	return container_of(d, struct udma_dev, ddev);
@@ -4073,13 +3823,6 @@ static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
 
-struct udma_filter_param {
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 tr_trigger_type;
-};
-
 static bool udma_dma_filter_fn(struct dma_chan *chan, void *param)
 {
 	struct udma_chan_config *ucc;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 750720cd06911..11d08adb0d69f 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -6,7 +6,16 @@
 #ifndef K3_UDMA_H_
 #define K3_UDMA_H_
 
+#include <linux/dmaengine.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/dma/ti-cppi5.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+
+#include "../virt-dma.h"
+#include "k3-psil-priv.h"
 
 /* Global registers */
 #define UDMA_REV_REG			0x0
@@ -164,6 +173,7 @@ struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
 struct udma_rflow;
+struct udma_chan;
 
 enum udma_rm_range {
 	RM_RANGE_BCHAN = 0,
@@ -186,6 +196,261 @@ struct udma_tisci_rm {
 	struct ti_sci_resource *rm_ranges[RM_RANGE_LAST];
 };
 
+struct udma_static_tr {
+	u8 elsize; /* RPSTR0 */
+	u16 elcnt; /* RPSTR0 */
+	u16 bstcnt; /* RPSTR1 */
+};
+
+enum k3_dma_type {
+	DMA_TYPE_UDMA = 0,
+	DMA_TYPE_BCDMA,
+	DMA_TYPE_PKTDMA,
+};
+
+enum udma_mmr {
+	MMR_GCFG = 0,
+	MMR_BCHANRT,
+	MMR_RCHANRT,
+	MMR_TCHANRT,
+	MMR_LAST,
+};
+
+struct udma_filter_param {
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 tr_trigger_type;
+};
+
+struct udma_tchan {
+	void __iomem *reg_rt;
+
+	int id;
+	struct k3_ring *t_ring; /* Transmit ring */
+	struct k3_ring *tc_ring; /* Transmit Completion ring */
+	int tflow_id; /* applicable only for PKTDMA */
+
+};
+
+#define udma_bchan udma_tchan
+
+struct udma_rflow {
+	int id;
+	struct k3_ring *fd_ring; /* Free Descriptor ring */
+	struct k3_ring *r_ring; /* Receive ring */
+};
+
+struct udma_rchan {
+	void __iomem *reg_rt;
+
+	int id;
+};
+
+struct udma_oes_offsets {
+	/* K3 UDMA Output Event Offset */
+	u32 udma_rchan;
+
+	/* BCDMA Output Event Offsets */
+	u32 bcdma_bchan_data;
+	u32 bcdma_bchan_ring;
+	u32 bcdma_tchan_data;
+	u32 bcdma_tchan_ring;
+	u32 bcdma_rchan_data;
+	u32 bcdma_rchan_ring;
+
+	/* PKTDMA Output Event Offsets */
+	u32 pktdma_tchan_flow;
+	u32 pktdma_rchan_flow;
+};
+
+struct udma_match_data {
+	enum k3_dma_type type;
+	u32 psil_base;
+	bool enable_memcpy_support;
+	u32 flags;
+	u32 statictr_z_mask;
+	u8 burst_size[3];
+	struct udma_soc_data *soc_data;
+};
+
+struct udma_soc_data {
+	struct udma_oes_offsets oes;
+	u32 bcdma_trigger_event_offset;
+};
+
+struct udma_hwdesc {
+	size_t cppi5_desc_size;
+	void *cppi5_desc_vaddr;
+	dma_addr_t cppi5_desc_paddr;
+
+	/* TR descriptor internal pointers */
+	void *tr_req_base;
+	struct cppi5_tr_resp_t *tr_resp_base;
+};
+
+struct udma_rx_flush {
+	struct udma_hwdesc hwdescs[2];
+
+	size_t buffer_size;
+	void *buffer_vaddr;
+	dma_addr_t buffer_paddr;
+};
+
+struct udma_tpl {
+	u8 levels;
+	u32 start_idx[3];
+};
+
+struct udma_dev {
+	struct dma_device ddev;
+	struct device *dev;
+	void __iomem *mmrs[MMR_LAST];
+	const struct udma_match_data *match_data;
+	const struct udma_soc_data *soc_data;
+
+	struct udma_tpl bchan_tpl;
+	struct udma_tpl tchan_tpl;
+	struct udma_tpl rchan_tpl;
+
+	size_t desc_align; /* alignment to use for descriptors */
+
+	struct udma_tisci_rm tisci_rm;
+
+	struct k3_ringacc *ringacc;
+
+	struct work_struct purge_work;
+	struct list_head desc_to_purge;
+	spinlock_t lock;
+
+	struct udma_rx_flush rx_flush;
+
+	int bchan_cnt;
+	int tchan_cnt;
+	int echan_cnt;
+	int rchan_cnt;
+	int rflow_cnt;
+	int tflow_cnt;
+	unsigned long *bchan_map;
+	unsigned long *tchan_map;
+	unsigned long *rchan_map;
+	unsigned long *rflow_gp_map;
+	unsigned long *rflow_gp_map_allocated;
+	unsigned long *rflow_in_use;
+	unsigned long *tflow_map;
+
+	struct udma_bchan *bchans;
+	struct udma_tchan *tchans;
+	struct udma_rchan *rchans;
+	struct udma_rflow *rflows;
+
+	struct udma_chan *channels;
+	u32 psil_base;
+	u32 atype;
+	u32 asel;
+};
+
+struct udma_desc {
+	struct virt_dma_desc vd;
+
+	bool terminated;
+
+	enum dma_transfer_direction dir;
+
+	struct udma_static_tr static_tr;
+	u32 residue;
+
+	unsigned int sglen;
+	unsigned int desc_idx; /* Only used for cyclic in packet mode */
+	unsigned int tr_idx;
+
+	u32 metadata_size;
+	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
+
+	unsigned int hwdesc_count;
+	struct udma_hwdesc hwdesc[];
+};
+
+enum udma_chan_state {
+	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
+	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
+	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
+};
+
+struct udma_tx_drain {
+	struct delayed_work work;
+	ktime_t tstamp;
+	u32 residue;
+};
+
+struct udma_chan_config {
+	bool pkt_mode; /* TR or packet */
+	bool needs_epib; /* EPIB is needed for the communication or not */
+	u32 psd_size; /* size of Protocol Specific Data */
+	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
+	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
+	bool notdpkt; /* Suppress sending TDC packet */
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 src_thread;
+	u32 dst_thread;
+	enum psil_endpoint_type ep_type;
+	bool enable_acc32;
+	bool enable_burst;
+	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
+
+	u32 tr_trigger_type;
+	unsigned long tx_flags;
+
+	/* PKDMA mapped channel */
+	int mapped_channel_id;
+	/* PKTDMA default tflow or rflow for mapped channel */
+	int default_flow_id;
+
+	enum dma_transfer_direction dir;
+};
+
+struct udma_chan {
+	struct virt_dma_chan vc;
+	struct dma_slave_config	cfg;
+	struct udma_dev *ud;
+	struct device *dma_dev;
+	struct udma_desc *desc;
+	struct udma_desc *terminated_desc;
+	struct udma_static_tr static_tr;
+	char *name;
+
+	struct udma_bchan *bchan;
+	struct udma_tchan *tchan;
+	struct udma_rchan *rchan;
+	struct udma_rflow *rflow;
+
+	bool psil_paired;
+
+	int irq_num_ring;
+	int irq_num_udma;
+
+	bool cyclic;
+	bool paused;
+
+	enum udma_chan_state state;
+	struct completion teardown_completed;
+
+	struct udma_tx_drain tx_drain;
+
+	/* Channel configuration parameters */
+	struct udma_chan_config config;
+	/* Channel configuration parameters (backup) */
+	struct udma_chan_config backup_config;
+
+	/* dmapool for packet mode descriptors */
+	bool use_dma_pool;
+	struct dma_pool *hdesc_pool;
+
+	u32 id;
+};
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0

