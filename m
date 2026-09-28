Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B0948665E;
	Mon, 28 Sep 2026 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584846; cv=fail; b=WWPlrMAF6/I0g1vnGY22n89VjqcfVZj/XmwrcRFEehzehb1OyR1a7JPnYya7iu8P9+ZkgSRhRmUAhB1QGRSrvMMHds/zmf8f0ABnRrV6zc1Du67PBhZmHx1s9mho7rNvpvmoZY9piS3g/uu+NxVh4kIJiPQlQod64xj4/dBYuoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584846; c=relaxed/simple;
	bh=ZGhCoiz/G+DxyY088DfOU1Dzwa5hqAkkAZXNZzGlKNQ=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=kZlPaklvYrjEp2Z2HSlroCZkKni//BBBb+IoVO3eKiHVkxmUdr2QwNN8z8dUxJ+FYDh0TyOgnE2UHFzHOdui/zcAzem9Iv2wqsMOUyYQyiqEgMRieJfM0IY8pVMH7is7xJYXem4fTiELN3vA3A2Itowpt87ek4lCxwU8e51qlpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I/sWHxin; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gIJSXAhe; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I/sWHxin";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gIJSXAhe"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S80Yxw1980625;
	Mon, 28 Sep 2026 03:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=66GcVcctcye+dYFQw+Qx85n/UnUe4IvBCnHJIXcMA
	rk=; b=I/sWHxin7a+2Nmaxcm8z9DjTQcdNInHWst7Rk065pbsIsQtpEBbHj1PWR
	7Zq9uFxj7TL5nR3xo+ha0+FO7v/BvBrOW3NwWjtYK7G42qmkh0UH3QVCiRiNPcxF
	KjsQqNmZWWSipJXB+2GtOz6HJUokWhCttp/s9zCi3sLei34hevWsjaFS7nMp5Qve
	DvNepbanX2pP9qFE3hnvA24ftXZD0R2lUGjAFysljcmipp3y2qoTr8ndYyqM1qmy
	1vNRI2Xxrv4MUbcfJtNiS7qB0u14W4UauDxVBWUbr37MsYkqeUUCZY4W7D5ukbqc
	Gu3Pgj9fwPvU2KX0K1yhj6hEcYR+Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00ncj05-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbsjM/Gj7J78Vk4wMmYhb+jq/aHBpQn+toogyyPZUMg5ixNtP1ISjuQ6ZrHGqee6pl7+T1sjVyZijlDe54+qjUAZb4ILkvsRbLaCShanVhtafCRVIAjBh9zgWJp/uoKfZW7SE3KXnWoRzRUJc2v+IezD9dzWxbhx9ZJvVyWOFME9SiTc+/cXetnRzVEGe7NwehySpO6TDx3a814jr9id50LF18MyCWsz3G93OIJl4hZH9qtRtRHGaCxq2dAFRJ9/PHZqyv2oSnjfFidsHEkaTI4U7BFfaq8l6hpWDk+eJs73cGXLmthOYKzdytu0mNSYVoE64S2aJNxfNi7D485dNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66GcVcctcye+dYFQw+Qx85n/UnUe4IvBCnHJIXcMArk=;
 b=B+J6VVgla+QtdRMfXEa9sU0x0CvcS1AtoR5Qi0UWNkAkLd0lsvuSCXpJgFdRrRGdoZGk2Ezz1tn1XdRAbxyTHI0z4ZMNO11JBX/kPeHuXInilr5pq/0i5W1OZVF0DjvsaFJIGcLJ7BImtZW0/nOq7SQUoskny6Leq+msQ3RM1BYSteCUnN+GopLkmNltSC7WseGl+L3LHCHnoMePpM5N4xOtBfSld+frUf5TCI6ZRZyar4W6+UMQi3YngUxbjRVIMrBUvSWIAvpwy5iHTzDux0kZK8j9ahwOBCbzMQ4JEvvjRWf0Y7ho4lv3eDU/ma3spwzSLbf+PGtEzydcB/xzgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66GcVcctcye+dYFQw+Qx85n/UnUe4IvBCnHJIXcMArk=;
 b=gIJSXAhe2zhoqB5fYZlx429XQgd1HBBM/glUq94+y0GUXnrPPo7dMezCATYmLpVCjNOby5xW2VmAuYMXKjlRArQAq2pKOWZZk0ICke4eKqOr+jSFvnstYlJVMAQU+vkmygIj4KRb9Ivzv6OfOVB7xVdG4x42kIMZ+cBZFyN/A7w=
Received: from SJ0PR03CA0282.namprd03.prod.outlook.com (2603:10b6:a03:39e::17)
 by DM4PR10MB6134.namprd10.prod.outlook.com (2603:10b6:8:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 08:40:28 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4) by SJ0PR03CA0282.outlook.office365.com
 (2603:10b6:a03:39e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 08:40:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:26 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:39:55 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:39:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:39:54 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedf3686893;
	Mon, 28 Sep 2026 03:39:50 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 07/19] dmaengine: ti: k3-udma: Add variant-specific
 function pointers to udma_dev
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-8-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-8-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477448.77164.15500980311968373733.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|DM4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: be869143-68d3-4781-aff3-08df1d3c2524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|7416014|376014|10067099003|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	JE8yMMsEgYUjNbkS/Lo37SKRHUYmikhGgG/OydvddV+SvVgtmBsbvJu7L1tWaR/cDoZy1Mvv/G8UiZjuEcfqbku0zjZfxtNljX+S+E5iq2eNVrOvX3wRmTaYWzrYybaHzHUkTLHjN8qla1UVsVeXUmpVReQgMVBY3LF0CNa4QxxFdMSDI9dEttBRT/SEw5dgAMpWL+EKuc0PaagFLSBbOxh9y/Pspmw2EmuKgxHHwPMArI9EiIQQpxRwxs7+FwJlwoZa2MyTemlRMHqsYwQBQQcl/WwduV12sL/YICFFjeRcIrJEtlAwmM3+HCPScVEBoRuOeElr/Jr10Xo6A1nPLldgC9D9k6GbEfLJfXmCH/8cLxN+a7YBiaIxqNHbOYCVTvGD2a6eM4yFOL89dhHtayLL5aJr2Eh2msKcRIgrK6TzfNG9Vh33a3nV+dd0GPKwaNFjmqISCZ7Sw6O2uqs05aBTis6Ccllu0VzdOCNnL/uhPw6//IZbH2QgL1jKICbwDtuaI6ff7EwAaqCKbTnZoUyADet619+xKka0kkRhkcC23wMyWKBxiB/dlvCTzXsyfkM8djZXdjwST2QaGiNFVrlbSg1BpLlDO1BRmR7WA6GY8yQkCFHomTQ7vl+8RifHISOm/KRFsUgMA7ltI30L9aUNrwITfO4D+tCzDBI0v+cb7ueByhnUytAMljVkgWy5Cyft7OwsCmlMTUQprytadg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZT7qgOh4Qa5+wamVRXkcuAzTEXWXq8w3VeE/DVqMo3Ni7eL8xjEkQRxWAVkxJpjneL84Ijktus7ATzgRTnkdHRd9WuAFGnaVtJBfSsUSdNIx9gDLuuhVxS3Ei+ITxds/kN6CWTIyAu3H8ow0cnt1c9CuqWy598dtzfR/U64gJW/lxP/Z5ZNkgJa2fpMLjWhRLnszUp/kq6nToUK/5bkMbbJIQXkbNWKlPQvUqFgUOKTZ77lSz1NGD9tLhm86qq21RJ/J74elj1xuIxEBB6PpI6qEUFqOGWPxKzg77lvUUm9TFy+eV4d8BS0fwpdubBPttYqsXHXJan2HFLhj9DCuiDbHFL88VOQoDzJIbNt1X7tfikcsvHY/wvymAljreVq4N/WHQwcvVn5ASgHIpBhvWzwav2ahKlmDu0514S6nNz/2B9HZRxAWPi4IQG0Rsxp9
X-Exchange-RoutingPolicyChecked:
	IOVnvGKqK7HJotdNF5QiY9/6P85g6kOecqqflUBEjLy5jbOvo1kvyIXYYXAj2Rt0VGQAdsUQp1McwoUyehDmi/VNYyPZ/pa1PgzaNxyPQzq+2U547QiU/xAUVcarcjWNB6kCIA0vUuz97Td6Lnk8EFN672puvoqwY9ms9X6rKyNZGEXCNF7ntolRAfZJfQBqH+xfm+gd8e3KDOicMhu7E1QBVkAnX4wHY1QbaZF2gdGNM8S1MMyxQVXhc7WYsMbAG83zk7PpK5EGguLrby8Lq7/1eh34YvXJZQktuo/oZL5+ZDBeXEoVyQ3CVY0PofRLFp1Q5NWgJm6oVSJ9coRyDA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:26.6844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be869143-68d3-4781-aff3-08df1d3c2524
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6134
X-Proofpoint-GUID: ZPAc3kZxGm7xxFeI05M8yadC3ZGRrL9v
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6aba2800 cx=c_pps
 a=lrInUZDIVE0OTqvzw4499w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=y93NFJtDiUvmF4uUd8EA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: ZPAc3kZxGm7xxFeI05M8yadC3ZGRrL9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX4GTySKDfgEAn
 Jm+jITobvWGPIzknqPd2ZF0KJLNzMDq4/NA6an94mlEuo8Sr5XtQcjqhLm9IibVdkdoc9rPlRVo
 G04JMkfzME93+UEP0bZrW2yQv7xlcuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX2kHOxzjyTHon
 NZ/vNS+MmsMZt9KmAUzCkeRXNeAe4r6812OI9YzpWjACLeYjDTZFwaFT3bBv0muCx2UoWi+S7nZ
 a8Vjgag+xD+o/0L7a3NuuQCYenedpYwHkOhl4v0M+AYxekG0Lkub6etpULvdaiVh2e/w/MeKLUe
 OJqYdnSa+RAtZ+yWPMVIx7WKuY1BtZgwZaOloDYBRmxGEr68BMNN6X0B9eeFi8mag7uicx94ixr
 EEJEArbUxpIFkkMdt6LylkM9Mvs68sNLLRHp9Ph7nRgf5DoVn7xdE5GHibuy/5cEmgEAzad9/7U
 FI165D5FvnGlxJlHo9+hKk0hHDpCuwii070Z6PMqKvpHmiIBFFbP6SrPvF2WyZ2flDTdmHbRYZb
 G+YqBm7Gxh/lIMqLM6nGFOODxygUnb5+ISm2zK91hGvky5Wg0hAzTSaUeIiEtNTbf1tGS1jF94o
 7sm0a1O6FyD6cCjiSJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

> Introduce function pointers in the udma_dev structure to allow
> variant-specific implementations for certain operations.
> This prepares the driver for supporting multiple K3 UDMA variants,
> such as UDMA v2, with minimal code duplication.
> 
> No functional changes intended in this commit.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
> index 624360423ef1..44c097fff5ee 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -8,13 +8,19 @@
>  
>  int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
>  {
> -	return navss_psil_pair(ud, src_thread, dst_thread);
> +	if (ud->psil_pair)
> +		return ud->psil_pair(ud, src_thread, dst_thread);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(xudma_navss_psil_pair);
>  
>  int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
>  {
> -	return navss_psil_unpair(ud, src_thread, dst_thread);
> +	if (ud->psil_unpair)
> +		return ud->psil_unpair(ud, src_thread, dst_thread);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(xudma_navss_psil_unpair);

Do we need the check for ud->psil_{un}pair to be NULL? I dont see any
patch from v2 driver to xudma_navss_psil_{un}pair()?

-- 
Vignesh

