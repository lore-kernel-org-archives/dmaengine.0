Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DA442FBE;
	Tue, 15 Sep 2026 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455164; cv=fail; b=uEYtAJ47MOu9pi9cOnhUV3lJqUT3tQ74noxvVntDkO+M4NLsqWhVXR8xD9BqzGsDlYztsFnkEisbsfbA38bJqPdDfeAC50UmiiIjmXa9sgdbFJWECbMKqFEXhj6tij6Cn1UEi9U+yYjnxoDKm9FphNKiLjCrTEPpaRHeEFxpT6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455164; c=relaxed/simple;
	bh=m+uqZc8qUaQTxT3BD7jWGhpuQcKkGD5cLlLPXj/Xp8U=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=c5wrnhBuiSSPGZ0DtXH6y3tPbhZxexnZnRc2rCK7lzGGRfgnP9+SUDfrCiFiMUo48S5oKf4/0IeuONOYA8B3GdsQIB+aYLY4yO36fRM1w3hIhR0HMOLdtf46YPWfGxMbvMk+p4sldP9J49RxuGoBDMSKNf94NTpE7/eyCL3Nic4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=O1P5+wkx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vi+jTw12; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="O1P5+wkx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vi+jTw12"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zgk43517045;
	Tue, 15 Sep 2026 01:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gO+09B3mzVCYWw6GLnd3mDddnnIWvBCizIk4/v5T6
	FM=; b=O1P5+wkxPV4xZ+iob5iHGUOi3tRjERCe0rl+rnB9+oDQYPgYgoel9Ls2O
	w/0DIhK4zmnrWG3CnnxzFAmWP93bO6R+yx0Nx3VyhdVJfUqG6usmghWlT8Fow+sp
	lHG1T/AJrYpDeiz5dgAr/FSTMwtfTd/wMvayQkUQ7/f+VP03+M/w55h7Z3snoIBW
	rV0aQv9nI6V5QMwYHTxQHvWIHlrlP9XchhbG7mfLQfWvZUbvzuroS09qUUC376hM
	ZsoO29uPEqsc53wFtQ1jTVjHnlMl+ZtLEPnOZ6eZpUT12q67Btk9njrzhYXzOs3L
	MwfzuYaoVzyRFPdi2QqSLS/CC2EOA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gppxsk9d2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 01:52:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwIYMDnHPlSxkYEbBWbHE+H370XdDcCbLvR6/h3x1CsAURihcN4pnE72ubOOpQeOPp50nnhcbz6tuspH+9VIaBD/0+dK4rSEjc5jxvepEH+o+PoVl1mLcVJeLJkcanv8e94l3gCX9z8pmpHFeiCq0uqVeVlk6Og5nSVMjNJ38RJqPD5PQJYCKBHrMhXmRRzcLQfoq7gQM1tz11Ju7oqdS0H+MXglTx9CZZ4g2qUo+ALiOkt1iqTXOSMtQG+3Yr6tuhoo1H9qNdU2XyUs8MuSPxfwQc7xJcRaBkAMihQkZOflnS95F9AXO0ByPUywhxMteOrOvI9hchMeb0eB0s+BSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO+09B3mzVCYWw6GLnd3mDddnnIWvBCizIk4/v5T6FM=;
 b=EsjLVCJ2Ryo7Y2iBa8zVoUB8W/Dcs/QvHfZTirAvBZYrwwy8fJVmwJvoqVuj0L5vq0zynvbFYv9bElQSeAS12757n0sGu4vwIm9rJgEyJfhyzSyqAq95EoMmYHcJXvkfroxeTpukngE3qK8v+A+GY9YO+Tohj7OsgvcigaZxVMZaiS8ZeCazSfz2NqH6hYVXUamO7YpHzzhIiNBgjkX60MW2NVxeaHokwRsu1Ecpb/x2kfmPix/G6yjoRlvQsxHcD+23txqwgJ+a+u7bz/pUBFboISJyCzkxHhPLrPoFx4LM+kuUsEVwGj7piKG5RUxm3vPJJ7TH5gZBqyWZqdxO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO+09B3mzVCYWw6GLnd3mDddnnIWvBCizIk4/v5T6FM=;
 b=Vi+jTw12UOrzKAWMm+ULQ+a5nuWHdxJr2zd+T87a4/ZXIdA4JWZnabwjS+/8ALUpcVw7bGRcnh/rMIoQ7A5+EzL7p5IieIG3svr22QMR8lqMvep/zPkk5F6OUk3Em2f9APKHGRJD6h29MflGTflisTvO6OuL3AjehkWQi5a95UE=
Received: from BN9PR03CA0537.namprd03.prod.outlook.com (2603:10b6:408:131::32)
 by DS7PR10MB7155.namprd10.prod.outlook.com (2603:10b6:8:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 06:52:27 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::77) by BN9PR03CA0537.outlook.office365.com
 (2603:10b6:408:131::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 06:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 06:52:27 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:22 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 01:52:22 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F6q8jo3693318;
	Tue, 15 Sep 2026 01:52:18 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260810151423.1948224-17-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-17-s-adivi@ti.com>
Date: Tue, 15 Sep 2026 12:22:00 +0530
Message-ID: <178945512023.2241705.430630523505161878.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|DS7PR10MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: cca17d98-85c9-4169-0152-08df12f5e7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|23010399003|82310400026|376014|1800799024|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	Q4pgVyI6U0IcTXLeKsMKB0V1X+E8NP5kmQgAg2bapRlagCtt3mj8MLEnEQXYdLYscryDe3jBDKppAfl/wdjz/nm+IqeWEWFLTX7+YbAGTDSjm8PA9JYRNxUUhlz9TBYzBifzIcJ5IbSvKNo45JKXy+3GzRgtF0Rj8LS+AQ14YEIEisBVGDrD3iGb0hprwNWNiBOT/Hs/cJOsxppfkutr0ugXU3ZORN27RhQY+N0FJe3Zj88mq9NXb7zRwdQ+fIFZyiyRRn6pWg1elMf+G7gFmNoLahH/jLwQZdw53qmUIsQ6H4FpH6vy1vzXb18rP6zgHQIs0sGqYB1bcg8P7AweaOkMtsQj/asPyQ0ddYNh4px1Odp+bAIKcg+gEUeRPWH8sVAyQYvUVTpYPsy/8XuZ/cUN4jQkv720tGJnokogU/io2NzDZ9abMdLld80CuNM/RAxDRDQEKpirIUcvMfcgKQTY7+cNiqviLLK2IOrmAjBJyzb9Sl0v+c9FamJ8aGVvk7hVMQ2kdubbvRNf4M/DeDasT9c+Lrfi5dsf0t4x09CJPO0ECp0MDhFNUNPuXBLrA5J1HbeZLbE+fRTq4u+Mday8ADPsDcxSeBcTce1jsck5BNBgUzX1wKEkpOIY+OEy2J1bXV6T5mVOH2gCMrHvGw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(82310400026)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MUWnWr/0WJhFK/CsqdCOFDfL1vftFR1sIF4lT1xSMWAQJgwHbVfIWHcYEX/fFwhMF4G8oEJOv9IRRKNsNQk/ALh/AArRLoqkd7M+R7tCFFs6yXN2etmDMv6t9/xwmcLuMoSTVzwh+1S/iYMdQLiG+sTQHtXMXp1lpYqqFs+PI7g81Rqu2BFBcxaEnag1lacN10KV8vwaReIVcLvb8LT5UHygTUEqKKwy2mowwP+dXkGch3qMFXypymMxuqV66Q7co9F0sgeggoqGcLFAXBwItR/mEe2YBddfmRipSJ5+P1yWmCYRZGjgeYHQfGGgGKg+V/T2AaT4d5pJ403TWbMZL5FXQWvJZ3d5WgFxQeEx1yM3O3SovRZIlzxPz3MEI64i+eDnAS4frjNkSTUUj/rXkBgJqpv0cTrncbSzJ3tgXEzJiQZOC+5/2Q3MH2mGSkJd
X-Exchange-RoutingPolicyChecked:
	U2lvFJdqXuBsiXlV+abwCaAsYIW17aCkOnwX2mShsJEmUB1JiQNqLQVfdITMob5HI+HkB1GHesmE9py4mUk6Zf38lhoMnU4e4wSij9UxJ7e8pxIEy+CaA5E+JD3Ikow/0qgFLaPU9D0B7/jt3I7NVjJ1P2/GZSUZH1Y4Llge+XS64niFf49nkXaqy7Di6Stw2zYdB+Az0AlFEU1tyUSALXL5Iib+iJyF8weY9dtepn1tBdaDN4ij2jLKdfj0SYbcjpB3u1N16MiA1m7YMOsrQZmEQkMcTWusTrs6tDXOfN5EJsl+FtEGWeH7PorrElgcNo+Jn+UVIoxFDB5LfG+GsQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 06:52:27.0713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca17d98-85c9-4169-0152-08df12f5e7a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7155
X-Proofpoint-GUID: r-ICPRPAlSDMgOVPCpervpe1MWyrn8SH
X-Proofpoint-ORIG-GUID: r-ICPRPAlSDMgOVPCpervpe1MWyrn8SH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfXzJgy4OzV2Lc3
 HkffJncXtyiTTiyY4YDQNSJTCvnzgSFnoOOz8HfSdKNrDj/GG78UmWQd/vpqOmzIAgpUXSLke+j
 ltRi7riB+MZRChK8jM/6dkoUlBLcmtFumHX8wHZ/uXNpiavPpLMJ/wsX6wvUWCEm/+p3l04junS
 iY4RPHUC4eWxp5RV45KC0mqPdrZCdf4+a2wa1OehY9ukFYe3MX4/oACJwV5yhRsSp5eH+ppxiYL
 iUvaUvDmxR5rpKQMgQdNhYlxRh2dXb44Uaya96QhptYdhYBSl4b7PvvoJ3/ZKqTTTq3O1cht7yb
 ynIJ2NQbzoEjOVrUwp6Xn/LTxcUghsYCvpyriFB4YqBL2bDTSdwspRfS3DlQG4MnrlcT13O72EQ
 2Lk/gWnIxnBhB7CLBj7YQeWRv46FCjgcUrGPZiRcqERrq87GS0BcY6bxU5mkS2lpdbYPE7+zDD8
 FdpYxm1NXLWQlzrQBig==
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aa8eb31 cx=c_pps
 a=33ZETTsaPBFHggYVnTYjDg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=WSNNozMMwukpL_rx68QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX8nmOxSJlU22g
 glgBQ8J26qQJFx2KatocS1Kx8IASJUSp6a6aN2JBvbQwj+lKFzIEvT784vlvZzjDufW6AVV9/32
 f4NYNIyQREdNXCpDPjch6W6K1QmgdwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150096

> Add support for BCDMA_V2.
> 
> The BCDMA_V2 is different than the existing BCDMA supported by the
> k3-udma driver.
> 
> The changes in BCDMA_V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to PEER
>   registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.
> 
> Also, since a version member is introduced in the match_data, Add
> version v1 in match_data of SoCs using v1 DMA.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index 712e45601545..40713bd1e8e9 100644
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
> @@ -49,6 +49,18 @@ config TI_K3_UDMA
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
>  
> +config TI_K3_UDMA_V2
> +	tristate "Texas Instruments K3 UDMA v2 support"
> +	depends on ARCH_K3
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	select TI_K3_UDMA_COMMON
> +	select TI_K3_RINGACC
> +	select TI_K3_PSIL
> +        help
> +	  Enable support for the TI UDMA (Unified DMA) v2 controller. This
> +	  DMA engine is used in AM62L.
> +
>  config TI_K3_UDMA_COMMON
>  	tristate
>  	default n
> @@ -63,7 +75,7 @@ config TI_K3_UDMA_GLUE_LAYER
>  
>  config TI_K3_PSIL
>         tristate
> -       default TI_K3_UDMA
> +       default TI_K3_UDMA || TI_K3_UDMA_V2
>  
>  config TI_DMA_CROSSBAR
>  	bool
> diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
> index 41bfba944dc6..296aa3421e71 100644
> --- a/drivers/dma/ti/Makefile
> +++ b/drivers/dma/ti/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_TI_CPPI41) += cppi41.o
>  obj-$(CONFIG_TI_EDMA) += edma.o
>  obj-$(CONFIG_DMA_OMAP) += omap-dma.o
>  obj-$(CONFIG_TI_K3_UDMA) += k3-udma.o
> +obj-$(CONFIG_TI_K3_UDMA_V2) += k3-udma-v2.o
>  obj-$(CONFIG_TI_K3_UDMA_COMMON) += k3-udma-common.o
>  obj-$(CONFIG_TI_K3_UDMA_GLUE_LAYER) += k3-udma-glue.o
>  k3-psil-lib-objs := k3-psil.o \
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index 01b66e9f026b..f9dd6edf3eac 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -171,8 +171,13 @@ bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
>  	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
>  		return true;
>  
> -	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
> -	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	if (uc->ud->match_data->version == K3_UDMA_V1) {
> +		peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
> +		bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	} else {
> +		peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
> +		bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	}
>  
>  	/* Transfer is incomplete, store current residue and time stamp */
>  	if (peer_bcnt < bcnt) {
> @@ -319,6 +324,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  	size_t tr_size;
>  	int num_tr = 0;
>  	int tr_idx = 0;
> +	u32 extra_flags = 0;
>  	u64 asel;
>  
>  	/* estimate the number of TRs we will need */
> @@ -342,6 +348,16 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  	else
>  		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
>  
> +	/*
> +	 * BCDMA V2 stalls and stops processing further TRs if a TR's ICNT0
> +	 * is not a multiple of 16 bytes. Setting EOP on every TR (not just
> +	 * the last one) avoids that stall condition. Intentional, not a bug.
> +	 */
> +	if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
> +	    uc->ud->match_data->version == K3_UDMA_V2 &&
> +	    dir == DMA_MEM_TO_DEV)
> +		extra_flags = CPPI5_TR_CSF_EOP;
> +
>  	tr_req = d->hwdesc[0].tr_req_base;
>  	for_each_sg(sgl, sgent, sglen, i) {
>  		dma_addr_t sg_addr = sg_dma_address(sgent);
> @@ -358,7 +374,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  
>  		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
>  			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> -		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
> +		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT | extra_flags);
>  
>  		sg_addr |= asel;
>  		tr_req[tr_idx].addr = sg_addr;
> @@ -372,7 +388,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
>  				      false, false,
>  				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
>  			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
> -					 CPPI5_TR_CSF_SUPR_EVT);
> +					 CPPI5_TR_CSF_SUPR_EVT | extra_flags);
>  
>  			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
>  			tr_req[tr_idx].icnt0 = tr1_cnt0;
> @@ -593,7 +609,7 @@ int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
>  			    enum dma_slave_buswidth dev_width,
>  			    u16 elcnt)
>  {
> -	if (uc->config.ep_type != PSIL_EP_PDMA_XY)
> +	if (uc->config.ep_type != PSIL_EP_PDMA_XY && uc->config.ep_type != PSIL_EP_PDMA_XYMF)
>  		return 0;
>  
>  	/* Bus width translates to the element size (ES) */
> @@ -951,7 +967,8 @@ udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
>  	 * As we are in cyclic mode, we do not know which period might be the
>  	 * last one, so set the flag for each period.
>  	 */
> -	if (uc->config.ep_type == PSIL_EP_PDMA_XY &&
> +	if ((uc->config.ep_type == PSIL_EP_PDMA_XY ||
> +	    uc->config.ep_type == PSIL_EP_PDMA_XYMF) &&
>  	    uc->ud->match_data->type == DMA_TYPE_BCDMA) {
>  		period_csf = CPPI5_TR_CSF_EOP;
>  	}
> @@ -2052,6 +2069,8 @@ int udma_get_tchan(struct udma_chan *uc)
>  		uc->tchan = NULL;
>  		return ret;
>  	}
> +	if (ud->match_data->version == K3_UDMA_V2)
> +		uc->chan = uc->tchan;
>  
>  	if (ud->tflow_cnt) {
>  		int tflow_id;
> @@ -2102,6 +2121,8 @@ int udma_get_rchan(struct udma_chan *uc)
>  		uc->rchan = NULL;
>  		return ret;
>  	}
> +	if (ud->match_data->version == K3_UDMA_V2)
> +		uc->chan = uc->rchan;
>  
>  	return 0;
>  }
> @@ -2383,9 +2404,16 @@ static int bcdma_setup_resources(struct udma_dev *ud)
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
>  	/* BCDMA do not really have flows, but the driver expect it */
>  	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
>  					sizeof(unsigned long),
> @@ -2480,11 +2508,18 @@ int k3_udma_setup_resources(struct udma_dev *ud)
>  	if (ret)
>  		return ret;
>  
> -	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
> -	if (ud->bchan_cnt)
> -		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
> -	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
> -	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
> +	if (ud->match_data->version == K3_UDMA_V1) {
> +		ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
> +		if (ud->bchan_cnt)
> +			ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
> +		ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
> +		ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
> +	} else {
> +		ch_count = ud->bchan_cnt + ud->tchan_cnt;
> +		if (ud->bchan_cnt)
> +			ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
> +		ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
> +	}
>  	if (!ch_count)
>  		return -ENODEV;
>  
> @@ -2506,15 +2541,25 @@ int k3_udma_setup_resources(struct udma_dev *ud)
>  						       ud->rflow_cnt));
>  		break;
>  	case DMA_TYPE_BCDMA:
> -		dev_info(dev,
> -			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
> -			 ch_count,
> -			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
> -						       ud->bchan_cnt),
> -			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> -						       ud->tchan_cnt),
> -			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> -						       ud->rchan_cnt));
> +		if (ud->match_data->version == K3_UDMA_V1) {
> +			dev_info(dev,
> +				 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
> +				 ch_count,
> +				 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
> +							       ud->bchan_cnt),
> +				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> +							       ud->tchan_cnt),
> +				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> +							       ud->rchan_cnt));
> +		} else {
> +			dev_info(dev,
> +				 "Channels: %d (bchan: %u, chan: %u)\n",
> +				 ch_count,
> +				 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
> +							       ud->bchan_cnt),
> +				 ud->chan_cnt - bitmap_weight(ud->chan_map,
> +							      ud->chan_cnt));
> +		}
>  		break;
>  	case DMA_TYPE_PKTDMA:
>  		dev_info(dev,
> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> index 000000000000..b9ce58d1934a
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c
> @@ -0,0 +1,1319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Derived from K3 UDMA driver (k3-udma.c)
> + *  Copyright (C) 2024-2025 Texas Instruments Incorporated - http://www.ti.com
> + *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> + *  Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmapool.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/list.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/sys_soc.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/of_irq.h>
> +#include <linux/workqueue.h>
> +#include <linux/completion.h>
> +#include <linux/iopoll.h>
> +#include <linux/soc/ti/k3-ringacc.h>
> +
> +#include "../virt-dma.h"
> +#include "k3-udma.h"
> +#include "k3-psil-priv.h"
> +
> +static const char * const v2_mmr_names[] = {
> +	[V2_MMR_GCFG] = "gcfg",
> +	[V2_MMR_BCHANRT] = "bchanrt",
> +	[V2_MMR_CHANRT] = "chanrt",
> +};
> +
> +static int udma_v2_check_chan_autopair_completion(struct udma_chan *uc)
> +{
> +	u32 val;
> +
> +	val = udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +	if (val & UDMA_CHAN_RT_CTL_PAIR_TIMEOUT)
> +		return -ETIMEDOUT;
> +	else if (val & UDMA_CHAN_RT_CTL_PAIR_COMPLETE)
> +		return 1;
> +
> +	/* timeout didn't occur and also pairing didn't happen yet. */
> +	return 0;
> +}
> +
> +static bool udma_v2_is_chan_paused(struct udma_chan *uc)
> +{
> +	u32 val, pause_mask;
> +
> +	if (uc->config.dir == DMA_MEM_TO_MEM) {
> +		val = udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +		pause_mask = UDMA_CHAN_RT_CTL_PAUSE;
> +	} else {
> +		val = udma_chanrt_read(uc, UDMA_CHAN_RT_PDMA_STATE_REG);
> +		pause_mask = UDMA_CHAN_RT_PDMA_STATE_PAUSE;
> +	}
> +
> +	if (val & pause_mask)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void udma_v2_decrement_byte_counters(struct udma_chan *uc, u32 val)
> +{
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
> +	if (uc->config.ep_type != PSIL_EP_NATIVE)
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG, val);
> +}
> +
> +static void udma_v2_reset_counters(struct udma_chan *uc)
> +{
> +	u32 val;
> +
> +	val = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
> +
> +	val = udma_chanrt_read(uc, UDMA_CHAN_RT_SBCNT_REG);
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
> +
> +	val = udma_chanrt_read(uc, UDMA_CHAN_RT_PCNT_REG);
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_PCNT_REG, val);
> +
> +	if (!uc->bchan) {
> +		val = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG, val);
> +	}
> +}
> +
> +static int udma_v2_reset_chan(struct udma_chan *uc, bool hard)
> +{
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
> +
> +	/* Reset all counters */
> +	udma_v2_reset_counters(uc);
> +
> +	/* Hard reset: re-initialize the channel to reset */
> +	if (hard) {
> +		struct udma_chan_config ucc_backup;
> +		int ret;
> +
> +		memcpy(&ucc_backup, &uc->config, sizeof(uc->config));
> +		uc->ud->ddev.device_free_chan_resources(&uc->vc.chan);
> +
> +		/* restore the channel configuration */
> +		memcpy(&uc->config, &ucc_backup, sizeof(uc->config));
> +		ret = uc->ud->ddev.device_alloc_chan_resources(&uc->vc.chan);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Setting forced teardown after forced reset helps recovering
> +		 * the rchan.
> +		 */
> +		if (uc->config.dir == DMA_DEV_TO_MEM)
> +			udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +						UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN |
> +						UDMA_CHAN_RT_CTL_FTDOWN,
> +						UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN |
> +						UDMA_CHAN_RT_CTL_FTDOWN);
> +	}
> +	uc->state = UDMA_CHAN_IS_IDLE;
> +
> +	return 0;
> +}
> +
> +static int udma_v2_start(struct udma_chan *uc)
> +{
> +	struct virt_dma_desc *vd = vchan_next_desc(&uc->vc);
> +	struct udma_dev *ud = uc->ud;
> +	int status;
> +
> +	if (!vd) {
> +		uc->desc = NULL;
> +		return -ENOENT;
> +	}
> +
> +	list_del(&vd->node);
> +
> +	uc->desc = to_udma_desc(&vd->tx);
> +
> +	/* Channel is already running and does not need reconfiguration */
> +	if (udma_is_chan_running(uc) && !udma_chan_needs_reconfiguration(uc)) {
> +		udma_start_desc(uc);
> +		goto out;
> +	}
> +
> +	/* Make sure that we clear the teardown bit, if it is set */
> +	ud->reset_chan(uc, false);
> +
> +	/* Push descriptors before we start the channel */
> +	udma_start_desc(uc);
> +
> +	switch (uc->config.dir) {
> +	case DMA_DEV_TO_MEM:
> +		/* Config remote TR */
> +		if (uc->config.ep_type == PSIL_EP_PDMA_XY ||
> +		    uc->config.ep_type == PSIL_EP_PDMA_XYMF) {
> +			u32 val = PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
> +				  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
> +			const struct udma_match_data *match_data =
> +							uc->ud->match_data;
> +
> +			if (uc->config.enable_acc32)
> +				val |= PDMA_STATIC_TR_XY_ACC32;
> +			if (uc->config.enable_burst)
> +				val |= PDMA_STATIC_TR_XY_BURST;
> +
> +			udma_chanrt_write(uc,
> +					  UDMA_CHAN_RT_STATIC_TR_XY_REG,
> +					  val);
> +
> +			udma_chanrt_write(uc,
> +					  UDMA_CHAN_RT_STATIC_TR_Z_REG,
> +					  PDMA_STATIC_TR_Z(uc->desc->static_tr.bstcnt,
> +							   match_data->statictr_z_mask));
> +
> +			/* save the current staticTR configuration */
> +			memcpy(&uc->static_tr, &uc->desc->static_tr,
> +			       sizeof(uc->static_tr));
> +		}
> +
> +		if (uc->config.ep_type == PSIL_EP_PDMA_XYMF)
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_FIFO_SEL_REG, uc->config.fifo_id);
> +
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
> +
> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status != 0, 100, 500, false, uc);
> +
> +		if (status <= 0)
> +			return -ETIMEDOUT;
> +
> +		break;
> +	case DMA_MEM_TO_DEV:
> +		/* Config remote TR */
> +		if (uc->config.ep_type == PSIL_EP_PDMA_XY ||
> +		    uc->config.ep_type == PSIL_EP_PDMA_XYMF) {
> +			u32 val = PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
> +				  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
> +
> +			if (uc->config.enable_acc32)
> +				val |= PDMA_STATIC_TR_XY_ACC32;
> +			if (uc->config.enable_burst)
> +				val |= PDMA_STATIC_TR_XY_BURST;
> +
> +			udma_chanrt_write(uc,
> +					  UDMA_CHAN_RT_STATIC_TR_XY_REG,
> +					  val);
> +
> +			/* save the current staticTR configuration */
> +			memcpy(&uc->static_tr, &uc->desc->static_tr,
> +			       sizeof(uc->static_tr));
> +		}
> +
> +		if (uc->config.ep_type == PSIL_EP_PDMA_XYMF)
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_FIFO_SEL_REG, uc->config.fifo_id);
> +
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
> +
> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status != 0, 100, 500, false, uc);
> +
> +		if (status <= 0)
> +			return -ETIMEDOUT;
> +
> +		break;
> +	case DMA_MEM_TO_MEM:
> +		udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				   UDMA_CHAN_RT_CTL_EN);
> +		udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				   UDMA_CHAN_RT_CTL_EN);
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	uc->state = UDMA_CHAN_IS_ACTIVE;
> +out:
> +
> +	return 0;
> +}
> +
> +static int udma_v2_stop(struct udma_chan *uc)
> +{
> +	uc->state = UDMA_CHAN_IS_TERMINATING;
> +	reinit_completion(&uc->teardown_completed);
> +
> +	if (uc->config.dir == DMA_DEV_TO_MEM) {
> +		if (!uc->cyclic && !uc->desc)
> +			udma_push_to_ring(uc, -1);
> +	}
> +
> +	if (uc->config.dir != DMA_MEM_TO_MEM)
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_PEER_REG(8), UDMA_CHAN_RT_PEER_REG8_FLUSH);
> +
> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN,
> +				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t udma_v2_udma_irq_handler(int irq, void *data)
> +{
> +	struct udma_chan *uc = data;
> +	struct udma_dev *ud = uc->ud;
> +	struct udma_desc *d;
> +
> +	switch (uc->config.dir) {
> +	case DMA_DEV_TO_MEM:
> +		k3_ringacc_ring_clear_irq(uc->rflow->r_ring);
> +		break;
> +	case DMA_MEM_TO_DEV:
> +	case DMA_MEM_TO_MEM:
> +		k3_ringacc_ring_clear_irq(uc->tchan->tc_ring);
> +		break;
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	spin_lock(&uc->vc.lock);
> +	d = uc->desc;
> +	if (d) {
> +		d->tr_idx = (d->tr_idx + 1) % d->sglen;
> +
> +		if (uc->cyclic) {
> +			vchan_cyclic_callback(&d->vd);
> +		} else {
> +			/* TODO: figure out the real amount of data */
> +			ud->decrement_byte_counters(uc, d->residue);
> +			ud->start(uc);
> +			vchan_cookie_complete(&d->vd);
> +		}
> +	}
> +
> +	spin_unlock(&uc->vc.lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t udma_v2_ring_irq_handler(int irq, void *data)
> +{
> +	struct udma_chan *uc = data;
> +	struct udma_dev *ud = uc->ud;
> +	struct udma_desc *d;
> +	dma_addr_t paddr = 0;
> +	u32 intr_status, reg;
> +
> +	switch (uc->config.dir) {
> +	case DMA_DEV_TO_MEM:
> +		intr_status =  k3_ringacc_ring_get_irq_status(uc->rflow->r_ring);
> +		break;
> +	case DMA_MEM_TO_DEV:
> +	case DMA_MEM_TO_MEM:
> +		intr_status =  k3_ringacc_ring_get_irq_status(uc->tchan->tc_ring);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
> +
> +	if (!intr_status)
> +		return IRQ_NONE;	/* Not this channel's interrupt */
> +
> +	reg = udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);

Move this read inside the if() condition below

> +
> +	if (intr_status & K3_RINGACC_RT_INT_STATUS_TR) {
> +		/* check teardown status */
> +		if ((reg & UDMA_CHAN_RT_CTL_TDOWN) && !(reg & UDMA_CHAN_RT_CTL_EN))
> +			complete_all(&uc->teardown_completed);
> +		udma_v2_udma_irq_handler(irq, data);
> +
> +		if (!(intr_status & K3_RINGACC_RT_INT_STATUS_COMPLETE))
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (udma_pop_from_ring(uc, &paddr) || !paddr)
> +		return IRQ_NONE;
> +
> +	spin_lock(&uc->vc.lock);
> +
> +	/* Teardown completion message */
> +	if (cppi5_desc_is_tdcm(paddr)) {
> +		complete_all(&uc->teardown_completed);
> +
> +		if (uc->terminated_desc) {
> +			udma_desc_free(&uc->terminated_desc->vd);
> +			uc->terminated_desc = NULL;
> +		}
> +
> +		if (!uc->desc)
> +			ud->start(uc);
> +
> +		goto out;
> +	}
> +
> +	d = udma_udma_desc_from_paddr(uc, paddr);
> +
> +	if (d) {
> +		dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
> +								   d->desc_idx);
> +		if (desc_paddr != paddr) {
> +			dev_err(uc->ud->dev, "not matching descriptors!\n");
> +			goto out;
> +		}
> +
> +		if (d == uc->desc) {
> +			/* active descriptor */
> +			if (uc->cyclic) {
> +				udma_cyclic_packet_elapsed(uc);
> +				vchan_cyclic_callback(&d->vd);
> +			} else {
> +				if (udma_is_desc_really_done(uc, d)) {
> +					ud->decrement_byte_counters(uc, d->residue);
> +					ud->start(uc);
> +					vchan_cookie_complete(&d->vd);
> +				} else {
> +					schedule_delayed_work(&uc->tx_drain.work,
> +							      0);
> +				}
> +			}
> +		} else {
> +			/*
> +			 * terminated descriptor, mark the descriptor as
> +			 * completed to update the channel's cookie marker
> +			 */
> +			dma_cookie_complete(&d->vd.tx);
> +		}
> +	}
> +out:
> +	spin_unlock(&uc->vc.lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int bcdma_v2_get_bchan(struct udma_chan *uc)
> +{
> +	struct udma_dev *ud = uc->ud;
> +	enum udma_tp_level tpl;
> +	int ret;
> +
> +	if (uc->bchan) {
> +		dev_dbg(ud->dev, "chan%d: already have bchan%d allocated\n",
> +			uc->id, uc->bchan->id);
> +		return 0;
> +	}
> +
> +	/*
> +	 * Use normal channels for peripherals, and highest TPL channel for
> +	 * mem2mem
> +	 */
> +	if (uc->config.tr_trigger_type)
> +		tpl = 0;
> +	else
> +		tpl = ud->bchan_tpl.levels - 1;
> +
> +	/*
> +	 * UDMA V2 uses a static 1:1 mapping between the virtual channel index
> +	 * (uc->id) and the hardware bchan/tchan/rchan index -- unlike V1, which
> +	 * dynamically allocates from a shared pool. Passing uc->id directly to
> +	 * __udma_reserve_*() is intentional, not a bug.
> +	 */
> +	uc->bchan = __udma_reserve_bchan(ud, tpl, uc->id);
> +	if (IS_ERR(uc->bchan)) {
> +		ret = PTR_ERR(uc->bchan);
> +		uc->bchan = NULL;
> +		return ret;
> +	}
> +	uc->chan = uc->bchan;
> +	uc->tchan = uc->bchan;
> +
> +	return 0;
> +}
> +
> +static int bcdma_v2_alloc_bchan_resources(struct udma_chan *uc)
> +{
> +	struct k3_ring_cfg ring_cfg;
> +	struct udma_dev *ud = uc->ud;
> +	int ret;
> +
> +	ret = bcdma_v2_get_bchan(uc);
> +	if (ret)
> +		return ret;
> +
> +	ret = k3_ringacc_request_rings_pair(ud->ringacc, ud->match_data->chan_cnt + uc->id, -1,
> +					    &uc->bchan->t_ring,
> +					    &uc->bchan->tc_ring);
> +	if (ret) {
> +		ret = -EBUSY;
> +		goto err_ring;
> +	}
> +
> +	memset(&ring_cfg, 0, sizeof(ring_cfg));
> +	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
> +	ring_cfg.elm_size = K3_RINGACC_RING_ELSIZE_8;
> +	ring_cfg.mode = K3_RINGACC_RING_MODE_RING;
> +
> +	k3_configure_chan_coherency(&uc->vc.chan, ud->asel);
> +	ring_cfg.asel = ud->asel;
> +	ring_cfg.dma_dev = dmaengine_get_dma_device(&uc->vc.chan);
> +
> +	ret = k3_ringacc_ring_cfg(uc->bchan->t_ring, &ring_cfg);
> +	if (ret)
> +		goto err_ringcfg;
> +
> +	return 0;
> +
> +err_ringcfg:
> +	k3_ringacc_ring_free(uc->bchan->tc_ring);
> +	uc->bchan->tc_ring = NULL;
> +	k3_ringacc_ring_free(uc->bchan->t_ring);
> +	uc->bchan->t_ring = NULL;
> +	k3_configure_chan_coherency(&uc->vc.chan, 0);
> +err_ring:
> +	bcdma_put_bchan(uc);
> +
> +	return ret;
> +}
> +
> +static int udma_v2_alloc_tx_resources(struct udma_chan *uc)
> +{
> +	struct k3_ring_cfg ring_cfg;
> +	struct udma_dev *ud = uc->ud;
> +	struct udma_tchan *tchan;
> +	int ring_idx, ret;
> +
> +	ret = udma_get_tchan(uc);
> +	if (ret)
> +		return ret;
> +
> +	tchan = uc->tchan;
> +	if (tchan->tflow_id >= 0)
> +		ring_idx = tchan->tflow_id;
> +	else
> +		ring_idx = tchan->id;
> +
> +	ret = k3_ringacc_request_rings_pair(ud->ringacc, ring_idx, -1,
> +					    &tchan->t_ring,
> +					    &tchan->tc_ring);
> +	if (ret) {
> +		ret = -EBUSY;
> +		goto err_ring;
> +	}
> +
> +	memset(&ring_cfg, 0, sizeof(ring_cfg));
> +	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
> +	ring_cfg.elm_size = K3_RINGACC_RING_ELSIZE_8;
> +	ring_cfg.mode = K3_RINGACC_RING_MODE_RING;
> +
> +	k3_configure_chan_coherency(&uc->vc.chan, uc->config.asel);
> +	ring_cfg.asel = uc->config.asel;
> +	ring_cfg.dma_dev = dmaengine_get_dma_device(&uc->vc.chan);
> +
> +	ret = k3_ringacc_ring_cfg(tchan->t_ring, &ring_cfg);
> +	ret |= k3_ringacc_ring_cfg(tchan->tc_ring, &ring_cfg);
> +
> +	if (ret)
> +		goto err_ringcfg;
> +
> +	return 0;
> +
> +err_ringcfg:
> +	k3_ringacc_ring_free(uc->tchan->tc_ring);
> +	uc->tchan->tc_ring = NULL;
> +	k3_ringacc_ring_free(uc->tchan->t_ring);
> +	uc->tchan->t_ring = NULL;
> +err_ring:
> +	udma_put_tchan(uc);
> +
> +	return ret;
> +}
> +
> +static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
> +{
> +	struct udma_dev *ud = uc->ud;
> +	struct k3_ring_cfg ring_cfg;
> +	struct udma_rflow *rflow;
> +	int fd_ring_id;
> +	int ret;
> +
> +	ret = udma_get_rchan(uc);
> +	if (ret)
> +		return ret;
> +
> +	/* For MEM_TO_MEM we don't need rflow or rings */
> +	if (uc->config.dir == DMA_MEM_TO_MEM)
> +		return 0;
> +
> +	if (uc->config.default_flow_id >= 0)
> +		ret = udma_get_rflow(uc, uc->config.default_flow_id);
> +	else
> +		ret = udma_get_rflow(uc, uc->rchan->id);
> +
> +	if (ret) {
> +		ret = -EBUSY;
> +		goto err_rflow;
> +	}
> +
> +	rflow = uc->rflow;
> +	if (ud->tflow_cnt)
> +		fd_ring_id = ud->tflow_cnt + rflow->id;
> +	else
> +		fd_ring_id = uc->rchan->id;
> +	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
> +					    &rflow->fd_ring, &rflow->r_ring);
> +	if (ret) {
> +		ret = -EBUSY;
> +		goto err_ring;
> +	}
> +
> +	memset(&ring_cfg, 0, sizeof(ring_cfg));
> +
> +	ring_cfg.elm_size = K3_RINGACC_RING_ELSIZE_8;
> +	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
> +	ring_cfg.mode = K3_RINGACC_RING_MODE_RING;
> +
> +	k3_configure_chan_coherency(&uc->vc.chan, uc->config.asel);
> +	ring_cfg.asel = uc->config.asel;
> +	ring_cfg.dma_dev = dmaengine_get_dma_device(&uc->vc.chan);
> +
> +	ret = k3_ringacc_ring_cfg(rflow->fd_ring, &ring_cfg);
> +
> +	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
> +	ret |= k3_ringacc_ring_cfg(rflow->r_ring, &ring_cfg);
> +
> +	if (ret)
> +		goto err_ringcfg;
> +
> +	return 0;
> +
> +err_ringcfg:
> +	k3_ringacc_ring_free(rflow->r_ring);
> +	rflow->r_ring = NULL;
> +	k3_ringacc_ring_free(rflow->fd_ring);
> +	rflow->fd_ring = NULL;
> +err_ring:
> +	udma_put_rflow(uc);
> +err_rflow:
> +	udma_put_rchan(uc);
> +
> +	return ret;
> +}
> +
> +static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	struct udma_dev *ud = to_udma_dev(chan->device);
> +	struct platform_device *pdev = to_platform_device(ud->dev);
> +	char irq_name[10];
> +	u32 irq_ring_idx;
> +	int ret;
> +
> +	/* Only TR mode is supported */
> +	uc->config.pkt_mode = false;
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
> +	case DMA_MEM_TO_MEM:
> +		/* Non synchronized - mem to mem type of transfer */
> +		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-MEM\n", __func__,
> +			uc->id);
> +
> +		ret = bcdma_v2_alloc_bchan_resources(uc);
> +		if (ret)
> +			return ret;
> +
> +		irq_ring_idx = ud->match_data->chan_cnt + uc->id;
> +		break;
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
> +		irq_ring_idx = uc->tchan->id;
> +
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
> +		irq_ring_idx = uc->rchan->id;
> +
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
> +	if (uc->config.dir == DMA_MEM_TO_MEM  && !uc->config.tr_trigger_type) {
> +		uc->config.hdesc_size =
> +			cppi5_trdesc_calc_size(sizeof(struct cppi5_tr_type15_t), 2);
> +
> +		uc->hdesc_pool = dma_pool_create(uc->name, ud->ddev.dev,
> +						 uc->config.hdesc_size,
> +						 ud->desc_align,
> +						 0);
> +		if (!uc->hdesc_pool) {
> +			dev_err(ud->ddev.dev,
> +				"Descriptor pool allocation failed\n");
> +			uc->use_dma_pool = false;
> +			ret = -ENOMEM;
> +			goto err_res_free;
> +		}
> +
> +		uc->use_dma_pool = true;
> +	} else if (uc->config.dir != DMA_MEM_TO_MEM) {
> +		uc->psil_paired = true;
> +	}
> +
> +	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
> +
> +	snprintf(irq_name, sizeof(irq_name), "chan%u", irq_ring_idx);
> +	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
> +	if (uc->irq_num_ring < 0) {
> +		ret = uc->irq_num_ring;
> +		goto err_res_free;
> +	}
> +
> +	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
> +			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
> +	if (ret) {
> +		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
> +		goto err_irq_free;
> +	}
> +
> +	udma_reset_rings(uc);
> +
> +	return 0;
> +
> +err_irq_free:
> +	uc->irq_num_ring = 0;
> +	uc->irq_num_udma = 0;
> +err_res_free:
> +	bcdma_free_bchan_resources(uc);
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
> +static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
> +					 dma_cookie_t cookie,
> +					 struct dma_tx_state *txstate)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	enum dma_status ret;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&uc->vc.lock, flags);
> +
> +	ret = dma_cookie_status(chan, cookie, txstate);
> +
> +	if (!udma_is_chan_running(uc))
> +		ret = DMA_COMPLETE;
> +
> +	if (ret == DMA_IN_PROGRESS && udma_v2_is_chan_paused(uc))
> +		ret = DMA_PAUSED;
> +
> +	if (ret == DMA_COMPLETE || !txstate)
> +		goto out;
> +
> +	if (uc->desc && uc->desc->vd.tx.cookie == cookie) {
> +		u32 peer_bcnt = 0;
> +		u32 bcnt = 0;
> +		u32 residue = uc->desc->residue;
> +		u32 delay = 0;
> +
> +		if (uc->desc->dir == DMA_MEM_TO_DEV) {
> +			bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_SBCNT_REG);
> +
> +			if (uc->config.ep_type != PSIL_EP_NATIVE) {
> +				peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
> +
> +				if (bcnt > peer_bcnt)
> +					delay = bcnt - peer_bcnt;
> +			}
> +		} else if (uc->desc->dir == DMA_DEV_TO_MEM) {
> +			bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +
> +			if (uc->config.ep_type != PSIL_EP_NATIVE) {
> +				peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
> +
> +				if (peer_bcnt > bcnt)
> +					delay = peer_bcnt - bcnt;
> +			}
> +		} else {
> +			bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +		}
> +
> +		if (bcnt && !(bcnt % uc->desc->residue))
> +			residue = 0;
> +		else
> +			residue -= bcnt % uc->desc->residue;
> +
> +		if (!residue && (uc->config.dir == DMA_DEV_TO_MEM || !delay)) {
> +			ret = DMA_COMPLETE;
> +			delay = 0;
> +		}
> +
> +		dma_set_residue(txstate, residue);
> +		dma_set_in_flight_bytes(txstate, delay);
> +
> +	} else {
> +		ret = DMA_COMPLETE;
> +	}
> +
> +out:
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +	return ret;
> +}
> +
> +static int udma_v2_pause(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	unsigned long flags;
> +
> +	/* pause the channel */
> +	spin_lock_irqsave(&uc->vc.lock, flags);
> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_PAUSE, UDMA_CHAN_RT_CTL_PAUSE);
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +
> +	return 0;
> +}
> +
> +static int udma_v2_resume(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	unsigned long flags;
> +
> +	/* resume the channel */
> +	spin_lock_irqsave(&uc->vc.lock, flags);
> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_PAUSE, 0);
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver bcdma_v2_driver;
> +
> +static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
> +{
> +	struct udma_v2_filter_param *filter_param;
> +	struct psil_endpoint_config *ep_config;
> +	struct udma_chan_config *ucc;
> +	struct udma_chan *uc;
> +	struct udma_dev *ud;
> +
> +	if (chan->device->dev->driver != &bcdma_v2_driver.driver)
> +		return false;
> +
> +	uc = to_udma_chan(chan);
> +	ucc = &uc->config;
> +	ud = uc->ud;
> +	filter_param = param;
> +
> +	if (filter_param->asel > 15) {
> +		dev_err(ud->dev, "Invalid channel asel: %u\n",
> +			filter_param->asel);
> +		return false;
> +	}
> +
> +	ucc->asel = filter_param->asel;
> +	ucc->tr_trigger_type = filter_param->tr_trigger_type;
> +
> +	if (ucc->tr_trigger_type) {
> +		ucc->dir = DMA_MEM_TO_MEM;
> +		goto triggered_bchan;
> +	} else {
> +		u32 thread_id;
> +		bool dev_to_mem;
> +
> +		ep_config = psil_get_ep_config_by_id(filter_param->channel_id,
> +						      (ud->match_data->type == DMA_TYPE_PKTDMA),
> +						      &thread_id, &dev_to_mem);
> +		if (IS_ERR(ep_config)) {
> +			dev_err(ud->dev, "No config for channel %u\n",
> +				filter_param->channel_id);
> +			ucc->atype = 0;
> +			ucc->asel = 0;
> +			return false;
> +		}
> +		ucc->remote_thread_id = thread_id;
> +		ucc->dir = dev_to_mem ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> +	}
> +	if (IS_ERR(ep_config)) {
> +		dev_err(ud->dev, "No configuration for psi-l thread 0x%04x\n",
> +			ucc->remote_thread_id);
> +		ucc->dir = DMA_MEM_TO_MEM;
> +		ucc->remote_thread_id = -1;
> +		ucc->atype = 0;
> +		ucc->asel = 0;
> +		return false;
> +	}
> +
> +	ucc->pkt_mode = ep_config->pkt_mode;
> +	ucc->channel_tpl = ep_config->channel_tpl;
> +	ucc->notdpkt = ep_config->notdpkt;
> +	ucc->ep_type = ep_config->ep_type;
> +	ucc->fifo_id = ep_config->fifo_id;
> +
> +	if (ud->match_data->version == K3_UDMA_V2 &&
> +	    ep_config->mapped_channel_id >= 0) {
> +		ucc->mapped_channel_id = ep_config->mapped_channel_id;
> +		ucc->default_flow_id = ep_config->default_flow_id;
> +	} else {
> +		ucc->mapped_channel_id = -1;
> +		ucc->default_flow_id = -1;
> +	}
> +
> +	ucc->needs_epib = ep_config->needs_epib;
> +	ucc->psd_size = ep_config->psd_size;
> +	ucc->metadata_size =
> +		(ucc->needs_epib ? CPPI5_INFO0_HDESC_EPIB_SIZE : 0) +
> +		ucc->psd_size;
> +
> +	if (ucc->ep_type != PSIL_EP_NATIVE) {
> +		const struct udma_match_data *match_data = ud->match_data;
> +
> +		if ((match_data->flags & UDMA_FLAG_PDMA_ACC32) && ep_config->pdma_acc32)
> +			ucc->enable_acc32 = true;
> +		else
> +			ucc->enable_acc32 = false;
> +
> +		if ((match_data->flags & UDMA_FLAG_PDMA_BURST) && ep_config->pdma_burst)
> +			ucc->enable_burst = true;
> +		else
> +			ucc->enable_burst = false;
> +	}
> +	if (ucc->pkt_mode)
> +		ucc->hdesc_size = ALIGN(sizeof(struct cppi5_host_desc_t) +
> +				 ucc->metadata_size, ud->desc_align);
> +
> +	dev_dbg(ud->dev, "chan%d: Remote thread: 0x%04x (%s)\n", uc->id,
> +		ucc->remote_thread_id, dmaengine_get_direction_text(ucc->dir));
> +
> +	return true;
> +
> +triggered_bchan:
> +	dev_dbg(ud->dev, "chan%d: triggered channel (type: %u)\n", uc->id,
> +		ucc->tr_trigger_type);
> +
> +	return true;
> +}
> +
> +static struct dma_chan *udma_v2_of_xlate(struct of_phandle_args *dma_spec,
> +					 struct of_dma *ofdma)
> +{
> +	struct udma_dev *ud = ofdma->of_dma_data;
> +	dma_cap_mask_t mask = ud->ddev.cap_mask;
> +	struct udma_v2_filter_param filter_param;
> +	struct dma_chan *chan;
> +
> +	if (ud->match_data->type == DMA_TYPE_BCDMA) {
> +		if (dma_spec->args_count != 4)
> +			return NULL;
> +
> +		filter_param.tr_trigger_type = dma_spec->args[0];
> +		filter_param.trigger_param = dma_spec->args[1];
> +		filter_param.channel_id = dma_spec->args[2];
> +		filter_param.asel = dma_spec->args[3];
> +	} else {
> +		if (dma_spec->args_count != 1 && dma_spec->args_count != 2)
> +			return NULL;
> +
> +		filter_param.channel_id = dma_spec->args[0];
> +		filter_param.tr_trigger_type = 0;
> +		if (dma_spec->args_count == 2)
> +			filter_param.asel = dma_spec->args[1];
> +		else
> +			filter_param.asel = 0;
> +	}
> +
> +	chan = __dma_request_channel(&mask, udma_v2_dma_filter_fn, &filter_param,
> +				     ofdma->of_node);
> +	if (!chan) {
> +		dev_err(ud->dev, "get channel fail in %s.\n", __func__);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return chan;
> +}
> +
> +static struct udma_match_data bcdma_v2_am62l_data = {
> +	.type = DMA_TYPE_BCDMA,
> +	.version = K3_UDMA_V2,
> +	.psil_base = 0x2000, /* for tchan and rchan, not applicable to bchan */
> +	.enable_memcpy_support = true, /* Supported via bchan */
> +	.flags = UDMA_FLAGS_J7_CLASS,
> +	.statictr_z_mask = GENMASK(23, 0),
> +	.burst_size = {
> +		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
> +		0, /* No H Channels */
> +		0, /* No UH Channels */
> +	},
> +	.bchan_cnt = 16,
> +	.chan_cnt = 128,
> +	.tchan_cnt = 128,
> +	.rchan_cnt = 128,
> +};
> +
> +static const struct of_device_id udma_of_match[] = {
> +	{
> +		.compatible = "ti,am62l-dmss-bcdma",
> +		.data = &bcdma_v2_am62l_data,
> +	},
> +	{ /* Sentinel */ },
> +};
> +
> +static const struct soc_device_attribute k3_soc_devices[] = {
> +	{ .family = "AM62LX", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, udma_of_match);
> +
> +static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
> +{
> +	int i;
> +
> +	ud->mmrs[V2_MMR_GCFG] = devm_platform_ioremap_resource_byname(pdev,
> +								      v2_mmr_names[V2_MMR_GCFG]);
> +	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
> +		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
> +
> +	ud->bchan_cnt = ud->match_data->bchan_cnt;
> +	/* There are no tchan and rchan in BCDMA_V2.
> +	 * Duplicate chan as tchan and rchan to keep the common code
> +	 * in k3-udma-common.c functional for BCDMA_V2.
> +	 */
> +	ud->chan_cnt = ud->match_data->chan_cnt;
> +	ud->tchan_cnt = ud->match_data->chan_cnt;
> +	ud->rchan_cnt = ud->match_data->chan_cnt;
> +	ud->rflow_cnt = ud->chan_cnt;
> +
> +	for (i = 1; i < V2_MMR_LAST; i++) {
> +		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
> +			continue;
> +		if (i == V2_MMR_CHANRT && ud->chan_cnt == 0)
> +			continue;
> +
> +		ud->mmrs[i] = devm_platform_ioremap_resource_byname(pdev, v2_mmr_names[i]);
> +		if (IS_ERR(ud->mmrs[i]))
> +			return PTR_ERR(ud->mmrs[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int udma_v2_probe(struct platform_device *pdev)
> +{
> +	const struct soc_device_attribute *soc;
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *match;
> +	struct udma_dev *ud;
> +	int ch_count, i, ret;
> +
> +	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(48));
> +	if (ret)
> +		dev_err(dev, "failed to set dma mask stuff\n");
> +
> +	ud = devm_kzalloc(dev, sizeof(*ud), GFP_KERNEL);
> +	if (!ud)
> +		return -ENOMEM;
> +
> +	match = of_match_node(udma_of_match, dev->of_node);
> +	if (!match) {
> +		dev_err(dev, "No compatible match found\n");
> +		return -ENODEV;
> +	}
> +	ud->match_data = match->data;
> +
> +	ud->soc_data = ud->match_data->soc_data;
> +	if (!ud->soc_data) {
> +		soc = soc_device_match(k3_soc_devices);
> +		if (!soc) {
> +			dev_err(dev, "No compatible SoC found\n");
> +			return -ENODEV;
> +		}
> +		ud->soc_data = soc->data;
> +	}

> +	// Setup function pointers

This is obvious, please drop the comment

-- 
Vignesh

