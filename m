Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198424A440D;
	Wed,  2 Sep 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360739; cv=fail; b=JDxhbyrwajyqUekwwy66nFo35ZmXDFciZJ9QJ1vyPGQq0kn17SsTFjRZgbq7GYbBf8ORQGJtFz3gCAJdQJpnj5VWIaVZVqyRzlrYQ84sylgEBfFX0MagZ6zvWPs5/J189qTxTYd9fT/C5PDkUstq1hVAXnxU11N90JtgSJu6XcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360739; c=relaxed/simple;
	bh=Kk0T3VU0KjyVm8B/c6gRh+piT4KabFzacVm9txjTgWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RX8kIIh7popyt70lA+wMe8uPFxQlJfrwFg1jVgNuOBtbu0TIBqswBDH8jJNkSliXoYs19Pwx25MgT+L0rbau/adU8BdzTT6lJnsK1NVzcPiDg42leZY7NyMJ66VZFWV9RMiV1tDJ7mOG0cSzfckGcItxaEmjD2RKt39Vz2iIsIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FRKSk2Af; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FRKSk2Af"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOZhEhGcmjOMo8+nOrMUFlTyJfAPLv8oQvMKi25ztcTwZF6Fao84z0zW9UrEmWPwb1CzbaFXpZ4VTmQ4eFZgtvPcsBlCHy5SphqY45MUNreJ4q+DBO513pZDYW492hIH1JX8Wn7+sgc+Iet3vW6N6QXH7IOAp541rMxtHq1oV19AVfVWHDxtQSRWcU0pTi8PHJZ+lbh/hDJhfshFxaoB5+mWatpugLiMYYFzqVjaumA96lbllu5ehTcnXVzgmjhbWLAsspB2YMoeydxloihA2bygG0/Mhzlo+7tHklL+43hTMZkbbZgxaMoVdAavh48WanFd4P8Som6F4uBaGtysuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxeAJfwqAcnmqktIOqFo0dDtUU3uXeuON1VMvJXxT04=;
 b=hO0sBWxnskaVBnBs2pSFPAeGG7CU5W/1q/2mdFj2rhCgAS85WjdXJrzneFwhfvXMVvur4Z5e/H/H0FWXAe1lcuZHtkpg6qegDu3TXP6U4b1ZGoJ3OhjXFEVTMKVOvL8QAtb/Z9i/NiwoYsI65nIbVUA17rkUGink7lET/sghR+0YNoab/B9s3XlJP6OlmtH/RReVSDMuQYt6MEOd8w86iKqTqeYWZ346rd4wkF37pg4lFgrQ8c26MaheBfueyp41tHuNr2F+RE1RpN/qUVf1NMX+IybpHqnLWrV/GG6P2FLeK87lyWQySLxqbIysqCKpWiK2rYOuBUpMhdBTUqpWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxeAJfwqAcnmqktIOqFo0dDtUU3uXeuON1VMvJXxT04=;
 b=FRKSk2AfPweeEz6AmZLPxKEFYljpSy+nj8zUmG9R/FnEBQ8cL7UiyKjdMHISqtqES6ayDlhM4Jq+H1PlyNOSis9QskdLhDwSLlqsDsZ+pqzn3N6hNqIA6qXUWZO8LLl1+EnYzASeENliZz7rnVAV3ReuEukNiJNkz+tH0nwASpJPijGizyWPZqmhujwqgM8UWcTuHUsMvGJcMmtL8eqnIUsEJi8xTXgWB9Of8XghCfGECFRRwjCtSeIZOJloBeZ3BqkrP9gBSm792tun9Ig86F6yUeYVFB8eksx3b2P+c4xkgNFdaB2CFasWVNdxwSE4W7E0CWKXe36M1qpOab7XBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB10011.eurprd04.prod.outlook.com (2603:10a6:10:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 14:52:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:52:10 +0000
Date: Wed, 2 Sep 2026 10:52:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 10/34] dmaengine: mmp_pdma: replace per-chan tasklet
 with dmaengine BH
Message-ID: <apg4E9EtMecsM4WN@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <f55f26921b9c0bedb7353399f4284003ad5279f3.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55f26921b9c0bedb7353399f4284003ad5279f3.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH8P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB10011:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4047cd-576c-43ac-f80d-08df0901c434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ab+awOa2eCObg7dsEM8gc58yoLXeDjXK8axfuYWHlqE+0vGN/EjCeo1mtwjVHM3UkoiGvVQXiTBuAhi+DQFFw6uPfRLBXjpByCmOyJUUfIedSNPjr0S1z2eGXPwYSY36uHo6iUoZlqOALW5YsO/tAlGPQYfoSDzOIibScUfvsllYZLbzWxN0JMwlp9NlNj+vghrl1Lp6lbsfIXvmZhgAOu45CKP5buQu0BYEXofr/EaJENnZNN6Yak/CODKItrk/0JMEaXAU3Y+vPt5tOXHLqwrJcy45q2Pp8vCll47Ph70X5XyJs6SxU/YyIPEomCkLz+SCGQo5IcKt1jTTSJI+rn+NOts5/UTzmpbbrhWESEPbheKvMKuQQ4QB7Q8nWAgw9JOpivzO1UNeFUBsy9kvuOic9blhbDa1jCxwkdKTkyEmXaeD+0SeGO3JMSPacwXmucDS7DZYqzwRO++oG6A0HwC5ayx2EAA8DqzTVt4cnqhbb99XHLm30R3/1+j/qKlXzyhzKbHuEl2iPGuGmHo4igMjeijSfDEHyrNkVS6E5GSGOw3UlPzLSUGAxsLL2oPYxu15vw3oi7HZRU8TQFZtq5lfv6U/GiFIa1yqb6q2s64/o7Q4IHmzqAqYlOvP6iwFavx84YUHoxehz+MCxvbIArXyz5JgOluPAnp1qbhZqLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9xdAUU6wWCZW9zP0iF6Bd4Nsrr2eTiluR+8LZVk9VkOqNzYVFfIqzFI0hQM?=
 =?us-ascii?Q?YcsQnIex0g9mDQxTHqSB5qpyzEQmHOatsamxm83rA3lrtzNNQ/GbGq6ZlfGE?=
 =?us-ascii?Q?4zJ6PbhT0U/jgoWQ9My01BVes2Z20+0gf8N4WFL16OkPIIrmhQWncNvh/DCi?=
 =?us-ascii?Q?OBpIHtIASHdLKU64VeT902NbcyfomL4vUy2Dq7BtlNIftevT6MxAVlXNfDam?=
 =?us-ascii?Q?4Ka2ohjDdOQfGn1eOcBYIH6eUF026Ln3aO1hdafC7Cl+HZxf+InKGxxloZlz?=
 =?us-ascii?Q?LG3VpIDcaYMrjR1VNY/MSaXrDyVrHw9XmJM7KK9BgDTifG7vFE/RGPXq5mW4?=
 =?us-ascii?Q?VZY6IgOZ8MnPm9kN3b9OzxEYaH+fPuTAzz6F+Ids7FMUN2NmdcS3D6QBuNtA?=
 =?us-ascii?Q?nmmEv7MBHZ5wVkPW1uUMR2hr+EterZCk+OtehHMCxAD4JspEEZEQ6qhCo/0A?=
 =?us-ascii?Q?QPvH17lG/x5kIpZfXhYcilbjIjQN/B5UE8uO0NO2njoB1iYeotkpo4RA7tj9?=
 =?us-ascii?Q?K+ECXD0BYO503FjxOQWgb1V0w9Y5qbjH3Ah0yH4KWz1WEGq9SnNm9/VP8bA5?=
 =?us-ascii?Q?0xrrWhcHwY+03z5Keu4DVGdkctdGaKi2xiqXUCg0V/ZDGsVnBvAlZsUw4bOo?=
 =?us-ascii?Q?qiDhOnR1rsHMroW5kKuOzVph3wdH3yGbX8xSeT5rzXaBIBqFZ11PpLryfFvs?=
 =?us-ascii?Q?4FXirNDHhPa8MHknDDut5/UNiFvOYkedHshDv87kHym1N5erX9BxrR+6LkMw?=
 =?us-ascii?Q?Fx5VPQa882JL5/fB6NyH8+zgpX2jOJSgkNZUVHgHMjWgxms+SlSqGNkb/OMV?=
 =?us-ascii?Q?LFjsMWH7fv9C16YcSKqpbIRp3FHodWHfCEVTQ84dbKStJzO5PnGWaU9kS9Z/?=
 =?us-ascii?Q?rZaJZUyoXNIBRAbZIcBGmYXBuND9gNB5hCXVIMpHkaOEp8iTYN5ASGAA+JKf?=
 =?us-ascii?Q?RZOFF+0wbE13fYFsej8YMCnKHM8OTyUTLIiSXKB8z6TWNkjRoufz4QgzKoaF?=
 =?us-ascii?Q?OiFGex3s1QpbxFnv2YxDwZgzjjSrIrJxSWMNdnETUQzZH3JVB8S0ggRDuK0j?=
 =?us-ascii?Q?SvWeSoJkundIIaKIJimoDnw9N6CniVqTkcs/Ps7+aQ4u1yFdTIaKVudWaN2G?=
 =?us-ascii?Q?5QOeIJpIjTYmZ6JcVMqNXYKhds3jS1UWG3kIbtwzjKHCbzMLghk5H2ZikP2o?=
 =?us-ascii?Q?MAbAjWTLgTgfgkoGXm4uq6iwcx5PqJLvHKJwdN8DYkcUGf6ADMcC4sVkgfj+?=
 =?us-ascii?Q?HFbrKG2BP3kBK6s19YaQQREMUG7k05/L2hB7QeWxH8kI7LqHQ166L1LulXXa?=
 =?us-ascii?Q?NvLrEJlpwZNOXzjYXuHhn786JrnWz9NTMtrIzk/JvvUpafYEtPR5srcm9Nbi?=
 =?us-ascii?Q?tMjbtsJWTMNjc9bx7KFQOQTyHLaFstH2WRVEPyfNwegxwHmpY2lGKjTKQMMl?=
 =?us-ascii?Q?iBJqRGKyMYTsu8H69CM2IIXm8ZIZwtzPofiPLLHbrHHpfcX0OZ4znns1tsl+?=
 =?us-ascii?Q?AP8A2O4VtgdfHhYK2UYNXMdXaeUW+ZUqDgEsvRQisXNU5b+ZXDpd/TyD9q/R?=
 =?us-ascii?Q?lpM2yo25pV+49aPLFiEiXytzePjexiRpdAy5upWqTLO1uGyjjFHYZgKAOJVm?=
 =?us-ascii?Q?IwZBXPwJEzwSEbnybWtbTVyaIJ+BEI/QXpGDtPZApx1obz5eL/vFuZMurINR?=
 =?us-ascii?Q?JGKH4j1JMMWj6agyNksddvSY3T+GtaOiBvWYzBpyveoTNEeySMPzKMNxk3qo?=
 =?us-ascii?Q?Qk2KTMMUk2Zne+fOvUATr9oEpuIH613XinjP9QZTeJcNrUzXn7Ro?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4047cd-576c-43ac-f80d-08df0901c434
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:52:10.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/lTtEb8kc7XCGYHIFuPEwSWUZA/3vLSv6E0gbQZfeUFOWcUyybMS8E4ZfAs/VEn8nEUdtCFwM1q5z9ghVS8nIiqamrv0SbL+bv53yOlUQ0MMaHPlmemGa9S5jDWTEot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10011

On Mon, Aug 10, 2026 at 11:09:11AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mmp_pdma.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882..4f7d3193d7a3 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -116,7 +116,6 @@ struct mmp_pdma_chan {
>  						 * is in cyclic mode */
>
>  	/* channel's basic info */
> -	struct tasklet_struct tasklet;
>  	u32 dcmd;
>  	u32 drcmr;
>  	u32 dev_addr;
> @@ -374,7 +373,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, void *dev_id)
>  	if (clear_chan_irq(phy) != 0)
>  		return IRQ_NONE;
>
> -	tasklet_schedule(&phy->vchan->tasklet);
> +	dmaengine_schedule_bh(&phy->vchan->chan);
>  	return IRQ_HANDLED;
>  }
>
> @@ -1047,13 +1046,11 @@ static void mmp_pdma_issue_pending(struct dma_chan *dchan)
>  }
>
>  /*
> - * dma_do_tasklet
> - * Do call back
> - * Start pending list
> + * dma_do_tasklet - BH worker to process completions and kick pending work
>   */
> -static void dma_do_tasklet(struct tasklet_struct *t)
> +static void dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct mmp_pdma_chan *chan = from_tasklet(chan, t, tasklet);
> +	struct mmp_pdma_chan *chan = container_of(c, struct mmp_pdma_chan, chan);
>  	struct mmp_pdma_desc_sw *desc, *_desc;
>  	LIST_HEAD(chain_cleanup);
>  	unsigned long flags;
> @@ -1170,7 +1167,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_device *pdev, int idx, int irq)
>  	spin_lock_init(&chan->desc_lock);
>  	chan->dev = pdev->dev;
>  	chan->chan.device = &pdev->device;
> -	tasklet_setup(&chan->tasklet, dma_do_tasklet);
> +	dmaengine_init_bh(&chan->chan, dma_do_tasklet);
>  	INIT_LIST_HEAD(&chan->chain_pending);
>  	INIT_LIST_HEAD(&chan->chain_running);
>
> --
> 2.43.0
>
