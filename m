Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793117106;
	b=Fu0Z88eFqCSz/HnGnOrl5xaIhCCpYirbT2vEYduLcg73x2KeQVzN+7IUQKclFAuvx1V7
	 2ck1ih97GSGTj4KatqYXELsncoYl+3kflay2TC5lz97lYj3P0h7huVLWUfaZrgSTZIMFe
	 9fm7+88GcY4Lzj4ZEDMvsKycvuekGyRYePGRYyb3rFCNtQcx5njSxZbJiQ4vh9sz9MdmL
	 +0DrNN6zk7PadFWfm403asw10BcePYX1cvvf6B+ZKmC4so+1ONmuCSQMn4LzqKjBSTJ1I
	 hTSRuE1Cp/VLVl1/j5bZFLE1Q3edcbHjuSj351nQlGuiky3fVivWdptUp0mp5qn+9hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117106;
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
	bh=jwA5REU7xQvOXAObWGwePHxAAZzqPi47DoWyXGuisMo=;
	b=C2mSyZ5o8hPpFgxfcSMKDN66LX/f72QWhb7UtM1fISgU/OZqGWs+ch4G/SJnUTMwCB1q
	 0MdlHS8buhVpgZd4qH+gYL6+Oef9VvfZUFYnZT0AjEiaZo78j0Fda6MaaUgFzhpttSkfK
	 5AlOeRLvIGrRqarHkapOKm9BGDw3Civlr3u1S1QmwAvd9JC3zCp3UAVaqezoCJABklIcv
	 whCyGRgWxe7huqJjdZ0qejV1qwIY9ZqV+BTVGsDnXaOCfBhF6/zsRmgzMTri4JKkRpFJY
	 sGG+GxIVXR7/BYRjiY6C9wMpCxwBhFjMECQ1+eqo+J63g95WxRpiYe5351ZV+ycymOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rpZH2j9d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.21
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFFB60A381C;
	Tue, 27 Oct 2026 16:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFFB60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rpZH2j9d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7PpzP8HGKw2NZreIlmlgbmTew4hpT8XAjfKMRg+s1fRNJGbPZzn8JQiYbQR+49shpB0D08Ztf67Cbt/bhpFlbDmkswt84Jrf1d8WN1mkLfEjk3IfAl7V1jDbfclr56+K//nDtasNKDu1QSFbzn6SraIDCevF0aeSCh3XYuDcW7Q120Pa3m0Bs86rTOULcH2s9EDE5rK4dWktYNSrCXH135Gp55tiPNbeqB65rS8KzeH48fsFbO6bjpG+Wf50kr1euOLif6Ftk9TVVsu+dxXB1mWyKJuACrfT0GfEY9JiHjG6PaRb+7xYNJOOrfdZYqHK6SmHa6n9A7XTOVg9JgF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwA5REU7xQvOXAObWGwePHxAAZzqPi47DoWyXGuisMo=;
 b=omYF87Q8Bek9xbSnKVySAswqNEoiOOUxa4GRJ3ZPr+NrK+ofmFGX2CLpgT+rnMARf4cKXWTgfOEiMMr0mcnYiuAw7oCBQa6A3ll0v7UwC50y32EVDeCNXy114ToizumxYE6CH0Nv4Bcok991970de9SXaVQXaDGtqxkg4pBVLD6KRoVQpGfIuEmdTr+McNYmnJ9TzWhmJ+VaFUkpZp43JWqt/AIQGbjjs15swgIGu6Zase41oW+sx1SmVIOKkoI1hHBUOU2IKpJPDux0/YFJCc4/O+brKXbzY8xrexzC7TxZm2f0H/tcOclbXmrTmxSAejhnJgAP2+06/OvuScG0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwA5REU7xQvOXAObWGwePHxAAZzqPi47DoWyXGuisMo=;
 b=rpZH2j9d/abg/8dKKyqCUbIc+VgNjQ5cIbGCD/Z7a9fTNonhIRfRTP8li86QYc5X5ptwYNKG6045Pk9UwEOj5Eh4O5OeZgn8hQEOohn9oVdgS6ykCMw3rc4uWSNsFHco95ESALXNLH7jqc7IY6ZxHyg86KbiRm3XcTZESafdgPy1plK7rGMT46aoo38c33aR2muuHYAT9lfKWhd0CXxv9p1OE/UHTmLngnSfmsUzWe+RtGz8PWSJCp4Yrm3J/o0Mnjuqs38QD62f8y99prUH33Jk26u98i1/m30QHiSMRYUOtzgS0uUvVVYDebMLG9v3brAVa2naybtW/zibS9sZjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB11524.eurprd04.prod.outlook.com (2603:10a6:150:288::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:05:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:04:59 +0000
Date: Tue, 27 Oct 2026 12:04:53 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: mv_xor: protect MBUS window access with a
 spinlock
Message-ID: <auDLpSHB-yeQsRMH@lizhi-Precision-Tower-5810>
References: <20261020214418.1525032-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020214418.1525032-1-rosenp@gmail.com>
X-ClientProxiedBy: DS1PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:8:457::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB11524:EE_
X-MS-Office365-Filtering-Correlation-Id: f01ca78c-4203-4bdf-678d-08df34440d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|261026140227099003|11063799006|5023799004|56012099006|261026121527099003|261021121427099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YqBEX84YKrVXZGH2e+jh8fCJJssBkpNCkHs7DFi2CTREd/bVGMO8xRXKnXnUpY0nXXMRvgmVthxmyxYoOAC7ybksSzHb2c6dWXXCt0yROWYOZO+NlWCjawIr2ggaWnu4GR2gjdJcRRSAO+9DiWOWtb6vKaigJNWT8C7qLstuRewLL+0sNKaldJgCHGh49LKuVAlz9AU+eyNLUfilnjEK82A9DlZ5wdhvm9/mHl5gCi7dyuKW4zT0A/YEbLVF/ku6f44XDggKkQCl0LqGNoRVVX+uMHrgkuHvf/E3JHxgT7PlxhdTKKVMM/admOo8mwSwMvzuJ+Ocf5WEfmwubXz3Wp1lbyUlnIHMA/y3iXXnVP8uG0yyfuAXfIyipLp3cKGcJK8BqBpN1NXWjmN8vJRFy6aZ+ZZ01DiPI8UIetxmhz8g/TbVoDRRtWdfFpaTX+nOOqMPR76nn5Smthj3ztM6ejYTC9iuQ+D4H3bLPrSr/x+AO0VpYxC2PqPjOAPAeA0MVOBsfwYslpHmowVV0rwNQ9KnzVPH2lqJkHDLjqKjy6B0fgZFUgmLyfIzOYVCNfmPDfEoHI4t6gmQ9DCvzj8p2i5s9nBWMi6aAx6ceU+HMqfcsIEHtooCau28y+/75d4X3ozmpuBNVmLX3T0/GhyFwf2ahNC1B+z0zDe4ixXxOis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(261026140227099003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLXYZuvPdh7lNfQoQihhYPHBY/UTHSVdFaqmEly7IF19inLcuEooawpgyGcZ?=
 =?us-ascii?Q?PAz/nKORvNfzDczGLVPHFu93Qgl7Hw2qGZv5l8NDE4Js0op2CBXuHFFGRXJ4?=
 =?us-ascii?Q?zOQdIgBeHTrT2j3aVR7o+mEDTJmDVsnEmjIAyhwVu1belXLEfe7NPbPX0SGx?=
 =?us-ascii?Q?fOjjCCv9cwG9n97GG1Ajh+uCGyObpwecmsrCrcXeq/UpXM0bsVV5S/j65JKk?=
 =?us-ascii?Q?T3S0WL1W2GuO0sAtnnOv9iyAu4TcqkbRnGzK7mUwCLysa4opIs/o2HhcP8xj?=
 =?us-ascii?Q?EjP0uTprqkxKdw+m46ezx2DVMpoS8INSxzJ8/4bMUtL7WfQ+xlggUCrrBw/8?=
 =?us-ascii?Q?qKwAdE8aiwe40Snno47skVNt97RxwDPlfEQcvw6HdjmpjDogMLHjcSNZkd5r?=
 =?us-ascii?Q?ecCx7GMIWI8Usw9Qt1g2fqI8y278jDAS6PSz4YRVhEeqs3aFuZajMkYgDEhB?=
 =?us-ascii?Q?VdKctM5Jsdue8ePsW4qSD93QwqHEwIpLrG2rmJl2D8pCq/tMR7XXn5Q0pJP7?=
 =?us-ascii?Q?4gkmy7F8PYOzhLLDl9tDE1besaY1zX97Bth3QsodxPpqiEWStdteZx2ghL17?=
 =?us-ascii?Q?FtgkGc4WpzGOkEPA07wY/lOA3iAi88itW38G2v/5Rw0QZMeOUDiIKlRXvpI2?=
 =?us-ascii?Q?2/jWOSrAgO3YOSy35LS9JJRfhNcKAuwo+CqM1xS1C8OCNvdwZvdXHgBwTs5f?=
 =?us-ascii?Q?ePIIdRvKRs6piKc/j9Wso3qFv7xptiTja7DMDiMfC6sAOAusLZ0HuOBZpYxM?=
 =?us-ascii?Q?AkvLi/1HnZQBX+WRXr0KJPQ9Udnu/fPh9P/QWh1JFXFhWMfM/jOzUAdLMate?=
 =?us-ascii?Q?b1ydP+PfTXZjYxvXNrkxy2GUqLFApWhXrOKMGTqye+KdgtCgKBebzp0TC6Sf?=
 =?us-ascii?Q?KZDHGZo0BdCCdOz+5RntEepjauyu0zbPkKOG6vb9dvFJzD9mCyJEto/rHoNf?=
 =?us-ascii?Q?j1n+9tcjAfufpLjfA3LnOiYNfbPFsDUSdbe3tVk+4DO7cJMDKSVy005QzHRi?=
 =?us-ascii?Q?cyidHO2MFLwEBukp2IodWNSNBeR2NbEUrAbi7iVYKJHUtKcsnuM2ci4WAwNK?=
 =?us-ascii?Q?ZT+euXf/cSgOWsjsPvz5iyeRc3jVpr5f/moOasqj/tIJkuU8XHS+dj8JObsg?=
 =?us-ascii?Q?buBAPfAxdzncb2t/mMuHMDlA+10n4IfeLce28GWjIX5kh7m+OrCk5ePUGdXF?=
 =?us-ascii?Q?vWGQ1D4zHk0x3MsbKQgRJyjYUwsZ+HTDalvOyOMXZXy50Y+LOApyawvJI0rO?=
 =?us-ascii?Q?M81oiD05RN0yZWa3Nh6zpgshR0+y8HeC/1jevCVzPiU3FyFNwaxvPHB7alue?=
 =?us-ascii?Q?ldM3sOvY38iWb/HsQyx02RwpgG+8dRQhmS2je2ew9aSQB33OaKBKiIwCxQIK?=
 =?us-ascii?Q?cChUXxUMo7QrX9ZDN7WKD2fkmYT5R/f12twXSvNUKQXfvkE1wIinfCgqLcA+?=
 =?us-ascii?Q?BKXja9zqoxOH8CTiUZBwbDmFqU0SG79BSxVqBN96/4muYoY1oLGM2tZ/73dd?=
 =?us-ascii?Q?acrqbukH64P0l6EKOQjowpvzx4tEEy5G/13FcGU5w3ZliqB+xjQoycTrvx8T?=
 =?us-ascii?Q?Swgx5pcmXXfphCOmBQGMiYk4899aJZynJfv2py3H60Kbd5cfABlHOB3i720j?=
 =?us-ascii?Q?CIyGhRTUOhHt+6Okcot8eUgGi9xI59y+tiNr0Sr7zQxrljSREZ76uzg3LYHI?=
 =?us-ascii?Q?XaMbPj/Hp7hJueTpNZd7AHHlNAyI6EhnCaavz96qj10Sy+4rgDKMK2AGJHxC?=
 =?us-ascii?Q?i+sBtQDagKsjYNKiEFtdBH8Ub4GEnj7GQhNrpgB+6yEFdEXQrczi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01ca78c-4203-4bdf-678d-08df34440d44
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:04:59.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbpNREYfPE92eJwuYZQEmGn1JROSTdEYXpCPVMtbO+5CNclSlgxL2DfopqqLtHVxQSRRrMIop00qpB+8FW9SkBRbX/9AQBIIVMjv5936e4pGeq3pZIlFHz9bHceIFctN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11524

On Tue, Oct 20, 2026 at 02:44:18PM -0700, Rosen Penev wrote:
> mv_xor_add_io_win() reads and writes shared MBUS window registers
> and updates the shared win_start/win_end arrays in mv_xor_device.
> Multiple DMA channels can call this function concurrently via
> mv_xor_prep_dma_xor(), leading to races where two threads can
> select the same free window slot, corrupt the registers, or produce
> inconsistent cached state.
>
> Add a spinlock to struct mv_xor_device and hold it across the
> register read-modify-write and cache update in mv_xor_add_io_win().
>
> Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v3: add comment to satisfy checkpatch.pl
>  v2: use guard()
>  drivers/dma/mv_xor.c | 3 +++
>  drivers/dma/mv_xor.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index c4e0dce3ca64..da8eea8789ae 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -494,6 +494,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>  	if (xordev->xor_type == XOR_ARMADA_37XX)
>  		return 0;
>
> +	guard(spinlock_irqsave)(&xordev->win_lock);
> +
>  	/*
>  	 * Loop over the cached windows to check, if the requested area
>  	 * is already mapped. If this the case, nothing needs to be done
> @@ -1345,6 +1347,7 @@ static int mv_xor_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, xordev);
>
> +	spin_lock_init(&xordev->win_lock);
>
>  	/*
>  	 * We need to know which type of XOR device we use before
> diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> index c87cefd38a07..36c1fde6dfea 100644
> --- a/drivers/dma/mv_xor.h
> +++ b/drivers/dma/mv_xor.h
> @@ -80,6 +80,7 @@ struct mv_xor_device {
>  	struct clk	     *clk;
>  	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
>  	int		     xor_type;
> +	spinlock_t	     win_lock; /* protects the MBUS window regs and win_start/win_end */
>
>  	u32                  win_start[WINDOW_COUNT];
>  	u32                  win_end[WINDOW_COUNT];
> --
> 2.56.0
>
