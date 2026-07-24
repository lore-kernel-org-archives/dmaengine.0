Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F6D429012;
	Fri, 24 Jul 2026 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888535; cv=fail; b=FBMGpIuxDNywBqF8v3EDA3D9dGivhWltNYWCYCDv6x88Kynqozs99AF1I6AX+vzcPmkUHIWhNVwbmsoLi6UlUWxEMyLGzaenijMs7xz5J+psaRZ63NCvLm+VORCbHNvpI4ktI2tfBg66vp2mV/EDsUQyZCHR0d7ofmPyGwN22cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888535; c=relaxed/simple;
	bh=6tFss4a0Cn+3wmfZb6GktKinic9fbk20M9Jn+WhU3UI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q5rqdJ6glM+/IN5792zZ+CLO2/nXwGGS4CWvX4Bmo76UgR7gIJYW/aGTUQeW8oFLQRgJG1UyiWMM0wNjcemWB2unhY+9HTWTEleVSQKqBMXndu/LETShYfr+52ioDNMIsrtzDc3sQUhen1WumDUQgssERXWjP39Bm+HOLQT59nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WP9SXlLv; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LNi8x4V6; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WP9SXlLv";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LNi8x4V6"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFTTi1093779;
	Fri, 24 Jul 2026 05:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=fRsVmCpKUdeNg
	O+dM5p3mH2L69jR53ni/a2cVZk0O5w=; b=WP9SXlLv1AZkiAlj6pzg0baaXKCxo
	gzVPoVawEBDp3wA1AkkMwYTQpknQxYQAjYWp06ULuqsBF3YcXkMCe9QHH+/bw4X1
	C3XM6Dr3u/VwnsUhn/x+z75x8sWB4WZomZxgLDfuJhtOeogCrsO84bwGpzSWs+6E
	4YpLXGjprMU1tp8ioEQYYKm/g0HTRUp3KHN3jxZQCMkh4bpLGMfkwiV3jCXYfLjn
	YErr8CUuaZYVa3gyvRoogGGSwMFcJ19ViZ6eWeJvW/XnJD/hPh4n2mZYL4oGkBjV
	NiEBSFqEo4pu0sUfmiI+AvT1hKpgQALEaskOmHlv61OQXlDOAXaHDL92A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7j3vm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:21:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW+7OOaYSYRdFhqIGKIG3eN4/u4Au/vFWJoBUvwgbCVge1JaKn8NsJQ4See67iryNYIjFpTQ7R03MjDJmUHO8Gc1K2ICeZjPOJxD7x8Q4um9oONw4S1cOAo9uRH/WEj/UNVvOwvjFEJ5Qg9xsC4cjjTkERAq7tT9qqXL9t9fisX8W8TSFo0/ggUkrqd5jH/rdFaU09EAbQZViLHyAPjCYHYMV+eCP0QrWA3tuyukmBfEdT1m+PLYqeItZzAp26WBcKh1+JGbDJmsJlJo0fcNZCq5zocTXSbtrugrNnQB1vZ2YDAkqtH5aYOZWTnOs4icBUvlt/BNBR5SBPgdNhrJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRsVmCpKUdeNgO+dM5p3mH2L69jR53ni/a2cVZk0O5w=;
 b=KQjauUOe4XC+3gsWatgoki3PWemsAPufdbcjD21D5HBrZFAtA7hRrVV0B1y77gWB4XcdYMUQeGVcMqIGY4+NcoQNXXEKK+tkdQb8OX8N60XY//J33MK9JLYy8jbshhGN86nr9NzUHqfS/NV6dEXJe4TjOUpu4ppOp+WV1xKex/KbnuSsTgxcXbJvlAYjOmd+aJk4H9Et28K9T2UJM7n+2nXNkWQSigg4dJwxPhjd8Tl5cYvsDQipg4VdpQFsdY5JzwBdhS5THg0cP/6QK2RLNSxoyWSX6ewFneMAvbfckgRx8fYuB9Kqz1J7eDU1MwcjcrfhlYr/aDerefEu7E7KMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRsVmCpKUdeNgO+dM5p3mH2L69jR53ni/a2cVZk0O5w=;
 b=LNi8x4V65XmHaXYNe9AuIIQnKxP7qMiQPSeEJYxEFQAO62AlCHz2W/TXEhncBWWFBzW7qjz/0gYq7DVYunStuF8ZTuPgQsJhCSHTFCS20V+f+cQKbJbglVoBYbqrHeVTEqwsmLR02Djajg66Z5vU5DAr1wr3J0o2d6BIW9Dwrtc=
Received: from MN2PR06CA0021.namprd06.prod.outlook.com (2603:10b6:208:23d::26)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:21:34 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::b) by MN2PR06CA0021.outlook.office365.com
 (2603:10b6:208:23d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 10:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:21:32 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:27 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:21:27 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFF3017088;
	Fri, 24 Jul 2026 05:21:23 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 00/19] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Fri, 24 Jul 2026 15:50:33 +0530
Message-ID: <20260724102115.2854-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4a199b-5672-4e48-7c01-08dee96d5583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|1800799024|6133799003|3023799007|56012099006|13003099007|18002099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	xGDySyZEzq4CadE1aEW6+dPPoNNwzgjRaoK44+ssGQdEYw6pttrqrNBVhEDkH+Z3YT2Kfp6zvghzq3kXgyaYyfC2mpxdxU8Lp/v663SgFGn7qQ0bOR98Q7RWQF0vPJWlz5Oj2ZZDDVzEk5bwbLpZXsK9PxpduXI1BFoQYXJSUwjrAS4rbQz4X3QmxS3o9eQqHDHM/TuBHskF5fidJFHKwmEwVYnay6mQrtjjLcRZaHtaQbmPEVE0mADjq5Wf+Lz5i9nI+L2CVr+61UFB/5CoshxzDf7PcySy4/15GPV/QjLN4mpBe2u/vLHmAghASDEyYq7gR2PWfevvlPrV+I9bDklHuTlEbC2WCRPx6aJo4B+lnRnlhKMcVj4wmz7NBcclHCmE+bNBDqvwSVzTpqU+7+Bq3o0ytg57W4+2CphEPNmmTEYQHn4sqRpdReCPjg9j9u1dmzUIbRAJ8k7QJO1iMPcfLtmgllZDGx5Qqf6/RIZEL3/F99yeuFRGodlVh93706yyMfssfvZPStPdf2bFuLCiOfuncngWOj/VUFTjokWUocwX8KVXp9uAU/SnYXIQvN6bUXVTrp3zheDsg+pGngUK+R+IUvWogv766QqgY3bs0b/rKCs/5yWuNYEFJqsfMnnDZr3x8Eku+vx5D32eMztf8RjhFUWeVoS0hwD5/Q8XLsxGoxeDmu2FpWzKialIDhLDMWQx31FWOxQ8eQXlnA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(6133799003)(3023799007)(56012099006)(13003099007)(18002099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CDVeyBSrLzC9VLlESWbMLsK7jra1KkJHzjn35BzTUK5nFJFTxrkGu6K0647nCVbBPvz+s49nt8LqgkpHfQ0sG/ShAAw5+gZABsp3ZSQ67WKEQmzJyIRvQR95DhwFjw8k8or4cH3mM4mEuFATQLSt3P8IM5T7DLgJpFJbM0BnNbcdSkZ337uUdtge5nJIrtYXKqrQ5NvIaXi3tBC+PsdOMtL0F5IrY83PHdptngbOhqbVrtVuVGoB4zgJpsL4sixPhKabjFM6MDjXZGx7bRg3Fp4Oyjjcb9Sc+YkG8OILhlGQ15HqzmUYS1ajlsTGf5JOes+NQ7kNGlXrrOoeNOzG5wjnD44lBMozvVQ/WcHShgyuabX86MobpzefkRQzrebT2zIHtqRLIPAVk2DIj08LweMwigVCa6YnhcjkQw7nrhJf+TIGdX6xIqkGZCGJzSyA
X-Exchange-RoutingPolicyChecked:
	AcuslvS4MmCsRSU95EEhAzqzjXc5FGFyghVswvlErwHDeTgbnUxvYwElaP2yLqq5aZC9dptN6nxnil6xDTks2jtMznf6Vc/rpHNrfvGcc/FcQmyl8dMODNqw1TE/hiOpDfYvUphyVQ/90NKw1DdfCxxdsuWGivVMUhyA6PGzEVEbNWWcd0GTYLe4m6kmggHNTEGQU7d9uEaCz2tX9Fm2lILJUibStn8ub6m9+5Dr4m01yC88S2ig4gsNyM7oYUr+2LnnEVHknLeKooT97pmjPv8/TgWUWfdIlhvR/9qZ8NIG/nZZ+7g92cM+SxvaqTzmgcIhoCoN92WMmPUNvIm5eA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:21:32.7470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4a199b-5672-4e48-7c01-08dee96d5583
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a633cb7 cx=c_pps
 a=mi0BVYrBcfLCPOxFm7cYqw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=8zHKEGWhLnqdY6mmISQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX4LGi1i10Y14i
 SVCc35qwODqH/jF8Pu8f2r32xtpN0s31iEIxxgkwykwTWri/FRxxCP5D4alswi0r7AE7pdOm8pd
 9WfkMpbSKwzfAf8CB16FHmloJ2vGgU8=
X-Proofpoint-ORIG-GUID: mL0dISyblIh7GdGQ-Fhh23w9k-K-l1WH
X-Proofpoint-GUID: mL0dISyblIh7GdGQ-Fhh23w9k-K-l1WH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX6TFc/5vyg21h
 hvh7jkJRjnbq/kKXwasky26vBdnVaEzkU1MT995cCn+dvOtyUUBr30xk4VYjIm19z8y/7DAyObJ
 spLrZzyzT/GwXAyJVY0vTxXfbHKic0/jePd6tgpnB3lKjPcTFvtbc9RDky6/u4u5apDgtP1Nq5D
 ra31msk0Q2fCLovj1UXGUT07W43JspLdMv/X0nW3F2NSM6yfklU2b0A+uwExvvXlnODELcN27m8
 zlJS1ec+6Oi6uD/RGirLBk4d93sHwIXFHASLna2aRz3kRt7+njiodKuC3d70vq7xG2HB4YQ06X8
 AIy8ujpnB2nqKdqhQ1YGhXeTB0KnKoDufpbCPvXsJQMa2Yu/iIjmcpT+vEsyUX+20ePM4EiWoOs
 dgHKRbMB38ZxILe+zgSCSvrgJ2gGH+ttNDRgA8DLRDvWqKCiRpm4L7QxSwBVCR6WJ2BVyClRKAY
 is/Y/MHZzg+tWrORbgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

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
https://github.com/sskartheekadivi/linux/tree/dma-upstream-v7

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

 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  |  212 ++
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml |  191 +
 drivers/dma/ti/Kconfig                        |   21 +-
 drivers/dma/ti/Makefile                       |    5 +-
 drivers/dma/ti/k3-psil-am62l.c                |  169 +
 drivers/dma/ti/k3-psil-priv.h                 |    5 +
 drivers/dma/ti/k3-psil.c                      |   71 +-
 drivers/dma/ti/k3-udma-common.c               | 2598 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |  115 +-
 drivers/dma/ti/k3-udma-private.c              |   37 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1497 ++++++++
 drivers/dma/ti/k3-udma.c                      | 3104 +----------------
 drivers/dma/ti/k3-udma.h                      |  604 ++++
 drivers/soc/ti/k3-ringacc.c                   |  188 +-
 include/linux/dma/k3-psil.h                   |    3 +
 include/linux/soc/ti/k3-ringacc.h             |   20 +
 16 files changed, 5797 insertions(+), 3043 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.54.0

