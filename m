Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B14429CE6;
	Fri, 24 Jul 2026 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888561; cv=fail; b=TCqw7lUvkQU2PR/Pjsbt0yb43qcMNmAJ+pHXJEvv3O86O/sFFPrvnNJMEwpzv1z10WG/12m0CgI/UnGo+BTEaMZ4xdvZ72Qczh/eWbfCC9EqU24tUaxLcxK/LUxpGJ1Ec7x7ZRvaW7bIOKXTJa4KjHD9Z8jqYwJOuI4/5NBEJ3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888561; c=relaxed/simple;
	bh=/ASIj2OAf33MvmBmekiXhqCoEdwiaHO04J7XA5KNDiY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9XOS/XlOBrJ7OsstgnbUTYyCkrt6cqa9uOigqogtRT8FNwpG9ONo8xubLyqL7AcgmDQk/U/XOXBfaRZ9quCgrXD2nTx+5uCsfAmSNTngKFCBHrz0PaxQFeD0gMOTzhdVzZ8ZdUg5mG450uzbFWebb9B/MXkLPucV7i2ovGJYxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Pleteh+w; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xPrs1uKJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Pleteh+w";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xPrs1uKJ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFZ0D1093922;
	Fri, 24 Jul 2026 05:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=U7nwZjgL9kBHQ0H2OEYNZCM1RxqjOHGIdFHTGse9k
	7A=; b=Pleteh+w+tFnNhewJQ1gFLKRmynt5LWg4bwKvu/L6hXOqpsOK9n07szdc
	6XBok2qyJ4Hf7z0OBkYOSWc1krCTrxj/uHaKsGfj92Ekb5Z+yClzTMfLtj4rh1Wg
	0vLUriJYOS33rMxwaF/LmD4/w+0bbDvGwhlOeED0QTfAWTjXbUMcJoU3Uh3GYEG9
	NvkwT0O38ZP2PMuyFaZtlWLYX5UkrKTM6CJDmGdHLL0/xmW98lNlCAPTEQJntITM
	SXxyFfZ0YjpcqhZbV6WozyYE+VhQBrm4xlBtGzC7MhPZyu9vRXPqd9gzXikxDpOW
	E8sH9UqP4reM5gBJoATXIQrIg2wqA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7j3y6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkwYWh93l5eJ9d8cHSDUoE0wc72hrL/dSJWoLjUOOOgif37kRdAV5fiFZBugU9nPsg1wlcx0KKOf98jM/nHo9y4Zk2V6ugoENMxa15Nlo/L0bg2K6zbRhUd2bR3hxoSp/lHwv2iN70XyJ3AQP+6Q+20b7zc2LexkyxFr/qJoW7S9OMc+Chkz9YCNPcTyppmsGLOdjNvuWQtUIku8QzfTTrcAv0SGZj9l78g+bP5nZKINCBtw10k1vbahxVL4lq3AO9oBTfWafmpWgGjdONYDJjAgJKl9jXceE+t+nJk4o/rlYT6SMJHKnrEk2it3glDMtohNavf8QEhzoUiU49In8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7nwZjgL9kBHQ0H2OEYNZCM1RxqjOHGIdFHTGse9k7A=;
 b=KbZ+WzgMVvgNO8yVsilx+l81tFIhGky+hppK4R4bdzprY+mKFWdgsg9HamSH40wU/UyFpZUxVRbsdB7A+qsbXhACQl/V3xEw3CwfPdYjl3GnnfeK+Ox9OU0Z01SM9HKn6UiaYBYdjwpoPbO1NKFJpEo48Jkn2tS5INEG7WH2OYMooBSaqVDTEMoMAeJTlxhydF/MnS7EvG6KGWMq72f5e9SvZlWOIE6XghOubuA/Ra7voTuhnT6ChiIvRPbRFaY/HK5XFu8IZQdDAOHScPhbAq1PJT4PXNqa0EljUUSPfCNk989yoGzdoIc7AeZtgf/WeWsyRPhG27vaf7uL574lRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7nwZjgL9kBHQ0H2OEYNZCM1RxqjOHGIdFHTGse9k7A=;
 b=xPrs1uKJrL96PSlMxvkXuPcREq66NNtAmLYRlHPS3rscoJgCDSyJ536WFRdg/RUZ7qJIvWfFgEqcAWmARWKcmdX1EPSeBjMzvz/D3maF9FjK100h8DIkI7gD9YSCxNzHCcI/3Qc9eRt4RQE+O3fi9d41O2Ej/l12z7+UvJUOZu8=
Received: from BL1PR13CA0131.namprd13.prod.outlook.com (2603:10b6:208:2bb::16)
 by SJ5PPF7A7588508.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 10:22:21 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::3b) by BL1PR13CA0131.outlook.office365.com
 (2603:10b6:208:2bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 10:22:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:19 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:19 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:19 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFP3017088;
	Fri, 24 Jul 2026 05:22:14 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 10/19] dmaengine: ti: k3-udma: refactor resource setup functions
Date: Fri, 24 Jul 2026 15:50:43 +0530
Message-ID: <20260724102115.2854-11-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SJ5PPF7A7588508:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f933bc-102a-484d-147c-08dee96d7190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|921020|6133799003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ol5l2C2fZe/8vbZtA+7HdMzVJMiwrigaoI7whc8RPo1cwuAgIKKzyOe/5oohMtLd1S+c955+tVyJkdGgkPnTK0p3dLHHUvL4R6RI3tPX329YqPIxmxOT4gODrC+kQjNDtav64akyZGZd1wJQQr53q9kjKi7c1QhuS9D2E+JDvbzg+ObjywwFOh8gwG+6+PRVoIMn0lpTbPgTODVroPlQDn2dqn4Xrq4YoALf3efVU4qUbqdiv1xK89RwucKOWq+s8L7UQ7lnwjGW2t/SxsKspaj9joLUxy9xjlQfnbntPmrk4/R+YlguO7DdkGc+uTeuAn2sBjl+GY4un0hRCgIktrjTv6ZXiaRl/dEH02E6upWKkAZ9lKd/DIqumBt3k8sfBWWs0lYwNkwskDOV978v5O7SW98u+vHAIOGrEYZtHVyM/hL7g/ZPOlDOfA+VcUVEakkNyGRqszhi4JtIt9Ny0BLejvLDI/oAJdF/zRg33nmEWGyNm24c4gKQVfouTEYrDUwUIshidmUqxYOhA8lfPRABm58exoYLCpHtKcwX+HA6Ow/6eF5GGm8ZF8RG27nKzUmrRp4Ze2xpz0zH6oz05Ep44TYsDapzaLydCCaN4mOD7vtX9iVfMn5/hPrDDudhYd2lzJQSi1BcWZUIT1pMIptE60C8f7SBceVx0DfCxKFy44E/gk3vsKZftJqgRtJ4PFkWCWPYEwvJpSq6fRol0wvXvGWdmYOE3GPNG/R+ZQTRKZB18tGtJBiVDNbrYGDC
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZcdNSIR/Y7G/M+ZgtcA2CSNCUUWYU62tJWsm9Nw8cdSc9lXjYeAFKNmdUegGzFWZ0FYF610aXFlR0aT98Sg1FZpTdCzNJzy7TyPEBr239AA50ttcR7UtAdWdZlwo7TwZ1GgxJfgym4kLf384oU3EKgmXF3UrqtZq611YUzmJGCx0KQYgGp6lLQP5rtZe+6vD6h/sh+F0bmPSYL2I8RV2pE5KAmP5IEbuZ1W6HyjNmHLOFlEYotZqp6C0TbjYnRaxw5JIfSlzSdzdgd4QGKI5NIahsJqAhWc46TtjGYFc5ysj7JxmhiDFYzdUkI6hQdnJNwokzwQNzmgBYCuxEJB/09nVepl16gfmGCFbkx0DQV6eZ4lI1jPIKwzHV4YMguNq3TifwvOW3X4Jdfp5hkKUZR8+sxNoy8itHsJtqaGuW+9p4Ce4dKpe/3woGFdkO9pM
X-Exchange-RoutingPolicyChecked:
	qpsybfDKk6mKdhT2w4RXpxJiZE+fLo3ATNTh/A9Rh5HNCVWxZsKQzDvyvht4hpFouGt3S4GcEs/A0/LK44Tl7piYtQUm2Vs5ZY9EXFX+jCeSlvyAUBefDo/hTTKD19/liN+3UdX9xjfMweeUpBrCT4BazbHHX/uETFn3LXLA0tmRV3Jf7R7Nfxvr18ZfJBg8dMFsBB/8i7Vt0MZCr8Xd0HKwNecPSnRubZcurpLRXsKGYqo/9cFgqTBwX5ZjepnyjDfaSqMgFi8ANGR0W2Yxk1wrey+Quhp1E2KkgZEubTH1n9YGxdIK04HtwpXXS6zII4gPqAzb+39QxqxTOw7vBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:19.7949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f933bc-102a-484d-147c-08dee96d7190
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7A7588508
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a633ce2 cx=c_pps
 a=TarwAQ2eZTQc/qcP07j9+g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=I_B2hWj7ayHADsQg9NcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX3+U+C86LhFIQ
 GCj4FgdvMbG0D8paFrIb+Aanzvvpf9G+HovNQKZAm1OyM4gprJD6mZGedGgLgHwy4XhMXOKbdoh
 /4cPHUxwkLRxD2kvqggwy9i6IX/MrDQ=
X-Proofpoint-ORIG-GUID: 6S048gIZHw2dpm53QrgmyUaIlqb0jfDq
X-Proofpoint-GUID: 6S048gIZHw2dpm53QrgmyUaIlqb0jfDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX8h5/RTkE8BKU
 2OiL6//d6BndmJt366TIs4vYCStzUYMXLIMr+LSIAASFlp0EHHgpDFh+O8GDhWg+z0xiW0gQDO6
 LTI15ZVHdlRt7Y1ColyiRE30nXuNjjQ3ARW8ZgxLz0XAAQOBt4YEljPcSw5DT63eWQ4dKhR0wQs
 8RNQPY1fSiHQsw1qJ2MEaeLDrBYKU80RM6SAPW2flvmFdiT90EbdDTGjdCbQXlrsRU69hXuNVYh
 frhX2TqljmOVvW6I2b/2HxX3kcnHNDeJDDsrP8NlMUl2K3tl9/8vtEaNFLqJ95Cc9XBMWFFyXgN
 vPHDW6x10BsNImswVysfuC62wA8Msdtnrx26axSoOzkwmp05UyM6mwrwXvHVVIN31uKy7VmIxTk
 J0BeV3JWOebBD5TxRZGWmong9fCSwTYZQXN1SiDMoLIV7R1iE/06PLC3DzYBYMyt44/XD5wyUrL
 U9UkF4Ciodze+pHCyVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

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

This refactor improves code reuse and maintainability across multiple
variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 204 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 182 +---------------------------
 drivers/dma/ti/k3-udma.h        |   8 ++
 3 files changed, 218 insertions(+), 176 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 472903e7d1a9f..8b2a3be3fa932 100644
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
 
 #include "k3-udma.h"
@@ -2333,5 +2335,207 @@ void bcdma_free_bchan_resources(struct udma_chan *uc)
 }
 EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
 
+int bcdma_setup_resources(struct udma_dev *ud)
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
+	ud->bchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->bchan_cnt),
+					   sizeof(unsigned long), GFP_KERNEL);
+	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
+				  GFP_KERNEL);
+	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
+					   sizeof(unsigned long), GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
+					   sizeof(unsigned long), GFP_KERNEL);
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
+	if (ud->bcdma_setup_sci_resources) {
+		ret = ud->bcdma_setup_sci_resources(ud);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int pktdma_setup_resources(struct udma_dev *ud)
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
+	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
+					   sizeof(unsigned long), GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
+					   sizeof(unsigned long), GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+	ud->tflow_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tflow_cnt),
+					   sizeof(unsigned long), GFP_KERNEL);
+
+	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
+	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
+		return -ENOMEM;
+
+	if (ud->pktdma_setup_sci_resources) {
+		ret = ud->pktdma_setup_sci_resources(ud);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int setup_resources(struct udma_dev *ud)
+{
+	struct device *dev = ud->dev;
+	int ch_count, ret;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
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
+EXPORT_SYMBOL_GPL(setup_resources);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 753acf1e13fa2..d9d6cbda46b2c 100644
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
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 329df7eb156b2..5e222ce366faf 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -357,6 +357,9 @@ struct udma_dev {
 			 u32 dst_thread);
 	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
 			   u32 dst_thread);
+	int (*udma_setup_resources)(struct udma_dev *ud);
+	int (*bcdma_setup_sci_resources)(struct udma_dev *ud);
+	int (*pktdma_setup_sci_resources)(struct udma_dev *ud);
 };
 
 struct udma_desc {
@@ -679,6 +682,11 @@ struct udma_bchan *__udma_reserve_bchan(struct udma_dev *ud, enum udma_tp_level
 struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 
+int udma_setup_resources(struct udma_dev *ud);
+int bcdma_setup_resources(struct udma_dev *ud);
+int pktdma_setup_resources(struct udma_dev *ud);
+int setup_resources(struct udma_dev *ud);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

