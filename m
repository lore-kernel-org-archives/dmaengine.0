Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD03939C1;
	Wed, 23 Sep 2026 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179408; cv=fail; b=dQExjWUsMzYgJLiNaXQa7VhxasZQvGJXRRE0aCZ5m3eX4PARF/GiiJkSffLJbX6cJljBuUw6IL9Qui00W1Id9UBBrZWOMQLQIZQzHzrkw3mTMKGN80vvmIAkOyrghQkMDLmGadUjbHh+zqQTdMuAZyBv/5bMfY1Q9nVB3z/7jxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179408; c=relaxed/simple;
	bh=SqSMIZ4Um/c4IpN0+itDulpG6aty+89lqLNT9UAyN3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lT8zv6vFygOfpXabmOyAguR2tYAdt/q+HNxxgJFWmP4nYJJEybVqmMekQ+egYOMauBoG12b8ZP/HHOZQ/Tm1lZkADVnwNG1sgXQhpx8saeWI+hlprTCLsFYLcHc4i1duqmRHJG+aumxyFFtVHC6zc2EdRUmBR4A/lvisqcaWkhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LIjFUiBE; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LIjFUiBE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4SfUoogdIceAGSX+yOa5jKa10eOd+GzIRy8U8G4kBP2Uo2atnX0ZPAvkqjsTPXsigzl9nJoOuvhnZjx3QOn3aw50OhACl7ECZhKRxUa0LI62WefleFBfBG5BTosnTI/ScUzIqXmAcT6J92YAFhX2YWpOCuB79LquogzCL+54whn7jx6akZjfN4dvbnaIrm3tGPWK3rRswvxAZEajTfRlNRNBlMJAxWK0yXhYg1lC9GYyVc8/xJXDUDbBgvajaoreb0YHRJmqtagJU47jOl4czalofEKrM8y4i6fXEbknEdms5EWaNwDarWYNQUqSJVMLF+QNptta/wAxJDsXh/syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/7AG0une6aw1lB9ubX5AFH+L4qsnIygKRPO5hDy2YM=;
 b=EnSVtLJzFHc31MEXQ9feZsaVnYLFK5lHW2eW3PEAwOnfKVnA07tCACXYSvceiYu+fmc9jNTBiQczHCZjoD6eXxYUneZFBgQheOHk8wCPJiT5qtC9UdiO91ANGWCj+UiSHQO1emvBwz3yQSiLrT5vNvoqoCuUHPjyqmkGaaAamxUOnlSGNT5xTfAJTuAqgtlRY0cd4pODNkYxZEPKOUANFyZPx/1DfH9UcFry6hr4AEjngXhcp+Kzv8iCbN5fl+Pow9srGxITeY5KEBGpQWzYn/urvnhjOYjI6VJgMRWS0ekjtjiIF0b+Qvy4ugviTh4FL31rw1DYvTLVgfyMWnsRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/7AG0une6aw1lB9ubX5AFH+L4qsnIygKRPO5hDy2YM=;
 b=LIjFUiBE6riIfJJOt4IcvYvOtQHcig/EYPZcQaX4l1FTBHbrcOYtx57fDPLe58zspRc66B2D/QFU5jDcmoZ3pUuq2Ey1A34MkM2IUiPxzs7SiPh3QR70PSgwPo2QcbRYbXmcl6u8POtGhkQ78wVorbrvv7TQJDnY4WuBIiGezhAtVYNg/f2aAHVBpZHtI+myTWeued74XJbfzwFZV1aUHG/kAF2SD4M9X6DW7TCaKj40ePv+4BkKGwjMSBAFu7GBY+ntw/ebUPk3npd2JlaBuULi1UBWXfS8ZwrY1P3/u/I/3sFzQNBwTQnvDYxP86S1jW6g/k/v5G8eio3h6IWmnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 16:03:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 16:03:23 +0000
Date: Wed, 23 Sep 2026 11:03:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: ti: edma: fix pm_runtime usage counter
 leak on error
Message-ID: <arP4QuvWD59znszZ@SMW015318>
References: <20260923072532.19307-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923072532.19307-1-phucduc.bui@gmail.com>
X-ClientProxiedBy: PH8P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e5aa65-3022-4783-7135-08df198c3172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jAxFxt/yPf1t1zdnYq/g60rpZPclLUJfMH9Pg9uOVxo6/KlvvIFHTPdx32vLEyeNE9vxQxYyj+nCh0UeHasn7Z6XA9Lfg+h9EZTVKhk9AoT053qihnsqfDm5ee/pnywQomlGwf8fH3D1qhWW6DXPj+mn0ulX0QrKX9HhVa+Kiyd+QMX7ynhjqwkx5WKcUHz29eovaXJDwIiF2mteMTP0Ad19z2797yFEw9E39EPZ50BaxvNil5SecjObU2ng2iK+NZDNstVQtjGDxoWizx8/PYY9BGuBlWY5jHjlBCcxtkSqGJsyJ3CmLru3Iy/1i95kjciMJZu3FalMuLoXGhwqAsGU84FnqR8miF/m1m3lcwjZxzsf30bMsKri/OJe73lZUUEVv+Lkggx6N1j5GsbgYs1kOs8bXk+09EbeUQ7pBOOK2sfUMOPj2vofiNhIruwK4E0Rw4MQZukk1bsRMK0uOdpUt8RwOkRriauqiV8KMlaic9Ck9M0DnhDHH3eWu5SYpntFz28wFZAALsujPZVkzazCNYV1g/442QSvkR7hYI2u65BDXrH5NusGAximpKvyZkqc90eI/abCwpyJaHgE2E4XmWs4yxNGBfG7S9hKEGyHmgEWZiGUli5CKF/QiMgpzYbMOtZeE3ZYAtaaJ74umz3gsVoX4wt2d0ewj1x3NC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wzV7SOCwHTO6DJ5BHeXguxJRH7QGq4cbCShGGIScHCwGffFUAMruH+pAXuRm?=
 =?us-ascii?Q?T5ryObY6qe39xarTwNNqdnaYEdC9QEGGcYCxJCoqrNZD75n/i9T+AnBbBskL?=
 =?us-ascii?Q?63QrMgOrt0JXmw2Pf7u6rXfEcq27afNa8OH/cS5KWj61HkM8JRWYrjuaY1Dm?=
 =?us-ascii?Q?3OwBhkrry5HpMc1KE8ymuuBl9D9DCcqOXvqUgf7QyfOda/lr39eJdGhaFdTE?=
 =?us-ascii?Q?vTyA9YN1InwOHuYgCYcVIGv24Y5MUicGa90OmFvN0Da5/TNqEtDkYSjGovMf?=
 =?us-ascii?Q?/CPvb7nNat6epnxpxiep1hwlTZhtD0BEqbu+9lG2vDGVXK0HW6djScvrOLSE?=
 =?us-ascii?Q?cKgJAD+6Okefpz+5f77rpzIKyaP2hqmjW+RLOEEUygc8gr8PjGuPNiOuWfCs?=
 =?us-ascii?Q?C3Dxpev38jtg/uveSJ//Myr92MuCKFzfQQg2nCjVABdX+CBqR8vNBssgGAVj?=
 =?us-ascii?Q?SgoLsiJ80/binGWmGIKfIH4f1icGTdIoGgOMX1ocPUuBI8BLbyNIlRyqXd8M?=
 =?us-ascii?Q?KPwUmVNM/x0T4BpAbY3+kV9yIbPeTb9ngJIWlwQ64ziLojk11sW1fPyWnY3Y?=
 =?us-ascii?Q?pj8A3SdXGshFBcatBmiN5A9QCo9ISHdGGkm7baWvEOgu/Pvh2RN964snaQJ9?=
 =?us-ascii?Q?qFRahI3B5thSi/iDi9D7P49zs+zav57NUtUkGwy88hKFNNbAN8iw6JbmG295?=
 =?us-ascii?Q?fnAQwiO7piugDoYOFbUO3MFLDtXx+dBdgXQ0aYUksRgNqNNTsspb5+9dSTMp?=
 =?us-ascii?Q?KaGyORn82WqtorQFUmltn/y0XTlWoUkpILO8oiLJlw8sjAVFnDDqGoE0829Y?=
 =?us-ascii?Q?VeDF+GPGPreOYhsrQOf6Ce5cHT8ncRB63jOo+gXxBdfnC5loBkdbMp6HsiTv?=
 =?us-ascii?Q?nTeekaJM7vDrrHwqO+6p1DU9uVbzR4ECwvNKdK3kJaMKa9TKOUO9jAwRYIBp?=
 =?us-ascii?Q?mzN7A4jRt2bMNwoPVmWEfNz3EZnasooeGd26ecUMxthhREqUVBeN5trFl5kt?=
 =?us-ascii?Q?hB6ZFeKUtSkIRqN3HvToWJ/2DLKXvjiCCkaBdvmFmHDFDxEBauN6yLank5ca?=
 =?us-ascii?Q?Ji5L5/JTZT+c/n7fiiLXUtwKWfQnEcqCSQWfzMJZBwE70NAxcL3/lrlTbijl?=
 =?us-ascii?Q?48iAw5YkE6rFj4l+3O9avFbAOaUk2wL8sVlltZVGO/iq+MBPH8extevKBA1I?=
 =?us-ascii?Q?cHcI2UaXJ/51TumlbZDj2T6s63CqrvJfepDBKhWkSe0Wy/SRvjUo/6IiyZi6?=
 =?us-ascii?Q?VdrqTwG2MCMz6opYcyOY4Zk4RVhIWzRdTf+ckA9vugQy0+hO8D63iqRUTBIZ?=
 =?us-ascii?Q?Rj8eP8WJPgLClBe4Jyi0O+BHFRdd1/fBp7et2EVOXXr8OFtIJgJHWaWPmWij?=
 =?us-ascii?Q?4hqkNpwgiMjJiG5eZRdF1nxvKFOSOkEOo3HpH4pttoYgrsBkuC58wstwrAxJ?=
 =?us-ascii?Q?cQDXmmSzh7BLzNtGyyspniUypS8jKRnvKy/sPOw+G9QjowMRM0bt0bv3g7hR?=
 =?us-ascii?Q?k+uFgDaltDfyomTVjd/pXfWuoHCq4jJpwwh7AlJkU6MDtR4lH+UN3isBD25L?=
 =?us-ascii?Q?rVsP0kkQWZO6KnYCm7gOElcVns1dWevmlOVI0T+UkkJIKO+jXu9mzoiT2nAZ?=
 =?us-ascii?Q?FTm60sXlrrFtoo7TrDSCkynxQ2Jq+ebztySa+fw+JLLyUuVjgdXoUM/qOxBd?=
 =?us-ascii?Q?+vE5E5VolcKJ7t/gXZlUi/VfrMPZO2Q5iC/1IUSBCtZhitrSMNILlfjBkxAU?=
 =?us-ascii?Q?ENxZy0pWvTRz9MIs8KjT26UoM6wdPev4FRM9mlAbkvHf8j1lHQ1t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e5aa65-3022-4783-7135-08df198c3172
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:03:22.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLNUCTOim1A8F1W+8K8GdhLIriHcoJSHRHlem4jrHtp271Q81D7CUBHNEYfAvAgFe2GKcSTYe6HO54lxsn0XTGlF/m2Uu7gkKnQ8gH0luOvtOoK43jXgrSjdhnz1QovM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

On Wed, Sep 23, 2026 at 02:25:31PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
> when it fails, but the error path in edma_probe() does not call
> pm_runtime_put_noidle() to balance it, leaking a reference each time
> resume fails.
>
> Use pm_runtime_resume_and_get() instead, which automatically drops the
> usage counter on failure, fixing the leak.
>
> Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v2:
>  - Update the commit message: Change the function name from netcp_probe()
>    to edma_probe().
>
>  drivers/dma/ti/edma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index d97db5af3555..8be9e71dab76 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -2345,9 +2345,9 @@ static int edma_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, ecc);
>
>  	pm_runtime_enable(dev);
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
> -		dev_err(dev, "pm_runtime_get_sync() failed\n");
> +		dev_err(dev, "pm_runtime_resume_and_get() failed\n");
>  		pm_runtime_disable(dev);
>  		return ret;
>  	}
> --
> 2.43.0
>
