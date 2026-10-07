Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E1486E78;
	Wed,  7 Oct 2026 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369096; cv=fail; b=tyPeuF7OEnH+U3Xaon9ZWu9fgHgtIfyslo8yg7rYi3ypL0SrRFE0XEie4p6IzLnsWO3PCJ6o/EDybJvV4x3C4a4P6b0CFJsSYztEPL5waJognCw7X3tS7vebH9BqnmFhRApyYqJgVjBkP9H+cmgHzG4LY4qF9tK9pIUkZZE/l9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369096; c=relaxed/simple;
	bh=TMW8nBxCdj9ErY3NDSLEjcVsdhmbzrcQ9MaK52WwcB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qr7q2QbDAC1dm0MYh96vVcW3JoVm2bDdkt9u6nLtqqAg4z1ivwJmhQNYGmQqc1cjoMVAM952CZmCHIdBj37sYWG7OUMMsm5bTbPIkhK6DLIp/Lzm669O8bh64w+FI6wfdKCTWEZHR3T7tdmvgSBqzL3b/bm9qE42M53EHGgaz8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=krG1YgIy; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=J8quNB/p; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="krG1YgIy";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="J8quNB/p"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977lUOF227324;
	Wed, 7 Oct 2026 05:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6kfEa3Wb8WRtN3KpMeZn/j5CvpKxsLwE959BUKAmy
	44=; b=krG1YgIyzjUl98uvxEbOYIeaPm9lL7J/5NOloFxOIWvGrldyvpBoEShDA
	97Mn7JTn6K1Wa1dkXrcJE+hwKz1VDfYVZkpXBSbYUPkkjfZ6NSdSRcPn9JECr+r3
	R/RlgEDo4pfOCgXTYJdyyke0L/phq2SRZhX33LDjW17xmkSdMr+DQclBsm5OLl5W
	PnO9GrQMYed5KAIURe9Fwq1JacmX/5lOfEVj+b4qDfrEB2NCxKoGnI9XDqnDTAJ3
	7F4n52PqFaPPHdQ0dpNuEr25lw2xw6kbOhGQiY5blNyj06PagIDZ7maD4kZDv41n
	ub084tp7vGsn/2FgvDW28VIdYrWOw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5na2gb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvTGsUCdyNDHbS/IqD8DqQdGmNIxb/zQTbB2KV2Gp2tu/ZYuQt7HmrjQRY/4GrRlwcZlHP1Nh4bae3uMWfuYUXYpAA2Yk8emR+xPH4CPFouuzhT5pbodbg7sNFYdu3Gh03tQgdeHp7riWO3M1VahW6gzo+6i2RuZmSPJ6MWls8fxI0iRYwQn6FZl9IL4msKYamxTEDrgAusasAXixtDccPJVcig74vEKcxcg8Ubu1LKWMAC8Q1gegZmOXCXJiKcpVGKYhrwHilc24kY/9u1a3HGbX+VbrCazYEOLTSnhOwrK9ZS2gzVyfnaPlHszKoCNAmXzdOU1Nji6ipcy2iQCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kfEa3Wb8WRtN3KpMeZn/j5CvpKxsLwE959BUKAmy44=;
 b=kMd9nV9Thd5B7rQLJ8upldRJMLx98xl/1+Lh859FThvaCqqldsuVGiU1O2h4Q9YhZvabNmWdrN4eFb8oqlflf2xZGeSNHf2mmTRKCvUt1/zN3JBRBmadvS+zie+SSzdqghxn3MITg862ZKZFivQUQjbEc4h7YyJH15olvR698MFNGJHEKHzzNuIX7GE6YJjAcjFRuCFOO+6tzNjwhdR+xxIdrssk++otdjZXLzU6W98/mYPp33tLXtJECXYKA0wFwbQCXSIZpyKiGauHcN0gPZE6cnlnVKAmaPeN1Y4gOp8zYps6Hj7vwUugGSY3ksmwaUdB+VhnVr0pSanTJcUffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kfEa3Wb8WRtN3KpMeZn/j5CvpKxsLwE959BUKAmy44=;
 b=J8quNB/p6xEua9CTq5sF/a+lNYf17hNa1X1Zu8Pcp6KUR3idM8PrFCMroidNgu9kAscd/LYpGK+00D8gMrUPDAQlbudS8chim578HDDJ5kSmXuUjAL2hMhwxUljYe0DqxdExKvGG/RNAC+XYai5NrP/oRYueVeHaRFwSufbExDI=
Received: from CY5PR15CA0195.namprd15.prod.outlook.com (2603:10b6:930:82::11)
 by CHAPR10MB997722.namprd10.prod.outlook.com (2603:10b6:610:2f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:30:51 +0000
Received: from CY8PEPF00000053.namprd05.prod.outlook.com
 (2603:10b6:930:82:cafe::62) by CY5PR15CA0195.outlook.office365.com
 (2603:10b6:930:82::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:30:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000053.mail.protection.outlook.com (10.167.247.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:50 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:36 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:35 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSs013473;
	Wed, 7 Oct 2026 05:30:32 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 10/20] dmaengine: ti: k3-udma: refactor resource setup functions
Date: Wed, 7 Oct 2026 15:58:51 +0530
Message-ID: <20261007102936.2402427-11-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000053:EE_|CHAPR10MB997722:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf41ef3-e5ba-4e2c-1b2c-08df245e0f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|3023799007|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	yxkSZKtrIOAmTy1yMBwWHTvp1jju4DtrQDMWF6q7L6HhsMYxgoz0Dq5GPa7QhSI4ucHsoxtO4g+EJX/lNDtctG2LcdE9/dmLgyEZmXn3/4/1zCOUXnxGdEZqZXWWOBveJ6rBIXw3Ly5dW8vXfOFpHNsalUrEIf2czcsnZkY/lCRbRmZou0lhFO87P9GPjIKd1j2NWSd+zzlG+ifI581xPH8s4p8MoSgg+myRRLsLPhKZvjXilWeBl5KamkUEzaKQisM0Jm6yaQvB3oYkmhammgGmtUNyu4W3JX6SH7MnVBAf6UKBl15KGtmIZdY80ygpZ8W1drr6jcVyrK7Z/5ueN3hSPYi6kt9OJ6e/ufRiDLIOTYNvOZLd5/fAstaUGTMeUdiMFJt9FB7OvMbWREYiZHgySks5JOLEkgfDmNzeEQmG5h/IhIcF1PmLiYGfgKRxXSQo/mP5LpU7FskPM571r2cHZvltBQ39IuBgEGC6KBwGl5NkfmF4I1ostJy/w5Ylo8lv6tnqOG4FDi3Sypm5uqic1GDImBmD8vC9eOxEF7bpoOLvbYawv6B4QA/RzewHRsQF4ubK9AqvtY4Fb4s16KiVAO3owNMW9A9vInOcZxj6pgRcfso3g2GafOnS6lv0k06Cv7x9st8nZqYB3P/ssA0ZxEXQiwR6+6TM7OspVyFRa6YGf+s+t5qMDPYuSSMQ7V879RSIMLXdO0hAi0qFbr2PjTLtKgMCaNQ4gX2ESvAsXq1PgcQdrQ5oWQDimlVC
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YUF+1EeO/ky5Nsu9vUSK/fZVgQfwor+FeBIhPS7SuY5L+nFmkz6sw+fXZANBr7zg5a3l/NYJBMpW1Nzv0qZwnZKUFQuOQRkG2crjlqcX14jRc1jTw/3L80XU25oUb0ZcCzmlCdkr9YK12T9sVtbSWn1ou+ZdhvfUM0LlPk7p4zFmSOPL+6FtqTgP6D806obDc2SAvYA3MoZBg+I1ocG1IlEZC4kSqF2B2B3KLWI8hc8wHOIUCj8lrrNy/YRbKdjuU+kPllnEnsJ7cutBMQogg5u4Bmt9fX37dgxZjCEL6qx4AgBFVoK3KvK5Woiem5RZtq4UISAbqyhXZR19SymGsdab0YMThUksl6fNYSsbsC5ejv6Zw37vIpadqYcqEby+lH9Z324vDRJ21C6whxCNmrw3g8yB0tO2LaDZ3Y9td+JvWRVy+7LlA2gYRiWI6Rjk
X-Exchange-RoutingPolicyChecked:
	a4v8v0dk5Dt3hDGzmVLjtcRBH2TkLKPPM/2H66Pniz9+3FZ0QCG+3poTOY0qlXsrVUAqxpugPduqyxsf9zB4eW+kKousAxQF7BxL1IDCTJord5aYSiJFEvYMyX0hY7Y9ZFwee2i0SOsepl15RP09jG2AJO/SuM8RHwGV99ibfUcf4xj5KsxtJq3OrIihF/ljWjrzO4ue1Sqx4EKbMlvAqY5d8Vlb26HctzZNw1QpkHeFt5WVmVxt3FnAgGarZbXOfWBw5tPQsGMGPpmgoBRcWP4Rmbs1EhUFzABZkF0mtCwmptff7fCR+sM683WqQaEUtWAKJMVR9s/8zw2xyeFYuw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:50.7822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf41ef3-e5ba-4e2c-1b2c-08df245e0f19
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000053.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997722
X-Proofpoint-ORIG-GUID: 2VyvmR9eyz3-q7p4FrPVakKc2XN4oju_
X-Proofpoint-GUID: 2VyvmR9eyz3-q7p4FrPVakKc2XN4oju_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX4k22xW5NN8UQ
 V8k3bDcEM3DJdZVM8tyPMgWoLdgiLW0JT4LTW1DkC2dJtgUdydqQOhvi99u9LFAFZolTv5Na+gx
 F32OnefDGsHlR/iKFngx7jjgHRpKJGthDd2ACvZEjSVV9MV3itiJO3HE36Dcsv0WxzjcR491nKB
 SPkURydAz+VaBIKM9bc2UZY83o2vKXl2WrCNpRoHLFurryuBdInfPvQ9JBfksX8CPlBFmt5+C3z
 npul3pxMN6sb1IllM34X+vcwq6GRcwfoQoI3MwlCSvYAfzZbEVhBkPmbQuMi0rJ+RL/XslxZDG/
 N3q4a4whtUTCjXzS8KG13OwiTHPYJqiUkUIVuvDFKz3SIEcA2eXnWnQNX5ma35sDtv+Q9HOaDau
 qLQ8MweFSCcUyLGkWcG/ppxDtjlFaMPl0VY0KoD1UMYg4ney4AjKSkY5xPQVpROoPcUybIn0tnG
 jU7mtHjgUzkz1EaxtJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX7gzXrXO+CpLG
 mPS/55IW8lPSiLeNwEmdRUVrSeMjpeSpKIBh/Isx3omq3fpCzT6aF7ud6VlsJTceMwZgd57j6UL
 nSQ/M3Vr8ImNo2zDqOp3/5KaK6Colwo=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac61f60 cx=c_pps
 a=6O9SViV89A8ZJb2Gg0v8VA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=I_B2hWj7ayHADsQg9NcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

The implementation of setup_resources, bcdma_setup_resources and
pktdma_setup_resources is largely shared between all K3 UDMA variants
with the only major difference being SCI resources setup. So,
- Move the functions to k3-udma-common.c.
- Split SCI resource setup for bcdma and pktdma into separate functions
  in variant specific driver (k3-udma.c).
- Add function pointers for setup_sci_resources in udma_dev and call
  them as part of the actual resource setup implementations in
  k3-udma-common.c to retain the existing functionality.
- Also since setup_resources call udma_setup_resources which is not
  required for all K3 UDMA variants, Add a function pointer in udma_dev
  and use that to call udma_setup_resources.
- Rename setup_resources to k3_udma_setup_resources to avoid polluting
  global kernel namespace with generic symbol.

This refactor improves code reuse and maintainability across multiple
variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 206 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 184 ++--------------------------
 drivers/dma/ti/k3-udma.h        |   6 +
 3 files changed, 219 insertions(+), 177 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index fe41c0cdd3c6b..fc4c3c0f571de 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -8,7 +8,9 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/soc/ti/ti_sci_inta_msi.h>
 #include <linux/soc/ti/k3-ringacc.h>
 #include <linux/slab.h>
 
@@ -2340,5 +2342,209 @@ void bcdma_free_bchan_resources(struct udma_chan *uc)
 }
 EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
 
+static int bcdma_setup_resources(struct udma_dev *ud)
+{
+	int ret;
+	struct device *dev = ud->dev;
+	u32 cap;
+
+	/* Set up the throughput level start indexes */
+	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
+	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
+		ud->bchan_tpl.levels = 3;
+		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
+		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
+	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
+		ud->bchan_tpl.levels = 2;
+		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
+	} else {
+		ud->bchan_tpl.levels = 1;
+	}
+
+	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
+	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
+		ud->rchan_tpl.levels = 3;
+		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
+		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
+	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
+		ud->rchan_tpl.levels = 2;
+		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
+	} else {
+		ud->rchan_tpl.levels = 1;
+	}
+
+	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
+		ud->tchan_tpl.levels = 3;
+		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
+		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
+	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
+		ud->tchan_tpl.levels = 2;
+		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
+	} else {
+		ud->tchan_tpl.levels = 1;
+	}
+
+	ud->bchan_map = devm_bitmap_zalloc(dev, ud->bchan_cnt, GFP_KERNEL);
+	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
+				  GFP_KERNEL);
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	/* BCDMA do not really have flows, but the driver expect it */
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+
+	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
+	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
+	    !ud->rflows)
+		return -ENOMEM;
+
+	if (!ud->bcdma_setup_sci_resources) {
+		dev_err(dev, "bcdma_setup_sci_resources is required\n");
+		return -EINVAL;
+	}
+
+	ret = ud->bcdma_setup_sci_resources(ud);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int pktdma_setup_resources(struct udma_dev *ud)
+{
+	int ret;
+	struct device *dev = ud->dev;
+	u32 cap3;
+
+	/* Set up the throughput level start indexes */
+	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
+	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
+		ud->tchan_tpl.levels = 3;
+		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
+		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
+	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
+		ud->tchan_tpl.levels = 2;
+		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
+	} else {
+		ud->tchan_tpl.levels = 1;
+	}
+
+	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
+	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
+	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
+
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+	ud->tflow_map = devm_bitmap_zalloc(dev, ud->tflow_cnt, GFP_KERNEL);
+
+	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
+	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
+		return -ENOMEM;
+
+	if (!ud->pktdma_setup_sci_resources) {
+		dev_err(dev, "pktdma_setup_sci_resources is required\n");
+		return -EINVAL;
+	}
+
+	ret = ud->pktdma_setup_sci_resources(ud);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int k3_udma_setup_resources(struct udma_dev *ud)
+{
+	struct device *dev = ud->dev;
+	int ch_count, ret;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
+		if (!ud->udma_setup_resources)
+			return -EINVAL;
+		ret = ud->udma_setup_resources(ud);
+		break;
+	case DMA_TYPE_BCDMA:
+		ret = bcdma_setup_resources(ud);
+		break;
+	case DMA_TYPE_PKTDMA:
+		ret = pktdma_setup_resources(ud);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
+	if (ud->bchan_cnt)
+		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
+	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
+	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
+	if (!ch_count)
+		return -ENODEV;
+
+	ud->channels = devm_kcalloc(dev, ch_count, sizeof(*ud->channels),
+				    GFP_KERNEL);
+	if (!ud->channels)
+		return -ENOMEM;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
+		dev_info(dev,
+			 "Channels: %d (tchan: %u, rchan: %u, gp-rflow: %u)\n",
+			 ch_count,
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt),
+			 ud->rflow_cnt - bitmap_weight(ud->rflow_gp_map,
+						       ud->rflow_cnt));
+		break;
+	case DMA_TYPE_BCDMA:
+		dev_info(dev,
+			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
+			 ch_count,
+			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
+						       ud->bchan_cnt),
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt));
+		break;
+	case DMA_TYPE_PKTDMA:
+		dev_info(dev,
+			 "Channels: %d (tchan: %u, rchan: %u)\n",
+			 ch_count,
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt));
+		break;
+	default:
+		break;
+	}
+
+	return ch_count;
+}
+EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 21978f17e327f..9a261747c8709 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2083,7 +2083,7 @@ static const char * const range_names[] = {
 	[RM_RANGE_TFLOW] = "ti,sci-rm-range-tflow",
 };
 
-static int udma_setup_resources(struct udma_dev *ud)
+int udma_setup_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
@@ -2245,74 +2245,13 @@ static int udma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int bcdma_setup_resources(struct udma_dev *ud)
+static int bcdma_setup_sci_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
 	struct ti_sci_resource *rm_res, irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
-	u32 cap;
-
-	/* Set up the throughput level start indexes */
-	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
-	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
-		ud->bchan_tpl.levels = 3;
-		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
-		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
-	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
-		ud->bchan_tpl.levels = 2;
-		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
-	} else {
-		ud->bchan_tpl.levels = 1;
-	}
-
-	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
-	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
-		ud->rchan_tpl.levels = 3;
-		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
-		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
-	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
-		ud->rchan_tpl.levels = 2;
-		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
-	} else {
-		ud->rchan_tpl.levels = 1;
-	}
-
-	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
-		ud->tchan_tpl.levels = 3;
-		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
-		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
-	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
-		ud->tchan_tpl.levels = 2;
-		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
-	} else {
-		ud->tchan_tpl.levels = 1;
-	}
-
-	ud->bchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->bchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
-				  GFP_KERNEL);
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
-				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
-	/* BCDMA do not really have flows, but the driver expect it */
-	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					sizeof(unsigned long),
-					GFP_KERNEL);
-	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
-				  GFP_KERNEL);
-
-	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
-	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
-	    !ud->rflows)
-		return -ENOMEM;
 
 	/* Get resource ranges from tisci */
 	for (i = 0; i < RM_RANGE_LAST; i++) {
@@ -2476,51 +2415,13 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int pktdma_setup_resources(struct udma_dev *ud)
+static int pktdma_setup_sci_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
 	struct ti_sci_resource *rm_res, irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
-	u32 cap3;
-
-	/* Set up the throughput level start indexes */
-	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
-	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
-		ud->tchan_tpl.levels = 3;
-		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
-		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
-		ud->tchan_tpl.levels = 2;
-		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-	} else {
-		ud->tchan_tpl.levels = 1;
-	}
-
-	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
-	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
-	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
-
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
-				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
-	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
-					sizeof(unsigned long),
-					GFP_KERNEL);
-	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
-				  GFP_KERNEL);
-	ud->tflow_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tflow_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-
-	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
-	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
-		return -ENOMEM;
 
 	/* Get resource ranges from tisci */
 	for (i = 0; i < RM_RANGE_LAST; i++) {
@@ -2631,80 +2532,6 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int setup_resources(struct udma_dev *ud)
-{
-	struct device *dev = ud->dev;
-	int ch_count, ret;
-
-	switch (ud->match_data->type) {
-	case DMA_TYPE_UDMA:
-		ret = udma_setup_resources(ud);
-		break;
-	case DMA_TYPE_BCDMA:
-		ret = bcdma_setup_resources(ud);
-		break;
-	case DMA_TYPE_PKTDMA:
-		ret = pktdma_setup_resources(ud);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
-	if (ud->bchan_cnt)
-		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
-	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
-	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
-	if (!ch_count)
-		return -ENODEV;
-
-	ud->channels = devm_kcalloc(dev, ch_count, sizeof(*ud->channels),
-				    GFP_KERNEL);
-	if (!ud->channels)
-		return -ENOMEM;
-
-	switch (ud->match_data->type) {
-	case DMA_TYPE_UDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u, gp-rflow: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt),
-			 ud->rflow_cnt - bitmap_weight(ud->rflow_gp_map,
-						       ud->rflow_cnt));
-		break;
-	case DMA_TYPE_BCDMA:
-		dev_info(dev,
-			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
-						       ud->bchan_cnt),
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
-		break;
-	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
-		break;
-	default:
-		break;
-	}
-
-	return ch_count;
-}
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
@@ -2747,6 +2574,9 @@ static int udma_probe(struct platform_device *pdev)
 	ud->decrement_byte_counters = udma_decrement_byte_counters;
 	ud->psil_pair = navss_psil_pair;
 	ud->psil_unpair = navss_psil_unpair;
+	ud->udma_setup_resources = udma_setup_resources;
+	ud->bcdma_setup_sci_resources = bcdma_setup_sci_resources;
+	ud->pktdma_setup_sci_resources = pktdma_setup_sci_resources;
 
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
@@ -2876,7 +2706,7 @@ static int udma_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ud->ddev.channels);
 	INIT_LIST_HEAD(&ud->desc_to_purge);
 
-	ch_count = setup_resources(ud);
+	ch_count = k3_udma_setup_resources(ud);
 	if (ch_count <= 0)
 		return ch_count;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 0b0626b67ad19..4dd597ef435b8 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -358,6 +358,9 @@ struct udma_dev {
 			 u32 dst_thread);
 	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
 			   u32 dst_thread);
+	int (*udma_setup_resources)(struct udma_dev *ud);
+	int (*bcdma_setup_sci_resources)(struct udma_dev *ud);
+	int (*pktdma_setup_sci_resources)(struct udma_dev *ud);
 };
 
 struct udma_desc {
@@ -644,6 +647,9 @@ struct udma_bchan *__udma_reserve_bchan(struct udma_dev *ud, enum udma_tp_level
 struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 
+int udma_setup_resources(struct udma_dev *ud);
+int k3_udma_setup_resources(struct udma_dev *ud);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0

