Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B06405C35;
	Mon, 10 Aug 2026 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374889; cv=fail; b=sOVzpgoJIlM8ExFtmATAj5tRkqaeJN+lnqVwZcjRjwYgqyctTBUjJIjJan+NIgcOIGx+9QUwhU/W+VWhpPLsaZggRehLfRnY3fvRpI7vIXwMV0cX73iNbvBJd7by4zS0S7pOq72dqBOEK4lkRBvVENjp7AtjxF8usE9e9TUxiHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374889; c=relaxed/simple;
	bh=X/psp7MjKuTyC+9yOopc696NhfNiAR0y1OaUiSZ/l5U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mMSL3i+aYK62osR8kRbRMfw6w8X0LWNvJA/TC0Wv7CXbSZZ7325IENlzcggjveq/f6gOhewMjttEO9FWYyc+BKJvthv6erjytvTz7VhdKhkm0mVL4I/CZAur2tLnIlnagmX3MkGgm3rB9UArCFgMiE/kLpgPjQd0pxDAtBgNCFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=g7DF+NGH; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YPjNEZNc; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="g7DF+NGH";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YPjNEZNc"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUarE3620346;
	Mon, 10 Aug 2026 10:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=4NMsbBLoSpCch
	MEjSwPBKET6ZbeTYtxaAZRAiIXbFlY=; b=g7DF+NGH1dR/Gr3uwtFC0M+UmLv64
	qEbzA49ARxIoWmqr37zPGYooMe3ZlyLQ/+3Nx3pBQHnWMS+uXaqy4dXpkH1h51J7
	NLkuKHzO+SIPj+4CN6FIqlMN+2JS5rs1DAU6DX/O9ynmXd6gxMXgkWsKCwER5qmV
	axEJXUFPl6kFtKdJawQvJ91BOMO6AIPbTaKD5tM++nLIfbOx6+tSXTt+rc0Vif7L
	tb+Bwvnv75YoWamTDUE7yY4Gt911vunyr7i4Vih6MehxihgUFgZ7GrT/F4/Fww1D
	VZLjOeVJpQ6fF96NXn/6Pc2ob1KNarxvqX1cgUzv4gp0WcnRw8lYN9Zag==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79grb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:14:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0phJJjTdjTqp1OVhq/gSf2xohzecep6VvEdBmDSbMTCDdLz4cXPSb9yqzbSzUcJSMmQs9rDa6gbf3a9UjJMSpE0uMLcPq69SsyIVWB40i/xxY1PCX5DGrvhzzTUE5aMa2sCvoV5OR8C51xWwn+8PXtk0wa8t3RMHt1FyQHozKZr0/4EWacO7c5MnX+Uw94jlg+hoBv38zqFKQ4DLeGemVbDjGBYI0+0OnfPRwJ+YFyXDhQqlseCnBGc+aOWXAiiAU5h8plXxz245Xe3nPsu4gtN/VsfEC1ZrfCNCfX2nExZuzA0YTeS24fXpDddg7B0d7i48LXct57YCooqFGCMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NMsbBLoSpCchMEjSwPBKET6ZbeTYtxaAZRAiIXbFlY=;
 b=j+QysVhpX4ddQw6WfpCtI+U/9QobIAzldo5NgCo0S8j1dQx1KDMxJSqVJmemo6uWhVCG1AKIgKfKywhJGZfTc/dCGZWEHFJRqBICfKRH/hLC1RYtmreUW2hEDFvmi4AF/n22nCqEZN/1gXmYyY+rLteR9EgSmG58R2SVqtngR1ifBPkbifjHYOi1xLclCs5/Ylk8GPz2U956CDTDmnBd59e5BDFwjfdAIWe8vIftLmgwFB9Z8WvExXvPNtlQWI8S2iR3NiYQa0yPm5I0OV2wC2dPU1ZZfglFTdHtRUE5ScboDrW7LtmJjjJX1Fplo/hAXyKqso/0bGerCZFU+CQOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NMsbBLoSpCchMEjSwPBKET6ZbeTYtxaAZRAiIXbFlY=;
 b=YPjNEZNcCTymDmbElg2F5WoKJiGGU0kjGh2v7aZsSFmMaBlv3CXT9AraJq4nG9TF/1enau25ltdRpJfYAHM20BFCjlO+Wc1qz3LLLcsPtnF4MVbiXiBRlaHqK9ZamxdWttpvDt+F2scwlGgjUhb725AaFChL6xqiIbuEKXx6ERc=
Received: from BY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:1d0::27)
 by SAWPR10MB997855.namprd10.prod.outlook.com (2603:10b6:806:54d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:14:37 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::79) by BY5PR04CA0017.outlook.office365.com
 (2603:10b6:a03:1d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:36 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:32 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:31 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERVt2648613;
	Mon, 10 Aug 2026 10:14:28 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 00/19] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Mon, 10 Aug 2026 20:43:54 +0530
Message-ID: <20260810151423.1948224-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|SAWPR10MB997855:EE_
X-MS-Office365-Filtering-Correlation-Id: b2eb05cc-8806-4d84-c2d9-08def6f21785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|23010399003|13003099007|921020|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	C46aNKNy4Ht3JVCxZb9PXbodlH/8ELs3BFnZxYTvOwPdTLPjpDWguXyGTm8ievS8CCTpbfNirg7228KBE7XkA7doWch+KAA2QPWHUZXqr9ikVAeZB2u4Q0oDqBb/723m8aRcZo3qG7aRuz8r78UxYclJST9r6GOdi245aAU2qFO91XgmSyU51KO16RBO5e6UDrDw4OLHxnKF3mFKgvgsXpEAFy0s4y8Ez0OCh4HmfR7plzBSzAuemXlpRctctEyfAmQjj7Eo+i/tfkOCmIkNqpcFB/eIRVW9anNfGSoxXurXXomjCT75xrn0NMkL2lef8kbGFf4rqTYo/AzJJNFf8SsUsNc8RoWMFknoBmPpzAUtqwj0KkvZbaqCoH8Bu0D+OXNbD9RBqcRlPaxTsGX232a40bdKeuRxQlnGOP4EDo4m3p5WD1ZVtn/M8SJvUJg0GILjn5z4M29WFS2uYmJ4TElYV0VPv9D6nIRBxFiAfYzGYFLUyv6wwi18XGbADr8+0REKwTD0lbaVpljbnXBwNTqX1Ql/0cldWTyVnRwciImqU1r7y2RmlZKdv+w/g2KLLNMeNGpHdysXei3EDpAgCahjDesIEDR8liB0547ekKB45Tj2KW50pzbcNhGbCeB7yJQC5gRCEihUlvo3XTr18fk7zpXkkF5cGvzbqqKs4bCHkCoBmjOfCg6zKv3d2Cxi
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(23010399003)(13003099007)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xHiKo0ji1etOyWfaC/rGfLmBuYVNi3N5XIn135QBX/9riRKPh1l7rqdCpNL4hwPgkOIOgXTWew7BHNbo+X9TRHpnV5MGixv5CBiAJ/AaHxiYpdcQiF+MzGTtEc4Hyt5TdpXiUOC1AtrgAGtWEKX1RMqSZBdSSxuvF/pfj91C/JlnEgtvW8NngA+gHuNpfh1SRXQmFbTDOxie1hoLMhcAn/WGSpbx+u9/m7cgk1NQtYxrH7PluaDlmM5hb1vVFCx8apJ9MvC7OpBjpsxT5AsEPl6HJOEkKXpjC0nTJ7Mw57SykkpJUWNyBC8+yXM0q1TT/ul2Wc5/cLEThW3K3UashjidzotPg/p3kutppStxsaCk5XoU4nqJJSNVMHTS/8fPytVUvRPETlnitYyYLxSOMTcj579pNuN7vnDPleg2nFJoEvyowE/DVrWtK5ht+bvr
X-Exchange-RoutingPolicyChecked:
	AmhKgMFVE/5i7RYhC6aT+uviEjsCmNkLeaoyTjJwp+oR/ea0zm5UHxG0HpjFTZDwu8D38W/aBaqac64dVi/bqxH3maGd41Fq9NkHLq/DGhFyPeAH3vvyR8oeCnxHHOJBT3GFP+6ZiP8t4L1C4i6/IEMCCRWK6LZbquSUM9LXfxV9VbpPDxgzLWxn3vyD4lBYtdngFgJNZCQQp1yE1wm4Ey2N2FSJdc4m3DaGVmUiae2iycmv09htxLSCtK8r9BRv56fqgY0VGB42Iu+6LsefKec8pAPi0IXS1c42WoyJUc8u35XC0bfXZZi7Scb74lAVJ5WaNLFknbgzbDsC0H3qAQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:36.9035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2eb05cc-8806-4d84-c2d9-08def6f21785
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997855
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX3vQlxGt+nzRq
 hrrFEoDWXhvodrOjWdn6PMN5WMMQfPz/PcK70lTErbphX0opKI9tS+lXNGG4yJclEU/2vE+mRjM
 TbxOawRMFl9gGjS7KSK4sHSTD9Fm1jXRdwIk62kjyBV7MJ/ikM2qr3vVAY136Q5K55ZgmMNzAW0
 IRx6bCnwP+ln8Sbs96UFEJxcfBs2WXEApat9pSbtb9IvioBw89nUdsBNhdB4a9co+AXTWtXTf5b
 o4HS0eOEAUjb/JufVW601IbB1dJykv4g44+EKfYhxNcBleAyPy+oIN5Qgbyp4gyg4A0arsZWN9M
 bgIevqLgrWi7H5mX7hzpfAdbXt80tDVKEU5LWi+nrsBXyr3QtrBmwl/xW+acIdl6bwCLh9iKb8M
 vOaAar+3B+VVnJ/Sw7uQ38l4KXK0iE194lWuIlSnCN/0QmGIoUni8b9SUqI1Ge2ci/vHG4LoJFc
 X/Gntmz/jp4Ha9Edc0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX3e0l+Dv4C1AC
 qLuSA7now7IlkcS2IhrJJ624h09YeLB5KuIujHovD5IqhTu3ciUgmGZ7hWDvqFhXG0zUt1fAHkL
 Bo+rlmJFSwoMxPYnRbZhJEk/6/aPW4A=
X-Proofpoint-GUID: QZknFYOuoEKanK0U931vclS1ecEAmqnL
X-Proofpoint-ORIG-GUID: QZknFYOuoEKanK0U931vclS1ecEAmqnL
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eae0 cx=c_pps
 a=fLgsFiGMcCN2bMhaTK1NuA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=8zHKEGWhLnqdY6mmISQA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

This series adds support for the BCDMA_V2 and PKTDMA_V2 which is
introduced in AM62L.

The key differences between the existing DMA and DMA V2 are:
- Absence of TISCI: Instead of configuring via TISCI calls, direct
  register writes are required.
- Autopair: There is no longer a need for PSIL pair and instead AUTOPAIR
  bit needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to PEER
  registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Full tree with device tree patches can be reviewed at:
https://github.com/sskartheekadivi/linux/tree/dma-upstream-v8

Changes from v7 to v8:
- Fix issues reported by Sashiko which are introduced by this series
  https://sashiko.dev/#/patchset/20260724102115.2854-1-s-adivi@ti.com
- Remove minItems for interrupts entry in both BCDMA and PKTDMA
  dt-bindings
- Update interrupt-names pattern for pktdma from tflow-<n>/rflow-<n> to
  tx-<n>/rx-<n>.
link to v7:
https://lore.kernel.org/all/20260724102115.2854-1-s-adivi@ti.com/

Changes from v6 to v7:
- Rebase to next-20260721
- [03/19]: Add missing includes
- Fix incorrect register bits used when configuring rx flows.
  Add correct UDMA_CHAN_CFG_FILT_EINFO/PSWORDS and
  UDMA_FLOWRT_RFA_RX_EINFO/PSINFO_PRESENT bit definitions.
- Update AM62L BCDMA and PKTDMA dt bindings to remove address cells,
  redefine dma-cells semantics (mapped channel id for bcdma, hardware
  flow id for pktdma) and fully enumerate interrupts/interrupt-names
  with restricted naming patterns.
- Add fifo select register write support for XYMF channels in the BCDMA
  v2 driver. Update udma_v2_filter_param to use channel id instead of
  remote thread id and resolve it via psil_get_ep_config_by_id().
- Switch channel resource bitmap allocation to devm_bitmap_zalloc() and
  ring IRQ registration to request_irq()+IRQF_SHARED (channels can now
  share a PSI-L/IRQ line); fix the ring IRQ handler to return IRQ_NONE
  for spurious/foreign interrupts instead of unconditionally claiming
  them.
link to v6:
https://lore.kernel.org/all/20260428085202.1724548-1-s-adivi@ti.com/

Changes from v5 to v6:
- Switch from interrupt-map to interrupts and interrupt-names in the
  dt-bindings.
- Reverse the if DMA version checks to check for v1 and else v2.
- Add new patch [01/19] before refactoring to fix sporadic crash
  observed on AM62x.
link to v5:
https://lore.kernel.org/all/20260218095243.2832115-1-s-adivi@ti.com/

Changes from v4 to v5:
- Introduce a new version variable in udma_match_data to differentiate
  between K3 UDMA V1 and K3 UDMA V2. This simplifies the approach for
  adding any future possible variants avoiding complex if conditions.
- Fix both K3 BCDMA V2 and PKTDMA V2 dt bindings as per the comments
  from previous versions.
- Fix minor nitpicks like following the reverse christmas tree order for
  variable declarations.
- Remove the patch [v4 19/19] that switches to synchronous descriptor
  freeing. With this patch, dma_free_coherent gets called in irq
  context and hence a WARN().
link to v4:
https://lore.kernel.org/all/20260130110159.359501-1-s-adivi@ti.com/

Changes from v3 to v4:
- Rename the dt-binding files to add "ti," prefix.
- Update cell description in dt-bindings and add client examples.
- Update k3_ring_intr_regs reg names
- Rename soc specific data to bcdma_v2_data and pktdma_v2_data to
  bcdma_v2_am62l_data and pktdma_v2_am62l_data.
- Add a new patch [18/19] to fix a null pointer dereference issue when
  trying to reserve a channel id that is out of bounds in
  udma_reserve_##res macro. Also fix logging issues in this macro.
- Add a new patch [19/19] to switch to synchronous descriptor freeing to
  avoid running out of memory during stress tests.
- Fix checkpatch warnings.
link to v3:
https://lore.kernel.org/linux-arm-kernel/20250623053716.1493974-1-s-adivi@ti.com

Changes from v2 to v3:
- Fix checkpatch errors & spellings.
link to v2:
https://lore.kernel.org/linux-arm-kernel/20250612071521.3116831-1-s-adivi@ti.com

Changes from v1 to v2:
- Split refactoring of k3-udma driver into multiple commits
- Fix bcdma v2 and pktdma v2 dt-binding examples
- Fix compatibles in k3-udma-v2.c
- move udma_is_desc_really_done to k3-udma-common.c as the difference
  between k3-udma and k3-udma-v2 implementation is minor.
- remove udma_ prefix to function pointers in udma_dev
- reorder the commits to first refactor the existing code completely and
  then introduce k3-udma-v2 related commits.
- remove redundant includes in k3-udma-common.c
- remove ti_sci_ dependency for k3_ringacc in Kconfig
- refactor setup_resources functions to remove ti_sci_ code from common
  logic.
link to v1:
https://lore.kernel.org/linux-arm-kernel/20250428072032.946008-1-s-adivi@ti.com

Sai Sree Kartheek Adivi (18):
  dmaengine: ti: k3-udma: move macros to header file
  dmaengine: ti: k3-udma: move structs and enums to header file
  dmaengine: ti: k3-udma: move static inline helper functions to header
    file
  dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c
  dmaengine: ti: k3-udma: move ring management functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: Add variant-specific function pointers to
    udma_dev
  dmaengine: ti: k3-udma: move udma utility functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: move resource management functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: refactor resource setup functions
  dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to
    k3-udma-common.c
  drivers: soc: ti: k3-ringacc: handle absence of tisci
  dt-bindings: dma: ti: Add K3 BCDMA V2
  dt-bindings: dma: ti: Add K3 PKTDMA V2
  dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
  dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2
  dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
  dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
  dmaengine: ti: k3-udma: Validate resource ID and fix logging in
    reservation

Vignesh Raghavendra (1):
  dmaengine: ti: k3-udma: Fix sporadic crash on AM62x

 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  |  211 ++
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml |  189 +
 drivers/dma/ti/Kconfig                        |   21 +-
 drivers/dma/ti/Makefile                       |    5 +-
 drivers/dma/ti/k3-psil-am62l.c                |  169 +
 drivers/dma/ti/k3-psil-priv.h                 |    5 +
 drivers/dma/ti/k3-psil.c                      |   78 +-
 drivers/dma/ti/k3-udma-common.c               | 2605 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |  205 +-
 drivers/dma/ti/k3-udma-private.c              |   37 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1515 ++++++++
 drivers/dma/ti/k3-udma.c                      | 3126 +----------------
 drivers/dma/ti/k3-udma.h                      |  602 ++++
 drivers/soc/ti/k3-ringacc.c                   |  191 +-
 include/linux/dma/k3-psil.h                   |    3 +
 include/linux/soc/ti/k3-ringacc.h             |   20 +
 16 files changed, 5916 insertions(+), 3066 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.54.0

