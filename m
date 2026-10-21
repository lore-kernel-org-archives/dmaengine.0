Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601643;
	b=wi6EFGGebnDe3GfXbCc+uu8s6bGsLPYI3MaqyfPSONpIeYu/0CIr3KpnyAokcX94nyGa
	 4mlgkVZxJ77JRgnLrpgq2nPyelo4D4JMFh/LcgSQlnzE2kBGwkdegv/DWI77hm4BB7Hdy
	 nUa+cz3ZRjeNZs+MwqPwol386Dg1MxtsDpcC6MmGUNQEuTR4U4pDnxD/RUaz/SbpxRpYm
	 7DFygr/Of1EJqWG8zXcHbHMXvvfD6w1qN71LWaaNK9U3ZOV2qMKTBIjTMS5xID76IECPV
	 YZ1h158linJDoMf7wp0BlwXqwPhthrk50adCHqX6SMj+RU9x8yess4TEpk9rdJ8CeMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601643;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=j9ayVsPaDuzPf+DABZmjcsdNDnOueNMjxVOd13ZgYPg=;
	b=tt+VfPSf08RnRLj1F6XaswLaF9ie58wreSB6oIbIh1ARZoLOG8Z3Nv356DJ0UR9PDwac
	 +rz5lqif3Ng9e3L23Dl0bfhUQy4BFLe9VewfnvrXaBO9gY6Iw0Fw/fUnnk+lcT6ZhkQDa
	 k69j3Atx67gd6npwHqZPCO/zsfG4OwOAHqcBy5Nr285wKgRwbKwxBC84lfdpUpH6VK9xI
	 CgwYEVaDY/QQlfuRFJfDzlsCK7p+T06Ic+A/w9PSQzCGqiVh4mV6bsDs8ex09sDTJJ0hJ
	 sRrc8KSc1vElf7pWvjSlpXLs79sJvFmicn1qNShgGw9a+Ih9uEvefaZkJVT9dOr2uXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LGjkD5UL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.12
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B51606A31B;
	Wed, 21 Oct 2026 16:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B51606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LGjkD5UL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzIRTxugJQ9ZQM+quPfn5/2QXYuhoGyHt9CDzCoK1YRlUBuGwJ9uzfgZfi05IH0OgNSU6wNbePR26xjfNEZai/VgWWtW1hZ8nYnbSnH6D2a1+qhwEilnkeXzyA0mCnTQ6NoWlitDcp+ylkFYEQHS7aU4dFxSODc8XIBOhjAJkHqIXcxVzrq6Ww/8zvRtjmyzMlAhiv5iTSPDWj4DOsokCZGSlyofJi466EgAf0UivQs/NYg8SUSBqZqIkrmFqe8EzJMP3vOYIKjqKPvnpJPtOh0QFOwbVN/YY5rzD5KFBTbtIAM84VvHLmwRL48dBgEsi7bkux4Cdb9dA0O52HsUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9ayVsPaDuzPf+DABZmjcsdNDnOueNMjxVOd13ZgYPg=;
 b=w/A+mFNjOsm41yN8VrKW3p3AxTzko6H2rZuzHVbK47FrHuEiRxd2IMYsPlo3m0WJk8JW6pom4JuaedjLgcJgyf7zduGYlH18DgIoNZNZo6P/ILWwlnx/BygfzOf5q28Rbtpw7RmJj2p0wLQTY9KLV6ZKH8PPvSSrg5FiuNaUdsdiqstO01nDUEQPgVWPwfWPlbgfdRvXLfJD9kycaPtXYx6bjgAKxnWvJ9w+UZ/9jNIE8nD3EiNEvZnPFkj3hd5HU+nOkLBXH9zfA+Cce/MG6mbeVKimGUWE5KKx5Y14E1NhFrR+tLE4HK4UeLsWA9JRml3RMST8oqBKqw6glTuJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9ayVsPaDuzPf+DABZmjcsdNDnOueNMjxVOd13ZgYPg=;
 b=LGjkD5UL2RIvZu7HsXy81LvTob7mqTDJ3ZpXZTeDgT6o9F3DDrFmYVblBadEq7wsMhyOafxg4FMKq6YUzassrlLKInC6deaC4fGQWz0hsYmDdzGZXAjtpGPNjn7hYUOZOtnJG55sDpQ5qS4Tm8oWLRIqHjxEfohaGUSc96RGgb8JYI8q6jITncKfJoxl6kRHS1+IwofLPImMue1S9UdGuEDL8wQfuwvDgx9UrWJSBOWjrFaxCjijCdCe9u/UrzKkN/qV8mK+zZqKaNG8ZxDp7c5oEAAUkkx1foAh3UFAf5rYEhWSua29i2eTgq3j5vtQRhzCm3fY7DVXbxWFILjAOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11535.eurprd04.prod.outlook.com (2603:10a6:10:5de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 16:53:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:53:59 +0000
Date: Wed, 21 Oct 2026 12:53:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA mask
 fallback
Message-ID: <atjuH6rn72pH67DB@lizhi-Precision-Tower-5810>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-2-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903115441.912500-2-zhouruizhe@resnics.com>
X-ClientProxiedBy: PH3PEPF00004099.namprd05.prod.outlook.com
 (2603:10b6:518:1::45) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11535:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d5d85c-4db6-48b8-3ced-08df2f93e6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|19092799006|366016|261021123027099002|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|261021121427099002;
X-Microsoft-Antispam-Message-Info:
	Bqfmrv/sTWWTLTGh+Di15tCWct+yALin03GsMF3KKKRloaIs2o9tUA7Nx7SVdayJ4vnCTU7Nly+5UMSLRPbfWRYHSPpPJDpVgnF9kGaOTTavghJ4oemkB0zR7pYv8nRXxcBxCpcSahhyIfFb036MNfFi8TnCYc8AlsgRyhhjsStR/whIb/mcgPZM1HDKc9GZhIXq2FCzvXhI/B0NAWouM2Z03lhwVjo/ZgXtwTO9iGn0eh7cwN73Smp2AJTr3QSMFywRULYDOfJRKbLzcLuj6tg41dolphFkJ2I9dyZPFf4jOrjK/hrr+oJ0zR2nIkELBbpA3XBaALecQHeqTRlYNhFjxeKcupqzYnj2nechxFbxbNq+/8HGr1rQadRpvG5jnZ5xoEbeMhf4+NsDDrliMAmv0/oZFt54zC+Qs1I1kbJZ0vhr0zbii5Js0FxyDVmPYX3AhfoxANkWvUA1TG1Ot0jwl77mrec+iGJXPpitaYNd1D2YZ9BaoDzKDd4KM30Gj46IYI2kOeehyT68Tqx4oDS+oNVk84palNJL0axLPdnctcFRh+DNSGZEQKWthRvPRMk/CMBpOHp8+oAsQYHaUatOrWwy0zQhzYI8pCApKvFZnaJ902WFVdezzV/42tiX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(19092799006)(366016)(261021123027099002)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261021121427099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y/iU4+xzkl729/3nR+CfFfsITPqWW1XP7u01Hp5mHFvy2BxK501o4m4K9kpW?=
 =?us-ascii?Q?J3wV/xOJzkxeHu2eGpx6u1aei9YJJ9uMQaw5in9HW3GVRZAwq6AJy/f1VV82?=
 =?us-ascii?Q?nffZGEdJXfU/BWTVq9vBxDm8WYafqnSqu5jouey+oVjxInf6krAfqfwJcdvG?=
 =?us-ascii?Q?Qn0ZNLRpwZzKopSUMavRnzjgbV97t4C4uMvxltEPGeYbUPy+L18cBPS6NMPP?=
 =?us-ascii?Q?H3Ywg5aAmp7BjfYVfnW+eGSYeJ5M7x4kvD/x51JCY58i/Nw93dmUhmYU6zTR?=
 =?us-ascii?Q?UxFQ6RyP6PSnY8a96RHPwIL0XQV2ZQ2j2/0svYQLvlUA9AYB/VWFwTTnQuQt?=
 =?us-ascii?Q?E6z5dLWmXdEgWyUpBoWw2Q85GsKX8ksZgP+/oR/sJ1FO+pxcteyZOlQcTTeK?=
 =?us-ascii?Q?AT3kBKpedWm5FTrWJUPQupfPBneWy1o/5NIkCdkVylx9d85AXiug9iZF6CXu?=
 =?us-ascii?Q?ykC2v1WJoT45p4JQFerjmkezKBx9XXxqT28X30tbXZS2kdc+zeF5cGRNIdgi?=
 =?us-ascii?Q?azHtykZtQSA7aYAW4n4VFE0d45eocvE9t4IPkpnOxduaQSUIQKJXWXAHP04k?=
 =?us-ascii?Q?v7UHjoohy63nm7tQ44X2ytNdb4jBnc1IPE20xNowmwR7ZjpYyx0GTd3Ueu+5?=
 =?us-ascii?Q?AvdwkLdKl8hdwjuqiDD8cqVNf1JXd/aH32WbVVNAyN7IBqgomWr11xS4a7cP?=
 =?us-ascii?Q?7W83k810AgZR0SqvyJd6pmLTNTRwz/jTl+w4nBkNrI95oznp1ZJC5FJiiDPx?=
 =?us-ascii?Q?kUSqXE2/GUV/eqgGNcyZPKUj3lXF/1vNutTfwZfQfjSDRglu2xO4Cx22jqhT?=
 =?us-ascii?Q?0JpKS/ahDJeMnM/tCTS1Og4iD3ep/OT3h7V9lpvHpHfsGGY0vxnQM323eD18?=
 =?us-ascii?Q?A+v6/OgFTQOyfYEYLItV4+oAkQNktqauWSBBu4tJtc73ZY5Slk0cumq/o7X1?=
 =?us-ascii?Q?jljISl0xIicDzJZE0KU5PZqDs6CAoMMyqi0+XHXLOCAPA2pZDyzesud6u5+o?=
 =?us-ascii?Q?GHU0xFRkKwG6rWlCGMPnCgvsAcRbZofLtlOX6qa58ukIUxCC21Ht+UgdDwzH?=
 =?us-ascii?Q?E8LSa6fDqeHJe/oJ3pSiFNW6uDGUJ3E5xzQMxkEDSPiWq/0UmOG54DJhGLXQ?=
 =?us-ascii?Q?HdJZW0n97D9FIGIWgxTz7E5kIpAY6hQ5mfSHW+yrq+LuINqLC1ubZSpDDANg?=
 =?us-ascii?Q?h0Fc7uJNn9kc26A7c1SNjCZxvCjQEC7A1mT7+BaparcJBxXdgOaJuB16JTy9?=
 =?us-ascii?Q?GTIKpg4o2Sbnrz+Ulg7gnsLoHdK4TOS+TI0/vaBMl4DoUQF/Ky+2SdHCmLmW?=
 =?us-ascii?Q?sc3LigAEBz/w5h2rYvTQVeYesJmvp4za4wBIOHBPOdQunjBuEgM5gqDTbdDw?=
 =?us-ascii?Q?gOPfr+EqMwBVJkiRb0EPDhPXyxqOWIli1vz2CRNWwlcPQxuZUqdenLd6APz6?=
 =?us-ascii?Q?sDPETUpGudYDCGX16xSqLaaUVw2OmAGdS4zAJ8HPiiqJ/SpaihlsIp6HnSNR?=
 =?us-ascii?Q?GeoUvboxiLJ3otr/ppVuC6/hnUBCpkD82ua/RnZmc3VXjIiroEPU+Qg0eRkR?=
 =?us-ascii?Q?TCs7dxgiIIugmU9G38K7RnT5SBk4ZsbF+HR5WWAfwzQMNPeyodt6j8dtbOuL?=
 =?us-ascii?Q?7pGJrs3iHr0kdalL1UuDW6uk4WRX0Q8uPfYhvDWz0V5X8Wxh8G2RSmd3a0a3?=
 =?us-ascii?Q?T1zEWLge31QwjIZLu8GH+M4ikG4O/ZbKO+Dxi/RiyiuEgobX4vsQvQdltFtD?=
 =?us-ascii?Q?IlS+2AGdgq5bzlw4nVdB7NoRD1xEUkhFEE5mbXzpV1qXToEATxQ3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d5d85c-4db6-48b8-3ced-08df2f93e6d2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:53:58.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qg4NUvwPgocJkgMtc7YEBc+yg0TaK8CiomI3RJJ49pxEdOjpmsGc7OCSj9yJ4XMEPOdYNba9ufDvB8PQjHeZ2uLkfyZk/hlPEvU54nyElaiw1l7t5BWm1k1twhh54DaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11535

On Thu, Sep 03, 2026 at 07:54:39PM +0800, Ruizhe Zhou wrote:
> The DMA API guarantees support for masks of 32 bits or wider and
> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
>
> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure is still reported and aborts initialization.
>
> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
> index 22739ff0c3c5..d36bb9c67325 100644
> --- a/drivers/dma/amd/ptdma/ptdma-pci.c
> +++ b/drivers/dma/amd/ptdma/ptdma-pci.c
> @@ -178,12 +178,8 @@ static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>
>  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
>  	if (ret) {
> -		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> -		if (ret) {
> -			dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> -				ret);
> -			goto e_err;
> -		}
> +		dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> +		goto e_err;
>  	}
>
>  	dev_set_drvdata(dev, pt);
> --
> 2.27.0
>
