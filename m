Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315440B0F2;
	Mon, 10 Aug 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374906; cv=fail; b=M6TcPSYEAv9z5O8Bzt28SBxL0XhQ/izEt5k/e8D8AWtwtQ3ndBE0zSwf3yFeZITu7MeEYzUUV6sLBW3AWtjRju/PMWvqR6bMws80XdAlZQ4eSNQ34CD/h4ReMRBTf/t2Jgpk45bueTWTQCC75+3N6ZOv2g4W9p8b/1OrnfGLgew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374906; c=relaxed/simple;
	bh=dAZSqEoSxTBTu0kU8J+uJtdjIzNsSrDJ2D7swCkbV6A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTiU7vNQLA7jLUZk3EQ3TNhh2er6yi5Uv9w6IPTc9FvA1Q2N0wuMnDNLDFQoMqAH5hPtcWFtp1ThgWOzTJgXg+sfDTTG5czhK9GUyFsMEsRbvNBrz6Xenp1xhmHCr+MYlBR0N1oCSMok0RLOy9xI7Ek6kve3+pfReAeIOZfr7Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=byNLnIHf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BrqQYmyR; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="byNLnIHf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BrqQYmyR"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUbAe3620453;
	Mon, 10 Aug 2026 10:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VXr33scVtYdUEw5DUOBN8G3xmUkJKlNDOmQ8EPUWu
	aY=; b=byNLnIHfTo+0lG9uNG2k0RvPO1TLFBOGq5cMXiWTU5LWJOyb7Y+IBv6Xq
	avBER1LCAHsDjrUPZ+Vy2DZsp5qb+Cx+M6OWhC6MzWX5GufQzAjVolC4nXD7+AY6
	P9g2nC0H44SC8lKj8VA+gCSgB+rcTI9d/JXwqmfZM14yucByCsT+JDJbIqoLvbWT
	9tIvyzSouv+f3oOKJ+P04EH41LC1dugBxJxfzNCALUF0buiwSeqxLTOrkKnfpOIj
	i7FRPqu6bMNHG29asPrdswbZ82GWBkX7XAdkU+ZIMsa9le0ARS0lFG4ECpb5ERYe
	+ozZilFyrjnRFXBcfobozEc/Sf5cA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79gtn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:14:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrVBam0wUiVjB18oag0fYk1IdS8cxATbgHg/idje0EAETJJkTyKT23oVoHHN9BD77LIMv5tCRBcxAqbddBfJ0CgNsJ+pSueGtjw74wEWjge15od07K22Hc0li8Q5ntLQL1Kxs4d5XeTTumzopORmRmgNQ/wVqOBe5I+awromH+Tz35zaOt25z0DKc7SX/NZ/R3NmQrtOVOxg/9olXFTVICWOX3Xr/V+ZCmTXqyyxX1t/TMDC4vCcoYs3aNibfop9KKeYVmmmNtKFu7E/uh5v8C511z6FN/m33vor1QY9S1aOV4JLgcz9f7e47ay5EqBcy13psZ31ftRp7l/mj7btfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXr33scVtYdUEw5DUOBN8G3xmUkJKlNDOmQ8EPUWuaY=;
 b=FUnWxTVVxNta2+3/KL6It+EDzs872ngNZgIYzGQOYLZlvEcgYdyoTTDhB5H+aOFAPQjVKBB0OtANllC1YnfHJ8Qn5esSgTOGiwQNG4mOrMGYbt01J3IaNVjnE7X6TltZg0cSP6B5GpG23rqK7mm+bz0UuhROjsgrcMBMjMvff9YgtvQi7bydk6+c2VTIjtsMzQ2Xt9wMtCaTqZyuIpqWX2WC9u2tKeaBgg+TuOEdet1of5UC8nt5ItZWkH1xajBS8j+c5GQ3OZGaI00uiQxkKhoL0uaVHfFIPth4dXvpQQfGuR7Fp4WqHKgCmn8i9oRbRK7ajm6V/O7V6pXXNmHNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXr33scVtYdUEw5DUOBN8G3xmUkJKlNDOmQ8EPUWuaY=;
 b=BrqQYmyRAzaxF9ipjASRl8mpm95Qbq+LQrijjv8zu1gQ6ABbdQxExo3yfRj1lbTMMBrockfayJZA1Kwk+eqoR7jq4zWNRNnOaV+j1dqVvaOcbxCO5pUNgn2SCbALfU0/3pzt6AdSLoMfok/Lubt7pHr2s6nNPQN1/8rY5p+6j84=
Received: from BY5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:1e0::30)
 by SA1PR10MB5758.namprd10.prod.outlook.com (2603:10b6:806:235::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:14:48 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::68) by BY5PR03CA0020.outlook.office365.com
 (2603:10b6:a03:1e0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:46 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:45 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:45 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERVw2648613;
	Mon, 10 Aug 2026 10:14:41 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 03/19] dmaengine: ti: k3-udma: move structs and enums to header file
Date: Mon, 10 Aug 2026 20:43:57 +0530
Message-ID: <20260810151423.1948224-4-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|SA1PR10MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e375b7c-8405-40f0-60c5-08def6f21d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|18002099003|22082099003|921020|10067099003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qVIHUkHH9EKbb4KY+w7LpF6KdSb3kdb9okXLXunuWsc3zmy581oGfgSISqlhl+CqpsumpL6O59/NO9h0DGvBk0CwVw2TpBesBooscbjSXGg7+G0R6GvVZomwSOT4WRPw5vksslheDUCFJ77RAUAdmNBtxMrugq1kjGz4+GrLYBl+DLG3QpJtNvIBZDhXwuGystLb1XSafkc5gaj13ezBqXMhGm0il+ysNc0iWAA/QceNUYpKR32ehYZvR50O+jOjXwnQB5ru/cJ1DJFCYUD+4wi/3uSemsjQFEcsVoN0/RN3821p2RQ68pCu71As7FtY4OR6zD+63Ty1v69kA7KgaLO8hz62jUvg5dkCVb8lz6mTuTRkXk+bY9yR1BJeusJAYrvzxkTJUSfTsCbieUdpHFzuEvffR+oRZOlcWKyW4ibaFEo/DyymNgOQxBj/6hHMyABqDV349fEVgL9O7BnXFL1j150WnxltJvR1SzpWAGmb0FhJLgj+rGosXtnvyzB8+mt1knisEfRtRBYSoYRGnvX5pih1VUAiqU4v9kzO3SJQq10qUjlZc6uxgtgiLnT5Q0k1vr4CVMDqbuAiJkqViPxEeRWl8m9km3xxhfo+/8aLKKiFhc3MZqyvSCiiM+F1q3pb3kJzHD6BUMYaYk83nyrNxqsgFMWz+iSZEPKFEFfapQbSxrHrftnHFao0o7N71th7E+663xmCo/qSt2vK9m4UD7+xonwcRKYEWXb1ES0OJ7K72Mwe67PdIXT9E67O
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uEjzTnfVm525cqvfqyJ5NXmpiEtMLJARqG2OSX3Ca4vH3+qlnii/Iv8FNk7wiTC1FXGOZjN1RZ2TGVPy+m/0po80Ndt9cR7utjOi9pmM7GSPn1pyqW44BPFifuSluHu9WABs5G2xJxqEDhCAm+e5eMBVC0Cpb6kWUcLuJkLo/CTUuJQBMPvPdwQzP/ZJTLhexmguN8zPQ0L/CW+WKwuHKpBHvb7nDNyK21w0riPS//4mhVN27ISVUxIu3xcXFR4jPeE0rUlsqvk8zpGGRttQCN5flC8j8eioD02jQa5ITqy8qDcQpcrKIyg/XarAdtF35uKW9P21vNFt+rZk7MT14oAEFEPek4/B4gJJU4pOkPGs3v5GfJua7k/T1w5dFQiQnwqptyBwoaD2blbRcI0VlMVWYdDwCd3Kjg8yi9J7mXyL5W/Pgz+0a9c4xrtiol9B
X-Exchange-RoutingPolicyChecked:
	CYTWKZjKi+yLLy+4EP365rHS2PMcOCT60BOT/9O2P77XDCOUnuAQCBJxVhYa7B6K6IOaI7CdSuanHJVjq3Pe/E5jPpXKiRT9FWkcdBDagsDXqfY7h3s1/cEMP1TavjWQxenYZh8wU4lkR5BS9jRLGiZK+9GDJXQgxkDtbrbeOVECk42EomYf5ovUPD1U/Y0d04xWVvz1Ig63lxzuloYsIZ6dY0zoYmDbgDcYPK4+JvHKDhzwWCU43MpCEoE8xp6KRLJUZv3Xa0gsKTLGww9DBXOMzEYYyfM/Htg5dr90TltCUWA7LxhJrE9s8TJtj5dJQYLqjADWSLdQ7oaxBlwIRg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:46.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e375b7c-8405-40f0-60c5-08def6f21d69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5758
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX/eLU26NPlLcv
 nPFfmeghIIm1pN78PGFwsr8JLzRhUS/tBM1AsepI26Iqqow1KAyPxidckgbp5Bn6/gfThsMTOOT
 L/uN6llLWV3YNlfhEytDb5LX1Wk9qJgtKXZjDpfUL+kh4IkLd4pFkgL8IsRgD/eJ8jRq3uWuMBb
 Akk1yCOhxT1JWFCwEZkM0iWaQqos1Dpvr44ww44beevYiSAaBurgBimHsdeJ52u0DVB8vQ2LHh9
 poyzSbbkzfzVphX38GIi16rVFfb8JJVnZ7RHnIZ2Pl4mtEciYcQlggq+K2UmZWT3IUdvUt8d5n0
 HuvRrUCwveqBjcar9zpE3+SPY3tmzLKYCS9c7TCv8ky8tplLkgVXR8LybbT+nlU0GqE7wrGRS4I
 eJ2QhbfIKNjkdt0I8ON0rEfgM9XS5Hc6tUtXUrFn/R3YZvV8iT8/MP8691PBp03AygmMs0ehW2I
 +F87NiJlCW16fGUoDTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX4lfdLoyj83Bq
 x8SXRmQq6XDqFb/dkXAM7Ii3ctFM+UhqI4yVx1U9YLSSPVQp9S4m5wCpWdQ5GHKGE9vu/4wV2dv
 28m0LhvbGkNVQBWIVGGSeofnC7cZuNU=
X-Proofpoint-GUID: jh-RZW8DKrj7eNqEBlEg9ispEteE088D
X-Proofpoint-ORIG-GUID: jh-RZW8DKrj7eNqEBlEg9ispEteE088D
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eaf0 cx=c_pps
 a=Sj0aQRr/q75bZ+qk1Z6sNA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=1JpllqVW-1LRWXCuGuAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Move struct and enum definitions in k3-udma.c to k3-udma.h header file
for better separation and reuse.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 259 +-------------------------------------
 drivers/dma/ti/k3-udma.h | 265 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 266 insertions(+), 258 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index a066862e2c699..ce706033143ad 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -24,8 +24,8 @@
 #include <linux/workqueue.h>
 #include <linux/completion.h>
 #include <linux/soc/ti/k3-ringacc.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/soc/ti/ti_sci_inta_msi.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/dma/k3-event-router.h>
 #include <linux/dma/ti-cppi5.h>
 
@@ -33,28 +33,6 @@
 #include "k3-udma.h"
 #include "k3-psil-priv.h"
 
-struct udma_static_tr {
-	u8 elsize; /* RPSTR0 */
-	u16 elcnt; /* RPSTR0 */
-	u16 bstcnt; /* RPSTR1 */
-};
-
-struct udma_chan;
-
-enum k3_dma_type {
-	DMA_TYPE_UDMA = 0,
-	DMA_TYPE_BCDMA,
-	DMA_TYPE_PKTDMA,
-};
-
-enum udma_mmr {
-	MMR_GCFG = 0,
-	MMR_BCHANRT,
-	MMR_RCHANRT,
-	MMR_TCHANRT,
-	MMR_LAST,
-};
-
 static const char * const mmr_names[] = {
 	[MMR_GCFG] = "gcfg",
 	[MMR_BCHANRT] = "bchanrt",
@@ -62,234 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-struct udma_tchan {
-	void __iomem *reg_rt;
-
-	int id;
-	struct k3_ring *t_ring; /* Transmit ring */
-	struct k3_ring *tc_ring; /* Transmit Completion ring */
-	int tflow_id; /* applicable only for PKTDMA */
-
-};
-
-#define udma_bchan udma_tchan
-
-struct udma_rflow {
-	int id;
-	struct k3_ring *fd_ring; /* Free Descriptor ring */
-	struct k3_ring *r_ring; /* Receive ring */
-};
-
-struct udma_rchan {
-	void __iomem *reg_rt;
-
-	int id;
-};
-
-struct udma_oes_offsets {
-	/* K3 UDMA Output Event Offset */
-	u32 udma_rchan;
-
-	/* BCDMA Output Event Offsets */
-	u32 bcdma_bchan_data;
-	u32 bcdma_bchan_ring;
-	u32 bcdma_tchan_data;
-	u32 bcdma_tchan_ring;
-	u32 bcdma_rchan_data;
-	u32 bcdma_rchan_ring;
-
-	/* PKTDMA Output Event Offsets */
-	u32 pktdma_tchan_flow;
-	u32 pktdma_rchan_flow;
-};
-
-struct udma_match_data {
-	enum k3_dma_type type;
-	u32 psil_base;
-	bool enable_memcpy_support;
-	u32 flags;
-	u32 statictr_z_mask;
-	u8 burst_size[3];
-	struct udma_soc_data *soc_data;
-};
-
-struct udma_soc_data {
-	struct udma_oes_offsets oes;
-	u32 bcdma_trigger_event_offset;
-};
-
-struct udma_hwdesc {
-	size_t cppi5_desc_size;
-	void *cppi5_desc_vaddr;
-	dma_addr_t cppi5_desc_paddr;
-
-	/* TR descriptor internal pointers */
-	void *tr_req_base;
-	struct cppi5_tr_resp_t *tr_resp_base;
-};
-
-struct udma_rx_flush {
-	struct udma_hwdesc hwdescs[2];
-
-	size_t buffer_size;
-	void *buffer_vaddr;
-	dma_addr_t buffer_paddr;
-};
-
-struct udma_tpl {
-	u8 levels;
-	u32 start_idx[3];
-};
-
-struct udma_dev {
-	struct dma_device ddev;
-	struct device *dev;
-	void __iomem *mmrs[MMR_LAST];
-	const struct udma_match_data *match_data;
-	const struct udma_soc_data *soc_data;
-
-	struct udma_tpl bchan_tpl;
-	struct udma_tpl tchan_tpl;
-	struct udma_tpl rchan_tpl;
-
-	size_t desc_align; /* alignment to use for descriptors */
-
-	struct udma_tisci_rm tisci_rm;
-
-	struct k3_ringacc *ringacc;
-
-	struct work_struct purge_work;
-	struct list_head desc_to_purge;
-	spinlock_t lock;
-
-	struct udma_rx_flush rx_flush;
-
-	int bchan_cnt;
-	int tchan_cnt;
-	int echan_cnt;
-	int rchan_cnt;
-	int rflow_cnt;
-	int tflow_cnt;
-	unsigned long *bchan_map;
-	unsigned long *tchan_map;
-	unsigned long *rchan_map;
-	unsigned long *rflow_gp_map;
-	unsigned long *rflow_gp_map_allocated;
-	unsigned long *rflow_in_use;
-	unsigned long *tflow_map;
-
-	struct udma_bchan *bchans;
-	struct udma_tchan *tchans;
-	struct udma_rchan *rchans;
-	struct udma_rflow *rflows;
-
-	struct udma_chan *channels;
-	u32 psil_base;
-	u32 atype;
-	u32 asel;
-};
-
-struct udma_desc {
-	struct virt_dma_desc vd;
-
-	bool terminated;
-
-	enum dma_transfer_direction dir;
-
-	struct udma_static_tr static_tr;
-	u32 residue;
-
-	unsigned int sglen;
-	unsigned int desc_idx; /* Only used for cyclic in packet mode */
-	unsigned int tr_idx;
-
-	u32 metadata_size;
-	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
-
-	unsigned int hwdesc_count;
-	struct udma_hwdesc hwdesc[];
-};
-
-enum udma_chan_state {
-	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
-	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
-	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
-};
-
-struct udma_tx_drain {
-	struct delayed_work work;
-	ktime_t tstamp;
-	u32 residue;
-};
-
-struct udma_chan_config {
-	bool pkt_mode; /* TR or packet */
-	bool needs_epib; /* EPIB is needed for the communication or not */
-	u32 psd_size; /* size of Protocol Specific Data */
-	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
-	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
-	bool notdpkt; /* Suppress sending TDC packet */
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 src_thread;
-	u32 dst_thread;
-	enum psil_endpoint_type ep_type;
-	bool enable_acc32;
-	bool enable_burst;
-	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
-
-	u32 tr_trigger_type;
-	unsigned long tx_flags;
-
-	/* PKDMA mapped channel */
-	int mapped_channel_id;
-	/* PKTDMA default tflow or rflow for mapped channel */
-	int default_flow_id;
-
-	enum dma_transfer_direction dir;
-};
-
-struct udma_chan {
-	struct virt_dma_chan vc;
-	struct dma_slave_config	cfg;
-	struct udma_dev *ud;
-	struct device *dma_dev;
-	struct udma_desc *desc;
-	struct udma_desc *terminated_desc;
-	struct udma_static_tr static_tr;
-	char *name;
-
-	struct udma_bchan *bchan;
-	struct udma_tchan *tchan;
-	struct udma_rchan *rchan;
-	struct udma_rflow *rflow;
-
-	bool psil_paired;
-
-	int irq_num_ring;
-	int irq_num_udma;
-
-	bool cyclic;
-	bool paused;
-
-	enum udma_chan_state state;
-	struct completion teardown_completed;
-
-	struct udma_tx_drain tx_drain;
-
-	/* Channel configuration parameters */
-	struct udma_chan_config config;
-	/* Channel configuration parameters (backup) */
-	struct udma_chan_config backup_config;
-
-	/* dmapool for packet mode descriptors */
-	bool use_dma_pool;
-	struct dma_pool *hdesc_pool;
-
-	u32 id;
-};
-
 static inline struct udma_dev *to_udma_dev(struct dma_device *d)
 {
 	return container_of(d, struct udma_dev, ddev);
@@ -4073,13 +3823,6 @@ static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
 
-struct udma_filter_param {
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 tr_trigger_type;
-};
-
 static bool udma_dma_filter_fn(struct dma_chan *chan, void *param)
 {
 	struct udma_chan_config *ucc;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 750720cd06911..11d08adb0d69f 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -6,7 +6,16 @@
 #ifndef K3_UDMA_H_
 #define K3_UDMA_H_
 
+#include <linux/dmaengine.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/dma/ti-cppi5.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+
+#include "../virt-dma.h"
+#include "k3-psil-priv.h"
 
 /* Global registers */
 #define UDMA_REV_REG			0x0
@@ -164,6 +173,7 @@ struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
 struct udma_rflow;
+struct udma_chan;
 
 enum udma_rm_range {
 	RM_RANGE_BCHAN = 0,
@@ -186,6 +196,261 @@ struct udma_tisci_rm {
 	struct ti_sci_resource *rm_ranges[RM_RANGE_LAST];
 };
 
+struct udma_static_tr {
+	u8 elsize; /* RPSTR0 */
+	u16 elcnt; /* RPSTR0 */
+	u16 bstcnt; /* RPSTR1 */
+};
+
+enum k3_dma_type {
+	DMA_TYPE_UDMA = 0,
+	DMA_TYPE_BCDMA,
+	DMA_TYPE_PKTDMA,
+};
+
+enum udma_mmr {
+	MMR_GCFG = 0,
+	MMR_BCHANRT,
+	MMR_RCHANRT,
+	MMR_TCHANRT,
+	MMR_LAST,
+};
+
+struct udma_filter_param {
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 tr_trigger_type;
+};
+
+struct udma_tchan {
+	void __iomem *reg_rt;
+
+	int id;
+	struct k3_ring *t_ring; /* Transmit ring */
+	struct k3_ring *tc_ring; /* Transmit Completion ring */
+	int tflow_id; /* applicable only for PKTDMA */
+
+};
+
+#define udma_bchan udma_tchan
+
+struct udma_rflow {
+	int id;
+	struct k3_ring *fd_ring; /* Free Descriptor ring */
+	struct k3_ring *r_ring; /* Receive ring */
+};
+
+struct udma_rchan {
+	void __iomem *reg_rt;
+
+	int id;
+};
+
+struct udma_oes_offsets {
+	/* K3 UDMA Output Event Offset */
+	u32 udma_rchan;
+
+	/* BCDMA Output Event Offsets */
+	u32 bcdma_bchan_data;
+	u32 bcdma_bchan_ring;
+	u32 bcdma_tchan_data;
+	u32 bcdma_tchan_ring;
+	u32 bcdma_rchan_data;
+	u32 bcdma_rchan_ring;
+
+	/* PKTDMA Output Event Offsets */
+	u32 pktdma_tchan_flow;
+	u32 pktdma_rchan_flow;
+};
+
+struct udma_match_data {
+	enum k3_dma_type type;
+	u32 psil_base;
+	bool enable_memcpy_support;
+	u32 flags;
+	u32 statictr_z_mask;
+	u8 burst_size[3];
+	struct udma_soc_data *soc_data;
+};
+
+struct udma_soc_data {
+	struct udma_oes_offsets oes;
+	u32 bcdma_trigger_event_offset;
+};
+
+struct udma_hwdesc {
+	size_t cppi5_desc_size;
+	void *cppi5_desc_vaddr;
+	dma_addr_t cppi5_desc_paddr;
+
+	/* TR descriptor internal pointers */
+	void *tr_req_base;
+	struct cppi5_tr_resp_t *tr_resp_base;
+};
+
+struct udma_rx_flush {
+	struct udma_hwdesc hwdescs[2];
+
+	size_t buffer_size;
+	void *buffer_vaddr;
+	dma_addr_t buffer_paddr;
+};
+
+struct udma_tpl {
+	u8 levels;
+	u32 start_idx[3];
+};
+
+struct udma_dev {
+	struct dma_device ddev;
+	struct device *dev;
+	void __iomem *mmrs[MMR_LAST];
+	const struct udma_match_data *match_data;
+	const struct udma_soc_data *soc_data;
+
+	struct udma_tpl bchan_tpl;
+	struct udma_tpl tchan_tpl;
+	struct udma_tpl rchan_tpl;
+
+	size_t desc_align; /* alignment to use for descriptors */
+
+	struct udma_tisci_rm tisci_rm;
+
+	struct k3_ringacc *ringacc;
+
+	struct work_struct purge_work;
+	struct list_head desc_to_purge;
+	spinlock_t lock;
+
+	struct udma_rx_flush rx_flush;
+
+	int bchan_cnt;
+	int tchan_cnt;
+	int echan_cnt;
+	int rchan_cnt;
+	int rflow_cnt;
+	int tflow_cnt;
+	unsigned long *bchan_map;
+	unsigned long *tchan_map;
+	unsigned long *rchan_map;
+	unsigned long *rflow_gp_map;
+	unsigned long *rflow_gp_map_allocated;
+	unsigned long *rflow_in_use;
+	unsigned long *tflow_map;
+
+	struct udma_bchan *bchans;
+	struct udma_tchan *tchans;
+	struct udma_rchan *rchans;
+	struct udma_rflow *rflows;
+
+	struct udma_chan *channels;
+	u32 psil_base;
+	u32 atype;
+	u32 asel;
+};
+
+struct udma_desc {
+	struct virt_dma_desc vd;
+
+	bool terminated;
+
+	enum dma_transfer_direction dir;
+
+	struct udma_static_tr static_tr;
+	u32 residue;
+
+	unsigned int sglen;
+	unsigned int desc_idx; /* Only used for cyclic in packet mode */
+	unsigned int tr_idx;
+
+	u32 metadata_size;
+	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
+
+	unsigned int hwdesc_count;
+	struct udma_hwdesc hwdesc[];
+};
+
+enum udma_chan_state {
+	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
+	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
+	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
+};
+
+struct udma_tx_drain {
+	struct delayed_work work;
+	ktime_t tstamp;
+	u32 residue;
+};
+
+struct udma_chan_config {
+	bool pkt_mode; /* TR or packet */
+	bool needs_epib; /* EPIB is needed for the communication or not */
+	u32 psd_size; /* size of Protocol Specific Data */
+	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
+	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
+	bool notdpkt; /* Suppress sending TDC packet */
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 src_thread;
+	u32 dst_thread;
+	enum psil_endpoint_type ep_type;
+	bool enable_acc32;
+	bool enable_burst;
+	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
+
+	u32 tr_trigger_type;
+	unsigned long tx_flags;
+
+	/* PKDMA mapped channel */
+	int mapped_channel_id;
+	/* PKTDMA default tflow or rflow for mapped channel */
+	int default_flow_id;
+
+	enum dma_transfer_direction dir;
+};
+
+struct udma_chan {
+	struct virt_dma_chan vc;
+	struct dma_slave_config	cfg;
+	struct udma_dev *ud;
+	struct device *dma_dev;
+	struct udma_desc *desc;
+	struct udma_desc *terminated_desc;
+	struct udma_static_tr static_tr;
+	char *name;
+
+	struct udma_bchan *bchan;
+	struct udma_tchan *tchan;
+	struct udma_rchan *rchan;
+	struct udma_rflow *rflow;
+
+	bool psil_paired;
+
+	int irq_num_ring;
+	int irq_num_udma;
+
+	bool cyclic;
+	bool paused;
+
+	enum udma_chan_state state;
+	struct completion teardown_completed;
+
+	struct udma_tx_drain tx_drain;
+
+	/* Channel configuration parameters */
+	struct udma_chan_config config;
+	/* Channel configuration parameters (backup) */
+	struct udma_chan_config backup_config;
+
+	/* dmapool for packet mode descriptors */
+	bool use_dma_pool;
+	struct dma_pool *hdesc_pool;
+
+	u32 id;
+};
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

