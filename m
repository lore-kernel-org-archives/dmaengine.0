Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646C4B1CF3;
	Thu,  1 Oct 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844163; cv=fail; b=uJhe+/QuBgopMyaN4hcRz5QeNNKm4tfEwGR+dJ9ZH+dvMLimak+k6QdWvri0nysLG/WTgsmpG7+0ofyzc0m/ixzp3ucWnJxfO47Kg8L1xUYNwAzdT/KB3js7ShiYcCcl1IUxRX5vPDCU2ezrye1CNxb7zmR+uYt+7Vg5x2SiA+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844163; c=relaxed/simple;
	bh=U7osgsgZPMFddchnKDZC89eADeAN2UHlLZhn2hoiVQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzuSmXgDj9HYTIfeH2VTR8KEZzl44ZM+JwrgqPQH5Vq8vatRrDSAGvuKw0dkL4s9YJJZ33uvN+k1A/KVt/soelACLwzn2NLKMQLD4Cyhw7S2jJUrj+xtQPYkXIJJ4Hspux0pjj7dqBgajauX90wF4Ub7/vR2cXaK7ILSYaRRrD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hCtXDeXi; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=hOxoDCxT; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hCtXDeXi";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="hOxoDCxT"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69171GQs793670;
	Thu, 1 Oct 2026 03:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1UA2mDYdxk6I1awioHjkdU8HhFoXQZUEyn+pUrf1Z
	ek=; b=hCtXDeXiJPDmjprRqo2CBEgJpE64SwnqvSfrQyARoQZGA2sDhHWw21B9r
	Wm2pkbXBlq7sKdBuPBfzVpJiPR3vvPIDx6EzGT3WEuLx3YWnPCmXKOX3vzn0ocaB
	Vrlr0hxbzhA15sXcfjzUX4vn9cdJcEMa5niyY1YsDWTo/zWaVCRZ2/0BGUvV8Gwh
	Q6oGA06QyYrdUrM3CSUxMddHC+uvqYAGhSNXVTMCDm6R9v3j0rDmfrqX8sskcZPw
	kiNzONkofPslrOQkfVfkz/6e1c0mBdfIIkfnONwroS4xlOEZKcarTgnDdT+AEzqh
	rHaX/cM5v27BeSwXj7+AOqiqyOA2w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djv3cu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJZTmHo9+glMITIhIAUmjWe0Eml6XlIAOz/xq5GtUGU9FYquxj+Lc248JhOU8HWYkKjtfKX60u0hbgEth7zHyQyOnoSKogs3Dzl8ABE4T4PF/EobFOgouYusTpsbhatX/1unNseSk0VNNW2qmvb6Z8w/ft5hbr6S8FbIfkoWetMcoohswdQY6YOYgdndm+pVIsWklbxuav6XsBt9MJgphq+/7dCnAVE1axjYQhHplN7VUTr4T6/2/iFi1FwfHwpqyhQOAjHt1JSLyokedIY2z4H2qe3YDfxddB0ndNKlkVZPf/unEGav2eQnCm9K7Xfya6cV+yQPK4pFpfS6oo02mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UA2mDYdxk6I1awioHjkdU8HhFoXQZUEyn+pUrf1Zek=;
 b=OX7HJDZthX0LnAHqzoxDkRBt2G26ycxW7tqP0ImhKOmwiB1MoLsfWtApGGefDKc4pNDtijQUNTkVCYr+BjxkHaU5ZXzx+TusAgzix90CIqfkOXHopp1c+TVUXapb9RExuuo5rXxwsPXRpeV5Vhrnc69NlN/UJ74sat/IxF8d5NAuzoG9lDxB8BQ3yFp62jZTSQU1xasg1jLdhHyaJn4HGEoDB6v5JhP7zlvPXaOB9CV5eqiWfVfWcNY3TqAZ2uRE6067JBBPgSDy6ZVOaiSKONPWykcCZPErr0CGv+Dcen4tDc3h/CNOWjBkF1oR3cIUXqH/v92QKEkdBDlNCvjQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UA2mDYdxk6I1awioHjkdU8HhFoXQZUEyn+pUrf1Zek=;
 b=hOxoDCxTnjxiwxUOVZA7L+96gRnpru/l2In6pvGomVJICYnoYb72se60SC8WApx11rYPEc/saRBrKNUy5HdRi+9xtQFIrGLnIURKbSRSygcC6NMPba1gEqxSgl9tfxu6qXlr1VuLyUO944SoQP0g+9NH3boTOtemgm96kcXt/g8=
Received: from BL1PR13CA0074.namprd13.prod.outlook.com (2603:10b6:208:2b8::19)
 by MN7PR10MB275711.namprd10.prod.outlook.com (2603:10b6:208:634::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 08:42:25 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:2b8:cafe::17) by BL1PR13CA0074.outlook.office365.com
 (2603:10b6:208:2b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:42:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 08:42:25 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:10 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:09 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s3630551;
	Thu, 1 Oct 2026 03:42:05 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 12/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Thu, 1 Oct 2026 14:10:28 +0530
Message-ID: <20261001084105.1692228-13-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|MN7PR10MB275711:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e858fa7-81c4-4b57-cc6f-08df1f97eb01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|10067099003|56012099006|921020|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lB8ZeKmyXcFdUoyAJ4WOfk7NyGz8RYZ7E0uczH5E3N7utwyaIZUNQC2HqhyH6tioOxJTF1IrhL6gPjNOmnd4MisN9zWTzo+fUXx9usPxRLKfafHPeaflsuPdz42Xu6NCXNSXnfdQ8+kjKg1Q/UMseBXwXayudF7+8GezEPnlU8VPupOgP3gVtTACXLgbQuPQWslSfArzxXj9UWINKYjmpvV+FjQt7WTiYyigG8Hpb5gUMTLmbXngA8gxe0tuqIyWKoagR2Mn/VHZTErptXM8otYCoUDgHDPNvMIemXZ+PkBofHYNM+cCWrP744vNUem5AKUpmZrUlxbff1os1fVFWpg7WZXuYDBxXeqJwk7LiEihJo90VL7Tbrif6oSRbwvmu++L6I/Hyn7DPqLDOik1pt77Ug/MnwEBkWXQ1rdVF7k9ih+4cn1ZvXX9vy9fslJ61GXJ7+J08l/DXQ9lieNZcJE+Cvj/JHxFspfx2IZt8Vt8pQXTLuJWT7XrPlLj23K9hybw1QKKlgUg4H0Bt1nf+bgQYotFjhK4r/WV/nG3W0BK18ztCAX8Q63v67jQOGvQtAPXOnYOL8Uno7IbgP9nGfwPC8Sd3hAXrpferghRE7/dvsMLJB3oLu7VK0BEcRmMnlBLULBZU+p0/LsHy73MbBSlgDeO8EQ127MEu89uq+/3YYL0let7e0QK2jdJpgDrxYeq+xKyHI+7peY6VlKwGMZBSai1fuc3H28vpqvY8GPTn3r/d3wWgCM2hU1DAL4e
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(921020)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hq9et66l4McpNWovSHqamNtunKMhzTr7ExdZkV3WitijOKgisdO2O6/ypvlFiEkLq16NqFIWhedxqTbwVi4Pl7F8Ud9lnNM1t9MwN7Q42d7PPCPZ3nc63zP1abWcunN0U3Zim5HBacmwLdNmo2SroRRUnLmiqVYd7Mjw8jwg2ADcNbsHW/71BjSifHkieoxhjp36Wpdls3+3FUGdJXQPfv/YegvIqHSCqfILuIauFJxbe8mz5yuh9aQ0GrGNkXgLeuEtywLE0B2PxJvKsTPoyFuRblbq4fYsT1OpC1cbCueYyJY9wSOYBwPJK83+Wx06Qn/3zuHYLNJAedNbSWtF5bdXFLV5BWZ/Gd2WGZQqvPFzeuDsblQveQaviiHm/Xuyllj9G6vo+wBzvPEqGCppXnWqYdR7JY2j92mZ2Z4HWJ9H1cjfLI1u56WBNhdR2W1Y
X-Exchange-RoutingPolicyChecked:
	brdNtaa5Tf1/Z72+RdUYPzu5RB8wqYrt+ra/ENhUT1LI0EUzBwm7djfVRViB+uOOoTkeDMbys/u8XItvYsj5500oCBCYtomUW2ChQQtNT+oxIhppNwSjPrk9SN5fg+XKstuHRmQIwAPprIQ0R+GU7L1eCVhvD5onERm6AtR80w82bFqDWedrYsiUI7wsRV+azxTMk6rowkRfiplzHYdHuXBtjB8H5oE5B7F0Rn6KIlOZzaOp6I6Ec4FMxqi+sNiq7p9NxLkL4tI0jT0hdowOajIy8d1/ISzeohz61/jjL+cXGn295FDoiizgF7OLQy2xm0kbgXacpk+AKvnDbOgEKw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:25.2006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e858fa7-81c4-4b57-cc6f-08df1f97eb01
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB275711
X-Proofpoint-GUID: 6B61zAeYyOsiPmASuVTCYJZx8oc4wrfI
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abe1cf4 cx=c_pps
 a=X74xAhwpQ9G8Yf2i8TuT2g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=JJJAxwKGgbaLG8uOhDEA:9
X-Proofpoint-ORIG-GUID: 6B61zAeYyOsiPmASuVTCYJZx8oc4wrfI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX0/2nfDjI+EvU
 JeBrlHUwIthZQzuj2pneFP4qRN9N+rZ33q6czo09urCCoSz/RnnRZ1dWhmZ1GO0ZzLyJEI1uE8c
 1v096HEsqO7qYXbfeHmI8QuFU0QaYE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXwfBjxGdcqncu
 dkfmKM252+/RHQl3mtE/9YzXzL1cDLrY+w0GoQPfLziWu6U2eutNtQunMe5CCT6/WGT1Ba9WX0r
 PN0FBXZkUtoH+zz7fI3dkxQyGZ+mwcBAqloaAGn3xI9hI1dWjQ53pnlLyXmPH90KAM41WL4AaUU
 N9WZ3DY8UCxcafjZbciCwjUC5WJbj6lD99joBbI3SC/aczsET/7NdRLhvWZgSiDC9BIuMvV6ggD
 uBTvWGfCS/RABemnYlLpDwJVtL4ERFDJo1c7GrxEzgLojSLpLYq66FEjhBKt0BhHmECKbehm6j9
 GIpT9CcB50dVw6lQLDgiO1RFyQ/TkXDXYgHPRpq8ib/crEFedZwnbRVxzmylbrOHODJ9MyV+f+y
 nKU/r9qJVEDHKwx1DLEnCfBZWR9B35MNcoN39mD7yA/87WEyZxIfb4UjE5uUs4jFpYciu6zKKwq
 3xk5yc8HrPPbcSOk88g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 199 +++++++++++++++++++++++++++---
 include/linux/soc/ti/k3-ringacc.h |  18 +++
 2 files changed, 198 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 5966db4327b13..d52e0ab33678c 100644
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
@@ -467,15 +519,39 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
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
+		if (ret) {
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+			return;
+		}
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
@@ -501,6 +577,9 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
+	if (!ringacc->tisci)
+		return;
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
@@ -576,10 +655,40 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
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
+		writel(reg, &ring->cfg->size);
+
+		ret = readl_poll_timeout(&ring->cfg->size, reg,
+					  !(reg & K3_DMARING_CFG_SIZE_MASK),
+					  1, 100);
+		if (ret) {
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+			return;
+		}
+
+		reg = readl(&ring->cfg->size);
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
@@ -670,15 +779,36 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
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
@@ -689,6 +819,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
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
@@ -1347,6 +1495,11 @@ static int k3_ringacc_probe_dt(struct k3_ringacc *ringacc)
 		return PTR_ERR(ringacc->rm_gp_range);
 	}
 
+	if (!IS_ENABLED(CONFIG_TI_SCI_INTA_MSI_DOMAIN)) {
+		dev_err(dev, "TI_SCI_INTA_MSI_DOMAIN is required for a DT-probed ringacc with ti,sci\n");
+		return -ENODEV;
+	}
+
 	return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
 						 ringacc->rm_gp_range);
 }
@@ -1481,9 +1634,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
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
@@ -1499,6 +1655,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
@@ -1512,7 +1672,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
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
2.55.0

