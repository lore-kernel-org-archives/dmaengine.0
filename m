Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8573F4A3F1A;
	Wed,  2 Sep 2026 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360536; cv=fail; b=BwDMN7JXDa+R1nztN8kAkv3xagrQ5w3wuVwLHKsQj73tVCrYiiB764jDzh6kKcTpYv3nyTvYiKIIDG9taQZF9FHGR7GCY5sho/2JNKzuDh3AdXwHgyriNRPzxbqn/sx+NVs6I8LGxBgd4/6AlOHz5d+W3uN91VOI+3S0OkPuGNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360536; c=relaxed/simple;
	bh=J8u8guVmQSLW/0HUQ6ttsyWy6NmeUcOReW+bfTfi8OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A1xhGw1l81b8pj3A8a7ghu0tu89gMypbOaA2iONdtbDZzs/3FRDxPTWsiw4zdF/5riU0cMMUFQn2NotsAzkgh5aaL+eJZBQUZKUJQwaMr2b5+WK7z3orDmqmk05xOqDja1GUj4GpUxmKAni4SZ8zcTs5HdUNdSywBN0MLm5Smhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uKlEdc80; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uKlEdc80"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT1JV8VO0NQxDFJUVsD7rKbfXVJ50Dr6rSPPg416Dv45fKRVIqk/nAobFgcM559GGkZqdBbUCiy8aHtzLyJObPHqtWu8iNuMWGQXtEET6qEWBQErd7NuwJuQtGSAldSd9q3FERekp9JdRGBatTGUDQ9vsvS8s9u1UqZ0qSH0o2mtrXGNB0m5bE+d8gxQXufUiXSNQGjXR7TfMTZQUB/PnAXCCAXq9GqN4GRGz4goLA595BKBkcHVoEw5QJDZKmjH48epZQoXHx0vIn4kegpP/L7bPQa6dt7W/9bhkh6suZ47zuopN9vjyS2/hSNKNc0u9a+6VGxp4KBShS1kNPpRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yyjwWmkTl1Hj2j9a21ufe6R7DoxsW9s9HV32U6m+vE=;
 b=oNMYTeI/qFG7yINNu7buGG1XIYFNzj/PQFkifzYipw7Qf818UKZKpBXj1Lj0RNVl/9sSANhdGkELG4EVLbN10ww/OGtovY3dpVklj2IYBaRMKsDYnIogazAKMDWd2zcV1euM9oN9RW63S8VoqJgwNA26tcVzIfUvZlOJK+E8dxirVTFNHTgKRHfHObq3VmsmP8uer9sE6HKkLGUUo3l+BmyeF/l+c28yvyKqPJ8srUDKvom+YMDg5sTF911dqJlUv+ug6DmR3cJxwK56f5AtwtOrZ8tnZX6IaGzrB7K154dc3OEcTW5/mesAJPleMdodQzOaNwRfpoSVk0n3HJnORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yyjwWmkTl1Hj2j9a21ufe6R7DoxsW9s9HV32U6m+vE=;
 b=uKlEdc80T4FNTVorr5qqLFl+5gfQVcSfAUa07yiISkgBm4rdhqehgF4Zj3V4nLySW75aFvHpeGd95k5ENhLhlrf71rEIvAnoY6DhPQxm/a3ugZIRs8PYW6mjoCwJNDlgwywkbHhcLgbfIFuSV+UAYy1p52tzXRawDJBvxVhSb6VSf9BvEiwPe6i2i4uSQd27WgHLCn0raTA7P6XHPeAO24G1T30lJ7ifK5JwRFK4J51cJ540GmpR+ce8/nE1wykrsP08rEb5U7s1X3xbgXMq68XiSq9DTQO323yc+4MLxWjiznBYDCliD/EK2gJH8Lki9RIfUrKP+s0wVPwRhfcrMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB10011.eurprd04.prod.outlook.com (2603:10a6:10:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 14:48:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:48:49 +0000
Date: Wed, 2 Sep 2026 10:48:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 26/34] dmaengine: mpc512x: route callbacks via channel
 BH
Message-ID: <apg3Siuuhsk4Xptz@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c4ed3eb4259edcb339eb69466aba216d51c93559.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ed3eb4259edcb339eb69466aba216d51c93559.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH0PR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:510:4::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB10011:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b5cbb4-0987-4cdc-2adb-08df09014cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|6133799003|10067099003|4143699003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T8q9KxEo1f4C/Kl/bARoJYLyY8Yf+zpkjJtTkQmG82JIIw3yoAQpUKaJgylo8E6ueSlFDHYI2KRRh2HX34L0wvamuaVnfcsvArRBw5Rf9ACkdXaAHI0c9lsSwmIo6UfOntcVmLUSd97wr6beELg69aq1gZHbi+fCJaMBTgYfTILFl4021qYPi63AHRSfoIuJ2Py8pSKeMzp64PcO9PMxS0hof6JSp/AG5xxboo+DLCI6+0ls7jPQIqlLI3Bto32kpCgu3TfiOWetYayQKuO9COhdxAMHo8/jzEyL8N1FaNyuEUe5+aHDZ8B0bMfGOREzIqHaDRDxHS705J37nXLGVefOw9bti5+o8mano9i+Gy0ULrkTVd09kD+ZhZDEGzJBGi1YcGPo1Vtiv+24e6AfIOUcnUl61amxpZr8C7J8Ls/bKEPX0aBl2hqDoywaq21/3Oxp31SQ9jRmgee3fak+rVJRvNXDlLU+hI9mlr/rbMUP33rqmds1j+QjNfGwGGLFan3MkEaN2OM5ah7i9PDmXj19CP+qskSFnKHI3Ae8UbdBFGDG6uS4R+r89m0UYO38JZhtt4siWHvGleGXCjdbaRSTgEqD9z0uAxD3v8+xKwRZWTkhroStRotltPI+5zB3A+KUAhlVh6vs8gNvTA9TCOfhnVczbWp/B1/sQfx+y9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSq0HB8Q9g9rIDTw+ah8ktjzdaY0yJ5xrGKLaUFHY/xWutnDCzQTbylQKZcO?=
 =?us-ascii?Q?2cvLRY/3HmSyXgcTHhErKxjZ93WHXlzWMeY/9xQ7IFPWkrkXwxQnBMkh1yfz?=
 =?us-ascii?Q?96K5Whfd4rU2i2AHBNBKgXTWwA/DDQFCeR7S9SwjNtIoYxINJ6AdANF6SJkv?=
 =?us-ascii?Q?XJY/Gb/HQGZLOOFBZI0lHHwj4eRqiwKq6BsgQ6T+YxwLeJYZl4mPmtZZLW5r?=
 =?us-ascii?Q?saLJ7Qwj9xDPox7EfpCyLro5tr81TNX8dOlhq61a/6ySrAL5uUe8oYzty18Y?=
 =?us-ascii?Q?crCekTaNXvH6zeI5PggxlD+SsoAnqdn3eU7h8ZCDzXjkSk+KGjbGfUqt/Ys+?=
 =?us-ascii?Q?/l2ImXJi+dDpM2gjkAYL3kzIBURg2/1r6FxDv3ReFbrw8GEUHtaV1+TmnO5b?=
 =?us-ascii?Q?jSardRnau/CgMzBYfNfXjo51BjZWuOp1Qk2SseSQNckWgDtKHBPqcEfpmL/+?=
 =?us-ascii?Q?3oYDj0PwNpFlDhUKQpomFTQyGpB/me88G5Povy9Tr1EIdMILXXy3l/WiHe9f?=
 =?us-ascii?Q?AWDuWaHTIII3atfhg/1rWeE7h3Zsj7CIayLug0pxGwVGzxkZXP5Vqb52ym7A?=
 =?us-ascii?Q?/lrkOY/IubRkQ89w2CWR+uwQTh+uVkBTiqA5new3VnvE+N6hwi4jAlOwgsNo?=
 =?us-ascii?Q?0jIvf6dmgutgH42aXFZmQhGb1M/fAQJI4y4VZDwmNSzTpnI+pCNNCZy+FI1p?=
 =?us-ascii?Q?4a4TAGJeYMKRhAnuqF5tt+uQYHovUJY/FaeEY12HtKPGi6L3ckFI21Gd7dj7?=
 =?us-ascii?Q?zPqaL7i7tNkz/42JbWmfzgiNvPZEGJAKBR1821HlmhB3jEZreQereH6GmcMg?=
 =?us-ascii?Q?A5lNFqwq4pn+XEN3j53w+0hjFyMxZmg93fmJ4FgpnsNZtu1pSmYGFQ76NsjK?=
 =?us-ascii?Q?YnwLj/bFpI5PdF/qWlJf6126etPH6o1cDLCM8uElGrKVcQjy2vp7cTS1mSl7?=
 =?us-ascii?Q?s+K+8hqqG90kQnBDTGYNsMzTntUcmHb3hqiPPs6xEe8oT4cT3eC5dOEVtcjm?=
 =?us-ascii?Q?Agl8Uzz/x2930Zri6wwBNdQsGE9sftCA+xqFXxo1ib4Af65dA0t0vvP0wpIA?=
 =?us-ascii?Q?rohtUnLeU/vRiybYToDpLO8Pwz9BscMUPh9Gh+oLLXjdfN+SL2nThPOIAWXc?=
 =?us-ascii?Q?axVLfoOXIqunEJFLSlhTa2OYcTgvmpJQQGMjhyye4g+v3sGuJDKskd3K3wzB?=
 =?us-ascii?Q?wI+wNxIt33qk6O8XzcC+wLfyPo+iWlKqhVzpv8tv4umfHzA+5CJjQVdUAsmo?=
 =?us-ascii?Q?ZZ2fPmAb6GMz72e/F4SmkgsgHGLMTt5avQF6s85IGUvfJBYgfhGVL5GrXNJm?=
 =?us-ascii?Q?44rte37EHZ469lRvFSctgIzGBL9ZbXAHkdP0HbC6p0NlJraBO7lIp8T93ncP?=
 =?us-ascii?Q?E/ASTp+lNRjBs4Uwo/HFRTQaJ81bV75EixdqcyqU0SPJe0Qyf9jsUEoxP1uS?=
 =?us-ascii?Q?ECb9fqoRDU+M4qhGlv9ksDZUP4lD4JJS6mEOWGdEMeMsKCD7kodPhm0kFEBe?=
 =?us-ascii?Q?f2MAGAntsR779k7JHQCrBimJn7gOhQPIrf3s/vnwRZWFupvev/ON7UjtpGVw?=
 =?us-ascii?Q?xmh/2hrUHYhi9Fbzk+O5q8eaKujqRUTd7tLWObs+gzCht0z0i23lsVM5ZK5Y?=
 =?us-ascii?Q?85MMll5/OZqrctU+Z5XSY8SbfjFi9z1aF8qcUf7BfFqX3saCVFlKSBmkKwNa?=
 =?us-ascii?Q?yzxyO7ONc7SNau3VjJkXB/Cyhu1qKTOM49+sN1HMhU2jtf9phR6c7tMfuYiK?=
 =?us-ascii?Q?6ZCmj5gTTY0ys+oYBYvlLi6L2z63MnKOQdTSMgebXc0zuxTvZuFQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b5cbb4-0987-4cdc-2adb-08df09014cbd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:48:49.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSq0tfoTj2CfWqy1akpdIbqSg9jji4nzB12pBZ4oaMsjiabnZ29M1U/SdKaiwuvRSQe6Kqw1kGgTTN7btgO7sZ/CEt+2wQtiBK+PUqQtqu2E3WchRDEygvyRC4yP/F+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10011

On Mon, Aug 10, 2026 at 11:09:27AM -0700, Allen Pais wrote:
> Schedule per-channel BH work for completions and process callbacks there,
> leaving the controller tasklet for IRQ/error handling.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mpc512x_dma.c | 74 +++++++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
> index 0adc8e01057e..19e0b2f1b2aa 100644
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
> @@ -372,45 +372,47 @@ static irqreturn_t mpc_dma_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>
> -/* process completed descriptors */
> -static void mpc_dma_process_completed(struct mpc_dma *mdma)
> +static void mpc_dma_process_chan_completed(struct mpc_dma_chan *mchan)
>  {
>  	dma_cookie_t last_cookie = 0;
> -	struct mpc_dma_chan *mchan;
>  	struct mpc_dma_desc *mdesc;
>  	struct dma_async_tx_descriptor *desc;
>  	unsigned long flags;
>  	LIST_HEAD(list);
> -	int i;
>
> -	for (i = 0; i < mdma->dma.chancnt; i++) {
> -		mchan = &mdma->channels[i];
> +	/* Get all completed descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	if (!list_empty(&mchan->completed))
> +		list_splice_tail_init(&mchan->completed, &list);
> +	spin_unlock_irqrestore(&mchan->lock, flags);
>
> -		/* Get all completed descriptors */
> -		spin_lock_irqsave(&mchan->lock, flags);
> -		if (!list_empty(&mchan->completed))
> -			list_splice_tail_init(&mchan->completed, &list);
> -		spin_unlock_irqrestore(&mchan->lock, flags);
> +	if (list_empty(&list))
> +		return;
>
> -		if (list_empty(&list))
> -			continue;
> +	/* Execute callbacks and run dependencies */
> +	list_for_each_entry(mdesc, &list, node) {
> +		desc = &mdesc->desc;
>
> -		/* Execute callbacks and run dependencies */
> -		list_for_each_entry(mdesc, &list, node) {
> -			desc = &mdesc->desc;
> +		dmaengine_desc_get_callback_invoke(desc, NULL);
>
> -			dmaengine_desc_get_callback_invoke(desc, NULL);
> +		last_cookie = desc->cookie;
> +		dma_run_dependencies(desc);
> +	}
>
> -			last_cookie = desc->cookie;
> -			dma_run_dependencies(desc);
> -		}
> +	/* Free descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	list_splice_tail_init(&list, &mchan->free);
> +	mchan->chan.completed_cookie = last_cookie;
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> +}
>
> -		/* Free descriptors */
> -		spin_lock_irqsave(&mchan->lock, flags);
> -		list_splice_tail_init(&list, &mchan->free);
> -		mchan->chan.completed_cookie = last_cookie;
> -		spin_unlock_irqrestore(&mchan->lock, flags);
> -	}
> +/* process completed descriptors */
> +static void mpc_dma_process_completed(struct mpc_dma *mdma)
> +{
> +	int i;
> +
> +	for (i = 0; i < mdma->dma.chancnt; i++)
> +		mpc_dma_process_chan_completed(&mdma->channels[i]);
>  }
>
>  /* DMA Tasklet */
> @@ -419,6 +421,7 @@ static void mpc_dma_tasklet(struct tasklet_struct *t)
>  	struct mpc_dma *mdma = from_tasklet(mdma, t, tasklet);
>  	unsigned long flags;
>  	uint es;
> +	int i;
>
>  	spin_lock_irqsave(&mdma->error_status_lock, flags);
>  	es = mdma->error_status;
> @@ -453,7 +456,21 @@ static void mpc_dma_tasklet(struct tasklet_struct *t)
>  			dev_err(mdma->dma.dev, "- Destination Bus Error\n");
>  	}
>
> -	mpc_dma_process_completed(mdma);
> +	for (i = 0; i < mdma->dma.chancnt; i++) {
> +		struct mpc_dma_chan *mchan = &mdma->channels[i];
> +
> +		spin_lock_irqsave(&mchan->lock, flags);
> +		if (!list_empty(&mchan->completed))
> +			dmaengine_schedule_bh(&mchan->chan);
> +		spin_unlock_irqrestore(&mchan->lock, flags);
> +	}
> +}
> +
> +static void mpc_dma_chan_bh(struct dma_chan *chan)
> +{
> +	struct mpc_dma_chan *mchan = dma_chan_to_mpc_dma_chan(chan);
> +
> +	mpc_dma_process_chan_completed(mchan);
>  }
>
>  /* Submit descriptor to hardware */
> @@ -551,6 +568,8 @@ static void mpc_dma_free_chan_resources(struct dma_chan *chan)
>  	unsigned long flags;
>  	LIST_HEAD(descs);
>
> +	dmaengine_kill_bh(&mchan->chan);
> +
>  	spin_lock_irqsave(&mchan->lock, flags);
>
>  	/* Channel must be idle */
> @@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
>  		INIT_LIST_HEAD(&mchan->completed);
>
>  		spin_lock_init(&mchan->lock);
> +		dmaengine_init_bh(&mchan->chan, mpc_dma_chan_bh);
>  		list_add_tail(&mchan->chan.device_node, &dma->channels);
>  	}
>
> --
> 2.43.0
>
