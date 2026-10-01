Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB652EEE63;
	Thu,  1 Oct 2026 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844104; cv=fail; b=Eg/cMVSLGkVhxw4tkY0Uh1GrjqIzh8E3CApRHbjlis1Ze1bTJJMWNMPT2RBZM8jqvRKW+M3z1B5Q1l413USbXO/KxL9rwAwDXLtAgiKKi8RSQDPfgVNmVU396vWSLg/tu4KvkTbLDC6oNHH5QFffN8v3tF5EESM9Uws3LinYwag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844104; c=relaxed/simple;
	bh=PwqPsB5h690PElZPCT+7TURrFnMC1TMJU2jOhyc4/9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmzqwO/UC+Pk13d4ptxGKyVTpK3J+tYRelYykNrAhaqm7XBdtOy9cMW4ezeWYkUAG7zRIinUTr3IzmvW6xwp+vPE9OKeL11cxzOXfir6dkA94wGyYlXujR136qEMASTRrgNKlDt8vK0tGTWAVBZeslbX0BY8/FhjTu30dQIY4sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=diTz4dDE; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ETu5CeBN; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="diTz4dDE";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ETu5CeBN"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69187SwZ1207686;
	Thu, 1 Oct 2026 03:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YRns9VNhzmACOkhAZ+MXJZgznfcQKJTFQKKIpa0xD
	zE=; b=diTz4dDEbkxd4a4e7ljX8n0lL/+4s7D6oe7hUX7bpmK2F4+92KGyC2v7O
	0JYvh/5wfAi651LB2QsKQxX5RC4ULrrz3jKKNuHYvO06bBj+c1cJCqMHUnyLLPRe
	DpTf0AgBmLaqhUoMybnUdRs/fRH0Nae+PD3vmJ8J+2NUV5LhRW8UeeHIgjhdbH1X
	8riaWG8wrx3kXLwkFSIK9gLHiyfKAbzonptfMA4qqvSM4w8z0Kau4cJJnhnko0Hn
	t/vPsB4sdI49R5y/kDLsAXJa0LK3CZJQeqGmmp3m2Z9NNUQC0rKIRD7M+rfMjW+R
	2KIOIDOWsWVPwCZhY4GmYW4gVSs1A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqyg5mf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:41:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOOXItE2eYJV8F6HBFd87RBSRbMjbE5ndxD6FUcE0WxnXMqQLxx5fIkUFn+ApfYe7Je5BYVMN5h3t8Ws1KlxgwR8f1aOTOtEjmGXggnCa/CMTxDOz83izEVdYPw/0GNp2tpexwH6ogW/MYcDajKSEoTewfKoYIfQ81f+E0u8W9kKUP0KsTcZQRFyhmY2xRi+7WsSs6GdNEL6hjP6IWD81lEbZpk0hiJTS+JCH3HSBwVU6Be4zrP6O9pEPg9Sljx5y6N6/Yc9HQ4D/H8vTx5TpDBZkUqPSTGLw5b3mzpZ3NfDfjhucz2AcXMCAcI9coFruv+1YcXrIxw2xdZgIeGZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRns9VNhzmACOkhAZ+MXJZgznfcQKJTFQKKIpa0xDzE=;
 b=K91d/78XNDH4Dnq4rebnLYJPRAvQKXIUDWf4Y7V/NIRGt08Hd9HnPyDO0K1wVk1DYVwGHExZh6yVmhMaVIvT85OJk0ZHKgaRPx+zLXffqKdwjx5VVXhIrO+iQGeyRxp2gLknmF0cXcZBSZHByjdteI5ViT8nn8TJRLRO0gSMfNQpNKNhvKNleOMhgwCWUz8ReAtTc/jjKJxbYmoxWkJpm95NrGjTNVBVaI1EjKeHK5Ar5tuTyJiHNrw76OvGusqlpQZO9jCBnj8J0ITz8wH1GjIjbIvlStEdNn24I9n/fvzBwNkjKw/S6ba8/gDnpIzWhqQRcYFcpTwTCB96qY2oxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRns9VNhzmACOkhAZ+MXJZgznfcQKJTFQKKIpa0xDzE=;
 b=ETu5CeBNqAYdRlG0rIymOLWLTjbxgSDddAcRwpMrIeKpZujTalY7p3GKn3Mdph5HL/KXjasK4g+8x3DQYN4TG2YConpCd4ixtX4OMl7CeGNAGkCTfgVZkOVszh/jqx3w5dM7PEXGtFiH5+89+Ddgsy1TVejk49lFyW1H3TU6vQo=
Received: from MN0P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::18)
 by SJ0PR10MB7692.namprd10.prod.outlook.com (2603:10b6:a03:51a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:41:29 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::4d) by MN0P223CA0029.outlook.office365.com
 (2603:10b6:208:52b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 08:41:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:41:29 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:19 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:18 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rq630551;
	Thu, 1 Oct 2026 03:41:14 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
Date: Thu, 1 Oct 2026 14:10:17 +0530
Message-ID: <20261001084105.1692228-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|SJ0PR10MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0065d3-9d75-4496-4a9c-08df1f97c99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|82310400026|1800799024|376014|23010399003|56012099006|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	UgRiTN1WRdgtdv0QCFo5Eea5ug0c668opz0KIa7YUUItQD2GdsaWHvfGhIlFxq478GOD+nS+H4tr0dJ6IE1WbU8lK5BbO/68ARFcAHQXmeUpWKmCfXFkz5Eoaq7UklLQ0avKRq9cIz8ugfk0mcI9HlsjLtfZKkmgro2FeG9PwQINkBsV7A6GUcyYomSwoVQqA5pqpgM1hOGKHrISG9zVEx/Y8Czz+CA2gI2nQeIkEWNUVol0hKcmDKI3AuDs8OD2Vlo6g2GYN+P07vFLeeiVCoo/sqNeXlucCIWo5aOVRihAZvsa1dtPkyWob2Qs2S1W5V3rxuaTtZQZhGKl75UTKyxoFaUCD7UrocRtV4Vy7Qd93g6vVn5KQG+5hmT+3t86dJlQ79ZhwfdZqcxQyo0bv/VLH9y7KolehbrI9aSHD9ouwo6mQTBKAJbAKAAJBaA98DXbUPc2Q6PQLnPLy4oF0vj7xRXThGSd2m0lDCYD8KRkERqFlFlkmudxaE6VujEDfkNWYVgP4mea9Jlxz45ORqc4Jbh2NEF/hSkFqkdrlyIAOW+1wFkl+6Kksn605Z690/cIHDqWF0HF0ASmtflP/78PruBjSRihevRn3a84HfCQbBWScVV73q/kiwLZqHhfHvEhJGXo/vcXTcH1zPAsVkB8kTYJMM4uuwvDzMYphnV95NTyx5nI4jThKuKq4MdYnkw0rsieuLvsByhlk1sTrNVWYsSb3/rZEsxJr/uDy6qlCD6BCdb0gR2e1VkGV8uN
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(1800799024)(376014)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uOu0weZR3TlKVOZkF4LCnOn66ESMmiwG4qjJC6MzTH1PWEk0RUCSxhrzSmZU9c9ZC2xVSTtsz76YG+Q3IG2FkEN0dea0xKlB9+MtRmUUcm2Yp/CPUjHv5eIH4edF/NxSDlmkShh2FU9sEaSTpJX8vtedpDyV7y5Ku4kzZ1J1x6THMX55MH4XpHFg/RQ/w+PnOewCTBaQRm77arEby85lWMCTdz8c+xCI8VFCgUTvypmh1fjZ7BU1Fi3rPfucHxmDUoyJVPOcTuQSEDGAQ6mXRPvUyYHSLcUjFnvH6ahBRGFv+pvUKD2n0ESK98+7ZQ2PHSK9EXYm7uV6BQeppcznvRqSt6ryFquMgh2f5p5JtssS8T+WNxVoE+d/STCxkOkGkqRBue7ppEd4XChWhKoKGg3+7cYKZrJJ8Icgp/7af7JgQzda/DPpTKZsY5yVn6Qd
X-Exchange-RoutingPolicyChecked:
	AdhC645jC3VqjGcs0MJQxrNzkXdzDpeMFG63aTOgA5KiyBndh0f+3x7gKvTbNE6/TjBVW8/P8HQkmx0yGneOaQPJoqysPLey9DnZpDpHFSd1fIGHdI0vzN2twrIkWySuV6pv/A0iFcJ2EPFS0obvZx5KqJih6W8lOu/tUne8DctH44u0tCKVWCUcpJVUXVhMScuElTGguW+vf1hZzHnuPsdfumZExpqNL4zaaWrna109QjDt00XHxXRrQSuM1hR/6OKHR5JkWxJtONUvY0laXJuEdwf1Axd1BABdOeTcaLAhTHolZyc07K16dYvTSzOsJP3+hhgoaKd+eysQojiNaQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:41:29.1837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0065d3-9d75-4496-4a9c-08df1f97c99e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7692
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX+fT2UioD+LSg
 CYAB3oJ8+8FzHASLfTxst9J8qYLP32reGPAZasbQpSv6nho8e74xG971Ge8trGYdzud0zaGR/QN
 90iE2NhIhm5ragHtWnLls8503/MTyFU=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abe1cbb cx=c_pps
 a=4QxnTjFVIeqV5CvpKlqXuw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=ErzZJD8jrLunOkJDSy0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4qs7/ZDm3ytr
 9reHizr2Yuo2Nho/E0OHWgzho/W4JpIpn7qngzOT691/glTgqQx3zH9vuBtgobyCJwFX8Q9TQuQ
 42J5CC0g6yZBZm26Ypsetzaajln2YbDMbVsOZfxgmAb8XQOl3/YDGPPEfBh2b2zLiyP/8Httbqa
 LfihU1OqpT7W/NMPLiw66SmWqZIa7evDTx7oir4LukSp8fTkv3ayuf6RLAMfrLfhBqc89ZWou1O
 NdWMUDiGZLSvhMsOidh8mB0zaZ1UZllZS42z77vvt4fugPAGNcNYMc2mpXmtKiz53ArOIYh6uj4
 FPL7Gsxt+NRZ1miEEM+5IszKwWpMrCYjVsYgys2o3WKHvKWnrTvGdHPkSRLkY59hJSYYLROWjXY
 5xeJgL2xxno13zc6j4LO4R0kuL8Zt3x1oGWdJ+IA3gf6HkHiz3TIiF6JCoN3X+gtLNTQ9PKkqrs
 04z9TLAi5PEvUGG9SRg==
X-Proofpoint-ORIG-GUID: fjSsrCcQW3bq0c6yF6HWO_GpFIcG3xOe
X-Proofpoint-GUID: fjSsrCcQW3bq0c6yF6HWO_GpFIcG3xOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and thus can contain garbage which
can lead to k3_ringacc_dmarings use junk address for ringrt base leading
to below crash during ring pop

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this by explicitly initializing the variable to 0.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 78a67cb9d6e00..8457644cb9132 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
-- 
2.55.0

