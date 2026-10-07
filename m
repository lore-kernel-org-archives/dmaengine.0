Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0744734EC;
	Wed,  7 Oct 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369082; cv=fail; b=SzOfzxlw6N03oew2BEb4kmQ0HW93KDRS3vM7xgElBdGXZRcEn25oEEUhcJcz+mXxfhK1kDiDfKqmnZNwI+cHgU2KtHU3WNmpEVuJQomxmteoASwku/7Tjg9+jA1LrpqGh+6LD/cBS9yxP3HWRR5hqxAdepJ2a+iwgB6OKz6cYL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369082; c=relaxed/simple;
	bh=RGfgafAEKaX7sR24pVsQf3EVDm9a6nUTJDFybqRp9ww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L35F4gCnRBWC9CjMEBoQP8st+3WpTntSCpDuHAtpGOR3pueu9OiNagYK1l6yvhjWkcEMVY3DxDf8419oYdh8SwNWgKBO42fJTrTDtNVradldfKku3PE5tjWqBWP80ZkJv6RFAOUvtRmk6QndtpxCIB9/Wg3fkxQL22aLzUeq6Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oRceJXHz; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Ss4xrd19; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oRceJXHz";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Ss4xrd19"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977lUOA227324;
	Wed, 7 Oct 2026 05:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wxcnkCAA5JdBmWGUXrJxrBHO7ikYKBN9V/Wblo12a
	P4=; b=oRceJXHzs5sesWQV43aUflcAznNAKK1ZpqTWeXc4pVTprUnLeJg8+5ZBk
	VtNqP9ztvVD0Ga8FixVLP3US131MiXmoEDuKfXuWyZ9c2yLWHDcRCxo2XRgTdCC8
	n+alxf99/6XnWRj1j88Zgmtw8nGDIaCaPop/FaP+Ea+DxQTOOvMJolLbxsPpVsul
	j8TMBXgK5yrCvoEjc51dR7OVMJ4GsPNzHmWiPuJ62j2QJDFkMuYJSVSJklLcd8Da
	KNFRFtdmaBfb6KRwFmT2H0rjebFjgTYk83h+x9IgdKRdBRzBwbV4irbWw2Plz/tW
	rTyfUeQEUHRr2fng54H+H9eZpDSng==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5na2ex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oreiHNFAIJWyFKBclGuGEroqwHuNo3El+evQRkxItTHpwK/3H4k0GbxzwsC1q9SYeMpfVi/56OeedyrjyXdUJsL3qqOs5jEubBfI5/pswPuFKKY39vTPkcvXhbTYWrB6QijUe3LPCUxc1YeY2k1jLxnUENfsC4t3e5XRLqRinMfsTDe1S4rcX0g6GnA1A7f/0frpDnES5UGfz5wABlUWcetueZO04tJwWRB7t+SK6cGSQ6LSAFxBAWVCWG3pjLM1TM4vQVw5wdeUEnFXBuSQ90F8Xgd0X0BAZKZEllSezBpGtyGwNeAIYFuLepjvAEALSq6aeNSCe1JNlhtoHJDakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxcnkCAA5JdBmWGUXrJxrBHO7ikYKBN9V/Wblo12aP4=;
 b=yMiJPRESFrxwejYXzCm4W1vrVVysG/z5qsiINcRPuK6ZesrESaPONsLSD4Urb/edMol+rVu9cDN4vNiDD1yNiBQ911QSgXdX17PYi+ahxxm2PdfH/nLPCWBTtr01eP2ocWasv+L55cqqvTD3mKW3SYEje2UCQdkxOAy4ySBWCvY7oFiMSxhdJKOOXSEdbP9patp3SUHJ717frpJGsNBvESC+0vtsrhEBRKaDfFeb3iUyEo008VBVYhSw9yWt7s8ld+3V1i6UFUNETlk489jS4snJWf8p/8UPlcJZKOpfLwkbCfRF53Qk2CiN003LjuF8zA51z1EKfei4Yz8zh1V5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxcnkCAA5JdBmWGUXrJxrBHO7ikYKBN9V/Wblo12aP4=;
 b=Ss4xrd19574cduEYcYpjYPK4S7nENBqgc2xhY5uurTp/we+IOsBlv3lqvVPlFIJ42mG4tK7/LHbfe9mZwIo03mU3SvQIwYHXyzda5D9+3byx1UkwudtHxJgOaA/cvqQfQnIqefRYc6AuYNBSFOEOPFfB+CUwUDbLxo6iBxrUk/E=
Received: from CYZPR05CA0006.namprd05.prod.outlook.com (2603:10b6:930:89::10)
 by DS0PR10MB7320.namprd10.prod.outlook.com (2603:10b6:8:fe::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14; Wed, 7 Oct 2026 10:30:23 +0000
Received: from CY7PEPF000000EB.namprd04.prod.outlook.com
 (2603:10b6:930:89:cafe::51) by CYZPR05CA0006.outlook.office365.com
 (2603:10b6:930:89::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:30:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY7PEPF000000EB.mail.protection.outlook.com (10.167.247.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:21 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:29:59 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:29:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:29:58 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSk013473;
	Wed, 7 Oct 2026 05:29:54 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 02/20] dmaengine: ti: k3-udma: move macros to header file
Date: Wed, 7 Oct 2026 15:58:43 +0530
Message-ID: <20261007102936.2402427-3-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EB:EE_|DS0PR10MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f434c6e-da3e-4264-cdc7-08df245dfde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|10067099003|56012099006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L8B4bygSxnLvkvmgVgqM7I04y6IUzBjcRgvzMmBkREfx2Omtek/yY5hISIvF5s+VOyqEqLQ4/iGZDMLEpytW61LkpfU3J0Fm7mVuIblLsiO4q0atkHZgzJ5pRk6o4OpYqCjsRgiAIdh4elWn2Yrlg3qlipcW1kX0h+A/FJrLI6KDwbnMfXPodHMrNYgGttsAZjrONtJ4aXOrasGQ9r2jXX00gur5nQnRBdK3jweBeu3Wagc7IJZ6oXz0vQmSa667ogyD7P8A39QYLccyE/XwGpgcufLLB19DuY4LKmso15kumfoMf/rYgOCrlfaC6oByIDjqZwb9ByvXssOqERVNsAvZxMSDT2nzlPSpnmqu2RrLFLSAaJkdx9XjMA7WFXd8CX4iN9i4LmNLo0/4zJgicB9Ta0ic1oGFkt/NDNkSUCV9jTsK4LSv66JT3/dqdgaxVNV+ajz3vyhU8xYhYCa0C5jhmzK+9IUkpWaVNoPihj0k1LxlxIpfQ5t316v1TzruMKk2FFrGIVcvxbAow2YLY80y3uMXoOS5hmHgHyjolS6Je0FLJP/yM4+Vh2JLgMSFF0ecJLzt+F4ec9wX0VLaD8I3O5+aoVNdZ7gh/T5M9fInh6IA2oEqkPbHD5nZaXxU8u02L13cVlYzVUmWJQ0wOBIM15xI570nKI3vgdpdqYvT5HjVLHbJNRqRywT1xrdQpMgwUKvYYwCqZA5YGHEiXue1TH1qqBv+eZA8Je+3Swb1v58h1Sk3NZrmMwHn1dXb
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(10067099003)(56012099006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tA5ojb6vYRs6XUh5WLVjPmierKHIaGkdsqb5rSZSZ4IE7Twf8ECHSjBz2KMJa/ubwk4YI+gKvuKcOGj2kEYm8pWI7uiWqfeqvu9ofNyOMcCRxoI8fIcvk3SHXbxJ4vnISxTxtL/Y++FS7QK67N+pBcrSpwLVW4I8BG7HPDVpVECU4rJl8vQ3vz/6mt6qyqlfa3OHAgrjzTedFPhgE00DWhzTmB/jKgRyaY579zS1pKW2ogQyT2PFXQ5nuPYJZLS1hw8VPWbgKsBgFKl9jVzm47WLZgRa5IMgRtwRwvhpTso0q0pkDKwGNCB/HaIxpGnYOghGsRLX/YvXzZfRT3dli05NF7lO6USjXA+E6Hb4Wiv6jBr+4ZVBSfQRIGAvbdDY9Nrum2LRl9DFTb5qMGEZwAnD+QP2ErWEfXilQVlpk+BkletQ4hUDZbe/mgZe9bWt
X-Exchange-RoutingPolicyChecked:
	IEeSXMqZrbP8x7u5u6ME2wtxuYEGefsEJN/QxJEE5xtJwt7tIqg13zfL0gIXDccozUtZ0/Q00NHgOcTApKSpY1cpeh+23r6TZQXyLj6AWG7xDyHPHvLmCGxy2smxhL0Bv74lPhh59wJusZIEbn8DE0W4qHMxwXrqz4WlA+2yjZ4rgzNo/25BdvsSrycAPmGL4Rgtq4S3pWVVfA11P4bJBREg5jGoSrxKOTvYNLcd7J4kSAY7fSVbDczAVC+p62Xs+YGWgIdf/OI+ySiqCoOtnHCpjXNLsn1kKTjVJEXe3P8Xzcvap3ChxP4QkmUxS5aDu9WFHekdEAC1BxPjHhZxxQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:21.9309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f434c6e-da3e-4264-cdc7-08df245dfde5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000EB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7320
X-Proofpoint-ORIG-GUID: 3_YF2GgDreQW3Q6RAfw_NWOgjsOqjIaa
X-Proofpoint-GUID: 3_YF2GgDreQW3Q6RAfw_NWOgjsOqjIaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX7acReCK9ZLqr
 7xGHwA7Lm6vCuQcPW5CE2ibN3aZVyVUvUIYUSaAl5CNY4naXwZXLqisX7vdDG3hyKgs9+pHWoUA
 4ZFbb17FVw/4CFgTikwWolpThszy1RkS8TWNya+im9iCT7FsBBFQfOmAEMFOOPNvqXiaRqqIgmQ
 1imcCSIvmdRQwBiwVi3J/P2OcgoNkzlYOEPnpoQQ/5L49O+dTofyim41nyDdJHhRh5rjTFZZkaa
 bUFan7Qq2kaT7+47jF7gKe1Jsl+WssBpyksqSJg5+x1Jg930RBugFCrCxIPsfr2049YJN6Gbd8Y
 2Aq0tQ0EiA0TLJ8EIIp3R6TjmTiR68Xk7VKYWoectuI1gO8g+XNIFaghwORosZjSul1MDcbp0Vg
 XOa2vnO84jK+TsGFLNyZ8TRzZC8H/lkBxXqjVgJPRN2XAUOaRk0+fni0wF8QkY+E+3bui+Fk7dP
 hbB+9Ajzce2qhV7bdag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX85jBE3zPjlT0
 nBh/u3VSnv3S3CL91dzJHpjJLNZJ5CF19ZPHN1qj7EGCkhQXvlKmE8YQUHLYFQnx04xfIwV3SsA
 qTBnR9DP4vRn0Ef87c6TnQPsoHjxjIU=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac61f49 cx=c_pps
 a=mniIB+Hk/8HPdz+5sH7poA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=u0Ry9gnqgf_Ls9jc7UwA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8457644cb9132..a1b99097a94ad 100644
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
2.55.0

