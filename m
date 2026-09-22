Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6E4F054E;
	Tue, 22 Sep 2026 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059848; cv=fail; b=IyTByQuzBDKk1zvT/hRp+M9NUESFMiPl0kF8fy+kRSp8tJbFr6r+Mt6KwVrF5d8QjeACBgwgVDyA6LhUKuf9/aL7AL4rboa0UMhQubpTcsD3WpwgtpnL4K/C16xB352rosCaKxIW+NPiudqWyc3UJ0oNm9pT/c4gdZpg81CqiOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059848; c=relaxed/simple;
	bh=3qAjKuu7BBHPqWb2rrF3pmtgChauMAgmrOONQXSywDQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=am6EBI3y8vzJxLF7/kzTGRetnewLjjUnjL/h6NhzfmwNNWjxOtAFoAbyD9a9xf1fdh4EeUhaFzf6vGJGz9fxkSLud95z7qsO9imaD/a0i0iG3xrzl1MOh6KqfGKd9DzxenIPTjyveDzywd5bRebNG28E2biIgeYBoUgKq3vTsls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=a9T08m3+; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YcT6OShX; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="a9T08m3+";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YcT6OShX"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2UL6h1034913;
	Tue, 22 Sep 2026 01:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CpaO3ZkhzfTUqtlNX7D2ZF8DKvExXHd+0jazA8xEy
	+g=; b=a9T08m3+j3inogcH2wxVRpE9MY2mdDdhcJ42yjtg3GcF5T/asYcVOVj3p
	uWBLE4SHPXtLHs5e6s3UFbU/JARF6I0Phes8lD4D+UwqGz3iKdZ/eGkbcQsMXBMt
	w8csLF0E4a5yVXofXlFbm4RkIO+7pGy0upAOXu8vWAKkYeAeJgrRlmzqd2cBDakp
	odJUTcJL97JP9l9gPpOAynlcisPO02wFdVnkOwe6LBoyF9AZLXM99MoEkUJroktV
	iHjmL2bj69ZvmdMg3DoWA6lizwt4orV6hXIgmjwZUjDhHHhOdTtPPYLHAWIH9Cqw
	iRBFToWwRZiu1hk6k+5242mKULSeQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16m6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbiSitbZrovA77mBssZjBl6trLmpXkGWKT9+ecANu7qRlIxmNCeDdnO8XscKMksFyUlF3BaEHGQelO847+/Prjfwf+FiBK86Ek9YvlsEJpcmD2y3elHN1pRJYz5aBfp5j4uAq+1fofmKKB5OOHa8h2N7zr56otAb5MCk0WnipvAChGyGT7N4g+giz+e+GzuMv+DQvlBFbsJkQ0TP8bIApxYyIs3sUGMcVF/93DZX+NXxeb0hKPGetAr5QPLWaOeOWWnzj7dEd++Yy3tf7FSChkxAotyFlvnppQso9okr8Bhv0NEXbqlQB7ShY7YPpOvbRXtQ6b8mAimgtV7JSp+HnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpaO3ZkhzfTUqtlNX7D2ZF8DKvExXHd+0jazA8xEy+g=;
 b=D7wPGShRkX18M2aYt5liYIaNHXC0Uto82woLxusu5o/Gg0Hn1GfgQJHGkBUU1US22h8H8oJoAhgE+xKp/3thm+DUyM7/qfde6eU6olhnKFMp+WgtuI+l66XVPjKaXEKKDWwbHp+BQwwW1fusB9PSVavyGu2SJ6AUBX/1W4edNZ3p4lX+c4jQ021FF+9JCpgNSmM1fYpmTP/fyxNjv/MKtRWsW4bKhx8ELbqhbAe6KjnwAWmT5fR7WiVP34qdw62TKYGiwsucMHrNnyQ7gNfXwJzx1Tx2HEievs0W6D1Hl/ezJzUJcv8azdJj8oby8Wh5hAaXpKjjmKxRRGzhNDY2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpaO3ZkhzfTUqtlNX7D2ZF8DKvExXHd+0jazA8xEy+g=;
 b=YcT6OShX6IJIQ/sciqrdpG9OVCFsut9yypLvCsLguX2UJGtm6LlkrLWDHnSiyWL6DM0+LJLv/uwP7DehDslY0xYgi3Mw8ar+QvQCY+LnTl53p+RgNhmtypCrb6rljyMPDaSDv959wzciZNYzcu5dTQHFlq2MNXSIgFAQuVs06ZM=
Received: from CH2PR19CA0015.namprd19.prod.outlook.com (2603:10b6:610:4d::25)
 by IA1PR10MB7469.namprd10.prod.outlook.com (2603:10b6:208:446::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:20 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::51) by CH2PR19CA0015.outlook.office365.com
 (2603:10b6:610:4d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 06:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:20 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:08 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:07 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI413626771;
	Tue, 22 Sep 2026 01:50:03 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 09/19] dmaengine: ti: k3-udma: move resource management functions to k3-udma-common.c
Date: Tue, 22 Sep 2026 12:17:33 +0530
Message-ID: <20260922064902.2719979-10-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|IA1PR10MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe05cf5-e4c7-4357-0f0e-08df1875c525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|10067099003|921020|3023799007|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UMEHhlipf0a8J6QK9FJdpi90nVk/d3pHLIbzDEvcHni+bqokVW0xtIIlXxKNDpNLmpBFoStKRNVZexYCpcTwhb+04Hi9C+mzvwRcaMtmnP8Pgr9M+i+0/fvD565w7G5ejiLUrmp1tBEBn+S9cVpoYhjKxR0dVKNkBQSoNEi8jkcQB619YzCMiKfV0FO9Xq+JJoVZLPtWnB8CI/CGPl5P6o2iw+uGFa5+m8fnrDWJCieFqtj/QEioCgaRWTdQdbK2vpU02OYHLs3Qf1kpgcBQSEnqYHkm4tQZY3ICpmvsl4RwwNqiF0Ic3DcU4udLg6woZ5oS/isBCRVaATDKztqmE8iEjWG9lLXwraAcWT0rC2+KWQ1J7C9vlCwjtM2OfcDLFU6hgnRYLfH7zPAcY35iVAN0ZmDxd8Gd6adrNPcxXU3d36qI0x33wxhbTX1+H9Ha+xt/7bruVdXzo/MMtaO3Vrg5wtw7Qz6zWKlqS9ZRhjztP+I33fy8GMIgbuqJSRthadaOZz8DfSt/839JYhnPE71+Jr5gYwwFzP74YuGNfeDLDUBxdRL85EUR5X6Imx3+lcFbeIWLZwXELRrK38SjptQByW7gpCGtF89XKtg578CuUuIBmrUvqjlYkDzWcY6Zv9kgQlJ6C5dgTbsXT91R3+GKRii5d9mRKfxReALfn6Sw0DgfMVYKpkXXyK1eA8+VTQT/gOEOvNtburFLr/dapQxgpLICCyvMnACikDShWaOp63ootAbVgsEbueY0ewk8
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(10067099003)(921020)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4RwDHW30CONQ4YzWpYvoniZio1wREMNe1Mtgs/oCgxGUhdJm2SJQ1ZeYKkNZaOkP6ZaZ20YD0/7Ts4LtJLOgTtcw75OHP3mfSgcvQbCv9YKPailwqqlkgak2YZ/jQhIkPNkpkktTbstrZzSBvXkOaKjsT2PuBUQNmNFKzpMR5+gKEhfHPtdS+9u1fcvZymDV3r/bXIALCGiW6jrvTqtFX0B0jCZClHy6AcdDkIkt2pMgobGTEiHeOJ3MH1MFytBSxay+N0Y/QdCN+ZrZ7XZ9WNaks921R+UrDSG6EqkFhD0EbgS6/TQRC8mVxr1I8SKNlxNnUrKoaadlwfy7EpbMG5vNfggPbPq9XvYCD4DRhLlZaLOGaActI/GEqLLJjObErU8v7BLBPl07TwQMNjjdmG5z+OYPA+17TRjBZ4D40F2n0mmqfNvlK5I+B82lWKJp
X-Exchange-RoutingPolicyChecked:
	T5gqWtd3ySEgKy/uE4B4FgnP99/3MUgKL0J4v52WTg1uiohBP9BoPz92WJWAlZYpmB2WxJYC6pd9fJC2dx4kLhXr8zIzS7Zmf6xQGnioV3WUAZAPvZBOiIMk/xOM6xVd9c9d4lVwliZr7kXxb7VzrE/iLlHNN4tAvUbGSEjhx7q/waAEbmd0ygm14bHAnTHHLAMDcS+O7M7CmwobRxcQZbuM56V4Pxnz5RjP63WnimFHsvwozlOOg4rrWob42xEsxW/KVmCW5KJUZ8mX90Gm4K06KBrRJNdOxPJZluwJHIr5UI2tOGnWYgR3lyeldV1NMKgGZyqFFnqV1MTqrd0FKw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:20.6687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe05cf5-e4c7-4357-0f0e-08df1875c525
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7469
X-Proofpoint-ORIG-GUID: e_rftGo03itRf_CPDcok03w4sPHGNsM4
X-Proofpoint-GUID: e_rftGo03itRf_CPDcok03w4sPHGNsM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX4PE727T9LdUv
 dzbu63pX9WjfKwPw6zedmd6mzZ3h8cXx7bsXzcSdHlH1c/Vq6pEzm7cuJK9Id+lheTJXEfclYIV
 slljh9Pa0RLodAp+O/NYKApB2LohpiKoFW1C1EJAxds92EqnIBC9Bvia372HVfwnceYsk9mH3RC
 ATOlSZjyC4piFlnr22h4wMRiziQV6eou4NiYWzXHxJkkhg/MVLyYGR66I6/4crMJPFwZvyFP8ae
 JQscaWlmi3XYokJs+a8+UThmXPmPeBbEyqKZgVxG3eLLmMkIf4XPsePBFwCFXLBJ5G48C0ATkgS
 tTF3yJuBayUmrpWJ9C3JNBPwMIuo7vgKIN/UxjEhc2bWlsqdWCgTE53aJwFVzkztmcTdp29eeB6
 P3O5PCaGN0+zTwqXPWrRqFPHYgF2oy91nQa+dnHa4vE+2tlGs5JJjIePnw4LwIZORK6cCxb9kHj
 oxYDZcCOB2yBKymZptw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX25SgNeIl06qT
 JiFoeqLy5PlGSVMXX/BYLeu6n+O19ehYoDGV6Uc5o7xgOJmUwWVMQLLGvMFCOOqWn8au9NzIxMT
 KYpPTuyj5EBNKt7iY3vjMdoeM+AG/NQ=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab22531 cx=c_pps
 a=H8U4Gh8omvmqDI9iB/RWMg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=AMbNDxq4J1R_ZtRBPm4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Move functions responsible for allocation and release of udma
resources such as channels, rings and flows from k3-udma.c
to the common k3-udma-common.c file.

The implementation of these functions is largely shared between K3 UDMA
and K3 UDMA v2. This refactor improves code reuse and maintainability
across multiple variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 443 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 423 ------------------------------
 drivers/dma/ti/k3-udma.h        |  21 ++
 3 files changed, 464 insertions(+), 423 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index dbd667d77f137..34f8eab9ddb57 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1891,5 +1891,448 @@ enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 }
 EXPORT_SYMBOL_GPL(udma_get_copy_align);
 
+/**
+ * __udma_alloc_gp_rflow_range - alloc range of GP RX flows
+ * @ud: UDMA device
+ * @from: Start the search from this flow id number
+ * @cnt: Number of consecutive flow ids to allocate
+ *
+ * Allocate range of RX flow ids for future use, those flows can be requested
+ * only using explicit flow id number. if @from is set to -1 it will try to find
+ * first free range. if @from is positive value it will force allocation only
+ * of the specified range of flows.
+ *
+ * Returns -ENOMEM if can't find free range.
+ * -EEXIST if requested range is busy.
+ * -EINVAL if wrong input values passed.
+ * Returns flow id on success.
+ */
+int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
+{
+	int start, tmp_from;
+	DECLARE_BITMAP(tmp, K3_UDMA_MAX_RFLOWS);
+
+	tmp_from = from;
+	if (tmp_from < 0)
+		tmp_from = ud->rchan_cnt;
+	/* default flows can't be allocated and accessible only by id */
+	if (tmp_from < ud->rchan_cnt)
+		return -EINVAL;
+
+	if (tmp_from + cnt > ud->rflow_cnt)
+		return -EINVAL;
+
+	bitmap_or(tmp, ud->rflow_gp_map, ud->rflow_gp_map_allocated,
+		  ud->rflow_cnt);
+
+	start = bitmap_find_next_zero_area(tmp,
+					   ud->rflow_cnt,
+					   tmp_from, cnt, 0);
+	if (start >= ud->rflow_cnt)
+		return -ENOMEM;
+
+	if (from >= 0 && start != from)
+		return -EEXIST;
+
+	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);
+	return start;
+}
+EXPORT_SYMBOL_GPL(__udma_alloc_gp_rflow_range);
+
+int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
+{
+	if (from < ud->rchan_cnt)
+		return -EINVAL;
+	if (from + cnt > ud->rflow_cnt)
+		return -EINVAL;
+
+	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__udma_free_gp_rflow_range);
+
+struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id)
+{
+	/*
+	 * Attempt to request rflow by ID can be made for any rflow
+	 * if not in use with assumption that caller knows what's doing.
+	 * TI-SCI FW will perform additional permission check ant way, it's
+	 * safe
+	 */
+
+	if (id < 0 || id >= ud->rflow_cnt)
+		return ERR_PTR(-ENOENT);
+
+	if (test_bit(id, ud->rflow_in_use))
+		return ERR_PTR(-ENOENT);
+
+	if (ud->rflow_gp_map) {
+		/* GP rflow has to be allocated first */
+		if (!test_bit(id, ud->rflow_gp_map) &&
+		    !test_bit(id, ud->rflow_gp_map_allocated))
+			return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(ud->dev, "get rflow%d\n", id);
+	set_bit(id, ud->rflow_in_use);
+	return &ud->rflows[id];
+}
+EXPORT_SYMBOL_GPL(__udma_get_rflow);
+
+void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow)
+{
+	if (!test_bit(rflow->id, ud->rflow_in_use)) {
+		dev_err(ud->dev, "attempt to put unused rflow%d\n", rflow->id);
+		return;
+	}
+
+	dev_dbg(ud->dev, "put rflow%d\n", rflow->id);
+	clear_bit(rflow->id, ud->rflow_in_use);
+}
+EXPORT_SYMBOL_GPL(__udma_put_rflow);
+
+#define UDMA_RESERVE_RESOURCE(res)					\
+struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
+					       enum udma_tp_level tpl,	\
+					       int id)			\
+{									\
+	if (id >= 0) {							\
+		if (test_bit(id, ud->res##_map)) {			\
+			dev_err(ud->dev, "res##%d is in use\n", id);	\
+			return ERR_PTR(-ENOENT);			\
+		}							\
+	} else {							\
+		int start;						\
+									\
+		if (tpl >= ud->res##_tpl.levels)			\
+			tpl = ud->res##_tpl.levels - 1;			\
+									\
+		start = ud->res##_tpl.start_idx[tpl];			\
+									\
+		id = find_next_zero_bit(ud->res##_map, ud->res##_cnt,	\
+					start);				\
+		if (id == ud->res##_cnt) {				\
+			return ERR_PTR(-ENOENT);			\
+		}							\
+	}								\
+									\
+	set_bit(id, ud->res##_map);					\
+	return &ud->res##s[id];						\
+}
+
+UDMA_RESERVE_RESOURCE(bchan);
+EXPORT_SYMBOL_GPL(__udma_reserve_bchan);
+UDMA_RESERVE_RESOURCE(tchan);
+EXPORT_SYMBOL_GPL(__udma_reserve_tchan);
+UDMA_RESERVE_RESOURCE(rchan);
+EXPORT_SYMBOL_GPL(__udma_reserve_rchan);
+
+int udma_get_tchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (uc->tchan) {
+		dev_dbg(ud->dev, "chan%d: already have tchan%d allocated\n",
+			uc->id, uc->tchan->id);
+		return 0;
+	}
+
+	/*
+	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
+	 * For PKTDMA mapped channels it is configured to a channel which must
+	 * be used to service the peripheral.
+	 */
+	uc->tchan = __udma_reserve_tchan(ud, uc->config.channel_tpl,
+					 uc->config.mapped_channel_id);
+	if (IS_ERR(uc->tchan)) {
+		ret = PTR_ERR(uc->tchan);
+		uc->tchan = NULL;
+		return ret;
+	}
+
+	if (ud->tflow_cnt) {
+		int tflow_id;
+
+		/* Only PKTDMA have support for tx flows */
+		if (uc->config.default_flow_id >= 0)
+			tflow_id = uc->config.default_flow_id;
+		else
+			tflow_id = uc->tchan->id;
+
+		if (test_bit(tflow_id, ud->tflow_map)) {
+			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
+			clear_bit(uc->tchan->id, ud->tchan_map);
+			uc->tchan = NULL;
+			return -ENOENT;
+		}
+
+		uc->tchan->tflow_id = tflow_id;
+		set_bit(tflow_id, ud->tflow_map);
+	} else {
+		uc->tchan->tflow_id = -1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_tchan);
+
+int udma_get_rchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (uc->rchan) {
+		dev_dbg(ud->dev, "chan%d: already have rchan%d allocated\n",
+			uc->id, uc->rchan->id);
+		return 0;
+	}
+
+	/*
+	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
+	 * For PKTDMA mapped channels it is configured to a channel which must
+	 * be used to service the peripheral.
+	 */
+	uc->rchan = __udma_reserve_rchan(ud, uc->config.channel_tpl,
+					 uc->config.mapped_channel_id);
+	if (IS_ERR(uc->rchan)) {
+		ret = PTR_ERR(uc->rchan);
+		uc->rchan = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_rchan);
+
+int udma_get_chan_pair(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int chan_id, end;
+
+	if ((uc->tchan && uc->rchan) && uc->tchan->id == uc->rchan->id) {
+		dev_info(ud->dev, "chan%d: already have %d pair allocated\n",
+			 uc->id, uc->tchan->id);
+		return 0;
+	}
+
+	if (uc->tchan) {
+		dev_err(ud->dev, "chan%d: already have tchan%d allocated\n",
+			uc->id, uc->tchan->id);
+		return -EBUSY;
+	} else if (uc->rchan) {
+		dev_err(ud->dev, "chan%d: already have rchan%d allocated\n",
+			uc->id, uc->rchan->id);
+		return -EBUSY;
+	}
+
+	/* Can be optimized, but let's have it like this for now */
+	end = min(ud->tchan_cnt, ud->rchan_cnt);
+	/*
+	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
+	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
+	 */
+	chan_id = ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
+	for (; chan_id < end; chan_id++) {
+		if (!test_bit(chan_id, ud->tchan_map) &&
+		    !test_bit(chan_id, ud->rchan_map))
+			break;
+	}
+
+	if (chan_id == end)
+		return -ENOENT;
+
+	set_bit(chan_id, ud->tchan_map);
+	set_bit(chan_id, ud->rchan_map);
+	uc->tchan = &ud->tchans[chan_id];
+	uc->rchan = &ud->rchans[chan_id];
+
+	/* UDMA does not use tx flows */
+	uc->tchan->tflow_id = -1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_chan_pair);
+
+int udma_get_rflow(struct udma_chan *uc, int flow_id)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (!uc->rchan) {
+		dev_err(ud->dev, "chan%d: does not have rchan??\n", uc->id);
+		return -EINVAL;
+	}
+
+	if (uc->rflow) {
+		dev_dbg(ud->dev, "chan%d: already have rflow%d allocated\n",
+			uc->id, uc->rflow->id);
+		return 0;
+	}
+
+	uc->rflow = __udma_get_rflow(ud, flow_id);
+	if (IS_ERR(uc->rflow)) {
+		ret = PTR_ERR(uc->rflow);
+		uc->rflow = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_rflow);
+
+void udma_put_rchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->rchan) {
+		dev_dbg(ud->dev, "chan%d: put rchan%d\n", uc->id,
+			uc->rchan->id);
+		clear_bit(uc->rchan->id, ud->rchan_map);
+		uc->rchan = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_put_rchan);
+
+void udma_put_tchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->tchan) {
+		dev_dbg(ud->dev, "chan%d: put tchan%d\n", uc->id,
+			uc->tchan->id);
+		clear_bit(uc->tchan->id, ud->tchan_map);
+
+		if (uc->tchan->tflow_id >= 0)
+			clear_bit(uc->tchan->tflow_id, ud->tflow_map);
+
+		uc->tchan = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_put_tchan);
+
+void udma_put_rflow(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->rflow) {
+		dev_dbg(ud->dev, "chan%d: put rflow%d\n", uc->id,
+			uc->rflow->id);
+		__udma_put_rflow(ud, uc->rflow);
+		uc->rflow = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_put_rflow);
+
+void udma_free_tx_resources(struct udma_chan *uc)
+{
+	if (!uc->tchan)
+		return;
+
+	k3_ringacc_ring_free(uc->tchan->t_ring);
+	k3_ringacc_ring_free(uc->tchan->tc_ring);
+	uc->tchan->t_ring = NULL;
+	uc->tchan->tc_ring = NULL;
+
+	udma_put_tchan(uc);
+}
+EXPORT_SYMBOL_GPL(udma_free_tx_resources);
+
+void udma_free_rx_resources(struct udma_chan *uc)
+{
+	if (!uc->rchan)
+		return;
+
+	if (uc->rflow) {
+		struct udma_rflow *rflow = uc->rflow;
+
+		k3_ringacc_ring_free(rflow->fd_ring);
+		k3_ringacc_ring_free(rflow->r_ring);
+		rflow->fd_ring = NULL;
+		rflow->r_ring = NULL;
+
+		udma_put_rflow(uc);
+	}
+
+	udma_put_rchan(uc);
+}
+EXPORT_SYMBOL_GPL(udma_free_rx_resources);
+
+void udma_free_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+
+	udma_terminate_all(chan);
+	if (uc->terminated_desc) {
+		ud->reset_chan(uc, false);
+		udma_reset_rings(uc);
+	}
+
+	cancel_delayed_work_sync(&uc->tx_drain.work);
+
+	if (uc->irq_num_ring > 0) {
+		free_irq(uc->irq_num_ring, uc);
+
+		uc->irq_num_ring = 0;
+	}
+	if (uc->irq_num_udma > 0) {
+		free_irq(uc->irq_num_udma, uc);
+
+		uc->irq_num_udma = 0;
+	}
+
+	/* Release PSI-L pairing */
+	if (uc->psil_paired) {
+		if (ud->psil_unpair)
+			ud->psil_unpair(ud, uc->config.src_thread,
+					uc->config.dst_thread);
+		uc->psil_paired = false;
+	}
+
+	vchan_free_chan_resources(&uc->vc);
+	tasklet_kill(&uc->vc.task);
+
+	bcdma_free_bchan_resources(uc);
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+	udma_reset_uchan(uc);
+
+	if (uc->use_dma_pool) {
+		dma_pool_destroy(uc->hdesc_pool);
+		uc->use_dma_pool = false;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_free_chan_resources);
+
+void bcdma_put_bchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->bchan) {
+		dev_dbg(ud->dev, "chan%d: put bchan%d\n", uc->id,
+			uc->bchan->id);
+		clear_bit(uc->bchan->id, ud->bchan_map);
+		uc->bchan = NULL;
+		uc->tchan = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(bcdma_put_bchan);
+
+void bcdma_free_bchan_resources(struct udma_chan *uc)
+{
+	if (!uc->bchan)
+		return;
+
+	k3_ringacc_ring_free(uc->bchan->tc_ring);
+	k3_ringacc_ring_free(uc->bchan->t_ring);
+	uc->bchan->tc_ring = NULL;
+	uc->bchan->t_ring = NULL;
+	k3_configure_chan_coherency(&uc->vc.chan, 0);
+
+	bcdma_put_bchan(uc);
+}
+EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index cd73bf03e9cc6..21978f17e327f 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -423,135 +423,6 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/**
- * __udma_alloc_gp_rflow_range - alloc range of GP RX flows
- * @ud: UDMA device
- * @from: Start the search from this flow id number
- * @cnt: Number of consecutive flow ids to allocate
- *
- * Allocate range of RX flow ids for future use, those flows can be requested
- * only using explicit flow id number. if @from is set to -1 it will try to find
- * first free range. if @from is positive value it will force allocation only
- * of the specified range of flows.
- *
- * Returns -ENOMEM if can't find free range.
- * -EEXIST if requested range is busy.
- * -EINVAL if wrong input values passed.
- * Returns flow id on success.
- */
-static int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
-{
-	int start, tmp_from;
-	DECLARE_BITMAP(tmp, K3_UDMA_MAX_RFLOWS);
-
-	tmp_from = from;
-	if (tmp_from < 0)
-		tmp_from = ud->rchan_cnt;
-	/* default flows can't be allocated and accessible only by id */
-	if (tmp_from < ud->rchan_cnt)
-		return -EINVAL;
-
-	if (tmp_from + cnt > ud->rflow_cnt)
-		return -EINVAL;
-
-	bitmap_or(tmp, ud->rflow_gp_map, ud->rflow_gp_map_allocated,
-		  ud->rflow_cnt);
-
-	start = bitmap_find_next_zero_area(tmp,
-					   ud->rflow_cnt,
-					   tmp_from, cnt, 0);
-	if (start >= ud->rflow_cnt)
-		return -ENOMEM;
-
-	if (from >= 0 && start != from)
-		return -EEXIST;
-
-	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);
-	return start;
-}
-
-static int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
-{
-	if (from < ud->rchan_cnt)
-		return -EINVAL;
-	if (from + cnt > ud->rflow_cnt)
-		return -EINVAL;
-
-	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
-	return 0;
-}
-
-static struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id)
-{
-	/*
-	 * Attempt to request rflow by ID can be made for any rflow
-	 * if not in use with assumption that caller knows what's doing.
-	 * TI-SCI FW will perform additional permission check ant way, it's
-	 * safe
-	 */
-
-	if (id < 0 || id >= ud->rflow_cnt)
-		return ERR_PTR(-ENOENT);
-
-	if (test_bit(id, ud->rflow_in_use))
-		return ERR_PTR(-ENOENT);
-
-	if (ud->rflow_gp_map) {
-		/* GP rflow has to be allocated first */
-		if (!test_bit(id, ud->rflow_gp_map) &&
-		    !test_bit(id, ud->rflow_gp_map_allocated))
-			return ERR_PTR(-EINVAL);
-	}
-
-	dev_dbg(ud->dev, "get rflow%d\n", id);
-	set_bit(id, ud->rflow_in_use);
-	return &ud->rflows[id];
-}
-
-static void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow)
-{
-	if (!test_bit(rflow->id, ud->rflow_in_use)) {
-		dev_err(ud->dev, "attempt to put unused rflow%d\n", rflow->id);
-		return;
-	}
-
-	dev_dbg(ud->dev, "put rflow%d\n", rflow->id);
-	clear_bit(rflow->id, ud->rflow_in_use);
-}
-
-#define UDMA_RESERVE_RESOURCE(res)					\
-static struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
-					       enum udma_tp_level tpl,	\
-					       int id)			\
-{									\
-	if (id >= 0) {							\
-		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
-		}							\
-	} else {							\
-		int start;						\
-									\
-		if (tpl >= ud->res##_tpl.levels)			\
-			tpl = ud->res##_tpl.levels - 1;			\
-									\
-		start = ud->res##_tpl.start_idx[tpl];			\
-									\
-		id = find_next_zero_bit(ud->res##_map, ud->res##_cnt,	\
-					start);				\
-		if (id == ud->res##_cnt) {				\
-			return ERR_PTR(-ENOENT);			\
-		}							\
-	}								\
-									\
-	set_bit(id, ud->res##_map);					\
-	return &ud->res##s[id];						\
-}
-
-UDMA_RESERVE_RESOURCE(bchan);
-UDMA_RESERVE_RESOURCE(tchan);
-UDMA_RESERVE_RESOURCE(rchan);
-
 static int bcdma_get_bchan(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -585,223 +456,6 @@ static int bcdma_get_bchan(struct udma_chan *uc)
 	return 0;
 }
 
-static int udma_get_tchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (uc->tchan) {
-		dev_dbg(ud->dev, "chan%d: already have tchan%d allocated\n",
-			uc->id, uc->tchan->id);
-		return 0;
-	}
-
-	/*
-	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
-	 * For PKTDMA mapped channels it is configured to a channel which must
-	 * be used to service the peripheral.
-	 */
-	uc->tchan = __udma_reserve_tchan(ud, uc->config.channel_tpl,
-					 uc->config.mapped_channel_id);
-	if (IS_ERR(uc->tchan)) {
-		ret = PTR_ERR(uc->tchan);
-		uc->tchan = NULL;
-		return ret;
-	}
-
-	if (ud->tflow_cnt) {
-		int tflow_id;
-
-		/* Only PKTDMA have support for tx flows */
-		if (uc->config.default_flow_id >= 0)
-			tflow_id = uc->config.default_flow_id;
-		else
-			tflow_id = uc->tchan->id;
-
-		if (test_bit(tflow_id, ud->tflow_map)) {
-			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
-			clear_bit(uc->tchan->id, ud->tchan_map);
-			uc->tchan = NULL;
-			return -ENOENT;
-		}
-
-		uc->tchan->tflow_id = tflow_id;
-		set_bit(tflow_id, ud->tflow_map);
-	} else {
-		uc->tchan->tflow_id = -1;
-	}
-
-	return 0;
-}
-
-static int udma_get_rchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (uc->rchan) {
-		dev_dbg(ud->dev, "chan%d: already have rchan%d allocated\n",
-			uc->id, uc->rchan->id);
-		return 0;
-	}
-
-	/*
-	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
-	 * For PKTDMA mapped channels it is configured to a channel which must
-	 * be used to service the peripheral.
-	 */
-	uc->rchan = __udma_reserve_rchan(ud, uc->config.channel_tpl,
-					 uc->config.mapped_channel_id);
-	if (IS_ERR(uc->rchan)) {
-		ret = PTR_ERR(uc->rchan);
-		uc->rchan = NULL;
-		return ret;
-	}
-
-	return 0;
-}
-
-static int udma_get_chan_pair(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int chan_id, end;
-
-	if ((uc->tchan && uc->rchan) && uc->tchan->id == uc->rchan->id) {
-		dev_info(ud->dev, "chan%d: already have %d pair allocated\n",
-			 uc->id, uc->tchan->id);
-		return 0;
-	}
-
-	if (uc->tchan) {
-		dev_err(ud->dev, "chan%d: already have tchan%d allocated\n",
-			uc->id, uc->tchan->id);
-		return -EBUSY;
-	} else if (uc->rchan) {
-		dev_err(ud->dev, "chan%d: already have rchan%d allocated\n",
-			uc->id, uc->rchan->id);
-		return -EBUSY;
-	}
-
-	/* Can be optimized, but let's have it like this for now */
-	end = min(ud->tchan_cnt, ud->rchan_cnt);
-	/*
-	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
-	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
-	 */
-	chan_id = ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
-	for (; chan_id < end; chan_id++) {
-		if (!test_bit(chan_id, ud->tchan_map) &&
-		    !test_bit(chan_id, ud->rchan_map))
-			break;
-	}
-
-	if (chan_id == end)
-		return -ENOENT;
-
-	set_bit(chan_id, ud->tchan_map);
-	set_bit(chan_id, ud->rchan_map);
-	uc->tchan = &ud->tchans[chan_id];
-	uc->rchan = &ud->rchans[chan_id];
-
-	/* UDMA does not use tx flows */
-	uc->tchan->tflow_id = -1;
-
-	return 0;
-}
-
-static int udma_get_rflow(struct udma_chan *uc, int flow_id)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (!uc->rchan) {
-		dev_err(ud->dev, "chan%d: does not have rchan??\n", uc->id);
-		return -EINVAL;
-	}
-
-	if (uc->rflow) {
-		dev_dbg(ud->dev, "chan%d: already have rflow%d allocated\n",
-			uc->id, uc->rflow->id);
-		return 0;
-	}
-
-	uc->rflow = __udma_get_rflow(ud, flow_id);
-	if (IS_ERR(uc->rflow)) {
-		ret = PTR_ERR(uc->rflow);
-		uc->rflow = NULL;
-		return ret;
-	}
-
-	return 0;
-}
-
-static void bcdma_put_bchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->bchan) {
-		dev_dbg(ud->dev, "chan%d: put bchan%d\n", uc->id,
-			uc->bchan->id);
-		clear_bit(uc->bchan->id, ud->bchan_map);
-		uc->bchan = NULL;
-		uc->tchan = NULL;
-	}
-}
-
-static void udma_put_rchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->rchan) {
-		dev_dbg(ud->dev, "chan%d: put rchan%d\n", uc->id,
-			uc->rchan->id);
-		clear_bit(uc->rchan->id, ud->rchan_map);
-		uc->rchan = NULL;
-	}
-}
-
-static void udma_put_tchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->tchan) {
-		dev_dbg(ud->dev, "chan%d: put tchan%d\n", uc->id,
-			uc->tchan->id);
-		clear_bit(uc->tchan->id, ud->tchan_map);
-
-		if (uc->tchan->tflow_id >= 0)
-			clear_bit(uc->tchan->tflow_id, ud->tflow_map);
-
-		uc->tchan = NULL;
-	}
-}
-
-static void udma_put_rflow(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->rflow) {
-		dev_dbg(ud->dev, "chan%d: put rflow%d\n", uc->id,
-			uc->rflow->id);
-		__udma_put_rflow(ud, uc->rflow);
-		uc->rflow = NULL;
-	}
-}
-
-static void bcdma_free_bchan_resources(struct udma_chan *uc)
-{
-	if (!uc->bchan)
-		return;
-
-	k3_ringacc_ring_free(uc->bchan->tc_ring);
-	k3_ringacc_ring_free(uc->bchan->t_ring);
-	uc->bchan->tc_ring = NULL;
-	uc->bchan->t_ring = NULL;
-	k3_configure_chan_coherency(&uc->vc.chan, 0);
-
-	bcdma_put_bchan(uc);
-}
-
 static int bcdma_alloc_bchan_resources(struct udma_chan *uc)
 {
 	struct k3_ring_cfg ring_cfg;
@@ -847,19 +501,6 @@ static int bcdma_alloc_bchan_resources(struct udma_chan *uc)
 	return ret;
 }
 
-static void udma_free_tx_resources(struct udma_chan *uc)
-{
-	if (!uc->tchan)
-		return;
-
-	k3_ringacc_ring_free(uc->tchan->t_ring);
-	k3_ringacc_ring_free(uc->tchan->tc_ring);
-	uc->tchan->t_ring = NULL;
-	uc->tchan->tc_ring = NULL;
-
-	udma_put_tchan(uc);
-}
-
 static int udma_alloc_tx_resources(struct udma_chan *uc)
 {
 	struct k3_ring_cfg ring_cfg;
@@ -917,25 +558,6 @@ static int udma_alloc_tx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-static void udma_free_rx_resources(struct udma_chan *uc)
-{
-	if (!uc->rchan)
-		return;
-
-	if (uc->rflow) {
-		struct udma_rflow *rflow = uc->rflow;
-
-		k3_ringacc_ring_free(rflow->fd_ring);
-		k3_ringacc_ring_free(rflow->r_ring);
-		rflow->fd_ring = NULL;
-		rflow->r_ring = NULL;
-
-		udma_put_rflow(uc);
-	}
-
-	udma_put_rchan(uc);
-}
-
 static int udma_alloc_rx_resources(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -2024,51 +1646,6 @@ static int udma_resume(struct dma_chan *chan)
 	return 0;
 }
 
-static void udma_free_chan_resources(struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	struct udma_dev *ud = to_udma_dev(chan->device);
-
-	udma_terminate_all(chan);
-	if (uc->terminated_desc) {
-		ud->reset_chan(uc, false);
-		udma_reset_rings(uc);
-	}
-
-	cancel_delayed_work_sync(&uc->tx_drain.work);
-
-	if (uc->irq_num_ring > 0) {
-		free_irq(uc->irq_num_ring, uc);
-
-		uc->irq_num_ring = 0;
-	}
-	if (uc->irq_num_udma > 0) {
-		free_irq(uc->irq_num_udma, uc);
-
-		uc->irq_num_udma = 0;
-	}
-
-	/* Release PSI-L pairing */
-	if (uc->psil_paired) {
-		ud->psil_unpair(ud, uc->config.src_thread,
-				uc->config.dst_thread);
-		uc->psil_paired = false;
-	}
-
-	vchan_free_chan_resources(&uc->vc);
-	tasklet_kill(&uc->vc.task);
-
-	bcdma_free_bchan_resources(uc);
-	udma_free_tx_resources(uc);
-	udma_free_rx_resources(uc);
-	udma_reset_uchan(uc);
-
-	if (uc->use_dma_pool) {
-		dma_pool_destroy(uc->hdesc_pool);
-		uc->use_dma_pool = false;
-	}
-}
-
 static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 4878d13d84ed0..329df7eb156b2 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -658,6 +658,27 @@ void udma_dbg_summary_show(struct seq_file *s,
 			   struct dma_device *dma_dev);
 #endif /* CONFIG_DEBUG_FS */
 
+int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt);
+int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt);
+struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id);
+void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow);
+int udma_get_tchan(struct udma_chan *uc);
+int udma_get_rchan(struct udma_chan *uc);
+int udma_get_chan_pair(struct udma_chan *uc);
+int udma_get_rflow(struct udma_chan *uc, int flow_id);
+void udma_put_rchan(struct udma_chan *uc);
+void udma_put_tchan(struct udma_chan *uc);
+void udma_put_rflow(struct udma_chan *uc);
+void udma_free_tx_resources(struct udma_chan *uc);
+void udma_free_rx_resources(struct udma_chan *uc);
+void udma_free_chan_resources(struct dma_chan *chan);
+void bcdma_put_bchan(struct udma_chan *uc);
+void bcdma_free_bchan_resources(struct udma_chan *uc);
+
+struct udma_bchan *__udma_reserve_bchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
+struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
+struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

