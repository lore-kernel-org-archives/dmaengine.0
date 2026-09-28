Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1499C30594F;
	Mon, 28 Sep 2026 02:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564327; cv=fail; b=jxQ8l4xczkVig42m8D0J6SUXH+yDqKK76gztDUMqTJxFN1ZVZMzod13do451HD5TIWVx9nlicAk82CeNAbCU6I06e7qUm2NYB5DpC/wjRvrLW1poH4GZhTFgdcAuJGBD1ceOnLxb5bS7g2ABqdMF4wvCj0NQPJw1t6j9cPc91ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564327; c=relaxed/simple;
	bh=Yb68ywnxktAOqzC7HH9iP2aGbIV1+15VbDByTdOE3mE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGYqgkocKBpRLvWkXgqAVwFNLpnU6hZJOTXtYiWAvFcJ/SzvQWOX0dw07GPwG3/iyv808AtIv2K6w5cwjC6NGCVn3nfhaxKt/gw1N1AUgrLH6uFB/RIrKileKhipYkB5wjRjoozJR65zrmJiA1GPvVsGiUo6p0vzdXQ9ZbLh+XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=NseRCowA; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mjdY4k33; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="NseRCowA";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mjdY4k33"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RMIQXK2806212;
	Sun, 27 Sep 2026 21:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MQ7P50QmbBfwGmZaR3Z/gNisrqNUd3IhQuygJr1B3
	UY=; b=NseRCowAPitS1+Zgpvotjh9smq89eu2npkNVVFnevyRI+C2D2nn0k76fE
	s0JiHJ/W1+ffmGsXB1cZlteeQcTJnCt8F99W9ejtimXLZPQ75TPybTzu0wzvYJ2F
	MFylFjrYN1bcp4QPzdZKD3rdvZocdsgx7pPYSr5agH+tkCz5PCArgKwZwyZR8Qa8
	S+CKAbzywksjQxO4y7ZuIi+mD9n9446/TulWQEgy8ciNEtwRiKbcS7ZpIlDx62UH
	cURXv9YxYINTqRICV0mv+/luZqIjeFDpccTmDER8KK0H1TZIFdeo7kLRJaRu6acx
	R4RWkjkSfcDwGBzU5plcrqSB7Pykg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kfnp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:58:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc704lb8oGKduUhkNf8pNrYDLOxbc8PpWsQqEcTRN6o1fgEAIg15A3NoIwGZpgf2Sn4SwCkliiMou5qlRTVxYoB7yCtMVEG2O7az2E3hRdPRCdjQYzIkpZFt6dBSBPh4yOMYCTXPxVyZaGT3GHV4rlCQlqlKV45fc1w/tTr14hsZhswRT2UmJx60JtBgWSC4xjuC3jwXrowRVewee/+YhlDf6a4jg9jU7kBIhY0YxBtWvTDnE6uk1fjfP74g9CBSIDo5ctHVvDskxyEC+mwx9k9XvbtTgc9CsUp26e4PqBU12Fd6YwBZuRB1H7IZZdQFBA6FaPGV4totE0GYUDV5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ7P50QmbBfwGmZaR3Z/gNisrqNUd3IhQuygJr1B3UY=;
 b=ahUGolDDKN+ihKOMBsJXFVpGslnYNf1Y4tsBwLIr6YgFfyVi5PnqKb6GXKrXme0Pc5edwm3FD7nxym5zSphxHAlvrb3VCZNCCLo3wc7lMY2q20dljjOvoRIf8oqNu6qY5V8n4A9sA86rVOFL8VYHlzgysWr4zDECR3aJqtI44O25nySwo/C1Ulbi6a5gcKvkf0L+9W02tcYTIxr2x0ExhGtfCnN3nfoEGbbBE40HWJDihIV0wcKdo6mcQ1EtwZ25um6cG6abSHcxXRU0BQw61d7NP/wbamEja8J0cL7bNzX9oHKjdTpD9r8EWqJgAz8tce2dgAQd+D2oQbC1GhfTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ7P50QmbBfwGmZaR3Z/gNisrqNUd3IhQuygJr1B3UY=;
 b=mjdY4k33FwQ1MsMOA7eFssy90CAEe3COMCq1P6no8x0AmlP6a6lolIkRphCuDARcUnlrxcx3hLTlw064heiV2a352njbZWn97rh9xkhWdgEXCvDDx2S9wi0wIK1f8v018qGbbvI4Ikvw4I6W0uB0DQx55gI9nmFPB0R0LPU/aYY=
Received: from DS1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::16) by
 CY5PR10MB6238.namprd10.prod.outlook.com (2603:10b6:930:42::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Mon, 28 Sep 2026 02:58:33 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:8:455:cafe::f) by DS1P220CA0010.outlook.office365.com
 (2603:10b6:8:455::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:58:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:32 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:02 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:02 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqq82256662;
	Sun, 27 Sep 2026 21:57:58 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
Date: Mon, 28 Sep 2026 08:26:07 +0530
Message-ID: <20260928025749.1055383-2-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|CY5PR10MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 08327734-46ca-44f6-d551-08df1d0c6187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|1800799024|10067099003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	Geo6Y7CeHirC3MzSB0As+slScrbMz0nNtAYrWVpg/XKUg/MKrQDyDXNtYSWH2QPf96RfO2dnEq7W0UYxsrHzi+7F3+eFtYRIOLwRHsdtSYqoLdzhix3p7lrrmmHoxbVXXCCWJMonWEwJwgnC7tLlTTMvSsxpXfue9aeaBm2rIXbAq3Y853kUMQPlA32mSpGYKOfzzSTuIVjzZi6/ZpVTzhQ1YRRHRngg4iMLEkL/yaG5SGD2DQO+83N79r1NlFW1HL7H9dhW3zZ0jhP2fmxaofBHMRYDDiE2xuYdB/eXqUs/QpBb3h4acRNoGGxkYPb5DUo9nOl7ZnA7P5Gt7DOArzHT/n2K0SLFjaruefe8Z+bRaymMEaQvxUrdUyFyDp+YmVL31ARR3G16zaZu1RaxLcp4+8v19p6mLc5W28cewYWWxGfeTjXDae+aYaALdLDoICsBFpDWDztx++uFH90okDBAXR53jKSmJ0cVT0dbanFId/v24U6lCS62uDx52kLIBCAKfrByEFT30URiPrGAw4UGi4rbK2L7+21z73qEA6xlw0e6PSWwbDhllPOrVFSYAHVWBTuo7NPas8AhjoeP98GIIDxqVYn1cziUR7PYVHD2vXTWk4TJsbudE7WGOrZISDth6GPwEL64BbYkMoWDDmIuw8xUH9jb58ABp62YoAwWjTqagwJcXByvRVJeIhOPdY3DaNJdg3kPWmob8G07lWw48M0NQo8dx2vIsC0xapvmjbppwYPHfOZOL6rwJrwo
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FgzqKzOZ6n8g9Q+fqOeYBS7eyHgxMzQjkaeJwA5ouAB5Bo5bOSh1rDmLVZcCB8pBjkcD6+NmFI6TnLhRnf5ETmVl8DqMzG+1PyGKeBPcSEW66z2z3EWstjIUb325DY0+uKtxHoHFwZENeXEwKAnsQTeUVOThWIaQbmWfJQJTNyccc2hbWzCbU/7DlpV8HfoE/plauQ9BMxsK6zy7kvnbB9BfDZEhyNs56YFZdQ4a5JaCIuCxRrrVpFLbHJWCgQg4P26zNqWlvCEsl4+yYPSDE/VitzA3Gvalvse1iGnhWHIREWLaxUcMSEoO2ZQacbVNPk+2J7lmlb0zEq7f0kBxlfwGzShW4D42cdwMK1/gvRQbQF43Gp17c5nQXUqCbUKy3LvxwGWIhaBocmAnou2K2nTYAyGXgeoDBhAsCdXEVOkrStWN7xbwBpLqTxEKBc+F
X-Exchange-RoutingPolicyChecked:
	HJBnT8vh0dHPzliUsC9smnC8K0C5TDnmhKBEzDYDUN96eEM5jjsyOolTTXygQHV0L4XfUAflOhSBlcAlKE0hQjwgRSeqDX/uaBkUSiL2Nm1qgXvekfr7cWEcBEhWvYUHjZU3rZoT70fPRWEHPyqF2Eq4Vg+BGXWXpMaPR8otVPn0LTy17RZtJ/fTFMG09QInPeo40O2S4AH/mRCKM/U3WQna4bG318QkKZt4E4TAxA0bERGQACk8e81BEDgo0t4E+sJcB3weqgUGSvZyQ5unuw3lihkAmINw2ce3am/VC8thUaRjDSHLBqD9zUEcJhCFgUHyPN8uBYbDd7YFw8long==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:32.1952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08327734-46ca-44f6-d551-08df1d0c6187
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6238
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9d7dc cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=YS4YLeW4SzYDQNh2yKMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX+qpSk79nFZBw
 y51Vf9OWvqAJPJSoeFAevm69V96wLnBRg6ZV9urnDiLgGj1j87lunXQNuyCWw8K0lXfUCAV8Nmq
 dj1twfqFsyHXDc8eIln09SG3YG1HTYqeg2oG61c2PtUZmcerCKZrUiwN6RLjBg6rXA851BlCrSQ
 HV3KxEoExTaxb+BQw67rVmScmTH3fM+iJbmLgTl//cXYdRXsSkcgCAUQRIu/Pfwl5ex9tbfcaYl
 Svyhog18QuWFjUgq860sspjqMZ4UuY13PDE/uWK8+Trpl/ZrY1lp9ib3NPneu5vJSrmqAfadkzM
 FnzuJY0c/r/548LBBb5dOQMg2uAICAR2xv9EZtcQ9jSM2b2tyVUFBHDbnZ2q3v7GQYkXVYlqW4W
 0GtX7ncGlmbyh5CdkFFigW2O5fymrUm+30nYj2MN4wLyQhUSr9IoaJZHTu7pzyKe2FeidBkXCPK
 evbP67gMMb+qkAryXfg==
X-Proofpoint-ORIG-GUID: E8yyCNbGfJxiuwDUoykaOcIB4nmQDpKp
X-Proofpoint-GUID: E8yyCNbGfJxiuwDUoykaOcIB4nmQDpKp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX5lU8KVy9eRns
 JhJEvxEcwm1At0KulJkFlfJYqP1/WSxNBN2Xl9l/KFrZPITb+PrqZtqtF975YEGhjCDEi6xiTF6
 xh++UU/MjgBzZp+dWQMLv5YQDQJSZ2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and thus can contain garbage which
can lead to k3_ringacc_dmarings use junk address for ringrt base leading
to below crash during ring pop

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this by explicitly initializing the variable to 0.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 78a67cb9d6e00..8457644cb9132 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
-- 
2.54.0

