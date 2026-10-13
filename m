Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B0A426692
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927118; cv=fail; b=emkkLXvlMyeXqZKD2202HwceGGuhAXW6B0eVcfR01fFue+oAcZXq3wrUjFrYL2c5IabNfru55ooHqqdsmQNBmZODHHk9HxgORX1e8xq9kiRgX39gAtQa+6l5Lw8m8BBiHSnEeHnMfMl24BEsy4Qb4obT9vpKXFmp9b7H7VEkcM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927118; c=relaxed/simple;
	bh=gSqiG6QM+vPONfw87nabsNkI1GBWnp+pOxHwZaVbcFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b8U3fHeUhrbkvwZKNnzmoyPLZZMTqYBLK+DdblchNhouOCFa/9P3vf4yYPX8rKrM1xQdquw7EMVPvkzEd7agcscmeeU6Sdr3bN3F3mngXVhaeV2W0nPCZf2EX76pSsL/hedncWa/LI2NxBFhKccD/m1acW5bqN/kk+BaE/Kyztg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C+oxUhJb; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C+oxUhJb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOBMJTvkc+5cmt3Bb8cFpbzgWBNvGVEMWRAP2bOGiPnkyRLEIQXjsKpVHgeBRVbUjwgigIvUW5ZJRwp53yGK5qLh++ChULWrlPSLLapzrcyP9Y0i5M41fRyKif/uZjOcgEz7/dQGt2EIl8i5wtaZgmfUpEPPNDyLqTHH+kNp/2Zc2r+XIe4GgDvCwpJTCLpOnY64lMf56UG3XGg7mFOzoC3Jt3fUfeh5iE28DDsxLX9VhYX/LHOQWdvn2j1z7ogSzdCpA2wj45n0qYsRqiLyhLjPvjbl5n9RPr9/qauA6WjOWuBx0IVjGSu1jV+Y9OqpPUn9qiJWrWhBwTigVBl2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddDGC+KLnj0yBA7rAJYkNbP9E8pfDfp3rX+fTo+NBlU=;
 b=vPwU58pyL2ke+v36rYkhvXzLwK3VcUk1LcSOftO/MjMN7r4WmWf6rkEl6Y+GNzZUYj0PM9Z1M1PUcfrgTexK+2cr0UslYx6otJB04i3r6xUy54ogGFIoueImlDy8ZUnjn9cVWQhD2TpxjoGjaNDyqrW7xUwAK/HzZqVFaJ+mIN74IPhuqOgih27xZ1uL3y38wyl1SwcshzBGLFZZa/x19uPU2ma3XidBJZIne37LSs6oTjRIQiVygN+R+F8zRt19V6Ljn6nngNrxocBB6ye3Vdqr2Jsu6YZcNHFW4RwU2X6ckgZSQ02oDSSS5rrAkqTuarEB614E+Q8VCkHegzxADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddDGC+KLnj0yBA7rAJYkNbP9E8pfDfp3rX+fTo+NBlU=;
 b=C+oxUhJbjezdFcdYN69JT8MYLRkIjy2pW6qdqWyIg/V6t2ZFO3zTNMUgI3CpLndyh2FhP+xirK1Ruymqd2Ukw3IXZ+EJHWpOjLS3UW4mN6o+8zLCtM4dKRaqO/BzIKvJ8+kiytmSiq+AIvTLGCc1R4r0lrfHm4M+D3T3PzKjwEHyaOSu9ckwcBmE/8PZDKkl4uoJ866Od+k34ByijF2vjrPJ17TZswfAcOKMkhCYnHy1b6Y8Bzroj7Ya/cTyKmT8hIfScVslRO3AcezVDab0F0pEWfZG1cqncSengEcTbV5vWjxomXTcZR0wsr3RiEnyKdS8k6WyoGqproU749PrKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB235065.eurprd04.prod.outlook.com (2603:10a6:150:3b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 21:31:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 21:31:53 +0000
Date: Tue, 13 Oct 2026 17:31:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: Use unique debugfs names
Message-ID: <as6jQmHhNT6YjAYZ@lizhi-Precision-Tower-5810>
References: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
X-ClientProxiedBy: PH0PR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:510:e::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB235065:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd5d54c-1cdc-40bf-271c-08df29716632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uQg5R7kOkAQDiqoOaQ0nTP4DmRWTVxJeCPAhZivLISVpO4bSNg93r7Q0MegtckuKbZN2mWtSw6DGOFuL2ti7i7yWT55AQzZJnHdInaE7wi/bNeAQQXfY83TCGixKSOg+Y9goYFaBLBdVFn+hWkmmf6nUjCT+EaZmo97ldcWlcasjUG/sSAFjISY1tuGveMXB2x8Qf1YaQldlQOSqAsm3as3Fh2nPZfUzCqrSMyT5QTEqv9c660QyVq0xtbg5TEGZIe5mJTiSv5nVI/tuH63Z5nXvB+Ycr0zy8rUCoSWL6iICmAVSb5MgzXHBVHA+4kE+2ILEnL5XwkGCztJywH5N3QGHVR6XgddohNdxJo8NdCciErLtkH9ENLKlqRYfzxah8xwWc8JOjVrodIGL9VbC2tNVAI/TdcePHrlrRYFnc2N2m3R+IgN9OvMulH4+8zUmsg+vtXdc1l0dBg1/oDiQDuFpUgFe4hbB/odT9zgTzL7goHtASxHdqTv7aYdOohWRUoBQqBckP8A6H1UpywYyaAsDUPljVWvGpzsrlYJh1Q1z7wwSzgD2Jt9AWapfG8l/iEF7pcbRw09p+0Y7blcypHvq/EaH/aFjrV8n7hBHSPxr9OYNGyC50BE/vYBkfOsRbMqApc9O8Vxyz+/fABVv2qiIEnHzKnOBcOLVjIcrr/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HeV4lTkrq0AJj2I0HwVwSK27M7tjCsPBlT1A7jsNobfOypJYbUHUCtvG4qis?=
 =?us-ascii?Q?AEjhTp8+S8Lq1h0D/WuhTmil9z+XsHD6yj0KOApo3UM4jD1Z2H00PfHz4CTG?=
 =?us-ascii?Q?Uk6RtueBxvLNNTWKECBQwI1ZO3YW5cR7u1q/6d3i4DJ/NEDkl0TZVrOpZjcz?=
 =?us-ascii?Q?2PJGZePkWu7IN1kOImVE1mIdzcPQ7PBAHU0IWmfFNeYEls7IsTaiivORndu/?=
 =?us-ascii?Q?hxM+LkoHpgfaZMOEf45ZO2WrWO/oJkPZOPDrNjD19WQPf9GCK3NmaubaHFoA?=
 =?us-ascii?Q?/Y5ZGIb0sNL/mh7FRsZ7yLtyjwxSPQ2i9IOIanGMs8jx7asK/+m2wZo0yRL0?=
 =?us-ascii?Q?hWXY6iuwT3Z97Hkhi8WJf27NnIUR0x8cKq/PiRf/Gqm4fcFiA0+jL0vWdeSW?=
 =?us-ascii?Q?3pYeVkD+MXx3UY4qWUz56EQ406JtKQ+anCQKOwkFPjXORrmYXAbOZYDrEzsV?=
 =?us-ascii?Q?QbkiNkNzdOsbt0/o3dPSUyIUmwYsz3e87XBve6A5I4Ztx8lEONYFUjRFQBGj?=
 =?us-ascii?Q?DwvA5YswebZqu2K0XS7+fdo2U1/BAnCJ8m++SszivVUvThz7ruAnYO2sWjCp?=
 =?us-ascii?Q?PgodZxHxP/4jspEp9Zzn53lV70baYZ+PuxHYY9ijugV8NIj76DTuzBcf8cHF?=
 =?us-ascii?Q?m1LkzCfquD7BDB4wZwg0YjsMuw/N+vLAzIBOQLppK5WOwkG1Mr7Ak7WR8iOV?=
 =?us-ascii?Q?zbDtiyM+v5agqo8ZmvRB9T7HUl/wq1vBXo2B9J2Jmsd2UEW22CKIgiNm7frU?=
 =?us-ascii?Q?m+bZxfFtpCKuRvayeCODw7BeQLAIDjPg6XwmRa3Ze0WaTxRwQZMzsNPjbN2z?=
 =?us-ascii?Q?gJ/NtxRVz5pwJqAPCeWczS+HOCEJjw8ftRBTqHAIlIfvOFcBTaL+to9vr6iG?=
 =?us-ascii?Q?++TilARxugEDDEjx9fDRvY/Ajr4GjVVGPedpPlbwDHBymhdwiijvNk1SUHpb?=
 =?us-ascii?Q?0nLfmNQfzzfTpH0kVtUfiEU9jqwEayMvSAk3H9TkNGieVC43YFWVyhy+mMvp?=
 =?us-ascii?Q?6A9v3fKqzJQ+y5fmq12QB4ZqjNFerQAgSImJ/TfyAG3nqfwmjRsqvPHIZcMp?=
 =?us-ascii?Q?HVFbxmQJfgDhiTZg1yNWF7NeB5GEhFgWB+bH+1pYs/QfkyX5i1rQiACQcCeU?=
 =?us-ascii?Q?ulJuyGlOqhGQq8tf3KM9XGjEIPE5T/9guo3GaVkw+vfnJL+EGAO6QDDvECx4?=
 =?us-ascii?Q?SlnfUbX78nc383+Drt3qsyfC9a+1Jtx0hcjcHHDEzaRGVZ2Pg5r5T/uBR8gy?=
 =?us-ascii?Q?+iYVIiCkyuDGr3oTFUzPteYfraRbozW9DwjH2fLuHI5N8d56F7vBrL+qEbq3?=
 =?us-ascii?Q?IarG0gDp801Oxm3fcCN9up53obf9ucG6MrI9lPpMo59npuKO6Fl+qmqHvRMH?=
 =?us-ascii?Q?8O2XGqqjQIztQPxrpbNx9G+FlzidMS/zHrR1VPQN6p2GZJTkKIEqRjK8hdeD?=
 =?us-ascii?Q?5HDOaUarq8cNXfLe2VW3mLowS/VSyJU5g1VArJOX6KMu3TNxEsn1STA4V0yS?=
 =?us-ascii?Q?gz3+uZgz3efGM0jQ1BwtXALeBwSqAH8G0BMG+cLjIby1RFdHBdol4ynv6hro?=
 =?us-ascii?Q?DKmGF/KWlgrPjIJXAZyrqXzxnPLFcqyb6M9dgO/Lt3Kw1DTZLpeFJFXkmNew?=
 =?us-ascii?Q?/1PVgHXzxQuOsXl+Ezdvx95vDeFrj2ABGkCr77eyITliwu8ImJ8rccLmDp5E?=
 =?us-ascii?Q?DEgNStHcpk1j/t73Q9aWVVGwsuTOYgBX493vXsG4gxfyl5wBRSKusQWrOLoP?=
 =?us-ascii?Q?v0Uk4WDEmv0Z+8E532DZL72l5Tz96RLfD77ubZuoFYKpF3XSRQpa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd5d54c-1cdc-40bf-271c-08df29716632
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 21:31:53.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Oayi6oEzsgAWPGhZPayZD2z8OaoNx/kVkt9adzDM75YZsW8l0IykvjT+addIsu+Zg1WQlPNLqQtP9t10CXp9Gp3M/lkcdowfSrYYcC7RaY9oj/x2ZeE7BvfHtg0oTeC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB235065

On Fri, Sep 18, 2026 at 11:15:14AM +0200, Linus Walleij wrote:
> DMA40 registers multiple dma_device instances for the same platform
> device. The DMAengine debugfs code uses dev_name(dma_dev->dev) as the
> directory name, so the second and third registrations try to create the
> same directory and print duplicate-name warnings.
>
> Keep the existing device-name directory for the first registration, but
> use a dev_id-suffixed fallback when that name already exists.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Fix duplicate direntry.
> ---
>  drivers/dma/dmaengine.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 6ffd8bd82154..a1c388def67a 100644
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
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260918-dmaengine-fixes-5c893ce71049
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
