Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500F386C03;
	Thu,  1 Oct 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844193; cv=fail; b=oqpY3oaEAS8wd3p/qrkj9nUKpXIi1Jt3uI6knFouO+OTMlYx6vasX5WRIwkPl/HDgeZo76NJhnQPq3ZZtOVkKYYU1l9snPcGsHQXDHfwEJlT5jMqQ10TQq6q0gmItQIKIKCIaSPxDb3PsIedQShgHi7nVtnzvmP4A0Gz8yqlmko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844193; c=relaxed/simple;
	bh=+UeEGrlWbdi+Oktf8JfMZ9QRNkPpkzIMKCp5w0fO8h8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZ9UTz+VzV5e6gHA7G45zUVR31pSWgM2Gcuc0slqjYOzNJuYg7BomYuXajyPoG8DzQsq+y3O8aoVyI11dztqdacXZ6gPDqp+rQgAbCr3PLJEe+TULC3X7LWaBZ1iVNp8R3x9daynm0jCBCbqSm4WNOfR4VxI9H6+VJhoLMgq2MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=VgAntsZ0; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ZzpjaQTV; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="VgAntsZ0";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ZzpjaQTV"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69171FEA793619;
	Thu, 1 Oct 2026 03:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FVlJ8IsIXkrdbOk7VTO7wi9f84fr51M2YkLD7xdx5
	IQ=; b=VgAntsZ06xKyKbLyBcwlFczoSXf2rQLvSs7xEDIYeJYI1BvRr+PKyAqSx
	v591mb1RhTtEjf/MU6OnUFh/MvTLJrI0zBo9dXQ6EEO4G81LOPIzovdQp3IY46kX
	X20S5EX9sCMcpsu+FJnq5wb2aj40+aUjGHX8mbr0i9oFjVZSCLE39/clAccLavU+
	9V4lX37uDfLsw5b1wR+3fh6TCsYuJhPVhEnOKs83m6n532IWzOWyusweUACBsBk/
	1PsRy5Y+evYttdoeXXV9Vfh5qbmcFcbStLnG7vM54e1XKQH2WJ7ZpCWYart9vWOr
	vrGYT60oyd8Pmkw0BkOTnT2NSeDpQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djv3ev-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:43:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYSUZCtXLU7tgWI9NV59j/79cwTW4o2AQ8eB8XO0Q3d120U8Pc8aNh0QPyIq97cwwQ5YWpqMVgS1xfcV7MlGeuUywbtsLjhEv6BHFp5zCPqqu6GcvxydsCtSpUnNj8H/GfRWt2Yn+OeM4DJ48y99A2kTGoEhx3sZAGKXs6sOpsmASzIi670UPumgk42PHglVKfVteVmoWqR/008PknpPQyOAMaKLN8HKadDa915HPKODaRGWysDdORQKhpjQFMw3PiNWBrowMxmKebjsmNTS9oOw3FnL14WZhBmU7LMWzBEqm4i07q6LbcTkyTmXZ1rvP0VmbVZSLUEW9E/oKZj1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVlJ8IsIXkrdbOk7VTO7wi9f84fr51M2YkLD7xdx5IQ=;
 b=T1Qf6hbdq/HBsR955OFdneGKeJrm91DKaBmvkSGAJZJ2JTov/n4G2aSTMLs6QdY8vOysnvxQO3r08BGxHzdIyyOu+6r+MetTzJ9y8JqeZEhaWhKli3XDPExg2DOZDTXxW4uV4VHBgyqYnXa1+4+QrlbWnJNvJrjE1RyHAdFKm1ftVSLXEa6q/DA8l7ismY4Ef6pXsRG+wNTc7bWLOWaTFrEBR7EkpRl4hk4vbFcQhrRhvmR/S7X/ar5OekPlX6xHfLf0FCX6WsYsv/RyET/LgsZNa1niFtemCxyJ6rpupS2UM6+9EAs5bxX3nDHpIehUspkCJeRuoh22Yn5v4AB7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVlJ8IsIXkrdbOk7VTO7wi9f84fr51M2YkLD7xdx5IQ=;
 b=ZzpjaQTVrVU7DuFw/B95HJ5+esNqF9AhvkbjCVEqqcwW2cyKK5iXrpllxfhOtGwORbguVAIU0DPWrEnnZgmtd7msRrjH9S3M8Xq0H5neizboma6sgBAe77nRGXdVwWsNtzKssgvfqmtfHEFw9oUfiXLtLUKTbRV9BcX/N+CK/7E=
Received: from BL1P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::28)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 08:42:59 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:2c5:cafe::f) by BL1P221CA0008.outlook.office365.com
 (2603:10b6:208:2c5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:42:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 08:42:57 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:19 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:19 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s5630551;
	Thu, 1 Oct 2026 03:42:14 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Thu, 1 Oct 2026 14:10:30 +0530
Message-ID: <20261001084105.1692228-15-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8f49aa-3fa7-4459-1999-08df1f97fe03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|23010399003|82310400026|10067099003|3023799007|56012099006|22082099003|18002099003|6133799003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	Twp+U5xQ8Tf6/y+e4aRYIuF/PMXVLCxJfceIRzxKKeN4Gx3zj9xmg5RmFhhA8GhNDJYpLX9+D3h4ucfFnHSfrZIo/ClLK4+gR/xbaFL/gu0tQyKagk7qiXowyi/CrewPilZ0huw2NIcvUkUkBHWMpYyHorPekBHGp0hlYYkFbAxro0K6Ankx0k03hvg2laoXQxkoQFh/qXnBiUEW2fMlvBDSMqS3k2Ua9gb9zrAB3ybs+u7wiPVD8Yn+6HOCRCbYrM6xf9NdlbeQw1NzSir0BXQYO/8k/hRcLhoqywzrWKNyrCrwvOYVw5NInPmdcmkIDoc0jHJd4pqOJVPSnZetugUDNXyG8PhT5wBUsqoNn7KdKnbpzCRTuFoW9eaosOvxqHeeb1K5rhLEF6ChHFwWtZ9uMgSRxFKKvFhQCTj+//6DyeHJTJ80xKnerImZ/x4ygdE6Ax/suYYoGZPQIU7zFJkaGqXL/Lei5TSE064IHcn3/CKYsd8OXz6MYtX2L7/uXGML0XMIdT9w5jtBydmmptmRXO42d/MUuU8WlkLnMOsK8TImxadUtEY8B9natJJM1NKrnl2vYGz9VW6HOPwYWzK0w1EszD/Lb15e6opsTQSbtvkCACNTtXM/Gzb9IDaNN90hH8M3pif7aiDdtj4TOwQV2ZJVpb6aq6npPa5hBMD5lccw8VSmVXd9Bx2fno/N
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003)(6133799003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zDC4XvJdB8OULkd6+mddqGWqgpJX8Itobo8ivNjLXdqJ4P2ZRTob7JKzGnoIfHswLzEbGFtkfoWky90TOE/57YY6dMDnIzesrkT2t6u2Yg9fQK7zJ0V8XoDumFZ1Aelr7rsjPQq4xKtLCCV5wQgx9vSxWhUyGQSixhCFagxJP01/UzYYZMlFv6405xRrTnwbt2QVmupjDqTKnfQ0VEJafVVL/X9bvP986ARspS3qjHSrdnuX9aFFIgRx8tdxdkWfJOkofddgjQVJD7WyEXFGdu2cUpunNFT6RS1ce8xtOhGxKGL89hEjT5nOr2+O5tppLF3vQNNBCj7TzMTZbxFmK8FxYQpWjFVBQ3C/C4Os5KkeTNjEGj66NmIL7XLMircjeVi+DeQTEXE+QEKHuY8tJHAHAvqTW7XPw6JpSavQhgLrjNmkV12FPvRClhwRuBSP
X-Exchange-RoutingPolicyChecked:
	3I+O9OTDyeZz6p9EFecu0wgcluUmZuwQ0abQyCRpi9w3XTY57VlgWdKkPmuNYPuUHBnDBI7CtyJQ/lxePIww0i3a+EdZMQx2tOvQ7InHvpZcDeBdJ0SVrLB3u6vHNldabIxJ1dgmfwUAbJNwKqc6Wfk2f7yO63QdrH2ZsXxqH/LOTLAdOEVOM97d56egf2q1VCCdkLqX4NgQ2kmvuXXVNXEkExeEFqVGEJ6ggYGWq61PQnZF08L+nEXFdPjSH8A9SJM1R49S452ZYEuUOCvECT8D05bH8bT6ofQgUFVlhVFQN9k8ws4RVG2vqg42CjDqerbvR8aGQwLoSbsQv42LkA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:57.0857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8f49aa-3fa7-4459-1999-08df1f97fe03
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-GUID: v5S-CnQ2tcn0XA3371n7OZO7LH-H_4H7
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abe1d16 cx=c_pps
 a=V6LhDW2JNEJwPIi/f6b7qA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=tgGeiVbHXLEZap8J-VEA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: v5S-CnQ2tcn0XA3371n7OZO7LH-H_4H7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXx68njKkZCyTX
 6CnMjBBeq3dkPsYyj3Gvmdf5fFvFXRHZV06WEXhZlPm1jgVgbnIPL11E6r2KbTUn8lhBLLsWRHN
 JWobplPsd4YB+MEV7usX8L96s3jsbOU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX+Jab83fn3XVP
 +1UPpbfFcfs4LMcnUOAWm9UQrSp8cEg1kBieU86dSzxbVhfInrOpWppNl9LT86cCzGh5k+PubI4
 gq/tLKqtFBYlGGs5v1ykUWJO1Y6g4e5z3n39cjtbHM3pxv3pMk37TfjYATvxnsOUIVDI7GXacYy
 tLwueEYuSqDvt12xIUggwSetNlB7P3vC/Y10ZmUrBCWuFce28U5+MAMoLj7R27ZllCArkzzfJ8E
 LOVajXcbJTt+/gPGkmdWTY6SZ3NYqKlNxURp3rmraxWHIQUsY5w1E4aP8IvrH3Zv8WPE5T+z/vG
 q/9mkd78srNOAIbg2rT52GgMogB9JY87Qqqhkkf3v9ViSgQxPAYwtZ/31+9ccJXkPEya0JqyDBX
 yTahF/yAaWnLa+T3NQ8JlRAdRaI0CuGxqVTWUR8+CweQK2V8cfpH7Hx8ZXNq0LezCDsRApAFRq6
 Ud7HtQNlvCmkDZgIfpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
new file mode 100644
index 0000000000000..caeacd4cf5ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-pktdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control & Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Flow ID for the peripheral
+        This is the hardware flow index assigned to the peripheral. TX and RX
+        flow indices are mixed across the valid range. For XYMF peripherals
+        (SPI, CRC32) each chip-select/FIFO has a distinct flow ID; use the
+        flow ID for the specific direction and chip-select being requested.
+
+        Please refer to the device documentation for the flow map.
+
+      cell 2: ASEL value for the channel
+
+  interrupts:
+    maxItems: 78
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 78
+    maxItems: 78
+    items:
+      pattern: "^(t|r)x-([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|6[4-9]|7[0-9]|9[6-9]|10[0-9]|11[01])$"
+    description:
+      The name of the interrupt corresponding to the DMA flow.
+      TX flows use the "tx-" prefix, RX flows use the "rx-" prefix.
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
+    dma-controller@485c0000 {
+        compatible = "ti,am62l-dmss-pktdma";
+        reg = <0x485c0000 0x4000>,
+              <0x48900000 0x80000>,
+              <0x47200000 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+
+        #dma-cells = <2>;
+
+        interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "rx-0", "tx-1", "rx-2", "tx-3", "rx-4",
+                          "tx-5", "rx-6", "tx-7", "rx-8", "tx-9",
+                          "rx-10", "tx-11", "rx-12", "tx-13",
+                          "rx-16", "tx-17", "rx-18", "tx-19",
+                          "rx-20", "tx-21", "rx-22", "tx-23",
+                          "rx-24", "tx-25", "rx-26", "tx-27",
+                          "rx-28", "tx-29", "rx-30", "tx-31",
+                          "rx-32", "tx-33", "rx-34", "tx-35",
+                          "rx-36", "tx-37", "rx-38", "tx-39",
+                          "rx-40", "tx-41", "rx-42", "tx-43",
+                          "rx-44", "tx-45", "rx-46", "tx-47",
+                          "tx-64", "tx-65", "tx-66", "tx-67",
+                          "tx-68", "tx-69", "tx-70", "tx-71",
+                          "tx-72", "tx-73", "tx-74", "tx-75",
+                          "tx-76", "tx-77", "tx-78", "tx-79",
+                          "rx-96", "rx-97", "rx-98", "rx-99",
+                          "rx-100", "rx-101", "rx-102", "rx-103",
+                          "rx-104", "rx-105", "rx-106", "rx-107",
+                          "rx-108", "rx-109", "rx-110", "rx-111";
+    };
-- 
2.55.0

