Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195214908AC;
	Thu,  1 Oct 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844109; cv=fail; b=NZsVu/JSYpLVT9Ny1ewE6fpQhXSglIXiWDutwzKUlnP/1Sb6u6u7hA4q1TVmYRpwyAAIACvaezAT4WpNHj81WxngRTrgsaejwSdko8mLeDZLW+KwpQ0GMrVuOftgudyFcYyarI64sri/nKS4kaH8usle4Fozc2TuzoPjBwRRSko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844109; c=relaxed/simple;
	bh=RGfgafAEKaX7sR24pVsQf3EVDm9a6nUTJDFybqRp9ww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBptmPNnErM4QmXaYTVlhApvFg0tpYedIk+SXLhYJsIskd3CaDQ3qYnieLf8cqYmcBT3dua/s1Ka+eXJgqSFmLW2JblPj1T5BUxDU+qwcB+EySVfFnIppt8MaEp0nSUoKIK/jX0PyKrm3Gxf/npEmHtuHJTe0lQkp8ZknsMStiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CLorS9Hi; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=bnX0kLrb; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CLorS9Hi";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="bnX0kLrb"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69187Swd1207686;
	Thu, 1 Oct 2026 03:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wxcnkCAA5JdBmWGUXrJxrBHO7ikYKBN9V/Wblo12a
	P4=; b=CLorS9Hi90Ey/GogIVWVR7jiumuLOnOr0qMmCnjBdxIEUk3TQYQmUsuEV
	FxWmF2vVypfv+m2bUMyWpKUKHHHsFEGAv+WPP0bo0oZ6rXNjLETMu931HiNHxHAs
	4BQhu/ehdidd9/V451tcD7HFcMSB2gycKzp5ro/aKOVLlonE4/pezrHhtSR975v3
	Mu5xtQwnqG/79G34DyBIr+ClWywXpc7rwG8JrhtQFgJWIZ5aEz/TmWrbzUkqGGCc
	L8tmY08BwdWXwb1JcmmlmNO3OycAYylgR5inyIWFQmHDH96HsFGwupfLpwODyH1F
	EUw4jshrHdarcZl2kCUzSNHGJESYw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqyg5mw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:41:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnJcor1wubS0u8MS2gLJHiQ2QUOAN2TNOvedTo6Lybp97iZxJqX8LtPVY6bb12gIlxaNUgcHyp5dFe0GdMOR4ssILyM46s2zU6w7Wak3tXc1dakjEsv3zDECRcF6s27hHohZl8vg+c2Lb0KuHYG7vKYxZ4NLaJFcPz+lSe4wENVHU4FMELQ7QgvHEhyjdQxtyU4ry9QKQgFo6fyDXrL/Ao/Z3uj2jQU8/Qd6QkDaL1EmomREezrOA/yhuuY33/m694sO3XQAnXYCIMJqshfs0gENa6eqZRA4Sh3Z3fGL6d0FamGWvnOhf0YPwgIMi1ioObXCojAN+iMWC9IkhVEQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxcnkCAA5JdBmWGUXrJxrBHO7ikYKBN9V/Wblo12aP4=;
 b=WmJCnHR1ybOh5wSUrjU5FdKq6E70VBqzYjnK8CvSv+ifmRuzK5huo1bjQPLfwWjEQxNqwEopFRBHfZZ6M4hpF98ShZxzz2Y133QfuA+rBpy86mc+fI8ij4bTd1j3MYXA5j5HgtLNqC8pJ+hGLePOX8gCSnMVvqwN5cG/e2bBksyv5PW6XNjD855YiYuBhTB5F6TCNGWUxlcPg6HyS4NqaaQrPGUvmy5n3ZGTqGTejFRPkjelgXC9JIkKS/XJxEaYzKEDk80yC2Hf3bv7G1B/LQDSqNznN8r33Ys6Qtk4mQ6Da/ZRg+Pe/+3kgKaSHAxqkRuH2sqp1RyxaSauO5CTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxcnkCAA5JdBmWGUXrJxrBHO7ikYKBN9V/Wblo12aP4=;
 b=bnX0kLrbWBotELHI0wU/EPqHPdHdVGiFL/p7R/MLSxm3CqOAa3V8k4pB82O6BoScPlgIjGbY1JgcnN0Js6ku1g92uALPt1mO0zdx+XONkNllwLOP7uwUXIAvWyXLubDCyfsd2T+RqISQKmxutkFnNYhjNuPqhqTdWuGEMZQNopY=
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by MW4PR10MB6534.namprd10.prod.outlook.com (2603:10b6:303:224::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:41:36 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::88) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:41:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:41:35 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:23 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:23 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rr630551;
	Thu, 1 Oct 2026 03:41:19 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 02/19] dmaengine: ti: k3-udma: move macros to header file
Date: Thu, 1 Oct 2026 14:10:18 +0530
Message-ID: <20261001084105.1692228-3-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|MW4PR10MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d408108-bcc0-41d7-7b2d-08df1f97cd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|7416014|56012099006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	/o1J+G8tOkZZ+zWtVojFpwj5zVpDCLQGuQN84yQNJ8P/CvtgsozagP8aShyoN1E034GbNtqb5jnBveEhpdIq/ClfjLhAuRdwxDRmeDpj7Bg5jUTk/fgL4pqRAE+RxnX2Q5y/Au+kgs5hQbsekt+UPs1BBbPmFshWziz+X8caZHnnJfAVSS/IRRsx/c1y4bf3f3yl94cA3+5Ygz/SplmRdMM1PI6VXr/6BSw+MRFYbqjuVNxrgYVJFZez+ADRtcLfUbDVMfnb0idcGXSsELZ5TTGVtxpAQz9Nhb3NdAyY6+b1Nis7T06+cuu9ED13410r1v8xZw/m0we2cEFhaNO1a2J3kFskOOTEh8az+SXLJ034sO+sTvlMkolAlmXfRKhQgu3I1TFD+O1s3UBTMmoMw9xab8drVtoNSQpwiV/h0aS+TkMZkTiSfmQ3e+oKGUk7V/2mLTOYyBsyd6LGZ8yeXq8x9i5PCbbowjg7QitfiWUzfwf+8w8O8kKBOqsYb+pFGBim2Q/WJJ/yyAXYHRYvmrvZjK+fQTbN5kwKsRtIKCHmoDgGNrmHmttEifcqstAd1K0O2D/gHanbbO/FDIohJzE5cq9UEUy9jNcUzW8jq94iftQub6Dg/4DxYGtsPsiH0EEzpV9kWMHFeCjE+yRxEObmeCA5MWQmjlSsPKif9nzHYf0J0CTLC5uuLC3YDOKtRn4NKfbrByQHK5m+ZqwVyHm9LcW0WahnPDEa12S4fqIIi+x+hntkO1CnonhCucXS
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(7416014)(56012099006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FItCGMynDzsWIlYuq6YAwEFprdnUc9LCzB+sQTcHcJNa+/wMwSUjhPBzGtJz+G7PPIVPghzRmBvF61KWoDgbcKJknyagqOHczq8Tn1IrByMvWNw8WN4deH9tbZDk7gdI2BTTHb+e9d/95mbeEaUzNfKem31DWI7i19StCpgfyIzVih8UycnZw8jCmm88SYaU60+cVgRpdjPWH8sqkKnDAEwK8hFhVnpbHv8oySvbhoD3g0C0mqOsSqORDzCTlV8b0AcLtdkFOUPjBLZlODLx2GdzfBAw2dD5bq2JEaxz/kAT8LIeosj9SIm12sFJXlzHx31nVmJDGKy3EG3y9zGQHKBiBGzQ4n0fm3P+Bowhh9Cilg+b4q5Zt4ro7H0atNemOk8jldoJS9JLpec/lQg1avr4VW5qUVLrj6a8SZKym6tFRBSWDJ/3D5ewfsHalHYw
X-Exchange-RoutingPolicyChecked:
	JWqgDfZKn+uGo6WdfE2AXy3mVWCYWVKKXKqQ7FGA/w9TJ3HQ+a/gikgE9RscNvm5p5rNyQqw94Bbco0rKmNaYAa0SDnTW03i0+J/h9FipGf8qu4AniHwGFQhoiC7lwB0ypAFKhtgy7t8gX6UZjRtTrHzavOvbsGk3sfbT+RAQsz2vwbg/UePNyH0dabBFVvro2VzJ+4S4nIrXiMlC//nMO/eQ6b+RhUc683AVT5Oaz6U+91cMjJBmOuBlohH8KjOpz7bMsflv53R9eIN/4t58JUCkUcMDrsKdwk1ImMqRNEKUXvwvO3whFyBTIENU6/kCZrC/91iv1zVb3rihflZqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:41:35.8352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d408108-bcc0-41d7-7b2d-08df1f97cd96
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6534
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX3GIPZHf82S2N
 hAsmzcdkYNzeZZcU1nbIpKv6FS8BPqq4F/UXB26SBnKFPvQjgJJdecPZ0QIW+0QeNt04cyoeEsY
 WbalQV1UV2krFozqMom0SweEP4Lp09o=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abe1cc3 cx=c_pps
 a=Pnh5LeqhM4XIZ/aCP1A8uQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=u0Ry9gnqgf_Ls9jc7UwA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXyLJCNjL9mkJN
 8VV7QTUDt2h3N3UJrAKS/u+xrCGyo8vsehy2wmgDzbC+nbaxAJxxc0O8qLm13H5SPMnQKdKoFP2
 85qqahWjhLYxspcxaaw47KGWFFVtFbyyxq18FcJ52oNleh9TuI/G16S8yBBik7MpFJz8j8vbB3+
 eos0mme4E+BrY3ArdMTx1lXWdlt3FnZlPik5hD0g+LvKxOzyeyut3YkEOIHl6VsGyYQsKP6z+L8
 a6IUhZGQoIfblI6ZpWokDxJuGL11i9K0Lato8JWBQL5Q/pcEhBwhvw3iBWJ+oiJZA/B7AGf/tNX
 +4pGQXtxlvxq0MBXH8yiFKfm8LDQN2ZhX2Ykg3N/Bue6tLjnEGgbUdDgLn/i8l8b2WxKRJiEu2r
 BbDyRSEEPVpLXTuqmStLrKw8v5O+kfCcOO0IEOoN7dKtaY0bEFAjU2xDfAn0k3xs+5ArEecb52Q
 pno2lQjyYBhwftlz0Zg==
X-Proofpoint-ORIG-GUID: X5nAZdZA_ICLs1jR0UrBFiqlx_nlIbX2
X-Proofpoint-GUID: X5nAZdZA_ICLs1jR0UrBFiqlx_nlIbX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8457644cb9132..a1b99097a94ad 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -39,21 +39,6 @@ struct udma_static_tr {
 	u16 bstcnt; /* RPSTR1 */
 };
 
-#define K3_UDMA_MAX_RFLOWS		1024
-#define K3_UDMA_DEFAULT_RING_SIZE	16
-
-/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
-#define UDMA_RFLOW_SRCTAG_NONE		0
-#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
-#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
-#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
-
-#define UDMA_RFLOW_DSTTAG_NONE		0
-#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
-#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
-#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
-#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
-
 struct udma_chan;
 
 enum k3_dma_type {
@@ -118,15 +103,6 @@ struct udma_oes_offsets {
 	u32 pktdma_rchan_flow;
 };
 
-#define UDMA_FLAG_PDMA_ACC32		BIT(0)
-#define UDMA_FLAG_PDMA_BURST		BIT(1)
-#define UDMA_FLAG_TDTYPE		BIT(2)
-#define UDMA_FLAG_BURST_SIZE		BIT(3)
-#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
-					 UDMA_FLAG_PDMA_BURST | \
-					 UDMA_FLAG_TDTYPE | \
-					 UDMA_FLAG_BURST_SIZE)
-
 struct udma_match_data {
 	enum k3_dma_type type;
 	u32 psil_base;
@@ -1837,38 +1813,6 @@ static int udma_alloc_rx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
-
-#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
-
-#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
-
-#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
-#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
 static int udma_tisci_m2m_channel_config(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -5398,12 +5342,6 @@ static enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 	}
 }
 
-#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 9062a237cd167..750720cd06911 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -97,6 +97,69 @@
 /* Address Space Select */
 #define K3_ADDRESS_ASEL_SHIFT		48
 
+#define K3_UDMA_MAX_RFLOWS		1024
+#define K3_UDMA_DEFAULT_RING_SIZE	16
+
+/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
+#define UDMA_RFLOW_SRCTAG_NONE		0
+#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
+#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
+#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
+
+#define UDMA_RFLOW_DSTTAG_NONE		0
+#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
+#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
+#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
+#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
+
+#define UDMA_FLAG_PDMA_ACC32		BIT(0)
+#define UDMA_FLAG_PDMA_BURST		BIT(1)
+#define UDMA_FLAG_TDTYPE		BIT(2)
+#define UDMA_FLAG_BURST_SIZE		BIT(3)
+#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
+					 UDMA_FLAG_PDMA_BURST | \
+					 UDMA_FLAG_TDTYPE | \
+					 UDMA_FLAG_BURST_SIZE)
+
+#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
+
+/* TI_SCI Params */
+#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
+
+#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
+
+#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
+
+#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
+#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
 struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
-- 
2.55.0

