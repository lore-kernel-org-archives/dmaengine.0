Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A242374A0E;
	Mon, 28 Sep 2026 02:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564350; cv=fail; b=Ah5jdTxwkz1aM/bC5j34GHoWA02XM9S9dcMc/qSU2fQEgVWA7U1vx0LyfF1qDytDr8NVG01GsrJPuqs43+IeTx1KRcoeuvfMj34PPEtucSVmabIDV7PppKKptRGtTWbBOX3OoXDhPZnbZivpOskXDT9GtUbBJbGsWutoTpnpTFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564350; c=relaxed/simple;
	bh=Z5yqiGYQb+zbhB5jd+Fn5cjG2p1x73Xbil4wKmJeRnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfJwfqRIeCVB5nT2ayYVl/HFO7x79+5UgqKswPoqFEL8/+HbhN56nIWFljV/jdS+LBanK8vNpa1rG0ctjuOPH67YAdaddXd3s8LelFDCpNfa8/XX4W/ErktKMd3e3/IkKyivzSVZVO+y1rOOGO6N8Dc8eK6teJGoI8oLpSAMW2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gGeEoJ3F; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sGd9/ZJm; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gGeEoJ3F";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sGd9/ZJm"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RM4Jhe2282852;
	Sun, 27 Sep 2026 21:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=H7SuJRbIzkpZSygmg8FrIDrs0PBd7WpV3zdPr7z8b
	TQ=; b=gGeEoJ3FNeESkJej6X7iouPw8HSVQZyRdEifrzUdPZNg8v1o86lqOLVVd
	GKgPJId4oeDipL/s8PbEenvV9d6EjIPFvp2VyLI6jJwdJDQoHP/K8iM1cbDaR7IE
	mbCbkA0mEsP3sg3ixyf1nSggB8LFn/0oZTXdQL0z1XB7SsE7Hogjw7xYKgagWQpz
	WwfRnhGO+xRS6/isWoBejNuZdG6EldHaF14tbG14qUFrPM9muVmogjevzIdQk432
	vwW2bsZckWvIHuzAlqcP44sNr+1922czv5zZk+jzrGbFdx1sEn/7TMuKrWL+P7bU
	Usdiyy0maV4b5gUaCIPWPYLHh8G1A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nufxv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5PmNXtSwEl6E/1KOQ0bhDp6JzRw/7GhizbAaT+EdBVjaRXYwJZ9XYfhdiK8YdW4rgICRSE8WDSBUqtxsyk5Xcap5Z4rW8WesdWdm74zTq1PmBBnb19Xjx4hLSSWD6a062UxODFTJvETOvHmuopSWa4sl4lHwSrlxVQj08/YGhbD7P5Bp5FD2RkW3SJtkSMA0GQXBqolHgPKck5E246V+hq2YDXttsupt0lcHc0qZRSw3TcSidu/yswjGkRtOgA+lP5Nuvv7kzIPxTNV15T5tgGEyQbAO7kcs+7Fket8LxmpilUI/Tu7qd1wthrn0d3+qNI+vaxWnVPQOEOrIR9S1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7SuJRbIzkpZSygmg8FrIDrs0PBd7WpV3zdPr7z8bTQ=;
 b=cYUZ4iKgr1RZmGb/KH5vbQeQu/RbC9HClSZXcCr+cOGnNGrsNj3YF1juV5BbsWj2xMUaRFlw43X/U0af4KVZMZK+Uyhm/gnEofgRXbQ4CRqHzoFwdLpVXL4Ljf2XQB7nD+lSlSHDkjZhtaFMkKSOryRT/CgAwJPj1YtH/uSj6h6iSS1lY+2HR2+sU6hT7f7F9BoygqouRaJwVM97m/eMnS398VNlF6HeCDuVbAiPpzHza++O1i2Bobfc6ebe7xRdXRitjPt8Yt3vp2OHYW3g5cxZitdOL8ke3LUzGZVoNYlsgdVus9C9wL939RsTdzo9iKEpX+Isfty5/Aj9lxq6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7SuJRbIzkpZSygmg8FrIDrs0PBd7WpV3zdPr7z8bTQ=;
 b=sGd9/ZJmWtCspZSxiaowgmokZkiOKS176EWI1GH1obW06X8Di8ZpshpzL1Ieo76VeLTHbALVxr6C81U6Byll4jEtGeAh/vwSOdV5usAVXUQdf/wmKn/U8QwQS1uqrAqgGWa6rUkxmJu9ZKwoxL4bRpQ1QcAbNRRx4hR5r0rU3ys=
Received: from CH0PR03CA0330.namprd03.prod.outlook.com (2603:10b6:610:118::22)
 by IA1PR10MB7537.namprd10.prod.outlook.com (2603:10b6:208:457::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 02:58:56 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::3b) by CH0PR03CA0330.outlook.office365.com
 (2603:10b6:610:118::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:58:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:56 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:50 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:49 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqI2256662;
	Sun, 27 Sep 2026 21:58:45 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 11/19] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Mon, 28 Sep 2026 08:26:17 +0530
Message-ID: <20260928025749.1055383-12-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA1PR10MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: ba131219-1337-4958-31c9-08df1d0c6fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|23010399003|36860700016|921020|22082099003|18002099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lB4yuiN3LYHRIefQ/miJcj4bYIlyBfjSMrkqpL5DBCvBZwStxhYmmMXDGRMvJxO11uPvVUyD1rNq2cBmg+UGXXRRPBu4pQ7XHaOOTYTsuEHopTWoUbCawTALeJuzfGXd5Ie4nLP6CQJ9aLi0ykJb9RpP1UDUQ6tYQphfGIOkLlpd43vnlwOB/9YJrqAbqaemwUO0nC2bKu5z9U0GgUzh37c/zk1nIF4b32LrFurCfQMjkWxyyPMyxMgWVthw2HiE3DA6XpjvAP/c06RDO2v50NKly+o94jQo9NPsBgDsLCarInNz5J8E3me2nec0KsX4+Gx3aAxlP1CiMQslqW6t0qU+27WaF0GA/PR9svDNSfsDLor+uGAGYxgbKso2znx4TbAYd5tnlMR7M70JMSVVrMURcXPX9mJu/zBQzjp8i25yMeH7fbWpz27GaEUYbqHocnLkKnCwQRa6E7k++2gxwlkhxWAYHsx8uIomxtmxTeTvMJ7X2/QZUB0IgqLW9vLwfYLljuDhH2gSlvwGmVpXRmX++ZSICzQFxwxJh5BRQsI9R/nzUAgD8ECsEpjwCQzzbUccK5RSi8ff1dFb/oqtyjSFmkLC0dGPWvpCKSTGNyrSsGDsnqL+by5NqLhp4ZouVsGPlcntf3cqtVLpLbI0NP6w5+4SIj42YadaF9rIoT6Kfa5FIZNeZw8IWVr8nDskat2hsbwof5/KWroQrSxoeecFT/jyLQehIwNXtZ6oCtRaQ1fUFmC0L7R94rmfwPbz
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(23010399003)(36860700016)(921020)(22082099003)(18002099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VSZIbSMGz6mTh7Z/Rafp5ddYKx2o0gRMlG3nQL0Q0Jetnum5etbCq2EUkUFrczhuHYp2OpN9EY7T8mxKgDvSNIroc2Qd70uQfPwoSKd7hrCO75MbJQjLMj9EB45HJFbVqZ8ylNC9OoW2Ye0jzaAvKiDa/TZx8JepJQ0g21/XAUjfd1CoouuCAddDe0WMUyJynzGudCx2VLgh3Ue+rA9O4ylfmvyU5NrtZxC+2LOEO3YpHSbHjWB5UW5Eg+zUB0lLqpyGtLh9VGzchF8wNL85fy57aJLhOA9v6uHR+IhV6nRl6FDpW4FxB2kywLYpJ5GGuQiAbUZuMHDXZc4khVvsLMj3Q3JJImdtP+Y7/Fkfsd2cBhQ744A8ed53H2NAlTsxSw/xL1Jzeh/mH4QqMSANkkhIVwgjJ+nzYRBQNj43I3/B7ae5n44Q/FinH14m3/rr
X-Exchange-RoutingPolicyChecked:
	bm9q9ak+vBppgNAt6g1YJW+PtEKGIUpjvEtFY9wBCRy5Wmkcwqo0AyjA0wBC6E/CIYochma6ecvr2zwvSR6PjaihBmDRSXRlMJyZ+fmP9WXi9uvolh768R2ResLLRXdECmMYJMlyL7ks8rRtmEJPF89kpE7J5DmOZAxRk92mY/JwkvCoahaD9rRcowipYZBXDIjBNY5R4zpXPq0552uobd48H9mQJZi+xxpbx9zkIAYQCk0ZvEhOsxXY4pzzZFa8fPWONXScisgrTPQb745qHtFmLHzT34Jsi0kzM7lzIeXZnufJSE9Tje8k+MYt9xqQZXjPuXev4sriJav0XfulRw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:56.0031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba131219-1337-4958-31c9-08df1d0c6fb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7537
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX8y56HLF2nMcw
 U1WzDeGYXgTwdZXuI5KgTHnpXCmj3cyYg9w4yZTecgO/AP1LL/ur4ZXcnH1pWw0fYclYVa15Gw6
 7u0VJsbaNPmHGGv+/9HRWr1Rbytsq8Q=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9d7f4 cx=c_pps
 a=cvmpvQQCsZncHh92cDAFKQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=tBjUjbL6H5YkyfA7LM4A:9
X-Proofpoint-ORIG-GUID: F6O2V_M9Ez0reQk-QvMNY8-3OB9Ip8O5
X-Proofpoint-GUID: F6O2V_M9Ez0reQk-QvMNY8-3OB9Ip8O5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX2B5Roz98TlOS
 Sv56D06e8AJxn4OWMWLSVADlWy31Vi6qbTKKdWQ0OH9JQaON5/0Z6sc/pE4uSD8QUc9FyEkHkHy
 sU+Q4LfUldyCFkbTKwCeQcRSYMGsBnHYFKSkzLLSqgoH2iHbmBPnr8BvqT97b65R5Eh9p9XKcZP
 1zfT6IhDrdedXMzZ6kX2rAU78MCKkZFeFI2P60Z/IvQ3UccC3WL2r0VzByVjHyuC2K8rWhTLHHN
 2GxxkBODQzXplp2YksDOBi7F6yGI69k4G11JtBEU3Z1U66gc0/UlkqzNsUyiIbUbYd6a4Dc2Y3T
 9gYN1jqkie4oAuJZsHGQjj7tjK5CuZK2hRpOt/JYge19mRWYI9GuXHRAm9S0oZaZk3DWJsx2YXe
 n8NsWonCXG+qY+2gxnTC21pmFTrKeaA/eglJXpPG6K/4s/kBWq0sdbc7WOxNPedZsa9TACvSdlg
 m13QJG+17y6UwE2VFNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index d0afbab01786f..eb555cc08347d 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2536,3 +2536,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 9a261747c8709..ddedd51ab26d9 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.54.0

