Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C256322C73;
	Wed, 12 Aug 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536073; cv=fail; b=oxvVTBD/Ie+9AV1slHsfZK6DyEKy7QQL05eIoKhaQ+T8ktrT2z4H1spmwaLq7XCVYqXO1sF/HQcP6v2W4WencNXsxdsRTFdRvzGoRTXJv5nCx/SEoZpZiS7e7ZmGiWBZbXlQsQyTKXrUH9/5W2pIIkY0BDApPCFflasrfh1DMII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536073; c=relaxed/simple;
	bh=lQpxTs+IBrkIUMo80z2E8LlYsNIqn2+CdmdGE4AFzRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q95wglsq5jpNZohn6p6vWwI82xyq/Qd9jH9MZQ17vT64k1sBZFMG9pj4ooUmAiU9ovlzVVhEJmxhZm2SKdpS2qTt/CkZ1rre4AdivX5Qcfka2o9LJMXFW1TvxSijYR+J1fU/kiJz6tYvgRxlCRLM/ugTBqDzTPFSKtQ8hJ31nzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HPmdQzR1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jFpWM+bS; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HPmdQzR1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jFpWM+bS"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67CB0DE7025013;
	Wed, 12 Aug 2026 07:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lQpxTs+IBrkIUMo80z2E8LlYsNIqn2+CdmdGE4AFz
	RE=; b=HPmdQzR1O4p5CgSxk/fkICo3f4xCWdoxE2670F5+cH5pVceM8D6PW9/jv
	LFNXgTC49j8fUIJ63F+O/K51jFD1/ga3QgWtodHJLP9lPLsgIne/XzmfOczUfhPG
	GWtceXXcxlRp+3z/uFUT2XcboWeOEnV5y7Dic/yJoZ+sXlyRW8oB0KX7B5NhyxJl
	Z3xvpeHP9shTABiKezSQkO96RB/M0BeN1iYoufJ7KZN4bR9V4VDCFBlYAwYYrDqh
	+niBv2atEUkgvvtY0JxYlQ9ZV6/7ALfEJP3mJIWrkt67VUbOPF7IG+Kh43oj8kZm
	lvE1UnynILIkkwrmcMWyc0JM77lEA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g0d0ckfxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 07:00:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a06CJIy6zZQ+nuoZ0NYDjNisdE1dp5rhl/AgZSA/uXVup386NKemHNWi6qHdof+6GtOumO2wEUjXzVGrgLjE1MCsYkdZQf1H8Z3KQCk5emfBNlNoz+2O+uXPfSgrJ38xMbcsdwC/vVxuH+0RPL4cq/SX+z5VulOc1W7i88Clru+K+mv0ujZcqNE10jzpQfDWyriIplSTGDghQrY2Mykw2tHR2PBnym6TWAiFF+SUa/tYzE1UdkV0dWY+enTrmo0C3+NhoEhcibgmBhzh5LOpCeKBGvIPvXs+85nf6xrUhJek20Altd6kVk//kVPBrydUAvILsG2ID7/v07B/JR3tvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQpxTs+IBrkIUMo80z2E8LlYsNIqn2+CdmdGE4AFzRE=;
 b=wHDLEJrdxIRILH7SsBFD1POCex2jNDLO1+cuLNxdLFu9A0TFp1By80RU4lE+AhlKGoKU6+vznB//fG3N902proRY1v06yPNhfZBF849id5QRmC52xiJ3EE3nmH/AbVhpv8pCG6GQEumBOD+JiJQ7R4TrDjdBmqSPF698qMAJPvaw9TxuH/Umo6rAo2uRxDvlhS6FR8S2KWIqQx+HrcGyf0dJ18veiDiWvZ5c1jytYvzQmOu9/HP3MQxPLpteaqTY/oUKf9N8whT0SLGhvlmkiYNTbq1UFZ9a3nVQHucJjBJxAQ4PfMSZe3LHysE1PzonJSWNU9R2CJcUylPKjzjcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQpxTs+IBrkIUMo80z2E8LlYsNIqn2+CdmdGE4AFzRE=;
 b=jFpWM+bSxfsY5ttmITOC3Vh2u5r5fB7iwK+U4cVWsCQAK5CUwBvIQ6W3SU3FyjXvOmu/MrVdsaJCWfvG/VTC1+Mk8Mq54Na5ZiMShirAN/wqRCT6HkEozU3SgOS2FUcjvcuBdnozWkJeBsmkloKddnyVacW+CNXQzZIg+PddzQo=
Received: from PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::17)
 by SA1PR10MB997631.namprd10.prod.outlook.com (2603:10b6:806:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 12:00:40 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::65) by PH8P220CA0034.outlook.office365.com
 (2603:10b6:510:348::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Wed,
 12 Aug 2026 12:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 12:00:39 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 07:00:30 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 07:00:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 07:00:30 -0500
Received: from [10.24.51.254] (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CC0PN33054318;
	Wed, 12 Aug 2026 07:00:25 -0500
Message-ID: <8b41218f-8ffa-4c65-abfb-8d87793cffb2@ti.com>
Date: Wed, 12 Aug 2026 17:30:24 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <r-sharma3@ti.com>, <gehariprasath@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-14-s-adivi@ti.com>
 <20260811-exuberant-cobalt-cow-4d5287@quoll>
Content-Language: en-US
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
In-Reply-To: <20260811-exuberant-cobalt-cow-4d5287@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SA1PR10MB997631:EE_
X-MS-Office365-Filtering-Correlation-Id: 6277d6be-579d-47c2-a557-08def8695409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|7416014|3023799007|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v2vdA5VszgdOFzq4TrJjApv7RCnLsAG22d9bliZsUPq4vq9OCu08J64Jdc3Q59C4IMvqAMPv1PLZj7TEsxlpyLxQwGqCqUvc8vKbjlAvRUlBAlk+pHBQgkAun4nKyiAY+B/ICEyVV5AL2d7VQrGNdqyqUxxW73yDsGFr9V+WMf0YRzvyI+Qv2KijArwM0ivWUAesJOx9PDinPuUjwi4sl2wfk4XeUCiH6OaB4WXUE8orfDqO3NU0CPFPnFzLd0mkNaLuZ7aGKgI4VpJNN37pKzD5uCGqtOilRM0Fq7SMGQRjVgDy71SAi6/MciNkcUP/mChP2hznutHs/KHVuuTf0PGZYw99rU9khO0YXdlwiKd7yZheUO6i5KootANSqnScqkVD0br3g4q49gWKkOh6hhjLmEBWqv3+FkOirByxkWyAhU9INDlRwetGA6B1pDUXxQkvUNrKB80j4WxQL1fiOKzkT0nVmhXvY2AQC3dwyuz3i7ra6VM9BnX3EhguQx6n0GMLrDPoG28V6/zjY0DdGPjjFUN8AurCvYT/qcQ/cz+0b2KqJDAbKx6Lqi4lrTKXuZaVNxt1BK2Shy6xNIUYPZ8clQmRbVebLibPEWGzIXx8W0AM7LCrANocKzyptvp2U72P5/RjtytXqYbc+jNyPjJKhsGT8Lrp/iNIEsCJMMz26NS1wnu0db/JkKJwI42GR/w0XtwHDhm2gFLFIeI8iw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(3023799007)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TwWrbSXOJ2bDK7lwyfNYbyCgerjDTR83mTMKjkyXCUZTotbvIJZlzRSXU5VOFDyZtXsuYef7NBqCvvuE9T//Dk0GTnSp6uk/kC1MfgIHeigXcFPQrF8KPJNgK2nnSI5tfAcir71fjpjD0ixK7MNZcOAeeOI/g270U9UZito7s4ijvuG1JC/hDBu2BVNyLFnu628k9+WKzZNA0Ij0dyy/p2QUvJxsXY1jrAyqQvMn6DRP4buqAiHrFwiyH7GeCvzxgUgWlcUZbrH5NPT/HIEpEaGAPHokVP58ZquLLfFONzS2S2cuSluRvxjzPTVVAmrAgafPEfCXcawKNMTF3vaOufr5RoqdpktbwG4EXK7+44kNc9PQygWrXm3ustDyw/R3ydD/nJMDj2epg/YftFDOGM8qARuZ5zpUY24Nsudm5hy4zNlc6gs2a+auycJZ0YER
X-Exchange-RoutingPolicyChecked:
	TXgSA6ADF12TtfUo8rZajDqQc1uwcx/puICcvCivrtsa39PNu7eOMkKUU5jO6bKej2VL5+0v9o7FsxFsTOlGvsf/hHhwBDbzW8kq9F/ZndwkppP/9zthrEaRvag9HZ+Lyz6LwJlI7k6TSpFmnbyHzvHj3pGKmAETnpPUke5u+w2bjLcjejT0/bQaM0RUM2Q3Dt37Mpz4nqNsLB4dccKdRt91BuZ+7KoSrR87ocfOVDrDZoN2Hlg+4coPYzeVqFzRgylGe1r17WMPWzzYhYd5k/i7JooOlerbW5Q1a809jgcv/s64Yadihi7Nxlp1/YCCJpwcgNw5FsaNgq1eCf1y7A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:00:39.7655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6277d6be-579d-47c2-a557-08def8695409
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997631
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5NyBTYWx0ZWRfX24LjSkbMQ1Gv
 tCj7ZJGsCA8VmKzStPzkwVlqOJxihWi54nFo5HBPwpBeW4HH9TUH+X7yP2r5V+GN339lBs3j0nr
 idaJTxDCyhiuZxJ71Nqm/dy65fOpE9w=
X-Proofpoint-ORIG-GUID: need_1s8EuNMCQEPTMKgp5t8rL5dsWYe
X-Proofpoint-GUID: need_1s8EuNMCQEPTMKgp5t8rL5dsWYe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5NyBTYWx0ZWRfXzI1hvcp65lSE
 ghTYqrlnVQUXVjSauVgF7DR+zSWUAwUm6LjvIQnYtAE2DE8tUj5xfZGTmsAdWiCzVHEQfSeljVa
 ai9IsSuNuzkK9Ae8Z5AcOSzYeqjO4PZlUVVEWY/uyVsNQWmOFja8Sv54mcrN97KQJ0WzgAAVFfU
 LDhtDDKpuPwbuOmvY2NqY2A0k+pVeH2e4arEwogzq91rN8eN7Rp0L04zZKF2SizIeUe7yi1wCr4
 KAoPldzULkv6FKrBIJPXj1gSp6IjsJgJfx8CXYEXm2wyCdpoTQiVW+s2y0EBa/UnJbVCQgDW/Ib
 zsfT6QrTPjCuVGXKeB4v60t/ZlsEdeJQBR/OKMhL05MrMFIwVtNG2V3j/MzNoowJ5TRfvXSk+gg
 JEjx3MCqh9SNIr7F2dk8/hQedLn5a6O8BfSkbZcXjSahMRID9zTSjh/xGYgqzMmYxBIJPATnzpI
 30ArQhThyeOZypzJYwQ==
X-Authority-Analysis: v=2.4 cv=Y+DIdBeN c=1 sm=1 tr=0 ts=6a7c6077 cx=c_pps
 a=k0sZSnccHBAUCD1Alv6C+w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=NPopYay3oyRqhmfhkGkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120097


On 11/08/26 12:02, Krzysztof Kozlowski wrote:
> On Mon, Aug 10, 2026 at 08:44:07PM +0530, Sai Sree Kartheek Adivi wrote:
>> New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.
>>
>> BCDMA V2 is introduced as part of AM62L.
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> Please explain dropping tag. I could not find a reason for that in cover
> letter.

Apologies, should've explained in the cover letter.

Dropped it because minItems on interrupt-names had to come back. Removing it
broke dt_binding_check (dtschema flags items: {pattern:} as not-array without
both min/maxItems). Kept the tx-/rx- rename though.

Diff isn't exactly what you acked, so dropped the tag rather than carry it forward.

Thanks,
Kartheek

> Dropping this from patchwork.
>
> Best regards,
> Krzysztof
>
