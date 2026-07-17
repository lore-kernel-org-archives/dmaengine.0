Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020110.outbound.protection.outlook.com [52.101.229.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF637C0E2;
	Fri, 17 Jul 2026 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311745; cv=fail; b=L0dkPYZAyS45/J6srCXEaoWRU1jNgyj7dko59aMUAgWSuNCMLFiC6faWlgPfyDE8SkN0ZzMkxjJMOsIZ8Kb9+/EQZRj8UERa9jT2zT3IA1DUQRurfl2o50VZCZhMAgyVNlpmHY45SMZjTPTrfAEt/FIrBlZe82d53SwCswBakQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311745; c=relaxed/simple;
	bh=U2zqAJlS7kPlKfeuhCN5QLeir3CFHJR42SVDmduEf9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bMLxxEN1V8kuwVn9VDrjtrgSvrlPQVJVFIDX8erVHzLuOUN+ViJorvVJ+L8mReATcIBvwIthDfIDf0jmR+p1A6xVRhlDKLreePZvqQaFjc7w1qVDqb6Zk13dKDSHeZjKRZWeRYgzsFf0AIh1lSeiahnLx25HtvzRQ57eG2CwozY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CTFF8Rl/; arc=fail smtp.client-ip=52.101.229.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CTFF8Rl/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE69dFZaZ/qvjljpN64l3K/4h6g0rOU5whnNo+yEvG38daAA1hVJA+VLdUpLTabsBvhgUKfqitRkhFIjSCUfzkxow9WoE4ODjRCcxYwbBgCi3GQXyusyaidYHQInJKNE5yMYb3KhkIDhhivyzG+lkVumlutsh6uxOMyKpSytaIvISPhzirgiLiOBPmmykYwlIuxNGEgF5ZmcFH3hra71NRtMnUPjUlkdHHenemmjTXao+gXgrsuHpcha8ankZVEehumVO8nR+EfCB/WqyKXvvbo9Oj7vI1QeZsFjRkrxF8v8UWcxJjj+c9TNyW12lMT1wwe+iG5dfrp7jjMZH7xVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djI6b1mkhxo+ioM67LwboPz40oSuJKDIEl5QJfiQ/xA=;
 b=PWQTYwaf1XFxjgNv7CptjO95VnP7YSwuYhvwWswAYOYc6dL2YfeGPrj3srhykAYXvPlJrGyU8s84v6h2KoGY89+IVgOIqhvutvidDxGw81aTN9V7pAYbL207Mls7WoQXR+CleZuJ25yfbBp5aD7lkQlPy/V71fgO1shTVu34coeHGbe52OrenITFv571RJTOkSsndd+J892hmRBkta9DDw6cYyQQ8GTdIg4wn6mCVXl/qaQs+5t7HuR6asr3LRK5j8ZNqiUvCgwe5+Al1qUJADbIUcAhP6VCDcuEXOovH2lkeM3jOkwyrckxnQYEYzS6nRY/Ot7J3aR6OzGuVq0iRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djI6b1mkhxo+ioM67LwboPz40oSuJKDIEl5QJfiQ/xA=;
 b=CTFF8Rl/uIKY/Wjuyfx/hX/woYpP/yhNOR4AWMw9BVFsNPFmBCLUqE/ajY/C1fDYj5Qp5sr0fbiDi5yLTF2HPXrWUYvxNcb5xUWAGueFNcDwW7HAEkC8fOHoOJF/06bnKE70I6LMOwcL7exZgbhXJKdxEWM5q57ADFZobGeOZQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:468::22)
 by TY7P286MB6785.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 18:08:59 +0000
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71]) by OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 18:08:58 +0000
Date: Sat, 18 Jul 2026 03:08:57 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Serge Semin <fancer.lancer@gmail.com>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] dmaengine: dw-edma: Fixes and interrupt-path
 groundwork
Message-ID: <yh3vq7ppnjjjuxfvydtupqgep73uwylibqmdvlzdrzw3o562am@u7kxbivgajft>
References: <20260716152503.1747922-1-den@valinux.co.jp>
 <aloZei10QXM1e_0P@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aloZei10QXM1e_0P@vaman>
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:468::22)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOP286MB7730:EE_|TY7P286MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a0b046-66a1-4acb-2e72-08dee42e7952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uX+3ZapS3bF1DgbN2NjuPYfw/hhalIgAfzkQ7h57KSzLI8FJIfs8e1LXkgDYl6VUlLo7u50mAHlqkTbDff12bumjQnDkQAhQRHQResPsYSXUoLmCwDk3f2CRQhTQlRlc4cvH+o+sp/1gh4V5OGWO5Rze1kmaV/aUgywsqrFSu17gdaGwnd2lFUHRaQGow+bsueiLOyJRKSqUjcOquEz72snnLDJMeHC9kuACGL3UUW5n4UwsOUUi+Xdb8n3ORypfGn/cPGKFE9qi4G+jI04uwOmaPdWJXITw+K9tfR3EgIw6q8uMbRlkU0tT2BEleh5NrlIA/VpQvhcM8NH80pFbew0QtD+VPWCJG/f5tdWv/88A7UjKvEEaF4b6kglgY6QKKzgZhMQfMbW443TFvlPB/lWef11OQo+mW3rFEwDgF+uG6HRw86vKcn3tBIRD7HJ8H748Jid++shsWfQ5PIg7E3ZW89ilZku74ZRzXgk2MZSl+XHUFFug1/huLf5/KDqIQ/dsH7m37wBfbOOJOc0o/drTbCXzrQljC2V4pvUX5bvS/GBavDaKUBhu8wTKyVcAAoPl5ir8DbMR6w81s7Z+NHnM6qcVO1SLFSKTZscJO5s4kslyHiaggGCBILhK+9UpqmoPn0moCLGP9XJZwqXtgSrdSOw7BB6v3bHQDJ54HTU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FJ4oBSyLOnTsxgByms0Xr2IQrMIoRty7hgLotbTYoCcV3HgkP78FH4PJFOOJ?=
 =?us-ascii?Q?3DPtwgbCRtq4ptTlgXNv8G1TH5av5B5bmFy4hHKGSoWL4hXxrjC6DSv6GH6h?=
 =?us-ascii?Q?ekRmpUD2zPKWQgsxg6ITOuMd7+sODd1BAI0VQCcsCy5XlnUN6XxVp/uvfGZR?=
 =?us-ascii?Q?EeuWtxRLz6v2l1eA3iUdYnjRP3ypFOJF9dONJEecvFTNlt9BvJ/u9Xt8SjkN?=
 =?us-ascii?Q?7L+NyAirWK0cHJSZRRKBh/AIfC7OYyi7jxkG1kKaQDOXRwyhKNrs96C4PV9Z?=
 =?us-ascii?Q?ofOFgqUq4kQLoaKzo+hjdmAtgcMKGqK+BNIqhYwZVmAmf0RXZX4Ub9ahWPBs?=
 =?us-ascii?Q?EV/WuAa/u0JP+8rWcEPDGpa7Sn9lwVrwz5ohD/dr00FC491xH2QHn0/zjVvO?=
 =?us-ascii?Q?6dMbgVXUH6QPdSqkAelsObV5rgHT7ND8rYiWcsaszEooxEtGogivl9pIErls?=
 =?us-ascii?Q?pbyqExp36DqXsLMTdlLfmxUzZid1TwDUkQOiDaUAYUIeuAsgQ7cOsax6uDoX?=
 =?us-ascii?Q?/EWv7vCUVoFR7wxo2IGRUrgb6VMh8FcUzHql7UozlwQwDVeHjlnHWma+B3XP?=
 =?us-ascii?Q?logj2BdqXby7s9o0xLVyjTj5RXA/P3OwghLOnieh5t7nxuIJKx7uZfJ2orON?=
 =?us-ascii?Q?TaJi53P0Vm1T53HUGf/DkiB123/BuVCRTxRIllOdFol9WhWBPR8mbnkissqF?=
 =?us-ascii?Q?jgMTyGEVorL++T8pvr6XOjJTWTyAGZYBsqYrPiQ/P0+ZAZsBM0noBV7LzISY?=
 =?us-ascii?Q?0iSsGV19GhOTpAVchdKnRkvR1ZSFeNOdtRi9gdOJ7DGsOMA3aCyYAa+l0p0O?=
 =?us-ascii?Q?Jnz9ioNwjxHCYOZr+uBttTGseuUKS7vfmoX25kpuMr3Pi536U4Pg7SGIU4mz?=
 =?us-ascii?Q?PriFpu50kJVMx0UNI9AlsapdOl+5BlHFLXl6zmHTD2DUpxR8Bz2uUpK99z2N?=
 =?us-ascii?Q?0x1LU1RlB/JAow195eHeAAoWqlK5LUjjMfo+l3MiWcZaI/wdatazKCpuHMoT?=
 =?us-ascii?Q?5kRRbPFcRkGH/jc2dnJV4bzyzdKCPTytx1XvbTinNGJ0s/sflg5V6D3IdqeX?=
 =?us-ascii?Q?CAMmiQn8vsaA3QxR01gfBxTT5IevN/iWhECTihq7U1e+yM4RvJcvGkML3wbZ?=
 =?us-ascii?Q?SlZHb1XTGhq0wxvaYlOiNURf0uf0Nrqn+dQdfVAbSyk8R0v77bPJPTiZoz2S?=
 =?us-ascii?Q?O8ugvKxZMFG0rcEmtfAdWnrPw+hSHfB9lL7D0VApjexKJ1YCn49W7f5ba1AI?=
 =?us-ascii?Q?UUZ0TcZCDgFgZ7btXr/TbTn115NkrLW0m5HOPf/BdMibDI6DdOo92Cv67Q0G?=
 =?us-ascii?Q?VgUiVZ7c7mOqzlBGRbLiJP49126T6Zi3BE/6wmMmbzCA/Z2aEais/w+LwHqw?=
 =?us-ascii?Q?V8ppVAzGjokfT+zmwnYBMuqZmftD5YZqevHNUVuwehcSNpjEzOZF7aDJm7o0?=
 =?us-ascii?Q?gQc4C7m+SM7Rfz8jPgF+wJqoiqz0gQS2LF7LO1IGWx0CCT7i4m8AoWDoeKhM?=
 =?us-ascii?Q?R22fSqjfjV/qJHruH29UK9/eH4VoO5Bsl6MffnUTu6QSbSDGrOLS6hU9mZcH?=
 =?us-ascii?Q?hEd+mHyEjJ4y89x3MnuSffNjFBeAGEOop6u8qEsNEqmAsMVZMMzGigw3b7Mt?=
 =?us-ascii?Q?P2ZvLsuDIJbovd1cIEh2IExTk9mPxBeTNvNPNqxpiKIMOl8gYPfpUoXj7nGo?=
 =?us-ascii?Q?QiOSix4lNfVnqr9jnAytplo0wQf0OvzJ9eSLXf9RxqkG8jmk7sWu/PPNFo9O?=
 =?us-ascii?Q?LFyC9SD8TZ3XEiYbrwwaYC+MBw/202R8yq25Ewymn1uxam5zj9ly?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a0b046-66a1-4acb-2e72-08dee42e7952
X-MS-Exchange-CrossTenant-AuthSource: OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:08:58.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrHF1RiT3au0ptqKis1ZUOdzipbokQtlOq7mdcbiJo7mlR8YegMB9o7EOFESQ4NHKq1WZOJ2/iSaeJT40Sp50A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6785

On Fri, Jul 17, 2026 at 05:30:58PM +0530, Vinod Koul wrote:
> On 17-07-26, 00:24, Koichiro Den wrote:
> > Hi,
> > 
> > This series collects dw-edma fixes and interrupt-path groundwork, mostly
> > split from v1 of the "Support dynamic LL appends" series.
> > 
> > Most v4 changes address review feedback from Frank and Sashiko. I also
> > collected Frank's Reviewed-by tags.
> > 
> >   v3: https://lore.kernel.org/r/20260715175740.1110404-1-den@valinux.co.jp/
> >   v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
> >  (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)
> > 
> > Rebased on the latest dmaengine/fixes:
> > commit 867621ba2030 ("dmaengine: qcom: bam_dma: Fix command element mask
> >                       field for BAM v1.6.0+")
> 
> Can you rebase this on next. Yes there are fixes but there are updates
> as well, so rather than splitting I would prefer they go via next
> It does not apply on next for me

Sure, I just sent v5:
https://lore.kernel.org/r/20260717180639.2643243-1-den@valinux.co.jp/

Best regards,
Koichiro

> 
> -- 
> ~Vinod
