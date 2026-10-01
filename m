Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700E4A0F13;
	Thu,  1 Oct 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844126; cv=fail; b=kjOnv/ILLI9KwEMakHU577O1QP7WiWsKUbVkK0AEwMkh33ZyhhdLq0MuAv7zZ9j9ynw/7ihvCK0pSvF58irTJxI5uByxtwJzi3DuSXna6pr5MxOrWGTPSY23Fnz7by7GHU/R1bwHsCHbvJxZ8uW04IpMaF/BIKJv/1AepmJ3pXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844126; c=relaxed/simple;
	bh=weY1vzVK1g/XGcCVGBaj1vNUU7kDhwag6VvkSMJcy0o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNamHdYPUyYchyZ+y9eke8921E/wSNeCnVSJeTAxgI7yLVO3Trj68QQmM1Ov6dg3Ie18WCOYtPwPCSYXCVFW1yrbwTHUDtZ9Wylto2vEMA9Epo9C+GOVT/3LWCSYE9ScaWNZ7nxpoZK4WXZpF16kGJcSjbPwJpWN1M0Fym7tjmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aa7pimWX; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=cJCRDFed; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aa7pimWX";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="cJCRDFed"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69171FDO793656;
	Thu, 1 Oct 2026 03:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4
	Kc=; b=aa7pimWXF9S5U0jNtfrFRF8jACvih4AmCT6S2oiFB9lgoUSEsej82IFyM
	t6w/PjMO5eUPFRs2gHeGqJ1AzCH2EnrtnPeH6GobQV4U58grQVZIciRgDvaavdyY
	OmZMIOudiw/8bQdcW5sR10LpKyQZZSAcccTDIBRK/ZxJQcARa+1a4bmV3r6ZkAJf
	6qko5EsSiBTqTwIv6/uQWB2l/Sqtkxt65Cb4/M4mq/cheXwSKgwCpmk7i76a6yYH
	BhWTfNi2OoOu6gStnRDa2Tm7kIJGI1KIx+1H7dwQbVPP3GiMRXqC1eRVOMz3KGuW
	GEjowFeD4vHdiHqgqHCXl3OfpAeVQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djv3aq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:41:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCJI9Ljjmqt3B5tPTJgT0O5J3QG7xrImbugTae74zcVmX3JUy6cdoyBReqIJ941XSEmK1MLlsG5HAgv+PyMQTHRgVkPVaP0UXwzFBrAqg4xF9SSqyLyZplQn9VL5B9LljAML7jFkVImLVG0r8E0wK0pYpbqvykWguldQ5s/kmMTOJT0btPyT2AW+Z29yPnAqHMhrVefWPijVpTDEnaCVB25RpGGo4A/aFl0WuqQbeClkEnSB1rO7aXh9zm4TdUJjHoH//AZR47OtFE28Mx2OcL0raRfdmLh0xIdzzMQlI8siLAtrLrd9rxzQoQMiDxNpBk/4/BW71HKc6VHa4YwLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4Kc=;
 b=I3TyaNX8uTcOV+u9Ptny+vstuqkmdx0cuW5ceidzf7YLWRnWmxlWZVfU2Li90ga1LgolK2CV5ZSF2IzSvC2ncrtINbPalhToKkMBqGs+YC5ZwMkfuSd2K4vPkiYEcIUV2pQGKfJ6DfCm63ho37sLxknAAYKmlWMhrlTrD+1jo+H+ENP0xjkSFBVoX0mWhxziMzA2XcjNUsMciAZ3Yb+DtHXzjfgeDyNCbrNThjV5JZY3+ywWq+ZyyGl3RNpDBFHdqNbNQnyGURYami1HjxZir/bJbKWzTvESyoEefG3WftdWXh2OFa3q6Ug4E74Ul+QX606gF6kvCrvfs4SRPuF1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4Kc=;
 b=cJCRDFedwq1LqAltHPFTUMJtr/FV/Hzwy7kfTmmPiHDY4NwESRC4o45LNCy+NJgVxGJ19nFTPbgAA6ORkjq5+X2QNwLCIlqtWbMxBxKy3gNiolWb2rq9XBSKFGHyPeqK5KAyIEKpesI1DrPXuy59VY/XHO0WHQSLZ5/OCVq6g4Q=
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by SA1PR10MB6591.namprd10.prod.outlook.com (2603:10b6:806:2bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 1 Oct 2026
 08:41:47 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::7e) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:41:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:41:46 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:32 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:32 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rt630551;
	Thu, 1 Oct 2026 03:41:28 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 04/19] dmaengine: ti: k3-udma: move static inline helper functions to header file
Date: Thu, 1 Oct 2026 14:10:20 +0530
Message-ID: <20261001084105.1692228-5-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|SA1PR10MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: e24842f9-73ea-4f4e-bf64-08df1f97d411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|56012099006|6133799003|22082099003|10067099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Gmqkq0A34BzR3koGEu3RqhGx2JIN/6aA+4pS8V8TrOIwRhdNlf1aOWepC4ERosHDDhZAvgw4XaiIuSxcdHVMKMzLYMVSrEXalNykSkc6w/QsoFjC6ZcyIHRb1t+5UYKtxG8HC5zpf1p2lIvykxt5RvLqc3+wfhcKDROHmV8OHXGX39mz6TH7Nb3bpMv0wCDThTl080v/zgMtJc5nqlGxQH4ATlo2POcrsltxYHNtnkiJMEOUSNKGxkmx82xa1CCq6+Pqjn7KKU2HvaNto0EvSAgSIv3yLZGf3t0Tzb2pMEwBa6JWEFQ0yEXSun7JpwF+eUdnT7tmFnyP41TE6/rd876CLhMNaBLODq9LHlOtRJfkGj7gznxZvmB1i6SYtOQgl/dnw0wwP8wbd+k4GW8ZKVKE3ONbnh9UpB7XNc8un1PdGiLLbZYCg/vnBBFA8BwkdN+gD/ziG0B2wbSlk1kYbMBMyYBeGUdwsbjT6ivDuxpMPYlsB1WJmLSeugHQQURnLBYi14KWgKp6wEcqGhY8D8QdVUVqsGFh4FskOceb6Hg+7VafPVeX8ZLhYSiL3AlWF7EzRu8Y9XFjPXmO99fCLkV3rFQRMd8sakdGLjsFu1XD5v4t9EddzrTjON0MuDZxAfcxlEruiMACRnfCpIcCNvXaec0iPZW04z0QrmHlXKI+pvw44ZYWD/eO2yITCk29eniDKui4DUt9JXyAUp5x8mQ0ePa6tVW4IJYfmbAMUnIgB+CPXttzQxPqLJ1LM6U4
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(6133799003)(22082099003)(10067099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nuv0qszUyuLL9ZpdIqI8x9OiBlLavGue4oyMhInX/AGaw8O2I95yecw3HEWFVBE+tdGonXEVD0tAjqH7XfLL3ycqkWarksw2JI5yjMGToOHk2/ZNaTyjXJatJz1y3+JUHiNJA6Mx1uT/Rl6P/j64W2AHfxfh4k2gXl4yOMuo1iVsoZar5brWO+9Wf/OtpOGMtIE1e5DumhjnN6wimiNgJh+We2qFwsWrXiwJWv3YdEnzeGg/UY6uN4lq+w76kR69eNCQ7rb5DBOLD6OFiJo62bC+npRRodZmXGRs/8mdq6mlYKkvNZbq9iWlGbpc/LkVU0CsL4gWkRIImUtiamH+4FtTWj9TsTzOJvX59yWB/8FoXCWAwoLb1NMscUvu0dm2UnK8zbXcccMywA/CbZdt16DDYsyjB/C6a3C/MVouzXpHTsBkPyyqxIRtXhtbhihg
X-Exchange-RoutingPolicyChecked:
	KT8lx5Cq0HqIhpXKnecLdkHIPOwltEiRcXBbKKhYoPnXRb7ok9coFA+WI6v1WaYcuiFHGw//VCEpS2Yxwmvo6l0T1jmhBJjfwO6c2lYjCbgDXC21wbUoPWjohRuGof8TXcB2IRhx1P+/5WHlYDUgvbldANJV3DvSUFH6WDQLjB/HDoeCxH5cjyPiYTDP4ebCiHw8K+8Sy0dZ2yCA9evtTMS6HTJBSlU6QbUUrFYVCLISuRgDcJf0dUc4GmCDxc6UTFYcSYgASZjaVvqnKfoxhdoT7qMdbhL0hYOEUH1LVO6ERZOQn3FUAEFNDzqvQIhMN+1nOEmTW/SOjYISZGNOWQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:41:46.7155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e24842f9-73ea-4f4e-bf64-08df1f97d411
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6591
X-Proofpoint-GUID: W2reJ6CYbftpDALN2XT5gJJkYYTqIHua
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abe1cd1 cx=c_pps
 a=TofqhMGnQVwdh0HkHXulOg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=grpEhN_aSmkWsCgVS3MA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: W2reJ6CYbftpDALN2XT5gJJkYYTqIHua
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX/wn9FFs1n53A
 ddSYLPabGVjHcqeXuaOF3v7euHrZUX84sujSSlC0Tt56Q4TtpeSACJO3lbxOZ3V25p0REu6Qgkr
 4wAbAoZ1B1cjZaFn/xHUS5l5ffYXKbA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXzp7EtaUvmEw9
 muM6vws+4hhBxNpL2+v8E5pnTrMrUIdfbaRmoa7DCSelw7cZ1YQtVtdmi5GIvRQ6RxBG5vjjgGn
 gyi6BrmK+RMRZF/WIKAjRhWKhY1ifl0G3OTDgi2qzO8orUSt6ICSAhv21wZ0BrVggKYCJt2vX0m
 uO1D5rtu7EiFZZyndXvIW7ZAkhHslFLnP6Ljb3mwrxlEsli6oHSNu527QQgBqzQnq9/b6v6Gf2r
 U/L4FXMyt2uDvjFF8sbpeqtqoOoWlwa68kF0sO0/VAiQzYk2fDGhMFJAfpjyW0s1hb2So8VGo95
 oX2jm/2kcbQY9TJLelpI/rYKxuHPVSWvdrIiHhzvvpYtsJhSOmUCA/T0fz86+zSyRdtXeChpEnM
 MdEo4JL7ufefPtYa/5l7XH3tzunRjCpVXnacM/qk/BaayEQO6p+u9RaJI1LOZyYWVL0u78Zfi4I
 xF0I3BbVVlUtjsO2lWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

Move static inline helper functions in k3-udma.c to k3-udma.h header
file for better separation and reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 108 --------------------------------------
 drivers/dma/ti/k3-udma.h | 110 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 108 deletions(-)

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
index 11d08adb0d69f..e65dacb68c19f 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -13,6 +13,7 @@
 #include <linux/workqueue.h>
 #include <linux/spinlock.h>
 #include <linux/ktime.h>
+#include <linux/io.h>
 
 #include "../virt-dma.h"
 #include "k3-psil-priv.h"
@@ -451,6 +452,115 @@ struct udma_chan {
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
2.55.0

