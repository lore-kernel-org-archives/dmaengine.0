Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792443687;
	b=uihH08eSd7TC2a+p9lip34IFkvQ99/sCOiuU0kmx/3Dbv6x2rAsA0bmsZwdb2cgTMfrg
	 jWkwS5jbniGPeaMLoxBUGuVBY7us7wcHAAzMpBGvyVFo/dalwojVV3wKiXslnQ2C2NO7R
	 kaB+c1mlF3mtU8AwCUrelz/ry8ReTKRxDVYilmhYJFOQrbneW0H+TR+IBCD1kNkjtQkHL
	 zODduhzwRzs0JL1bdX3VQznEbE+pqDfXynNu6PMxm0sO2DhdfG91mKDrYjve9/VhzBMsN
	 bzk5MUz9mYMYgVYGDt46TlNkEHSaaCVUGl54aDvfHSRLirq9nVOLrOCxfRmDb/juVZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443687;
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
	bh=O5sU4mbAV9wmgoqRwzc/JMHHiOlH0VK8wQiIZnz272w=;
	b=vGuiixuma9CtYtFZWWBazpj/7IJ9XwSejKtj1wJj8a5ai0ocoegnQYLUWMh1bGjQDikO
	 Yw3xQZkw/sXcF8tby5bflIYxZ7ImS1tDvEQUcyPtKpW//HMBSwG54ZnDQDBg8rQsBZMaZ
	 pxzVslxRYAUpZpZTBzQetCTSpcKv2rG8lnD6WaJzetJI2/X6GAi0N1z2ToTlYwVHG8tUH
	 wx9PNUDMqSRiSEvCcvcY+ISiXW9LG4fcFKJkVAdI1xMzmooer73lpdN+cItLbQ7IuMo9M
	 yHOHWzMFfItcqEqFAoNypzKa4ZuUFa19yfoSH1tWcgCndA+CbfvEiFQTPE/bgWCZjBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="wXkq/qXN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.61
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F124606A31A;
	Mon, 19 Oct 2026 21:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F124606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wXkq/qXN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYSlieKZRBFl9zInU2cygmxxHpwXaTp07knniWNIJW3vW1WzkwRJBkaIn7VHtptSQhU9tUFGcmC7k/upmpFtEkby58vTrEcoqI97q3RY0RVRqT5ubqxXeo6xXYunv5q0FDPRgvymmwXKmSZWQeZFQzDrXMf+bl1pcmO/TW7c0/iNa5DNSbphOnIAKphwQZyeO3UB1FsWbDE0tvpeAPmiX6O9K8Ijb1IVZsuSTwH5C8bTEvsqRCZ+YpcuROZ6Fs3vu9nCBkb0P2ZtZqEsJ2dqXqfMKQYUmtETev4B9eAHbVM95yCpGBwIKA2XqGxS2tBQFYkhWkxdDIHpxqu10wLiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5sU4mbAV9wmgoqRwzc/JMHHiOlH0VK8wQiIZnz272w=;
 b=thwcjSZF2YnO4vEXJlSzG1hCqXHKbBrD1MnERDLn2+r/LxnSchjuwchqnhHIIWw2sAbZ3Dn7P6KMUUj+hVIzRX8d5ZEasW6c6euqsoO1TPjZZlWq5vfvcKbzJcSdqieKSzk52zvBT+/bgyd4SdgE6uh/ysab2ix3G9oBfv+yoGCJPGK9F5ghVft1+baGRPrrdHak07KvKDknQ19qAPPgYB0Nr0SpoZYV7DYV6liMhdV66HLRfyPTHlVuEmgPnxzkT/InwQ/TI7/EVMWVXOFumdx7aca1qU5jjS0LiOqrmfJeHv4zrmeKg94rGkXTn772osZHYHDdvGHVduErUB96Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5sU4mbAV9wmgoqRwzc/JMHHiOlH0VK8wQiIZnz272w=;
 b=wXkq/qXNdr92+Hr0eqHbfsA4HfbTk182PtDX4tft0hU5TPDR1JjXN4bBmZ89tzV8/bRO/IEN864X5TG/xrI7tIb8tkidDaT5BrmvRJNxN3kSQ3ZAvbi9HYdrOVFwdiqQEGZYEeahUJw3QvzqZE7tqcctwhwxOXlmv9IRLXHx0S7YN4J5HSLGYtoB0hZjWOodAOTXmkNqIMPAten8aT37ZI8RURSlV/jqDUoDJVnr/f7OYxjGxJ3meyDQFOxg8AwC8/EuI7r+Vf3rmwMeYx3MXQwdWKGI33SLWHE4XtBD3zLr7F73ko+yWdVjDbtKmt4oS0JTlEPKqC8e5kXjLJcKig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10605.eurprd04.prod.outlook.com (2603:10a6:150:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Mon, 19 Oct
 2026 21:01:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 21:01:23 +0000
Date: Mon, 19 Oct 2026 16:01:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Dan Williams <djbw@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dmatest: make wait parameter reads
 interruptible
Message-ID: <ataFGmkPoDIYMX3j@SMW015318>
References: <20261018175606.38045-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018175606.38045-1-kmehltretter@gmail.com>
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10605:EE_
X-MS-Office365-Filtering-Correlation-Id: 759226e7-245d-4497-a1c6-08df2e2421a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|6133799003|18002099003|10067099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Nf34v1dnEMN/1yLA8SpA6Hb4n/poAUN/080ETxVZnhAyXU52qqK/pUmdztYIXOZR3YBD5Mrzjh/zWb4tLtSnB7lJceLQ+7xBwoBRtqWzXuhFPonWaMTEZ4uUYQH99zrOSKNqxlNSpK0FkMhMxpXYtEeVZOqZNsFg89gAB+UQmUIWJS+uO6/dn3rH8wYQ29hWVJtiuuOVnjgxP3nm4FNqVT65D3a4r/FZGj7JA5mTAFOk5++wt/eT7wXWy7rrA1/gfxl47Fi4YG/zpPNkWA4FFa+wFB9sjcAKKpFcl6eZeP+iQvEz8wx/sH2mD5uPnk9c68LcZ2k29n5SETW6FYwSaQUjfUf1p90I6ZHaMoGahiQOpZ7Y8uEtg1NQWyesGSXEs4BEWGO0uS06udcC7VvDdnrumAufGCD0NiGBm9QYNptj8YFGY5mu83nlc83BkAlbllIaxm8kI5Sqy0r0AcvxGrDAVpMxNwwPGDv+U2mxfa7tbilAoRX1KE5AWDbLmUcVp0K9LNwVBQxS4pXN/DQbmn+O/vePdbQoMB7T5+u3kHULildigOVEV1TOLNky33NjNDYflU7P/MPwIFrHt2vr2UPIX4HFTiiN8SgPRfvpeVDtscOTYsJ3ObV1v0zd+os78dD2CCDZAQ7mSNz3BxGwkQkXEYdfTFJAzze2uqaNMqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ECh7BuTDwf+IrB6cUrZdiRZk37pR1t9WhvyQLG8vubHERS9KEL1DV5BsG/OW?=
 =?us-ascii?Q?EPZG0aqgbuEfX/GIducaWtrWG5O9spLvyDFJTVWQ8ac0OXmhoHgGLgeiPqzi?=
 =?us-ascii?Q?Cv9x3oxXtV7nfLJtDBQdUAekk5MetwL72z2J93+hC9sQkcIHLsDTyEZ1YJJA?=
 =?us-ascii?Q?f1iM1AVMW9KrbKX9kmnPiC/8IQyljVKiZbyaymBXHBWdxR4VQKdr9HwG3Wsq?=
 =?us-ascii?Q?atKAyziQEU6BCn5mYBreyGxsy4xCNOIv7/e5lD01Er8bFmCMjFAjpFqNZbnW?=
 =?us-ascii?Q?C9SSPWnmcsdOtbD/yQqkX6+p5k60wUiwT25AjMmzmwyxz9OGpnL0qG9RMg9f?=
 =?us-ascii?Q?P+7B1uEjALDRa30SoezHbl76sYD/OEy9zhHPF2UA4piyZF1JDDsKepArd56q?=
 =?us-ascii?Q?XNrsrxTfx+owMzv55OUtOcdTSBSQjUVQe60O5KJWgYLmk3ngqzeE3pXBNDaH?=
 =?us-ascii?Q?FYIGpN/CyWfCJkX122+53CMPbUhGePGLxnw5WETDf2tOSZUwR9WCzSXTxzHw?=
 =?us-ascii?Q?cRbbFl/l71+jsnJFfFLcLwkf1dFCIBVqNskqm8jLL4GkNA/LTx9Tv9WuC3Qx?=
 =?us-ascii?Q?cLKEI4sRGEaoqlPNXey4rLnqQeI7/syEyin30jq3TuA0jTToyq+NpWatfU2Q?=
 =?us-ascii?Q?VXSP0irccK81HbVbGR/lmvSwF+xrr9DOhsrLYHaZOzS/zYv/5TUmHrOtAtqc?=
 =?us-ascii?Q?jX9zJh6+/Zh1w7cwL57CuPg4giqs7pzdJ2Vv1XNNrTpNQSls4M4CnywxY45p?=
 =?us-ascii?Q?uLxacC18Hs8yWvG/MVq+aUDo3YVPV5K8FpZXcsnwWVAYaItHST8C9pxxs8XE?=
 =?us-ascii?Q?rffJpxKAcTvoeW0UZEuizICg/aM+DMw15Qiwbi/irmrdgecpY1+qVfop32k8?=
 =?us-ascii?Q?1ClqwurpvVnbuu9Jt7hSx+XvXD6V6aHMIG7gotRspaft54CN4ZbH5hvVFGT3?=
 =?us-ascii?Q?KoxRjjIizCYxAdXx9Knl9Lt8RtX532QdLzZvnF5Fi9060O86cj18CX0k5IFP?=
 =?us-ascii?Q?lHuzZM5AEliQ3k7x9g3otZWkscPk/Olpahs1ttt5QrBCNyHcCQ9FLr/g//iA?=
 =?us-ascii?Q?qH6/oe9Fd5frZfElj30epymxQt0p5MqNGp5qgBsgEyoKTEA+htivg2zce9XD?=
 =?us-ascii?Q?I1WNWDQh1TAAZCQ+wpMrzYrvnecelqdHrwDlYHL5PV0OZeA1sN/g0ANVWskR?=
 =?us-ascii?Q?QVT6VzZpQJPSS4tCP9HuMNkCaMkCpyDBM34l0PrTU00Q2TekTFz2fMb/jGKt?=
 =?us-ascii?Q?cPhQNPxF57K1Jxrz2vmXYbVZv5zT+5W2wGvOad3Acilr0+NMhuV3XOAQl6gf?=
 =?us-ascii?Q?lXVGrRd6LfGEhxqJRNr5wYGTmw/Ud405tRowas4kC2ZS9b36WqKEvijqlkGi?=
 =?us-ascii?Q?BHveASyYeSlSXR2fauD+jIUCSAn6nDOnfrCOLUZyDS9mSpx8H7XIv7TaOrxi?=
 =?us-ascii?Q?R56XqPvQbwXw09lWkxUjQe9wIyarMAbVp6XNZSiUZlv9qYYjF2tbidB6azkQ?=
 =?us-ascii?Q?+kR2i02oe+PFcfgT3MIWPeC7KYpMdYdeP0MM4IQ8jnh7krRLqCLsX0EdtA6k?=
 =?us-ascii?Q?8pFRKyf3nlLfyQ79IGQ3PBiL1AQd71xKO7Haw2Y9VLrxrpP/jM7ILD0L/W1k?=
 =?us-ascii?Q?ftLIuDDxfIWDRHBh8KfrNmRS+6EfDqc4FQiV1gA+F5ek8iDsbkMZpcsa0xms?=
 =?us-ascii?Q?Ij9FvhppR5ffdBUfECZxXHHh4Zf644DkuETkfjoXpdgjZKxoEV67x+jeIDFA?=
 =?us-ascii?Q?+LGfIFSDBhOC3UJ2QGVgB6TfRYDqH6QwmUvxcEh3n3JZIUGnqs/F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759226e7-245d-4497-a1c6-08df2e2421a0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 21:01:22.9902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fBGPJ1MQOVh+eIPE7RdDjClCMPTCmSHu7tBjRHOf4lWWloTnkEHTVnRmksHED7VbzFpJoTSra2Cv+YEuMoKkif7s2zGbL9njbNbdKPT3DsgnvDZHk5WXYXykMxbqN40
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10605

On Sun, Oct 18, 2026 at 07:56:06PM +0200, Karl Mehltretter wrote:
> Reading the wait parameter during a finite test uses wait_event(). The
> reader remains in uninterruptible sleep until all test threads finish.
> Long runs trigger the hung-task detector, and signals cannot stop the
> reader:
>
>   INFO: task cat:71690 blocked for more than 120 seconds.
>   Call trace:
>    dmatest_wait_get+0x17c/0x1d8 [dmatest]
>    param_attr_show+0x6c/0xb0
>
> Use wait_event_interruptible() and propagate the signal error so Ctrl-C
> and timeout can abort the sysfs read. The test threads continue
> independently.
>
> On a Raspberry Pi 500+ RP1 DMA channel, a script configured dmatest with
> 1 MiB buffers and two threads of 2,000 iterations each. The unpatched
> run completed all 4,000 tests without failures in 267 seconds, but
> emitted hung-task reports at 120 and 241 seconds.
>
> With the patch, the same 4,000 tests completed without failures in 269
> seconds and emitted no hung-task report. In a separate patched run,
> SIGTERM terminated the reader. Both test threads continued and completed
> all 200 tests without failures.
>
> Fixes: 2d88ce76eb98 ("dmatest: add a 'wait' parameter")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dmatest.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 2ae346939..7e6b6c446 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -287,9 +287,14 @@ static int dmatest_wait_get(char *val, const struct kernel_param *kp)
>  {
>  	struct dmatest_info *info = &test_info;
>  	struct dmatest_params *params = &info->params;
> +	int ret;
>
> -	if (params->iterations)
> -		wait_event(thread_wait, !is_threaded_test_run(info));
> +	if (params->iterations) {
> +		ret = wait_event_interruptible(thread_wait,
> +					       !is_threaded_test_run(info));
> +		if (ret)
> +			return ret;
> +	}
>  	wait = true;
>  	return param_get_bool(val, kp);
>  }
> --
> 2.39.5 (Apple Git-154)
>
