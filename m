Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF28435AB2;
	Fri, 24 Jul 2026 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888614; cv=fail; b=mWYX/hpwIIKANwQW01LTY2oh57XNAiaL1x6yTympTFWeYcrZ+L5QYpo/fIHNuz41I6bo12MHlfcbRPtXvA80KZjhHr5j2m6aAAhKXVyEpaFc61GIxzweIQf9eqBT55PWK/TTy5O15ktTh3CopjH23Fw4DRvE0BT9FTHjP5kicF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888614; c=relaxed/simple;
	bh=MSNn7R6C5gCK15HH45MU/Qp0BlT84nl3jZ/dgMO4vEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SziJIAft3NJh1OFBw8tjASq9kqlQNlGpwQi3qJtFEO4kWWhGX43o53uhcOunAVZmctxX1ENrkcJxaFh1E5//BYCcW8PlVtkc12dTYUTRKGl7B5YU4FLMTQiWwMR/wiy8ajAWaJ6/VU2xWdfTg27BPbM90EL6KP0jH6vIaMbPAb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AtipSuT7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G8ag9gKd; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AtipSuT7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G8ag9gKd"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFZ0I1093922;
	Fri, 24 Jul 2026 05:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=C5O5/KQzcRH4emdLqgh+uLZUHRwbAskPo1Mjg/eqe
	5U=; b=AtipSuT7m2OIUq3wKtRHTQgAYUcsmtEtjHHHKWrFu8J+Thy53EauFtgVd
	zRDJd7HyTdi1gFrRQdvmAN0XP++I9Qc605smhZ+ySG35Oi2LcsvoT7KnhexVvY20
	QNzUtY7S6NlI4Hjv7HS6ZR3QgQSoSEQD2JtoISgiGiSrwX+3tmQq7gpHqVEDGSDG
	18SxCA+x/H7vvECOjcJo2lSMo+PTIM08XIAkQOJx5Ap3Nw/1ZothCGg2VVe6/Iwc
	G4uOg/epkydnlKBYdVcIkrmBqn6GdmpckEmvytjn+oNSEhFoVGQsiWmO1W7sTWbM
	jtQt4YqnnMO7IyCRbBOV0as89njBA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012010.outbound.protection.outlook.com [40.107.200.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7j41m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:23:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jT+EE+KjYHPzT9vrcd5MBrgCo/pzVRw2241SlBwTa3+ojpSQcDnlC+YDWt651ZsYA5F1YOE5pkGVCo4Fo0/aOQPJPIz//dMzs1O09UMl5qda1aqcjDUya2To4VF8xCBE9E+OuzanKsVwD3NHslt+3MxRfdDZDchyWw8A6SOchh3/CskHRfXgPuBUykveswzUMoKInCRQ+sdtbHGFZkIBaECF1+fc5UOa8YsH7uFxfhRXLkqQMYJnppTPNP/i0VLJtb2BWAg4uSJfLJMbYzACqV3Ufmw+rGv8G9j/1UEDlvVgdnBsx5CzoEd8dnbzYcJGtJcXexZiAi9Zf+Gn+uZqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5O5/KQzcRH4emdLqgh+uLZUHRwbAskPo1Mjg/eqe5U=;
 b=mGT10mLy0zMKfXtc34NTsaHSlx5PZ9ogDD4txMKAfHvu14aI/GqX+9RjYfXc+JfZGe8EtU4phhxLT7ZX8eoYLxZjiQDm4vD1qETpclezUurZRFgoMNwsp1eAkPSbvAagDrtAY7t5xojPTQQ112UjBJQ3UMwh/IxEly+rzF0ZkPq4ZfIvlGZv3Za4JD7RZjLx7TVkVaI1dsPVAPziZD9ahxCY10PL8ot6g4cH30hSRCH9D1CWLjjuoufIgHga4aKpmFPKDaIDDw83BgtZrkWt7EQTdFMbiYYBqZrvE2+XaB255PT0q47ygif1ElEuEbFIbI5Rb9X7xca5ue7cjjNC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5O5/KQzcRH4emdLqgh+uLZUHRwbAskPo1Mjg/eqe5U=;
 b=G8ag9gKdfVM2sIlXCm6TNY+xKQL1JQm2K4fB2QP/NnsTEJGvlN6kLdqqD1D19ULV2m+nBo+UOfRoKz+32OlNBrfBzsT8ym0LA3OXw2mD0QzZuZ64Kl/gACIlsPDNPRxFG0QDPqn3OKUpFG7mI+B53ajozk9XLgRZGn5sndWyPPY=
Received: from SJ0PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:33f::21)
 by IA0PR10MB6890.namprd10.prod.outlook.com (2603:10b6:208:432::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:23:02 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::90) by SJ0PR05CA0046.outlook.office365.com
 (2603:10b6:a03:33f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 10:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:23:01 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:23:01 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:23:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:23:00 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFX3017088;
	Fri, 24 Jul 2026 05:22:56 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 18/19] dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
Date: Fri, 24 Jul 2026 15:50:51 +0530
Message-ID: <20260724102115.2854-19-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|IA0PR10MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 434e9a78-6f7e-4de5-d41e-08dee96d8a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|13003099007|921020|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0R3qex1fdqYLbrtXwqLRlp+QgHteNyuTNiohBmZVjgL42KZhTRsSFAJxg544qHvnnnZTNFstOIY4BS/pKe/SPkbHIMVdDWsvhHK8s46aexRJWwtqMNEHDM2dPWryPmNur4Q2qKapfU6Eqz8fRMwKNaUeBoikmuMlR0XZC7+1EI3AL90N8WtdTq4z/UQJGGqDRK9F/Ogv02c6gqMl6CuKPacoboJMBTtREftghE90abi8fp15o3L3J7571WbrDLHeHc2/p1TkUKDe2Xu2nPS5wXnazu7eg37tSKnfkHvm8fO4eCFJkdfRCua5S7mvUzJdZhEH9zRNOAoOwx3bossC3b1QJMyo1EpzoeHgV30BouzOmd851GX7NFGZEmKZXS0Vs+piBEoYYi/w1hKc7/glJKdeORChlMtW7KL530814FB8W3qdXKXKOo0KocJWedwbpyo1WK2j6HJWo9/ApOdgyB5F3qQNq549qy0Pq4SYHhrpMjCBqqyEFipbnrSOqnEDql2lnliFuxArFx69kudYqpqaOXqzJmGPD7c7cjOvDBOAeBGw2Lrnn1Zq4OD45LGHrFVdOqO9bvG6hl7s4fTdY0DJ1mwpVDbRn3qKrYZ0Ih0vWkt0LSPaz6IeBhfAS6mjQGX7Sao8HFygorp3+xXW/ddRdtI4RGV6S+uKBm/rD4G4PuFDzEUVcZd6pAcz/ymM795JDvM1jCuoV+tUUlBiQg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(13003099007)(921020)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3WNQSbDcqvztUqEOdqYGErdMO+q7DHR7uBKUKUV52JYq0X+c4Vsfrx6whjnzhf/NknrhL43WoSVAmYJfe9FHhD8/nMKWe08haQyHSjxSbntecOQ5kKhVVD/n7YFCWzd6UYzlDcDlyxypDnVmjXxcjHy7EX9EsS1pyBomRkdwcpAt6lisyIFNZM4ta0F7zZAQuU/abMw9XIQpUWtvu6c/K+B4YMz2/DHp2AVzF8UNEZg2kirPwZBC8x3yJK7ULje2Vs9ggvpdMqsG0foCYZ5FZQR3ZWLFDeB44au1g22IEZlKh4gNGFXFqdM/Tziod0JMaJnY4URWf3SwXOYEQoPkxvf69pML/XSrqjkH5yJav3VgUUn/sDiN2nUhwwV+o4rEg2+mxIasTAXnl7yI0/wXXTbt2KdoAJgrVSmq/f2//82exT3fOUmE6jTlC/6L2cm1
X-Exchange-RoutingPolicyChecked:
	U3r35ZMmz3c2M6qaDOlTnlKNuwLDehK9mk9TS5oXDKKQYtmndSZUdOI4LwoU7jAPDp/VDhtVtU7edJYqF66hbkz+cDc+lrc8pc01VFQe8IBx0yW58Kj3cGDV5x0Ni59PvIj92vocV8G2rDkS5b05gWPuGLrO9qFgYe2UEYKE5OD4Pua+2hv5C1B4r7C+wlCqzbZhcrHfkS5AmkA/hMNAD3aKaAOAX6yk5YJww73uug8Z5h6Me2kNpanu3e/IzeSJthUl7x5a9ggXgOgyTBQ4ylrRzJiSUmlABYLJqkU433eFNXB7X7Yik6naTfAvDQj74O8aO9W6wWUQ+qPEWjBd6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:23:01.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 434e9a78-6f7e-4de5-d41e-08dee96d8a77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6890
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a633d0d cx=c_pps
 a=I0dIGTHPrmtoUi9UVMbYOA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=OJxNCoZY2EU3D4kC5y4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX0Kn8sD1tL6U2
 sS2+0wQh609/BPnT3KUoFhGd/FhGUkDkD6LloEF0W7mzmaEr7EbTe4d2su9Y3Qw/o7X6bKk15kR
 x5+ljTW8zdvoLYe50J8scyf0b5VQ+48=
X-Proofpoint-ORIG-GUID: 0pWL4Yx5jhR5AcS1wvTHDYeNhAWiWMTa
X-Proofpoint-GUID: 0pWL4Yx5jhR5AcS1wvTHDYeNhAWiWMTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfXyZMwT25MXSDB
 7p4YuG46Ge1WjmbQwIfDcfJf4z/FxpMD8C4DOmi/LkTXKHqzVl1cc9+q5t9SMgYKohaaUoqQwcO
 d8jFIW7TS02PLjnTogHL/gxo1mS9g8QFeMmH3Vy7ftjaAMUsVnI0/o3fYKVXMa+j1TgqjsQY8Jr
 GJg2A85PMBOXzcEkVwcaVoCHG8uv1/WAmnibgQFufe8AQJ2mzqf1ooTODGAOy7FnsXS3CtHa/HX
 +pTRTbFzb7NEziAr+PDWVIVww3oWAlL3NByPpA80ZsAxVQLMtkKUzZJYkYGl5HcVrQNcGp8nRwy
 DSPfeZml2qArW4mzN8TOc4kYrLjJppE0Cq4mkNTMeoo0PnLj3IRn2Mkl/L4NBAFiWWf6OnpzUkc
 zIvkKejMV+z77s43J8u+EUqODrWZTKLfrn9I3hlU5pvtC9RDol/18tdoZLeOoFMlerJDffw7cw2
 sVTpEF3310R9agb/Rlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Update glue layer to support PKTDMA V2 for non DMAengine users.

The updates include
- Handling absence of TISCI
- Direct IRQs
- Autopair: Lack of PSIL pair.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Kconfig           |  2 +-
 drivers/dma/ti/k3-udma-glue.c    | 92 ++++++++++++++++++++++----------
 drivers/dma/ti/k3-udma-private.c | 15 ++++++
 drivers/dma/ti/k3-udma.h         | 10 ++++
 4 files changed, 90 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index 40713bd1e8e9b..ada2ea8aca4b0 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -68,7 +68,7 @@ config TI_K3_UDMA_COMMON
 config TI_K3_UDMA_GLUE_LAYER
 	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
 	depends on ARCH_K3 || COMPILE_TEST
-	depends on TI_K3_UDMA
+	depends on TI_K3_UDMA || TI_K3_UDMA_V2
 	help
 	  Say y here to support the K3 NAVSS DMA glue interface
 	  If unsure, say N.
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index bec4deb480e60..07952c4efee2d 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -267,6 +267,9 @@ static int k3_udma_glue_cfg_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 	const struct udma_tisci_rm *tisci_rm = tx_chn->common.tisci_rm;
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg req;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	memset(&req, 0, sizeof(req));
 
 	req.valid_params = TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |
@@ -525,21 +528,26 @@ int k3_udma_glue_enable_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 {
 	int ret;
 
-	ret = xudma_navss_psil_pair(tx_chn->common.udmax,
-				    tx_chn->common.src_thread,
-				    tx_chn->common.dst_thread);
-	if (ret) {
-		dev_err(tx_chn->common.dev, "PSI-L request err %d\n", ret);
-		return ret;
-	}
+	if (tx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		ret = xudma_navss_psil_pair(tx_chn->common.udmax,
+					    tx_chn->common.src_thread,
+					    tx_chn->common.dst_thread);
+		if (ret) {
+			dev_err(tx_chn->common.dev, "PSI-L request err %d\n", ret);
+			return ret;
+		}
 
-	tx_chn->psil_paired = true;
+		tx_chn->psil_paired = true;
 
-	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
-			    UDMA_PEER_RT_EN_ENABLE);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
+				    UDMA_PEER_RT_EN_ENABLE);
 
-	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
-			    UDMA_CHAN_RT_CTL_EN);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_EN);
+	} else {
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_AUTOPAIR | UDMA_CHAN_RT_CTL_EN);
+	}
 
 	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn en");
 	return 0;
@@ -705,7 +713,6 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID;
 
-	req.nav_id = tisci_rm->tisci_dev_id;
 	req.index = rx_chn->udma_rchan_id;
 	req.rx_fetch_size = rx_chn->common.hdesc_size >> 2;
 	/*
@@ -725,11 +732,18 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 	req.rx_chan_type = TI_SCI_RM_UDMAP_CHAN_TYPE_PKT_PBRR;
 	req.rx_atype = rx_chn->common.atype_asel;
 
+	if (!tisci_rm->tisci) {
+		// TODO: look at the chan settings
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CFG_REG,
+				    UDMA_CHAN_CFG_FILT_EINFO | UDMA_CHAN_CFG_FILT_PSWORDS);
+		return 0;
+	}
+
+	req.nav_id = tisci_rm->tisci_dev_id;
 	ret = tisci_rm->tisci_udmap_ops->rx_ch_cfg(tisci_rm->tisci, &req);
 	if (ret)
 		dev_err(rx_chn->common.dev, "rchan%d cfg failed %d\n",
-			rx_chn->udma_rchan_id, ret);
-
+				rx_chn->udma_rchan_id, ret);
 	return ret;
 }
 
@@ -778,8 +792,11 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
 	}
 
 	if (xudma_is_pktdma(rx_chn->common.udmax)) {
-		rx_ringfdq_id = flow->udma_rflow_id +
+		if (tisci_rm->tisci)
+			rx_ringfdq_id = flow->udma_rflow_id +
 				xudma_get_rflow_ring_offset(rx_chn->common.udmax);
+		else
+			rx_ringfdq_id = flow->udma_rflow_id;
 		rx_ring_id = 0;
 	} else {
 		rx_ring_id = flow_cfg->ring_rxq_id;
@@ -826,6 +843,14 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
 		rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 	}
 
+	if (!tisci_rm->tisci) {
+		xudma_rflowrt_write(flow->udma_rflow, UDMA_RX_FLOWRT_RFA,
+				    UDMA_FLOWRT_RFA_RX_EINFO_PRESENT |
+				    UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT);
+		rx_chn->flows_ready++;
+		return 0;
+	}
+
 	memset(&req, 0, sizeof(req));
 
 	req.valid_params =
@@ -1330,6 +1355,9 @@ int k3_udma_glue_rx_flow_enable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	rx_ring_id = k3_ringacc_get_ring_id(flow->ringrx);
 	rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 
@@ -1371,6 +1399,9 @@ int k3_udma_glue_rx_flow_disable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	memset(&req, 0, sizeof(req));
 	req.valid_params =
 			TI_SCI_MSG_VALUE_RM_UDMAP_FLOW_DEST_QNUM_VALID |
@@ -1406,21 +1437,26 @@ int k3_udma_glue_enable_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 	if (rx_chn->flows_ready < rx_chn->flow_num)
 		return -EINVAL;
 
-	ret = xudma_navss_psil_pair(rx_chn->common.udmax,
-				    rx_chn->common.src_thread,
-				    rx_chn->common.dst_thread);
-	if (ret) {
-		dev_err(rx_chn->common.dev, "PSI-L request err %d\n", ret);
-		return ret;
-	}
+	if (rx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		ret = xudma_navss_psil_pair(rx_chn->common.udmax,
+					    rx_chn->common.src_thread,
+					    rx_chn->common.dst_thread);
+		if (ret) {
+			dev_err(rx_chn->common.dev, "PSI-L request err %d\n", ret);
+			return ret;
+		}
 
-	rx_chn->psil_paired = true;
+		rx_chn->psil_paired = true;
 
-	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
-			    UDMA_CHAN_RT_CTL_EN);
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_EN);
 
-	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
-			    UDMA_PEER_RT_EN_ENABLE);
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
+				    UDMA_PEER_RT_EN_ENABLE);
+	} else {
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_AUTOPAIR |  UDMA_CHAN_RT_CTL_EN);
+	}
 
 	k3_udma_glue_dump_rx_rt_chn(rx_chn, "rxrt en");
 	return 0;
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 41299d3c3d91a..1eac4dcd5d880 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -3,6 +3,10 @@
  *  Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 
@@ -165,6 +169,7 @@ void xudma_##res##rt_write(struct udma_##res *p, int reg, u32 val)	\
 EXPORT_SYMBOL(xudma_##res##rt_write)
 XUDMA_RT_IO_FUNCTIONS(tchan);
 XUDMA_RT_IO_FUNCTIONS(rchan);
+XUDMA_RT_IO_FUNCTIONS(rflow);
 
 int xudma_is_pktdma(struct udma_dev *ud)
 {
@@ -174,6 +179,11 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
 int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
 {
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+	}
 	struct platform_device *pdev = to_platform_device(ud->dev);
 	char irq_name[10];
 
@@ -184,6 +194,11 @@ EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
 
 int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
 {
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	}
 	struct platform_device *pdev = to_platform_device(ud->dev);
 	char irq_name[10];
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index fc8f0cfe7a36e..a2952183cd8e7 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -85,6 +85,14 @@
 #define UDMA_CHAN_RT_CTL_PAIR_COMPLETE BIT(16)
 #define UDMA_CHAN_RT_CTL_ERROR		BIT(0)
 
+/* UDMA_CHAN_CFG_REG */
+#define UDMA_CHAN_CFG_FILT_EINFO	BIT(30)
+#define UDMA_CHAN_CFG_FILT_PSWORDS	BIT(29)
+
+/* UDMA_RX_FLOWRT_RFA */
+#define UDMA_FLOWRT_RFA_RX_EINFO_PRESENT	BIT(30)
+#define UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT	BIT(29)
+
 /* UDMA_CHAN_RT_PDMA_STATE_REG */
 #define UDMA_CHAN_RT_PDMA_STATE_IN_EVT		BIT(31)
 #define UDMA_CHAN_RT_PDMA_STATE_TDOWN		BIT(30)
@@ -749,6 +757,8 @@ u32 xudma_rchanrt_read(struct udma_rchan *rchan, int reg);
 void xudma_rchanrt_write(struct udma_rchan *rchan, int reg, u32 val);
 bool xudma_rflow_is_gp(struct udma_dev *ud, int id);
 int xudma_get_rflow_ring_offset(struct udma_dev *ud);
+u32 xudma_rflowrt_read(struct udma_rflow *rflow, int reg);
+void xudma_rflowrt_write(struct udma_rflow *rflow, int reg, u32 val);
 
 int xudma_is_pktdma(struct udma_dev *ud);
 
-- 
2.54.0

