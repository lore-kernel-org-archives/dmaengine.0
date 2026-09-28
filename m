Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B86485934;
	Mon, 28 Sep 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584844; cv=fail; b=VQXRVlFJl6tsK+RXpZbaJmn5+3RsXQTehWwA4syCWYGYXMq0sPdcagCulYRzCMWcESwVTGVLOpY4TuHjSvsOgFx75/cCZK5UoCQw70TVABugcmxUkDUQmkz0zJm8GcoEDxwSiyZIR2yJ6Q0phBhTo2LzLhniQhsq3z+twF/R5QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584844; c=relaxed/simple;
	bh=keXbijEzWVoKNchpaRRYAU9Jr5ySpAuzTzrvb7WHE+4=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=YIkQahrOdHKnz55IhaEUTaHhzeZT3BV/EKpjXFcOW683pRUyA73nNbrdYn4Z/6yKCQBYXIcS8JVe37h5ytcMZhgcG473yCXyN30agbgDu6fQz+oLD7vI57ntKEZ/IS+0ubeZ1tmdoJs5Ax2lcBs23vwB59IunRzfJBp1VETIBQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ciDTvL9I; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XK1+FbQw; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ciDTvL9I";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XK1+FbQw"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80e5v1469554;
	Mon, 28 Sep 2026 03:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Q5kgDoj5oeKoB2+jCQeZxkCNkZhPkRugK/DMWoWIv
	b4=; b=ciDTvL9IDGnbihgtugckSUApJ9fPPMLkCvkL9JLcSH6VUzU51h8N/KtQx
	3NFec/gsGDZkCPJZVntz+Y6HATfcxYzfX6K7Ii/sZ06CL7q0YdseIyCRjCN4Zsrq
	21aeIq5kw3LCTAUsyEt5LEXZCQhB6OkAq3xkpVApddx5NNWBJchpTXPzmLJi/YdH
	wryznTW5Z2JKXeL/m0APZrn+x8vKnYX4js/fBKi/HdY0A3+Ko5Iv2AW6MvhWEgSC
	bUDVf+kCN420s1kQYmBp19qVI9bfcw/jEjjkn9/Dv/7wNoXHilORP8SgW3Czm3L1
	LtfqmtiXA3oG7/4WkZGpLZ/q1Pojw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5mxgf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbHnE+dRH4rbbOc4QNS+BI8tgkQpqbxj7Q+Byjh/AWdLchshwJrav9Ky01/KnLl2aUsBrbOtUlgWWo7qyrxekyl4Li31mMeR4Gkp1GY/x96XhSmkEneRYGD2YWss4AuLMLnehd+P69fzvmUb6whOJrILayCsyehsiTFS0UDABqoO2b9g9uSL5onreodyWc3Dfq3mBV28DUVGw+ENjq1Fc+wIJPbZf/mdNEnMV9VJOwdwE7m0H9+jKdtWD+wB26JmwJNa4SZkRyRYEBJhvh3cMNDJcogA/ZHIYNLcaxmJ1GKple3YlfmBWxgspWjmOEYkhuJBiCj9MgV4bxsDNHlDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5kgDoj5oeKoB2+jCQeZxkCNkZhPkRugK/DMWoWIvb4=;
 b=KyWH1OC8t3lHUz1x3dqcl2Z6WXPMfpNxGjHkr+iTz5TZfuENLgvUgVkZ0Oy8RrGzWaqPlZkC9wvZdqqR/bnpkAk9I3vAv8b2An9nmvNfZM9/yNnxwaJ/0i++7q43CGRlGgkfGn5qa9p2nbNmsmNVqG5MEkOA2dsT9znBQY52n7zW6zSsSBbPBM6CbYxAZejZ6kq/Cqu8AXls+PtQHEc/Pib54N27TRgavJJLN9pdnpJN6fdUvTbX+s/PRdW4aY7y979JcLOxMdnqSDPMoUC8+IITzM/LUgzY+d3T4mDbCtk2xaoNqOmw6LI9EdtLLafYLmeiJO/AVjTE33rQDLaOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5kgDoj5oeKoB2+jCQeZxkCNkZhPkRugK/DMWoWIvb4=;
 b=XK1+FbQwRNKYqF0Rmsno/75bZ0/busvNsMFLH4hdwqwjanAdzZ8UUQVufTy7DvlD4vhaFcQsVEDHN6P/zoepbOlk5BmhL77wtNmWhQaoET8cpL3QVJ1NisYFlFPP/skomuPO08K2zzkOU1TCSqzn+1DN/ooQLLYyIIffALnyddI=
Received: from BN0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:408:ec::7)
 by DS4PPF72472EF09.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:40:25 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::13) by BN0PR04CA0092.outlook.office365.com
 (2603:10b6:408:ec::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:40:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:24 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:13 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:40:12 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedj3686893;
	Mon, 28 Sep 2026 03:40:08 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx
 PSIL and PDMA data
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-16-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-16-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477462.77164.13791442624884663973.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS4PPF72472EF09:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e73bfe9-26a2-463c-4f31-08df1d3c241d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XEOg8BZTHNQkKY1NAj8vnziAFmUBKtH15NCfCTh9ASmSHTIE5sqsnDzBe0NrvVaQr4+l008diryvzVRSK4sau/GAvo5ogNVyGsz4lQwhQB+I5GvjwsFuTqt0fGcnL+3lVmDKglMaLFX2wam6cXXZKWyxqM8YQap/nLteEqYv5eh+XwhRNwdUOu/rCpqCDf4GsRiaetRkqDRhItzHD8IeRF/PbAzGVmX2Fr9UIyChAb2dar+xJn/2rplBFRqrAFPNpp5IGl3IJ1b9qoTnPGwROUEt2VqsB1g/ZFr38wpVZgQXFYQPgnlsYUdGrYhmXxzMupltsohAkfc4w7q9Q5mMU0KagtbVI2UHQopSInqIGKeDN+N3gnFiCUE5O1bMpmsMhatsdK7MjEDSzJvDt/50iy4bk8LcTWYs2j2BBQlMz0LX6R/q3tvEJcV0KyYJ0G0OR6VntxyC6sjQjF6UyE3ZKSLY9cHWMB7sf0NQJBaBdq+t67vmP48xqeebedW63tLaMeq6wiK2BKfGajdBZQsO+btRDR9KnHCRGKyDzUPRyqbOa8m+vwJ6OeuGzaom644og+yu/ONc88pZET6xaABXyuEOMMtqr+PSQOxtcNwBYW2Sd3agK6ljA5Wzc1f62FKUbaLx7kjNTIV9JYtbzTrqSXRj6lU24jF+QXe05ivmuYurL3rEGJCWscX+aLuXUzgm7DBugBEErKzVOoCidcw5wg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7/1+kPuH3LKHRg53iJYSXtBVLAmkwl12ZINJrn/vu0Vk+KglIuxr5d5NfwDic7jiRbBsqd38nwYj+YXl+bM63j/rIwtfSjyBeQS3VZwmEt5Pjbvtj/J7wMdgEqZGNVEYqB743GHP8iCoMdU9UOEieVx2y2RbT91hmEYSstAAxdEQaSf2JGVVOgRivyBgFr5iKtVWeUFkF2ZM5tuFjn7lm88AXVHlBepJTatKSX6r/aibV5FCHGYTv+VpWqppqKLRUf/enj17jK2o7uzhoFWTdKq12c6QDJRouMm4m2xU9GDVH1DxHbOGLJEEltyV2vE9WNEQXARmpJbGYrUKhKMJMLTprSfkLrOd/yXVSUNeOV79wT3eviqovPHUA5naNljoV3wDmoU9PdhBrj3uWGtVJKwNm7rggrNX1ISEbvRme50+4M/6qisonv/t5OL5qptd
X-Exchange-RoutingPolicyChecked:
	GTs6/vf4BTtA8Ful2a6MfSqpwpn0sJY2mx5t5fuMPa7SAtJhmtY2N/IaCohJgRLh1B0Ra4R4KJhn2iqGil3V85Kvnp1pP3JuyQCfnnIf13vVMMMsVAMtjoejHE+t8fDsDVW0FNr5xF+FhJhaW32Pb2zBRs2DWewTTFKnh/ImfYcNhLloIVIk3DVwXqCBiYNo48A9T6IOisByIpTD5r1GakAvav8Apq081MAmSyffgXQTOjuzkNEEBNW7uj/T0zY9b28AqG7RTv1XjomaSi24xmuqvERnPOSwO1Hs1xSqjqD3fu8X1GHWUPuePTonMmWVX9qAy3HMhe5/i2lXKi9z7Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:24.9820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e73bfe9-26a2-463c-4f31-08df1d3c241d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF72472EF09
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6aba27fc cx=c_pps
 a=pVIVKlmwkrZr9AIty3oQVA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=RzZh17ounbkHqm0GU2AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX2pouoXW+TlK6
 Y29xj7PRNZg/oTxY+ZAKUPDQf/L/9cL4xnsmAbTiVOU2jPiZglEh7jhfpja21zRhMntnGLDKX5i
 UohfpSv8nCdupJ7EWkCxJEhdcL/mrarFeR90KToTBAYmHujF7RS9fDy/7xx3PSYVnCJB1ELEzg1
 EzV/UzqvjUIoKOZ8xmFx3whEtU6d8pemch43VZUEVw8ZNel0fmiBF0EnKvFdQzoQ65BDde7zTPp
 fQPcGIasUwP8L5sUGHYIJvVduEmSUWWbVvQlWBIlmb/DIufkKoyXG+2tRk4OcwCCCjp5FvBdUgs
 Ukrjx4tRqMf9kg4+1WH2x53q4Fnrgkk8z9Ii1jMgnooUeggWxChUP5xv1Y76BcwsLG+UvzeZxVM
 BQ6p68XiWZ2PDYb/PLAZttcYwzSwMo+RE4x3vM6gHHkcrkWQPcRRDkNkxpzycj/1X4pe24hqcby
 9AWJBbH1YAza924LTnw==
X-Proofpoint-ORIG-GUID: Rmn2jBdFd3yKCu8_cbvwl8eJ1h61VMZl
X-Proofpoint-GUID: Rmn2jBdFd3yKCu8_cbvwl8eJ1h61VMZl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX+lxi7K77wmqx
 /4Ptrs2JWbFqkrh3JS3aIyGkhGtA/X4EGpeSb+rGfZsiMZ1oCM821+pjDpxCT5lojdAQe3OV3vw
 dNY/4V/MOrWt3J0dBKMEI0tkhmkt2s4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

On Mon, 28 Sep 2026 08:26:21 +0530, Sai Sree Kartheek Adivi <s-adivi@ti.com> wrote:
> Add PSIL and PDMA data for AM62Lx SoC.
> 
> Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
> selectable fifos. Also add a new fifo_id field to psil_endpoint_config
> to specify the selectable fifo_id.
> 
> 
> [...]

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Vignesh

