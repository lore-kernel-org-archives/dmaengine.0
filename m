Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC224D5A1;
	Tue, 15 Sep 2026 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455160; cv=fail; b=EPcMWqHwgPkbxOAFd3RTViiI5cGknxTVe/Ay8d7syS9nQUDhHxeWpkyvwOguaiwztb3q+Ci0FhJS6rcVOPVi4qRB+bvqGLp2Bds/ooPIrb22dVqDOHMxdyfvOhpvkjeauk+otRT2BOT3WfUsBX22FRlqJu3K8+03TGZH9ZKolKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455160; c=relaxed/simple;
	bh=yC3WFRNvK8kzIkm8PiJ/oAA4MfV287LD+IxkET8JJdQ=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=lOQJrbFPUILfKPbLzgSWui5rSxmnLZXiXjeih0jEbHAg2EdmIGHu8ZrsVEPZkMW6IGkf4uZhivskGMOTw1yPJe0GA9HadAcKdrPMoGk42C8iKy9zl0Zh9SUZAw3NORrfh0lnPfDlcHoLPfkhgNng7rzXqlKEI5XXjC6NYNNkWN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BusAksVI; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VOQzwZiE; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BusAksVI";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VOQzwZiE"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZfwY3517023;
	Tue, 15 Sep 2026 01:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=G97405wtuOiCV99YgWY9B7haf9UZWZSMriWPq7KMD
	Ns=; b=BusAksVI/MFOi1+D6++DbZtVclBco/jbMnPkcAM8OGNWQVz4OnZi32SMa
	6UHvayqlIQFN4BwhcBE4FXYl7iLD2HmYLc5SttNZszjAFchAc3B3xpDfLlQ2XEpZ
	9Bgvyl/x8MzKGeloZocrx3HvErEYBijB2VVYQFUTIOl8Ho7rPtftIHRuIxQQAhw1
	AohNi2pbma2dXOOSActEDJ6pc1vcwrcVKmULXO5AKqnp6nNHP323criRmSx/xU01
	GX6SoemgacG6DUe94JP2wYYeGZMQOSfQLTsr8waEuNnjzD2U9iDin98eUypfCfMN
	8SPxFCFtOA8YZ8HPHVLG9c1h+2Vxg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gppxsk9d4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 01:52:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVKCnQTd7QAFfAMx4Nu7I9GuZb7VYgtwINal2VhXu36krRKmR1H/1BIPDZH/yXXXLjmvomZxjbelGJs7prSZnOR5WjOz9Qu/0ekk0+KIrV+WE1VuPacFdw3Ubu1CQICpYYE05kd9cKgCnFOVbrTWTHo80Fu71HJxGNP7LR3hfYSa4A5S25wvlGYSDyYqhfzCFSWtVZ0cjF1L5HaCTqA063Fxq0ewOO50O2L9YsGXYDiV3Hzppcw0AfAtdgIoVdTe7YfI3uEFfMfLfqpreVMbKncectyoyxruzwNp4ScNX9u2aDQ9PuBjXwurV1VeFIZsdHLm8x7sYX0DWofX/87EFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G97405wtuOiCV99YgWY9B7haf9UZWZSMriWPq7KMDNs=;
 b=l07mCeEmu03RS5DliJPQfnJWj06626C7bHT2hhwWsOXFlCjELFDWCk2rECgUMfrwtPwm+R387vZ7LNPY/+JlIph/LUvu5c5BLJH/uTgQjVlPzqujq3GHYWBJzAuQb9hcNh4Dlc9nZLT/0z/cLGL25O2kkHP5uTrY5CLtY2Ct1pKGceuxglrZhTSw+hMMrm/5mLVrEoFWIcngy3Hv29gTFSszoIBF5WbXjdnTEi7larvGRSBmLkFU20c3OOg4IkY6OPdNz9vmZFURgvjTp794eDb8Qne+SBu9mziYVhB9TdSFVvtQOX74IJ6VMdvH0/NK62jnkE4JSiHYPrzjQXTkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G97405wtuOiCV99YgWY9B7haf9UZWZSMriWPq7KMDNs=;
 b=VOQzwZiEMhLNtX6upQVaXG+FKytIHUOMxsl5Qjo6s/NfmNTtuFEzYlIX8Itl+y54GblyaWSw9JIWgr0SziwxqL+3KoIRzfLb7glM9JypRst+iTDO+8L8LzBrvi89lY4gf0+aYsRlq/ompgFmr9ulRoAIhv95aa6Ula41AzR/vZY=
Received: from PH7P220CA0174.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::21)
 by PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 06:52:30 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::83) by PH7P220CA0174.outlook.office365.com
 (2603:10b6:510:33b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Tue, 15
 Sep 2026 06:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 06:52:29 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:13 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 01:52:13 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F6q8jm3693318;
	Tue, 15 Sep 2026 01:52:09 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 05/19] dmaengine: ti: k3-udma: move descriptor
 management to k3-udma-common.c
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260810151423.1948224-6-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-6-s-adivi@ti.com>
Date: Tue, 15 Sep 2026 12:22:00 +0530
Message-ID: <178945512022.2241705.2425498595337466662.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|PH0PR10MB4759:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebef8e0-3661-415c-71b5-08df12f5e935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|22082099003|18002099003|4143699003|5023799004|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	DF1LNbTHJrqCsCjnb0po7RkSsIJ2+8BDk8S8Idw3phMx9mpFb9lkSz6vfb9oAGLdeLJaMhf/7jczWjS2o7NP6UChS5PqVwQDaz1R3AtBg+88lIRya24iA1T1lWJRaWzBtgsJURoO+o95wTRls+2E1j6eY4tcighxI2/LLTHJRJG2r7BqRzLLmZ6iAF93JBpxOSKc0uRNJ/sZgKqJz+FHJgJp/C0CRjkIS5mQMdLhow7Fhq6uOtLXXTbQLaZKI1quifegwpG1KuHGktG2ZS0pM8hbcDTs6OcCEqRsqgJuEaGda8GSXPx2b8BpyzVKIuRu5aaZlF5xN/jbmbyWCM+jQ2hBo0gnwv0+VGyUWfxIqgNvMWryWzHs4iQRblBbKJ2tqERCgO5r3a4ZPfx2WbMwMQgrjtUd/zbduNEsfLcON0lujv4c4RnTkyhSuVyPnaNwlhT6Z5r0ng0TabrBTcrZ9W9gWTO+Xvb5lf9TyJolYoLbx0oX0IO1MSaFcyGWNBI05SNm9VQW42vGQOps3G82kGpZ6nj55qvnyWL/24swLeo0/13hQLGg8cz9IjLcQ2cGFC9SY+SyQlhvTn2+JXpgDQw4f6utuLbFcQTb9TL/6kjkUn9tDwz+gZUbpUEL7WWsYbVf1a4EKqGuhIshdxbhDc8IrVHfmJGMueuOuDq+3ASA3wU77RTXMSf692Riv5gy6vGfLYlYrFdNEXyYO7XSxg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wROxn7K9D5mqP9vfQKeoSt7GzqyKiVudfdHEIKag0EoG+kEguQSncnXBXtxlBnvH4Br+UoXTWrPLH0GN2Okp84QYruLH3oE2ysDIxGS3d4QRauJHV3hWN3//m5iTK+RuLUof9TQlP+6sYwfblqXxxTTuR98IyEyqyR7I+UQKRifY1J+NL2wn00RTcOJmcoJe27bQ09boOvJ+7bHyjQ+2V6CpdVebFmhXjhpIxjx6q/B1pwqkgx4BTlGKtfzA7rBu3hWlPhadQzS6vdMEFourDf6B50bZlSriMe8IT09PMbQorVslEzdhBr5UNOBiGsNo+uojjRVhhTT1OONt3C/l9ZXC2W30gi+9OHfHeAO0uexi0Va35GmtYg9sWa1P3LmjfpEyksjYb4kc/hlqmG4fhkqHwor/gAHtHB4selyZkBfXXI0q2z3FfmdCjY/gsSLb
X-Exchange-RoutingPolicyChecked:
	dHEI+1ulovk3lnqS2TK8+0cNRRNyY22wZD87Ad8aRJA7gS/xgWkxudbdJY1IHutbMGKXhygpcVIVHC90cRtUUljmTtrcMRbiUyINSm8Je812PYh4OPwcQUgHoiR7E70V1ONOhxD7TtRgRqV4unv2jSJEjkpexcKk85yY3E7oKBigLPC/NJIwCEmTz0b+HBwU8pQbFHXmnPbDBv3/8zoAAx2BKSBbjiQ2xRUmaoLv4wLtpfyGJN9JYTpdnBH6ZamN82oBrs1WHqV3kIxRnN+OhR7Q1YIQgTB4Kiw4W7jfuWasspQA1egOklmbKiE5umNygPQXWmeQqKU8EBN2s1Yekw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 06:52:29.7988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebef8e0-3661-415c-71b5-08df12f5e935
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4759
X-Proofpoint-GUID: W08cpuO0Wef3lcSbQfQrbuhiUNDzh2Bz
X-Proofpoint-ORIG-GUID: W08cpuO0Wef3lcSbQfQrbuhiUNDzh2Bz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX7xiZ2ZJHzVmf
 cMxwTQ5YlcVyQ3fV1zMiwl73I0e7e85rau0/d7DqgjbGkCmkPNSVsdXjKiYxCD1/Q3N3OcOAwrI
 3MCglQAGEyISMn/W2M/7lEPOD17SD3g79gteM4ITCw62j23TMYoRIy6ZgwIJuL2zFhZLv31mAtI
 U6jAbnwmNwSLRJ4tnq4NPz/yfR1ElctHx029BFuxD9FkmAO3FSsdlLv7vZnNK8qSXQhxydo6s+9
 F7Ws2sr4Mee9kzo5c44gl4688s84OZbcz4abvmsw+kc8cTKRQz9T0I5vPez2hIz6vdnkrLIgG5/
 p3gSIhh452K0r//Tco5hD4li/1veUXha4fk91T3jRvJX8w4BptajPFEqfHHZxgafCOV5iQF3zip
 LHzRoS7ZMkB1jXlgOnPhGOmWhH0f3Z3WsvWEdsQfIBkzsGaNqt++i9BOgsTBOs9WbDiJKpbb2p5
 Hpup8MPzq+ao3W3padA==
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aa8eb30 cx=c_pps
 a=zLftBE+EtYxwi/BgDV84wA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=LWQ_RQlPjObe0EqWxyEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX6k7/YuZWeQgY
 8apySb8JuPuDdsc91GsWgQWtNxYmL8miRsGpf1w/XyXfZvtp44E4MskLqurTYDenMC69OWkfM83
 e72cXeJl08KoyxIyX4P+xoJMRu9pw6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150096

> Refactor the K3 UDMA driver by moving all DMA descriptor handling
> functions from k3-udma.c to a new common library, k3-udma-common.c.
> 
> This prepares the driver for supporting new K3 UDMA v2 variant
> (used in AM62L) that can reuse the same descriptor handling logic.
> 
> To ensure this common code works correctly across all build
> configurations (built-in vs modules), introduce a hidden Kconfig symbol:
> CONFIG_TI_K3_UDMA_COMMON.
> 
> No functional changes intended.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index cbc30ab62783..712e45601545 100644
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
> @@ -42,12 +42,17 @@ config TI_K3_UDMA
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
>  	select SOC_TI
> +	select TI_K3_UDMA_COMMON
>  	select TI_K3_RINGACC
>  	select TI_K3_PSIL
>          help
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
>  
> +config TI_K3_UDMA_COMMON
> +	tristate

> +	default n

default is n. So this can be dropped.

-- 
Vignesh

