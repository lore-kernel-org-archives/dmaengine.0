Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6044F7CA4;
	Tue, 22 Sep 2026 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059875; cv=fail; b=PqVkm5N6ULn8jajHMn1siqNy6xk3OshJEZWuFDN3C1tRsiZP4OT1x3EE+8+CkSpaxD92a74ySjf5NrXebepifLCYRA3Gt/Xs/f7IjN51Dz586FYnh3Wv1iLpAkiM8CizH37DG61nkgs6jrjxYTH41DpYaoUu7vKJCfrAegY8AzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059875; c=relaxed/simple;
	bh=Yi84l4rgMbs3LkYAUXw4rwuMvfWIYeSOtSc4KsdUI54=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqnjPenpGEsR1GpSEahq1JiXAejbxVilcgFpAnUXBMtDEMrDBlNsqUhERnvwYaL31MVJUER3bjhDL7FxHFQ2ntJjGZQ4qtY5hDZx0pv4RpILtqPd0onY0bHQgHY0q5MWKRZJncwKIrQiuv71CBb5JJtOx6x53BIInRPjGTFuraY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bQB7H+X5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vRnVWh6A; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bQB7H+X5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vRnVWh6A"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M5BSfH2149820;
	Tue, 22 Sep 2026 01:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6KMgOuSNuX7xG1qKd4LXi4iRk6iS/SzCWjZhnQvpC
	B0=; b=bQB7H+X5YyfAbhWDBvJFIwqOTLJzAjmzSepOSQ8iaJerIOMGBQQDYIc+H
	c0PuTq04Xuoc17sdVI0pOeRl/irAMsYpRIzlCag+FeR92evRsX06G8diegO3Lw6H
	IXsOkXdfA/lnAaeaZR8TiPG8XcUcEyYAKohY4n84McaBlJOhrQHTLW2Mi3Ne2cLc
	fUhzWmko6I+fh1ZNmScUbbzgqqojI6HiXyTqOcZwQ9IHOX3/9bYl3yOZK//NA6h8
	YYngTbGVYU+Gsa0Oiv44kqxnzpomZoD0MT3yU9yctxe+2n/Fc4Cv/YxmYRF3xJgA
	U/mWhcU1qWuRtkqaf1IBJUpCxNa+Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gu9cq427b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep8729asQULUHx5ve28Fr9V3RLR6iP+f7PN8kxAXd4lZ1PpLeXmpEIPDEk6ac1fMf4+5MC/roQYq1s/m5EzgWx47TOspsHYnj2GydEw9IM7K4zf8QGehknYL++GI19cnVgyY/FtzDGLHxqIrp70Nx4BI50T5yU+GCqEwC73qnuEPFtyZ9SHPNp1Vhv3rZ8SuFsdbU5ZyCGrX6H1goTWK1I8L6dUUPJlQsbrhrK5YuyqwHs/7eKcJx8831UvQQC45VoXISGLD3AcWiqMVM5kNtJWzc/0qdragDnrwAa2Yk4zjZZqDVZsqnxcNkK73/Ve/UIBpy1aBTNHMrrFFJQifaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KMgOuSNuX7xG1qKd4LXi4iRk6iS/SzCWjZhnQvpCB0=;
 b=rPqhyQmLbNYBSxtiXfHPUwuAQTT4xNySBfWuJghmlsj7K8SRDVu3OC33qU/iwZ3udfH2hrDe8KXKUAYgE8wrqNmnrpvpZD9HTcp9NShtqnXKFGwlDOtt+cJhBCB0Ga1vVPAujo08x3Qep/2csARXgvH94DCCTMqnX4Rz4kRzl/4/TlNrW209CAoHNRtaVX0kTpg6NhfTfXlDw2Zk65Z0/V/YBrM45NPv2xX5Jc8uBnJ7gFwdIpTcXzRvZv2HinEn/OZ1wpR027Jzqaviqzns4IWtS7djBP2ErVWjZ2f2UR/by5dgzHOdMbuN6GG3gwlLBTj+tZhAg6CsxkudR/swyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KMgOuSNuX7xG1qKd4LXi4iRk6iS/SzCWjZhnQvpCB0=;
 b=vRnVWh6An4AsjU6pij675XtWRyuiWHReft64xU2kEnJVYSilVWQxiH6uF3Z/kIJ0DBwOq6HJbclEpOejt2EUHa6l1x5uw+DrknY3+QJThlNeDAAhB9CAHa1TywQ8aMTpkxDkVUA47yltKUh5RNSgqdIQdkPMiahf4NoyHIISfbo=
Received: from CY5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:930:12::6)
 by SA1PR10MB7740.namprd10.prod.outlook.com (2603:10b6:806:3af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:50 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::1b) by CY5PR17CA0051.outlook.office365.com
 (2603:10b6:930:12::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 06:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:22 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:22 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI443626771;
	Tue, 22 Sep 2026 01:50:18 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 12/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Tue, 22 Sep 2026 12:17:36 +0530
Message-ID: <20260922064902.2719979-13-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|SA1PR10MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da3adef-f4c8-46a8-9c5d-08df1875d58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|7416014|376014|10067099003|56012099006|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	7nqCqKATs0nEiaesqdk/Vhy5EyT3t3EmGq3QN1cpSlIP/ETX3IrJbO1grmfNxDDxvkXDO6nkFoZjrZOLC0i+TZ0JmAdmSQs2Cigjs9Be9NgRJg/LMLhM0q+wgEQQ6oQVdz3FV0Sq9o6pKgLGjJ1D2ZEkM8+0k6dQdho3rEzxcwyuHpH/DfSXyia1N3Yb4IRvMYwbg3sSptbsKdqSpYkdv862YP75Pwac0owEaZMOtu+CDh8o/Pgu56RY1eqR3cfhEzUMyz2zSVQw/w2YxCfUdBocDCWl2pjLA3AEI6PEEI+lbiBnnhIWhCLHSJwwp0PCEwsnj5/A5hdX2Gs6xUZtDgLQbGsCPKBSI135M3pCZr+i+TL50916XA9Q0FbEqyntMbJI7O22DBkYJmpfqr899xAMVwLm6cRPF6w1VYF6QLSOOVQ9rDtPbFIze/KWuMOeTXVAtMwwZ4XSPAEc/lheJSuvMx3SpxHErj/Mhx0FdHcKgYJhOL6Ca41lqIPGCWx5hkItOTMCqXOI58khXvgapfnB+aowFWitBa+XQNoZ9LQVaYTDJp5eUfhCyWowfDBFUwArbdhks2FoSDTg9cSCKuMDRi3/ulHQFzpN5EwXdvVAVIUNsisMsTsKfDS7L2nKDu8LVR1gggd61EZzL67kc3adSlNfyUXf9jK90Y8qWYAw4xEhA811pdxgC03SbOEFHVCJpAt4842g9dOaDxrG0cCbw2Tg//HUCXAmStGYwB2UlMQgo/nic4hBXPPBE+7H
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(7416014)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8g/Dr9BkMX/JjoBxSTED55x/ElF4MUxwVRs44haat3N5DltQ+ek7Bi4wKQngQHTwy2FxN+iivL9ddS1eFyY8RLp4sUTbjLB+d1IeST0Rk1GL6uPOtfOiy4eo0URxiFyaRskuZKL6qwsIijg5yG1ekIj07ooXjlzGnRDetC3nDfk23HqCuc3+balDBDr5gPKMnuIXD0IZSqkodAN1WWDMiPDUiEgvsLBaeSUo+lqZMIXkm9LWxmvluSXBjGbhXUeLqNMTH9FkqCibdBjIdUElcm3XnrT8SyPG55uC/rQwWVRMnzu83DocA+VjXabMMxwDQVmgxKN1ojMPByrO+bX6f7Vgh7rt/h69LEgYprwUhUzopNt4mTKn3aU9Po9/dI6MbeZJyeFvHDNQyAdLiPqXfEVCEa2xkDj9TKYQofSzy20Gx0HKsVDLzLJRzXwifkxO
X-Exchange-RoutingPolicyChecked:
	ItAPbyE/xdMB3SzpU5j+a+kJ8qoZ9nuTL1LCLSMRoDBz6J+EFCg3XXg/l0/u85Ft4qjyZcAKI3im/85MYl0rB0lRpx+yBxsYeqpvSxQibicUeBsrJB8xBZVrqAyDx3O4JXYqG+UCXG/LAZSPJXBJqQjdZDcCpZ/WRoO4D59erWkNQ+A83TSZN6d/stRcKNDnZVGJsAsCSxepfdfbPKyQgcnbutBmcnrxdyrnR4v9KqUTcjzImHOOPAoF2extCT9w7k/KOT5eKND6hJMkg2YSazUhZvsjoN15a6Y8lsafFn3rPPvNOMen2D+28z0qfdYFf4v6XZiYOrGfFDqqC9OQ6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:48.1395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da3adef-f4c8-46a8-9c5d-08df1875d58a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7740
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX7ogQDsRIV3GU
 s4wWU7aj9gEnoVyUiz2QPjGU5c5hSXGjwnZ4u91YrZzqj/cOq9k+wXBQyOfZkK9wCcBHcOMnkUx
 0yImjUC/eigLS8pPGE0IGeG0zkcpR/s=
X-Proofpoint-GUID: caTyY-N2CbXvooMZ1xANoG8M-nOIs18O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX9UIJHir4EQ5z
 mUao/Zyefz2t7kRRsJeKWxRFkDFSF87AbSDjIotVRSazKhX9MlijL0plLkRI7Bbg+P5GghB49J1
 Y+hAq46XujcVhpMq0eCA3bFWyL5dNVXk4v03y2q95SpNRcUtE3cHYgOOx0S3ktrV7lk4tTSr/Wz
 oUV9yuRELHHaTzRIi1TZmjOlBR5WMXLodL9p22y/kjP5qWgYP49Hoi4LSYpKhH/9iBoPGjRbdao
 jOxS/Q8ccNxh2J0QjxFkZj+q0USrjsRggTWn6vep5WrMtqdoQYnLDntkIvLVMVuaFsNMgtaWmIo
 aw3v8KPsYsk5C5D251mN8zSOnzk7u4Ov3v3wZqCQoMHWoVCUPJFOk0E5NjCaPOM2Qoft4rROAWD
 ACoJyM3ooA9z04Du0g6cWG8ewYqnJXlWt4yDj8yhbbZ9tckyH3f9mXkrnuxLsgnIU5gugoo8A5m
 Bd+h7GyWxrAXDVk4YuA==
X-Proofpoint-ORIG-GUID: caTyY-N2CbXvooMZ1xANoG8M-nOIs18O
X-Authority-Analysis: v=2.4 cv=X+PHu2Te c=1 sm=1 tr=0 ts=6ab2254f cx=c_pps
 a=YSkC1VwTRJCIXQXpGgeI2Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=AlZmxT5CGg0Uo3zr_lEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 177 ++++++++++++++++++++++++++----
 include/linux/soc/ti/k3-ringacc.h |  18 +++
 2 files changed, 176 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 5966db4327b13..0ef07207e1dfa 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -46,6 +47,53 @@ struct k3_ring_rt_regs {
 	u32	hwindx;
 };
 
+#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
+#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
+#define K3_DMARING_CFG_ASEL_SHIFT	16
+#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
+
+/**
+ * struct k3_ring_cfg_regs - The RA Configuration Registers region
+ *
+ * @ba_lo: Ring Base Address Low Register
+ * @ba_hi: Ring Base Address High Register
+ * @size: Ring Size Register
+ */
+struct k3_ring_cfg_regs {
+	u32	ba_lo;
+	u32	ba_hi;
+	u32	size;
+};
+
+#define K3_RINGACC_RT_INT_REGS_OFS		0x140
+#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
+#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
+
+/**
+ * struct k3_ring_intr_regs {
+ *
+ * @enable_set: Ring Interrupt Enable Register
+ * @resv_1: Reserved
+ * @clr: Ring Interrupt Clear Register
+ * @resv_2: Reserved
+ * @status_set: Ring Interrupt Status Set Register
+ * @resv_3: Reserved
+ * @status: Ring Interrupt Status Register
+ * @resv_4: Reserved
+ * @status_masked: Ring Interrupt Status Masked Register
+ */
+struct k3_ring_intr_regs {
+	u32	enable_set;
+	u32	resv_1;
+	u32	clr;
+	u32	resv_2;
+	u32	status_set;
+	u32	resv_3;
+	u32	status;
+	u32	resv_4;
+	u32	status_masked;
+};
+
 #define K3_RINGACC_RT_REGS_STEP			0x1000
 #define K3_DMARING_RT_REGS_STEP			0x2000
 #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
@@ -139,6 +187,8 @@ struct k3_ring_state {
  * struct k3_ring - RA Ring descriptor
  *
  * @rt: Ring control/status registers
+ * @cfg: Ring config registers
+ * @intr: Ring interrupt registers
  * @fifos: Ring queues registers
  * @proxy: Ring Proxy Datapath registers
  * @ring_mem_dma: Ring buffer dma address
@@ -158,6 +208,8 @@ struct k3_ring_state {
  */
 struct k3_ring {
 	struct k3_ring_rt_regs __iomem *rt;
+	struct k3_ring_cfg_regs __iomem *cfg;
+	struct k3_ring_intr_regs __iomem *intr;
 	struct k3_ring_fifo_regs __iomem *fifos;
 	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
 	dma_addr_t	ring_mem_dma;
@@ -467,15 +519,37 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	ring_cfg.nav_id = ringacc->tisci_dev_id;
-	ring_cfg.index = ring->ring_id;
-	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
-	ring_cfg.count = ring->size;
+	if (!ringacc->tisci) {
+		u32 reg;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+		if (!ring->cfg)
+			return;
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		ret = readl_poll_timeout(&ring->cfg->size, reg,
+					  !(reg & K3_DMARING_CFG_SIZE_MASK),
+					  1, 100);
+		if (ret)
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+
+		reg = readl(&ring->cfg->size);
+		reg |= ring->size;
+		writel(reg, &ring->cfg->size);
+	} else {
+		ring_cfg.nav_id = ringacc->tisci_dev_id;
+		ring_cfg.index = ring->ring_id;
+		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
+		ring_cfg.count = ring->size;
+
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset(struct k3_ring *ring)
@@ -501,6 +575,9 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
+	if (!ringacc->tisci)
+		return;
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
@@ -576,10 +653,25 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -670,15 +762,36 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
+
+	if (!fwd_ring->intr)
+		return 0;
+
+	return readl(&fwd_ring->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
+
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
+
+	if (!fwd_ring->intr)
+		return;
+
+	writel(status, &fwd_ring->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
+
 static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 {
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	if (!ringacc->tisci)
-		return -EINVAL;
-
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
@@ -689,6 +802,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 	ring_cfg.size = ring->elm_size;
 	ring_cfg.asel = ring->asel;
 
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->enable_set);
+		return 0;
+	}
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
@@ -1481,9 +1612,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
 	mutex_init(&ringacc->req_lock);
 
-	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
-	if (IS_ERR(base_rt))
-		return ERR_CAST(base_rt);
+	base_rt = data->base_rt;
+	if (!base_rt) {
+		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(base_rt))
+			return ERR_CAST(base_rt);
+	}
 
 	ringacc->rings = devm_kzalloc(dev,
 				      sizeof(*ringacc->rings) *
@@ -1499,6 +1633,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
@@ -1512,7 +1650,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		ring->flags = K3_RING_FLAG_REVERSE;
 	}
 
-	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
+	if (ringacc->tisci)
+		ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
 
 	dev_info(dev, "Number of rings: %u\n", ringacc->num_rings);
 
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b925986..4b6ec925e2f2d 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -158,6 +158,23 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
  */
 int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
 
+/**
+ * k3_ringacc_ring_get_irq_status - Get the irq status for the ring
+ * @ring: pointer on ring
+ *
+ * Returns the interrupt status
+ */
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
+
+/**
+ * k3_ringacc_ring_clear_irq - Clear the given interrupts
+ * @ring: pointer on ring
+ * @status: mask of interrupt status bits to clear
+ *
+ * Clears only the interrupt status bits set in @status on the ring
+ */
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status);
+
 /**
  * k3_ringacc_ring_cfg - ring configure
  * @ring: pointer on ring
@@ -262,6 +279,7 @@ struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
 	u32 tisci_dev_id;
 	u32 num_rings;
+	void __iomem *base_rt;
 };
 
 struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
-- 
2.54.0

