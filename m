Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D6636DA1A;
	Mon, 28 Sep 2026 02:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564335; cv=fail; b=DLOTSEILCoplPGWvv+NWiydLEAXBGQfxkJsd6+Kd/2E0BrBJRwZw3C8Ntyb6686uSRi0Oou+v20t5bD6llkmtKRjWxx8VfjCjaDWr9aUyC2BIEUBSaJJjgevaH1McQ3BLC5v1f8Nui7BzbrtV7GtQ9dHf6gR+ljRqf8V/U1dKHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564335; c=relaxed/simple;
	bh=Eme2xSy2VfiQ7P4WARJMbEdhgm1AaojTY0SLTbQoBzw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QlXLpJEwNoPAz93VjlQiMkWEV1mMd4J8sTC98P0ewJpo+b4STIMRIRCV3Jh5aa9rs/ZKzYCajucnN3dbMRI+coOb1ABl7tMdSGt6KQBaA7qEFuffV8ixIFNF64bg6a3NIBKDV+OMS57IvkolMxCCTI+76xBpIzl0sinbk5x7KCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ubtn3YvS; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uJ0vNmSl; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ubtn3YvS";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uJ0vNmSl"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S0RoKm3706315;
	Sun, 27 Sep 2026 21:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ufS10IuV4rNPlv4A6/SND55bzkb9Kt7l4TDzuRCVL
	A4=; b=Ubtn3YvSJNHooT1huh8xSqH9y/kZ7SnPpEjwGhQ/+ssFhCT43CBEoZ60E
	IxaVZiW3XPh7LqlOYvcKFwTldJeJY2+IzTQ/pCKnbUTlpwaNFcNHIxT+/la0L9Hv
	fBBHhQET5vsPcfDxllseqpsFsi6uvknry9E8FveLCTa7QwfggQJ9bu4FS8k1HwFu
	xoUgcBMxsL+lOgbNevOcBt83T9jXkVKNhNpGRMdpbd3dcrY4cT5dykOGQHlBjdnR
	vSxzyOlVS4HW00S2QX+F2eklo2FGREpTlPVfRedNh3z1ANA2FEWfWKTT0x0GhnxN
	cq+fx0rdjeuXPzNXedI4U6QaeZu5A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb1q8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:58:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFjnVJqcAIUQY+0WgNI6DNneBwzRBJoViOo5ZVrfwmsqVZQN4C5AkIbE2ueDSHgeWZlJZzwTJt/5/HTQ5RzeY1iYFf4xmYNv0WZYD1QOkporUPg1WRZMQWoTgCgMAjxlllmsoF0j0U+gsoRXgOvRtGXVz+t1pWClthjDkzfHE9LQQVz2up4uxj1ajIkIMASlOpr3bW5NK/Ujo/nRhw1tQLW3XtTDQ2KTZT9JxPoqgeWdMKV+6OwK+gQ1scsUD/wrKQxh94cfFLGKFrWAPLD7KQeGHbQTzESLQFc+8GQQZj3Iro3WQhZIPcOo7F388Oj/SMgWENam2iQouSGCyGre9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufS10IuV4rNPlv4A6/SND55bzkb9Kt7l4TDzuRCVLA4=;
 b=LAK4OOGZiV60j8tJdpJGmELAsoNK9fy8rfAS4L2vUNn4ppT9K0HwyZgWCrBlEZs7TUZHgEn4nLsU0jp3y6evcU6ry0oT4qqWueGil3S1oJW9w0RtyMgS/fa6WPvqqbp9lrFlpTHsOoym3a9qFJqX9o/bjBUI9l1BvnS44Jc/eCBCGeH22gHzHeEhh1lc4tnSuIx64y5RNJUbnmK8lQcvtbBkOdMFUa8m7GtRR15ymtvKCr4NCBsV/Chk2S7BpbQkRWUfw6/a9LcplOUy5OhGDJ2qonBdL/56xxPPs+4DySsTp4R/RpGnsu3uSCKS0hspwAW6uuXMX1wzzs6Aat0LWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufS10IuV4rNPlv4A6/SND55bzkb9Kt7l4TDzuRCVLA4=;
 b=uJ0vNmSlmZZOt4r4QRn5d6zoVZ6KM4mUkfU9NcT8LoeB4b8p6JdjBECMAQWTejKTH2ubyI1RJJmYAZVIru60VdSqZy3F4QzsvsF6KwxrbkeVBzcb2TWYKgijt33fBxHLvmnzjnjianGhGS2JMFeHqj/Y8JwBTLHQAYZzu5KaScg=
Received: from CH0PR03CA0206.namprd03.prod.outlook.com (2603:10b6:610:e4::31)
 by CH2PR10MB4230.namprd10.prod.outlook.com (2603:10b6:610:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Mon, 28 Sep
 2026 02:58:44 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::4f) by CH0PR03CA0206.outlook.office365.com
 (2603:10b6:610:e4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 02:58:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:43 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:16 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:16 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqB2256662;
	Sun, 27 Sep 2026 21:58:12 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 04/19] dmaengine: ti: k3-udma: move static inline helper functions to header file
Date: Mon, 28 Sep 2026 08:26:10 +0530
Message-ID: <20260928025749.1055383-5-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|CH2PR10MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 478422c5-b489-47ac-2e75-08df1d0c681f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|23010399003|36860700016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iej6hfG1bG2GLFotbdaRVcf8DMajUBV6lq6DzjvWvQOYF1Zswi07IvMJF5Cl0tdPDQtjVdPGyTF8VIQtZe4hEc1RCKNqfSIUaeOz6T/9Pu2mUDtvhcWgJQ7znzKFrQuL8hKQs69ymmbUWt5kgMRzdc6Yx1hHIjOE2Y0xzV+KuytdBfdQEbJFDVqDvZogKwbc0r5HVLk3qxZU/NCklBLTkL9Y8Td4YdyxNsF73S0UeraF6pSOqg4khIqLEvRn507XMz/X/8E5AL9HuRoSKHx35pgkhIVuthat8dp5KreKCsDrFq86giJ7rQ83VJLA5qYtOIMfg/bWj5FPeiw1Q028t9CYyxo0GBYtTAC3n00wdcoR0Zu9WwwNN50KAqJ6+9ePxW/wzFo1ecG5pvgkQ8rWc6BlB6ugtykTY5D8RPha3twF1uPvIAuE3tGNtalmYv0Y+PPkgTm5yBxgoNqug/ZKN1LN/mQ6txH1YtgiyreNGXdMATXZQotrExahPQut9eq7tqkIAFKQhKiygM31zoQ0HoWsNNE7douLF7GC9/uNH6DHBfOR18WJbZR055HUlSXfQN28dEpLltEa46uhCNpwL8jWQaDC9mFY6kiJYgVrP1c2G8E6yaMAG7bXAnip5edmFq8o7/ku3LpKvzEBJVd7Picu0jJctfhJHk56E0Nlaea+0fPKfmKN/GThouZrGq1eQw+5e73bnjJxfBuD1zzfsaCtBotb8J4Kxc0zSWMuQK3Xwugbje9gIblabpnyYDoE
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(23010399003)(36860700016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RU1GiAKsIVSKHlGDZRnyurpZZHwnr8vb9nAgpzVtLNRI7qxLivALNc4UAaXpg6KkYFdzgwTBz0hmilFiGnBGXUfxAE4HpY88lagbZaRYVApQ+JBu9DXoj8wbaEpdBxllbePgNUWXOOu3RUNQpQ3pMYA28NbtdVJ19outt8pY1Lbib05SJo/8B5ivGWmXRp8hxP8BbW2bNwxEKaBvhZKxj/SHGKS02+MWlY+5e1YM+Mlw1k16d460A9MoNYbYd3CHlmtIFLxzTZU/nkpKzh765TrECar9T4S5nersTlKug1g8DO3pfsS8P5HVIDyk9ekGbv/3oM+pf2lXqPGnSFHAX9FnIOs4Tz0mnVPS1FYdVwGyZojftxNhAFZi+6fMIUsAjliV3gcXCCO0+NpIjKDh+4mDlpKcU07j8DOoLuiq4SHuATCKjxH44DWuBk0g5LMl
X-Exchange-RoutingPolicyChecked:
	GgDUsI2ATHXkAv8Q9zAIAGUoXpjwVD/Zc1PEG48SdMI6BYUfKnxzeOlmUgtqSijo83yltE0h8ylTjvwcxK4iZBrhOfNAndNopeR9zDTlQWBQHqUsRCQbIDCawCXtF1GKtmYNIvc//su8E7ggC3HuLG2MMEeFVoigPVmidNgu4gBXLYu+ipsY9UrgEX/n2KAPdjJcx2arPRK8m6Ew0DwEExXC1meg+Jf2NBzk9i7iJ9OcnjAbtyJKqcpL1gxtp+KzGFNgsb5umqXXpjqipGY9yXZzOgVjW/wpH18Av3Noh3gYWOqjpThM7XkXjzpzN8VOZPRDYh5zCUO6fD5QuJTFzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:43.2627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478422c5-b489-47ac-2e75-08df1d0c681f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4230
X-Proofpoint-GUID: VnOoTO83XJT08V7jHPFUgSUQo9l87lH5
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9d7e7 cx=c_pps
 a=OAmo50eV21M7Ophgg7+Z+Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=grpEhN_aSmkWsCgVS3MA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: VnOoTO83XJT08V7jHPFUgSUQo9l87lH5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX4KNsJ0ZPNG3h
 RrGUQqMKhu3H/Z/MGAIfw+yWJaiU/TB7pDQcZ0QtrCZkp941yGi6VGH05fYt/gu8ZpqMfVbeJkz
 lM6sNwbOosbSYRZueArsJVw6mAjH7pM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfXzf0CjbJ9r1wC
 y58WmZA3ZkzHVcEmRlsMHUnBG6WuBpVaQRUJY1x1uu8dpIX/gM5OBvQ0ScD44dTbk7Hwbk00QdU
 /0KdaYzzP7WpbGvOHewoEmSHka5Cx8qnWlEFsNJXQM+OPhvQFRRJxLuuWq5/RYvXtZ3wnLF2jOE
 Me+1Ez39gJ8KnMeMDeMqaT0N/NnKyItLEZAOt1qtvMQBP4vmMUVFYBimzOEJj91RiYHoS6I5x1J
 g8ow3D4OWEcsA/BDm2FrdO0QF8/Dm7jDs9TbUr8EgfJFoNH8mRGLghdfLY9jkwzyFSZc9YtVUjY
 X69G39QczBWJ9CncsSrUYINuKLyXWj8ryFQBcpRIVRqoWJ861wezXED8TYnyWjldk+a8h/l/NKo
 xKww+cPplD1W8O41FlyKTNNJLi3Yy1E/uL7C2vJss/KsWwvWk6TcZ5HCVP9LKZhooFHnqrNB8Cu
 DpaafUZmcoc0oVFcdfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Move static inline helper functions in k3-udma.c to k3-udma.h header
file for better separation and reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 108 --------------------------------------
 drivers/dma/ti/k3-udma.h | 109 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 108 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index d7c153c5321ea..5336ec9fe79ce 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,91 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static inline struct udma_dev *to_udma_dev(struct dma_device *d)
-{
-	return container_of(d, struct udma_dev, ddev);
-}
-
-static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
-{
-	return container_of(c, struct udma_chan, vc.chan);
-}
-
-static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
-{
-	return container_of(t, struct udma_desc, vd.tx);
-}
-
-/* Generic register access functions */
-static inline u32 udma_read(void __iomem *base, int reg)
-{
-	return readl(base + reg);
-}
-
-static inline void udma_write(void __iomem *base, int reg, u32 val)
-{
-	writel(val, base + reg);
-}
-
-static inline void udma_update_bits(void __iomem *base, int reg,
-				    u32 mask, u32 val)
-{
-	u32 tmp, orig;
-
-	orig = readl(base + reg);
-	tmp = orig & ~mask;
-	tmp |= (val & mask);
-
-	if (tmp != orig)
-		writel(tmp, base + reg);
-}
-
-/* TCHANRT */
-static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->tchan)
-		return 0;
-	return udma_read(uc->tchan->reg_rt, reg);
-}
-
-static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_write(uc->tchan->reg_rt, reg, val);
-}
-
-static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
-}
-
-/* RCHANRT */
-static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->rchan)
-		return 0;
-	return udma_read(uc->rchan->reg_rt, reg);
-}
-
-static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_write(uc->rchan->reg_rt, reg, val);
-}
-
-static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
-}
-
 static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
@@ -216,17 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
-						    int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_paddr;
-}
-
-static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_vaddr;
-}
-
 static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 						   dma_addr_t paddr)
 {
@@ -369,11 +273,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
-{
-	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
-}
-
 static int udma_push_to_ring(struct udma_chan *uc, int idx)
 {
 	struct udma_desc *d = uc->desc;
@@ -775,13 +674,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
-{
-	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	memcpy(d->metadata, h_desc->epib, d->metadata_size);
-}
-
 static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
 	u32 peer_bcnt, bcnt;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 11d08adb0d69f..54e1757c3de38 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -451,6 +451,115 @@ struct udma_chan {
 	u32 id;
 };
 
+/* K3 UDMA helper functions */
+static inline struct udma_dev *to_udma_dev(struct dma_device *d)
+{
+	return container_of(d, struct udma_dev, ddev);
+}
+
+static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
+{
+	return container_of(c, struct udma_chan, vc.chan);
+}
+
+static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
+{
+	return container_of(t, struct udma_desc, vd.tx);
+}
+
+/* Generic register access functions */
+static inline u32 udma_read(void __iomem *base, int reg)
+{
+	return readl(base + reg);
+}
+
+static inline void udma_write(void __iomem *base, int reg, u32 val)
+{
+	writel(val, base + reg);
+}
+
+static inline void udma_update_bits(void __iomem *base, int reg,
+				    u32 mask, u32 val)
+{
+	u32 tmp, orig;
+
+	orig = readl(base + reg);
+	tmp = orig & ~mask;
+	tmp |= (val & mask);
+
+	if (tmp != orig)
+		writel(tmp, base + reg);
+}
+
+/* TCHANRT */
+static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->tchan)
+		return 0;
+	return udma_read(uc->tchan->reg_rt, reg);
+}
+
+static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_write(uc->tchan->reg_rt, reg, val);
+}
+
+static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
+}
+
+/* RCHANRT */
+static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->rchan)
+		return 0;
+	return udma_read(uc->rchan->reg_rt, reg);
+}
+
+static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_write(uc->rchan->reg_rt, reg, val);
+}
+
+static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
+}
+
+static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
+						    int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_paddr;
+}
+
+static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_vaddr;
+}
+
+static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
+{
+	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
+}
+
+static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
+{
+	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	memcpy(d->metadata, h_desc->epib, d->metadata_size);
+}
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

