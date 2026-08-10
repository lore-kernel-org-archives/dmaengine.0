Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751040A945;
	Mon, 10 Aug 2026 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374895; cv=fail; b=oi5tQ+DVtgFASy4YOg8z1Xchr2mqIOLI2Id1kM5V0uOzBSXeKoeaEGSlKsdZ23wKtdQh8z7Z//KO0c6Z5zFHX0X6bjfOdHtIl2BMsNg/FsiTcbVTEWhjsSRFAvL7s7KsujV36lQlhCur5v0n0Y3nGuBorHGOA5FyXkUOSDostq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374895; c=relaxed/simple;
	bh=WJY3AKaNC/gLHlGSPe/4jNEwo2M0/91u1xIHBwRpW6I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YuKpXVS2nPWLmw2nhuCfndVZISYMvKZQ0sFVfx4VtaudSfctqp8/FC+9sevY1/c5Yzlb0xSzPzdVURlzpckUdH7/xYKTbBBbZ508oBPyLhzCqvlWbeWuWKxQTGP1cKK8IPBpMPp7vYTtaeCbGnkfvaqyXi9obXAhfKO88D6X4oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=eOJvdnqn; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GkDO3u0E; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="eOJvdnqn";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GkDO3u0E"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUad53620312;
	Mon, 10 Aug 2026 10:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2ovHrghrGMqdefLDMIOud273eAp2uf6U5cQKsE+TF
	zs=; b=eOJvdnqnWhKkXkkw+H2AXZZyXT8qfeBviv2N2ejDZW2a+15zyOaEjyAgY
	5DWlFnL/dSYYfLKIjUortnk4KRq3kf7Dmp08cgIQAxH1xn+ccyXT1CYCcBGanyeR
	ZnABOrQILN70Ox6pnqgsXnJe4Nkv3W+gOE0pNNy05ndPlLcD8HmCvxGzcLE7cgjy
	d8bN3y6g0BfDwDo5959hHJ4g19Y4RCJhRFgPZTmLwJEX0TMpokJaNahKTw7phGJn
	NXiCpgA8wvAEotu4HjjWBjYnkDWSu+MUXtYeIGVRDDJF1FCqXphPESXM2F3m0iP8
	MZVWmbpO4ew+qUcAkTBsVoFVyQF/A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013043.outbound.protection.outlook.com [40.93.201.43])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79gs7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:14:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2X5e44Lr5jJGp8G3yIpnetkEFNhGRW46CyNyVrLLjXsex/vDKtAHYNdTzfqWNdB/weiCOfdyQNk/C5mVSCkwLcBGHDCkzJO1fCxOM0TSiGFhu7ezsFX05H1RTTL1FrrFzGe3Y9hAIWM9XNWKqEikNgdfGG0HtSD6zTgwWWL+gvwfi/OBXJeluaRwh5b1u5SU5LajOlv67U0m6qujUnCJ9udZ3BZthpPA5sDpkidYqMwJbNzE1Y5ngIld39KzyXkDmEQUP/D1AoiLHsOGDXFSirbu1OANg5EnkuS9PFkaQ5hKgFIOqhz3xc4uaBc4NeJeflTwaNqEnZQ4IQ4tenw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ovHrghrGMqdefLDMIOud273eAp2uf6U5cQKsE+TFzs=;
 b=v385A+uF1RaG/k+72q2poo341S+ff2yX05E2MO7o8mY43tsPDu5KxRt8H2cRjVgLv1N63EbZhDZQr7syZHDsJGjsJUcManogBv0o2P22cyTo3hoJXaWZb3YrD17dUzc4nQ1mbngj/N/trTPdXbn4IgmlaW9MjWzCno3SA5fkO+DaixZZsdQIx9h/Efnc/AJrgOa7mRkDUSMVbAb40d0YhLj3WS0WJiVMnqFb+JwQewPdD0dOMsz2SqKRoyaGAXLrAHAyyz4oWYxLOaqg8eMBTm0IsWcsEui5z1yFIxZzVqOWlB71pT3K+AdPpI0CL/2KP5E8h884eb4OmvczBVn0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ovHrghrGMqdefLDMIOud273eAp2uf6U5cQKsE+TFzs=;
 b=GkDO3u0Ej3NJOgCn2F+L7LZxkP80P4PIwxIOM2+kHSSed3WtWbtU84tC/K5Pt3pPBzcoitAEEkEBgPS0TJpLOmqbhPzKn0BYIrmE0zd7C7ICiSMRuLzPPabqd977jGWopv1UgHA2QdcVbGt1WCK8vcRXWeUBmq9PbC3bwGIyz9A=
Received: from PH8PR07CA0017.namprd07.prod.outlook.com (2603:10b6:510:2cd::28)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:14:42 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::36) by PH8PR07CA0017.outlook.office365.com
 (2603:10b6:510:2cd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:41 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:41 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:40 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERVv2648613;
	Mon, 10 Aug 2026 10:14:36 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 02/19] dmaengine: ti: k3-udma: move macros to header file
Date: Mon, 10 Aug 2026 20:43:56 +0530
Message-ID: <20260810151423.1948224-3-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 5440cdf6-0301-4167-8ac9-08def6f21a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|921020|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	YtT5j3/jFv6dgWkoeFQFaxrRRpEO8j5az1pmROBllV5akep0DgSdQCHZFBR/XLgZtApgFWMp+n27X2StahvmLtc4w4T349poFX7MtAneBmze2C41aCA15/eCONAswk8oIY7DdCAz2uH+cxVymZQphDuyUhkqg10hj96aJyDoRE+0fq/Zgbv/AqF3tGNSSqarj4nm/ZFc8v7uW7UVKurhHFDvZx8PPNI9iW7MFL2TDuNnwMG4LX4g5r/T6+WZjt8RwgWFOBR2TeLQxCGmVaGn4T+8uWJtyxPNEpeBGlvkPSxIhv8M6sblaed+cZ4l4wcirBI72cXhvxcGP9YTLydXtOPDl0WqOXhmozRlDe2xeqrIaDFkjogXN9d7Kik95Jln9nP/x+kUpanJ7A7JQdvU8+5TLDqNtSETgD8dxvZhXi57NfuBcyOdc2IeTmeoLZzKfduUQ8SwpWj98RvnyQ8Is3KvsvBuDOtuPJ1SXOlepwy86HYslDV8ND8dVLeIVwCDgufrj03ci7PKgZvmHvnQ1Kor05KlDUsntOjLKQTe1V77uBLDdkFo6/n9Bn578sqDhxgna52iZWlKH0p9nKgNkDvgoF4bIBbRpwjbMzYEr+JS0FBKJh1hQ5Kw7iAuq9E+7xYe8jdR0kNIsL0zQAR9iM9TubId6KpbozWpXnPPr+dXMfYS/P9Cn+URpxd60XeNS5NMyHNNykzu67nZxrFXnbWqE7bQg9ViDXR1vtYpbPpm45zhutyIQgcs0oIpCE7t
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wFT7W1Aq3H3h4ll8S/x39K0fw2UuyUJc+wNTDwnLpi0oQq4BurF9PeOvce48VNJUrTSlicp1I9R/7ZpEPalt/XcnV8F7dnv0r6ExJv0REP5cAOg7XV5gIQn8gTmVqDnCgtjtn11ltnLTxgYf1hQ1DjBq15qNtmc1bvr0VUGjDzX83JwxQxDqNBOokETJT1lBXa8bbhGmiXFs0Ns+MlI/uvvMZGDGi9jbOcTqn9fO4+RGHS9hI4/ZPe2Eg3hQxRtehGW5Hf8PkYlHg55pswHOGZxB3DVKkUghUw7oxYJpILGiSk1LvbqZJnOH1scYw3/DnLyBGbiSGSaJkKmpAk4BI4n0NZobh6yeEyuAQIlGYTkpIbBgSjqLs8Zv7Afjdk8rd9vYqRGC/EVE6f8M4eGDHgnuVctwTmCjSKajqvPNJHZ7K8Me6aHOyjD5OKAjL1lh
X-Exchange-RoutingPolicyChecked:
	r8mAP1s4qEu3DwlX2QXQ0vvIc5l3SXj6hxN65rqNgE/acRio8tw4baOe4k8Nn53ReUXfq5ii4DkZaauW400GxaAhxjIfkVdnj/8ZHan6I6uD6uI4oponv8CBIWor5B3BabjRfNnYl8v64KSNI1ImjdMv7lbECy9uYnQDUD5W+VAo5FD40HnevHg0lWMtq796W0img3nK4xeokj/B0aqtyj34pStJoXVuJwX8SJ9jrZ1NswxJu0rvnf4YGAnmf6sjWWAYAcU27oJaykKIv1OZDnvTzNy867RaW0984JVNrP6hy47cy3bTL0J7LhA8a54Xz8tYWxuw2XTJau88oiPtBQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:41.3805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5440cdf6-0301-4167-8ac9-08def6f21a29
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX7WX5Zg8t5acn
 CW7Ky5n3coBAuD54OEBMpJwRqoYgL3aOxmiMIIvwYZ+dpy/vsdtgdCg5ghda7W4s7craak1xNRc
 GzcDH3kWznpsqjZ5bGSupHViW36VGbLfi6iyjLvL4TBkPIKBTVyDeFWuI+bwHo5qToyK4ZwPdSi
 bn7UXwLyYNFEiro9tsDD4BpGgl6a4m2up1SjPqrxAtJVZBFaFDxYkMyBQ+s+Sf5sHf5JQ4hiPKi
 FhmotJklySmBkjoRg2rSeMkHLK2xoS4e51+VnPrLL3T1wB06CmzBT0sZwP3eG11uHRQV43uuHHw
 5I6Ca4iF3PkjYFkvt8GLNoH/uDySVU+pg985QLpBUcjPMhl+7Y66btrqBoQBgmbc2ffBAs7+JY/
 Euon9/PdPiSC5HkizF5NP6fMRDm1Ej/HMMh5467kgakQUC/sbzR/EyWf8ggHZGrgl/5Lkp8hVJZ
 3LhnPN2zuLMjt62mdzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX+qn3DXjmw2ty
 BVAIsbRWp9cwqArU26eVF2CSOwsBpoIqWJhoz1QRaYRne5a31SGGKEmta8dUpFi7mIQ+BAVwj0g
 sCStrfFUETvzWFAPGkSzb4DN9DMaU+Y=
X-Proofpoint-GUID: 5FVaGWZcFIVNKGfXdakK-C6zgmyl1qbU
X-Proofpoint-ORIG-GUID: 5FVaGWZcFIVNKGfXdakK-C6zgmyl1qbU
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eae6 cx=c_pps
 a=XNh4DmHdy4Cg7KTw7bneTw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=u0Ry9gnqgf_Ls9jc7UwA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 48f4db777d924..a066862e2c699 100644
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
2.54.0

