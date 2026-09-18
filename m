Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5979B3B05B4;
	Fri, 18 Sep 2026 19:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760484; cv=fail; b=fW3vKPkzKc/xFm9KP1Hp2et7bIUUPoRcbSgrhy/r0trUvW99joO9VTvm/BphAdwyGbg8UteVYO88GmR+yN0GIXb3KRbEbS72yDrzJKaw+fTUymo7/bgZeUY+r2TTAPlSJYoGMXHZ/ze7w2wl9hj2gbOvi3qJTeT8KyoW8TI/Umg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760484; c=relaxed/simple;
	bh=CnD6FT0OF/6ecBvBH1yPPZVRX95eG6BpxJnAKhNk7iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uDBwqX1ClnODcm4ClHrRwcgdLP49e1h9acPFPbC0rBw+dtgr61e2f9DbLPpy9LplEkRj0Hj+gUaP8+5RzfcvtzV2kxfqIEI99mVmM7PvmNkUDu3+qflDa3J6lL8JVDd74xvGi8dcia1LumJNMXkWyg0LexoCCt/Q7VA0nXtW1OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tZqZmhH+; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tZqZmhH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+5XoaW0qhwo0fkFQy0AHR2VQ7qGCFN3Uq1ng89lge7q2x881OnJBe1/6huV6gf/RzaHNBQcClJxgI3P674wABfVlvOW3xgh9fDlnZFkLPYRgJF9+wwSdB4PmGkV2YevZSpPdPLb3ATqxs1uJYHeV6UXYrfvkn86PdPEa1JjseJUg9sb8J6zytCSMWbA2R7R4UDRz0MM8G6uVUxg13QgMcYqXZIkBuCx3EKxQQpEHt+dts0ZEerWR6fbF2+4X0WSvnlVsrw/ZE4UzaGPsz5rCp9/5mU6GWGAohD715KyCpojLYOzXDrMcC04MYdXN+sN8DCw7XfkHJxmNdr5MInADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+IzHZuDDJSAaP2IwuKtMW0q5ISaIhhWGlOGaWxkezU=;
 b=Qz3BpRo23fdWis/t3vRInQjQcJw0Ybc+QXrawomBsrCA/7n4KNIQEv3+KU4ESuYQMDNxLVVsyepfIsk17HaZ2tVpP/aMEzncC9kiM0eaCJy8AOqW0cKirI4ao60MshuuGXeSLUYlc1AAnmiLY34MOrtVBT9HVOcJhCHwBdpPecr+rKyLBXkZrb3jfKtnYG6Ub+dM2SblqeAzJ6MPgYlzwNEc28OdSg5WHjhqbm8hhBPM2BCfHeCIpq/PTLT+8G7/e1inBJIlnSOn2NdYw/GTp2u/Ri1kLkp7sSLlKKnCn9kMuNn+DNerXVDFib5eh8lbchc32d5xglGjowoHzVA5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+IzHZuDDJSAaP2IwuKtMW0q5ISaIhhWGlOGaWxkezU=;
 b=tZqZmhH+ALNcBvziacaXPNp8p93RIl5iwYe1ZW15Ll3Vvc1BEx43/cnZdNb9FmR8ZC/N33hJAJilnikBLlTYtbIaS+MuLQjFE2ztDMJmL8PzT3JgLU7NeSlnCmFEI55aDI2Y8yJkxZ+tZAh3Gn5cN63Obj6HvETL7uCVEqvfNgvFc0vYPWx4OawGiR/tJfCDWe0YAX4QNrl1qaR4EBYMNJmB1VPnZRmVB/XeQqnLSAAKxmOEZUcqJYytl6XxcXBOXC7GwtW9G+ULRbaIWXRSzeWJOBkxmm1mVnfcBBTMGKz4sJWcSAdF00oIdrRS49jgLSVkQDAav4beFh0ntvj4Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Fri, 18 Sep
 2026 19:41:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 19:41:20 +0000
Date: Fri, 18 Sep 2026 14:41:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: bestcomm: Enable compile testing
Message-ID: <aq2T19Boq7qum-yc@SMW015318>
References: <20260918175950.21657-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918175950.21657-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8P220CA0055.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 26184ac7-62c6-4d4e-b6d6-08df15bccfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ejC5DVm33EK5LHEy+HNjTm5P4mA6Zk1fwVFwqVy41zI+AtjyY420qswURZFBLaqDi+a+uwXbWWrx4wIAkPYrTP0CC6y9Le3npTbaOyQ9PniQk0axbPO1L+9mMdEMAJ61rD/U7E8BMR+tTS6xatKmQPUXLo0morsos45NCAB5Tg4J2yfpPwF3ly2gv518JKWaCF0KIwExQWKWu3ORy2vRYhn/ShRnDB3d5k5yE8mDZuChOhkfS6ilOTapz21FUSR4cjA7mZA3TRTkBDeMgq08topDra/U6LYufdUM5e4omjzOAYGk2u/lKNYw9epnze6VqozIUv/avJVvYdR0W+LjJXkY9tTovYO38FX46fVhm+opwRXHvGQtdHK64poMhGtFiNmo6Z4McdvZ+sae2gXrWNrx1L8d/QKZoJ9tDU4Z58GLcMu5YTBxrpmHKlEP4MKhR8UEACuWpbkaYF9uZua+f8kYMP4idLQtgkwfM/5vx55v1dZn+Yal/1xRLsTfQoGLYhZfJkzvg4JrLTmBEcvQrn/yM59vgi/NOYopvAKufsKpqZFJ6TPv85bzcAqKTWWfa/s/DVRiYmkfKSlwoX0FnmFuHPpjU9hXNMawxazH78n+qB5DtJb1+EzonknpctCEISVQKWUtD7BkPu+TxYcQBEwwceS4H9xWsF7FdcU9Xtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6aL+eCHauVkPQcv5dPKCAX/vwrBXHYcy1F2J/JoyYaZ6TGqNJvLYDtcYgT3W?=
 =?us-ascii?Q?H9EhyFff1UZLkpiFgIGHe1sphdBOPb2mgSMA3i9CnVvAVSvI1PNI2pqViHB/?=
 =?us-ascii?Q?09n+906QyCD/EJs300xvjwBwg5C5BkOHZDWWCxIpFTHi3dmC4L20tgc9JnR3?=
 =?us-ascii?Q?128e7uFU8HHosRGtwpb9U/TalCaXXjM8D6CWZsQKsMRk/cd6gEh+3avvbzRr?=
 =?us-ascii?Q?EF3N70MtzkmuLpe4TJqEi28s+zxJOeNE7hJ7nMXK1wrw8rjcZF5mI1s8yBVK?=
 =?us-ascii?Q?blsIjfKxUHW1snRMScY/CkKUiSfqHARCHkbJ3VnubfXlUBNwAxWL1XxTkmVD?=
 =?us-ascii?Q?xHpU4kFZzWT9Xx0EFY1ZaF2jwvJMA0HOQ507XmmeYmi7p9s7EUrmnuoWqsxl?=
 =?us-ascii?Q?yvzeF5Q/EP7GJkHDuilM1hqVioDsXFNlc8oAXQPNdIjZIr44rC3QTnO59/Kv?=
 =?us-ascii?Q?nk8mP+ADYDaL970fM0sm9T7Fxpk7Zd3Ad7BPeNGs2sF9xo9yeKtvxV+acjM8?=
 =?us-ascii?Q?5+Y6IWZ5yTLXjPLs6fNY/GhnvaHO1zR5UNRhEPnNz6hAmljhLdVwHLWcJajA?=
 =?us-ascii?Q?Rm+Qr492O9fIg2Z/sPSCIXt8u3Ue81M7LS9FBdjXGldj9FsbV04d1S7LMPNS?=
 =?us-ascii?Q?8alZy1c6W2pA5ttj90FcZfKuQg9gzxEHEXRCHr7H/qL279usWgvPMmdqPVQU?=
 =?us-ascii?Q?1VZh5Y0eT8uXgOSy6UmDilw099sHDfMlZ632GA14fhvpF98ECy40IhUOdDMd?=
 =?us-ascii?Q?anFz/T2n/U1VSkXlOUWgELpKnHR9lsgbuv54cUCnsKOldFXd76LyF3OJvKQb?=
 =?us-ascii?Q?ninoI58exRH7a5jToxYDqSQoqkDMAgNjevcjEar3mwu3nDH7rPr88v7Pf2ET?=
 =?us-ascii?Q?UYW3jwZlxZRB0JuPjLnrbjlYuci6IswDE8Spf0EN2VLQLh4wRu5W9l2U152C?=
 =?us-ascii?Q?N/TR1Eq5zjr4kLzZAUhIL9tn3+9xEKNwXeVJQpEtI4RIQTYhmC0xeJkBrh0y?=
 =?us-ascii?Q?Qk3ldP4+gkbxW1yZ/wQNUSNMR7g8OlmOct46+XJitFvoqC37OaWo7MSqJUav?=
 =?us-ascii?Q?vxlrwJWPJdPPGHrElVPGIOEaiSSLaGenXAzm+xrd33Jt9tKS3DuDBVAlGlVI?=
 =?us-ascii?Q?05//EipeYhKk8d+3mAKu2maT3D+C70LkE7XinIDJNavxGZjp6cfT9Fk2/VuV?=
 =?us-ascii?Q?1Bbo1+0cIlFfvWalR8vu4qH7MIBNGZln5JhpFKz77Bx1WR4rl/amMhOBfkUC?=
 =?us-ascii?Q?MJxiO0p4JU/1EtXwNbC2/gCdbQwlH/5RZi3ySWLBoqX1yewWgDOht0xTy0NP?=
 =?us-ascii?Q?0y5UB05KSbzsLJtXpkqd7pfigekwsNB8ofkvYh4prYniVOm64EMo4urKQnaI?=
 =?us-ascii?Q?EUqfmZ1YqSe+eznfM1hpBu5ejaHaCmCFSSsjX0kVdbmYc7xhEEu3Y9MmR/l3?=
 =?us-ascii?Q?Lr3jdufyPGQ5QE1WhbmwAnyGAmMpEnqmPnwS9IOb3LpBcIRNZRTBP+vOWBDI?=
 =?us-ascii?Q?Z6xuN9owt7fIi+uSGKjz3WiK6y5cfJlkw5gsIFdahRb+xfyXge4mY4C45sia?=
 =?us-ascii?Q?6OQF5zKBMP3R2yaq/AIECjD3qwLyTeitogSl+or+kOtLsS0N0p/8/D+7sVUg?=
 =?us-ascii?Q?KruPas7jva7U4ftxqBYDQytZQmN6dKYDn4mC1OFmelBc5eRylQUdXNnKxlFw?=
 =?us-ascii?Q?2tULxaomxKoC9DSp7F4vsnON2gsOZ1yTxSWKnDAEgrBHWT3hbMgLd/4ky0Cq?=
 =?us-ascii?Q?dv5BRqf7ebvCKWnw+a2Q/2uGp1Z2mb94p+mFRnJd6wEgBI8uCg3r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26184ac7-62c6-4d4e-b6d6-08df15bccfd8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 19:41:19.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcfKPV8Ag6e5uichWyH6OUflspvSY64HnvDnfLwXFSYl8ZF5nnGKTQsyA/5yuQ12i9nRNj+DqW2VGpV5i4KbWTLqaDrhyFVMwGeBJDxujY5wQiwFOXCabhJyNeaUxeyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530

On Fri, Sep 18, 2026 at 10:59:50AM -0700, Rosen Penev wrote:
> Allow the BestComm DMA engine to be selected for PowerPC
> compile-test builds.
>
> The freescale ethernet and sound drivers now need a dependency on
> PPC_MPC52xx as they use headers/functions from that platform.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v2: keep it bestcomm only
>  drivers/dma/bestcomm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion1(-)
>
> diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
> index 5dd437295964..153b5492c93c 100644
> --- a/drivers/dma/bestcomm/Kconfig
> +++ b/drivers/dma/bestcomm/Kconfig
> @@ -5,7 +5,7 @@
>
>  config PPC_BESTCOMM
>  	tristate "Bestcomm DMA engine support"
> -	depends on PPC_MPC52xx
> +	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
>  	default n
>  	select PPC_LIB_RHEAP
>  	help
> --
> 2.55.0
>
