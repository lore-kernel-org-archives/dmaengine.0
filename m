Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D864A64F0;
	Tue, 22 Sep 2026 07:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060699; cv=fail; b=L9eMmbNTASQOJK6+RkbmnySVSDttZUF5E4lu5Ydgwi715RcFdWLaxvJsXQmGsfN1cQxKH4+n3ON0js5wenPW1iNdlYt2KfZJP/RbVEqyJDb6J1hnH0Cw2UqsEBOlzcRmLDDpCszQKfB2wJc0CKb0fRvDk/JM82VNx25PepXjNjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060699; c=relaxed/simple;
	bh=JwkdHueXYZ8lyADbo7oBI5xTK1hbuDAoSsR/1oFYt3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RjtAHGSOmbEmiGs4UWul4lLp/13i0C9YNHClD4+ciPeN0wnllnxnRV4WBIT9z2xmDoltLnMar8T3LnYsi11aKA2OPGMuyY3p7tKvKQhO/RH2s3Uu0TOQ8DAPewLvA3sMqox3kOaBvOjMIwAmXaLmNFUVkEHnOAK6S5PJtVjSWvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=d6370gCJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Wss+EpKM; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="d6370gCJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wss+EpKM"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1qEwn1436209;
	Tue, 22 Sep 2026 02:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LchODn4ultotcFX499TC/iuqzM3MNdVXwQm/oiiPA
	9E=; b=d6370gCJdbaR22HU/DVbqeEboAVQC2jGuEx1wh9w/SatlwhQMOy7rUybV
	i4arKSwZhA2h3In8a/qoCVK0mcyg35xBJu1tYsVCN4xwhO6mW1DWZsFf0s96Q/41
	ELAP/DIhIZ8JKYYy9c/gE8G44wDFstrtHu+DCw5/3MC7xV0ODxIIZHNoEeiCUL1I
	p2JdSRvbcQgoNvheOYsWk0qAF8oJBMF12aE7mTZxeWy8cZbhs7NxvH6VLYY8J14W
	FfyADV7mA0IxALbWPiQhsrwVKdDr/0v0eJofNisZAwHxpUrCajXDPgW4NGBBqz78
	FaQCtHkit+1CmGSmrgEzHt67hgYYQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcssevm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 02:04:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw6SbVjdy3CbCROSap2q8d7qLAktcKJjbG2RVeV2YaRxzc+39C6w1yvlR/iArr+cexj+4X/P0Jfbtfr6mo+W2HFratqRoUxD5KYKbcqBP2AVU1Zzz0S+NueMgBt7fpO+f338mnya/AkRUqEBsusuIcce/+KOKkhAVdrjGS6pACSCnWKba6OFaLXaWqu8X06U7ASOfhktTdTC3n0HGba7Suo6cbyAl2wsoQT1CABnV0bUa8e3MXYjdveHVnBkwO/Jfbug19N68VmCLlRQUjXlAA0Au5sB5KWZ24h5yVL9ik9VUov+op/E3m8lyRxNcS4YjxFxnbB0zEo2chCBPIkCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LchODn4ultotcFX499TC/iuqzM3MNdVXwQm/oiiPA9E=;
 b=k86fPavP3XQ4tL430yjwiiV9BoD24gRCpk6O+Dmozm5wbxlafnR0lyO8JYsjC5tRPFe89DJ435KV7HoUHjz3La4Aub+9buZR+tRGMC6+WxbK5LPVo6ViYhwXyB8DiMcQTuiO5Ofuox6dvxfMGbBBJO4C/Yr+8qG5andQQagXG2qZrN8aM9RkHUx1K38fL0H5yDJHo1fGTFRkc8FCuY4ls5b+ho5u5bEwQ6xslLjfUaubPkHaJondQf8g19aJghtSwZ0gnNZuyvQTMwpB2SDazx67y6ftgjAAyZY7MugP/upzZwbuH+h6Y2PaWtUxhlemhX73V90VlrB8t+LZoyTXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LchODn4ultotcFX499TC/iuqzM3MNdVXwQm/oiiPA9E=;
 b=Wss+EpKM9LM74+P/v8Vw6ItEG/VFKsHrRnxjCh8Gun97S6JF624n1cz2eCZmU3PArT/hod0l+uHiuThZ827ArX41W/WrW87/bmnUOLkA1F3kn049vuGaTFbpo/MVeV/3zbCiXGU21YsTr+n9iBqNvSK+asKRogqrUPscUsUjR4o=
Received: from SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18)
 by MW4PR10MB5680.namprd10.prod.outlook.com (2603:10b6:303:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 07:04:45 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::3d) by SN7PR04CA0073.outlook.office365.com
 (2603:10b6:806:121::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 07:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 07:04:43 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 02:03:59 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 02:03:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 02:03:59 -0500
Received: from [10.24.51.254] (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M73suj3652711;
	Tue, 22 Sep 2026 02:03:55 -0500
Message-ID: <1af7e4b6-88b4-401e-b0de-26d93bb73c10@ti.com>
Date: Tue, 22 Sep 2026 12:33:54 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/19] drivers: soc: ti: k3-ringacc: handle absence of
 tisci
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <Frank.Li@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-13-s-adivi@ti.com>
 <178945512023.2241705.15093389710825277255.b4-review@b4>
Content-Language: en-US
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
In-Reply-To: <178945512023.2241705.15093389710825277255.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|MW4PR10MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 965e3385-5b75-4da2-a1af-08df1877c778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|13003099007|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hZZ6WuNs5g/YUiUCgrD2YNL95529xREwqQJzToNQxmh1EKqUJIoX3vbdV7gY55HtERCLHDlXrq99kN2mKds62fq6Ar6Hn52kqbvcIbCM4ifiaGQm7g/eytZIWSVeL4FKC2V+uHA+FHkWeP4cwCoFy4fRSixghyc1Dgxi2heoCzFDfMgxVk+gOdw6MMc3FDx6v7LCK08XJWYVySI3xfdmH2U/YvrzWaGtp4MMhIdmvXJKgGNIPHZIM7tDBfAnYiw0OhUPjexYSW96pusNBo9hyznixqycajeb1Iq6HQ+jxB3dgoyGMdO/4Aw9Ba5u0PLo6ii34DUBasPU+aSM2NbrXB4UtW3nEx56FF09noG2/9yBtIduVnh6ZtxJJtRyGNgH4DMiZ14jgiE7Bs/hUlN/8bFxXnyBBFmWwnuh1f4xfW7AWrFvhjuQ4kmN1fYemrOCWP6+O2GvmsFi1lMb1gP516HwgfT19hbkalqY9wX5X7HhnUouqUoeSlzc+i6AihWsJ0pr8djogqmrU17tiXw/ZYb3NwmcJCtoLMF2dQ11y/C1aNhDsyzFIkyihh7gruxJlM6EmHNd5f3iPERASGXDbiwFtS+O/ypgOrH72gg0AD6LZlQMHlxf7020kT0yhKecgT7mbbze57rpcup7xxTbFg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6sIY6K1/380wOYi3pBTmBAZp3gYP0aNeZPn4icA943Ty+3oxh0GS1t5zx/aIaj4paq94loijpWhA2f5SgXy8jm9Ex/eo5mahSs4IwhyxlW5csAQzSb/ldYNbRdQVll9Ran6E4RQz2VwYonFgK1YBi7MkSdMXnhEhG8eUtx+EfSxYv8tOXkOhfzEb8Nvp/m9BE8y32HRV7LNUYQJMmC/yPBTg/WRETGPhW2cisYKczFwjR5zeka2zaVvDQDwTgo1507jCAZLd6XHx7oFxE2AU+anNWysFbuWXEQ1TuefNazkKHwW1+asvrhRwvSFTp9Lad5QPPGETWEhXV3qiD5YkVe9haXFhRPRRra+uFOkyE759nd++cKl+Xe63i2FZUyN5KIf6Kyei0pJlUFBROynZYlTKw/ute7s9o90mLMUNbHhkkFBVy6BjfLyeh1fIz5We
X-Exchange-RoutingPolicyChecked:
	0zMLwsVGeQeD6a3byxeTLJ+XBDs2x9Vikipw+7iIwA644DA5PHvIlHvjB6De93UFaZRSaxsROL0cdbwblVz/xM+cXKjuFKuLjPXX0B3nsYF/k5JOsq7xlkFoMzhPnmBopBatwlIF+9XPLpIF5Oi41WQlRbMXWD7aZkU6FOYbKTS8P6z5eBgYuzIqu5aA0uN2dM3YFdQueC2sH4FKnfXshh3rdjfHkR2uridK4wNv3ntL5HIVDgSitsNXty3dhSkUPPqJSpfSpJbzabb104IDVeZKt+YjoK++grK0ZjKgPOOhv6RBym+FTkdaD46Zy2V4OdQTiYTo/L4iM5JQpB3ZtA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:04:43.5891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 965e3385-5b75-4da2-a1af-08df1877c778
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-GUID: tk4LSn8aNd3gN_DsBoy2Q2RSlcf3wcNb
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab22892 cx=c_pps
 a=AENbiTj01OTyMXuKFo/uig==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=BKYjDGROY1rbXhHUZSkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX5p1kF3NAm/we
 Khyb3wmoMGLZKEc6vjeSVT3LXEzN+UKLZLJEMsQJBkHlfD0lqrHTDa5OJAcrvCr/o0uKOyf7gf4
 7SLHwpFKH99zvevoxDaKTOMx4c0Apyk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5OSBTYWx0ZWRfX/7B1zmVWGMIQ
 kGcL0jtYvlTwz0wgLpyNn54NobTPfbHKvQ3omsvdGgXOV6JP7hgmU6KOsSQWdBOav1e/4f7kHDH
 T/zn6+I2pv7wdTimo4mE9R24jjI7wUciMmvB+ihvBLSD8LAFmhOwt0E9n8wNBkPqN1Xc4S8Rs12
 SF0BFLYjoNjXYhhuBjKn0F0Vuz/di5IkhTw3NnYy3u2iXu0mZJx4p/hPa4bbA2CyUlTioGYlLch
 sPCCwau/9QCMImUsKlVPNiVnqouXBdX834EIYCKrgMm1sfkq9O69hOGxL/bdTbbCgSUtFbzBogd
 cquZwIUtVJx1Jwy4x+HdPDtkjtoo+Fev9QdwJ1K8O3XnGkZnCHjvn3Ep7Rn1xN5CMJUvuw3ZFY9
 WQv0vi8GWrAFLDJFNsxxoYi+Aibnm4znGiU3iR9a4537JhcgBFqtDncnZ9yA6JbCn47fUPUdplQ
 aBR+kim9laVa4PgjIyg==
X-Proofpoint-ORIG-GUID: tk4LSn8aNd3gN_DsBoy2Q2RSlcf3wcNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220099


On 15/09/26 12:22, Vignesh Raghavendra wrote:
>> Handle absence of tisci with direct register writes. This will support
>> platforms that do not have tisci firmware like AM62L.
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>>
>> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
>> index 5966db4327b1..2a93e389fb8e 100644
>> --- a/drivers/soc/ti/k3-ringacc.c
>> +++ b/drivers/soc/ti/k3-ringacc.c
>> @@ -46,6 +46,53 @@ struct k3_ring_rt_regs {
>>  	u32	hwindx;
>>  };
>>  
>> +#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
>> +#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
>> +#define K3_DMARING_CFG_ASEL_SHIFT	16
>> +#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
>> +
>> +/**
>> + * struct k3_ring_cfg_regs - The RA Configuration Registers region
>> + *
>> + * @ba_lo: Ring Base Address Low Register
>> + * @ba_hi: Ring Base Address High Register
>> + * @size: Ring Size Register
>> + */
>> +struct k3_ring_cfg_regs {
>> +	u32	ba_lo;
>> +	u32	ba_hi;
>> +	u32	size;
>> +};
>> +
>> +#define K3_RINGACC_RT_INT_REGS_OFS		0x140
>> +#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
>> +#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
>> +
>> +/**
>> + * struct k3_ring_intr_regs {
>> + *
>> + * @enable_set: Ring Interrupt Enable Register
>> + * @resv_1: Reserved
>> + * @clr: Ring Interrupt Clear Register
>> + * @resv_2: Reserved
>> + * @status_set: Ring Interrupt Status Set Register
>> + * @resv_3: Reserved
>> + * @status: Ring Interrupt Status Register
>> + * @resv_4: Reserved
>> + * @status_masked: Ring Interrupt Status Masked Register
>> + */
>> +struct k3_ring_intr_regs {
>> +	u32	enable_set;
>> +	u32	resv_1;
>> +	u32	clr;
>> +	u32	resv_2;
>> +	u32	status_set;
>> +	u32	resv_3;
>> +	u32	status;
>> +	u32	resv_4;
>> +	u32	status_masked;
>> +};
>> +
>>  #define K3_RINGACC_RT_REGS_STEP			0x1000
>>  #define K3_DMARING_RT_REGS_STEP			0x2000
>>  #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
>> @@ -139,6 +186,8 @@ struct k3_ring_state {
>>   * struct k3_ring - RA Ring descriptor
>>   *
>>   * @rt: Ring control/status registers
>> + * @cfg: Ring config registers
>> + * @intr: Ring interrupt registers
>>   * @fifos: Ring queues registers
>>   * @proxy: Ring Proxy Datapath registers
>>   * @ring_mem_dma: Ring buffer dma address
>> @@ -158,6 +207,8 @@ struct k3_ring_state {
>>   */
>>  struct k3_ring {
>>  	struct k3_ring_rt_regs __iomem *rt;
>> +	struct k3_ring_cfg_regs __iomem *cfg;
>> +	struct k3_ring_intr_regs __iomem *intr;
>>  	struct k3_ring_fifo_regs __iomem *fifos;
>>  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
>>  	dma_addr_t	ring_mem_dma;
>> @@ -467,15 +518,31 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
>>  	struct k3_ringacc *ringacc = ring->parent;
>>  	int ret;
>>  
>> -	ring_cfg.nav_id = ringacc->tisci_dev_id;
>> -	ring_cfg.index = ring->ring_id;
>> -	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
>> -	ring_cfg.count = ring->size;
>> +	if (!ringacc->tisci) {
>> +		u32 reg;
>>  
>> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>> -	if (ret)
>> -		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
>> -			ret, ring->ring_id);
>> +		if (!ring->cfg)
>> +			return;
>> +
>> +		reg = readl(&ring->cfg->size);
>> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
>> +		writel(reg, &ring->cfg->size);
>> +
>> +		/* Ensure the register clear operation completes before writing new value */
> how is this ensured? Should there be a check to read the reg until
> readback of K3_DMARING_CFG_SIZE_MASK field reads 0?
>
>> +		reg = readl(&ring->cfg->size);
>> +		reg |= ring->size;
>> +		writel(reg, &ring->cfg->size);
>> +	} else {
>> +		ring_cfg.nav_id = ringacc->tisci_dev_id;
>> +		ring_cfg.index = ring->ring_id;
>> +		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
>> +		ring_cfg.count = ring->size;
>> +
>> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>> +		if (ret)
>> +			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
>> +				ret, ring->ring_id);
>> +	}
>>  }
>>  
>>  void k3_ringacc_ring_reset(struct k3_ring *ring)
>> @@ -501,10 +568,25 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
>>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
>>  	ring_cfg.mode = mode;
>>  
>> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>> -	if (ret)
>> -		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
>> -			ret, ring->ring_id);
>> +	if (!ringacc->tisci) {
>> +		u32 reg;
>> +
>> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
>> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
>> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
>> +				&ring->cfg->ba_hi);
>> +
>> +		reg = readl(&ring->cfg->size);
>> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
>> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
>> +
>> +		writel(reg, &ring->cfg->size);
>> +	} else {
>> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>> +		if (ret)
>> +			dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
>> +				ret, ring->ring_id);
>> +	}
>>  }
>>  
>>  void k3_ringacc_ring_reset_dma(struct k3_ring *ring, u32 occ)
>> @@ -576,10 +658,25 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
>>  	ring_cfg.index = ring->ring_id;
>>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
>>  
>> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>> -	if (ret)
>> -		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
>> -			ret, ring->ring_id);
>> +	if (!ringacc->tisci) {
>> +		u32 reg;
>> +
>> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
>> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
>> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
>> +				&ring->cfg->ba_hi);
>> +
>> +		reg = readl(&ring->cfg->size);
>> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
>> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
>> +
>> +		writel(reg, &ring->cfg->size);
>> +	} else {
>> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>> +		if (ret)
>> +			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
>> +				ret, ring->ring_id);
>> +	}
>>  }
>>  
>>  int k3_ringacc_ring_free(struct k3_ring *ring)
>> @@ -670,15 +767,37 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
>>  }
>>  EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
>>  
>> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
>> +{
>> +	struct k3_ringacc *ringacc = ring->parent;
>> +	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
> How is ring2 different than ring? Maybe need better name for ring2 here?

addressed this and your other comments in v9.

https://lore.kernel.org/dmaengine/20260922064902.2719979-1-s-adivi@ti.com/

>
>> +
>> +	if (!ring2->intr)
>> +		return 0;
>> +
>> +	return readl(&ring2->intr->status);
>> +}
>> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
>> +
>> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
>> +{
>> +	struct k3_ringacc *ringacc = ring->parent;
>> +	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
>> +
> Same here
>
>> +	if (!ring2->intr)
>> +		return;
>> +
>> +	u32 status = readl(&ring2->intr->status);
> Not a good idea to clear all the IRQs unconditionally, this function 
> should ideally take a param of status to be cleared.
>
