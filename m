Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794862053;
	b=5koqae7rls0oD2QdEtcwgACU1KVcvRCmmFCUr3CUowRyCCFSpFvS06yuPBF5UKZ8tYxx
	 4+u/nW4at3MUpaIvph57rMb/JyyojQWov28J3VxoXeX9RB/KAq+3LYy4VHh0KUBf9RBwF
	 wkI6s7QupzJ0qEJHrrQDk5alMnSxkQZ+dp+7m9MuwzNHUWwzrvSCYpZWlTM62EyFOBkAp
	 lBg8lM6ZY7e53X0c+KKmFAu6sYB4wS644DcETLKX0xQksu7p7TJ30JMc5CEI3C+pz00Ud
	 Czd8UMaX2IKaGffxq6koifoZzHH3VkouY/A6qQQCRVHdAySFa+d0lO+qfSJT9fdrjoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862053;
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
	bh=6r3zcdABF/6bVXYZsilaYdz3kHuOnMmADTwot0z1l1Y=;
	b=aauiqTONtmFwXXkdJUBjBF0fICs6Ce5YDtYggCejaEX782+MBq7PBzOIIo9gZT3Sg/dC
	 sct9YfQnpDxSPQHBGsHIhuYxKeXxAvAqNIZdmP9i02FerYwVhdWszjazl4BHo/fSmkcOO
	 QEqVxIWUdRAQawFCf5ydAQ/mT9tQX8rVLu8WTz5tNP2jHPDq80+4XGZNkV2sgbqlRkqdg
	 eC5gHQSsATX/MhhunMnNnd/45qv5BuQnMB//3bSyR2QDmKeXMIh+igZ6qeK5hipaMzQhk
	 T1uAj8p140lymxPLbn3G2obCdtwV4DweuO8nCJlZeajAa1E687cRBlhlmgTgEgP7Aqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AULpy265;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5209606A334;
	Mon, 16 Nov 2026 20:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5209606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AULpy265
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2lCQ8kLwUdMA7Z0NwfKxuN6qpqAhA9oOrE2aAHb7ZC/YQV0U58/AQO64aP5lzSjH6/CTQ+ychefXcvabmTsJ4eRAuhFinC8XbAgkrgOu2aD12/fpQgjbOLAfvUUoCYF4Rp0Uez2p9rdLfXq15Ap+P4Ln0Y/+Y9jHAXjEWukeJ6Vs182BUuC3romY3Cm7BPcELvKGi+AfSM+K5XZrDxgQmYrDV++wY31Ql6ftVYvkdrh2CnkJiaDZVxNVscRxQUJooDLh7mwc0yeRIJrsNNN9Q8SSTiDlqpnUFsYlztccQzJTztOlWug8bNBuz38FzUxRs7sdentkZcicDAry/f7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r3zcdABF/6bVXYZsilaYdz3kHuOnMmADTwot0z1l1Y=;
 b=nagLq178CJKvWCnwQEe6QmLVmm+Z0ucloe6qUGgglDdKRzP935+X7m/jDJnER7KoT8d6e6KoDCVbVr4YIeCMmMC3gUTfaxahNnn9sK8+yNlrwCaCnJU2pPyAQNvoeZsvbiOETelHnN0oIdMaohPxHTQXEjONS1ai2uGtt0BQ9e5Grbt3XsgDpgMiPW8HnLnr0lQ+PWM8EbIyDwu4NuGMxVBjpexxiANkFnu09/KmbA44jUzo2u1ptLVvnfK/LqzhRJ8MiSp2L1nCiH+wq1il4HHuj0T48tuC6ztEjgIBIndaiJy3Kng7UMLAcD3d3CmEsLUbwvr4nKAZ3eO9B+C+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6r3zcdABF/6bVXYZsilaYdz3kHuOnMmADTwot0z1l1Y=;
 b=AULpy265ql50RJbmBvVG56xDRezcnP4A04wkEPYpUWE4FTje0DxUT4APBuD3Zkhh04PHkVokw+NPDTRHAwQBV2qeHJaZ0T2H1ogNs1XmkBi03Tdc94Q9Abw/SgmOfaIsdFC8Isuz9k0XPk+LLe953zOQCVPVDYmVHisP2QZU2RxlonEtmvoV4nvluhPaoj+uUJGREvkKdhvP09Ctxg2PWqq9vUYw8WXVAjKt+P5EiJJHpusCSyucnyoL6iRiswbHwBtMuIz3rEx52u+ClbmGkQVl/ZM/SwCXJZZZzayBDr4l7IhCS/DcfPisnYDxyikvscv7vzJ80auZ+Eu/8FPJXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10859.eurprd04.prod.outlook.com (2603:10a6:800:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:47:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:47:30 +0000
Date: Mon, 16 Nov 2026 14:47:21 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
Message-ID: <avtr2cOQj2K3C65W@SMW015318>
References: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
X-ClientProxiedBy: PH5P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b03d722-59f6-42a9-8d60-08df4422d4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|22082099003|11063799006|10067099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261102123227099003|261021123027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	Ggj3QENNCyHoDud+MV3Bx67937DpxvzshuHG/lKE5jzgjnaJcmLHNl3U10ysvNzct4hhEHnmyuXl9Ehmz2Wi5GID45JZi/l7Zh2umpcroxQ4Cp9rPlGvCAY67SXL2jt309WmwR+x4sclubk/Js6JpgS/KsrPnlPtxD691el9qK6rQ5fR2A+LoriAZg8vUwAhwQFtR9tciy9wEB3Nzhn9pvXn3v6E30cm1wmhkLtfLfkoeyKLUwB9SxjsdirXQjRLXBJ7+h2s/M1XLGj3r+eQmunr4RlzGUwVbQ5tit9WftPG1XHOcHx8o5v7p2OJeTWAGjfOdSuGxJqR8UrE5GDmN9y+k9BvvZwierWrhhxeFgwd3ZZmFmyCxIIq2JGrgzk1BHbX4S1WfYmZRaN9KgFAm9ysWt3gLuOk1ROQNUkqUUrqwQT9QbgwL22k6O/pM/1FGJnsOeSklQhEeshYqn2Sy7rTLScoO2b5QSndOEO1t7sK0Jevv2rlqMUWwCexj7iPpeBC2SvHUnbIXaHhicyoaQCIeplDjhna/gQHD9ARYjkUNxju7ph7nH+Calkj5I8JdXIXCYzdPlygTpeX05vTe8fcmG8lF+b8uLEH7gIppoLDGg0Rl92dChY5uAQ20rdRpjFzjVPkTMkyG8nJfmqof0hQwqxfKUxdIF59oNT0nww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261021123027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x8PiNLD7hdM0kKJ9D2X8sL22qPvOKwM3ZWGCokwi8AAxe8NB5l7OdFqhvOFS?=
 =?us-ascii?Q?LqyuT+FrBOZkte2e5lvWjQll2wmOxrPH69pnoJbS6FTzICSoRlGJ3Gb69wac?=
 =?us-ascii?Q?Evd4MQ0UW5mfDBMcSsrh2Xy6LctpJcoBOA6thutZgk59RvsirwQcPs6rTOoJ?=
 =?us-ascii?Q?J92z0vUsgs+B/Ev/F58iDXWeeiQKoFIooNFS9dlyoLYe46rw+18J6fTXBNQb?=
 =?us-ascii?Q?dmU80rcVja/iTmiMLOJ+oNr4jcT9yMeN7Ep9kf0EzWLS2NS4p0v/6iTG46T8?=
 =?us-ascii?Q?GpZtra3N+Akc3J+TPBbghyANCBfI6cmrfXnPSYStcxjL5e0xhyDL6C15HiSn?=
 =?us-ascii?Q?paxvWnJKIaKQZavGOqZudJaua5CvRIpeHfuaatLD2ZPptcnSSjX2HxDwmfsg?=
 =?us-ascii?Q?mk4B9oWJXDgOBsWZoKeKE/5ec4fQCBjjMayVyncZX8oivimVpuNlCZdYPAtN?=
 =?us-ascii?Q?MuHeaeuzaxDAllzST0ruEZISXRk22CPVKL+eR45LMnphFTffH5Hm/1y7HPjY?=
 =?us-ascii?Q?knVE6CmzLZ3L1L821icskxxAqS/WyAnGTQQDmaijhQzcQWa2J3BfVxVb6His?=
 =?us-ascii?Q?969i5G5t2XoqB2qGJabomXWzfSRoN7Sz94JHDSuFkDe2OlgRcE5E04vMioCA?=
 =?us-ascii?Q?6adZpr2o+oG52yr9PFsHbq6wBS7/W33u+J1VQvMc7SzcbBkvPfrKNVxRc989?=
 =?us-ascii?Q?VCv10xFavs9PR1CfU1gb+jtJNwBEVvb0k/BNmkm8Ec4Z6QB9YSHyLHiHhV+b?=
 =?us-ascii?Q?A2QYrbXRrMYbENr3R7hCcHfVUeUI/3KHWbAkzbJNL3TR12KMMG8lyNXm1lHM?=
 =?us-ascii?Q?dOgjvCtQDaqxImPtML29OMjRFzbz6LlM+JqrcmHJG7E6ce2n+5cGIkpB2bpU?=
 =?us-ascii?Q?gws8NLrpU7tG3Qa9aqIWno+kG7J5FeFhpPyNxFoBJkThrhKeW1zG0xPRKKQj?=
 =?us-ascii?Q?W2IPcpcJCzsMHE96hQX11M624O1jpPMZB/OcvC2thh2gj/2xWmiapW/xqSwL?=
 =?us-ascii?Q?E/ojCLJgLGCdp7uaxnuZpHLlFmUyDxvkI5t7O9OSxjRsPmHTl0n2AvBNZVUO?=
 =?us-ascii?Q?+ZL322KTZFq+qkW8DmUfPqvY0QXUnxy0SZECS2cc/8EBIh3qAYbIOihieIZq?=
 =?us-ascii?Q?ZBU7+DlfI1cu9SllbhAQZv6MMyiriDtb67mxjge4rvaMJTicZAEdhDQoXk93?=
 =?us-ascii?Q?6HnRqmboX+F1G3h1m27oyM2acrHvPCPzXOJYADi9+YxwhfcEodDKogO5mBHI?=
 =?us-ascii?Q?C+C4+7SVfMaj2gfIvVPf9q0RzaVJppHtRin10HNZtoa5FTtI7i5Q6aaYHFjC?=
 =?us-ascii?Q?5B4sNDOp3RDHX/o5DRKFfGtwrZ0Bm+uUT/wXsK2Ixa2dNIpMB796+blkdNE+?=
 =?us-ascii?Q?q3egtYONMHGP4ZrBJCVgEOkiFJorHiDMxgF28KEkSFngzRmzPJ0ZPoOzdF1f?=
 =?us-ascii?Q?SahqVZ7e248eevB92q8OM+nScn2v1e8Gk5jxbggCDKjVOUW0+dlC0I7/8lNz?=
 =?us-ascii?Q?gWMfDFKqGJv2kguRnfECZizE2Es720A67+nyt9evGVn2EvMHz3Fmi77mkSf3?=
 =?us-ascii?Q?wgi6kOut3QkmmyUqa+KpsfekIS8Sk9YnXSvDUVP6x0SYVXkjz7Af3zIxVj5k?=
 =?us-ascii?Q?IJiupu7U4IqTWeTeeClpf5kpq+OGRnCGpx4FGPCNPHREc1UipXgjgeGd9fm2?=
 =?us-ascii?Q?ZIGlYB0N3obKP6/wNToZsUUV9oZvBB5iOvv1zxN//t8q+r23U4nOM4BFwoxn?=
 =?us-ascii?Q?UVwhzDGN6LhxLwO6+omDqkn68jmwGIfxD1FfHyBDyvp6CiPu3z9I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b03d722-59f6-42a9-8d60-08df4422d4d3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:47:30.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKp3nz1qzh1qfqIG9GhQvDO8rbM8HhDmOQTwABxy4P/rpcG31zaJeEsJ34GOeJRNTEYSwAhELPMi4MmVWubN6VFsEGFQBCIu3m/6sboRwd5i5PgheAUA5UBlqHjlISwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10859

On Fri, Nov 06, 2026 at 08:00:18PM -0500, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
>
> Note that this driver is configured in the Kconfig to be a tristate,
> the driver doesn't have suppress_bind_attrs set, and there is no __exit
> function defined. This change will add an __exit function that
> unregisters the platform driver.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/qcom/gpi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c41bfac65ddf..d6c76ce1846e 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2325,11 +2325,7 @@ static struct platform_driver gpi_driver = {
>  	},
>  };
>
> -static int __init gpi_init(void)
> -{
> -	return platform_driver_register(&gpi_driver);
> -}
> -subsys_initcall(gpi_init)
> +subsys_platform_driver(gpi_driver);
>
>  MODULE_DESCRIPTION("QCOM GPI DMA engine driver");
>  MODULE_LICENSE("GPL v2");
>
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261106-dma-gpi-subsys-594acc21c25b
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>
