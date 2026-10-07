Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13D4908AE;
	Wed,  7 Oct 2026 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369141; cv=fail; b=klYnCTaVGanzZxq4p/USdMzMC1913qSOligWPTStqMIZxaORJeYbic8SZEaqoU/NAk1IKWnFUPRsHtszRA+fqZAGjHIr9ku0KiXalN4eADhVJXyb1S5tegJ0DfpmvYKbug7PacuHFNj9i7W9cp3D11THnUZwO2fag25xPzWKEHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369141; c=relaxed/simple;
	bh=ts7LgTOmO0uOPvcs7R5m5Q5+vnUaJTu2t2M8+tDLtGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lfr0juvlmwj20wzhbnZK10GGviN0cs7ziwLK3wy5iPTKROqRAsQIuHLOCr7Q+nAm7YHUxJK+4BT2bpZGkg6/EHolaR6DYz5xtdJmFMQdKrzJPQqsEWP8bzg+ZfZkYEqq4RjmeQgse/PiGH1FRF/gs9aPWCbEw6/Ta6c6oUY5AL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CP7Ik/VB; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=YLicxQSW; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CP7Ik/VB";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="YLicxQSW"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k0RO753188;
	Wed, 7 Oct 2026 05:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=A6Ey0z/QEa34XYxoFK6rt/G4EVi9/1+NZvd7BlYwy
	y0=; b=CP7Ik/VBNWr1cngfCMEwd0CNPS8j8YUs4j7HM3u1J/9BprFrj2NVrVkiS
	f+mjQb//BxtUfoRfqvpH9izbEnjy/Ggdr3AiA2YMRo6qx3lff6KeuIB3K1HAz7gv
	mU6vRnVopVC4oVE2a9ac6/e/NKXJz9XEvjfs+XS4nZt+EHjz840h+BVC1V8lObkc
	tSUGe+j39wK2LmZ7s702Cc2Ca/7ai/RkW7TytNBswtaM1oRRLjmJayzxC68V5qyd
	j7Tr4qA4N7h860cGtYtsfffU1FK2kEIRj6mO/ViT8sXw6zVTM74ow/RGOHbe1yLe
	pKfoefS5qJtAnSJ+uPlGllUGz4FtQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78pwe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXSG5SpfhFJaNdsbqPHtoTnK7eZWiyPAfDcanqFXfUOKj8o5vZHVJgr5d7+r8fbFvi2Hp0rX1BDVmtxVLROG/W3PgTi9ZVfHFcqizjBp2T1auBM5sLSq7mYkoxg+AVlbhczx1cwhaeDYX5j1YvKLJtW0qu/6tk9AiKhqh+AdEIOtNPvJEcDG/bVxU5UDMf90x7Dhfry6wnMJyTNg6s7JYpsleNc+5e1nDk61d5Mf7cQmZhfbIYwQLOIy3cK6a3l8XklNtdFdhlQ2im+PboPUexhjo/FoEuG5bK/X7vbR4RW4Ew2TueQbORqdalQKj9bPaTRdkG/T6dbk//pL1nr+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6Ey0z/QEa34XYxoFK6rt/G4EVi9/1+NZvd7BlYwyy0=;
 b=qxtq0Q2K87hWuNPRjYsZxEmuDHvRmaBS238pIazguf/TYVaxvtoLwL3gJQZnVDGqqmrNHhQd5vM9Sec1pAYl0jugnUSFAtT0e3opjgRRGu7LFxCckiNbmuQa6yAU3gwesN44csIdHV5Od7PxMYb3Dsk0nZJWJuufma4f8OZjd/dcvz0SxD1LHekgOM2LeJkN0EdErEpku+ZTTzSEtldeUtkZ/ZCGVP+ZPXc1AuX32Z8VVHuPrSBYFhfDfWdt2Z2rocMbUNOwyQgeOaGtJt1qGSKs5L3o/wez/Vpc8aPrIaq65F4ieJFOdHtCUzpjQKiaMB+qzY/41ndy2F/aTm8RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6Ey0z/QEa34XYxoFK6rt/G4EVi9/1+NZvd7BlYwyy0=;
 b=YLicxQSW6NVT1CiYrRNPxbqP4cqeqgI4F6SywqPJZWyuGTgmAX3FHm9yCPnolaer6xVFJymhqD5mRhjf6ue5s+p81xz5T0LEm5WWdWCVV/MUCLEhoYwHNaDubeeoHlhoVCOWMZYQLVBFfyeTxuiLN822x/ZIEpeMCBAjM2nU4mQ=
Received: from SJ2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:a03:505::28)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 10:31:29 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::3a) by SJ2PR07CA0015.outlook.office365.com
 (2603:10b6:a03:505::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:31:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:27 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:13 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:31:12 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiT2013473;
	Wed, 7 Oct 2026 05:31:09 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 18/20] dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
Date: Wed, 7 Oct 2026 15:58:59 +0530
Message-ID: <20261007102936.2402427-19-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a028e51-fdd5-432e-3b27-08df245e2516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|7416014|82310400026|921020|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	QxBIF/65EnD91ZnrWjVjlQFU6Fi8R+FpOP9W70v/XNsWKolO6EA4yfgE4GRlEhA1UXsBc0Rkg9oPuOEQYavgbBDhRD3o09pBiijARf+uKhvQk4HZDpBgNgb3DLJyJbgiPBoSsL5WAcCsSPyRyIJLFrQ1iNKyx0XL+xlKilvyGFwLXOmdwZM+lgrs9TV0rEtB+l6Hbdg4eQgI2+Cq53iotS0RhxqS1MMO2uIOqgARG/voFPxlI9g2Vj2+o8pGJoqwww5d6EataQB8bHtUtZiZtIaMUO0JJX1+pC8TLyIRjnX4rXEHUUv1wmqmPi6TBZZDYfB+3rHy/Z+C4EkxbjilzN785XgkuZUb3/PXwBTS0YlRthfxb6QOzsdWk7+jQHgb+F9BOMV+/qnz8QATTZO2rAjtwVR/w3x+awa4K4A1VS23z5g+fhA0ADKBXtsGsAOOPyluLQZzEMkZyR+gJDs7fTrRzLsXpd+h6xw8Fgxo+1mkMPA43r1hz3U5518bXnu+5Mlh9DLIdZcEBaF68AoO0+vEpkcudA6WSANC9ezaKzKv5SqfFpN8W0C9uVtjACvy0M1nEtlJgu3muFKhYJ9vB8GE7ROv0IW6VDomtsrLJgkogdlgr9qvxh1T2MethwTi/1+YdeIVswjuw/Gib404cn/1mGTP2XkZGL6q7GM1OJ33c+t10INxfHYSmjkZttqYBzbJZX0s6n567DZgirzWBhHN4lPCEDrOku+ES4H2Lb2R4QISJW4aoMo8XHRI9mHX
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(7416014)(82310400026)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zpfo3m3ln4Yk+zZKBd09UmW+A6jNJwuzyCSJu3jsfoQkr45uaiZZoPUprJBtt4t4K9uABfSrNvQLRs6HHHgcgKZKlbTe+MYOM4T4JQNPYaGAoK996kj/UmvE8Bt2STI1WekBr83jBu8d0JCK/WRE9xl7FElFe/PG7y097UwXq4yhTWorXiOv1ZQvX4l6dJUTaqKdmre4E/yefALouMxmQJ2kGy1QvXx+qyROk5V6OIVzEmy43KkPmgkRmd4JIhT1bxrHi3piwPhs1SK74ztrrPV+HrcS+iF3uLrFOyRk3ghC6ugSPIVsomHpLHp9qFzc+Vx2t0kezlmq/UMz7WNcwo6wgxs/deAySu3oixKRVqS4M7r7LXQ2Lq+/yLMs02gESazmycdGFfa8qeec0KSJArKw6fj0yShaG0uhwmUte3sbOXJjOlr22ReAEMklTthY
X-Exchange-RoutingPolicyChecked:
	DfTBeCGNNJQLFE+WfdIxBTdLRCNAfjnEVuTL2KstxYc41JJXPz56m1JkjcyoQH62EWdOgRHd2x6POfuSGi2VYlF9bMFXGBXR/MHxDoXB1SJGnvuzyIEYI7WSoO4DX1cCUeFPKCSNL5fzbi+nkopDzu3GDTqDt2LOvUUdn/rsruIde41OSywg0XffsXF4/wGq6juGogWyEuXs4ALx0kMyyf913yTQ+8IIHOMBdp452XXfMKGytBtTNLHO5v/2//0KMwji231vlFJLo+RlYveNhBnfwhTL5niwcHts09uxJFVf8iltBzQSlthSRE9n2+Pn5CY4kYvSvniDJcOqD4TUUA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:27.6401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a028e51-fdd5-432e-3b27-08df245e2516
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61f87 cx=c_pps
 a=5EMrObNM7I5xfgT5kXX3QA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=yoQLACVbf3K9FHgXu8QA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX138eCYDe+cMR
 yf6t2Xx05axUQhTDKBKKJxx0yXRGPoX4Bxy9nN7aFygOqPhNVtdrfokby41apZjGKbP0wn59BtS
 9IRXIXChY8f+K5qvIMgJXBYyFPhC/hI=
X-Proofpoint-ORIG-GUID: d8697zGL-ck3Zkk90ukrXCzw2ZFWvZr8
X-Proofpoint-GUID: d8697zGL-ck3Zkk90ukrXCzw2ZFWvZr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXyI284z3OGoGj
 W4RrL1las8Qrifz/2gpr1fiUB3FHzgTMo23tEcSN4Mgo4PdqkSCdU4MflyQ8NeHddkmp8FEMdcE
 nHLGfDa/Wo/HSz+tb1RjR2/Sfrjx9syljUYL6njVcliAabYZ2JO/JWV4+h/IVYB2CnjHJTU4Bx7
 CPDBGq+twXhYahexrEz4wVVE4yqozXTXsrxqo6j2XKNVV1r8so9zy6g6cXVz0F/Kg3K3u8Hc4tY
 1gutwJom9GRZ5VGW89Sw0T6GgjNZTusLxQdrXe0bepUHRrdVLi3wW8m9Q/2mYYcUgIY3i1gqzZ9
 2+Sj3kwEvX/NPhSnuxTaIak8PJ7N2ffibu3NFXsX4EH0Fy7juA+FA26oMlYn0O8TPKsfWQKG75P
 /jbDp0aQykyxM3M1HIDtDRfBAouAn5e8sPi/JtkQflciSnskbdl1RfnH7zjse0Q02WVMBgewTWq
 62XPvpeJcTebxiO7SzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver.

The changes in PKTDMA V2 are:
- Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
  needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single
  peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to
  PEER registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c  |  35 +++--
 drivers/dma/ti/k3-udma-glue.c    |  23 +++
 drivers/dma/ti/k3-udma-private.c |  22 ++-
 drivers/dma/ti/k3-udma-v2.c      | 236 +++++++++++++++++++++++++++++--
 drivers/dma/ti/k3-udma.h         |   3 +
 5 files changed, 292 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 3c60fb21bd84d..846c1d72eaba9 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2502,9 +2502,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
 	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
 				  GFP_KERNEL);
-	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
+	if (ud->match_data->version == K3_UDMA_V1) {
+		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+					  GFP_KERNEL);
+	} else {
+		ud->rchan_map = ud->tchan_map;
+		ud->rchans = ud->tchans;
+		ud->chan_map = ud->tchan_map;
+		ud->chans = ud->tchans;
+	}
 	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
 					sizeof(unsigned long),
 					GFP_KERNEL);
@@ -2610,13 +2617,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
 		}
 		break;
 	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
+		if (ud->match_data->version == K3_UDMA_V1) {
+			dev_info(dev,
+				 "Channels: %d (tchan: %u, rchan: %u)\n",
+				 ch_count,
+				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+							       ud->tchan_cnt),
+				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+							       ud->rchan_cnt));
+		} else {
+			dev_info(dev,
+				 "Channels: %d (tchan + rchan: %u)\n",
+				 ch_count,
+				 ud->chan_cnt - bitmap_weight(ud->chan_map,
+							      ud->chan_cnt));
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index f9e2a1e1e0a50..78722a7f8ebd2 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
 		goto out_put_spec;
 
 	thread_id = dma_spec.args[0];
+
+	/*
+	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
+	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
+	 * PSI-L thread ID before the common path checks the direction bit.
+	 */
+	if (common->udmax->match_data->version == K3_UDMA_V2 &&
+	    xudma_is_pktdma(common->udmax)) {
+		struct psil_endpoint_config *ep_cfg;
+		u32 psil_thread_id;
+		bool dev_to_mem;
+
+		ep_cfg = psil_get_ep_config_by_id(thread_id, true,
+						  &psil_thread_id, &dev_to_mem);
+		if (IS_ERR(ep_cfg)) {
+			dev_err(common->dev,
+				"No PSI-L config for flow %u\n", thread_id);
+			ret = PTR_ERR(ep_cfg);
+			goto out_put_spec;
+		}
+		thread_id = psil_thread_id;
+	}
+
 	if (dma_spec.args_count == 2) {
 		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
 			dev_err(common->dev, "Invalid channel atype: %u\n",
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index d2501e074bcfb..3f6235cd4d72a 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -190,16 +190,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
 int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
 
-	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+	}
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+
+	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
 
 int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	}
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
 
-	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	snprintf(irq_name, sizeof(irq_name), "rx-%u", udma_rflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_rflow_get_irq);
diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
index 0bbd7e41a8f9b..feac531a24f47 100644
--- a/drivers/dma/ti/k3-udma-v2.c
+++ b/drivers/dma/ti/k3-udma-v2.c
@@ -610,7 +610,7 @@ static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
 
 	rflow = uc->rflow;
 	if (ud->tflow_cnt)
-		fd_ring_id = ud->tflow_cnt + rflow->id;
+		fd_ring_id = rflow->id;
 	else
 		fd_ring_id = uc->rchan->id;
 	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
@@ -803,6 +803,155 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
 	return ret;
 }
 
+static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+	u32 irq_ring_idx;
+	int ret;
+
+	/*
+	 * Make sure that the completion is in a known state:
+	 * No teardown, the channel is idle
+	 */
+	reinit_completion(&uc->teardown_completed);
+	complete_all(&uc->teardown_completed);
+	uc->state = UDMA_CHAN_IS_IDLE;
+
+	switch (uc->config.dir) {
+	case DMA_MEM_TO_DEV:
+		/* Slave transfer synchronized - mem to dev (TX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_tx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = ud->psil_base + uc->tchan->id;
+		uc->config.dst_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread |= K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		/*
+		 * Use the tx flow ID here, matching how the TX ring itself
+		 * was addressed in udma_v2_alloc_tx_resources() and how the
+		 * glue layer (xudma_pktdma_tflow_get_irq()) looks up this
+		 * same IRQ, instead of mapped_channel_id.
+		 */
+		irq_ring_idx = uc->tchan->tflow_id;
+		break;
+	case DMA_DEV_TO_MEM:
+		/* Slave transfer synchronized - dev to mem (RX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_rx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
+					K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		/* Use the rx flow ID here, see the DMA_MEM_TO_DEV case above */
+		irq_ring_idx = uc->rflow->id;
+		udma_write(uc->rflow->reg_rt, UDMA_RX_FLOWRT_RFA, BIT(28));
+		break;
+	default:
+		/* Can not happen */
+		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
+			__func__, uc->id, uc->config.dir);
+		return -EINVAL;
+	}
+
+	/* check if the channel configuration was successful */
+	if (ret)
+		goto err_res_free;
+
+	if (udma_is_chan_running(uc)) {
+		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
+		ud->reset_chan(uc, false);
+		if (udma_is_chan_running(uc)) {
+			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
+			ret = -EBUSY;
+			goto err_res_free;
+		}
+	}
+
+	uc->dma_dev = dmaengine_get_dma_device(chan);
+	uc->hdesc_pool = dma_pool_create(uc->name, uc->dma_dev,
+					 uc->config.hdesc_size, ud->desc_align,
+					 0);
+	if (!uc->hdesc_pool) {
+		dev_err(ud->ddev.dev,
+			"Descriptor pool allocation failed\n");
+		uc->use_dma_pool = false;
+		ret = -ENOMEM;
+		goto err_res_free;
+	}
+
+	uc->use_dma_pool = true;
+
+	uc->psil_paired = true;
+
+	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
+
+	udma_reset_rings(uc);
+
+	if (uc->config.dir == DMA_MEM_TO_DEV)
+		snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);
+	else
+		snprintf(irq_name, sizeof(irq_name), "rx-%u", irq_ring_idx);
+	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
+	if (uc->irq_num_ring < 0) {
+		ret = uc->irq_num_ring;
+		goto err_res_free;
+	}
+
+	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
+			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
+
+	if (ret) {
+		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
+		goto err_irq_free;
+	}
+
+	uc->irq_num_udma = 0;
+
+	if (uc->tchan)
+		dev_dbg(ud->dev,
+			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->tchan->id, uc->tchan->tflow_id,
+			uc->config.remote_thread_id);
+	else if (uc->rchan)
+		dev_dbg(ud->dev,
+			"chan%d: rchan%d, rflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->rchan->id, uc->rflow->id,
+			uc->config.remote_thread_id);
+	return 0;
+
+err_irq_free:
+	uc->irq_num_ring = 0;
+err_res_free:
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+
+	udma_reset_uchan(uc);
+
+	if (uc->use_dma_pool) {
+		dma_pool_destroy(uc->hdesc_pool);
+		uc->use_dma_pool = false;
+	}
+
+	return ret;
+}
+
 static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
 					 dma_cookie_t cookie,
 					 struct dma_tx_state *txstate)
@@ -1065,11 +1214,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
 	.rchan_cnt = 128,
 };
 
+static struct udma_match_data pktdma_v2_am62l_data = {
+	.type = DMA_TYPE_PKTDMA,
+	.version = K3_UDMA_V2,
+	.psil_base = 0x1000,
+	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
+	.flags = UDMA_FLAGS_J7_CLASS,
+	.statictr_z_mask = GENMASK(23, 0),
+	.burst_size = {
+		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
+		0, /* No H Channels */
+		0, /* No UH Channels */
+	},
+	.tchan_cnt = 97,
+	.rchan_cnt = 97,
+	.chan_cnt = 97,
+	.tflow_cnt = 112,
+	.rflow_cnt = 112,
+};
+
 static const struct of_device_id udma_of_match[] = {
 	{
 		.compatible = "ti,am62l-dmss-bcdma",
 		.data = &bcdma_v2_am62l_data,
 	},
+	{
+		.compatible = "ti,am62l-dmss-pktdma",
+		.data = &pktdma_v2_am62l_data,
+	},
 	{ /* Sentinel */ },
 };
 
@@ -1088,15 +1260,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
 		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
 
-	ud->bchan_cnt = ud->match_data->bchan_cnt;
-	/* There are no tchan and rchan in BCDMA_V2.
+	/* There are no tchan and rchan in BCDMA_V2 and PKTDMA_V2.
 	 * Duplicate chan as tchan and rchan to keep the common code
-	 * in k3-udma-common.c functional for BCDMA_V2.
+	 * in k3-udma-common.c functional.
 	 */
-	ud->chan_cnt = ud->match_data->chan_cnt;
-	ud->tchan_cnt = ud->match_data->chan_cnt;
-	ud->rchan_cnt = ud->match_data->chan_cnt;
-	ud->rflow_cnt = ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ud->bchan_cnt = ud->match_data->bchan_cnt;
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->chan_cnt;
+		ud->rchan_cnt = ud->match_data->chan_cnt;
+		ud->rflow_cnt = ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->tchan_cnt;
+		ud->rchan_cnt = ud->match_data->rchan_cnt;
+		ud->tflow_cnt = ud->match_data->tflow_cnt;
+		ud->rflow_cnt = ud->match_data->rflow_cnt;
+	}
 
 	for (i = 1; i < V2_MMR_LAST; i++) {
 		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
@@ -1150,6 +1330,7 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->reset_chan = udma_v2_reset_chan;
 	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
 	ud->bcdma_setup_sci_resources = NULL;
+	ud->pktdma_setup_sci_resources = NULL;
 
 	ret = udma_v2_get_mmrs(pdev, ud);
 	if (ret)
@@ -1157,7 +1338,24 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	struct k3_ringacc_init_data ring_init_data = {0};
 
-	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		/*
+		 * tflow_cnt == rflow_cnt on this hardware and tx/rx flow IDs
+		 * for a given channel coincide, so a single ring array sized
+		 * to rflow_cnt covers both; any extra flow indices beyond a
+		 * channel's own ID are reserved for that channel and not
+		 * reused elsewhere, so there is no collision.
+		 */
+		ring_init_data.num_rings = ud->rflow_cnt;
+
+		ud->rflow_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(ud->rflow_rt))
+			return PTR_ERR(ud->rflow_rt);
+
+		ring_init_data.base_rt = ud->rflow_rt;
+	}
 
 	ud->ringacc = k3_ringacc_dmarings_init(pdev, &ring_init_data);
 
@@ -1166,8 +1364,10 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	dma_cap_set(DMA_SLAVE, ud->ddev.cap_mask);
 
-	dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
-	ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	if (ud->match_data->type != DMA_TYPE_PKTDMA) {
+		dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
+		ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	}
 
 	ud->ddev.device_config = udma_slave_config;
 	ud->ddev.device_prep_slave_sg = udma_prep_slave_sg;
@@ -1181,8 +1381,18 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->ddev.dbg_summary_show = udma_dbg_summary_show;
 #endif
 
-	ud->ddev.device_alloc_chan_resources =
-		bcdma_v2_alloc_chan_resources;
+	switch (ud->match_data->type) {
+	case DMA_TYPE_BCDMA:
+		ud->ddev.device_alloc_chan_resources =
+			bcdma_v2_alloc_chan_resources;
+		break;
+	case DMA_TYPE_PKTDMA:
+		ud->ddev.device_alloc_chan_resources =
+			pktdma_v2_alloc_chan_resources;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ud->ddev.device_free_chan_resources = udma_free_chan_resources;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 13d47234967a4..cd705fcc94f08 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -28,8 +28,11 @@
 #define UDMA_RX_FLOW_ID_FW_OES_REG	0x80
 #define UDMA_RX_FLOW_ID_FW_STATUS_REG	0x88
 
+#define UDMA_RX_FLOWRT_RFA             0x8
+
 /* BCHANRT/TCHANRT/RCHANRT registers */
 #define UDMA_CHAN_RT_CTL_REG		0x0
+#define UDMA_CHAN_RT_CFG_REG		0x4
 #define UDMA_CHAN_RT_SWTRIG_REG		0x8
 #define UDMA_CHAN_RT_STDATA_REG		0x80
 
-- 
2.55.0

