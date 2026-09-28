Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5536E48C;
	Mon, 28 Sep 2026 02:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564370; cv=fail; b=bOvCNuiNdvA/xHmv500kCWYm6Mbua+Bf7VsnpPT5cx5rhY1xYssVlUm+7C7riLn6K5zdctOS17BO4KsN+yTg772K+k/IKgLD+LCsKDyJ+a3+gjrj7ZNiY1bOm33YlFD+LeJtbcjiKxXR/fRRHuqxJllLYIHIT1WKMzuSCesx+eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564370; c=relaxed/simple;
	bh=ohB6AyPL1yGPs/XQrk1PoSqa8tTfeiAf7nsFDQnY7WU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2UHIL0J6fv5YJa678EpnwwZG25nr35iHomMr7LRiY11KM7l+0E/TyeKnXJJJ2FNpe7R9SWk8eaFHMRYb6KmE33UK/Bau3fWeF4RT6xUFv1EbQlen6p0+QvG0smsXNTlLnA2rSiHT/rMHSOZaVXwXNc7dllkQx8iVvHwnumjsTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PPY9LYY1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jyU+QoXx; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PPY9LYY1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jyU+QoXx"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68RNEFCT2775340;
	Sun, 27 Sep 2026 21:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sOa2U5ZSaBR2ea/MCYm95KDZuvR6EJKU/8kMxBPtU
	yI=; b=PPY9LYY1NncJogXoqjFS4tVXqCE8pT+mWhefTQLqySldivxQxD3ruxcvK
	8XQM06bnbKOgfLl9ROvCU0DtxEV4SCFmZzRBLpTVNA6gmQppMN60K2wB0O2XjiMe
	Qk4AxD0SDM5g3yjM0D2mpDVIGrWEImpP67EOtOQb8cT9482zbMlhJYyHnRLejWYr
	RPAIqi7ssX6EfHrP4r/8xVhwU4z3Z4OlnAhl0hCwse6sYQ4+K+lHDKCjj2KvCsYi
	lHKXO7kTyD4Ak28hp3x+SkMYTRPsH52dJM4HLeBJ4ZMkBxUapJMtZ9eERdJWqkuO
	rGSeWo8tXJndLYQ+tVXt5a21rMhrg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nk6fe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lExGGNojCNydlcGhp/RfnZrCQwAKAoK4FltWl3AZ805C0pf81kQStTTfsWKg5miMZfPJd+5MPU+pxt8Rld5F5KNe5adgwu21JIDU5cyJIEvoIJq4bkHvUIKjWZcJ5HYJT0ix6RW7OgYwaTIgfTlHD6qqeSnJX4HcBnYA8DrVdjTkif/wwKFUW9UgvUvXVkmMtSsh1AhEgXyOuqZal4zgIxNhbcwEZdxmLoXFw/Y4EyZHaLvaPdL4rlh9KIXDvl9EeYBjLfgdwsd3MB7p3nL52ofKTQNBgZKErQXtFEQYNy8XkfpN+DubdNrOdIT4sW4GtO6YY515KWd9nqocloMB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOa2U5ZSaBR2ea/MCYm95KDZuvR6EJKU/8kMxBPtUyI=;
 b=QqI1eYDBwty3BlCOnT6eDmI0rB2C2i3tR1BMaX1YLE0J9EJmT3uj25XrbwwmnUas5FeB3MQue8dGrO9B0CZy3aFTzlY0i30g8UOJSPwdifEjt0fZE59Z1yRTMikcw+gzTu4UuxUAhfZ1+uxliXRioM6qPJoYZI5Gd34N0ujw7MEKr7wBXzT/QOwpZld+GAuZGgFelZ3fGtY8msjLZFLexb+w5g1voTMCihbf6gAbcooUBrvqstCfwXx4EdJM6FZfcmuyYViCxyBvfhLfz9MSMhXo4wXSbS15eSWXyOpqvPkthmZABP4ATmA4C5pIqyXlDWA/MrgXh2pFP6xF62biaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOa2U5ZSaBR2ea/MCYm95KDZuvR6EJKU/8kMxBPtUyI=;
 b=jyU+QoXx/0sAzj1Q08oTUsxHvdfacsEeGA0nKQQrdgwlLwyXuJLdi6KFSm9caW/hOlhM8+6CpaKwuaC4PxOa4dFL94UbcwywQVh2V0lenmz9mMZl5fE3pn0ZRorA/8jWC1eialKOEpRoxr3fGcKVOv3LpJYWODV7CzVBF7jdGCA=
Received: from SJ0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:a03:331::31)
 by CH0PR10MB7439.namprd10.prod.outlook.com (2603:10b6:610:189::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 02:59:15 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::1) by SJ0PR03CA0086.outlook.office365.com
 (2603:10b6:a03:331::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:59:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:59:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:59 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:59 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqK2256662;
	Sun, 27 Sep 2026 21:58:55 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Mon, 28 Sep 2026 08:26:19 +0530
Message-ID: <20260928025749.1055383-14-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CH0PR10MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: be4e162c-1680-4986-65cf-08df1d0c7b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|13003099007|921020|3023799007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KDuRZW0lBedeQ0T4qJ4TfGcJej2LzXO1TIx7huOBsBgLmIl2XO628yPv7FcBtd5UoUJhMctaTY0Z6RAZG4dRvRu/gbDV72O/ohffbJXiA8HLKkzhj777S4+N7jWZGzv+yk8iW1NS7XXhGYw8jYhJlLbZZpSgTySqRy2iS9VMrP9dJtv/fSfLVb9ueVdbMNksZ6bL2epTYSCXvjR0AzfESV1TtsiOh/IVRF37tM9trh5FBdms9T5UwlbzkDhoEcuqWsBJfTRx6ltkIRIjNqzuOP1414Aa6+bnEzBLNdH5dmVJUaEQ7IFPEFSih5HilIQ7Tk2qYDySpvjA95XjX3VOHmPd/Rg7CuSdvFowxeveIVdwTODn3j+3Jv/d/QsjCG/N/3vKUHA/uLJ6yIJGDIuRwwOWxq5hcN2P1oMecW/gdC4J+t6QgpF37MEfKt2LcHzq30j6nno3/1INbcpdrZxnMjFpA2KiL+7TuFJwaertRVccWwfW32qsz1+NA0hqXlyUUPk6L1iQwcJjYBbOtBKhzrqWdBEhaodVn1rAuIaInNsEHG2igyJ1bEZALtxq1T2fE70m7HeHhN08CBD3vLuEOk3I06L+kCPmELMEtl1Gch8M/vaOz5bjCCqMW+kM7cZ9gWSqJOAtOqty2awWWiREpOYCkv+GnP/Q6q6k0y/MaHsVqVlsoZWfoJ1qWXD+jCPdAS2rYEk3kmFjoKrlPTQ5iw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(13003099007)(921020)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9WTuwGcd7OSKBjCKq0Narv3aid5QITqWYl6D4c3T15RY2gmwSfUtqcyFllcTEyH/O/CN67vaxUuS3x79NumHXjVat30sLXAGAHfaZNfIU5ysw60UWC1NJfdztzK0Lv3EoMrZpt30hTQPn/tluJu8Z9t6jyTpLtBPaAPVQ3rqswgywdj3+lm0c8h7EeVyKhoDeSiComGwrIJqoyPUoGuK3hXH+MCY4r9xzCf87W2Gdhm+RybzbuThuHbx3xAmfe/OJUqfwrlXpQ3Ai+h1sBXN5XFercLs+9dwIlA7rsw/aa+Bn4MAi1ZtOynGasRooyjgFVlMrfBMWDaA0k2NE+F0BdfamWzISeKJtyX5Pvne+wk3grocHbZYBN8NeVw3tUS6KdI4gkd/CtJyIZj4imv29Js57uW9+qzUrYEEcjhliaHbEKxydJVdVx/B/D6AFTPm
X-Exchange-RoutingPolicyChecked:
	3UoCeZqM79TNaJAokQad71C7C71bjjTDDJSrfEeTZJxSPDEUnP5INliQ46M/51i5674b8nvJVSGHCe57jprfRnNiblds+9eHlT0dBc0Zzc4TIKZ3Cbrqqk4X1wuZBqqsGqgFq+E+UX2CosE6yuG7ZaUDR6EMkEYMo/cRglBwuJdRzUbW8Eq/50NfPDGh1tOSznf+PaAdRyQIbqVd47sNuNTk1pLUijdb3gVmi7ZXz08VvqY1kqDQGJ33joFP+PIJ19hqcqHRyWWgrUrN7j7SUdln9Lk2vE9fGHyrYCoUIAfEmz9Lnj7b7d8HhUKmSWz45eRlK0Kxu771c8sPEck8pA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:59:15.1127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4e162c-1680-4986-65cf-08df1d0c7b21
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7439
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX70Rbcz/PbD4V
 Ars+KijaRRV+EQkmAHNOO1DwfDdsnfAWo9HRp7Ay8vhSWqpaGARh6hQb3yiZfrTGmDYU8WJVqYK
 XuN9jhsVjbXVrAdMlXQLJhBRv3B9rfg=
X-Proofpoint-ORIG-GUID: r_OvPNcv8aXLW3vkVMn5oHcrbGGqnf7g
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6ab9d807 cx=c_pps
 a=V/jExjqSSumuV0DCu/2ZVg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8
 a=6W6IBMoaatw3SABbmX8A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: r_OvPNcv8aXLW3vkVMn5oHcrbGGqnf7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX86mi9Dyr7XUr
 MFkdMZqRaX43YZIIACyLsZcYmAzF0xybGXCWqMa4N7vg3bmXeTCWQ6u2twV6vtxH7I90HDXH7z2
 bkctC/AzDyGxuo6t+EIfxlGtYHrQBB8AuhstoIi8ctvoDCsNaAjGxdvSzCa3BDGEXk8duVP1hO4
 WJnzpcaUFNzlfg18FeDEbKQuWe1WHT31/63xYZoolNQ5mnfM3ijA1GvoZ/YYYxQ0XmDqJK13Aor
 Cvh4C10WiO2rq97NI+27JuXGuhkwlnWFAm8nXbAI09H6KJb15EQLLaHkpvv0tn2+ilgF3hSDIXQ
 SWn/axjugXgapo9cPksgYahYHy3IF1mB0Qh++dvKZTJwSpdRZ89lveIr8/zx30GVvAtlvsndXzb
 nu0MIGEd7AgQ4ADOFd8mV8BlDMIjuw7giDLbS621eIvpkGHN3YoC8ONGt2oKDTuqIsSYHHlTUkC
 HH7yQ7G207HB9W/7lIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 211 ++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..76184485ebcba
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel ID for the peripheral
+        This is the mapped_channel_id assigned to the peripheral in the PSI-L
+        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
+        has a distinct channel ID; use the channel ID for the specific
+        direction and chip-select being requested. Use 0 for triggered
+        block-copy channels (cell 1 != 0).
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupts:
+    maxItems: 75
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 75
+    maxItems: 75
+    items:
+      pattern: "^chan([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|4[89]|5[0-3]|6[4-8]|8[01]|12[89]|13[0-9]|14[0-3])$"
+    description:
+      The name of the interrupt corresponding to the DMA channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #dma-cells = <4>;
+
+        interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan0", "chan1", "chan2", "chan3", "chan4",
+                          "chan5", "chan6", "chan7", "chan8", "chan9",
+                          "chan10", "chan11", "chan12", "chan13",
+                          "chan16", "chan17", "chan18", "chan19",
+                          "chan20", "chan21", "chan22", "chan23",
+                          "chan24", "chan25", "chan26", "chan27",
+                          "chan28", "chan29", "chan30", "chan31",
+                          "chan32", "chan33", "chan34", "chan35",
+                          "chan36", "chan37", "chan38", "chan39",
+                          "chan40", "chan41", "chan42", "chan43",
+                          "chan44", "chan45", "chan46", "chan47",
+                          "chan48", "chan49", "chan50", "chan51",
+                          "chan52", "chan53", "chan64", "chan65",
+                          "chan66", "chan80", "chan81", "chan67",
+                          "chan68", "chan128", "chan129", "chan130",
+                          "chan131", "chan132", "chan133", "chan134",
+                          "chan135", "chan136", "chan137", "chan138",
+                          "chan139", "chan140", "chan141", "chan142",
+                          "chan143";
+    };
-- 
2.54.0

