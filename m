Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456736;
	b=GjMf8LInRcBwK++Juc2jpFV47MesWXgBar1jJrPcxSwheZp9w83u3v+ki4CKkEjdJhYz
	 w2YLD76JFa6P7MZVSXOmeORUoGRWQq/BzM+Br25CgjzdwSqRpAp8Cf6uy2IYl3W/J9Mv4
	 +OPgqvkB6P+kBVO1m8C+Jzmv36TyQ82x/sRyvzFeaoXfDMyk2D29w+jaRh/HX5S/n4ve+
	 gaR/5vrpZst1F78FZch33Ndv6pipinWN+RjhJX97p8erUFQPWTevUkupSKF83kI68kONa
	 kDCgvLzRxGepbBS6nfqskwsEowly8vBB0mAL0VCxa/mpJ0Ltj7V5Xaf+piB8EL7qiiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456736;
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
	bh=uCZfPoGa1Wr7pZR94mOQcyNu/ANPNQj2Dc2Swk2OnQs=;
	b=XaV6oF9GzFEKqaptACVcNIqwPIYGGbu0YMXbiMGr4Cj2GisuHxT9MsbBatc7vH9zCyxz
	 +eauWjSgc0xNOa0HGuKKxYreNRzdxIUvgBgd1U/zGI7XZl3Kb9cZb7/Du9ENnPqz+i/5R
	 lHC7EjTy56ui3ljGOgAcW29oMmQI1dzE0RS57L6yjKhxzczX2Psyd91ZBkH/yt0uoHfzQ
	 B6WhN0vqymTdlEDxSk8DY229uEMp/sq/jdLmFtztS+ZPXy378YQ9aDdGWi+bnZXY6dyp6
	 jOhOJTmLIi/lw4WZ8umnhbtLrT8gy3bT/5rEzLRBOD/+TBdSuB3ziKeaQI5UghUMFMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FtGicGf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.30
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EE0606A31A;
	Mon, 23 Nov 2026 17:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28EE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FtGicGf7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz/uU+1EKy9/j6pjGxoSPWGXwUr124fJ2GDj0aBO+B1d8PQvFcIYQlcEyxWxG6su0IPPg2jlQyw6jNBw/avlm63s4FvshXnU2ogObUlw/wOH0uI/ZV21h7G6B5Qxf061CYVvkZNrHnZT8qcZpiniSpcjfgMtBzGtWDBnJvE+gzgFDyZj22floAgJ15EqYTxOw0E3yka8zertiycHPnOA8BNZQZOad7LzpS16eXDazvxxHPZzlA8brbo5O0XuK163cUeEAMYL9p27RC8W/nWjKmi4Hdk4pxzoKPQmppm9CBnDnOcn+URFY7BAk9JAj5EKIuzxNIMOYJ9Isw4nYhCcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCZfPoGa1Wr7pZR94mOQcyNu/ANPNQj2Dc2Swk2OnQs=;
 b=sgozyxWubz3PpmJkV0wqfWT4nBHwo55o5FGOMphVQnOi+R1H9rtfh3gC7JIKsAbfXlktGve5Ns+BfXbW+jeq8bwbREQMegASjk8g34p8lN/DYkMMz7yO2LtqmXRSTn1J1rIt0+VfCd5qsrarW0qj1hIJ1e5kA9vLAOEmQn5QwiXI5IjTUeQPLNsEUcGEI5vY8BKalBlD6VM82MO9idxXyvyZVjNONj+dWsN8JjClCbfTyH0xPGneDVvv4ZviNcW3DCuj21u5aaUfLsIzGIi8iVEME1572GW8oq0CJV/YXrQGJ/sN/juB1XxqJPBmkzMeWKy/ljNe51LAdZgDzh7avQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCZfPoGa1Wr7pZR94mOQcyNu/ANPNQj2Dc2Swk2OnQs=;
 b=FtGicGf73L0VNCvEmVw9+5aPXqP//i2A3zAUoKzch4LGWuZSk3uusiSqzQMSvBpG6u5fJ0n27fiQMU+E8uycIrOjZAsdbYhWNgKkhEvPH1VLCWx4e2C0XcR8oaHwzuoBzfAMC6wTePFPHhnTlWSLjzbpY+928jFWYQfvl+09vOS40AWNStDA7+LLXXY5RRlrEJujppgjC1tct+edVfeEJAyzW3kLMmwofbjm2fKR6SEovGy3TlHxEr7XXKVG5vt9d8GQ4N5yiFRI+pnfPesCb5DSGtZG0mjYmjb5qiOFRog47S/XOuEHU+YG0DUARikqpHhMGqHRFkxUyqaX1uEqvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB12192.eurprd04.prod.outlook.com (2603:10a6:150:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:58:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:58:53 +0000
Date: Mon, 23 Nov 2026 11:58:45 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mpc512x_dma: add missing MODULE_DESCRIPTION()
Message-ID: <awR-1Z-2l2CDZLYk@SMW015318>
References: <20261121192306.928291-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121192306.928291-1-rdunlap@infradead.org>
X-ClientProxiedBy: PH8P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB12192:EE_
X-MS-Office365-Filtering-Correlation-Id: 263a8ce5-391e-47a2-844b-08df498b6fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|10067099003|11063799006|56012099006|261021121427099003|261022075727099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d++jhR2zRqrcSD4ruJs+vraDpcRHjfdJ7q1I13wVyynaa5R4/uxGEktvehxO55XNnBzIkFNOaHoL26rb8OMtgRBpiMTeKGNvc+CHW6eyZT4vvySwoCIQBcR20mJdpyZqFV59dtvkjOZnlP/ufadDpbmichmuejI9GJYxBKeHD/sefSUN1kMLCZJAYM/gTLmQXRCTADhe32Phr8c0hHgRiFaoyB9LaMB+f+CJYJED/qyjlhipaxhNllBK4bzUIVqWIsxomU7o+ViztqIpbjQSoU/dk6+/WJvd+UvpldsdIuV9oNjyzjZbcmJ4IRNc6kaJbPM/+okSzGwChkeoVVVy/2j6UeSpknS92JgLSvS1Y0C7Hk9VgEhp6ajUhLXePLo6aZ6YFJiyanDXcRHRH0ogeK10trABgTUFXLiUC1Xx18FOxG8ZYD2+bejN0bk3/b3lDb6cdcCZ3mjDGKQZWtICJz27SuhDYVKfOzwfXQSMtNj/tZGzF6kHFQC6VtjloFYHeHigVzphWhcxcXqAjnijr/NOhCZ7sUsrMe+JRuRqDwopTPprc/aDUkvlC60biR0x+Q+i/hVpD2SFaulqpamfSPCuOrz9/tWo4s+5IL7QKblvPNX0gEcgxVUWhRlLbVhf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UDLjxPdvIzGDo9OtoZRO3HEDkehjCmV6AV2DhHWwuuV8wEjbDx/0hJuSY2QQ?=
 =?us-ascii?Q?V8d0USu65+P1KEHWdsNZ6Bd8KTcRnvQgekyE5lMFBNIRQM1N5As5SFQlEoMP?=
 =?us-ascii?Q?Xl4Cnu/YL1/t1eAAoAxe7LmNR506MEPMYGE8o6fW/aoGU0/04eQCuwtpHbZq?=
 =?us-ascii?Q?DS07SgHp+v5byU2ENsPtoBzToHUAlySivDhc/4w8Pgo99fr1ZdhP7L/65ZA1?=
 =?us-ascii?Q?AIJHAmAHgr1DHB/u92/hxqPd0WMkxkhjDEQfSx5YauBvSZclgL0UWKqB7MBe?=
 =?us-ascii?Q?Uf6ObdDXwkfVAgG3fMnJLpoVCvPL9InleNIju6mPqsy2v0HDzTkvr6v4gQro?=
 =?us-ascii?Q?SK1m5Z9pgDMA1na4VZd0JxLAFIrXFgc+XcC9HIrg1KX4nxk2JQhUgCSQ1Nek?=
 =?us-ascii?Q?pq1lSxqC0ZbsHBI/po68lACyYkLt4GJwW4x426aoz6h6Bp8nWZd5iAfT+JHV?=
 =?us-ascii?Q?+LPhkJmXClImxICTl6RZTEUfryhJjZQfObHXiNpbSCTHMEZyzkbZJnX6U7Ty?=
 =?us-ascii?Q?4FYagdHaYlP4i+3ucpNPl4ebHoRDq/A3ezlG/d2vFor7bA26eXKyK6xVop0P?=
 =?us-ascii?Q?a+uUJAPkqCJn4bsgaA5MRggwQZ0WDDBwgwMUugluOo/e/vorUjnihoVxoR6U?=
 =?us-ascii?Q?GLN0YPDgTCAoBvaY5aygrMv9eFLV+oKNuL+oMANcHgcFjluEx+lEQSsGzVSw?=
 =?us-ascii?Q?3MzgCiPXM3bM3pkkHOVVO9jQlyDOHCzc8f1qT7Tu+UF63XCWF2GunVFujyGG?=
 =?us-ascii?Q?mi0UBW7nSWbHuLoz1CpWfWcoge4C6G8Ayvf815YhMMv8ScdqA4RWGnDELtrm?=
 =?us-ascii?Q?0gZvB3yEnhbrEi48vnin9l7EZu0dNORg0UpnIr3z1kTmC4GsbcpSuHHp6PPK?=
 =?us-ascii?Q?nRSsSD/BRQXWWSqbCm6VQ5gMoYlJbxHz17+AMRFXFdF1UhWswjUy2NeqgfpZ?=
 =?us-ascii?Q?QciB0yI/BY199sdFtHb1sN4crqe8PbkeVhrAM+ud12DtAsGAVxISBna1WYQb?=
 =?us-ascii?Q?X/TFqTNvw+gGie4mkA+WcCpb061GE5SjmOjVTNapZXYW7kcMyBfJ/XJ4/0If?=
 =?us-ascii?Q?SV379bjVdmvAikuWWw1Q7Zy1SReh+cXdaoeFl3tSi2wJozEyyUcJ1vBEzJSx?=
 =?us-ascii?Q?M+VSDdJcNN2dFRtX9FKlOaPIIIkhEvh0JsN+CL7HYfU2Y3uBpkjpykGY84Xb?=
 =?us-ascii?Q?f3pcc+Ik9lfRikPw6unMvYdV5W8978FVkSXJ++i+0ct1UaGSGT5gls56njpg?=
 =?us-ascii?Q?fYlkzbXD1H28tDRS/l9wvCA37vLeg5ZoVIQrbfuXI4PASR6jDhh5LafVqPnq?=
 =?us-ascii?Q?jgMkxazGEVx/Zs7Vk3xoDIbHv/2+eydKfTxl7svU2qe9UTEZCR6UazUefM5K?=
 =?us-ascii?Q?kdBzJ/pPfDiKI9qyNMuEPGpHGrxh0oez22YXii0b9yDaB2/CsewvlZ0FSbTg?=
 =?us-ascii?Q?Dat9UNO24A/NWhbbGkuO101y1STU3DR3Wl5K4oX5iMaPl2FFTZWuVA05t7QV?=
 =?us-ascii?Q?mRXE0h/SsuZDkOVn9aEjYa6zLtfvfIMg0M8S6oS1h2xNelX6PBRNnXCE0Zyn?=
 =?us-ascii?Q?FInUyAbsBsGJk3bfru5/ZI3QYzjDmEV5hxIR9yxM4PKgOoqGPm4nwkRPGQyU?=
 =?us-ascii?Q?OZBgk/YSkm2o0d7XyNQg8l4pnkX44NjxXCt7U3RZ0YXWYipQJSAlE+Ftc4Yq?=
 =?us-ascii?Q?DbCZlQj+a3jiaz6GZAPM7L2BSrPGFxzP0nOVa1emI6Dq4rN1z6DlQvIAK7ly?=
 =?us-ascii?Q?BUEWFljis1sZ3ox9mDxRZQj/ULoszLomKIbuBbDTeCBiL67+Z7jC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263a8ce5-391e-47a2-844b-08df498b6fa7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:58:53.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIaKKyAjO7DJjbV7A2hKmmA65wmg+FtpKwp7CDh8tp650D1erO5eTcybDuPD+SQ3T3/tH9eC+kXVrH7PfAq5s++EmjbPhULSdjQ3Kzn3PYFEbJQV5vriq2JjDf76w+Z1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12192

On Sat, Nov 21, 2026 at 11:23:06AM -0800, Randy Dunlap wrote:
> Add missing MODULE_DESCRIPTION() that is now required.
>
> WARNING: modpost: drivers/dma/mpc512x_dma.ko: missing MODULE_DESCRIPTION()
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Frank Li <Frank.Li@kernel.org>
> Cc: dmaengine@vger.kernel.org
>
>  drivers/dma/mpc512x_dma.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20261118.orig/drivers/dma/mpc512x_dma.c
> +++ linux-next-20261118/drivers/dma/mpc512x_dma.c
> @@ -1119,5 +1119,6 @@ static struct platform_driver mpc_dma_dr
>
>  module_platform_driver(mpc_dma_driver);
>
> +MODULE_DESCRIPTION("MPC512x and MPC8308 DMA driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Piotr Ziecik <kosmo@semihalf.com>");
