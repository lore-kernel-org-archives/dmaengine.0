Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801B04349AB;
	Mon, 28 Sep 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584835; cv=fail; b=aMaaEtZrtb5U+/tOpYJgrfA7YgUBAs+YIzgUlEtgcWXFWYTml929DFOFfMYPLVBTLlkSHhApdMLk5JeQmM8H1v1wArWHvQmYDu115CKQKjEnAwiCPg26mgkzPoVwo+9VcLpFkdxyj0zoQ14jYNDS8Owejgo401sH0g57wsBUEmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584835; c=relaxed/simple;
	bh=MToBVzGuCnJJkdcFCwbyUUt2fr/VOGBd/foVG7+gIOk=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=Kf4rzH/sWFiwKNwEFrTFZKpAB3MUamFSDOXP8PJlyFfoTvGUm1PnddDnsh8yozZTsKC0ZU1gbHRmpJknaSlaqJd6w1JVsh9ycfqhS5Ok41zwh/f5PJZOkqNxaRCoADIVrMaeJ7/VRFhN9kOIrJtVA6BsigTNbyMuV80K7eLRlYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PPwjmO5X; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pVIpPfrP; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PPwjmO5X";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pVIpPfrP"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80kX5976050;
	Mon, 28 Sep 2026 03:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Map+t6Xm94//KKx5x7qls+d08aHXQwj97SUx1DrHg
	C8=; b=PPwjmO5X8vqrticebt0QWe3KciMjQ/jk5okQfZckMhj/+3e4/jD7aAN0D
	36hu/uWK4XEe/+Bzii5qv4ZhUzE4H4pzJ8ErJtbgeZTRqCam+nRRCNfjaCN5rsQ/
	lwIRlb49tXJYI0XEvJmmVynHPPQ5DYDflj3ywJY+yGb0HP7HsKwTGaAWDX8TOtAz
	ZRrQYermSx/zpPkfMWOiDjUmrG7kMBkCCH5RBrwSH0omdtZhi5t/QIAiihjkm5Vl
	ulhsoF9EjxjhMSnvm6h5cRX7Hs9pU6CVqdpqTRjWSQ0C88h5wwi3XydrJSkqCJIk
	jRAwcQp18/y7z4beaNP3Vq7mePOzw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nvyph-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPBCfmQCrqVqbvd4NPvp1+DF48kzzwwd1HCrVTUdPzSszIjfkwvoDsQmXfGhmeWXWZF0nLKzEBFxGpIys1cDeuHYPlWrxeJDEF4qkPgA/FRWA8UU47HD2qPX9Gikwry3kURPdCCcmF9RgvrMN6hc5tYpa5r4zALBqzup3cR9V1wrugr22u5R/jn01+czmYO7nQS+vtcaWmqTH0PTS3xoI4wUZh2//jHBxZHE9v/9VGAUOo+OEquqPQyY7k2XIzwbry3uJBnT5iX6NgYOtJBBMM5JtgyI9KIVrM6jat2uOR7E7jOVq7Ibih+lRakkJJq7ZsWh+Pl3NMSjQmis6XJasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Map+t6Xm94//KKx5x7qls+d08aHXQwj97SUx1DrHgC8=;
 b=uVO5ig+Lh09+fiFOKL1dwY87JrGvM064F/sl44SOr2yxR+JNPanVSBGVUPluRqUsA9uK3DNf461M7RZrzUvz8ixRH9+q0PO0pYdFKVUoohXPnwl5vNuso/aoxyAUF0PZEhRpHyvysadhAFnvUW8upWumgYtnuslpbVCwn2BApA8QpRAO82Tz2v4wpSYpi+wa5kJoeplGdPZ/kIbHSqKkcwwe1a+M0nlRxZHDOqocK8ZLKWlMdJBzF1w05wxev+c1vwKs4qubBfnsi9cQr0HwDkGZMrqe2ZMmzOiK1rm7fN3+eU8BCF46yZGwQEpHY4InZsmDE73+d0rBzRoFT8oQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Map+t6Xm94//KKx5x7qls+d08aHXQwj97SUx1DrHgC8=;
 b=pVIpPfrPmC5W9E+EkZhW+Zd09UvGu1txIRjgKzlYhjgOy+gggTyNqBbHUnUFxMp9GiVoltINME1jsRjlfhPIEmI8T3k67jSgBCzju01OeC1tu+xShgMPX/gkmIMqNwijYEelt8FNq25VumnR7rBxLFq9Zr7CmFtzQl4o1tCds+o=
Received: from MW4PR03CA0290.namprd03.prod.outlook.com (2603:10b6:303:b5::25)
 by MW5PR10MB5807.namprd10.prod.outlook.com (2603:10b6:303:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 08:40:17 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::3e) by MW4PR03CA0290.outlook.office365.com
 (2603:10b6:303:b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:40:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:16 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:39:45 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:39:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:39:45 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedd3686893;
	Mon, 28 Sep 2026 03:39:41 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 01/19] dmaengine: ti: k3-udma: Fix sporadic crash
 on AM62x
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-2-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-2-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477447.77164.7318036930112106591.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|MW5PR10MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c48e0c-ef53-4da3-b452-08df1d3c1ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QAmPAsULDdNkRO4fOQ80bs/yCD60u3ppA47p1E6qBTIEZxzm3fOgE392hAJw9VumP5tQmHDFEbDNexGPhzzA3bYtb0YvoYc6sXJUej9p+e8EBUw1wmWWesWDhVzPogyDIvDpeyAIIgzHqLMMa4/Op08xBC+5qeBmzlN86k+KSxGHC8C2PaYaOp94Dkh0GPP3Fnt4D45rkeV4yGo615Oy7XyatXZF3OG9pk8EbOiU7G9DDdggUt1FKSDoREmofpI3piQHRG0sGf8369WhKw31G7Ojy8zlkSOrprUOWBVmGbsW6CtLe7qilxCiOdnwWH9m2JrzRUaeL+AZIsMUZcD+m6swsTVZ+0A794gyvL8OjDcyMTZez12zFvJC42+hciEvv07vH5kWKN6HukDQWawwo2NV1qONKZKSW9fhckumEwvhGRYu1DNIOnJ2AtMquRUUb2MQPNLlFf8XjCoKmoEepK8g29MJdK/eQ+Y832iqjvbVy63GDwLkXzHlyQMdAsW123GlTvqDlvEuQUxpLVOo96dCHzUmJOWjKu3+BjAtAgdlmvS3F4pg6RRBEFgqpzW6btB3xNX/GoLTapEFhk01gS64HM/7bQ4pOqsESXkCUTvMaK+lgcDN3fx/H7i2QAOF0vREK7OrZ9wNtTtfA/ODMuJcCGt3f9pYv++VXsXyWwo4KgG9p2NVFJ9tjm+Q3rmJdLlVNahJxlgK4+MVm0EnnQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9cYqMc6D4EoPSkx8IhJAWKpd4rzvANTDwvKV3tA5aNSANU+xbYwclPEX/k81aGqJJnXac0Vc9mrUxF/RCPU8Eymo3R1FFkc9qsnNCipM266qKHS4IOBdQu7QO3DBbBjtjZg0dLLt3kA/ApwLEiwTr5d6B+AHG2uSREt45Acgt1YoA1KwVSn994IV8emQNqlhOa8VpdkI2RSzmm5EyGmyqKr12+WuaoH8Gqnkv70Y+Q/RyuewcSfXFI4RRBweUX91D6EORKIWmeFx+L2B8g6Lq0WXJapzWDKFEYodeCGqls1esNEthJRlmymOEbIteRZ2+Ecep97eoBWPBeg3PqGr2iBo/kcU/1jJenhk5hmfoWCYDIY7cQDSrhKgXUlFI9TLRFnMDE/QfFtY4AtiPbGYW07boDEyB+zt4CCrdqlbegzWim8PyJ8hfXlgV7f0PlDQ
X-Exchange-RoutingPolicyChecked:
	CiZillX7QOiEWXOcS2mUcvdqEncMU+apW4G3TaCFi/XNAMyMtZXKcS/7rDGbrVFMGX9h9l7TDYLDhfIBM9waVncVj+tT2PgDqV/sKQ/jR0ZaZJMrd9CsOeA4UJBCvMzl3899YUQXJrTteMg3JAw/YA4TG7hcTEvaaGswzKc9x4GUokWitAykGOfm5d7zw6kVbkseLdvPXr/oGjSWf76io1FErk2r2BnoLfTz27KDd4TakTh5Og7IU2hGK5eIt5oR46Vplx+GvidpTbGdTJVRHvTdKEynSoljd30J/1pEcSAvGH+sP/1yugFWfBtHQtgaMUMpnViMvjnEAB1U+1hSzg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:16.1855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c48e0c-ef53-4da3-b452-08df1d3c1ee1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5807
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX6nuqlLdfK/3U
 ddu+K8RNejokTCl4Vquz5yEs08EEwk7UzUn6ak3Kj8jtrvU+AQkAzBOJWfcKvo3q1/WnRFU0Y97
 KVbjgBZeFURcg3Wb1T6003q0zkIrBhU=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6aba27f4 cx=c_pps
 a=pKtxidU6TXaQx3FGc3VI+g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=KBxos3F8r-gWtpf3bNAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pqZmgSYkVA76QWuB1MdPEeLQ8U88VHIw
X-Proofpoint-GUID: pqZmgSYkVA76QWuB1MdPEeLQ8U88VHIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX4jWBF1jym7Zd
 3jaX7hMfNDqnAbP5C8Ym8cAw7BdxPaCkLRyqsIOtBwHdOmHaKgdva4uzJlXxxTF819Ext9aMmmo
 9HY/Ckr8IIyfhvQ9SqiZqGzgoEmx48MJ/XBlF0NWCIcF9zduLmERku9qMLG1CFgXTh1SNJWiGtv
 DA+qk8kAltnktY5lKByrnT4YTg5zmf+BiYsynttnuPztuUSaVk6t0h7aw0TF5rEzsLLl+W4PnZB
 Kf1jEB1cko9H1Je5DgyNbCLoYi3mJsc2NabmBcSxZ3IaZL/yhf2qC5dpda43cffTu8pbxBPxltR
 +FEaQJsqVaoLZGVwuVxdT6GbOHWWmJOzBeXrQ8T4gHc13yHaxNXtgAIXMi3x2wsJLqGnGBKlo22
 YbnP/xbOnJAeBqvRj0/umRYmPDuyw53ZOp1VjJCDgwIkq025Vd/hHsT3JkZaHcbzRaRicLnobvJ
 JwhNcABYx/NmJmPV39g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

> ring_init_data is declared on stack and thus can contain garbage which
> can lead to k3_ringacc_dmarings use junk address for ringrt base leading
> to below crash during ring pop
> 
> [    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
> [    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
> [    2.540051] Mem abort info:
> [...]
> [    2.629987] Workqueue: events_unbound deferred_probe_work_func
> [    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
> [    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
> [...]
> [    2.726250] Call trace:
> [    2.728691]  k3_ringacc_ring_pop+0x48/0x94
> [    2.732786]  udma_ring_irq_handler+0x34/0x218
> [    2.737141]  __handle_irq_event_percpu+0x60/0x14c
> [    2.741846]  handle_irq_event+0x4c/0xa8
> 
> Fix this by explicitly initializing the variable to 0.
> 
> Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>

Please add your Signed-off-by as well

-- 
Vignesh

