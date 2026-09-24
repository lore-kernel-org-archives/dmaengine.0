Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E874207A20;
	Thu, 24 Sep 2026 21:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283655; cv=fail; b=K7xFmsUCJIAxrWaFU+Zi614QbLBsDW1+XElYdMZ41uKLZHZN3yuwMBby2IB0Dm9HpiHNcen/8KsIlkHF/+wmb8igtq+pvz7Uxv4da9f43reXL1jV9yLChsGWjUOWnpgdzDlKglr/tC6xw1S1WIz3qEWDc3S3qY6BgEAuMzlO2Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283655; c=relaxed/simple;
	bh=tJhs55BrHBQKL/m2wMija6CAaKlfm0X5Dgk46vMGPiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ft0KW4u/5qly5J7Ii3wf4DftOym8VSMmesLmMv42v+anv/NB385EWvs5uwyML/oMhjDivWURlyKNIEfZSNaLznfqY0Ex4vuOLZXG6+nhTFsiG/jr8U7DoVUzXKGBIJSl+TEr6yeujNys52xSyCOvV2sl6UjMJAhDbYFWsEo3pIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KS/mLpSG; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KS/mLpSG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWkPev1k077d0wgTaO/FVa5RXlt469RaSplq85KqF3iNlbUqKgiCYoBZJwmWXFdYxPrjH1zECDWShXDVQqjNcV+Dnzx9pI9Br5RRLV8v0Zny4g3bWRJ1mknodq5rPgPSO3pP+eB2PZeZefKXHeFX/w8DBeBvqUvj3TCVeTMHjVOcKPieguNeHLuK9jl2Ohozd0JqhPyH+GkFzb1k+Oc2/lMfWlFrmJawKkSDwRxeDJltRioBXA4kF8vryzc6RpMXMCaSqKKds/97wlh2odtk7QxMmQVWX5Bwg0s7er71tUv6Yex38B/cwhfuGDZwBg5Km3teYp9WtCVTILIaFkJQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbotKv/4GWWHGloABSZYCOmp1yD0bB0LkxNbJiZ7uas=;
 b=ZeT+drkx7X0Zj9ttlrIECdrumLsLXyVZXQSeOa68ERI0lZFLzL1eDSOpQbdRv+5bRlsj3vuytZkiQfsUvDoqcH8U5ElUjyzEhbHHkI/XQVEFcoqwV8F2zGAokJpFV+hchD0NRHIOcozkgFSIsP3rr9DpKeFBQoULtqHmZCgc86AviSmK1X4OkUsVUiNyf0df8FsDZb2e0StL+Y8ulNl2W4nafBMyXekIUFDW2eOs4Oxmt30J8XowajcHUO/647168StbnSQSU49Wp6c0TGagaz9uEwMZH9aGs6wLtnAKuKyzwczukEkYR1lPfkWWLliLR7NWdnFBUUsRb7WwFK2YwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbotKv/4GWWHGloABSZYCOmp1yD0bB0LkxNbJiZ7uas=;
 b=KS/mLpSGnPEXvZ6l4ZEojZcz99tKgvztBIDVdiKUE/6CDgbX0TO31ElE1K+7MGUN+Ner3I+wD+npO4MyOUsBfD1BcViywpWQpm88bfZ/vyl77ex4fz+OstDq3tDgJsevy1CGjwr7wBkKmwa2SwoJ1LBtRx9kMCQP9kG2nSsjpHc7VVw8ZrQAGmM9nqkK0grH5GCjPzfEAdpwGa9ZEaCFOUpz8his3Y7YxyeR/eo5rZmLJpnPWNsz6yicZHml2ZW8jBxyDtva/TV5jZMZIK5l9qDPmHdFOyiwfIenWj3LyxTHDANR4UCX8ZwCz8rU2qn7XQ6cZ63/RJc7OBGm0SGkjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 21:00:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 21:00:50 +0000
Date: Thu, 24 Sep 2026 17:00:43 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: ppc4xx: convert irq_of_parse_and_map to
 platform_get_irq
Message-ID: <arWPe-Uo-5fbZ9dX@lizhi-Precision-Tower-5810>
References: <20260915072026.54904-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915072026.54904-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXPR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:930:d2::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ac377f-8576-4b9c-c394-08df1a7ee9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jhe7dWlnWxVinqVzbMUyy1dFzA9qSQ05JCdS6cPNZhR6K6gwRMJwVhyhTzQKPWFSZzAB19+jSrkBNHZ6/obs3rcYRWVGOc2DGSTPW/9H7PgZskIiZTkSI3HIGUuEimNw3t9wmktFvs7eaiJILkcWEbDulMIGmqncXCXUEvIbWuPhKHneBEEgeDbkCf1QdDcx+2f5rvtWoeAHEj4fILoDgOlUlYxBhXunXO3empR4jl7bCk459XyyAgd90hJVs+j4uqZJmt/dcsa0YgcgxQ3dNl0xefszLtJ7cfk7QsZpc93xtibCcR1pJvG2dBxyuRwCeaD3u3iLWNFfaoIC4Usgt6y3i9ySLqPfSFhN331S5kpMe/7Cs91pYao66XyJieq28D72fqCdCFgI0QGyAlN539J5Tbd7hAiuwyTr74DHwZJoUzbSEq2VzRPudZtuTkx47u4bwd7Gcf10IVzCfIx6OhLRnMJ8VMV62TqDA1Y8f1N4x/73fZF9PvvwDEf0kPg0HTQx1nUSBDSFkMbuXdpt5tJC9Yysrnj44uuDQsLhhDB0oGRwBKSpP4gVqm2GYxAg3aIjMsbeNv5LLK4PYQ354LqSAfvykC9ksIi3XBX3BGrdlEUHDfQDxcmYdyh3dyhalH8lTZJToknkx9H+lziNQVyUuzzM74rcIg0CyCqEUyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X+cgfJv3ZgBn6JCdjGJ0rpjJZmuVQAvxFZfFIezgr5Gz7B/+f52uKT4gIbKl?=
 =?us-ascii?Q?L8BfaUvI7XSpjwQBDFMJFdP7yv0lMYRa5hxaDTZEXmxyhABhd46hLSDfygn5?=
 =?us-ascii?Q?NYnGKYl95OE4kOt1ZTK+OHFb/l2CV9yoZmy1FlrPzyQ1iOlPsXLaDM76SYF6?=
 =?us-ascii?Q?BY1x9PXi+uyZB1PTk7V7qsghgMU3bNZIsF7NtkIYlBloX5JIYOLcLpVf84h8?=
 =?us-ascii?Q?qpokW0RU7i/lVIDxjXtaPnyCblGo0v1stZkyTxE1yVOyrbgDIczoEmDhFGTT?=
 =?us-ascii?Q?txe2eoXXnfbQ1aWV76pcJJ0iO1SpU+B1y6KvA2yyGczrwjqVWq7POq7RXNQu?=
 =?us-ascii?Q?+/hzCk6XptOPTKbvtbX+Q0y1XDOfnoWNljHOSParbaVyI4LIDVkg/dS818Fq?=
 =?us-ascii?Q?LL+uCKshb79AIwe9S/r4DZnc9GRA9UEKHC+POyHgHO6wAzxnTgqfEYVRKop8?=
 =?us-ascii?Q?Op4kgQo+oziqg/8UzrshmuViBSLCCPxRr5r0Mgd6PSGpNgDR8g9JlJy+FrHk?=
 =?us-ascii?Q?HiOLscphwtrUkexDIP96qUv0m45L0m4OqErkLf8vuS98d5No/C/D/rBo7O+H?=
 =?us-ascii?Q?5RPHXfQhuPkcSM04V0UlpbeZ/ilQ3AJ/FOibFOjQd5zglrVqEtFqF6Heyc9H?=
 =?us-ascii?Q?FPqDHXB0F/857UTNgAdcR6ad2uJuX2K0dKAvN9X/n6V66G2Z2Fog6HGzNOJR?=
 =?us-ascii?Q?KuPgu4w4cDs1w2KdlDCyq9lkOcBiZpgerHz6tnV/nN5+nVKwCE/OZ/5Fke8w?=
 =?us-ascii?Q?qXGxeKqEEsJu7IF+mc7UFz+1IvZ0YhzCyTJZZS8ubcxlNRyir156WCUZLg5T?=
 =?us-ascii?Q?q6JHqZH36pJ0BuZ9nUvuGWO3i4PIWn2Ae2wW7KXkV00Kv5Zqll7Igstm7FR+?=
 =?us-ascii?Q?C4rrUsqfW/AO/3IcjJ2PgkerG9Ym0t1Hy40+64afLxfyp0jf38yxLe2WvhVu?=
 =?us-ascii?Q?fXeW7t67OpV6E6VKi4x9FLbYLHAOuRgjx+S3IIVQSPErhh6wGtzs0luSzwQc?=
 =?us-ascii?Q?FRN9wsS0PikK2Rr1dmJuIi6cjPBISSE1Ni59WCnCSI3aQkigv8EIFbI6sr0a?=
 =?us-ascii?Q?MLrqU/Oi+Ftc7ctwHERb8nNXOhlZ2mGokqz27G8t8HM6FPzV51vprWdoBvQN?=
 =?us-ascii?Q?a9b0HJgUKPi5C6m6NbHffr+GjCHg/hnU76HYBgjdVay3YWx15fbap4sqTUtR?=
 =?us-ascii?Q?9BkPQmX0VwdCLvAgROMjk2Cl3MQxLUGrqJ+6O3eTsw+gaW4i1g5eg5JmT1Ic?=
 =?us-ascii?Q?+UlgJEZ++4gMNSBLrSxTz/OKKrpbouFDmIoPMQeaxKSDwjejIORxCUQKUMgz?=
 =?us-ascii?Q?R+7cWlq2+dBR+7hwMHIfO7q/1S4aiFPnfudhZNhcFyhcv+wvCDO57swf4rqW?=
 =?us-ascii?Q?w2Kp19ODTDRodtbUzb/kcw+ypL9j2EQnr4P6BelSmzAA3FkeRYq/AOa2qpbD?=
 =?us-ascii?Q?zmQtDNrVQgcjLk8QjQYeEQhOLEfvW8amgfen/7Lt4f59XY7MQ+DCCgNiCiti?=
 =?us-ascii?Q?BcFPA2KKsIkSaFeFNt69zfysZlJyURSlEUDwiH0wJLSq9VEL6e0taAtEwJ2u?=
 =?us-ascii?Q?5C/odU8VFAbfm0BtIE1kQcKWq/AeT5Yh6BSHYNAjghglx+pJSqb8NJyU7m7M?=
 =?us-ascii?Q?UR/0KQBkn/4hEfnIeYcWoUDRghGDR0evzu89h76Z+wLzLIdv1kGcnmnhqL92?=
 =?us-ascii?Q?oqNVM8y2jFYtHgj8leSzGu7Ha1kw4S6R01qsuvlAzrCNm+3uF/ta82b02p4L?=
 =?us-ascii?Q?V46+/+y1+kUE+aLZdLtCmtdURLrVsyxlsryeuacb7cfYO9sNXo05?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ac377f-8576-4b9c-c394-08df1a7ee9c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 21:00:50.3197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YnxEpJjD5/2quYQPf6TZErbFUmrmUBoFWACU2BNosdfaovqo1Upk7gEcTY8h7PQDef3eC5GKB4e5hVyA3J6sWX+AY33sMK4ozFOYGPC1YBre7pKwGBUeCqNYari7t2y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

On Tue, Sep 15, 2026 at 12:20:26AM -0700, Rosen Penev wrote:
> Replace irq_of_parse_and_map() with platform_get_irq(), which is the
> preferred way to obtain IRQ resources from platform devices.  This
> eliminates the corresponding irq_dispose_mapping() calls since the
> framework manages the mapping. Also allows dealing with -EPROBE_DEFER.
>
> While here, fix a latent bug in the err_req2 error path: the error IRQ
> was not freed when a subsequent step (I2O setup) failed.
>
> The struct device_node *np declaration is moved to the scope where
> it is still needed (I2O register lookup).
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v4: handle -EPROBE_DEFER
>  v3: use _optional
>  v2: fix missing free_irq in remove and fix description
>  drivers/dma/ppc4xx/adma.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..0b4ba9a2fe88 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -3865,28 +3865,28 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  				     int *initcode)
>  {
>  	struct platform_device *ofdev;
> -	struct device_node *np;
>  	int ret;
>
>  	ofdev = container_of(adev->dev, struct platform_device, dev);
> -	np = ofdev->dev.of_node;
>  	if (adev->id != PPC440SPE_XOR_ID) {
> -		adev->err_irq = irq_of_parse_and_map(np, 1);
> -		if (!adev->err_irq) {
> +		adev->err_irq = platform_get_irq_optional(ofdev, 1);
> +		if (adev->err_irq == -EPROBE_DEFER) {
> +			ret = adev->err_irq;
> +			goto err_irq_map;
> +		}
> +		if (adev->err_irq <= 0) {
>  			dev_warn(adev->dev, "no err irq resource?\n");
>  			*initcode = PPC_ADMA_INIT_IRQ2;
> -			adev->err_irq = -ENXIO;
>  		} else
>  			atomic_inc(&ppc440spe_adma_err_irq_ref);
>  	} else {
>  		adev->err_irq = -ENXIO;
>  	}
>
> -	adev->irq = irq_of_parse_and_map(np, 0);
> -	if (!adev->irq) {
> -		dev_err(adev->dev, "no irq resource\n");
> +	adev->irq = platform_get_irq(ofdev, 0);
> +	if (adev->irq < 0) {
>  		*initcode = PPC_ADMA_INIT_IRQ1;
> -		ret = -ENXIO;
> +		ret = adev->irq;
>  		goto err_irq_map;
>  	}
>  	dev_dbg(adev->dev, "irq %d, err irq %d\n",
> @@ -3899,7 +3899,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  			adev->irq);
>  		*initcode = PPC_ADMA_INIT_IRQ1;
>  		ret = -EIO;
> -		goto err_req1;
> +		goto err_irq_map;
>  	}
>
>  	/* only DMA engines have a separate error IRQ
> @@ -3917,7 +3917,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  				adev->err_irq);
>  			*initcode = PPC_ADMA_INIT_IRQ2;
>  			ret = -EIO;
> -			goto err_req2;
> +			goto err_req1;
>  		}
>  	}
>
> @@ -3927,6 +3927,7 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  			    XOR_IE_ICIE_BIT | XOR_IE_RPTIE_BIT,
>  			    &adev->xor_reg->ier);
>  	} else {
> +		struct device_node *np;
>  		u32 mask, enable;
>
>  		np = of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
> @@ -3956,14 +3957,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
>  	return 0;
>
>  err_req2:
> -	free_irq(adev->irq, chan);
> +	if (adev->err_irq > 0)
> +		free_irq(adev->err_irq, chan);
>  err_req1:
> -	irq_dispose_mapping(adev->irq);
> +	free_irq(adev->irq, chan);
>  err_irq_map:
> -	if (adev->err_irq > 0) {
> -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
> -			irq_dispose_mapping(adev->err_irq);
> -	}
> +	if (adev->err_irq > 0)
> +		atomic_dec(&ppc440spe_adma_err_irq_ref);
>  	return ret;
>  }
>
> @@ -3987,13 +3987,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
>  		iowrite32(mask, &adev->i2o_reg->iopim);
>  	}
>  	free_irq(adev->irq, chan);
> -	irq_dispose_mapping(adev->irq);
>  	if (adev->err_irq > 0) {
>  		free_irq(adev->err_irq, chan);
> -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
> -			irq_dispose_mapping(adev->err_irq);
> +		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
>  			iounmap(adev->i2o_reg);
> -		}
>  	}
>  }
>
> --
> 2.55.0
>
