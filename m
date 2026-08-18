Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91A47D451
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071174; cv=fail; b=thTNIfULzmtib0bjE7F5I5fOS19kLgS+cLZz2txV5oAQeqLe4HbBGHtrEBTL4eG4yviaaVOwv2JV+jQDPk1TMoihOLw2OboVXrmi9oJNV87dVkISGqZ9m/ToXFWPd6FVmnRrSqrRQvDtbHV2ufij7CA0uu3vjXpKF6s6rbK17EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071174; c=relaxed/simple;
	bh=6Ji/YTeQNX0WKWvEi6x08j73aBFcoODDl16GlOfxfeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y93Lt8lMO5Yd62/vhJR9PgYhIqZITU8xEq27C2CJFvL7ZCxrYSwxlEuM3xg5moYzCmHLGx54wcIivRn4wdHb5h5oIVItzDPpJLkTwt0vRNkd+bEoVQmX3qpmYJ8vjoWcyFh7q97kZ/EO7A9w886h51/ds2Zme1jfOryTUqNGIBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mxW8McBq; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mxW8McBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKcEfLlL3LPqLkUZ4XsY+8tJsYwRhUWL9HMNYouCRHNzPKI8G4fHnzgCuFWeCnEtfOvnvTCQNmKYxO4hCK3XRaNrRHNtnlWRnEICCwaz4x/itB1L8Tvpq1MgXielXDWwhy7Vdt0aRo2qGo1LO9DBxNsEf1jR6qcdw4yRAojU4jEVomvzJDPdED+AA/STjsl8GhcSKKppb67Z+YTNCg0132nhww/uIDymDFdnWFWWI0KnhlP993LwTcVPLLarAMQ8p6TJKfwuLhpwkjGGIZoei1/SX8i99sHRB3qzEH2avhmjMSeJwtmiKLjZjPOkXgkJH5hQ5RzyaBrU0gdci/CRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89VF7PIkU1JCeVILIQyALvHYfFKwwvhBN9XTZR7Ddvw=;
 b=q1LIOgn0YzjVgq3aDbbPJKEjiQpVpD1vVlzy9oLyE9Mu9JLyMMk9T1xwMOj1z2Hw+jRyOpw7Lw8Duv1mWLQHkzUBTnFWpeJ35y6JWWh7BQ8wtVnH9u1HZ88iFxKystCtjV4u9HBFowMHUADhpj8qeXPKgh7ncSAsTEmrICx06cUoZX/B7+la4IdEr+JpLm770+QFl0lDf7eH+ztiOnQqTpVFxf8Jjrf+kunXSFMHnsLhGqAP3PZD8/NyV8qD41TmHoYtQ/bQlNL6OwqpUJw1GiBEuYMRKCzplAEwdmfBjjuGp9gdfRlbvcxIIvs5cXaOTP2g3SP8vs2Vq/WbAzfmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89VF7PIkU1JCeVILIQyALvHYfFKwwvhBN9XTZR7Ddvw=;
 b=mxW8McBqnE12rV0evN1HLqgVsC//k9Vt44VLxtXpLGpyCtz22Sn1G6KRdevkAvN/c23vDB1/Lqx4cgrOGIyrhrC2qUBlMSGbq1EoAjqp6W8ce/GTccHkzM46paXmscxIGCIpWLIg+HjgjYu+YHCE3UR6rVSQ0iimEvXGeQyZmK31GH+40MQvhF7wpGSmlDeleTdbEAq8zqeNSi0BxY/q4uOCAvg/l8KEM7pg97EjAUtoifbznMCFMgWegcZ+9sVuOOjFTOd46IIbCYnazxZ9RAPtleKcRW/4BykEHVu91NwjuYM4har5J2K3WxhHTHIJOz/TAxtc1WINZj0pCco4OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11806.eurprd04.prod.outlook.com (2603:10a6:102:526::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:39:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:39:29 +0000
Date: Tue, 18 Aug 2026 11:39:21 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedness
 bug in irq handling
Message-ID: <aoSKufd0kvtx0LQH@SMW015318>
References: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
X-ClientProxiedBy: SA9P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11806:EE_
X-MS-Office365-Filtering-Correlation-Id: f93a307e-72c4-456c-7df8-08defd474614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BPm+CWD4TNb7o5RkxF+pBNdxxKCh8Dfg1y9yev5jPmE2/xpOZ0W1LEbDsFv/l/WI4jOHdnnPZpgxWVbDz5AO2TdL+GjoDZt72ZCeFgn7zOXYMTJGk3v/uIOp552Fy5NcK/2s83RD1Di0JYU5q91ryt4aNAjESsTyF3nYpmRIlJr6nYkEQr6UMd5IHO4ws6jgzGVCEaIGbJ2iMrdjGyFQE+fiquq7vdOCdtYUQ5AH+nAYzUIeQF/+3pbKqL+URtcyCATuWSu2uY0l++lFipR2Ai4fvkSC+IAqapynxFZYGEynFSR4hrC/ZcuIMF8u4VyG8f9a42TcuFY8I01ue2qisdx4ycj61vg3lkV9w6wzNZnMIRBGRr+ftxwOTdpHfCweM17Ep38BiEc0bAKz3v+NkgNPK0m/9YwuRGq685Mxzkr9da3aWONqpZq8tvpredhj1KheHz5iJ64ePejBXm6LduysLYcK7+i/+U3Iq+mFkGH7cLZbPWckm3ij67QG1/DXGOgIMTTRUl9HrZBBiqdzxAk/v/yDs7yuHrJaICEnNNSVa1WwnoGWdqFQhnFZsfFTLApzctNNxun+IVuhac06blW8sl1vuJDvkLZA34MNZDgBqEbviMekEaRAiyOQ6vCKEhaOA9SrCbexhl1FnHUS7xXrcrT33eSbSMUtlQ7cmZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nUDfw8ZtPbs4edu6fG99UydUzhdDSX1Z+NgBPDyNAeVHAVundNxxcRcgWvnk?=
 =?us-ascii?Q?Oao0/tCr4CehavzS/OFf+7XveK3M9Cc9k8imZNpjUKWFrkwJtZ3FcTG666ML?=
 =?us-ascii?Q?mnlPyfwl0BwG+xNNNNJhrPV11Py0H8bOISCoGxvPFIws4QegP2YTkFAuYiB/?=
 =?us-ascii?Q?J6QmzQHGw8zlTmO8zd+xpro84UjYfEfLS23Z4HLs2lII21STZmvvkwlpGeOJ?=
 =?us-ascii?Q?0/JP+FLEEelT2disBZqZUncLLq5CZUnS7YDoMrcWhx1Z2BdH3nprZFQaXKWi?=
 =?us-ascii?Q?UMWHhvUr5mgrADhpeBIROMOFxQ2zn/2bWMBXoV6egCYmCpLWWogW1V2IbA5M?=
 =?us-ascii?Q?OR+0Dxv8GpyIpcunZ4DMkZErdDlSQmXU304iNpiPZl7WxtSruYi4luVciEYE?=
 =?us-ascii?Q?zK9ObllOgBwrHDAJvCSYiw9EwUn+jLU/HaSYMU6+//JeKpoD8hB3zGg3qwI2?=
 =?us-ascii?Q?5lRIKa4Q+Ehu8Xp3U7PypZlT5pY/4fU2GSpkWkzKnU/2xm77H6IIVwbuOuCf?=
 =?us-ascii?Q?ZgMRnzhFqBH3pIfNhMew0DEQad3dZ5W/MY0tJGatqgEM3VE5nDGnlNtiopPz?=
 =?us-ascii?Q?AxxIr7rKROgfrRtZvHBUSqNO/pTOG9Kr3se+ljlUOAq2i7AkOyoNtVtWezno?=
 =?us-ascii?Q?28GdBE4j4mlqhoSDKl356K0pKe5ij/ATVl6ZFUsXAv428yhNUS+qvPWSN/2A?=
 =?us-ascii?Q?REFcubbOAU4nwECQ2gZZbO9WBGolaZVFds4+6LKM5ftAoaBv3urezIorgUHU?=
 =?us-ascii?Q?EXbu7nLRWp0fMz0ODeNhAdqe977ez6H5lJ3kgoCAMhz4pH+XQUIdhoCbkvn8?=
 =?us-ascii?Q?/6clBy1eC/N+p3hJMfFnQpW+zFdBiuv5vEoNCrugMlFhh3X0Pwxzi0emVTi2?=
 =?us-ascii?Q?slqF5hfa7Mc1oWYxVPWqkDYx6EKl9YBItrL8pT5msiVM2DaVZvvWVSBLTgzV?=
 =?us-ascii?Q?yG4a52u4FFHrAqh+3gJsgicWDR00B0lOdwgVI7w/AQ/53p0iCWA0M4z+gCG9?=
 =?us-ascii?Q?nohDTr7DmbmUGofrmXcvnshJBDxPv9IdMxQCBHwF/j/ae1j1MOqDlFyqzepb?=
 =?us-ascii?Q?usY3/KnYbCkanG4bmxuaNgwIHlW03lPjswsl//ZBdxZnns10zl49SN0egn2d?=
 =?us-ascii?Q?AA4P7ZB6eKS/5rflUV6mt8zEptO/r/Hix8nsP9urLP/MCxEpNGLZg+H0TxqL?=
 =?us-ascii?Q?KHA6AgAbYZB1LCwjJMr8dC4nMletFkAmj8bPielnjgYPW6jsPCQGh1ocu5CH?=
 =?us-ascii?Q?EKynUCQzgyFnQvjzJOabKTUGZYJ2AbNwW0UZ4RDi9pN1eWAVx6vZUjd/XkIB?=
 =?us-ascii?Q?Qvfnx/x/yNtU1R+14i5HtCWAXCwwyo682fWWNdNG+e3S1UDX1W+YbvLbFDOj?=
 =?us-ascii?Q?rceeGHMG0xMTeDPFtofMsFdM8DEoBb6ZiXSUCEJQazsMeYvjglbUbgckp8tZ?=
 =?us-ascii?Q?NO3KoPzuNQP6Jooo0gy9o4Oqlxaj5wBJ9Bc/Ib0vzETVB9NcWIQehZMJdwO0?=
 =?us-ascii?Q?15IgfpQQt0kQ4DPo/+Nk+BpWR1T5DsxbJEh50+uogtQk3bFNnBho4wFfgjRh?=
 =?us-ascii?Q?07iTOS+lw+dgqL5p7m4LC/cO2Aa+j2Y0FY0yoT3mv42NkRWgqfNOikWRRGcp?=
 =?us-ascii?Q?ThPv0wHljlT+g6zU+/6gcDnR3rRfiYGon4t3dW8SWz3p65Cp6HM0B3G4IVM3?=
 =?us-ascii?Q?EwZSDsa49sJwHQJXtBIpNW5pXJJNUYArjNT/ahQvZFuIbpHHi3DHQAwbs6Pt?=
 =?us-ascii?Q?C+5RoYS75HtugzP2Vnd0SXF7y1z6PLfnVfVabs/g69nLhrp5lwei?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93a307e-72c4-456c-7df8-08defd474614
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:39:29.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD52Nf4SfiHjm8C4xTKb/iP5rvUlS/lugJS2zAiyR1IxmR8R+mIC7FW7nTdMoHXHGHWzU17DOJD6eauZ0vFIFl/d7B3y1/LCeBDati3x6tAgD34LOyG+Hroj2BrKyJnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11806

On Tue, Aug 18, 2026 at 05:34:48PM +0800, Binbin Zhou wrote:
> Storing that negative value into an unsigned variable makes the check
> `if (lchan->irq < 0)` always false, so probe errors are not correctly
> detected and propagated.
>
> Fix this by changing the type of `irq` to `int`, which allows proper
> signed comparison and error handling.
>
> Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson Multi-Channel DMA controller")
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202608152230.p20WPlS0-lkp@intel.com/
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc85..969dbc5dabe7 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -90,7 +90,7 @@ struct loongson2_cmc_dma_chan {
>  	struct dma_slave_config	dma_sconfig;
>  	struct loongson2_cmc_dma_desc *desc;
>  	u32 id;
> -	u32 irq;
> +	int irq;
>  	u32 next_sg;
>  	struct loongson2_cmc_dma_chan_reg chan_reg;
>  };
>
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> --
> 2.52.0
>
