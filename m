Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08E4848A3;
	Mon, 28 Sep 2026 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584824; cv=fail; b=c2WN37STpU6diNh1ZkqK4/DB3vuNGJDH4aAetpIrnDYDbji0b9jDiQWyEv4IXxPkWf+6sMZmNsOOuO18JE9407fN4vOSTtZgffFEXTiORx5HXHdcCNPzMMMAwCw/+lXIsi1lBQRSi3J1BwCQBIWJqtWMWGDEZ07t84riKq5Vuro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584824; c=relaxed/simple;
	bh=bHyrgmccRDpQFyOiDIHvX9nDdB1LAUylMxBcWzlwWOw=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=b5i4QRvaDcQ8c5ruw9uHRQVMWG0yilHwXVZ5uWASym4ICsAWc/TKkR2lc6N58XU/wZXMFRk0Cg50THyuYuYSye0+8lj1CHtwHJSKLkAYvGxYIVkdseKcwvqzi0FqVEMAAFTB60NvODRRkXtk0LUNHLWHDJw5hWhQrILNczlcuaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jpnuEkN4; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sPzzoNJM; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jpnuEkN4";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sPzzoNJM"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80l0l976055;
	Mon, 28 Sep 2026 03:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GwJpyG1Ba+vc/Sb+Zo4Jf1ZgpcdN0FGRhA1MIL+pd
	TE=; b=jpnuEkN4BOblk9AFozyo0S+2onrihoY9BFVdhK1Mjj5noBJRSlF3aARxQ
	NC1WX/bbcP6rwKc5BUih79uoohqo53HhPOW2gCsf2pJ/+zexXwH8Z5NMoR4gwMeX
	KCXWWYbBHuJYmDQkM4ERE9I0Q1cTfxveVEAql5fQLUbTQ68I0ScVCWivrUVlnisY
	KtmA0Orw9T0WYKdVcyGRaoCoEySC2X4+s+m3GtXPUBaKNTPe81/bM234FHYGsctU
	BHJj0IlQ3Z+wshkAzMEaEiVGXDxDqHgMegi2y5s/4Q72rOsEfUkcXkhwsKQTai+8
	vlxLOfBCsQP4zxwh5HYj+OKaLQuaw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nvyp2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEH8uOixx4XobZU/LqQwbGvpTMS8UxBpwZc8LYzckd3IrrEcb1CyTV/BBRjeFohPKyrDpDKooefq9lliezMRjv29T2tttxuSmgaE0CwmcwaWO3pyoYDWS93CI5MOyxU9T4dEmfNmBuQuu+NcyVGCV98aNgx4W+pnXyQDmlJb/h41++khSDKS3wYQUjYd+c1ybswpctmzAYJf/w/jE4XGREyH5wackWEYkv+es5wd4wII3bw9jdv4YedrSBj7Q7IEZ9+AMXsWy2ArThDGP5mMditNMSEbXz/GEXmuehVwa5ZHxirqBoDj08WItQ7ImmzMxYGHNy4oZD8NHxtG30n53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwJpyG1Ba+vc/Sb+Zo4Jf1ZgpcdN0FGRhA1MIL+pdTE=;
 b=G3wJHpL6qyQ75afjqX6H1kKQuzQxgDaILm9viLKGa24hYLkw38ntoT7h7PpLCOOsIpfZGIpwdXTeksoT9C3jMtgSDPIztFoTXh6Nopfby+SPNHkB5hCC6twvTeP8LJLOF/7Wq6Gu8u2SYkQ43n+671xKwC1EG6FNamDejhE0q6Jr+uXq+kc5X1KfJJRsiFE7tNZRYixPksV1b0aZBh9fcvgb8AlYx/ynuH3W24FiILNiYXQBlzOGLcH2dBH1YZg4rGlcuGJxPRhF0eAnC1vuDp0zYCigRGEd0jMqNx3iohHv1WrVBLNkqhrGtPUNdVvajmqV4bJ5I/C8rtMafk4H6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwJpyG1Ba+vc/Sb+Zo4Jf1ZgpcdN0FGRhA1MIL+pdTE=;
 b=sPzzoNJMhJx9dr4u12jS+ictQylrN26qtTkkKF9aFwZ7Q7gM+ze/pMWvfNKcVB5T6vFgckvNFjnRIzzwz7D9JefJEGHYGOQc9GK/Rlvwz3mkna65RaWjKn6XI47wd/j28bLZGHARdXkb47I9dlQf+Rt/53QJHPq9qagKH8H1WSY=
Received: from SN7PR04CA0169.namprd04.prod.outlook.com (2603:10b6:806:125::24)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 28 Sep
 2026 08:40:08 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::5e) by SN7PR04CA0169.outlook.office365.com
 (2603:10b6:806:125::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 08:40:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:08 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:04 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:40:03 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedh3686893;
	Mon, 28 Sep 2026 03:39:59 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 10/19] dmaengine: ti: k3-udma: refactor resource
 setup functions
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-11-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-11-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477460.77164.7431718785558039339.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9db385-0b45-4968-e4a7-08df1d3c1a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|36860700016|82310400026|4143699003|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4/JK9atRDl1IAg8uU+beT2XCHgEViEn8qo1RpZINC8hFeigh+mkbTg2BfdITgk20uDBxgtgSIlLRcSK8ofTNt2NUVVDWpfHVgNyRfM5nt1lkb6blLD7nSo6SsoIBmonwJxsWFZBCfQx1bRRnyPaCcrqyxmch+AXuyl3Kh47+RoiKKmII/ZUIzqP19hiUosyIx4Y6uL9j49V+cbrHa5Rx+3cu3kzPy9ABOH08AsQpxrvBTo6HmnMvpJhML4p5ABXOe0mZQTOobOT/RoV0AVtYg/gPHlaTXRyS0bFRBq+Ke0iU/KoQtmMFk2Zko8CL7/O5v8duWqmwWP5sipElzlBFMiXY7jyXXQTta1A4e1epCSDsZHNPKyQEEntUFO/IAWmC7xIryXWjamPJzKryASLR1EVg5eqgXms/G0eM4SpogD4rkb4cub9lcfN5ty4vNQMMk++fE4BuTVklYrWWKMVrPBtP5g3RXWsmzfNayIw5v7s15sLqmxChDZu9hYU0IC6S5wsU+6OsTDDFY76NoqTI+06g/mYaEpHaHD7qzZZKAd72YHxAx5sYn1ndx2usl8jTav9e1yZ28m15xLbjZ7596YcIiR3ibdQy92/Yg+jp/srAp2uPrUh0SClV+dvt1BW+hxdMRSli+2y6qikJxX0ITmKo0Vh8ftTm/NVmYITjbNtHqPwFMXNx4XWIEuTiRGRA7r8nIZxBZucAAJXwIxAnsQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(36860700016)(82310400026)(4143699003)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XQF0yiCV5YfwWFPWqv6u5BmlQj/FTIYAoMdUa4agmsEaesAFhefuPts3f01GhXHHycT9Sia004fGWNXWo1cLq8IqRsBF0AxXcgCCvsZaJV9dXx+TTsX3UxkU4t2XZiIAjM5PJuI/UrsKA5SjlcVvWHFeyNrJ0Xs1yRswINvNBTX4iENUsxegU8AgkVa5Zjk0WyPLcfxc3Z7croVzcNzp30G6SPZGtj95U5KJbOwaRMvfBS54NfW5AAvwr83DfgjdyHt9nmsJ2ed38AdMjnOnV36z1UaLCnWOrZqYpkgnQ65qRpdBoYuw/B8fJwzumwtYSca2aS7u6JqLpLS6BPFudeJSRHDdnnSWo0DAN5mg4qZwOrMNKDIsaCCc013dz+OQNnIRczGblDt55OZJdJOVGklEkLWelnL1C05stuzTbdj29g+1MWNr2XgwqO83rBzG
X-Exchange-RoutingPolicyChecked:
	spKfHQkdv14Em7G9ha2RsZNBuy8XdU3Hd+NWhOl+VhcSDW8AGExtbrNVTtDu+Yz6dhScVF9aX1ShTimaN1ZpxFVUpq+Xb31w+n7qJgDESzfLHyNU5OpfTDKaYweH6HTzDUGJ+tNrZWtvrjUYmJh0N5Y+11SCfPcspe/+eRvtmDQkVBXSPkSjr4073hA4VzQr/2aYETN3Q2hUobxBDOD+BRxOWuvQjjqoNGwznpROwHVX6Qvutev/i3auqDId7PijLsnOArfgXXrwlfpanabRY6ZGXg9Ky31mI+Zq+PX/ZktBdCkEAw2Ae3ALRAnL76jU00EC29oupOPw3a6zUFhr6w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:08.2188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9db385-0b45-4968-e4a7-08df1d3c1a13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX5ol6R5gu0hp5
 u/3RB0rmISx76VXpVV3DEc8Lwm07uvPfpYELV23hXVLzmzwuQ9FPB6bLUdLjxWj8MexZp3/9nuK
 uhF/FJSxdO/SgNCJeYMJ+Of2OkEPPMU=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6aba27ec cx=c_pps
 a=d2CTHFLGvf7JoJ8RUfZBgg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=CAiiH7kO6OUPDpZicL4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: E6vIgRIpG_edPQGxHUNO0BQFM7Y0bJpk
X-Proofpoint-GUID: E6vIgRIpG_edPQGxHUNO0BQFM7Y0bJpk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfXw+QyXFWrZIu3
 hB+Re0S/6DqPtq/+6RFhoh6kRv16WiM6kkPel8PVQkPAGMTtPMIBsuhZbXXPkJwbl0Dq2KoNITO
 Y7XrShHqk1+3GF3oYOniBxqkHTQBz8e99ezmcWoRijOIkSb1ldv74B2aE2z1NBE6fvKFxVamCjt
 2mExKHPYA/MEcEhGv2dkCjMOqQph90hwP6ISwxtea5VedE97PF72vWjeNfVI98HT2px3qEVkbfL
 ENSprIJB6ie1iwDe4N2fZ87tKzWDkBXa1XFCvjDN1sFm6a6VSr6WN5ILAQikBTlcaSncKgy5V3f
 kb5v/+TDHMqoYMGhIKRf8ndjPA4uqDpTwX/E/PAS0xqKbf6YQiVbGSUwRJ0DLG841utkpUkHQRZ
 Xt7bYh/UKHvEeMuN8S+59RTvMGcJUa8oNQRqSyz4G/jyJRPD8wX/VfJtaNTr7CzKPyyMko6kj36
 7zhQWqCl3YcixovNucA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

> The implementation of setup_resources, bcdma_setup_resources and
> pktdma_setup_resources is largely shared between all K3 UDMA variants
> with the only major difference being SCI resources setup. So,
> - Move the functions to k3-udma-common.c.
> - Split SCI resource setup for bcdma and pktdma into separate functions
>   in variant specific driver (k3-udma.c).
> - Add function pointers for setup_sci_resources in udma_dev and call
>   them as part of the actual resource setup implementations in
>   k3-udma-common.c to retain the existing functionality.
> - Also since setup_resources call udma_setup_resources which is not
>   required for all K3 UDMA variants, Add a function pointer in udma_dev
>   and use that to call udma_setup_resources.
> - Rename setup_resources to k3_udma_setup_resources to avoid polluting
>   global kernel namespace with generic symbol.
> 
> This refactor improves code reuse and maintainability across multiple
> variants.
> 
> No functional changes intended.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index 34f8eab9ddb5..d0afbab01786 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -8,7 +8,9 @@
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmapool.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/soc/ti/ti_sci_inta_msi.h>
>  #include <linux/soc/ti/k3-ringacc.h>
>  
>  #include "k3-udma.h"
> @@ -2334,5 +2336,203 @@ void bcdma_free_bchan_resources(struct udma_chan *uc)
>  }
>  EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
>  
> +static int bcdma_setup_resources(struct udma_dev *ud)
> +{
> +	int ret;
> +	struct device *dev = ud->dev;
> +	u32 cap;
> +
> +	/* Set up the throughput level start indexes */
> +	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
> +	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
> +		ud->bchan_tpl.levels = 3;
> +		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
> +		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
> +	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
> +		ud->bchan_tpl.levels = 2;
> +		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
> +	} else {
> +		ud->bchan_tpl.levels = 1;
> +	}
> +
> +	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
> +	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
> +		ud->rchan_tpl.levels = 3;
> +		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
> +		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
> +	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
> +		ud->rchan_tpl.levels = 2;
> +		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
> +	} else {
> +		ud->rchan_tpl.levels = 1;
> +	}
> +
> +	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
> +		ud->tchan_tpl.levels = 3;
> +		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
> +		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
> +	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
> +		ud->tchan_tpl.levels = 2;
> +		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
> +	} else {
> +		ud->tchan_tpl.levels = 1;
> +	}
> +
> +	ud->bchan_map = devm_bitmap_zalloc(dev, ud->bchan_cnt, GFP_KERNEL);
> +	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
> +				  GFP_KERNEL);
> +	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
> +	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
> +				  GFP_KERNEL);
> +	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
> +	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> +				  GFP_KERNEL);
> +	/* BCDMA do not really have flows, but the driver expect it */
> +	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
> +					sizeof(unsigned long),
> +					GFP_KERNEL);
> +	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
> +				  GFP_KERNEL);
> +
> +	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
> +	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
> +	    !ud->rflows)
> +		return -ENOMEM;
> +
> +	if (ud->bcdma_setup_sci_resources) {
> +		ret = ud->bcdma_setup_sci_resources(ud);
> +		if (ret)
> +			return ret;
> +	}

This needs to fail if ud->bcdma_setup_sci_resources is NULL for K3_UDMA_V1

> +
> +	return 0;
> +}
> +
> +static int pktdma_setup_resources(struct udma_dev *ud)
> +{
> +	int ret;
> +	struct device *dev = ud->dev;
> +	u32 cap3;
> +
> +	/* Set up the throughput level start indexes */
> +	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
> +	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
> +		ud->tchan_tpl.levels = 3;
> +		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
> +		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
> +	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
> +		ud->tchan_tpl.levels = 2;
> +		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
> +	} else {
> +		ud->tchan_tpl.levels = 1;
> +	}
> +
> +	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
> +	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
> +	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
> +
> +	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
> +	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
> +				  GFP_KERNEL);
> +	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
> +	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> +				  GFP_KERNEL);
> +	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
> +					sizeof(unsigned long),
> +					GFP_KERNEL);
> +	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
> +				  GFP_KERNEL);
> +	ud->tflow_map = devm_bitmap_zalloc(dev, ud->tflow_cnt, GFP_KERNEL);
> +
> +	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
> +	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
> +		return -ENOMEM;
> +
> +	if (ud->pktdma_setup_sci_resources) {
> +		ret = ud->pktdma_setup_sci_resources(ud);
> +		if (ret)
> +			return ret;
> +	}

This needs to fail if ud->bcdma_setup_sci_resources is NULL for K3_UDMA_V1

-- 
Vignesh

