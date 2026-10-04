Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE07D2D3A93;
	Sun,  4 Oct 2026 01:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791075808; cv=fail; b=ALCcQewS9H9k09Td83Z1jW3XFZGcwoJV+XZFgTBkEk/rXXzgyrqlIU9M4aionfMDWu5/J3gMKa7KE5rzu/jHiAvtK9RRta3lKGufITbONqfF8JX1l1PPPBDSTqcHm1MjCfEIyo+3k37fW/lX4XKR6O9oFzWYwXF0D53BPuZDZDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791075808; c=relaxed/simple;
	bh=Z61xYa8Li1dZTN0PIWWF/VsRo45bH6SI7IWjVFlO9l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MbWR+Yon4Nr/QD0u7yjW26m2BOMOZlP8ubPgmMxF8WS1XRvCcRupGCFPe4uiRSY+wd/5kbxflX+b19DXYCmM9MB5RFr/AbcSXuUKR3nJzkvJisaOVb6ciSq/N3ZB7BZd15ro5S+7MXKV1NEv/XnmZsDOqdjaqPCmcqSVZhtbSYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n2w7gsx3; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n2w7gsx3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqBqeRqaN7+oMIvaVWfenoydnZAInASR/HG5+24vAFImNWyhRURwVakN8bTDsrL/uVYYK8Cq0r8tj973N9hVanwWEFP97OLywZKup2KduroMRBI+VAUJrButonB0taTEOcubdFEPpfCE1Cqr19YtAEBFRGKs4jpOFc0mkYtMGvGBWlEfwbzoFGIPiJL/8xUQIRuVJ8akpaD/nJgZ160kJbhdv6K6DeyPo+r+/U4vzmgboGooKjxQIcWHzeWqACP9B6go1RiAzkUmB2QY1xGaWqMqLcmG/ru/qmGogoTs1AYYjxwRo4eS/9t21GBVZ4rLR6oBO80T97Uu1m+SmvMpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ISXExPHFCSOvtnoAH8xjnQkXFKIakDJBDEhh7piGY8=;
 b=ify8XGADW2/jurpC8/0fBlMePgkYA38yvNHF2fFHbQZl/jmSPkA05AMmw7ye4UQLw9iwWqRB1E62JANlZcr+En9ybQdugYJ1ZgppO+thpIxus+lMNVd9wBvRWWV2d0rRBzoHRe+9J10ITSo8A2a1Ra625+F4cdeED8SgKuYYfRkl1IL9Oy0lqrUqG1bxIEB2lQr4Ad/+FNNo8NVxcQNKoHUAQ1p1kXX8lLcXSVoycbVySVw1pVJFaAhqgdEVqpCckBKDQ8OXNptuFQYmc94pB7AHtTbgV4IcM9MlomdDsBQnrvtL3RGU43fPuXfUE2RIK24xr0bT8KXIxcEyLZ3d+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ISXExPHFCSOvtnoAH8xjnQkXFKIakDJBDEhh7piGY8=;
 b=n2w7gsx3G8NZyCkR5G0hM3Ak68ddOuI+u0CnrmGJ4siUNPXwJf+w79U/I5DogvL2fZo2bu4Cevz5sODiLHILst25fgkZIyR6MC351vmTepSCyCS4Ik5GI5Wdc9mnxwaKlldB5eZxj39ZszyEqBNrNJGxedk9hpvAdPlAqIcoad5d0uKw/wyGe3jzCFMk7VZ3fzw6bsBtDzgtL3hxIfeMPPSalJkU0rrSSFqUBfqEMm0ffyOZyATMuCntj9WJxZBzzakiT5HEyD2Ex4ibs8Er735Nqbm3nKhVrZWCnIoSR/DKWbAT4FIl09PgrQblkPctWR5zcS2p35ne/20LdCT8ww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 01:03:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 01:03:22 +0000
Date: Sat, 3 Oct 2026 20:03:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: xilinx: dpdma: Reserve space for a string
 terminator
Message-ID: <asGl0QrPm4pvhX4D@SMW015318>
References: <20261003095922.575350-1-yaojiale02@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003095922.575350-1-yaojiale02@163.com>
X-ClientProxiedBy: PH2PEPF00003847.namprd17.prod.outlook.com
 (2603:10b6:518:1::64) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: e6825292-5525-43bd-0aaf-08df21b34913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iHd0FWw/HscXv1HjfwUp0TRZ1CcELY4oefg2wwS/fZIJAInSRq65IurmdRWkciDi7hBXmQTEFTO1fOuiHX0oEOFXpP37xr8p0/86KenhKclk3GJly4tlLIt/BVjOQyocmgev3WisyuTVozmrFs3pwTRxUBTvgdfJdKjgmqaqLuqfU2nL92kZvMrvKvOEFyAz/63k+CF7RMRQLEchcnrUk61rqObroN94P82PRVa+dZ/AE7qcKfcRHkCYr4RMp6Coi+cwXd+4CVKj5uOJFf1sAhc1levxt5iXEhXZ1/BGBWTKWudV9I/N9/VQ5bIFlZqMHkOBqxOE+FI06uEuaWCbyT0/NOe1mrVmcZLt2x4hnufwIByp2EVbXv35gUeQrvbWk7VIKHT45XCsOnqolAs4G0GZEg2bd1ZWAKMY5ZVfkI/TD4EQpcywNhcAy7/ETaTpglYZJrH2GGmQQQt9udy6SpFN4bMLMry+ty7LveLDl225IYXLFxoyAk1XqtA5SaUHvniPsoq2qv+pN6fQ4eJxjTftuF/17OGPTllx4TyL7h6VDHddADO4t7cpZveoYJD1hGLCbxQt9AJLltcEIKhQaZpbK7k/sgRmXhmPaS6sLy27y2kigAcJz//DvHNghod3K1hh/5AZz7H+VNOqgKaHPRhk2BE1Zn6YduZpArZLL6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?209kUqezx2zzuhl3ZA2lXqtR8IfVoHWdrsVB/G1Kafj4APmYYnTdIAV4NiZd?=
 =?us-ascii?Q?nV4mk2RSVisb0bTcJHPUBIWMibSf3f3T7L25WFEYSx1kj0QWITJ/bFXUp4ue?=
 =?us-ascii?Q?7xaYVv3fRBL1J3z9ZDp6yHGf+WyafBvutRvykAqkqc+CCL4+ekseMpG1g/Pi?=
 =?us-ascii?Q?lNLxVNbTpI1HsnRRatSc4NYVl52xCrygeTlB7RHRocOCl5wDOMtSvzQ2EQb+?=
 =?us-ascii?Q?1HhTjBpCDlHtkB7QdzaZl7EM0ShXbxrMJAaJ1ZKMZ27tRu212jHX/7v2kG/l?=
 =?us-ascii?Q?lxbX8hs3vSoDn2cSuaGGcL8ms3hMxcoOVLo5WsiJS96l3x5B6poDYmzfNe/d?=
 =?us-ascii?Q?UDLRD8eZoSenH1WRvqeWF27pYkDBUnQh/okxbNwW9bkm34ByDvkQSgbKD5RF?=
 =?us-ascii?Q?ErN5ljSN1nEFX8nd7kGcxTNxAGIqCxHxDfWYnWjFTmYGqVYugKlO3mNhsSLa?=
 =?us-ascii?Q?CycSdAEwJ95Gn+kZgAC3wieCsyxMAGfkPl9lIFZQVKu5fFA3Fp4rd0DBShWZ?=
 =?us-ascii?Q?dBxaPI53VMNoazV/YpHmooR5n3ac+3JM1RDWE5Db1tD76Fjk0ngudY108dpv?=
 =?us-ascii?Q?sFhVhewH1RPz560qLI26xGvRfAVE98bS+Baau6bKG6jVQ2LXwhskQaZrr6Bj?=
 =?us-ascii?Q?tx+UGXUBQH5FXEAnsLcIeRyS8Yw2l14uVDBJ+Pg62DPNCdecfEooiQal+Qsn?=
 =?us-ascii?Q?8vzCar2IncHjQf7Dr+n6CxvnXHY2vs8fdTFjBDFhyUaHjeiafnitwmB+r5TU?=
 =?us-ascii?Q?+az8Bcn8tw7RSOzgVT+MwkgxVTsldQ4zlqsjR+RKAM7SzxngCAWOb0i5fASw?=
 =?us-ascii?Q?kKOB19FcoJIPQzNygm6PB0qNU7NI83UFv4DatIQAOpMT4OreKr+cOW7WUnM+?=
 =?us-ascii?Q?6tTgF9GpwlMxcn0lDhHCrz+QyiJoKVwLspuNAu3h6Etvra9cjBeUdogrZLCT?=
 =?us-ascii?Q?EJnQ0rf0O5cd/glH0ucTheBPNWxwzEvMzyqxNvIRA8TSPaVFVA+V52mW1T+k?=
 =?us-ascii?Q?/fvOilkKQlagqF801hEqsH4jY1Vd7XKcb1+7RPiaj4Hl9wqtJaRHRdv9zdYk?=
 =?us-ascii?Q?Ge/eUPupqzeC5ySjp2Mk8UTPTgC/qWygoWHqxfOCpcxFVcz83TyVXZiex06Z?=
 =?us-ascii?Q?Zbdj1h1wOrdR7WsRH4OcDHYdZ5heTIlxVtTd4HUmJvyyu/7vfs49Ieb0wiA7?=
 =?us-ascii?Q?GVsEOtCrhRqn4aqPVSIGdWsBhpGHisybJMuDMhhJnHnwHeacTaJc2bECyCWo?=
 =?us-ascii?Q?u0Y4mbMB55difadklhHOqa66GNyhb9hn1o7MRGoJkBcr+dg817nypdk8MwiV?=
 =?us-ascii?Q?BRrTeOaZM1ZN9haNAem7Tg6APl7CxtnrbwutQZhW/WXFczANglBkGDXbjXu7?=
 =?us-ascii?Q?poJqytLJbctXGuAOgNT5CTRohk4Lz+H7uSZP5QZ9RHte9qWb45AJbnUo3rIT?=
 =?us-ascii?Q?iLuIsB1y07vr4s0Y0A5zCsNrACr8xdWWVZoE2etniiXJtAGxJhVlk9fQohF7?=
 =?us-ascii?Q?hDg1qiZJ6bgQB0qqVHIQajKreXNoHQSY9UF61EbKUelioPVykcGsYBCdsTy0?=
 =?us-ascii?Q?IVw4CjjvrMFNDOEc6jYXX02b9WMXGck2r0pFRE+3l0ZBWMF7+igkHnzAZakz?=
 =?us-ascii?Q?Z+bDLPx8SjdSb1pmMonUy5EL8o+M/W/pi1d/eQI8c3K3Q0tmN2ca1fvD0si/?=
 =?us-ascii?Q?fAa3iQ34zlnOKZANRH3tIWXNNh1sBJ0agneTQQ+qRSAshOK5Bc6KFPlXPSfa?=
 =?us-ascii?Q?7y1LSPP0nP23v4K0SG2TfujFU1ShP8XYbVOMiS2hnFMlILf7YwDc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6825292-5525-43bd-0aaf-08df21b34913
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 01:03:22.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaIOYItwyyzumhbCl1vZ5652gc9y4AiTP9qWxUyvxkPCWBONXcn3NS9CrvfAFOTiKSIuqt98WIx3JO8ICPJ3u1/5EaNhrMIFTbEMQvheBiBpBCNzmVh5jLBlLOGv4pnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7104

On Sat, Oct 03, 2026 at 05:59:22PM +0800, Jiale Yao wrote:
> xilinx_dpdma_debugfs_write() copies size bytes from userspace and parses
> them with strsep() and strcasecmp(). If the input has no NUL within that
> range, the parser can read beyond the allocation.
>
> Use memdup_user_nul() to copy the complete input and append a terminating
> NUL.
>
> Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v2:
> - Replace kzalloc() and strncpy_from_user() with memdup_user_nul(), as
>   suggested by Laurent.
>
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..219d25be6c3a 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -410,15 +410,11 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
>  	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
>  		return -EBUSY;
>
> -	kern_buff = kzalloc(size, GFP_KERNEL);
> -	if (!kern_buff)
> -		return -ENOMEM;
> +	kern_buff = memdup_user_nul(buf, size);
> +	if (IS_ERR(kern_buff))
> +		return PTR_ERR(kern_buff);
>  	kern_buff_start = kern_buff;
>
> -	ret = strncpy_from_user(kern_buff, buf, size);
> -	if (ret < 0)
> -		goto done;
> -
>  	/* Read the testcase name from a user request. */
>  	testcase = strsep(&kern_buff, " ");
>
> --
> 2.34.1
>
