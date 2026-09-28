Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A31A6823;
	Mon, 28 Sep 2026 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564320; cv=fail; b=R/c33XSvi/lp345vSR0Tvo5Q9mKroo373XN/nwA+PiOsS9ck5ul9g/pZLm5cXiI1eYvvrfdYLftXEmnP5TF5SlSskrQb9c+XG53Sde4DA4IlznUW8OR/bgiGMxixnJhTNbVz1PnwiNZXqd29eXaL67DD0Oc9+o0o0V75c2AnEBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564320; c=relaxed/simple;
	bh=esamlki0UYmjV9wiiAEwdi6WfqFJ5zWWdkJtfFlvfMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fq6f5RZ0h2EtYYgbr2oFlibIWB+tQ2HaN+dsZ62CRF7m7JKoD72TZJnBVdwPlA0rUI+OeIMisCwKkm7a4AnEBRBbevCrw/XpF9qD3UwmLPTEAgrD8fafBxRbQBPqLoDOqFTUbOFBQn++aMQzCIC50Zj3R1kk8k51nHIDKxM0Qxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qck3/H+G; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uTr7Z+08; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qck3/H+G";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uTr7Z+08"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RKA6tp2283027;
	Sun, 27 Sep 2026 21:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Do6VpRERv3DJbrCpEoWH/pWMVQkTxe4yStDn/yrac
	/M=; b=qck3/H+G6rGHl/3w9Q8Y+CL2XlGPleYkclnsRD+ghNNpojUA9bKhU3h5B
	Hus09KF3cAhCC4v3GW5nOWMdFKTe6luwqsyKiv6R5UyC63kmBnPTLZowdvTCfZqs
	X3xCGyXUI8v+OfZ+WTufjigzsbIEc5caEuy8JxhKuNXqviDMv5e8mIeAF/aLRbaU
	YUT8ajfcvQ41OQLrD/fkfgFcxz+zSCfo58TVBqcVIVCoS16QnZisZuywhPrFuoNq
	Q9eZYzjXWVA6ofXffKm9EXOY5GYofsNlbd3Lx9VtNHSWIJX6sZVV1grwhdvrJl9T
	fweSQbjbTrrUGWmjdY8seHxS+9tug==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nufvf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:58:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0WJTRJo3n1GkuOZ76+LG34M5/Sy9XOBztad7n+NQm2mlqH98/udy5dfSWRVcZEwVhwkWIYnFIKz2jdmqJ1Nle3rlZqNEptRikwXDVBCBcldYPvBXUbNPbTk/kiF5iXnBPSsoh8NRWzePumF6qLmxjrb6+HgoHBr+LHO4lq48eG7eG+A5oEDZqosuEtiF9Ej5iJLLBl3hUerXs1v4aBaLFSP/wOzX7epG1OH+Vcfe2SyP4TPwriSm2NACOCG/wSSJuXNB5+ncejC3WOvbInOddP8jIB7i+YpPR24JuuHOg/1stpwI/Q6ulh0Q5Z0J1+nHUDFU3ibUyqnPB+3p/77rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do6VpRERv3DJbrCpEoWH/pWMVQkTxe4yStDn/yrac/M=;
 b=UaLIWJuP4N0FRcu2ebROF2O23oAQwjj8XFhfgY88FitWSxxq0HHq7KC9O5nbs175WWejyMcjbQhwXJMrhuTMxBuUgt1vNK4zlR5Xq2ECxzoAuY4i20AkbbAk8q8e/jayLfN9WwLfe0TwwAnrjKky5TYrS2zXqfh5uGs5JZiWfI7SD3ewtJH0d1jbhttK7u8Bwb0tjwDibdIcviAN/bd47Z+aR0oLdHLYA/nVPtmBkmOM3nDsDCiazHDfApbo/ML4rRowifPTu3QVmfAJPcOUmAgjsqKNXkiyjxEbRgjhXfPkUTYEzT3bOrP09q9ykJ4MRw7tprjcjIbWVuBY2PZH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do6VpRERv3DJbrCpEoWH/pWMVQkTxe4yStDn/yrac/M=;
 b=uTr7Z+08qHMFS3ZqwsiRIhgADYA3X25wr5SQQUlvqr4hHANfKC3diS0TGvi2ui5TrNzCcvLmhsawP/lsBcDe7OnHZryzVEm4oLaIzMbUEVMduu7Qd2Jh6l9dEsvgzb0anGT/0Uyd/Z6J1TPJWHCpGJwsZeivoZMFYHzRbQ4m404=
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by CH3PR10MB7744.namprd10.prod.outlook.com (2603:10b6:610:1ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 02:58:24 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::d) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.11 via Frontend Transport; Mon,
 28 Sep 2026 02:58:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:24 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:11 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:11 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqA2256662;
	Sun, 27 Sep 2026 21:58:07 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 03/19] dmaengine: ti: k3-udma: move structs and enums to header file
Date: Mon, 28 Sep 2026 08:26:09 +0530
Message-ID: <20260928025749.1055383-4-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|CH3PR10MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 8960f510-1c1e-4511-bdc7-08df1d0c5cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|56012099006|10067099003|3023799007|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	mpIIyrew0txkSNI646qYAANR/euNDfF+H6ofrt+PqYCDQm63keDmhWTTwrRP4nqMMvv974f4I1M+zZpg9wR0+Rz8uk9lvVS22+gkbQRq/JrZwNwgaaOUN3J7ygTBqcWsxMsEpBylT88KziufaLpRK8/eZqQC6MYjR9NlxzO6uMMtS8yKxoYyU4nNuE1y5lV/goGSZVDH0QK4dhFqxd+TYJk7KjhTupVlpL9skf+R+LZuD2yKC+oRNUj0QgtYoTwJZ8vKaGrHgzSEiIK0Zu8Wuktb+d2qcukHNUb/4QkcHfEkuMfmrzrYIkAScYXsxXAdl2aMimpXPK3C/nblDTiBYBjlw20CU7zzXr/k67LmJVCBG7mGYznxQKculEIMIOqJnD0uhv3R0LCbGkyHJnA/vzCcBqfoXmkWLQhkm0RcKoP3wQf2/PCbz9s49+MROQ5p7pewVPWBlZeD/qkZBBMBf/GscInJrtXXdRUSiJE9a0p4PKfXWLfTgDD3bZXmwcPc+FfKTX6EOFEH0chddE8T/nrRnS5ds2/4HpKjb1CxWCTNalcztul8dL3s/5thJgut3TGgqs0WhEEvgX12kpkO6fUiF8Dxjgly7gDltSbWEtOHZkrpy1sFmL28sTzF9j8U3IgUum0L9zZQcglzh+yvYQOB9NyPccu+U5LZPAinv06PLA+x1dkOOoDnAKx5CTO0JPwRj+2cJn1pQmLpZmphs7KBlz+A6rtIoDLg0OfX7Zy4zKT5/4//Y9Sai65U5qFy
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E/fTG07Ta3sJ1IWmOIerDrf/qS3H+qeUyrh3Z62tKS20t/onUIAkXKHBi1BUsbtwPZAtMbp0BHO8jDsmcJzXOg65+mF9W6brbv6QP6gKkRITbv42pWFvWBkxC5OtDGxKt/9S3zYF5Q8Iydo20mnkNnAXw1pAvGSnQ1Tjdid/GKO65fLyaGjum5vVlFZTGd8ODu1LEuey1RGUo4lk0K/EtYNqFXa7RCdQoACYEgN77ctwHrTXFU+1Qgy81oZR5InkWwX8M+FNTSv+Mkg5QAOAJTgTtHUZ35VqsKF+vcx3R+8NeMUESMahMyzjPmj6csz+FufyUNfjZUqCQpLt5p8Mk2fBToyIDgObp0Hnw4XkzeykS9fKjM0z/KJy9Smkx89g0ChTy/LvD3OcjN9sAlr8UHNg0n6q5bJJYXJoQuUcHSH8882lHC9v2SAodIXuFRdV
X-Exchange-RoutingPolicyChecked:
	Z/nfFzfpVvCB+G93JRG+0uZ08dJ/b1vgJnTxntZxYkHkZvA+gmd/6uKePVWokcABiteh7jeH1LzolISDOwJ+GRrCLU8iMu3WeHoe+vLz599IeNO42ARvGMXwtQQw7+ejHaAqYS+nwYza/ST8F5UggTS/8f2Twh5BZCGEkC1Ac0RsXpgQjHZHpKSLGkAmCvrpw0mRCgpcdBYg0zLGTteFrtx/pT6ERDtnYmnFfSnFacirFA7r1gYDSDETsirk1XkQL3GLOqh8q/o3/1u2jPl90pBnKlu03cRAWUSjuN4M8rEYXY/gGdGjLy36KV7U1Bdc/o/+pYK9JiQFPrtZeoyQHw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:24.1525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8960f510-1c1e-4511-bdc7-08df1d0c5cc1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7744
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX+bLtXlq+nhlm
 6FSpedz7+tt6z9+zgQPRkaYa7RMpcraaiHbyVOT2dJHucDLVuLgPmJyW25qNwe4z/KfM3PRtP/z
 ftHdmJOMnrwMUH1UT6Ybh4bx44TznOs=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9d7d3 cx=c_pps
 a=A0DLv2vQdyrz0cYTEbm3ig==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=8AirrxEcAAAA:8
 a=1JpllqVW-1LRWXCuGuAA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: NTuSQY56sbIqs-O903dsuQHcnpWxmjlp
X-Proofpoint-GUID: NTuSQY56sbIqs-O903dsuQHcnpWxmjlp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX0KJNqXj8qQv/
 ZreUV1RwnH8ci7MREAUMkMG3TWknsn8tppPvpRIUJtDcBfOI37r0JhQTiLn77VLjyqOLG+QwMRt
 ygWL7By3D74gyboE+KB/zLdXHPQzbPJWS+i4r5nJDwza6wn0UNalkhT77/HDQkN5X6M9cITlSfy
 ec6vWrx+G8/UqnNQl6cCgE4HauAyN9WvzmsSsEi59BgK2LK9zGJHN7LRniathIQgLssla6ipjz3
 mfJIlu/SkHUN/fAoA39YfjpUK82u2GifNPOC5ezb/qYvX7EW7Ne1oHq+R7dC4p6zNXH94pqE+B4
 soWats/HDaMPXa+xwWBUCnWd22IKxiwGbuJ1DQoYQaVH9pSCNDC5/wORqEzv2+7fnVocF2fIrzQ
 7Heni8mzSpqZUJ4Xv5z5XewBsV0sljqRO8tnGc5wSYY1GUSBwc5HEI54sncr/dicAKaatyf39I3
 Q+n7MnqPRNdUsEyWzMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Move struct and enum definitions in k3-udma.c to k3-udma.h header file
for better separation and reuse.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ti/k3-udma.c | 259 +-------------------------------------
 drivers/dma/ti/k3-udma.h | 265 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 266 insertions(+), 258 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index a1b99097a94ad..d7c153c5321ea 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -24,8 +24,8 @@
 #include <linux/workqueue.h>
 #include <linux/completion.h>
 #include <linux/soc/ti/k3-ringacc.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/soc/ti/ti_sci_inta_msi.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/dma/k3-event-router.h>
 #include <linux/dma/ti-cppi5.h>
 
@@ -33,28 +33,6 @@
 #include "k3-udma.h"
 #include "k3-psil-priv.h"
 
-struct udma_static_tr {
-	u8 elsize; /* RPSTR0 */
-	u16 elcnt; /* RPSTR0 */
-	u16 bstcnt; /* RPSTR1 */
-};
-
-struct udma_chan;
-
-enum k3_dma_type {
-	DMA_TYPE_UDMA = 0,
-	DMA_TYPE_BCDMA,
-	DMA_TYPE_PKTDMA,
-};
-
-enum udma_mmr {
-	MMR_GCFG = 0,
-	MMR_BCHANRT,
-	MMR_RCHANRT,
-	MMR_TCHANRT,
-	MMR_LAST,
-};
-
 static const char * const mmr_names[] = {
 	[MMR_GCFG] = "gcfg",
 	[MMR_BCHANRT] = "bchanrt",
@@ -62,234 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-struct udma_tchan {
-	void __iomem *reg_rt;
-
-	int id;
-	struct k3_ring *t_ring; /* Transmit ring */
-	struct k3_ring *tc_ring; /* Transmit Completion ring */
-	int tflow_id; /* applicable only for PKTDMA */
-
-};
-
-#define udma_bchan udma_tchan
-
-struct udma_rflow {
-	int id;
-	struct k3_ring *fd_ring; /* Free Descriptor ring */
-	struct k3_ring *r_ring; /* Receive ring */
-};
-
-struct udma_rchan {
-	void __iomem *reg_rt;
-
-	int id;
-};
-
-struct udma_oes_offsets {
-	/* K3 UDMA Output Event Offset */
-	u32 udma_rchan;
-
-	/* BCDMA Output Event Offsets */
-	u32 bcdma_bchan_data;
-	u32 bcdma_bchan_ring;
-	u32 bcdma_tchan_data;
-	u32 bcdma_tchan_ring;
-	u32 bcdma_rchan_data;
-	u32 bcdma_rchan_ring;
-
-	/* PKTDMA Output Event Offsets */
-	u32 pktdma_tchan_flow;
-	u32 pktdma_rchan_flow;
-};
-
-struct udma_match_data {
-	enum k3_dma_type type;
-	u32 psil_base;
-	bool enable_memcpy_support;
-	u32 flags;
-	u32 statictr_z_mask;
-	u8 burst_size[3];
-	struct udma_soc_data *soc_data;
-};
-
-struct udma_soc_data {
-	struct udma_oes_offsets oes;
-	u32 bcdma_trigger_event_offset;
-};
-
-struct udma_hwdesc {
-	size_t cppi5_desc_size;
-	void *cppi5_desc_vaddr;
-	dma_addr_t cppi5_desc_paddr;
-
-	/* TR descriptor internal pointers */
-	void *tr_req_base;
-	struct cppi5_tr_resp_t *tr_resp_base;
-};
-
-struct udma_rx_flush {
-	struct udma_hwdesc hwdescs[2];
-
-	size_t buffer_size;
-	void *buffer_vaddr;
-	dma_addr_t buffer_paddr;
-};
-
-struct udma_tpl {
-	u8 levels;
-	u32 start_idx[3];
-};
-
-struct udma_dev {
-	struct dma_device ddev;
-	struct device *dev;
-	void __iomem *mmrs[MMR_LAST];
-	const struct udma_match_data *match_data;
-	const struct udma_soc_data *soc_data;
-
-	struct udma_tpl bchan_tpl;
-	struct udma_tpl tchan_tpl;
-	struct udma_tpl rchan_tpl;
-
-	size_t desc_align; /* alignment to use for descriptors */
-
-	struct udma_tisci_rm tisci_rm;
-
-	struct k3_ringacc *ringacc;
-
-	struct work_struct purge_work;
-	struct list_head desc_to_purge;
-	spinlock_t lock;
-
-	struct udma_rx_flush rx_flush;
-
-	int bchan_cnt;
-	int tchan_cnt;
-	int echan_cnt;
-	int rchan_cnt;
-	int rflow_cnt;
-	int tflow_cnt;
-	unsigned long *bchan_map;
-	unsigned long *tchan_map;
-	unsigned long *rchan_map;
-	unsigned long *rflow_gp_map;
-	unsigned long *rflow_gp_map_allocated;
-	unsigned long *rflow_in_use;
-	unsigned long *tflow_map;
-
-	struct udma_bchan *bchans;
-	struct udma_tchan *tchans;
-	struct udma_rchan *rchans;
-	struct udma_rflow *rflows;
-
-	struct udma_chan *channels;
-	u32 psil_base;
-	u32 atype;
-	u32 asel;
-};
-
-struct udma_desc {
-	struct virt_dma_desc vd;
-
-	bool terminated;
-
-	enum dma_transfer_direction dir;
-
-	struct udma_static_tr static_tr;
-	u32 residue;
-
-	unsigned int sglen;
-	unsigned int desc_idx; /* Only used for cyclic in packet mode */
-	unsigned int tr_idx;
-
-	u32 metadata_size;
-	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
-
-	unsigned int hwdesc_count;
-	struct udma_hwdesc hwdesc[];
-};
-
-enum udma_chan_state {
-	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
-	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
-	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
-};
-
-struct udma_tx_drain {
-	struct delayed_work work;
-	ktime_t tstamp;
-	u32 residue;
-};
-
-struct udma_chan_config {
-	bool pkt_mode; /* TR or packet */
-	bool needs_epib; /* EPIB is needed for the communication or not */
-	u32 psd_size; /* size of Protocol Specific Data */
-	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
-	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
-	bool notdpkt; /* Suppress sending TDC packet */
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 src_thread;
-	u32 dst_thread;
-	enum psil_endpoint_type ep_type;
-	bool enable_acc32;
-	bool enable_burst;
-	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
-
-	u32 tr_trigger_type;
-	unsigned long tx_flags;
-
-	/* PKDMA mapped channel */
-	int mapped_channel_id;
-	/* PKTDMA default tflow or rflow for mapped channel */
-	int default_flow_id;
-
-	enum dma_transfer_direction dir;
-};
-
-struct udma_chan {
-	struct virt_dma_chan vc;
-	struct dma_slave_config	cfg;
-	struct udma_dev *ud;
-	struct device *dma_dev;
-	struct udma_desc *desc;
-	struct udma_desc *terminated_desc;
-	struct udma_static_tr static_tr;
-	char *name;
-
-	struct udma_bchan *bchan;
-	struct udma_tchan *tchan;
-	struct udma_rchan *rchan;
-	struct udma_rflow *rflow;
-
-	bool psil_paired;
-
-	int irq_num_ring;
-	int irq_num_udma;
-
-	bool cyclic;
-	bool paused;
-
-	enum udma_chan_state state;
-	struct completion teardown_completed;
-
-	struct udma_tx_drain tx_drain;
-
-	/* Channel configuration parameters */
-	struct udma_chan_config config;
-	/* Channel configuration parameters (backup) */
-	struct udma_chan_config backup_config;
-
-	/* dmapool for packet mode descriptors */
-	bool use_dma_pool;
-	struct dma_pool *hdesc_pool;
-
-	u32 id;
-};
-
 static inline struct udma_dev *to_udma_dev(struct dma_device *d)
 {
 	return container_of(d, struct udma_dev, ddev);
@@ -4073,13 +3823,6 @@ static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
 
-struct udma_filter_param {
-	int remote_thread_id;
-	u32 atype;
-	u32 asel;
-	u32 tr_trigger_type;
-};
-
 static bool udma_dma_filter_fn(struct dma_chan *chan, void *param)
 {
 	struct udma_chan_config *ucc;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 750720cd06911..11d08adb0d69f 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -6,7 +6,16 @@
 #ifndef K3_UDMA_H_
 #define K3_UDMA_H_
 
+#include <linux/dmaengine.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/dma/ti-cppi5.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+
+#include "../virt-dma.h"
+#include "k3-psil-priv.h"
 
 /* Global registers */
 #define UDMA_REV_REG			0x0
@@ -164,6 +173,7 @@ struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
 struct udma_rflow;
+struct udma_chan;
 
 enum udma_rm_range {
 	RM_RANGE_BCHAN = 0,
@@ -186,6 +196,261 @@ struct udma_tisci_rm {
 	struct ti_sci_resource *rm_ranges[RM_RANGE_LAST];
 };
 
+struct udma_static_tr {
+	u8 elsize; /* RPSTR0 */
+	u16 elcnt; /* RPSTR0 */
+	u16 bstcnt; /* RPSTR1 */
+};
+
+enum k3_dma_type {
+	DMA_TYPE_UDMA = 0,
+	DMA_TYPE_BCDMA,
+	DMA_TYPE_PKTDMA,
+};
+
+enum udma_mmr {
+	MMR_GCFG = 0,
+	MMR_BCHANRT,
+	MMR_RCHANRT,
+	MMR_TCHANRT,
+	MMR_LAST,
+};
+
+struct udma_filter_param {
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 tr_trigger_type;
+};
+
+struct udma_tchan {
+	void __iomem *reg_rt;
+
+	int id;
+	struct k3_ring *t_ring; /* Transmit ring */
+	struct k3_ring *tc_ring; /* Transmit Completion ring */
+	int tflow_id; /* applicable only for PKTDMA */
+
+};
+
+#define udma_bchan udma_tchan
+
+struct udma_rflow {
+	int id;
+	struct k3_ring *fd_ring; /* Free Descriptor ring */
+	struct k3_ring *r_ring; /* Receive ring */
+};
+
+struct udma_rchan {
+	void __iomem *reg_rt;
+
+	int id;
+};
+
+struct udma_oes_offsets {
+	/* K3 UDMA Output Event Offset */
+	u32 udma_rchan;
+
+	/* BCDMA Output Event Offsets */
+	u32 bcdma_bchan_data;
+	u32 bcdma_bchan_ring;
+	u32 bcdma_tchan_data;
+	u32 bcdma_tchan_ring;
+	u32 bcdma_rchan_data;
+	u32 bcdma_rchan_ring;
+
+	/* PKTDMA Output Event Offsets */
+	u32 pktdma_tchan_flow;
+	u32 pktdma_rchan_flow;
+};
+
+struct udma_match_data {
+	enum k3_dma_type type;
+	u32 psil_base;
+	bool enable_memcpy_support;
+	u32 flags;
+	u32 statictr_z_mask;
+	u8 burst_size[3];
+	struct udma_soc_data *soc_data;
+};
+
+struct udma_soc_data {
+	struct udma_oes_offsets oes;
+	u32 bcdma_trigger_event_offset;
+};
+
+struct udma_hwdesc {
+	size_t cppi5_desc_size;
+	void *cppi5_desc_vaddr;
+	dma_addr_t cppi5_desc_paddr;
+
+	/* TR descriptor internal pointers */
+	void *tr_req_base;
+	struct cppi5_tr_resp_t *tr_resp_base;
+};
+
+struct udma_rx_flush {
+	struct udma_hwdesc hwdescs[2];
+
+	size_t buffer_size;
+	void *buffer_vaddr;
+	dma_addr_t buffer_paddr;
+};
+
+struct udma_tpl {
+	u8 levels;
+	u32 start_idx[3];
+};
+
+struct udma_dev {
+	struct dma_device ddev;
+	struct device *dev;
+	void __iomem *mmrs[MMR_LAST];
+	const struct udma_match_data *match_data;
+	const struct udma_soc_data *soc_data;
+
+	struct udma_tpl bchan_tpl;
+	struct udma_tpl tchan_tpl;
+	struct udma_tpl rchan_tpl;
+
+	size_t desc_align; /* alignment to use for descriptors */
+
+	struct udma_tisci_rm tisci_rm;
+
+	struct k3_ringacc *ringacc;
+
+	struct work_struct purge_work;
+	struct list_head desc_to_purge;
+	spinlock_t lock;
+
+	struct udma_rx_flush rx_flush;
+
+	int bchan_cnt;
+	int tchan_cnt;
+	int echan_cnt;
+	int rchan_cnt;
+	int rflow_cnt;
+	int tflow_cnt;
+	unsigned long *bchan_map;
+	unsigned long *tchan_map;
+	unsigned long *rchan_map;
+	unsigned long *rflow_gp_map;
+	unsigned long *rflow_gp_map_allocated;
+	unsigned long *rflow_in_use;
+	unsigned long *tflow_map;
+
+	struct udma_bchan *bchans;
+	struct udma_tchan *tchans;
+	struct udma_rchan *rchans;
+	struct udma_rflow *rflows;
+
+	struct udma_chan *channels;
+	u32 psil_base;
+	u32 atype;
+	u32 asel;
+};
+
+struct udma_desc {
+	struct virt_dma_desc vd;
+
+	bool terminated;
+
+	enum dma_transfer_direction dir;
+
+	struct udma_static_tr static_tr;
+	u32 residue;
+
+	unsigned int sglen;
+	unsigned int desc_idx; /* Only used for cyclic in packet mode */
+	unsigned int tr_idx;
+
+	u32 metadata_size;
+	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
+
+	unsigned int hwdesc_count;
+	struct udma_hwdesc hwdesc[];
+};
+
+enum udma_chan_state {
+	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
+	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
+	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
+};
+
+struct udma_tx_drain {
+	struct delayed_work work;
+	ktime_t tstamp;
+	u32 residue;
+};
+
+struct udma_chan_config {
+	bool pkt_mode; /* TR or packet */
+	bool needs_epib; /* EPIB is needed for the communication or not */
+	u32 psd_size; /* size of Protocol Specific Data */
+	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
+	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
+	bool notdpkt; /* Suppress sending TDC packet */
+	int remote_thread_id;
+	u32 atype;
+	u32 asel;
+	u32 src_thread;
+	u32 dst_thread;
+	enum psil_endpoint_type ep_type;
+	bool enable_acc32;
+	bool enable_burst;
+	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
+
+	u32 tr_trigger_type;
+	unsigned long tx_flags;
+
+	/* PKDMA mapped channel */
+	int mapped_channel_id;
+	/* PKTDMA default tflow or rflow for mapped channel */
+	int default_flow_id;
+
+	enum dma_transfer_direction dir;
+};
+
+struct udma_chan {
+	struct virt_dma_chan vc;
+	struct dma_slave_config	cfg;
+	struct udma_dev *ud;
+	struct device *dma_dev;
+	struct udma_desc *desc;
+	struct udma_desc *terminated_desc;
+	struct udma_static_tr static_tr;
+	char *name;
+
+	struct udma_bchan *bchan;
+	struct udma_tchan *tchan;
+	struct udma_rchan *rchan;
+	struct udma_rflow *rflow;
+
+	bool psil_paired;
+
+	int irq_num_ring;
+	int irq_num_udma;
+
+	bool cyclic;
+	bool paused;
+
+	enum udma_chan_state state;
+	struct completion teardown_completed;
+
+	struct udma_tx_drain tx_drain;
+
+	/* Channel configuration parameters */
+	struct udma_chan_config config;
+	/* Channel configuration parameters (backup) */
+	struct udma_chan_config backup_config;
+
+	/* dmapool for packet mode descriptors */
+	bool use_dma_pool;
+	struct dma_pool *hdesc_pool;
+
+	u32 id;
+};
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

