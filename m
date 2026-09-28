Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F4D4825C1;
	Mon, 28 Sep 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584929; cv=fail; b=qOOccGBKt3Ct2K6XztK2RldtPpnaEaOgAnEUypLf1A06A+sL3CXsOEQATIpjA0qfXdJDXxJ7SWPv+xz30Ej0JHm5dUkVBgsVOEW7j9t3FO4atZ4PLiGmM5+yvkuSvc46ZMkYr5toTQvTdP7w7jnJscIWxMlq/lzAgO8giMkz1uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584929; c=relaxed/simple;
	bh=Sd3oRo6/tfQgCeLKXGy00IXRQnw4FXYIaG5+P5j3JAQ=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=gJhcmWShYP3v0vIovzEqUHmTCV7Sux+EqXMGFX96w174RhM5Kf0fI4+mNOinJNHB/AhpXx1eTy11Ij9g9209A5hUUHhLBYsxZ25hRQ2rvySLGHRYcicO/MBimRN39wy3fZ7RErHlDUIoyaSkcVhmy3PtRg27z8zNEMiVgSY/SNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MydAQWFA; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AcaNsMD2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MydAQWFA";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AcaNsMD2"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S80tYL1238061;
	Mon, 28 Sep 2026 03:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=u5WEfQALvQN8NAyc16E97p/lWq8gIhWAdxd4gz4W/
	Ic=; b=MydAQWFAhBUOLaKUbUkhuQBqe+OUQfJQWKa+oLtxuwZiMcUeHg39BO21y
	Mb+KWyq8iidbEQ++8cnnRcImSx5dpgcmaO/3nzpCRxxbL3fhMVPvGzuxkOiHHhL6
	g/adGchrCxqa9t1NKUjapqRQ/VOxUuj29xgHUojzAD36doVqGAvgbn8p+NVnxWzk
	OIZsUZUz04IvoLFPu6Wh8ba9IXpYp8ASIKwhB8nPF0WiQs5GCYqky5AJMugaT8Yw
	rzL8eI6fopQkaqdBezK8y2k4zGHyP374OFGnnsWTcXie5VpzQ7me9rwGGSqnU4bt
	0f88JRcfKOKlb8imGKrmMfeynF9Mg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nmp7x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:41:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUeQ44bsa+7o+7Xn4BPmlO6lhTVeEw0h27/pIeZnmfrQChA4sCfhe2OnVpqc2OylkSjuaBISbt9FqrUA9+rKFGTo14kAPTpYrcGa7MFRiuqM9LdIaimKTRNvWKVCQa72K77xpmPRv2lgHM7Bv0RZ4gz0BRAd7ZSKRanh8wkxGlFW3LZR2eb0j5qvdmRTxo51VueSgRJBHiQQqhfzQ/hSmA6Zl4lMAY6yloxngkCKogEMhY17Yz9DhXPI9YWJ7kqxBKIcJlrXsPBqHwu3Dfpl3L8UiclJLf4dwKuqkm3W64A0TZAbpKf9q9HvdVH5n627JpXWWMtKkakJSCpRv9GKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5WEfQALvQN8NAyc16E97p/lWq8gIhWAdxd4gz4W/Ic=;
 b=iNnZwdUJoPOtFUtOEHzx2RAk5UEaAP5d6stllSMwy0ABcTEfI/Sz4IHfltFKt+t8jHLxMtBiguIx4a9wFd2LKx0oxrnQjxgHZrXPa5t0Rf2RV3QK+yTX0QoUYoj/ug35oBc2urcx2HK+44r023ACOilwSr6pBguaxKgU3SsSNEVFrizB7JfhIaCCcw5f/uUuq7zifHxahZaU98tVqFe+dYcmn0S8fFHxsrWG4C+vtE/hrAaX8mRFR21gNkUiFE+Y11FeoMvsHoZx6dh49lEiDYOmsTStk4Zi8ib1PZpfsNDx9rBc7W7V3YQRQGwf/qt49vKwCzcN71piQ3nviNuyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5WEfQALvQN8NAyc16E97p/lWq8gIhWAdxd4gz4W/Ic=;
 b=AcaNsMD2w59yUGD1MxOEZyCowxScMjoZ/V+UiaOSwzA2dxEmYrsk0ms9YxUV+tQIaAiYLzRF8rShBE6dk0Ol6DhcHz0lh/yyMssf5CoW5xmWZp8yzew0j8Nwdk3Jg4eFB6qjlOnFt5r9tQ61lXsKbjJ7A3Lpo0oxXmYt9JE7Yl4=
Received: from BN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:e6::25)
 by LV8PR10MB7727.namprd10.prod.outlook.com (2603:10b6:408:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:40:52 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::59) by BN0PR03CA0020.outlook.office365.com
 (2603:10b6:408:e6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:40:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:52 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:22 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:40:22 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedl3686893;
	Mon, 28 Sep 2026 03:40:18 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-18-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-18-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477464.77164.14142591296597152152.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|LV8PR10MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f2c58b-b45a-4e21-7488-08df1d3c3448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ugh3D2o4xtKkVV4YoHVBHHln6Ptzz7Yba0exAzTTjCgLqpz089MLUysjpTYYoYqvSh3qcSz3qqUWMPfAeTT+NxLwyzLbPrx4D0eHKJjOWURYUMaG6kySoesjhtvRYKBEKoUHtxt9qED8clyOGjj7ytviTxHreT/yzuF0oKl8vgE0+v01FLO7rE6OiGS/ic3XGV5kpKvXiLQ9jx2eM+5fOkJFdvaJ4aPpF483EuN/TNLjCWSsABetzIGMJwqpOnNmHGLYE/HEkTUz63R9M8oQu4BfhFbVoFhpWthQ7faI+pEWj0tcKsjHEm5iW5lZ8pV8CRnUQweWtNtxxCZJwvFmEfZVCw+6FxlD34pxuA1NoA0q+bKEAhx0hqbFBjODvhIDJT8g2RjQVBp5+XOIFLVskg2mICprm+1yo5Z3NNMDOqoEci9vAVxzXLSdZjPxn1RGrKPzyqAdHe0V3FIN4MfOsFRND9cWQFhVU+5LZpVKoHDa083tpf9KsIcsXWdTQrOaY5yBFufOF6ittE74VaRbsh+wOrdQdIp1glxpEi1iWeUvX/vSs1MzM/RPM135N9SeISpaZVrWrXnZRiOn2o5hoeG02xULrdNZJc4pdbCRxH8G6wY/6I2IBlAw8Kfu30y2wM9kVjQdhdJcf0ITsFXkp14OuOsfOBSJplz4NTg0Egu4wROyr09JPAjXXFc98F/jxzrv1kzjqYJ/Gjak07nBtg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nlLP44931QBWRzQqH0uvOYCTQdrEjw4QTWlezuDrpufQfARsF9+oq8LO4VdQNOEQDNZ5HUMB2x5qcYZt4RHr6AjHBREY+KTu4brhucSCSj/YNHc+0BOXCQ1GfBKAD58D5ZdlrlGO+c2K2KdtXyOyelW3mqVtQL7Q95YrJdF3lC5+rQc0cKhwUAebRHLsubY8o8orfTe8L5BJOesHpSF7Cq7hsCVg3MtGIw8wPWMnHoDPJXm9Mn/NU+ajVuxzxHaoZl0SMK7LiJopgLrlGQOxgHuHDxxF45jQAcl6I2ZAggAjG6sdcinlYKqRlqTknoVDMiVbKWH4cmK3J01888aC2m4bUc34wn2RG+m3870OF3a4NKmPnmCVScm5fVoOlDFeO97evMM2KvQafm6Kq96y/VVyVa69x22T7va+ul75oe6q9kkhmojP3LY4SmlwGP0t
X-Exchange-RoutingPolicyChecked:
	WkoJpZT3PJSbAtRXlBS58wpRd+P85WDU3ZM7QaQL6S94c2hV6WXvSXfbEaktneeUYZdnwfrYOFSPgUS+Kqe4KbPU4TMJMEq1yEdundk59o2Rirbs5UkZt8dD3nr/MzSTfcP6ct/OJa73GXh5UoPn2jlaN4Dzni1fjYwbFaC9CGHdUVt0GOr55rKhqzsbR6cGkRViuBO/mA59kl4E7v09oisegMtvvujBHa7fWSrGoVeGjtvnJPUArMPF9SaaoOji4FaZR0iZILDmOlPLfjKF33NvRMNC2iPnDfvaBSqFPOZwk5+ouNDjeBcBXeEEtvwo8Zqpmq4gOTvaYmQ/qpOX/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:52.1128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f2c58b-b45a-4e21-7488-08df1d3c3448
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7727
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX9paR6vmT8QQf
 DUGLDXRchOISIOJ0pC5actZo8Tuyzva00/3GBV01oaLIgDpWTl5iMPZrm7ykFVXuEslyIePQ9w8
 qj1oOLfRoKouRxwnnO8npwPG0f84/rM=
X-Proofpoint-ORIG-GUID: mDEXRyWH3wbnNXKLl4bZpEpW-PcCkFVm
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6aba2855 cx=c_pps
 a=9V9/KAGQR/RGwytZTnC4xw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=tcDO45zS0_a16GBtfy4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mDEXRyWH3wbnNXKLl4bZpEpW-PcCkFVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX2hbPY1OI/Nnm
 7L44Kr4fx2W/MWiaQ+GNsdAzZ6vBD7KrviuJ7HS6AUeFymuCSO69Yf3Mx+rNppnpsCvMCgwKg0q
 16S1P5SIDPGc26bMvduopCtdtVaPV2+UCiH/kxk49iEfhLrLf6LaogBgiebr4gvTy7P/GJm6i6n
 OGHau+m3mt9qOqnJ6PiRx2hEsT0l/Af7FFEkJX9ZscJy/PvD9bCWBqka/w8VkRoxGYYRTqeQceO
 2YSoVqwWJfTYx/TR0nm3EMgLDlJaTJQXYCznWQPomxPZBgRvYuaXL+eSuB/rH31s3BLSTNhD3DN
 YlFl+NQZiYkSj8cKV90kqxdWVhUminVFVQ+QOrSPkQ9WXQYmDyEHoAFhKSpahn38AVc3n7cUCqe
 bfYveBMkG/igK4WkfGGb2cibE65+0IxpGxRVFDsPPkKODqeAkjoK+7oO1v/hbc2FF/sdLlNoJ+O
 Ht5Qf47Sp2dB12K+Mjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

> The PKTDMA V2 is different than the existing PKTDMA supported by the
> k3-udma driver.
> 
> The changes in PKTDMA V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single
>   peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to
>   PEER registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index 30cb8044ff10..5fa3a7b8d202 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2465,9 +2465,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
>  	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
>  				  GFP_KERNEL);
> -	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
> -	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> -				  GFP_KERNEL);
> +	if (ud->match_data->version == K3_UDMA_V1) {
> +		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
> +		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> +					  GFP_KERNEL);
> +	} else {
> +		ud->rchan_map = ud->tchan_map;
> +		ud->rchans = ud->tchans;
> +		ud->chan_map = ud->tchan_map;
> +		ud->chans = ud->tchans;
> +	}
>  	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
>  					sizeof(unsigned long),
>  					GFP_KERNEL);
> @@ -2566,13 +2573,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
>  		}
>  		break;
>  	case DMA_TYPE_PKTDMA:
> -		dev_info(dev,
> -			 "Channels: %d (tchan: %u, rchan: %u)\n",
> -			 ch_count,
> -			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> -						       ud->tchan_cnt),
> -			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> -						       ud->rchan_cnt));
> +		if (ud->match_data->version == K3_UDMA_V1) {
> +			dev_info(dev,
> +				 "Channels: %d (tchan: %u, rchan: %u)\n",
> +				 ch_count,
> +				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> +							       ud->tchan_cnt),
> +				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> +							       ud->rchan_cnt));
> +		} else {
> +			dev_info(dev,
> +				 "Channels: %d (tchan + rchan: %u)\n",
> +				 ch_count,
> +				 ud->chan_cnt - bitmap_weight(ud->chan_map,
> +							      ud->chan_cnt));
> +		}
>  		break;
>  	default:
>  		break;
> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 70eaf7ee57e6..996c130b10f4 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
>  		goto out_put_spec;
>  
>  	thread_id = dma_spec.args[0];
> +
> +	/*
> +	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
> +	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
> +	 * PSI-L thread ID before the common path checks the direction bit.
> +	 */
> +	if (common->udmax->match_data->version == K3_UDMA_V2 &&
> +	    xudma_is_pktdma(common->udmax)) {
> +		struct psil_endpoint_config *ep_cfg;
> +		u32 psil_thread_id;
> +		bool dev_to_mem;
> +
> +		ep_cfg = psil_get_ep_config_by_id(thread_id, true,
> +						  &psil_thread_id, &dev_to_mem);
> +		if (IS_ERR(ep_cfg)) {
> +			dev_err(common->dev,
> +				"No PSI-L config for flow %u\n", thread_id);
> +			ret = PTR_ERR(ep_cfg);
> +			goto out_put_spec;
> +		}
> +		thread_id = psil_thread_id;
> +	}
> +
>  	if (dma_spec.args_count == 2) {
>  		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
>  			dev_err(common->dev, "Invalid channel atype: %u\n",
> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
> index 44c097fff5ee..525155d3bb51 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -174,16 +174,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
>  
>  int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
>  {
> -	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
> +	if (ud->match_data->version == K3_UDMA_V1) {
> +		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
>  
> -	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
> +		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
> +	}
> +	struct platform_device *pdev = to_platform_device(ud->dev);
> +	char irq_name[10];
> +
> +	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }
>  EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
>  
>  int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
>  {
> -	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
> +	if (ud->match_data->version == K3_UDMA_V1) {
> +		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
> +
> +		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
> +	}
> +	struct platform_device *pdev = to_platform_device(ud->dev);
> +	char irq_name[10];
>  
> -	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
> +	snprintf(irq_name, sizeof(irq_name), "rx-%u", udma_rflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }
>  EXPORT_SYMBOL(xudma_pktdma_rflow_get_irq);
> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index ba3042e866ca..a71471aa7707 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
> @@ -578,7 +578,7 @@ static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
>  
>  	rflow = uc->rflow;
>  	if (ud->tflow_cnt)
> -		fd_ring_id = ud->tflow_cnt + rflow->id;
> +		fd_ring_id = rflow->id;
>  	else
>  		fd_ring_id = uc->rchan->id;
>  	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
> @@ -770,6 +770,148 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
>  	return ret;
>  }
>  
> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	struct udma_dev *ud = to_udma_dev(chan->device);
> +	struct platform_device *pdev = to_platform_device(ud->dev);
> +	char irq_name[10];
> +	u32 irq_ring_idx;
> +	int ret;
> +
> +	/*
> +	 * Make sure that the completion is in a known state:
> +	 * No teardown, the channel is idle
> +	 */
> +	reinit_completion(&uc->teardown_completed);
> +	complete_all(&uc->teardown_completed);
> +	uc->state = UDMA_CHAN_IS_IDLE;
> +
> +	switch (uc->config.dir) {
> +	case DMA_MEM_TO_DEV:
> +		/* Slave transfer synchronized - mem to dev (TX) transfer */
> +		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
> +			uc->id);
> +
> +		ret = udma_v2_alloc_tx_resources(uc);
> +		if (ret) {
> +			uc->config.remote_thread_id = -1;
> +			return ret;
> +		}
> +
> +		uc->config.src_thread = ud->psil_base + uc->tchan->id;
> +		uc->config.dst_thread = uc->config.remote_thread_id;
> +		uc->config.dst_thread |= K3_PSIL_DST_THREAD_ID_OFFSET;
> +
> +		irq_ring_idx = uc->config.mapped_channel_id;
> +		break;
> +	case DMA_DEV_TO_MEM:
> +		/* Slave transfer synchronized - dev to mem (RX) transfer */
> +		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
> +			uc->id);
> +
> +		ret = udma_v2_alloc_rx_resources(uc);
> +		if (ret) {
> +			uc->config.remote_thread_id = -1;
> +			return ret;
> +		}
> +
> +		uc->config.src_thread = uc->config.remote_thread_id;
> +		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
> +					K3_PSIL_DST_THREAD_ID_OFFSET;
> +
> +		irq_ring_idx = uc->config.mapped_channel_id;
> +		udma_write(uc->rflow->reg_rt, UDMA_RX_FLOWRT_RFA, BIT(28));
> +		break;
> +	default:
> +		/* Can not happen */
> +		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
> +			__func__, uc->id, uc->config.dir);
> +		return -EINVAL;
> +	}
> +
> +	/* check if the channel configuration was successful */
> +	if (ret)
> +		goto err_res_free;
> +
> +	if (udma_is_chan_running(uc)) {
> +		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
> +		ud->reset_chan(uc, false);
> +		if (udma_is_chan_running(uc)) {
> +			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
> +			ret = -EBUSY;
> +			goto err_res_free;
> +		}
> +	}
> +
> +	uc->dma_dev = dmaengine_get_dma_device(chan);
> +	uc->hdesc_pool = dma_pool_create(uc->name, uc->dma_dev,
> +					 uc->config.hdesc_size, ud->desc_align,
> +					 0);
> +	if (!uc->hdesc_pool) {
> +		dev_err(ud->ddev.dev,
> +			"Descriptor pool allocation failed\n");
> +		uc->use_dma_pool = false;
> +		ret = -ENOMEM;
> +		goto err_res_free;
> +	}
> +
> +	uc->use_dma_pool = true;
> +
> +	uc->psil_paired = true;
> +
> +	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
> +
> +	if (uc->config.dir == DMA_MEM_TO_DEV)
> +		snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);
> +	else
> +		snprintf(irq_name, sizeof(irq_name), "rx-%u", irq_ring_idx);
> +	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
> +	if (uc->irq_num_ring < 0) {
> +		ret = uc->irq_num_ring;
> +		goto err_res_free;
> +	}
> +
> +	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
> +			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
> +
> +	if (ret) {
> +		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
> +		goto err_irq_free;
> +	}
> +
> +	uc->irq_num_udma = 0;
> +
> +	udma_reset_rings(uc);
> +
> +	if (uc->tchan)
> +		dev_dbg(ud->dev,
> +			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
> +			uc->id, uc->tchan->id, uc->tchan->tflow_id,
> +			uc->config.remote_thread_id);
> +	else if (uc->rchan)
> +		dev_dbg(ud->dev,
> +			"chan%d: rchan%d, rflow%d, Remote thread: 0x%04x\n",
> +			uc->id, uc->rchan->id, uc->rflow->id,
> +			uc->config.remote_thread_id);
> +	return 0;
> +
> +err_irq_free:
> +	uc->irq_num_ring = 0;
> +err_res_free:
> +	udma_free_tx_resources(uc);
> +	udma_free_rx_resources(uc);
> +
> +	udma_reset_uchan(uc);
> +
> +	if (uc->use_dma_pool) {
> +		dma_pool_destroy(uc->hdesc_pool);
> +		uc->use_dma_pool = false;
> +	}
> +
> +	return ret;
> +}
> +
>  static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
>  					 dma_cookie_t cookie,
>  					 struct dma_tx_state *txstate)
> @@ -1032,11 +1174,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
>  	.rchan_cnt = 128,
>  };
>  
> +static struct udma_match_data pktdma_v2_am62l_data = {
> +	.type = DMA_TYPE_PKTDMA,
> +	.version = K3_UDMA_V2,
> +	.psil_base = 0x1000,
> +	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
> +	.flags = UDMA_FLAGS_J7_CLASS,
> +	.statictr_z_mask = GENMASK(23, 0),
> +	.burst_size = {
> +		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
> +		0, /* No H Channels */
> +		0, /* No UH Channels */
> +	},
> +	.tchan_cnt = 97,
> +	.rchan_cnt = 97,
> +	.chan_cnt = 97,
> +	.tflow_cnt = 112,
> +	.rflow_cnt = 112,
> +};
> +
>  static const struct of_device_id udma_of_match[] = {
>  	{
>  		.compatible = "ti,am62l-dmss-bcdma",
>  		.data = &bcdma_v2_am62l_data,
>  	},
> +	{
> +		.compatible = "ti,am62l-dmss-pktdma",
> +		.data = &pktdma_v2_am62l_data,
> +	},
>  	{ /* Sentinel */ },
>  };
>  
> @@ -1055,15 +1220,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
>  	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
>  		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
>  
> -	ud->bchan_cnt = ud->match_data->bchan_cnt;
> -	/* There are no tchan and rchan in BCDMA_V2.
> +	/* There are no tchan and rchan in BCDMA_V2 and PKTDMA_V2.
>  	 * Duplicate chan as tchan and rchan to keep the common code
> -	 * in k3-udma-common.c functional for BCDMA_V2.
> +	 * in k3-udma-common.c functional.
>  	 */
> -	ud->chan_cnt = ud->match_data->chan_cnt;
> -	ud->tchan_cnt = ud->match_data->chan_cnt;
> -	ud->rchan_cnt = ud->match_data->chan_cnt;
> -	ud->rflow_cnt = ud->chan_cnt;
> +	if (ud->match_data->type == DMA_TYPE_BCDMA) {
> +		ud->bchan_cnt = ud->match_data->bchan_cnt;
> +		ud->chan_cnt = ud->match_data->chan_cnt;
> +		ud->tchan_cnt = ud->match_data->chan_cnt;
> +		ud->rchan_cnt = ud->match_data->chan_cnt;
> +		ud->rflow_cnt = ud->chan_cnt;
> +	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
> +		ud->chan_cnt = ud->match_data->chan_cnt;
> +		ud->tchan_cnt = ud->match_data->tchan_cnt;
> +		ud->rchan_cnt = ud->match_data->rchan_cnt;
> +		ud->tflow_cnt = ud->match_data->tflow_cnt;
> +		ud->rflow_cnt = ud->match_data->rflow_cnt;
> +	}
>  
>  	for (i = 1; i < V2_MMR_LAST; i++) {
>  		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
> @@ -1117,6 +1290,7 @@ static int udma_v2_probe(struct platform_device *pdev)
>  	ud->reset_chan = udma_v2_reset_chan;
>  	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
>  	ud->bcdma_setup_sci_resources = NULL;
> +	ud->pktdma_setup_sci_resources = NULL;
>  
>  	ret = udma_v2_get_mmrs(pdev, ud);
>  	if (ret)
> @@ -1124,7 +1298,17 @@ static int udma_v2_probe(struct platform_device *pdev)
>  
>  	struct k3_ringacc_init_data ring_init_data = {0};
>  
> -	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
> +	if (ud->match_data->type == DMA_TYPE_BCDMA) {
> +		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
> +	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
> +		ring_init_data.num_rings = ud->rflow_cnt;

Hmm, how does this work? Shouldnt there be ring allocated for both tflow
and rflow and hence tflow_cnt + rflow_cnt?

-- 
Vignesh

