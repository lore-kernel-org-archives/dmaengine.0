Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28802374183;
	Mon, 28 Sep 2026 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564355; cv=fail; b=R0FkDEwCtlwFZPVtPuAiOT2aC18RGz7DkfFbQwP4pS/am9F7dICTdxe2U6CD2xI88nUCTW1str7w4oiuQt+xU/VZM5KVDMXZkBz4k+TBRha3wkdYTPTZ6cRNF0/YDsXo1ALfmUWpirqDE2RnGmA5uxISLspheXcInI/PhGfy1Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564355; c=relaxed/simple;
	bh=dD/rsHsFBpjNGtyELuHpnh2tpYV+yShZHEqC8bX3qLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6TNz2JmxFPBiyzisIfiIYou+8GpVb6D9etQWUFiNA8rOzmPD5v4ZitUiKbT7KKCAhTsXcZJYJIDiylL9CMophRVJE6o3TnIFxKyZ1sWsjw7woQKh8dMhgL3THRwjku7pFL90qSy2e6nt879PKOqKlh7B2+vVZZdOq9xGN1gkqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=o4XyIIzm; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tGx3rPSo; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="o4XyIIzm";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tGx3rPSo"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S0miwF3149516;
	Sun, 27 Sep 2026 21:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wnd7uUCK8Gj6RW+b9cimF4nYF7gX+Lhr0xbdaWpzZ
	Kw=; b=o4XyIIzmBQ4/rMv5H3bkK1DSL463uCEAbVlDgN9eTAzC/5fFLAEYY5mHP
	qwY08RrfURekJYyH1x/ulrY45cdC7Vr1nBy+yh3rD6Uott81cZWcDx5y7smFfpbY
	Xq+NcRo3KkIGvtb/2w1jEgrTuzgPE954vfxzuFR1Dc8ftPE3O7fbcO7WPMXoz8Ae
	u2cPvwe2xDl4wMUkyGgY2nP0TA0480G3Gn/U8Kjw+FhUh305atY8PyPWnsdRGF1D
	IxwkyN56MyIqu8QS8Os6EYlVaV6/rGSz9wkb0HVbv6KA9pYgfgSVgK8tdunZ00Fa
	Gln4xPZgpt3g26SGBBBJ9HNv57JpA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nk6ee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4q42r1P/yq6xfhfgk+NqHLAI6nXXg2EXa9uYMZGTCik7KeTFJeaNFZXet1gdaTCqsi3rPzrtBYlykh64nq5e5eHYCz/g1y9EGyGD4TcvcQHcITPmR7uYdCPekkltyoLkBcurRVlUjvEufXFu95z+rpQSeRqs+0Z4fLwypTR3kshMRc0lu58BpNfXPrdOHOdw0kIqBtUQOd8R47TGASWghZJQaCJsk2fdqpRIlDE71ka/jGeq6Fh26AS0X7folRUy6xoIcCuPzn4sfztlL5YKArDaGYblPmXLWk6oMacoF1F9yr4GsJqSBew5SWpdAfoTbE7a2+9mscnvlqgd1TgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnd7uUCK8Gj6RW+b9cimF4nYF7gX+Lhr0xbdaWpzZKw=;
 b=YRCLtubbriMTA465xGpcZzluL4v5/HU4NTgSnAGIsJaPfSUTV6S0teZ/FUYP7/e95K4342GtYHePVo9R4MqtX62uWK5OTZCoFUCLhcuMbiXKAnsw66ZCSKCWNoHsQG5/lSQpUmDkIT+o2ZGEBkZq1Cw6MBS+uOvOTGJeb+Eph0G0Go7+VmJyQ52MUYg5hnmeVeBwTUtoC5Xu9Hj302DEs3T3qop0kfyRajQtN48ZNvYk6rd79FAbSupFqrQcLFPql1y70684zgbE2Rqgz6aT2UxzVK2QxJj7ShGMdr5kM5T6QBbkXAhr6wn8k+TaA/lJk/bxMaWGtUbrtEcBviQ++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnd7uUCK8Gj6RW+b9cimF4nYF7gX+Lhr0xbdaWpzZKw=;
 b=tGx3rPSohetGVvkjHMKJC3942qb0GQuJUIGDXjA+ZvP5G2ldGEYdymu9w/eM1lvy05F1j9QDDbk2NZ+EV07awJK4Uv9qPDA85XdWf0Ou/pHbCWP+1WDTrr4iCMkw56IpPJW5hw02VzXrgh1HmEuZaJevmpTRuWg0fzj9usf6RpQ=
Received: from SJ0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:a03:333::24)
 by DS0PR10MB8101.namprd10.prod.outlook.com (2603:10b6:8:203::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 02:59:02 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::86) by SJ0PR03CA0109.outlook.office365.com
 (2603:10b6:a03:333::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Mon,
 28 Sep 2026 02:59:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:59:00 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:26 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:26 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqD2256662;
	Sun, 27 Sep 2026 21:58:21 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 06/19] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Mon, 28 Sep 2026 08:26:12 +0530
Message-ID: <20260928025749.1055383-7-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|DS0PR10MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: de451366-05b5-4cc2-de1f-08df1d0c72a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|921020|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4QaFodbeJJtP/uke7N779UOcGJD4tZ0pT77MIhpUZqer9bx0+3VcQ9Q73a29E7GHQegxN4yNOosh4C8Xc5wEVuyBGHU+n4vbqUo5sGh4grWeG48wwyUkyP/5oE6itmadgxB8nUO0dyfATHaZXByOtpaVRPCl9d7S9PXjZ7zA1dss1sSkzloDNOAkbKeANgDlPGpqUT70lMKY006shasku/4FcRb43JhyfnMsByBA3XcfYB6szDfVlax4G+oY4BDHt8TWPoeygXc+ERIWMHjtF7UBdT6YtF7wOyKBIuK+wpRkBbkOrv+zaNiRlzSVHkL4eDk12h4LeAfwiB1x+SU3amM//Tek3a2tDJB8aXM7hN4wP1DV9s8qKgqfBFY3geerYF2HHU/3IVOchznUehOguoxvb9v/zkUsiravNFrpEdeR5ZGDBfnHdGxGetdXC+jxzey32fx1lonTtAteugsQLUhpxLpoV0aHB9YaEfJbB/uyw9B3aXkiWQc0RVutxXVnDin0v1eRcvfcrZagoNp8VcDfthlJn1q9yWxLmZzmgUSsbPyngKrk2vzyFnEESbPrcXrkavI6x+eovTuTef4f6CaTyq4SE0s0t/FAfdPY5QLvcK+5fkUedCtcnK0rQpdkI5i/fO79jJvEmGsSg/KzJ1d4kewsNOIfMOxYG6A7gf4PteVvnz0t2GmwGv+aI55ZEjYPOgYYpEVSxv/vrOK0L1xCVVbupuPFc8XoyoaWZ+TfpBwhv8wXb12uUB05NQav
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K41AwO9A/WfsaiUKihWfF6Wv37jq5EpEjhVy8t2uQjwfgbFiW5wTsYidPhvTjGOf5DgSSMfMIVuaN7S1s7gx7AdDprXrc/1Kjaez3nXhIq86RfsqfMxjpf12D5fe0uHWnyFwZrrCZjsugUtMunR5sdK/TsLou08cwWR89tDW2uD2CyVNll612Yv8RWrrEL0yb0DHQO46G2IR2inSfQXV1IRGkttu5K9tn74welmgNPu3tG2Fq+PW9Hwl/UGW4Rb6eRhMQ3hFUlvX7MR7sMcda8SHTpQxFLf6Z8G9WdTzGJblfogFOveijX3rg8Wu9Dzal1PhzsQ4Rr3/LkLomMOPArz4+2jSj42BMtlVtOH/KfBf29kka9S3HqKsN+RvlKsDlRWPSKrrEyXVIyYTMYQuaDfXkzEx5dJcX8NB7mp8r+l9WcslZ4yd3ZPeRsQiOf60
X-Exchange-RoutingPolicyChecked:
	gSyZvIERfbjQtyjfBRIS8aQMnHcd1wO9SCbtIpflbVsuDfSOo6R5yU6kAIqGrPR22N01zbDuyi0qLqQimybpPwM/m80WvcPf1sQKQxBpx5pySNywO/jL35wQxZIuXfTfqeeFHGi9iBSoyFCFp8/j/z98MtL9mvWa3BgIz8yGlJvnnFg34alLq8Om6MePObY/uOzvCwQOuQfjvJjV0s9Ktr9tfWAyrVtECiQTiQD2y7xNsH5jb1jTY1mPgg8Ht7iV0IDVpcd3A+mtRdyyLIje80TQoJ55ywnR9s7iYWCpOacnCB8cljSwBBYRylCkozD9WiTp2b8+NYkDBVbk45CQvg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:59:00.8579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de451366-05b5-4cc2-de1f-08df1d0c72a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8101
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX+Zua9XqQkxcz
 BkmikMFgwniA6pg84RUf6p66AslIC8QB5fRAZo4bBuxllyGigmpmPRQIS7vxt1OcuwxZCLKhB5N
 2fErFQTiR/Z5VVPcr9BTWDFPVcev5Xw=
X-Proofpoint-ORIG-GUID: s3kYZ3mv8wMP4hqJghbxEGLAjhe0BkQt
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6ab9d7fa cx=c_pps
 a=Xv5HOu5WSFZfuBAuS1yumw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=g6TaX78G5PB857Cctd4A:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: s3kYZ3mv8wMP4hqJghbxEGLAjhe0BkQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX9X4YOs0t1oKx
 NAlk6ejpUEUXqVhbzmXj1bYtNi8vSphDW3NRDhRKVIwbiFigOLhukzTccXK5dm6cB6Ga3/pXqjV
 dfE/x91xgsJ8itadwCIaEpZ5fVTBJEWSWN+G8hQ9u/M9wYRSwsiyjw9FI9DuTEYKNw5GD3JJEJx
 9PQjQM7P85Dz112eeJK2uZygjqkqflhWB878waeR8lmLGn7Jiry49CIc94nK7MjLexnDMQKDXzY
 VVpPqRheh02ZBLZNgnhx6b+LSYkzW2B1wn6q7OZC2jMUM81ZO0vEKHRMh2hOw0/TNzdBRp1XDgX
 T5IZRO2rp0U9LOuybj0Xjd2xo/vFgwYJBHIs1c/57TabVzPmbfoiPls6EHY/PLx+Cw/x++o/YY9
 spyXQFX8uIoJQ9zLerI3VK91ZzZP1YT/CBu/2tU/z7lk5lZZnfTnSoucigXWk82BqDHUBfQn72Q
 EeWJNtTxlfOimQDSsCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 103 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 100 -------------------------------
 drivers/dma/ti/k3-udma.h        |   4 ++
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 3130805a8ec40..3ec5cc932280c 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx)
+{
+	struct udma_desc *d = uc->desc;
+	struct k3_ring *ring = NULL;
+	dma_addr_t paddr;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->fd_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->t_ring;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
+	if (idx == -1) {
+		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
+	} else {
+		paddr = udma_curr_cppi5_desc_paddr(d, idx);
+
+		wmb(); /* Ensure that writes are not moved over this point */
+	}
+
+	return k3_ringacc_ring_push(ring, &paddr);
+}
+EXPORT_SYMBOL_GPL(udma_push_to_ring);
+
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
+{
+	struct k3_ring *ring = NULL;
+	int ret;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->r_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->tc_ring;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	ret = k3_ringacc_ring_pop(ring, addr);
+	if (ret)
+		return ret;
+
+	rmb(); /* Ensure that reads are not moved before this point */
+
+	/* Teardown completion */
+	if (cppi5_desc_is_tdcm(*addr))
+		return 0;
+
+	/* Check for flush descriptor */
+	if (udma_desc_is_rx_flush(uc, *addr))
+		return -ENOENT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_pop_from_ring);
+
+void udma_reset_rings(struct udma_chan *uc)
+{
+	struct k3_ring *ring1 = NULL;
+	struct k3_ring *ring2 = NULL;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		if (uc->rchan) {
+			ring1 = uc->rflow->fd_ring;
+			ring2 = uc->rflow->r_ring;
+		}
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		if (uc->tchan) {
+			ring1 = uc->tchan->t_ring;
+			ring2 = uc->tchan->tc_ring;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (ring1)
+		k3_ringacc_ring_reset_dma(ring1,
+					  k3_ringacc_ring_get_occ(ring1));
+	if (ring2)
+		k3_ringacc_ring_reset(ring2);
+
+	/* make sure we are not leaking memory by stalled descriptor */
+	if (uc->terminated_desc) {
+		udma_desc_free(&uc->terminated_desc->vd);
+		uc->terminated_desc = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_reset_rings);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index a8fe919f307f6..6a731fcfc0697 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -174,106 +174,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static int udma_push_to_ring(struct udma_chan *uc, int idx)
-{
-	struct udma_desc *d = uc->desc;
-	struct k3_ring *ring = NULL;
-	dma_addr_t paddr;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->fd_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->t_ring;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
-	if (idx == -1) {
-		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
-	} else {
-		paddr = udma_curr_cppi5_desc_paddr(d, idx);
-
-		wmb(); /* Ensure that writes are not moved over this point */
-	}
-
-	return k3_ringacc_ring_push(ring, &paddr);
-}
-
-static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
-{
-	struct k3_ring *ring = NULL;
-	int ret;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->r_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->tc_ring;
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	ret = k3_ringacc_ring_pop(ring, addr);
-	if (ret)
-		return ret;
-
-	rmb(); /* Ensure that reads are not moved before this point */
-
-	/* Teardown completion */
-	if (cppi5_desc_is_tdcm(*addr))
-		return 0;
-
-	/* Check for flush descriptor */
-	if (udma_desc_is_rx_flush(uc, *addr))
-		return -ENOENT;
-
-	return 0;
-}
-
-static void udma_reset_rings(struct udma_chan *uc)
-{
-	struct k3_ring *ring1 = NULL;
-	struct k3_ring *ring2 = NULL;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		if (uc->rchan) {
-			ring1 = uc->rflow->fd_ring;
-			ring2 = uc->rflow->r_ring;
-		}
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		if (uc->tchan) {
-			ring1 = uc->tchan->t_ring;
-			ring2 = uc->tchan->tc_ring;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (ring1)
-		k3_ringacc_ring_reset_dma(ring1,
-					  k3_ringacc_ring_get_occ(ring1));
-	if (ring2)
-		k3_ringacc_ring_reset(ring2);
-
-	/* make sure we are not leaking memory by stalled descriptor */
-	if (uc->terminated_desc) {
-		udma_desc_free(&uc->terminated_desc->vd);
-		uc->terminated_desc = NULL;
-	}
-}
-
 static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
 {
 	if (uc->desc->dir == DMA_DEV_TO_MEM) {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 62c15b0cc9ae7..767b73021390d 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -614,6 +614,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 			    struct virt_dma_desc *vd,
 			    struct dmaengine_result *result);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx);
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
+void udma_reset_rings(struct udma_chan *uc);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

