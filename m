Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D636DA1A;
	Mon, 28 Sep 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564354; cv=fail; b=rKeXCsJm12w48OyycV0bypnt1a61SZLFR3rfZZw0owm0Mk5G1ah5dnbNUomHZ99l85vi5blzLxrJUk22yO5xpJuj8U+c5+zDgsisXNifuA/UgPhO9JAlHVSarAG3TSKVHM1Ih82WWriexOyS1oiRsPBnFOpkrwLzu03VGeHjRmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564354; c=relaxed/simple;
	bh=3kueG8Wpje7rJ+Pgv3ADxRyZSbSU8IYt3jDgNMUkNBw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyZYt1bkgqt+zunJUY9an6b6w5gGRGDpcTd4uqbGatTjr2WUZqPqz9uSH+iPH9FnRt5ebrOfAKsYS51mMj1N3OZCkK9vlIOIsOVFyIbfcr5jVVUnhI6Q1ku0jeQE8FAzsWXJFOJGB60ba/qO8JqGatLhgOqSOEYEyK5zNRx1aDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=mrDOPBIt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E4kRtNls; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="mrDOPBIt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E4kRtNls"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RMIQXN2806212;
	Sun, 27 Sep 2026 21:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4HFwqLYoy5w0cVsCk363PdZE219la0RU3eCFrZ602
	dk=; b=mrDOPBItdkbHFyx6WbAuWtY5zefnRFeLsgvUay3xbzxFylK1Ts/DTzJ55
	gtgfThkLiS/YC0HkNnpIewlYwf+pn9h6OSV4rHSfm+5VQTwnRhb441A87PtAjKUh
	5nCa+JEMS5SfJsH8jiGn2Pg3V1SjdCcQIPz2DmFLcODDVeYm+IyDwTgYIDeUhyHT
	hfTKwvW3vRTHQ6MFbD3zWGKxjxUSov9i+04LMABPKv49OauhQ6bZ8w4vS96Y6Nc2
	mY9L5xxwszRTiQCyysMMCNAV7R42DU5YIA6vV1JalA6bcgE4/hpCvErDuu2gNix1
	e0jFRVj5ham1xtOnDtFM2wIqJ/anA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kfqm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2G66s+zaic4GP+jhgYfnkG6a7SNnd2WCgi1hJLhjEmtWkx9ApIRnPBf8tdkQywhkByprH9DyzmyUA80PTKi2OujTdcLeSHt8SWCyP9yuhcdjpk7Ao7z77kRZG5T37f8cZGrN8jUzo721eHSbA72UiTBzms+PaVn7V/rix5hAd732iu7FbP/sXnHEzomZEBkOCGybGNB674zme6HQqp+q9rda86Cngq5kryohOGgYIljKD0NSCbXVlA4sKCBs+2FqHndlRiNtNVVZoUYecnBV0NbB6GJfQHIykUVRsC2PdIYapj2psCMDr+iyvX2OWgwyxJHHcG5s6sG8BtTPXRpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HFwqLYoy5w0cVsCk363PdZE219la0RU3eCFrZ602dk=;
 b=e7LZcl6lyMhF2QDuWH/V+zGkK2y+feRUoCBzdu5A+uF7gv7m0owYabXPPi9B16UkkHFbRi+V9RJrhWoaxnG4HY2Z+1MTmE8JLJQUYsuWYgzZaSvn1JRj9cex9m4azfPl62OrioX4RbEEjFsnnBzBMa5UMNCbfjppkFoXzAX2IAWgXxrtSF1BHEYWIM0FH/TYoYUnd8xqzkTGEC1UdG485lXT7OcvvKMEU7A/3lnXlgq+FD0dol8NfmWWNYTuQfBblkjLDtdp4U6dg2O5u0ABksTZYdS3gKqugn5hf2gnPaQIkfNDHSfPbNFxAfGJmiGYbVdosdtqVnDgwGxyRZM8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HFwqLYoy5w0cVsCk363PdZE219la0RU3eCFrZ602dk=;
 b=E4kRtNlshblTYtukGjoTY0pBfwePoE4gxjg6eYKnrwASCB1OnR7E6VP0roO1PrHXICQRS+GOH+OIsla6XPS0reBaFBj8533/PLR4jkFa/70563L134mxwiRWAfG5cCquRpmqfPwQuLUi3sJGXMzjTzg3pen8hgZ5QH/dhuZn7oA=
Received: from CH0PR03CA0313.namprd03.prod.outlook.com (2603:10b6:610:118::34)
 by SN4PR10MB998044.namprd10.prod.outlook.com (2603:10b6:806:214::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 02:58:57 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::d) by CH0PR03CA0313.outlook.office365.com
 (2603:10b6:610:118::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:58:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:57 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:54 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:54 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqJ2256662;
	Sun, 27 Sep 2026 21:58:50 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 12/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Mon, 28 Sep 2026 08:26:18 +0530
Message-ID: <20260928025749.1055383-13-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SN4PR10MB998044:EE_
X-MS-Office365-Filtering-Correlation-Id: dfad4083-5db7-421c-e595-08df1d0c7098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/tYNWeJUR4dydBeiLEaZl0GgxuD/nZvkbx71yqeY4B7pzuFM87LmB8MsQJnrobXyiMXxvp3aRbJYZEZWuaRniB3GeCh5Vr2RMDa9vdHT/Jr11J6kNrrL9ct4pazkx7cfsvXfJ3QZdhy/3TrksubFKixQPrcvfSYTWus6WHDXqx5evbkaXV99eoI20dY+5b8A18V5mOFaFvS15Bb3elOhE0ka2O2AVD63WGhbPan7Gh4GqZQlvlXKec/7SnitIxHELca2YW862XxAj+fYYLlyCTIcIFSFTfY88ULSF9EBrC+MWUsGoVHejH4uzRPssrsbXwjDODwmipT8ZkvA/WPE1swYOcoI9mf9Kh7gqGvVPJQyX2y+Y9h6AfWT+KdtI+xQ9prT9ACVFJzXneW8mT202SDP4jcKHVjBNFk9W1qmSqQl+v2d8BYDWtAhR4Zg/or4NmDskpVQ8Oa+wiBtohDwsmRkXEpb/6JjU2AscXYXZlvbpFrwjC8XVyYlh13nCt8iqG+8mqiB1jBCCxNPVh+neMYRGr7QmPtrMoypyYE8actfte6UzjETJQN67MkfUfP0vXqQmfEJYwtggeAqKCDt6gcIdt8SprVRSDMZlapfVh4D57zBPrp0bEfmmNA8rnzvvZ96nWJ+K9vctsSVHsO3tcC5nouqGc3Mp4g8nhwFZjd+DvgTgOqAr0z6rGNbrMcZCILqyRKTfeFi/Unz4YLDw4pA1kizbXKCn/E/W6Jd7mBQM37TY+wMyGyk2J/n6vbK
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Er6T6DjZKA//7MmTDmIyfTS3q0IgFjdx18tID0y3WEpGZpwwGvFmeeHuggnw57w0JvBFDrpHBKDkX2hDg90D3To003LSxoj4M3HvAm+V5QwuxHwqk5qNB3LB1SS9g4xg6AdLgh4Jp/Pehd14VqFk1lWo5wrPjeNqMovNPPEWkax1ZmlSB7sm3uKeqAt+TEtov00W+F8kZl5/2Fu5DnB+08jOyFhE5jFUQVpmxwuWLNK23aYOpZndOJelJD1z7RIHpjt2JvjvWv+3rWAPjr4qQzMmfzlHlNVcIteVn0pYdb7iZyWNdlkAwFR0lfSkuTqyIV6T0aDKgdgfwlbE/vfKUECckjrKiYZSvmyn1EBps9Uvq2RQKXoiinTJt6fj8PmfWTY/d2I03nqSrFD6TULzpn8sqQY9tJ5TYa1p3PewqfWNTLjTWaJA/kaBKnHNCjf
X-Exchange-RoutingPolicyChecked:
	ZZuzSm+7ub3pRbO+BsmU9rT5Lqk7y6uI6MnaDq7h1qYPcuQdFwE+qzbasR+tFyZeEUWJszvEo16iupZtRKZGT2yvpFBHyX/840w9pvVkTgf1lu0zyUUoB334tlmYyR9kaF7D8bJRpX9bskgmRTroYDVW4yXqglf+sCFLGOeydvKmX8mwGJNCGA2iHNSd9Qm3FjhFnhA/iNkk8GGT1QO/OEgA2EswCx2CbAIzzQe7ReHNtqH2Ro58uFhbf4vGU3IaTgMHIC7ZAkN0kFU/S58lcChGeXkImPhgusYYeREXiTBRA9vafwFgzGBF/GPuqOZFw1O64PdQyw0oKMBmrOqfqQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:57.4840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfad4083-5db7-421c-e595-08df1d0c7098
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB998044
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9d7f6 cx=c_pps
 a=qx7sgmNqCaiUqJuMW1Xodg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=AlZmxT5CGg0Uo3zr_lEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX2AEDPmfa8eL5
 Q+711JzUcITvJ0xIYaDTUbbMKICsm5K8PG8W9GI4D99J13Nm/sqHC+/ZsW4VdTDAULPk07XS5zB
 Y7pQjTc+odx9aV+lbvJ6Vf7n5UH9G7iJL1nxiuEeBE8igm3XQ0+mRcfoTmQu2dCzHacRMOgsEs0
 e4680HqnnlbmF1gqJadOV0l/Z/gGPKlW02kKaOBzKNY5DiIBdlxswn74H8AsWJ9Hp7cU60+Ob01
 bsOC10RVxlgDbo7u61bCFT2krOC/07uh6O6LXdUdZoM02XeYHdAejddwg8LOeh9WVzbpBb+geJE
 DUG+H9QIF1VF1p+6Nb3AiTpJUk8mzw2TMwpee7ijkbc7jAvLSW2XqUeGOwkP4eQetSVdOk0Qzg5
 5wIeqQpXCqCelJSfvjWvkLUG/tkcgWwyjl90gCXLkHeFsSrtz3wwilxPqCulQJEm6Ew3YnS1VvK
 X/fvf9/WlGbDEuRb8pQ==
X-Proofpoint-ORIG-GUID: zw5yDoyX54r9T9XJ0lkYOnLcGkngSD4u
X-Proofpoint-GUID: zw5yDoyX54r9T9XJ0lkYOnLcGkngSD4u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX15PxNc4a8HVb
 QOWTpnvdrWnUUH9XVD7nEl+BYRad4q9gjSDfokLoHQR4GlqwpHs/xJ/iFehwR/nH9vHrL3qPsiu
 RiQ74Wy7mJnth4S8Wh+b1XrYQGztIqo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 180 ++++++++++++++++++++++++++----
 include/linux/soc/ti/k3-ringacc.h |  18 +++
 2 files changed, 179 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 5966db4327b13..15fab94e8cad0 100644
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
@@ -576,10 +653,28 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->clr);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -670,15 +765,36 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
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
@@ -689,6 +805,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
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
@@ -1481,9 +1615,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
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
@@ -1499,6 +1636,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
@@ -1512,7 +1653,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
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

