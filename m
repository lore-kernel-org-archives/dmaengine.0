Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147E43B3C9;
	Tue, 15 Sep 2026 06:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455201; cv=fail; b=Jtstzt+i8jSQU+o4h6meFqHFz4kg6OIzdpFJopHhmEAW+OQF1vC2lAB9Y80M6zoK2bMaNK1S5wW9wKcg198qZcr4FKm8zOuoKKXts90CYA8qHdgljc7yLVf6Ze/BgsFHWZ73Erd9bKJe3c5kj7vhnLxHJPZhWGVp3P5oxR+jb38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455201; c=relaxed/simple;
	bh=xXiVmuPL8SYMl9whYCu34PnCgS8Wb2XHX1xIlun2ij0=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=SMPeCdJXCnth+Z3iMqOG97kEWj6pxFVpSQpx0z5WUiyRFh8hpbUzF4lFb01NV6angXKk4d8ehIcxMGXIwHWttXVZN2X5uowrecfxDP2rkkhilMMRTwtY1ELuE89Fr80ElhdNx1pD8l/C6cgtDkKl8ouCsgEAGS46292idBD5Emk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hBcCip3p; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u8DHrODs; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hBcCip3p";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u8DHrODs"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6alOG3430942;
	Tue, 15 Sep 2026 01:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4+UecYqoYev+8+80CezayT6y4ASW0PNjh1xjzhgQW
	r0=; b=hBcCip3pIlTISDDZlUrhPpEuYZMnnL8id6ik/AH4oSpERm5HENpvSDb3G
	R8tfDp/oCU9VTFUBCo5oeKcYj1J+wNITha1mklAVHxzLtXTRWx86lle3U3k3dX3Y
	UTD7ITiYcJAIYuwc4dvhgFEAop03LgZC5WNHJatCbMZTwj52pajogLKREW5jY6JO
	tNMgxa8Tbjus4w5a2zJilWSF8VQtiQKBwiuoGYH4d5FerN13zLkoBbnIrsF59/rF
	C2o/dh7I8uWmMHJhlsXjAaUB9V2m6CUQdtabfsueaRkHY1n9RCY6xBfueGqbmOC+
	6/PNXA7VGiBwWgWN+UzepE30FaQ1w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpm40ve2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 01:53:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9Th5+BKH0mCpyUXfAe0xMAPmasaHFFm0bTTZB5nW5JepjoDyi/lks1KnMs284eqS/DYJiMcKa98SdP1xm7gM+rzmPNXWKQ7EIm1pa++SfG5qln0+nKpJpL4Z7st1hw2DsdJANojrM7uSdY9y/qLBFUsNJQSDFGTiVFbn+rlsibIvr9gTXRAbdMtkuEvh0w5B3TNKO8jqoyjKMEgm6DJ1NzV8+CIxQXOiOkNMMV1Gerpz7s6dkenXYYnn8blM9ILuOcOlG7oG/6qrDIRWpQd80SWQ49u0EumPcDGL1jWQ786D7FhHQCg70xglWxNMr2hZXxd2pdXNwa8445qtD8ptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+UecYqoYev+8+80CezayT6y4ASW0PNjh1xjzhgQWr0=;
 b=TfYeb7ssdSyz1x06TE3Jh22/DEByk8ib3aWF4VCJcHrfcbK9TNX/rBRQeydh12pv738cp8GPeRZ8k6Im7wC40ku3T9DVOsQw/4dHxG+/smHKrUnedoD+NEXLpYpOIGuew1US/c6YHqJDm5zPRJ4sfnwNQ9k0644OrL0GkpI2n+vfjTHDdlO/IyvWJbZzJQafErI9BekZW05Qfh7tBnSJclt0czJOu8H73c0cZob/lGVpH4hITbvWwLY7+Cr8O2EBda4/rebkKWTYR0ijcaNWmDcAA6APIV3Im2Dzb/CEC1ThMIS1DSlgDZMRV+m5cfK07QY5U59CntVpwTNv3kKtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+UecYqoYev+8+80CezayT6y4ASW0PNjh1xjzhgQWr0=;
 b=u8DHrODsUfG6uyXnupECg6Xq0PaMmPtFoMoRZH6LDBnecvL+zacYaBthEIMjehJX5QG/SOWWXbddx2w4h4UIMrfNT6e6BMaOymr/+/CXfi/6Gm8icXSmKNje9yfSEQovJoQVVj9oFGggbTPFmhudfrhj4hkpeU55sr0gG+Ze50Q=
Received: from BY3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:39a::21)
 by BLAPR10MB5137.namprd10.prod.outlook.com (2603:10b6:208:306::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Tue, 15 Sep
 2026 06:53:03 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::78) by BY3PR03CA0016.outlook.office365.com
 (2603:10b6:a03:39a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 06:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 06:53:01 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:18 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 01:52:18 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F6q8jn3693318;
	Tue, 15 Sep 2026 01:52:14 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260810151423.1948224-13-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-13-s-adivi@ti.com>
Date: Tue, 15 Sep 2026 12:22:00 +0530
Message-ID: <178945512023.2241705.15093389710825277255.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|BLAPR10MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: f79565c6-693f-4cdc-5723-08df12f5fbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|7416014|36860700016|22082099003|4143699003|56012099006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ImldYt75fuJcmruHr+3pmPb2KziYLy+zOjpvV/EO8dtQ6Vtk5o+4CK5riIwORQNrsqbT3cu8HooVJazx5hE158ywdf269kaqQZUx4h6uxgSn2Lbvel8sbJiZNRcTCxc1T0NIzCwxq62igvwZuhZ9OHm+eWeXl6sG8ipe/tRp0pYSu8B9F1TfW5h1aNgblof+CfvVgsoGVwfNMAf7x41buovuWfh3Drzo1G9FhnXSpWhQPZCkd6hUHUnro/ECpm3PuT0tGg9j+D3khDrLP/eQSUXrf+8iQUqBBX3uOJKuEPS//w6WnSN8YK/HJN20JGuX+R+P4dBI9PDFwtdQrNXj9ZHgFJvp/2QIGb/FAFvzM45aOF4xyJt00lt5IO52z6blL2DSx176Mvy8LLjMlBqaDeNVP6HqZ0QhK3Mqv81Ra2jYMrvhyQfgxBu6+6xU3AmHKryR6X44fbaX9U5GRBFrVGm0868muK4lL4zuIDnEACwvk4OjLd4y1rBuOgwtVb5SUaVDRUdABVgIQ3gCpd6i1lzA5FQmLek755bUuFEw35lcVn/k/tfmHJ/mTjJ1WWoStQR/iu9GFcTc/rH9MaffQP6qxltOLAl+nVTbMdIxiiAF5VHYZYyDqcszcUX3oeCeHOgixXIAC4pTOZ9azQGVTSAMIJRMefaMAGlproyJHieUaCnVAN7Masj4j0T56msauYlsWmlx2U3y9k+I28L06A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(7416014)(36860700016)(22082099003)(4143699003)(56012099006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Bo6tpRoirgWs3GubiMYLz6j4nBIsi+KE8cuMRYtuL3kweSm833kawSQ9JcY9jLzceYpjPWDFUECXATi2b05HQzue22PLhIYgJFvJif19XglvkJNLqRAW7ZjaP1HV4Briipm3JtXLqSFjIJYLHovxloFbp2cZQOz41Kf6/RlghD1uVFihL2qrNMNYPf6NymL0ZSbmczMLahVnj2WUok7AWaoxaAdOydRh05wzFMsnO+e2loNqBPD+Di1GRjwQPzTU4Y7S6yYWrHeWWsFe8mSBqjSr9zp0y64akb5JRxlR0gUTWUCdiAplFC1nshBwVQZCLVclBGPkVWWGseFKRxoG/a8XC49ZCK3CybukYeW0JDl7MYPtfIrg+RRK9ZLwsI2+zmurvx6VGa6FBfoSAj8cguzw/NaA3heESANS8Riiqx8F/1EZybmJg3+L8bq6tNe
X-Exchange-RoutingPolicyChecked:
	ujuP1MlW36xN3AcF7N59jPUsxYz7FrkFww8gFXYMDSi0fX/BGlY5YjmhycXVvZsZ6fnQ1iQveVPc2H2Sx3Co91p8ARe3gAV0JyEr4chfWl6TQfe6bKLPfQmc++rzl4Cn5pO27BbbWkMapJ35QGIc4VSTlVOv0qOrmZlyufRK1ykFqnuxJev5qROoR62xuCmLU0wWAJpp/hXN4y1/+B0CA9ZDD0kB+2KjD4xnEMQfU5uBTct0W3RM5RPmtERLS5NU8GUjovDfm0glOajLjULs59ug8awbc2BaoR3TaVRFb57FcJt3ICO6X0JeFBTvUTNHBDL55O1ztjYRY4dL1xV1jA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 06:53:01.0555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79565c6-693f-4cdc-5723-08df12f5fbde
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5137
X-Proofpoint-GUID: Yvn2Z-WABqlOD2xFEs1NqVoVr1-17GRd
X-Proofpoint-ORIG-GUID: Yvn2Z-WABqlOD2xFEs1NqVoVr1-17GRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX17GMsiDQeHdG
 Isy81B4pOWFMhz6Sv6NwzEnhxeopRWjhB18ZaGzWBmYc9BQdjkEa6IkYw0wwn+3rZw0M4YMm8HT
 40wA3+IMw5Ju1rNDQw7AxmXL2R01XOv6aExbZ5UDlsl13lp40RbKb6yGMdVgNRE4ok71R0aJDqI
 DwIoGvybaoOnYtLzkyEzny3+dvElExk6KnnUFbykAnjtaP/c9cet/v1RWovzrEmXROmDhHUBpTl
 97Rbw1k81pusA5OBYeZZhXMal6vNk88HdOofNoAoeNXrvd/XmYIo0QelRlebo41RoKIhbyMctvn
 Xf1vzO/8p7WBPjU4Wv/HbnqnopxqNYXj6j00f3BlWAAl86SrDkYWqFyNoYTrrAqbwNHVxXdw5/5
 DgUOXLSOc9d7CiyT8w8aTOAv2cXQSf1yPl1hc1/h2AfK1iHLPb81deJ2zr4Lme8ovRYGoPj14TI
 j0y1jhi9xi5/dN0w9Kw==
X-Authority-Analysis: v=2.4 cv=JIyuIMKb c=1 sm=1 tr=0 ts=6aa8eb52 cx=c_pps
 a=tVU0SsWZS/EEg8/MReKahA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=knzKJlpKyTewYX3-XmsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX9Pk2vVJJdH1l
 pWrErLAiF+NRIRqQ5evGh6sElymBgWqYnLwmyA4FKWwricPiVe2rkDzTYtUKNkr4cTiyPWryV7J
 aklvCzNGVp8t3Uapi0IsWmHXls725Qk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150096

> Handle absence of tisci with direct register writes. This will support
> platforms that do not have tisci firmware like AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b1..2a93e389fb8e 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
> @@ -46,6 +46,53 @@ struct k3_ring_rt_regs {
>  	u32	hwindx;
>  };
>  
> +#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
> +#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
> +#define K3_DMARING_CFG_ASEL_SHIFT	16
> +#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct k3_ring_cfg_regs - The RA Configuration Registers region
> + *
> + * @ba_lo: Ring Base Address Low Register
> + * @ba_hi: Ring Base Address High Register
> + * @size: Ring Size Register
> + */
> +struct k3_ring_cfg_regs {
> +	u32	ba_lo;
> +	u32	ba_hi;
> +	u32	size;
> +};
> +
> +#define K3_RINGACC_RT_INT_REGS_OFS		0x140
> +#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
> +#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
> +
> +/**
> + * struct k3_ring_intr_regs {
> + *
> + * @enable_set: Ring Interrupt Enable Register
> + * @resv_1: Reserved
> + * @clr: Ring Interrupt Clear Register
> + * @resv_2: Reserved
> + * @status_set: Ring Interrupt Status Set Register
> + * @resv_3: Reserved
> + * @status: Ring Interrupt Status Register
> + * @resv_4: Reserved
> + * @status_masked: Ring Interrupt Status Masked Register
> + */
> +struct k3_ring_intr_regs {
> +	u32	enable_set;
> +	u32	resv_1;
> +	u32	clr;
> +	u32	resv_2;
> +	u32	status_set;
> +	u32	resv_3;
> +	u32	status;
> +	u32	resv_4;
> +	u32	status_masked;
> +};
> +
>  #define K3_RINGACC_RT_REGS_STEP			0x1000
>  #define K3_DMARING_RT_REGS_STEP			0x2000
>  #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
> @@ -139,6 +186,8 @@ struct k3_ring_state {
>   * struct k3_ring - RA Ring descriptor
>   *
>   * @rt: Ring control/status registers
> + * @cfg: Ring config registers
> + * @intr: Ring interrupt registers
>   * @fifos: Ring queues registers
>   * @proxy: Ring Proxy Datapath registers
>   * @ring_mem_dma: Ring buffer dma address
> @@ -158,6 +207,8 @@ struct k3_ring_state {
>   */
>  struct k3_ring {
>  	struct k3_ring_rt_regs __iomem *rt;
> +	struct k3_ring_cfg_regs __iomem *cfg;
> +	struct k3_ring_intr_regs __iomem *intr;
>  	struct k3_ring_fifo_regs __iomem *fifos;
>  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
>  	dma_addr_t	ring_mem_dma;
> @@ -467,15 +518,31 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
>  
> -	ring_cfg.nav_id = ringacc->tisci_dev_id;
> -	ring_cfg.index = ring->ring_id;
> -	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> -	ring_cfg.count = ring->size;
> +	if (!ringacc->tisci) {
> +		u32 reg;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +		if (!ring->cfg)
> +			return;
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		/* Ensure the register clear operation completes before writing new value */

how is this ensured? Should there be a check to read the reg until
readback of K3_DMARING_CFG_SIZE_MASK field reads 0?

> +		reg = readl(&ring->cfg->size);
> +		reg |= ring->size;
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ring_cfg.nav_id = ringacc->tisci_dev_id;
> +		ring_cfg.index = ring->ring_id;
> +		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> +		ring_cfg.count = ring->size;
> +
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }
>  
>  void k3_ringacc_ring_reset(struct k3_ring *ring)
> @@ -501,10 +568,25 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
>  	ring_cfg.mode = mode;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }
>  
>  void k3_ringacc_ring_reset_dma(struct k3_ring *ring, u32 occ)
> @@ -576,10 +658,25 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
>  	ring_cfg.index = ring->ring_id;
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }
>  
>  int k3_ringacc_ring_free(struct k3_ring *ring)
> @@ -670,15 +767,37 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
>  }
>  EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
>  
> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc = ring->parent;
> +	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];

How is ring2 different than ring? Maybe need better name for ring2 here?

> +
> +	if (!ring2->intr)
> +		return 0;
> +
> +	return readl(&ring2->intr->status);
> +}
> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
> +
> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc = ring->parent;
> +	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
> +

Same here

> +	if (!ring2->intr)
> +		return;
> +
> +	u32 status = readl(&ring2->intr->status);

Not a good idea to clear all the IRQs unconditionally, this function 
should ideally take a param of status to be cleared.

-- 
Vignesh

