Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C57376A1A;
	Mon, 28 Sep 2026 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564416; cv=fail; b=WLfbUC65XotlSNHdvQ6qDLF12wXfv7NOK1mry3qe3cNQ9yFv7Of299pbj12yezg0Jec/vf13ub0ZCzx9puBOras6KYp8XiJGDC0rYbGLEJhGF30vGq22myaJ8ZeDGhpBzcw4dngx5aTDcZFb7+RAKrTY7xu1TKOXo4NQmcmwJzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564416; c=relaxed/simple;
	bh=qdzGF/AkqzMS/VsskoF1Vr7DlzwubPVXThq/KcVW6Xw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rv04AZBpMVsTHP5q2LvX0QNNiG0JiRVSXgCIWDBEPFRMB/6Z85wGYY5HWr6wb9a5gMrXDZLn0eLh18sKcqqizymrfeFJZUWK84CY/JAzfrEdzSR9lcGhpV6t3NF+nJ9f4MVUwp/VvX787weLw+UNZ9rpXr9O59Kmc5Dl8kHCOJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gr8sbtmB; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dm3Wtz8h; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gr8sbtmB";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dm3Wtz8h"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S0RoKt3706315;
	Sun, 27 Sep 2026 22:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jV6566MJCH+9XTWopmZWS4gz9dkHmEXUB8EyqFBzq
	eA=; b=gr8sbtmBc4+WtL72r4gbNUaXRdDG945aQev3mjcTU6A2Juog8Kpi4+dBk
	EFxyyJKRcJTh7etSf7EjE1PS0j6bynQAItvj8V0EsGV2dgK4GNyuBHjey5lZiq1h
	GYOGuCRD0Zpi5gchYdrkzbgiar9wqjZSd0zjGXP8GVCtCNapILWjh23Q/HsFN1Hr
	Ld63NyeSnesRS75vcDis3eCewyoXebMxGWfyiO7Vfbu2jodrhTxq8s316mkxCKfV
	xRNJNNevhb74DnjlrZIpZJvfH3lcIx1CKdRpjc+2zp9ZXhi5uRgljPd12hGI9fjz
	hcUtkoVa3WrjywLrPrtKfKx+KvKIQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb1ug-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:00:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lioiTfQ773D8Ky9k9xX71NVYs0ksHz1zj/G0bAW1djv9df/Rk3y/GbKCE0+clA73U+ARzrdHX9btNCFjOqzSx8+1Sp8SQm7GtN1EylbRDK0t1MVzPjzk6iQyxzuQsMPv2I8YXznr/qLYBs7vzwCA5FghHJ1UWsegjWiVt1Af2AgLQU66CUdt3QEpVAJ5gOqf7iTVoAkNef/6+9k5JiPAQMcO14xfv836+vVcbndgbIiYif6BbU8ccO5eOj+fBS1YeBg+Dz9yN9o7pgBelgFk8TpdEwltxeveb8A7DwxOsKuOmAZ4e8EGQvUrw68v+c34M9M5G6xbwwtQWLm7NE12rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jV6566MJCH+9XTWopmZWS4gz9dkHmEXUB8EyqFBzqeA=;
 b=nDUT77uT8B5uUAQDDJuiujzzeh79urjraSCyRZ/bV5imOTbHQSHnn8A7w9Yc1mXh8UC6z4bHMghm6PEO0NoC8U/FUG178IuYXgrP1+USs1RCSk1QEPJX3U8H0l1OYg1JK576UOLgk11JIsrFM6wf8uQIn1mWr4C31VyWmko15dZricHYv/+Ixzk9IbMVhjtp1Py6svVI1KlY0csw4Wk2VuN3SaVdZEnhgVsV5pH4oYJkH5S57seOsEsuUMdFn+oradIp5fNIz16Y4WZJDMsCOW5zAFBrbszjS6BN1HZZ9z/QNtNv1kfWxU+KPfHXNiI28HSoV1IUTc+jyagxurcbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV6566MJCH+9XTWopmZWS4gz9dkHmEXUB8EyqFBzqeA=;
 b=dm3Wtz8hjsZC1FVDzev5tpX1wpHVB5MR6zcnAY0vpm+fGfNbCHUzvAt4NiiviNzR5aqmIgsPZVFvgBknAlzyUye+D7k0PxyWRTGOFeH+CrxfEiCg2ZyI9xWTjKpAtT/WDZRwCLhEEp9DMEDbep3je8/tF7nYrjLwQ8bNzwJ+rJY=
Received: from PH7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:510:339::35)
 by DM4PR10MB6839.namprd10.prod.outlook.com (2603:10b6:8:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 02:59:56 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:510:339:cafe::83) by PH7PR03CA0030.outlook.office365.com
 (2603:10b6:510:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:59:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:59:54 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:09 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:59:09 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqM2256662;
	Sun, 27 Sep 2026 21:59:04 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
Date: Mon, 28 Sep 2026 08:26:21 +0530
Message-ID: <20260928025749.1055383-16-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DM4PR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfb430c-9e2c-4d74-3c3b-08df1d0c9283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|921020|56012099006|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	lUfj+6a76ofO5OyDOC+wmOzVMnMFWkFR5OCdb3XNVCT0CPlhNSPgFk4sqVnfixbXZYDGERML8gk2FOzG9epj74sSfh7yPkIAY1GvjJrshxQF0OlvQsI3jWDPbiAAQtHFrTv5kA1GUaR8Q0GevWxJLQKWWP2xfAHIFuC+KlbGl4L5PElFZE3NDIbOdk131isV2qOGbLu0VHkO8hyUewfsAL+IraE1S12hV4s9/fUw9HTqBWSSBZ0zHvkvANBWtm0jPxaIE5J+GW+hhPHgXwof4RpPQx2Uabl53ELJYchPosjCcmxhMXF0nri7OdauzKaKsTqXsYnh638MTQVvnNzBFN9KOZ+D7Gl8bwXAf9uZo4v86R/T57QjzZ2TKe+28sL20oMuytyi8xtgFdV7C+/ttsXJvkno4EMuitNHbEqg6KHz/wdJMIblCZg/KVLVkr60+CWW5w1cZM4nN8cUj1Z0WE4TbndASv5Kyf00LrIC+sawJUFEspkUAuBpp3hzJUa4RjEeCHrtRECq1kYpWvLCqmAQawgN958wRtROjTJ3s4xbvhmSOrNXdFEZM7vr5JlcRguZ1wqHYlwEX/4cyA4+Cwbbi53oWv2iayX3R2gCvtW3s1ATgNOCIW9b/0jc5jnevAuSqX4SIsYJfhNKmUMeOHxcUa++O6lR1CdRpiEQ60iCNO+6qxax6sk/6YrdSvug
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OJV2dzNq+lFWcKA4BTyWuE+/SN/y3UpnlFQfKgqyAQCe8xegcs02SSprnxG8W6OB+RqmLCXmeRIDjVIIkbEBDvERrVQIgKj3joIf4bDdv0YlIgX4YWNFnPSr/Y0As7lGGuwh1QA+4kCrFjpjzcZTdda/wD4tiQTf6RUYXp3LCn+nOxsiHNyTmgAeOwbDcROoJisE45hVDj0pejMXOsIcJcNsHiKhstYn84Nv90zBJjkyne3xf22sta6uR6c3+IJ6FAyWbIjrulkiJet3Dpb6KgsYf6DDMzHYxvxzSo1uBC3kGqcBnbYvL4+RQDaDxuz2Z3c5x4xdDrQsduJ8dqHw9LomsF6QNBEh2GL3Fadto0LyQG6tp732K/P5+ZN9SMCR73EE7GIPflW8tX8mdL3YLNsSI2hfN7kKpyHvuQZaBR3VdRvZbOAnqnS2gaTzn81M
X-Exchange-RoutingPolicyChecked:
	WWQKVujQy8qM4R39Fa+loYy3yIvOnBitqSzzJ63dPJKOBwcazsG4fjBeOzZbtp4Th9X9L32VFnUn0NQN66KJWfTRp1X1Mkqg+VGSe2y2fODDCnSykGiq8dqlyEG++/Ea1QXwZ+xOCzRZA+S0AbqSUMO/cPLGF2jHLZNiPmhuJ+e5bv16GgMdhuiYeEsqrUm7oy3/j3BlmWyTfHYVJ4BZQt/DOIegGfaM9QF2XwfOQwAGM+diufj660/+XYBwswslzZDJp5vHbHmBBCNYWhjE7grbOoF4QA/BZm8znHkYrJZO6pBUNiiV1z4giW5KV1SpyNUtXFPvKNeaszMmwPlLvA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:59:54.3497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfb430c-9e2c-4d74-3c3b-08df1d0c9283
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6839
X-Proofpoint-GUID: Fk1Han9cXQZoI4lrRr3hKkGEHlSgRoUd
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9d833 cx=c_pps
 a=UMwgOSM+WKnhBjpqxZ5HKA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=SxTibnW5tSAW0Is98DsA:9
X-Proofpoint-ORIG-GUID: Fk1Han9cXQZoI4lrRr3hKkGEHlSgRoUd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX0c7AeCeLnDzI
 aRZdl/mJ0GW8n07YiI3fFfmHL531Wg0b4bE5hpIejET0VoskcI0I2rrNO5ojRBwB85a4QgZ5Og1
 nMk5FeFnR8tMrlOCc5BdvBSN9lgj7BA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX7mztzNLOvjCi
 a5k+KLNiRYejsl1+rsLJKALjxzWeYOmoOBIFOSzisMA7kWxfWxSg5eIYYU78pV+l/bojkzLwTiY
 nmPdx1LQLMyGxN0+S2Rt+2gt0FLh+ZIz9mTRmUR//RPOuyXL11pTjNvuordz5zevHoY8K6c6e4D
 j3PCnpc3qch6xKGyWideK1Ge9gMGhUbb4GJXMaXeHl4iSr4AcipK9dBmkXf/JrevJlTaBJDsv35
 kMu9d62sJ5WoKknR4eKSsxBSsjli8+O31TS0Mz4p95IILru3Ig3uZ936yEYljucmKwuTktR/XQJ
 FjsA1woe5sLogxIHoSuTkFDGQlHL5nzh2R6v1xVEkzFKWi880XB0pIZwHAlMF3b276xuR07MOKb
 cIL8o1hfhLoB3SPQ2htO2i9EUG3fOtllysppAVdxgULFHWeXCnJaDSVzrrStmbQKFV4uXAw69vu
 vB/utAtMUQj7vSaQsHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Add PSIL and PDMA data for AM62Lx SoC.

Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
selectable fifos. Also add a new fifo_id field to psil_endpoint_config
to specify the selectable fifo_id.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Makefile        |   3 +-
 drivers/dma/ti/k3-psil-am62l.c | 169 +++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-psil-priv.h  |   5 +
 drivers/dma/ti/k3-psil.c       |  90 +++++++++++++++++-
 include/linux/dma/k3-psil.h    |   3 +
 5 files changed, 265 insertions(+), 5 deletions(-)
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
index c4b6f0df46861..153ed5fc79e53 100644
--- a/drivers/dma/ti/k3-psil.c
+++ b/drivers/dma/ti/k3-psil.c
@@ -28,6 +28,7 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 	{ .family = "J784S4", .data = &j784s4_ep_map },
 	{ .family = "AM62PX", .data = &am62p_ep_map },
 	{ .family = "J722S", .data = &am62p_ep_map },
+	{ .family = "AM62LX", .data = &am62l_ep_map },
 	{ /* sentinel */ }
 };
 
@@ -71,12 +72,68 @@ struct psil_endpoint_config *psil_get_ep_config(u32 thread_id)
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
 	int index;
 
 	if (!dev || !dev->of_node)
@@ -90,9 +147,34 @@ int psil_set_new_ep_config(struct device *dev, const char *name,
 				       index, &dma_spec))
 		return -ENOENT;
 
-	thread_id = dma_spec.args[0];
+	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
+		bool dev_to_mem;
+
+		if (dma_spec.args_count < 1) {
+			of_node_put(dma_spec.np);
+			return -EINVAL;
+		}
 
-	dst_ep_config = psil_get_ep_config(thread_id);
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
+		thread_id = dma_spec.args[2];
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[2],
+							  false,
+							  &thread_id, &dev_to_mem);
+	} else {
+		thread_id = dma_spec.args[0];
+		dst_ep_config = psil_get_ep_config(thread_id);
+	}
 	if (IS_ERR(dst_ep_config)) {
 		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
 		       thread_id);
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
2.54.0

