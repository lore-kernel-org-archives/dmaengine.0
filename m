Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7DD4A8FF2;
	Wed,  2 Sep 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363243; cv=fail; b=mx+RiByyvLKQQpx/etE3s+Ygz3Y79/aQXasKbTcQEiTEKUKRaCrF5xj+3GLi1uJCiwdmz4c4Ool+rVjzL60hw24/4O2YiSQUDJk3Q/+TAqNPPwCQx7HnsQJxq8vK2k332vLxehHIAcdNJMbFccG/M75l/BV8rgxLdakLh8LLXl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363243; c=relaxed/simple;
	bh=eMreo2qr8HFRx/wBPfJ0tRfQfprov4YQaH74STFxL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PdKSknARuq6MkjAGFu+JYLxdUg6LYIRMGyXtSQKBbMXmDZZRQLmsiHPnFlq8SFuDAnzcRzptLZj7wVCAPCElhy80VgETZ4AUfuw8xxyMRRYaSeZRlDCuZUDCcBsDu83pi/1FTrlPm4/7C59iWHT8xijAU2k3QEWLiJwUS9Dgg7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=REZT5vNR; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="REZT5vNR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgtZRugFn8K9XCUIlWNb3vVHdDK+JvpZyzdGy/Ou8mfDw9FHrqJmHq3bBX1puLzrj74aIHLY1ql4pKW6X9BAzkZCJ98Iw6Mqwt8DBfD9AR9BycP9torU48gZThiHLZsaSOFP0OrVQwJ4GdtbU33J7tEsDcrKQ0fisry5ncGEm/bqmsc3RxwYl5ClswIlCrj0DRvibXxJ35/ExuoVkEd6Eyq+olzHKGsgf4EstMF7BTkAauFVYiKYf98k2UFCmEHGLSfJTRnk5v1kgZNJb3nY8TbYXGmlMuaW9ohPTHT1sIZYkgHFmCCDi8yH8g1IUFQIupaJw+7t4zoyTxSUP1zVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+yOWff4ArEtnPZNibxjSu9jrnq0X8Ik8Gwft7kZZbA=;
 b=CVzaSYhrSNQFm37Y5LO590JaW8xwsGLzmyMPRp3X6NIVtPwV7BIgp06/wQxBLTAbRX+n9k0hDzyMe1s3oArSQjF2Dgq6pm30i1W++83jxS5SMbKhJU5yH6GMwMwSduKJBBNs0mq4TObetxdyCYbvBv7qiylNrrAbChZfW2Szky5qigoB+Lh8ArB8B/LXbrasB9wmQ3FO/UidJfJPcVMIOn9maD1JqBgy0/G4besttXoKBaGXjbmU+i+FK+VB46w+Yz3vYJIlhgXJhEIumNdsvvGvJZ/OgFWNk99bENCFLCE1xTuzt8z2xOumcUq01B4peP/qF952vaKFHCEwsub8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+yOWff4ArEtnPZNibxjSu9jrnq0X8Ik8Gwft7kZZbA=;
 b=REZT5vNR6iiypbBGUwMHZg3ZlddUvlnZEd3IOYAhSzYU/P0lmwA7a9SBO3OIL5PRcPoJcCT1EYg67CmLFR/mFh4ps1th6LJSspYiWVnWFs81ZacmQtCtnsvxLbnKFKhPlcrnFMh9DeylIbzJ0cqfQF58CQH8kXVlh6E/OUzKBTgk0X+slBZXtqRRIM/bwS1OhgbPKY9sh45BEBEJfcLhV+5AtSB6gSijzref3MP1xx7uTewUm+x/XfkRWCvHrt4bPQyl7MBs+pxSpUcfJNe11hkRTt022hBykd98S/DvG8ZT4kVAnX8ohrKdBjYsl1CILK1m6Ad5r0JFs41e2v7Sfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:33:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:33:57 +0000
Date: Wed, 2 Sep 2026 11:33:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 13/34] dmaengine: mxs-dma: use dmaengine BH scheduling
Message-ID: <aphB3fjMQEISbfSt@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYXPR02CA0073.namprd02.prod.outlook.com
 (2603:10b6:930:ce::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec73705-a06d-4a15-0277-08df09079a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|19092799006|366016|6133799003|56012099006|5023799004|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ycW19kiGiDR6Pe0rRoHb7eBUwX8VzVQLpVmmIQA0sebzUy6WWzyf8LcVMSqHZLYf6eyrle8Ug+vhel6W7axPrpZAtDYMB/J1YrjkP++8vBcbJMIwqV7MNNCHMRm5iM+MRbvXe13Jsulrl9igB7gB9AGPSFADQTwFw++YZin2icgKXKTYzldPXeeLX8kOj+3zGhWQvSekCepjbCoteqcAFJT9xwkX8XBcsQ3wAPSc+BHc1iLE8ykqR36+MXrSviahojBH/wX5bCJEuMdDkNxoMlH31wDENFsvcjRgoVCaWWOc61F+YTWqxaWacQr5ORAKB8rPjUkW2eTfk3bplCcEjWRxBynG41jlXR9Rw85lh3cRizjwqiWFaXRQXnEvlSlWni/xEDrS5jwkRCjQG2RPBZEQs7GQ0yp9zcGJ7P/lwYCIcllgtLlenXha7/TtgHsNAMry64k9ExAiq36pey9v7j9NsUp1NvaeUkF1U5n7nIMBUipf9qsPwRDq7mqQ3fjANu4ZA3MTVsI2BEE6E3SLzU+Ww+uvCmlAIAV+EakOJ6RGntkYXmW0mKM+O6pqFA5tXC8piBlsHqXYk7TFdjgkFcQ4xFgijDAGrMuKhlehnn6RzPcdOeiLhBYam1pn27QHDPK+oHjl5jU2imZo8K7sGszzYzekbZ3WbS71c18WQCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(19092799006)(366016)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GJbtXubj7y44sRfa4/h4yN70DY+ACU1GUUfPXmSP4v6aS2MJ5wBJg9YjSwsH?=
 =?us-ascii?Q?3YmCLLUNG9ATaVYRXxNxbb4bZcN649BiEL+8VfHON8ls/DUj3E3lPJplWVpk?=
 =?us-ascii?Q?CwgcpbMVPOa/MCYCa+uo+5l4hGmsMtVWCtWWdPDZ5gy+KyN2wBRd8NZQI7AI?=
 =?us-ascii?Q?DkS4LyyqKMJgcdCpvGUG6L7ql9JigcTKfJigDxCK1WU2luYhV4Yl5G/tO3kf?=
 =?us-ascii?Q?lRoFO7gN6Sp9kX2+ifRqA7OSGC3cXxBUZnsqmMX2/pKMJGk9PvopX0gYIBfg?=
 =?us-ascii?Q?LbfNo+kej97fKvKmqDrrAmzPpb8bQkTZz24lrq7XgeOtDysZX5i9v5bxpGLc?=
 =?us-ascii?Q?qIrC8goQpGjJmK2jxfEWZS1h9kn1VqVnHJV1nz0lNRMUnzX57IV/0kL7sNi6?=
 =?us-ascii?Q?4cnvYcUjAU+hzex6XEq4O1Or5dXByIOX1o/10+lkNKo7w+7SY3L+LYsTGuhZ?=
 =?us-ascii?Q?Lm4QqEVV6ze1KJ5nZCgGuL6oohZqw/1ivfhtEpDvshU/W4qTT3bKBfdAxE0q?=
 =?us-ascii?Q?8a603CtFX5SmB0lH4Y+NJP79fvLTahGASsYnVCWrjKBbKR34vymSILRke4kn?=
 =?us-ascii?Q?Pb3WTOAznjxwVZOpFEXjmCGZIpTW8EsJ266UPo7yuDp1ZWGUWM0/I3VaYX0c?=
 =?us-ascii?Q?Z+YEWucZQt2hzEJ5dedqs9jkh7q37WvipP5XUxWACvzQjnpw70MpvdGKtDdM?=
 =?us-ascii?Q?uZUeFsHQ1X/Y4IeuYHwG69u1fM0l7hwAy3tS1PMWpdUON2nilomyHRlcN/6x?=
 =?us-ascii?Q?4fjR/ozB0scsO1n4/hPtbvSepYB45ZFfdTlR//uvsf4W8EsdfMVJInYOasP/?=
 =?us-ascii?Q?t8W0ytGElgDG0A+FCrUxxReVPgd+XQuRr5k5zozscAYWFILfbMOf5I9Kz0mG?=
 =?us-ascii?Q?hkqFVdXSX4SmnoNwCbTHRroZcI68309khxVfzVhFMJQn29Mdw5agvd+HqDXe?=
 =?us-ascii?Q?9OPywmO+c79kUknx8XVvTNDq+S2pnbJv5gHphR+k+RxIfmLSlXok5lcAu2Ky?=
 =?us-ascii?Q?4BoqWz51nrKyO/i1Rr4KWDK1vUkP72mUVpk8CnWSZ19iRrkUqGYRCY1yEt9c?=
 =?us-ascii?Q?1PT0pdfPpzEo7ESNhPXelPsXtCZ4rMYoPnzXL8HGbEzIlhXNv4PBdMJ9/m5G?=
 =?us-ascii?Q?luKb3NW5gpUNg1WcJhEGONDQ/VFugeeJRtgt7bUIiCK7P0zPib2hS9AejaKJ?=
 =?us-ascii?Q?/ssjhkbrn3os7i63XY/HQtgIufsWoE6IcdtxMLSp9buyPJcEsCc7C5Dm1m9Z?=
 =?us-ascii?Q?Jun2XjiRVXygBfeWu7/uiniRnNedGD73F8GOAqj7slIL+8aT9upRKls+M7hZ?=
 =?us-ascii?Q?N2jAZXiO1yMgWmxMRQzSv6rIQCiDxgT7sjZDFMGeWvL7lhKXxxocM2OQXp8g?=
 =?us-ascii?Q?GA1j28Jwcmys13Fgj2VaXfc1YON3Bij16YMDLRwHBqPp4UTlKAPueQ/m+QSj?=
 =?us-ascii?Q?Y344uEmo8AfYgHbM5ZlrUTmicIVfsOjz0prkERgbOjW7HTUL93WHw+cCF77H?=
 =?us-ascii?Q?kBgJ4mMZET4HspMVwq9BllCkjqai5fhJeVrWZMcsj0X2ztgHd+E7vfp59o2u?=
 =?us-ascii?Q?e5rG/y21gpC/DTLkxb9Jwppo9IYr6M+qtjR1GVmrFfatmGJFd6KGCCvuI7kf?=
 =?us-ascii?Q?7Tl/XIAGHlHWDJAMSJKny16+MXR+9gZR7/lQpSNIdte6ss6+e+3BZst8tJeq?=
 =?us-ascii?Q?tLSNAHmQJK7j1/9PcpgeM3GZtMv+3vqXLm6VTcoxRl472oi6/OBbG1NMDle0?=
 =?us-ascii?Q?1KNAv5bRABfKzVT6Wim58PcPDmoXVpK7pzNs4I2QlvM9gMVzAW1W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec73705-a06d-4a15-0277-08df09079a6a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:33:57.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US8lvfSUaDaL+TtIs0ppitorPHNA2w41tAx4r1qLuztH98BwU+xQweCcej76NKEmZT3sbzDV45wR6iDCTOCB556/RQHb0y+1GgHrXxjp5dK9wHS7F/p2Llh9uGMYC51N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On Mon, Aug 10, 2026 at 11:09:14AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mxs-dma.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 7acb3d29dad3..149ac402f7b4 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -109,7 +109,6 @@ struct mxs_dma_chan {
>  	struct mxs_dma_engine		*mxs_dma;
>  	struct dma_chan			chan;
>  	struct dma_async_tx_descriptor	desc;
> -	struct tasklet_struct		tasklet;
>  	unsigned int			chan_irq;
>  	struct mxs_dma_ccw		*ccw;
>  	dma_addr_t			ccw_phys;
> @@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
>  	return dma_cookie_assign(tx);
>  }
>
> -static void mxs_dma_tasklet(struct tasklet_struct *t)
> +static void mxs_dma_tasklet(struct dma_chan *chan)
>  {
> -	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
> +	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
>
>  	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
>  }
> @@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
>  		dma_cookie_complete(&mxs_chan->desc);
>  	}
>
> -	/* schedule tasklet on this channel */
> -	tasklet_schedule(&mxs_chan->tasklet);
> +	/* schedule BH on this channel */
> +	dmaengine_schedule_bh(&mxs_chan->chan);
>
>  	return IRQ_HANDLED;
>  }
> @@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
>  		mxs_chan->chan.device = &mxs_dma->dma_device;
>  		dma_cookie_init(&mxs_chan->chan);
>
> -		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
> +		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
>
>
>  		/* Add the channel to mxs_chan list */
> --
> 2.43.0
>
