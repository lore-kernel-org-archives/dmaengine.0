Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4C360ECF;
	Fri, 11 Sep 2026 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139105; cv=fail; b=doe8oONQcLxSYakaIeN0lOuKsWJOe3dpiEMSAIHHrCUld96bSbI9Ica/OO8SsI5R8esbaZ16g5l9/Q/3Jl/nUuIxgyPlx8Y3r7UIuuj+8DLMBfHLZNlbY9GU5N2yc2TZjQtIsmWVRdMVGYsLhLo0SN8pHPyn1rD6mSOYlYZg/Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139105; c=relaxed/simple;
	bh=LBbeEuXDJZy3gQRsJSpiFCcQmMlJme3XOEJx73Fog2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sTQEeCTFVgpTPShWzSlDST3nkH19e2znzZ8ZTsH7CxZfpiQWtqDiKGZTNOJvfTDL1Dy/DkzgXr8bGWzCTLyf5McM7l/q9tv+y2mEj23XHK2ZhopTaOyPyCnJcrtvebRQw/My9PCMMCrsOLQJuHJPTP3ex2f/iVW+0U7lqnBI3y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EhV5D7OH; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EhV5D7OH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG3mOOMOemr841fUbUtsN2BKmpPIa000O+anu4gNX9KHIpquGLGN6HUKKhz+xrve/SU4MBnxkI2b37lWREuTNwccsCb6waAzDIgwzdP9ZoqhACmFu8V9TKlp3regHR4LhhA1FvX9fwHZuIc56vqEpKVNVpJOakofFB58UGOxzKnshvhnPxK5RXLvQI4+oFdLMoXvRRAjHg1pnyPkIPH15JuL7ne+T3GWuQ6ch5+GFW5lef3xwAR4aOG0X3QFunqOnS8eAgmpCkynwKKeTLAkxCtbxO3p2tD1+JO+YxV1Uhn+rp+lPC00B+cNr5X4h/REKG7Qs73pBHLHdkU6zt0pEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grCIpBbq5mKkqRf9T375vtZav3WGF9SZ1wbaEzdmD1c=;
 b=lOVYMlCKzFlkpfefNQkczy27RLxM1Miw/IR8nvy+cMTfpdVxBx//FbJFjZnCw0MYHXBpSNLKXUIGhOwoa7hrYv3Y8T9L3xxJuTrR9Zr9vRf3Zw4om2D5jTk8kssOsqWRnAvaQTGV8PtbSFTUtFBa8vJ39qQWt1RS4+X2RKV/xuxtIAF0MA37+0YPJNkwK+qe3xQBK2SkEZermywlywA2eGv1U86XKaUYZk28J8nALwaZfSKCuC0c+eeXJ8Uxulo4JaCRgobh+uffi0xCl6L5xVxWey9qOMSIAOAd1MRy6try9sx3k+yTpTbhqQM2c0vTDuxrqHhu2DMrvR5ob8D0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grCIpBbq5mKkqRf9T375vtZav3WGF9SZ1wbaEzdmD1c=;
 b=EhV5D7OHSGzYNOpeDF6OETzAooszeHFW6DKjFN4KXOh3nMmJHiwknrRyb5X28VNhuU069U/542kkTCdvmhuNORdSzKNqXhK86pcDTaupW1Bcm/WY0fldfrIPhvcm13PRCBJj13/W2Nt9HNXsSwCX/p0v8rp1SgnmuQ4qj8ZLoHxc50WcYUA8LCX4ClcebRyjkZkUOfK3E4eK3CqTMX0qfK/QOCOr87swH+aqpzF/PWd734055bbf1vcJAI6LSKldw8BHvFpTeXn4Je2mbeImcpe9LbnugFDljWgXY5nNy9dZqyQ7x+xd09RGHrjzwfT5Rs/kH8G9vEs13T2Y5M2b2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB800954.eurprd04.prod.outlook.com (2603:10a6:20b:7b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 15:04:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:04:59 +0000
Date: Fri, 11 Sep 2026 10:04:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Yuri Tikhonov <yur@emcraft.com>,
	Dan Williams <djbw@kernel.org>, Anatolij Gustschin <agust@denx.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: use assigned variable for
 dma_free_coherent()
Message-ID: <aqQYk44DLfkT8w4l@SMW015318>
References: <20260911035941.200551-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911035941.200551-1-rosenp@gmail.com>
X-ClientProxiedBy: PH7PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:510:324::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB800954:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef3038a-99be-443a-7c04-08df10160c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xZp8DJ7Zgtbg28jAS1e6GhqP3s832c4eqkeGbYlTU7oDHoip/kzDtcUP/3DiWRNtq/mOaLlJwEp4CYFfieFj1atd+mgLS59fOCFIQpDJ4hP323LcHkVKEDzkPl6hGwWkcoFOAmvzE4hwBFd4e+EHcnlCMsGplibX/E+W2M1tAtWKjvKTYyurJfOUNU9WcLisGDW/l/xWu2Vwp4JjEeo8llXuPF/POnqNQDkgJ+sLcT/PKGEw1GrrRkfpnEW7qDaMQNIZ5Slyz7is9QJmZj2j+oA3zbeXEKjky99Xs00eTQATrGGkfRWxDSm/imcIoQOytlqL+7pu4hE3XDrY4Ibrw9xw4aaAFZhTcNVgjnZ+GGLj3CfqH4HcmwSu1O3wOR6YK7AfQGTGh7Va2tsjStCIGNz+aG0D8qP2S4wPMLtRTAp04KxXSU5IQZgPnVhwFpQ89tvB6FCBOxE/izSBofFKWfv2UZUHbag24H1Wp6Bs5FgQh9EWYhyVu6A+dLZte13bG72ud0tqEHsJRVOuddm6vS82alBwWfTRhQim5kZrdm7WN7GxacOW4L9tWMtwv/xt4EoTFX+TCoWvPGWRy8ZVZHixF3Sf+/fktoC6EaM4cGfwCCg4fqJpHasXk+gK8IlRwst6rP1mlGJZ7r4bnCowSRn1/9zOOCHTT8VUqr8tHt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PQsxuLk72QrxXFj083GtzAh4A86ifjhwdmKmAW5L3DYlkMzUwi37aY0OjRwd?=
 =?us-ascii?Q?azv+HQ3KR1AO4U/S0Rh3M3jl1OpHWQK5g/5DH1ZXoojdY9gncMYKI1y54gTB?=
 =?us-ascii?Q?4g1VBxmx2kaSav1bBwP8eZ8K6eVhKUrHF+NEtO6+fwxz0+h7uxus4yCsE8eL?=
 =?us-ascii?Q?IyappIB2h45lAdzyLkQ/TYEqjFAxfjIiGZCBd0S9+7RGKAXCT4XzepZNMTD2?=
 =?us-ascii?Q?+RV89f/QJ39ZW59igd0bUxgM291Ajs9vg8qORUsfepZOTEhmnUIfBRPbgKjV?=
 =?us-ascii?Q?+daDy7vt04EX28fa9R3CEYmV6uk76jwvqctfXc2OhCC9u6EyWP+vqpOPequz?=
 =?us-ascii?Q?/3P0E4GiVD0mkwKwg5XVud0x0diaB1nMB/yIk3lu91yA9koovlygi6BYcC05?=
 =?us-ascii?Q?Hfi68KyE1ND+HLZD/m7Q+9F8iBMdaIEkSrUbNYvvtoXWjqNQekIdEfonM4a/?=
 =?us-ascii?Q?o8CwCYgK/sckabG93v0jD59266wWpoknZbUHyYp07y42D+eiZDTYFxUsagWk?=
 =?us-ascii?Q?R3i/yjmfKn81XI6/AhRZNU7uNnSFjJ1gj2BnTeEpYPJWgY0DvAkkhfL171kO?=
 =?us-ascii?Q?WVi3FL9MIFgJ3fhLEG3LaWjoJGTNy/+vVd59kLXVv0QWdC0WIUDExi0XlPWG?=
 =?us-ascii?Q?IJ4X3edX/q5diBPyAx3vkKjGM78eHDm7eyd+57sVSxBlHgGmd/3jeQXGk0U3?=
 =?us-ascii?Q?43ZR/CwDD60Gf57OVOUwIs4t9ryWDoms5pgHJn8oHmJFwlMwEP0wcZGpPO85?=
 =?us-ascii?Q?OQ4o/E+Rv5JMDjCVN5nXPez0mIRkn8dixBuVMhLBYUTfFEbB/4NdNJxla8QB?=
 =?us-ascii?Q?/N7Np21gvH4sjyECfRhhseJ4h09PpB0IVqfmvpWnndxrFUnuuiUJvRZRiFUB?=
 =?us-ascii?Q?9rETtUienM+TnrtNKlazbjvsWiVHZXXfrvzja7k+zlj08h9Hv+vCajMhGzWE?=
 =?us-ascii?Q?jcLI/H1bERDBAYvic+9Mg5dCX1J7gGUIihWvDXrtDLm2ELLcyxjKVXLiliZy?=
 =?us-ascii?Q?mK6ru4JYjEYGmiX/f3g+0vAUVweD+Km6aWcG4CwA2nxiAv10tpN8i8z6r5SA?=
 =?us-ascii?Q?KTZ0LjmQhzsWaTQ4LAhoNiH2OppcS/O7Q5Dxw6sOKJgiQNcxHI29NYYy/y/W?=
 =?us-ascii?Q?WYkjqKH9vhV/ajMk3ptl4BF/2wcOEiYDSbQ6klOZ0ehYd+zcvl6LhqQJSMjf?=
 =?us-ascii?Q?N0fvehfRKTb77KKqBZRa83sJrD/44AcaB1DmCW8nM8twSw4bbAHfFt9bB8bF?=
 =?us-ascii?Q?2XJgoEGD+NlbwCxOmLdWQ/+W9Tm/tNNH6hy9k3VNrGhgmiw5lavOH6EVxZKb?=
 =?us-ascii?Q?Uqx7j2apP7heB311N8lw+jm2qA1RZJlF8mix9DKEJlCFzdMAt+8YJrTcP5Fl?=
 =?us-ascii?Q?TRwaUP3s81sOGbJ4rw+3e2D5yrR8lY22pcKdoNLCyYW7m44WZ2HgZFkC9xdv?=
 =?us-ascii?Q?IcZenl+cY4FjLF3FFYHsh1PgNAqgPLKfWxkb2OVBUlkcGdGhtqE1cTftfsVU?=
 =?us-ascii?Q?/VLpSnaPmGK0v3Ew6Pv9phumD7on3uKt17rMMYK/7EBSv/uq0O4QE0jCX4zK?=
 =?us-ascii?Q?vBZsgIfsDYZ4zMVddELEmZXXJ5ZkyVdOhpo1IYDZkXPV7aWhaSnbskx6Is9h?=
 =?us-ascii?Q?qYNgwI0s38J9faPjawk9wY/HRcCTJ8rCtUJqbiHVLMvn8+t+JFSfQ1+cT9UQ?=
 =?us-ascii?Q?jjrI3ZvOcSPmHEwgpiE/mWlbr6g4XKlRIqH54kW3UKNVegC4nwDDO6hpQ3f8?=
 =?us-ascii?Q?6dTjNCJSh1LpHPOMU9wlL1EVheKiiM75brYfo3d71C8lzSv0sMr5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef3038a-99be-443a-7c04-08df10160c77
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:04:59.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO3W/xSnlHm6oI7ohd3zz31QrPX3gN5bFphydRUsUtXWrz1/9vHarOX41Uyu/5ib5aVhTq0EyggJur1o5i6w4KfX4qsrYfMxgMXY+V3FfZ8thkg4ZHsqVI/HDWR1y51d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB800954

On Thu, Sep 10, 2026 at 08:59:41PM -0700, Rosen Penev wrote:
> In some goto paths, adev->dev is unassigned. Use &ofdev->dev to cover
> those cases.
>
> Fixes: 12458ea06efd7b44281e68fe59c950ec7d59c649 ("ppc440spe-adma: adds updated ppc440spe adma driver")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Please use dmam_alloc_coherent() to fix this problem.

Frank

>  drivers/dma/ppc4xx/adma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..d0863394c723 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -4212,7 +4212,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	else
>  		iounmap(adev->dma_reg);
>  err_regs_alloc:
> -	dma_free_coherent(adev->dev, adev->pool_size,
> +	dma_free_coherent(&ofdev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt,
>  			  adev->dma_desc_pool);
>  err_dma_alloc:
> --
> 2.55.0
>
