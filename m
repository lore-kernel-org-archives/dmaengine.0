Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5004052B5
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751214; cv=fail; b=RE4KOYhe8vkGWBHYzzX6jIR+VPW2YbYLftN24a40Mt5CllhnXhXbc5MjhX5/gZ5HZMLTIkfQmRLu7tMjpU0/o+qnIbPrx0ACKGChdRzRDuhiAIyoeIxkADbt9reWFAv4FtEhv+l2anLR2sMlPpMTJ20ZENpDwckukNRQ0b3sNW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751214; c=relaxed/simple;
	bh=fFH9b93Xapxr4jyLUoQBw28scz0V3aXqPIT162B/tzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lwJNFyF87pvHEGL+3eJ8k9TR+n3BzjgpYjIPoZs2Tinxp2kBTqTKZHBTeL4JOlKMkfYLPKBWqRZErbGDM+c2W2hTI7dwGV7qptfg7/2xzLj10Ao93/I6o7TFxIxY55zqjpQ9yS/8FjpNA/4KtBUidjhFzFG6NS8Hl3ibiQQn8t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KhTQVN/r; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KhTQVN/r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1fenO8k4gvK9Hd3e5QUW+di5cde3Up1NqO8v89kxFbXcL4llDBsL/MipKsMwmiSnzMYodgYDILp0xgmFSzlZs+72VdcqeZogsKmuyvhpJFabbKWHhg2xbsZMIAolOGWQbCf30VYXnN7F6J4Yr82kCzDW87pHa8XcnCAgl/Pdw7B/hv6T1rB6aH9tqq0dhtI7ZbHfOCIoUTYu1MXkdrikw26Ak4B83g/9YyyBsik13mFePFOexrDjio5YVoTtZ+iQ9HVFxY3Vlfj7awFFAX67E4tU9OySYu5xAlXHAWAIErUatz8kUh6WSSjmtq1oTYUHsMg/eyM+sjVwUMoUFYkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaZWQ96sH7WU+0qi9XVcDYI9g1/BtPZBq+VOdg3Rixg=;
 b=XFmKbeinb6wXdfzep1iUy3dHQbhn4iyGLNaABTl6GXJyYZWQHBdFh9lO2aQA2aftcPkyOk5vN4THWazbXSwT8GasyhZ9aKsg96UWuXHcsdRBz0HktU+woFjpgDW4wDorCtXnFgCLRg3oU5qKWiyc83pitUHwj/vgib5e47VK5H17jNFGzK96/qdtf/BvySzXgf1TmDDsI4CUVdL2nWlOmDblyniNrRnmHEEvP/oLIIHX/Kff4AUs/AHT0XtUh2uMTmzUR4Ihzq8qetT121NGP1XrO/uUkYVMqDQptiwNIP2Q1U/sYGmrNq+NkGSrwLvFLm+okbbCwfIdvkMUwGD6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaZWQ96sH7WU+0qi9XVcDYI9g1/BtPZBq+VOdg3Rixg=;
 b=KhTQVN/rqM1BPgfL47FTQ5OGqVzf48w0kOkwdlhisnQXrO5DLgxz0K/ZY8iN1n5R/ubOzP2Lbxh05KAoKa12Y9q1yrg0VcyjP/7megr0v8uFaKzT2Xd9+Cnjj/Uc3rNWiE/3YjriGLoCdJH4RbowQ/hbiRfN5Mop+oYg81IJdPGQnYVcYg8gdbCFC167+PmcOKzpaGLJ1HEkaYVcsf9F1koSihu/JTOu/5mJVWrAmgwmFKv9IkUss2ytQHsFGsYWzQF9TjwXHEfZcA/zDUwFLwppMTU9w0Ic7jnhAw5dEFtpI6cwVeUaNeXhjU6RoQ1hM4dJK+cvQGFO1ZFxdwjjuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 17:06:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 17:06:49 +0000
Date: Fri, 18 Sep 2026 12:06:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: loongson: Use %p for pointer formatting
Message-ID: <aq1voagTv1oJ8FaA@SMW015318>
References: <20260918103409.UV4g2ON7@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918103409.UV4g2ON7@linutronix.de>
X-ClientProxiedBy: PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bda8e62-add9-4b32-ab39-08df15a73a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ms0DMqzMzsN6G5zO1Zu5IeYZp+9n3CDkCq5KEY2uN386o+KiGBjZfsM11yCta14SvucOHa9LjvbY1qWOGQ445A7P0W2HKZ1J7AZ4/JXFECvCoIBwsGwggaITbS2/NzMEWeHSPWAwRI43rqaDgqVR9fkiR6MdEP9+RJHwtjF/cMLBhxKTiDLHOum3q/3U6lhMZtA4aEj4C0oVKmFP+qrqveFhsK58VwROANR+cioFwoeNgIdBYq8mWXCYSAsuLfD/PcI3E/Zz7s/G1oNP7rrPi6xuqffwI17f2pwh6DsNSCqvKzPwUNipOB42Si8TioAzATeFfpwmWvO0BPTcU6Xvy9qfSbgzZkFwgholkSRgu2aG83vJ5cea8EFwj319t9VOYg/0V5Bf1ubdG+HB8QX6V5kL7x39J51AddPBXEDgkhPI9Wsba5UX6tpVp84QesLxRK2xlVA4qaJiojP2IuGkYeaiZg86fLI10COI1/W4+XIC7E0fZ6MZ7XbVf4jCsQ0bQEk+0upo43vAGbzmNTzbHR1on4wLnkV+lsfnLU6TFmMdJG5eMK3+oWK7m6EEF/vc+dkPTEDonLQsOE68kH0UJYGph4I5TTQkzaxCgyHuEKRCnATGZWqAXS/TqW0IGV3GYKzMLOZc5o6v9CzxU6TUqL5paQv56wdjaGNqrZF62bk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WO+4XVxYFKlErCXnN72jkOeGgs46akS3q87SBeG6BimNLV9DmW71qg/8LuA?=
 =?us-ascii?Q?I7pkRG+MVOG0o15ae1fkUsUMhkKNLAyr58vAx6bSF0TwGRg48iIuv0PZ89LZ?=
 =?us-ascii?Q?OcBXEgHQgUXGCC6CkYQa23+HdVYR8fHxQSZh2ru4xyl7Py242SXmpNyk7tl4?=
 =?us-ascii?Q?EOs5lwntBak+jwTesr1gaRKa35ZKpRDaWaC/pdawlJt37HAsRQmtnAWlNmsb?=
 =?us-ascii?Q?b2IQdzts4YAS/wYw/0M4mo0Y34pAr4Qx6OPp4ptkVTxFBYCnI6ejrxP2yFIH?=
 =?us-ascii?Q?MJD1zWSFKaOnFhxdA0otMINEwYmo0CwyLcCyJF+nAy8MGmwPfZjD0neOSXhw?=
 =?us-ascii?Q?8ghyukLWwN3kR1vZwROPW6qJMEzNWhp3dIZ5AvcMdvM2b8MjUMkBodMV3quA?=
 =?us-ascii?Q?LxtvANh6BoptzALb4f1HyWvi9QYSdwjllKGdw6hEreqPSFV+yyinbVXAmmXg?=
 =?us-ascii?Q?YWPPg5mpdkOs2lAbHfSNg3s0fV/i+tksohls3229YojFlfLcVNTPRkO7jhUA?=
 =?us-ascii?Q?a+E1XGWxcEfx1wnhqudmHOoKAJKFo+91nWSdINIAC35pI4MOAdCNAoVMogBc?=
 =?us-ascii?Q?mPoVpDoKMY6TRiV6u21IxgFv6gFph8lTTCEqBpuFODbRLBu4oOfifed/n8U9?=
 =?us-ascii?Q?PC9bqZdCtYF5ypGT6+Ir4h/rfmWk87g2Aj+rjx1wbES47DtHjcb15hbMt03y?=
 =?us-ascii?Q?nsds+D/5XLvXAELbciUhoOShP+9tW/x403tXqnYxVLi9kUJ9w5F23/cMgowl?=
 =?us-ascii?Q?tMoB7DVTBegzLrp5mZB30gPI7/9penCObxXpXy1vXCYBvCKXeCfRp3N8JHOy?=
 =?us-ascii?Q?we5lXq6rLZeVmqWrHt/75G2C7mEUe2cz2RzaPARNR8Yvos9A4vOYnjXHEHyx?=
 =?us-ascii?Q?Cfn1GNei3dpAqUR+bpIqiPDC35408DGKZXGn8prHa5NIgh7I+mt71j5nwRpP?=
 =?us-ascii?Q?4qY34Q7b3ykc8xKFtR2S/GLv0f1aqecqp2svmPZfQqCNHZ2uo/p7LMuBRtZQ?=
 =?us-ascii?Q?Azb+zEYuDr8+ddQZagFgDHHTmfzsRh7GPeBLdXEWPMxqcuiUKluqJ+IGNtLp?=
 =?us-ascii?Q?TXiEW2WynYpBJtE3w8nqF83sgEK6AplQH0Rk6McRaTs/ikuFJ1KGXikiEDDy?=
 =?us-ascii?Q?gGEWpYrTRpN4BEHgaCDPVPuoy2t56/c/L4oYYr4FS1n5bZQGiyr4zgDnEj8k?=
 =?us-ascii?Q?QkPdxZDrDVhZ5IZWIx9H/BroGvsa9CzbIZcgKCMbZxVPP6ZZmg03YMyVGmVh?=
 =?us-ascii?Q?wn+1HvQPT72JwOtdT3WfE039fc9gIIs+7jtzRSuuSa9TZbQ4LYJh/UUeWfA7?=
 =?us-ascii?Q?ZXsNhIhuWahTa3L8F5CSH/JhGF5rUaCw8anKAheE/Hw/vihrDKkdi4hd5qO/?=
 =?us-ascii?Q?bMawwXYzsM7+EksLohJsdQWiy9Qd81TtExon2YA88CDaADlXV0Kd0CUUqdTL?=
 =?us-ascii?Q?xIz+cD4vPkLgqRaMlsgRLA7pPvMfkzPEBWPLbHVlQ/DRZbR7fO1Pe8S3i5cO?=
 =?us-ascii?Q?U6KXbc/vfB92Chebauv7P0Wlr/HPNOKT0KkqGJIMDrWTC99LNvZD5PQjvKlN?=
 =?us-ascii?Q?J+hZeGa+ssHoe3dDAF1RgkXCCi7daMrQVHPkZIzIeu0IlEYBFRfqjpqAvkRU?=
 =?us-ascii?Q?567iOUGR8lY18Au9PW/aHnDHw0HWDgqFJsTEfP6dXzOPEgsYuw93nyPaOOpt?=
 =?us-ascii?Q?I5goN20lPEb/S0QZBFWdw9ZBawDLUEjQPcUR5EQbhV0Z6Sc+dLVB2YzWyPHn?=
 =?us-ascii?Q?U+BloV6AW91IuiOL7HEnAZlGMMIPy/nz41PGd/xNX2O8NreLWpDN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bda8e62-add9-4b32-ab39-08df15a73a34
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:06:49.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZ82TU1ehivnidMMwQBBY+E4RkvCHukvwl+zJa84cXB6X9zErtqmEgXlY4K5wWA3oPT0lNM/QdEIfS4Xd8lU0yAw51hx8MnKodH6FCtVTgRO3KhprYUdsdkn/XTFJ4Q0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781

On Fri, Sep 18, 2026 at 12:34:09PM +0200, Sebastian Andrzej Siewior wrote:
> The %pK format modifier was meant for /proc kind of output, not general
> printk output. Since commit ad67b74d2469d ("printk: hash addresses
> printed with %p") pointers are hashed by default and the behaviour can
> be controller by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones. This is the only pointer
> output in the driver.
>
> Remove the pointer formating from debug output.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..27f8f7a5738d9 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
>  	guard(spinlock_irqsave)(&lchan->vchan.lock);
>
>  	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);

You remove whole dev_dbg(), but commit message said Use %p

Frank
>  		loongson2_cmc_dma_start_transfer(lchan);
>  	}
>  }
> --
> 2.55.0
>
