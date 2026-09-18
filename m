Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2720252ED39
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767912; cv=fail; b=CWFZeKb4UReqwPGesrGpkszWbpt41nZ/Uc3n+rvLOQ5fJWRP062anpp0tCXmo+c2Dr+bKkWs5bHCR/Ki7n26xR248K5fJjYu7mbM4MVh8sOH5EQUDP7ttOD+cCJCkWXxB1is09xr8q40Hg1JdR+Tda7/+ZPQ3bwICf0TpxuqThU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767912; c=relaxed/simple;
	bh=NnsNQ90ey3lyPqo4Aus67hW74PgeoLYgxyaKVl7RSvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LOFJVjJGn3o+HzgKSRO1da2Cj9AozrMwTWgURK4/f/32+Kwdw0k1lMroJEdHzRi3i74x4lT75hA8sk34Qqkmx8zKofgzEgvlTUMla/tceKhGzYHKKDSLKvaqCnEhvgg1IXpAEId3+X/yji6XnSpdc7DQrCyzjhmOgRTOgqf9f6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HxQgJPbw; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HxQgJPbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQIrBHDSyLuoAQIJ0b51SYoDHTlbX/UZANIT/OsSAhkjoGLVeB2X8vczbtNEqKCnnbbwaHJaVfnpIBj6NlDgTRcXKkyITrxUhabvavkXffoC9OocB23pkos8BkpKNtCxN8Jkn7vI1uaicJ0YXk2eoRNQZMpdYTNfQ3ZdBnb88fx6hJiRYq+2ipIMIjyfUzZ0WbHUb7+GkK/c01m2HoLS3mqHGSp+RXBxYuU8rOWjzemN4rv8pASBvyQxz6f6G0i69wDGDiVBxT5bRFyaEN9WyQAMlyMqTXGcDiQ6Ukfx9Hv3Qwc8TNErG3/KbMYjPoX0boVBcpzIN0vLrmUisErfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMAXobBbGnb02l0TpVkRsLRpH0ordotDq2ps3C1QoQE=;
 b=Z4ZCV4uBX2Xp1pXK93aDsj82OPYBSir1G499SMX96mRtdvHvAVgqFtabi45fFStrDWaZytEbDqaE/E/wPVdurPYaT5GdYkwa5mw15rr+1MVRXXgbCFzGSHqN4lTkv8UNMqGpz7snA5foyyc4iRvZ6w4F281hNSeD9DT0U8ak5Ip6MMEyeK8hR9juqVyp/1UK7+QKQOwk43Yky+jRm6gC9dtLlaXPP/GOqlSE5fHhmedIMA2BHL1apdVK4zQPRmb8T+qixRTVSikuJYScmL1j0p/BoPOmfxbmphhW+F2nRcIk5NoQMmkxlfBUmm3F9h9V+h0oooVLRGQJPI1WAwiCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMAXobBbGnb02l0TpVkRsLRpH0ordotDq2ps3C1QoQE=;
 b=HxQgJPbwYj/yEJS6noAsjUZo+UMYJXmqqJqDtH7bxawwpetUPUKAZBvp+IdC6uLi3NBrpOXsISPPP0O6tivqwGNE3nBQCdOayI7oGyb36WfJWiByj8a0nrgT8aI6Jt0jFKmbAPV/gNOlzEbhLz/uND9cLmTae1Vp7XHk8pV37bacsJ2q75XdopGpDVk81dXtwtwLOQvGOSZ1EzlEKY7ocZzRn2oI9HyPfBPO830A+MB2B6XLqdbx77U8HSktjZBNfFGuWgs3DXKZHbgGd6Axm04+1Hb5lT0HePQam4idO8ZqvV8CINppVLeTwNAGY+T3A7fueMkiJTbeElkuEahPgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7248.eurprd04.prod.outlook.com (2603:10a6:800:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:45:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 21:45:08 +0000
Date: Fri, 18 Sep 2026 16:44:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH v2] dmaengine: loongson: Remove the %p pointer output
Message-ID: <aq2w2_9L2Uf_EeC3@SMW015318>
References: <20260918201714.eFNI3VMq@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918201714.eFNI3VMq@linutronix.de>
X-ClientProxiedBy: CYZPR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:930:8d::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: b29c21cb-a494-482b-9e84-08df15ce1b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|10067099003|3023799007|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Iad3uZBOBGIDoHOHwEdO09ptQXdJomcKmtxm6BmUcrFX2r1oZi8a/Llsmbj4nH86Q2FFxd14FDZyh9ojNGbXtp31Nhy+xJsIL+iKLB107CM761/QPFyPmpOK1ormJRRCdnMx7ILxJjBibZSshvrYF/qhsxRHWsPLZrcpCy81h9pZcocuf+3SyIAm7Kklp8kiDE6KAZd2ioh6nwaKW1KKKzD70BIL95My4Jyc7IreAJa7ri9asfHXv3KpQ2euHWtqc/kIRsOVYF6lI3AKCbmIdOq4CdzDLyEhfN9sBzY1xMh03caOsYsEqBkL8HT++t0M70PWtuExQQOSkFmKQAu9gFwSG19M+dCwlluSjh9ddBPxcxvR5PAnoJlHrMz/na/vHd1Rbu8c54GcBTDfToIMFdFBR9jUDocjjxXxmEkDWiNZmpJt5L3dNeximFDBZNNfUdU2/CFJVYwnVRaIpj+OE/aXEhONNruVcHJDm91g9JbNiMNfkluh+xFZBu38Dtr2lKgREkavY3SAsj1784Mav4QikNbJYz1P90IFJhEFJbt7DvavVS1jiqwMOrD2fwbinAvuMP23jeYx7NYV9H4W8HVoWHzNwzjyoagi7xdFgVmjJdqmI7isZJIPSnuNmRCoDM3EvtTv/l8+GntVo0Dfvq0MM+h4ixCqwrAjkKDfJdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(10067099003)(3023799007)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEZaU3gxUEJiOFdNcm1nNkdGb3NmYVYyV0xwd3hjTWJuako3MS9wTElsODkx?=
 =?utf-8?B?MXZpVnlmemZ4S0pJbVQyVkRzUm1CdG5mNytnNW5vVjlqRVFIR0dDaVM0bTRS?=
 =?utf-8?B?bm1xVWRiTzFUMm9OREI1Rmp0OENVQ2xCcmRwMUUwV0ovSDZOckFQNWZ3UEYr?=
 =?utf-8?B?ZU5aZTlIT1ducXNpY1R3OWwzY3hZOXl1K0diQlNxa1pQK2c0S2MxeUhOQnNS?=
 =?utf-8?B?Q25uV2hOOFZTeDdIc1hxcnA4Z1dUbDVHZUdKZ0ZzOHYxbDZFeW5IWTVxd2pz?=
 =?utf-8?B?cWJ5ejQ0aThnYnBzTjRCWml0VzNlaTZtL2FUOUN6U2hKMUZaV3JCbkxHZWhK?=
 =?utf-8?B?bEY3dFJlcDVZMXZMVzd6Sks1Z25iYkxRUGRyeU5pcEg3MTFWbDhHMWRqZlJu?=
 =?utf-8?B?TW1vOEZWOHFZUDI5MWgvRSthSVRIRjd0elVDeHEyQzRTblc3VVFSQUFySVJK?=
 =?utf-8?B?WWVOU1BoNFJVS2RIamRVd1NqNEhVR1VqUUJVSTJ2SkR6dC95dWFUME9Qemh2?=
 =?utf-8?B?STZVWGpyY0RjUWpybzFEOFlQYmEwOUlNdXlpd0Q1U0ZrS0hiZm9ocUdQVU1o?=
 =?utf-8?B?KzQ4NHJEc3dxN3kxTlU5MHg1c1JST0YzMlMyOW9TdWRjYlNvVVc0dXNwTXZ0?=
 =?utf-8?B?WU9yS0lKa0hpa3hKMHlmR0k2RlVwWDdLYVBYMDcrdUVEN3d0RXhid1IvYzBG?=
 =?utf-8?B?UlN0dktxem4zQXlQWTZ0eWo3NGpLNDB2TjVtOXVNZ3dPOCs4bnA3clBxaW1Y?=
 =?utf-8?B?WE5LRGtwSlh1Y081b24xbndvTzgvY3M3Z3ZGaVBYeVAvaWVpNTczcWFIZ3Y3?=
 =?utf-8?B?WEdnREtESFhaR0ZzL1hOcjJHdU1zODNXZzlrZ2FwTnh5R28rZ1RIcVE4OXVm?=
 =?utf-8?B?Y291b0xGMk5nRHhPU2R1azdkK3FZT1JDbGd3bWdQT0hieit2Yk9ZWDNuTWZK?=
 =?utf-8?B?dUdqZVBBNWVwOWQ2N0RRaDA5Wjg3d0d6am01UDN4TkIvMkJMczBydy9Ybjlu?=
 =?utf-8?B?bWZvRHhpMlU1am1kYVR2UHhGVTlQM3RUUXcrS3ZFUDJvZlF2RXRvMjlML0JY?=
 =?utf-8?B?MHFobnVqejFyaHUwUXhYeG1EdFFEUU5SN0ZUR3UxYXdHTFZNZUlOS0dUZG15?=
 =?utf-8?B?SmZXMmJYKzNhR0NObTF2ODRTSkhjejVZMS9Qd2o3OFJtUGtYLzk5cWZGUCtD?=
 =?utf-8?B?L3VaM2RxaEcvRnRTZDFqMCt4a3FnNDQzQ0FqQVhTNEw2c2J0THQ4NEFmOURF?=
 =?utf-8?B?R2VNTkVFUkE1UzZybEJlZHByZFpCb0doWWFab1kxMUhxMzNYK0RMd3Nidmpw?=
 =?utf-8?B?V21NWXVlbDQvcHJ1eTl1QTJYS3pzME1waXhBRzNtNTcySTNORUNDZ2dCSGNp?=
 =?utf-8?B?cFlhS1NEUk12RDVHOTlQMm1BWFRwOVZvbFM1VVl5c3VZVjExd2NrUzlOcnRI?=
 =?utf-8?B?djdlSnhZR2FGUEtPcGY0dTNMU2YwTDVBdlFIV3pNNWxkdWp5blhzWVZpQjBa?=
 =?utf-8?B?UWNqeWh6S253Vjd1aVJVTUxPb3NiMEZsV3dGWUJuTjFxSTZUQkcyOGdFc0o2?=
 =?utf-8?B?dklJMWppMklTaGt6RDB5bUY4em52dlBXK0d5Y1RrMWRsS2lPWThkTERCNXY3?=
 =?utf-8?B?TmxySFRrNGxhakRjMUNwUnBoZDV5bEEwcXR6bXpZeThjclg2clB2US8zWnFV?=
 =?utf-8?B?cTB1VWdaUEg4dUltMGlRZFNvVzV6dm5hWnh0YjRBQ0tBYWlZZkZVZExyMmd2?=
 =?utf-8?B?SW5GeDB1cU9iV2tGQldzdVVIcXhQZmFHODBZRFkwWkpQYTROL3h3M0xHMnZk?=
 =?utf-8?B?M2k5OGJPaitsbTJFc0tkeG5qVGJsZ3lNYzhNUTV2MTROOGFqZ1BrSUV3a2ow?=
 =?utf-8?B?UFVxOVJoNFI2L0Rvd09GM0hSMWd0VkR6M1pIRDhONHFUdkp2R2l4L0NUVXpN?=
 =?utf-8?B?NEJqa0tBcDdMMUpvK0ZkWVZxWnRIY0ZhcnE4encwZkVtZnkyVFJQNFRUcVBM?=
 =?utf-8?B?S3NVUVExVDBvVkJLMEZuMXVBbEFkV1RKQ0lUN0FOdHQ5a1J4WVJSdEt6RzZ2?=
 =?utf-8?B?emk2dWhMQ0dyTlBYeWdvRXNEUWVFbWl0Y1NIdkZGY2ZUK3RuSWlhRDRaTzlI?=
 =?utf-8?B?VmtWbitIcHpmYjR3cXJUUmdkM0tRQW1ELzJlZStXTnNHd1BTQUdFa0ZZV0xQ?=
 =?utf-8?B?M1ZXRzAzZkxhc2xYZjErM2lyOTBhZkJ2bXhyRTI3ZHBFSUhDZ1lwSWQwWlNo?=
 =?utf-8?B?K0ovT2pLYTdwSDVnRk5COTVKekFLYUtvUXR3SmxEbDJyUGR0NWsrK0YycFcz?=
 =?utf-8?B?a0tpb3NENDBNK1gyb1hET2RxRUpPVGZ1TFhMSHlyb0ozWFJ3bjZFbkV5NnI2?=
 =?utf-8?Q?JcHnAB0RfTczASUWBgQ+zV/YvQ7BLsBqvxPMI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29c21cb-a494-482b-9e84-08df15ce1b85
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:45:08.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8qt8GfmvAnJZwCSeBfGXMcw6PCOS0WI5RLy61/8YiWJIKmyh37qLQV5o2aZLT6BBxMYDFKkQBjbZ4Bb76CUJWyGVBkTg07wRw747DB9MamzyS0DMGajkjQY8PPu0z/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7248

On Fri, Sep 18, 2026 at 10:17:14PM +0200, Sebastian Andrzej Siewior wrote:
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
> v1…v2: https://lore.kernel.org/all/20260918103409.UV4g2ON7@linutronix.de/
>   - Update subject line (it is removed, not replaced).

please careful,

remove whole dev_dbg() when vchan_issue_pending() failure.

commit messesge should show why it is okay to remove dev_dbg() here.

Frank

>
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
>  		loongson2_cmc_dma_start_transfer(lchan);
>  	}
>  }
> --
> 2.55.0
>
