Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3949A3DD;
	Thu,  1 Oct 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844160; cv=fail; b=kcOW6XP/7tR5HStUcfFyYxweywlcTyip8liS6c8XgSu+rEXk5EMIU31vkqPKhtOhYCFfDuyPNT5/0yeDDjm2/mqzpmt/sH1zPL01T6EC40fF7je9c9YI8FtNYTBt34E/RxFpFsalCppzivdKk20EnEL0SDvm7S+tMnB/g4B6NYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844160; c=relaxed/simple;
	bh=6ya/KzR0aRHctjQ/BSCeKPyTGQH/YkjD2i1X59RYHlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1KOXxLcMn4KFhIrDUpekKJH1yARqMwZfwAA9FIlGgkoZIt9wIJEB/mKkbhWx5iAwcJv5Ai/Dt9XqnzRm3L4b+CvnvSDJVVkTrcKPKMEMxmAeVf3uK8iMK/nNzz7dxgQU3nzXqNhUj/KS2CFHaKD/KCybKJs0lqMo5sDk6W8Q14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GcfooZo3; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=EUDk780x; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GcfooZo3";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="EUDk780x"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6918E2Wo1222083;
	Thu, 1 Oct 2026 03:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3Ty0I4mX2XbtZEQJhvcqmZHn03hKo7cYm/fv7TPvI
	uQ=; b=GcfooZo3NQhThisxFL9LXhuPV8vYDk5x5wiwr/nExoSVRm6NdDgF9q1t0
	3pNzERLuxgMC3NWO6cnJ+XpZWDH49L7anoufz7gEVufU2XVV+Wmaad5I8QMJ6v13
	weRm0M7/fgV6DMrt+oZRK/5fbzUb55aZWTxXFzPx2BnpBcaY2ktnUrkGybEfMG7N
	z47V2OkfeukOqYMBOKxCLuZI9X/uRUOg5xshFqZOty9kppNVhk94Bh3v2z+iOMr9
	If2mYusH8fNBxfvgImhQV0hh834mjcMSjcD7vZTBTGO1aB1GGM8V/n1TOQ61ADii
	yoCHSmjeB+hTsu6IU2GtbGMc/Xehg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqyg5r1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIyb3lpxPQfRzTVG8BSi+lgtwH+RljxCAJZeo4BCBFy0QWgLZBM4uC59Gn/PtPgXkv5IobKxcfrcFbYRao+A6W6PybAsDkBJuXsIB/l2AXxW+oi6RJRQCV7BjNBnAwnv+czEwWHkJW4AwAexTb6DK7KekPPPtxssVL9brJfXV8bzoBD/Q6a7cLF9pGgNtBNElE0HbO/v7Ep8ieHf+i/3weh2L9a75XVEQZ+klHxKteAw8QRILnjNxQXgqokNpS+saGtSnOviuH0o+KFjURNna93q0+zIXFoCsnid7t6UCzBroNNcWVRPqIB0Ho/Rxzvamz8RorukHjG5fYGOAhD+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ty0I4mX2XbtZEQJhvcqmZHn03hKo7cYm/fv7TPvIuQ=;
 b=mjYYh0CoSznTC0h2IGIXHa/jHgukiaO0mxM0+KHTiLhDsnKpLic0U0MYsBN9kC3dNuDpuoeRxL/Sq4Le/7iOjdZREcIAtMRRpDCPBjuSCyLTySOvTzx4WpFIqXh547Ni5zet5BlPALoRsjBhewW5Jb31qUpwhRTd7o6sbBvJSjgjjqo5G567l4SMXwHPJnvW43hmnLNnM5ehHVRoPw5tz9maK978JfVQgDCHQ2QfRluSl0ARoXQnfUQrARIrBsgV7788+17GHCEmpsW5wIPHgQMS0LoyywkO8zg7Ps2VWJTTpMl2AnrF7Uz3y9ajM0MyliiHBdRk2CjoOuzwwKkZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ty0I4mX2XbtZEQJhvcqmZHn03hKo7cYm/fv7TPvIuQ=;
 b=EUDk780xWh/LZZxsYFFmefYdl2oW3eGnlSBhmIoMEVEwle8gbKbGIbGLnvrVDJ7PyPkIJgEuDGc2XRUUHEPXdlR0UssS+HXbEiLnex7enqMEJ1fow2aK+cz+iM1uWx2Jvep3MZ3kRUZdLcSqhH7a0mRJQCDcR6WcbJ6GBqsSp7s=
Received: from BN9PR03CA0902.namprd03.prod.outlook.com (2603:10b6:408:107::7)
 by MW4PR10MB6679.namprd10.prod.outlook.com (2603:10b6:303:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:42:16 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:107::4) by BN9PR03CA0902.outlook.office365.com
 (2603:10b6:408:107::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:42:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 08:42:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:05 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:04 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s2630551;
	Thu, 1 Oct 2026 03:42:00 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 11/19] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Thu, 1 Oct 2026 14:10:27 +0530
Message-ID: <20261001084105.1692228-12-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|MW4PR10MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 406498de-aff5-4a18-e701-08df1f97e53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|22082099003|18002099003|921020|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+kpVld2/XV2owIBrG1NwBNAa+I+DkXaJJ8CeJPqthnsuvOLBqg3yneRL7SCSk53ZsMMJ3nV7I8WiIHVQ5JeJuo7XiiZyT7v+3aRaZtxilZLIECs0rAq7Lkq2mb6hutMY90kjh5/bcar9mCWoaK95kMLSafpY4Ea0Fg6u5AUT2wEAo1CT2+Q/Youl4i6FgE7EWQEqrgW0SMQeVTuONZsCeeTJDeh3dc0oUn5F2LuWyEzUgGGkgs26acVQ0yLHV2kxnyhBul5S0ruQLleYG6OGNjKKQVH3n1fh/JHgOy2bA3qLzYuV81dwXnRP+rBy+O+UxnQ4otuVtBIZoRC3sNzbQumTQVr8L6mQ4OBjaSNB3pSh8uQ2IXO7pWbRI6oegSLOm5JSP3xBeR5fKjsMGTrsp1tDdY340YMKOTJWw7UiinPt1KLUy2yKF0k9rNe3S3yBijIYBltzc/wIeMvj2gUejHMLuoOV/vItXqqYXvLlpnpVKvJb0sIqS1xUBHbNyKtX02ybKMn+0xTaQvQOOUSl453z7ZDqe7midDv8B97RLNTe+EVtn9Jpma7Ry3jNiWzqSb3CgbIbubPeKe4a+ogzbGw/QMLVwY/BW7WnBXVe6sjokhu/x7aJM/hni4yNabZ8UAgedubdC/Y2EWKx8zkgqZ7L6/dUNGyPuj3WVUS/zQoEVgc5UZpf14yK8cEXG0zmkqlkKW6CGBSn967psnraRQ9DlAN5ZzuVqiQqatKupaIBgT0SAkrXD01OU0hiuvK3
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(921020)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sr4+YJeYYh+v3+Ed+r9i1hSASzNl3OdwvqIFAYLZ/WiGxaM3A2nnhVuWShXk5oZkhWaglxDARvHQbgMbgbZAaKpU/xw7iD11ThdjVu3yksU8KxvereNKxFjFVZ4zlYE0wQzl8VTZXGseCOpst98xSgXUm7rHbIOXSUSLmQzifk3vyS44xDVBdsUjWYdQ9vlpxgIRmtaRlGVmzr/7GZTDQZ7oBQs7/y/YtjHiM7fJw4/XUIi1Y/Nqpiuo5wIBj1CgL0q/FWt6V95tUDH3U3fuAhpoFqnXM+WLngqzODoMla1OcTmqAIk0S2B5fBlKYZ9ZyuGonviAQ4YNCavMyedxLXL46MsIiaQp7xm+PnEuXVYpgAKB8ZJk2vRpFzN03Zdwg5Hy05DVw/QWSDa8WZqA/NIu6Kr93zZa5CSXRFhhowJxho4GCyC/VEqoDWq4A60G
X-Exchange-RoutingPolicyChecked:
	hDoixRPEKTeTyUWQpnsLhv46rsFSB8f9jTGyuvTCO1gMywLUCCMMeYTPdhZk2G2MgeNZrrlZSMFnMEzRf0ZhUOIyVJ74p8PDUxVoHrEpCjUZM1AmoNTM5mqRVEMo/m34U668yuzXe9uLR0Cvjf3q1tTPLKu3hsFlum9LDpm3v5yM19COoWcXKzJiZljzLhhXsJo6usDWMU+lK4O9O6Fx/qiuu7lRra3PFdJIxOucYFFPI5gO1VK95JHiDdgs49qBdwaQoeq0Y6zmSczeEZTjKIQ/FAs8q/B0qrHB7UgJstbvQd/hnCv+G66cxi1kVu6rgY0YBleELCBXau82WfdeHQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:15.5321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 406498de-aff5-4a18-e701-08df1f97e53e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6679
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX95P2Q2R9LXfc
 FPMYRlOiRr49VfHwlaD7H5FBjupGIz97NQAF458LxS7fxFXHEWdwMs10qCHWjfIZN6r5wHBcwZ+
 vNdHnGBzw+FgXFaK8D20LMe1rZmFQDI=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abe1cec cx=c_pps
 a=PeFxPTU/9IdxQzUa63kYNg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=SG0YUJ_OaaD34KHoFZsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4TAJv1MY4eLP
 aUoZWriCJLBkv3a6t+dsiGGeVZcRjocXH2wEgnZtJI7C3ng6v5DixrESeVU+6H4zuZnteWZ3++f
 XaHPvEuyS+TZZxTbV3K01KDFeoVP+qeR7F590k10YGHpZAKTvrC4L8CAPCruawW50hSwVD8ufps
 Dwnw0U8C/Vsg8YYtVS5AUa9GQwoO74p7tVVlEb/PdreaOCdXAvYHmNGGXK/f19NJq8dvY7VEOH2
 i1wBbuKnDYtXwo4L/uTICBK6gX0/lU8VSGWfJ50DR0h38z69I/lah7zgMsyOZkzBm38DYiMtEuA
 GdwQ7z7AdF4002ZFP/fxGI+BfEKjpoITdbeLkQzTeK01fbFdw/peU47G7xhdovlxoku7jR1KJ6V
 OR/brdk8VB+HUDzO34z+FK3j9LbK8t2Mt+TvILhDSLhkb0yp5Lc/JUK7RbxETUSZJt/rAtJks1X
 q7aSFe7MrZxww4esYKQ==
X-Proofpoint-ORIG-GUID: blNYeZKxjuDe79GUOuuhH-Eth1DmKvfq
X-Proofpoint-GUID: blNYeZKxjuDe79GUOuuhH-Eth1DmKvfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c  |  3 +++
 drivers/dma/ti/k3-udma-glue.c    |  5 +++++
 drivers/dma/ti/k3-udma-private.c | 16 ++++++++++++++++
 drivers/dma/ti/k3-udma.c         |  3 +--
 drivers/dma/ti/k3-udma.h         |  1 +
 5 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 2c009daadbfec..03f75b5c040fa 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2547,3 +2547,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 70eaf7ee57e68..f9e2a1e1e0a50 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -466,6 +466,9 @@ void k3_udma_glue_release_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 		device_unregister(&tx_chn->common.chan_dev);
 		tx_chn->common.chan_dev.parent = NULL;
 	}
+
+	if (!IS_ERR_OR_NULL(tx_chn->common.udmax))
+		xudma_dev_put(tx_chn->common.udmax);
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_release_tx_chn);
 
@@ -1260,6 +1263,8 @@ void k3_udma_glue_release_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 		device_unregister(&rx_chn->common.chan_dev);
 		rx_chn->common.chan_dev.parent = NULL;
 	}
+
+	xudma_dev_put(rx_chn->common.udmax);
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_release_rx_chn);
 
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 44c097fff5ee6..d2501e074bcfb 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -54,10 +54,26 @@ struct udma_dev *of_xudma_dev_get(struct device_node *np, const char *property)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	/*
+	 * Callers keep using ud (via function pointers stored in it, e.g.
+	 * ud->psil_pair) after this call returns, bypassing the dmaengine
+	 * core's own try_module_get() protection. Pin the owning driver's
+	 * module here so it can't be unloaded out from under a live glue
+	 * client; xudma_dev_put() releases it.
+	 */
+	if (!try_module_get(ud->ddev.owner))
+		return ERR_PTR(-ENODEV);
+
 	return ud;
 }
 EXPORT_SYMBOL(of_xudma_dev_get);
 
+void xudma_dev_put(struct udma_dev *ud)
+{
+	module_put(ud->ddev.owner);
+}
+EXPORT_SYMBOL(xudma_dev_put);
+
 struct device *xudma_get_device(struct udma_dev *ud)
 {
 	return ud->dev;
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 9a261747c8709..cb0bdfa825f5d 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2700,6 +2700,7 @@ static int udma_probe(struct platform_device *pdev)
 	}
 
 	ud->ddev.dev = dev;
+	ud->ddev.owner = THIS_MODULE;
 	ud->dev = dev;
 	ud->psil_base = ud->match_data->psil_base;
 
@@ -2857,5 +2858,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 4dd597ef435b8..65243c9ad1346 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -656,6 +656,7 @@ int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
 			    u32 dst_thread);
 
 struct udma_dev *of_xudma_dev_get(struct device_node *np, const char *property);
+void xudma_dev_put(struct udma_dev *ud);
 struct device *xudma_get_device(struct udma_dev *ud);
 struct k3_ringacc *xudma_get_ringacc(struct udma_dev *ud);
 u32 xudma_dev_get_psil_base(struct udma_dev *ud);
-- 
2.55.0

