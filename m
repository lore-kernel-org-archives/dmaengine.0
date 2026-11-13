Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598985;
	b=TqEtXJCKfzHSvhv/IqlhpdLuK9s5wqklC5ZzINlYsOeM0u8hCvn8YwjQz0ft36xdyjdB
	 R5NiiRFctvHRtJ5IyS90hKfqVh3BwfvLP55D9RLP54gfHQhQ0ar6d7rfnbh/Lu8Uty/x/
	 LQDQImsXDhLUxvDtWGnI2E8IqovzGznzk9S/cBEsXujB7VWcuSNoBO0C27pKbicdi2D31
	 /4FNHQLoq3+uwb/PbbKuXZomD6CBZVnRPCEsx6YYmDkXARVyqWSHcdUHH8klzVE3CUQNp
	 fbuZSESWVn7sbAjhrdgcEoAjs9434z6rkun8iXVuVVzTFWcFUU78j9Qi6xbUZywxbSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598985;
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
	bh=kkD6pjNqPYs31TQ7SXATKar8kcMvg1QQtYHoedlfO6U=;
	b=0DQIdjmAqGO9W5ZP2Vik0Q9N0NKHN8CSGraGooocytpoMys5p7Q4QiY0iov18mARbn2K
	 lijnUTaMAyqL8Gd0NuvCZD/QLHsPUoQ/PmYBDL929f2xWYgiHzdY99thUbYxLLOcCaWPk
	 6iCE5QvcCrYdul2PikQEXZMT+7K06ymXEYyPqoFB9qVxXXBBJkRuoifKF+f9Z0z07UGVi
	 cALMo8SdQADtE5tIYEp+gUAFYd4PXzi/bithxAJ4Ug3mvYE1oQRIop5K6zGxr9OJFcKlT
	 3PEXehdQjpCdyHCLOVvTxoSVrtqgtd80mnvuE6DrhlJFhDbt4mqv0gvjSqb+grrD27g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=whffp32r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.60
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013060.outbound.protection.outlook.com [52.101.83.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFF0606A336
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 19:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFF0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=whffp32r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkBSo/rYhn/HEf0GAhe98ZPiIQvjAgCBoGp/y9yBW51RedjjWMxMe0vd+NqNVBL1esiNUJylKc+zC9TLc4xGH2C2o5jgtXlgH9Sde1JJbg2X3sZO82EGavzuKo85bN6LySWlDxx0+n+SpmaTZ5vcJgbGB0QCikTWB/t3o66oFDG5/oXxMM3/r/s4Q3o7rhHnziIxBnPK3VdSFUbJH8oSYdwIfXsA3saSgKNj4zqtE/oZAr3Bh/fcvZLJ+1cj/qOQj4jb1stj4fzRnP03EBYBlbz9Fxa2As+yUUVq4Zycrq2763FTJI53m5B2edk6NPS1UNOjMUCZ7K6xDvcPEVHMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkD6pjNqPYs31TQ7SXATKar8kcMvg1QQtYHoedlfO6U=;
 b=y2nwK8KtKKrR8cIMCNs+VoLFxaGLwUaCf4G5RJFIHHZGeD5W+rkgHtQj+xHjIv5ecpv24eLcFHP8Tk9s0mUmZjI8WVUUSELB8BTPuzl4mf/3hzDsipDG2Wu6IzS6JDg19cTllpGofN+qxmzJ31/gf309nMKVVYb/Vbt1o9xXJrK9VA+AJYQzwv3Vd9Aa8v2ZjF8zHJcuM+VFz76lFx/ba0HeFBPLe2+Gr8PE6BRbPd93rqIncrp9jGl46kPRWfBnerjo6BAGGfclg+PUpo9W4rLfb25jiM84Oilgh7cxdCvGRnyS3/nioQjYaLLjzXH7Kj7lZIPTCs49l/pk15IZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkD6pjNqPYs31TQ7SXATKar8kcMvg1QQtYHoedlfO6U=;
 b=whffp32rj9y+xKFH9h5iNK3SPzAp6gNDwq4omnK6ybt++HuZAxSc3J9rIFuoVXxIQXsZa5UX/1WMLLF8JO9krx3ynUahK9jOpgxvcR6ex56jW5IJv4qWdv00UPnnjxLcvB5/ZTwGFNp30OTgOkqeAWTM5Pc4kSStEw9MBNfAE/MIZB0+P5ktAHVD24VVw3Rb586lApa0pS5cztPCDZ9ci+UB+IfWhw/yjzF3CYybHcc82h/PrwulGCaYuKEoZ9+9/Hhq5lk17uZ4X9AC0vsLpc4ExZwVu6VRMRjMujy2hKceYTjNVa13vdIZYl5G4lp8Nr+kNbIZEQhEOVICs/tUFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 19:43:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:43:01 +0000
Date: Fri, 13 Nov 2026 14:42:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: Use unique debugfs names
Message-ID: <avdoP5KhGMxfsdVR@lizhi-Precision-Tower-5810>
References: <20261102-dmaengine-fixes-v2-1-d0473b3a0ed5@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-dmaengine-fixes-v2-1-d0473b3a0ed5@kernel.org>
X-ClientProxiedBy: DS7PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:8:57::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a6006a-f5f4-4f71-575c-08df41be53d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|11063799006|261102123227099003|261021121427099003|56012099006|261022075727099003|261021123027099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CuFyuJ2JUCqff5P5WvtqyucGhrA4OVWpMckhHYVBmNOpRi8IQ1AKQGnqBeMggOGPKouCZvHFn6Xs9sn8hEliEiFicBp5NFsaT5oJlwh2TVCdmfJsPiGskcNQtm7IFDDoZWzLPi3xw0wEA2D55iw0McCJDHOndUHjZsp+n5y3C9W3SzzBD+oJ2rbr7XY8w4AREIhx8CVWbWjcIQt39ZroZVg4X7/QLHaJxuYpjBC1qvalnvIRvy43e+x9NTeoPYOmS95WmvA6iIev5yYXK9Yq+njL9LxYNqkK3GQHLtlyp8FUKKHr8N3ryY5Xe7oS4wi97hO19yvghoqyYhyqVyoDtXpr09dZTH3K2oFS/8OMeFZJhBZC2eYqK8wmDUCVKWOW/uNdSHRBsEuvn8K1+a9fqwScs1MiYLbVUcdApyuqdIKrHENxqXTVbw50+dSjkF64flBL+u1AL3KKr9e+1jm5mCRh1NM77fKqDwpDzXq+Q9+UPQXvd2q3IUj2UHGhO4ArjuIcaUWTpbUsZx1sfK8WjtOIErLOgGniSkN5aLKGMogteXXSbWDqze6ZBTu7Q4JglMNBENwMGewHEOs+MZcQOBy/ajlkxUG/OAyKa+HX9EjUnauvRHGbLMLKf0mM7WqD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(11063799006)(261102123227099003)(261021121427099003)(56012099006)(261022075727099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tLW6wrByGXjvmsCoRn6RNa85diD4JfU/awLWk1aY9UY7dj6em3iM7IlfNwt7?=
 =?us-ascii?Q?hC450UDmeYY9rZ3TYVIO7cNseh4D3WT23C/JwWCnW8N783O7jkt5zT6DX83D?=
 =?us-ascii?Q?YYzKskCc7SVccJO5KCOEWBKygqkwVLY5mR88WAR7bDGPEQtw5RDeEC3vNa6r?=
 =?us-ascii?Q?1LRRpfcP0lqk8aS4nBlz8rIAJKFm7jHH3iUHy+HeIJtcQHoJGsw+A3TP69k5?=
 =?us-ascii?Q?LdPJmr+iNhv1sv7F7gJGZMEXI8kwWDC+zT/P+hdU9+AEQHIp3Y6Zpr5vEqlj?=
 =?us-ascii?Q?65yOpd6Z1RAMXb63gXeTpt/To/k8RjnYO2LPR6fxsBDJBVM2NSEWjLPMjpOL?=
 =?us-ascii?Q?bXC2BTShZym1Sdd2DJNrz1z07iWHqq3PgLSbVBN6Jfo5Vm7JJtWyivGaa84n?=
 =?us-ascii?Q?9FNbR2w2qU8WeqC68U7N6FgPXzqVwfPoxET367jpfsYywkclu3NRFluT3yKU?=
 =?us-ascii?Q?bUqeq5uzA07fmT1yCCQAXGIUYXKIAA8g3UceOeuUBDU5hff5K+ooDlaV2GMo?=
 =?us-ascii?Q?xk7DRJ3iOImbEQ8+NVv/2nrjED8Z6fKza9pwz0RKj+/yhQvR/DR0koUNnHtY?=
 =?us-ascii?Q?p+nQyISURMJXnVJ6g2Ec+la7bNKNeM2YO+1HBbGdg4b1XiQUcT4sJ9w7nyNB?=
 =?us-ascii?Q?okwYuTduCfGE/sDBlfGxk2aGXchbt55Dv8ldFzmHUE3Y+/wznTSuBMlZ4uaR?=
 =?us-ascii?Q?P9qQNlA/dvk4FyP/bndMmwdi0a0dH81TqTDbQ045FV1vdChw55y5yxqiI2Rd?=
 =?us-ascii?Q?slZrzD1MSC773OZghhyEx8sKTkc/bbNvws3UuccC5Awww8J7qzkhle/cQgkV?=
 =?us-ascii?Q?11aBAVFOpfh91ULn2/fXF3NWayXEX41rIzILbuD8/65GNyD9qQOCGYEDeT/F?=
 =?us-ascii?Q?rTkDNoz/ueTMU0AwammbIGDCjmddrUQ5kDYlerYrDQvTFwrGmu/FyuDr/J2k?=
 =?us-ascii?Q?ZdJy87bT4yITd8gsg1TmrKZuWQ4Zmhq+2AKi1FFlu/IzJDDhLJVe2nMcK7Vs?=
 =?us-ascii?Q?vEccIJ1+Rrq0lMQUsKHsoEISsYVKH1Yh/AKsOPV4lY6BFA4M3TXfCaD8bJJu?=
 =?us-ascii?Q?a+TdrIZKllhlnBaJcbTUeSMSxNDgvzzw16TBzHPrp46DwV4psSe3qkKAl3Bf?=
 =?us-ascii?Q?eREM6Hxh7FMZq8eAeGoCvppvWcgrEDHqxRnMEAQyraEUVFRZPvMWQyi+A2lT?=
 =?us-ascii?Q?eX+ext5UrCVx/5usReU+k7mT3olwamhXDKeaZuMvaCkJpMutPYHPSEbrhUK4?=
 =?us-ascii?Q?M6FnEWLGhB/MZTR0HU/ExLatSFNA/XYWK0c8hXwySGa5kgfzP0ZnCZdzEmca?=
 =?us-ascii?Q?U2Ix7NGdp7TZBdmm/y7qmTbRH/cqYdXXpw5EShe9mcy8AYM1RtbnM3hu384+?=
 =?us-ascii?Q?asg/v22nj/ody6DYWy+x6IN9bO9uyd41vOWXb+/zmnZm48JCiVIYDIh0qTk1?=
 =?us-ascii?Q?POKKnHqr2GZuNvWTdqzQia/VDdjUgU7t8LXcSquToKyIqynkCG9wLMo57JuI?=
 =?us-ascii?Q?dDOXtRP3tcb/r33ofJTdB5xQZlDK5GQgstoPo6GaThUaX1kId8iIMlxuBfvE?=
 =?us-ascii?Q?kdRExurYn6eJk1/9zD8LR6zJrlTVc/WUYZYpR4zbCuCrEAbL7uXh/hmLyCnk?=
 =?us-ascii?Q?wCtNuBtB1GXeekO4Ttx0iTrMhlPBVa6uIZ80EJm2F8TS+HmTHVwlUA5nJ7S7?=
 =?us-ascii?Q?rwIKDVI+UqnKAO4P74c/TZw0d/kM2ohhi4nqDRWqR0JEXWHT2G+DKuwiAG62?=
 =?us-ascii?Q?gbFwbREo9/D1j73McqAY/1DW0NRnLisAC+lzGdCMXi6EAT6M2IlO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a6006a-f5f4-4f71-575c-08df41be53d0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:43:01.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdbEZq2sK7iChcGMEjlAFrNKQFRzTtciD8UW1c4WJ2IxfrrvuZywEQQXv8w2mO8Q03NG8nDbz2D0JLsXURJPX6zShXjm868KUOXPkrqiQtU0gWEXd+2vfWzhDR+9JSs1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On Mon, Nov 02, 2026 at 10:23:39AM +0100, Linus Walleij wrote:
> DMA40 registers multiple dma_device instances for the same platform
> device. The DMAengine debugfs code uses dev_name(dma_dev->dev) as the
> directory name, so the second and third registrations try to create the
> same directory and print duplicate-name warnings.
>
> Keep the existing device-name directory for the first registration, but
> use a dev_id-suffixed fallback when that name already exists.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Fix duplicate direntry.
> ---
> Changes in v2:
> - Rebased on v7.4-rc1
> - Link to v1: https://lore.kernel.org/r/20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org
> ---
>  drivers/dma/dmaengine.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21..7eb8d53b4863 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -33,6 +33,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/acpi_dma.h>
> +#include <linux/dcache.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> @@ -70,8 +71,24 @@ static struct dentry *rootdir;
>
>  static void dmaengine_debug_register(struct dma_device *dma_dev)
>  {
> -	dma_dev->dbg_dev_root = debugfs_create_dir(dev_name(dma_dev->dev),
> -						   rootdir);
> +	const char *name = dev_name(dma_dev->dev);
> +	struct dentry *dentry;
> +	char *uniq;
> +
> +	dentry = debugfs_lookup(name, rootdir);
> +	if (dentry) {
> +		dput(dentry);
> +
> +		uniq = kasprintf(GFP_KERNEL, "%s.%d", name, dma_dev->dev_id);
> +		if (!uniq)
> +			return;
> +
> +		dma_dev->dbg_dev_root = debugfs_create_dir(uniq, rootdir);
> +		kfree(uniq);
> +	} else {
> +		dma_dev->dbg_dev_root = debugfs_create_dir(name, rootdir);
> +	}
> +
>  	if (IS_ERR(dma_dev->dbg_dev_root))
>  		dma_dev->dbg_dev_root = NULL;
>  }
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260918-dmaengine-fixes-5c893ce71049
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
