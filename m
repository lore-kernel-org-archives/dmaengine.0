Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63354F6483;
	Fri,  4 Sep 2026 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537596; cv=fail; b=FBvj7+6+7mzSzHCH/fwDLrtiD8fdy61yzzyEW3OU1AgkWDgafvRBuCNRy21bbmXOnqhvXuBlJXCOSPUYr57z34Cm2FAyHgxmtTjSmy6GMm4mxCsZuVVsdGtSTa0jeUbggl8LSUJKpEg+1DB4yDSTv+bkaKWbD/Qhkkz5x5MSVcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537596; c=relaxed/simple;
	bh=1q8Geng2a/A2iz4SpXgqrzKBXQfy8Qk/2i4rWKJgGC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ST8XG+3jRDp63a7TtfYkSGNb3WNJOoZib/6LcuXjhiT9+9Yk5ZI2lCvqCAA0dolaLdNt+rrnc8QPBfkob80M5mWOxs8QVB00VwOgMOBxPBmlylaFbdNF3jwJAc/38fsjfiMbSoW5YcCTZbD6CeRV4Z5Ezzbg8pic81o1x4UK/Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vNIix2zU; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vNIix2zU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGWq8SU3c/DdCwMzAuWla/W1PGX/1dFmlLpMjcg6Juu8VQswP32VV4Y3k1I0Fw214zrMiYKhrUJo1x5AWOBsiU8OX5/djo3ELEs9svVgyQS+1vXkNtPWl0ysfNzqazY2wd2buzaUa54DYrMoqMvpI/b0im914/0rEW5Qlm2qog0q9j1v0Kvc7u1LK1KUvYfqzTLLIPEH/FXxXzBSv5Kon8CvCPpMOyOqHP7Hu/oY1f8SsGU7/uzNgHhXpAgSejXtFxwMZHJLJO2z0S8qHZK3enmiU1roAUiVqd1i2AEJqykdxpqJGeGnq6htCcDXclSyB8cmrLqt/mdJHA1QnqqaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8/OEiF6Fn/TZXy7jha5tiwf9jbU4BeufkbuznCoZQw=;
 b=aAQsKjlEf9HzIG0Oue9W4fG6+SJ+v7ZjQk4YWu1KtBHYadrVlrFCZuHOqPgc/zFe8PzOby/6bAmTHgK1E9vNocWWMjzmXwU3JynGVyUZRuPUUjbRmGb7oNVq5Y8K0NfL+q59dNdOjQGkqqEDddlT7CBoXUO3628pkYnw4S6ycPQ58XWlSLKedXA97wnslevoC+j2S89/0iuecic2KFxgGobxcy8D8HHFTbywGstMN8EUmlEoknlq0rbl5EwUxFo8Afa4VeW01Kk+lmq830Kh403ZEBqbD8BlUV61V3bGlpPPMF7Fnux7J/SK3CvmQBBV47VD3Bya53/Qw6sJllRzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8/OEiF6Fn/TZXy7jha5tiwf9jbU4BeufkbuznCoZQw=;
 b=vNIix2zULmaQF0fUpTZ1qdbwbtDAjxkRIkKrtDaiZlIx3k8k5/Dvovf/w6E1AAizJLSQkDPQiGsBHYc9sL8LWap3be+uBq2eF4SLogs9hcTVVVeDtqtsN0qlm/+003rk2RLIkE7oPxZKv985okcB1t8vA8J3gK5ceVODKfnHsM58LSt09vb7V2ZB1OmI1q+0XS3T01g78wIS2oRYaawsrcrcmOA0sWA59G8necaXRClieN9Hktmuu3sBHIqH1BVrgUIvHjjUKVVbuk9jadRBIgFG/4wgp+BVJSQKICuhYCA1AGxPGk6evjvY9QuBE7VfFW+bMkgfXcSs6ZzeuorU9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11714.eurprd04.prod.outlook.com (2603:10a6:102:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:59:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:59:52 +0000
Date: Fri, 4 Sep 2026 11:59:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Kees Cook <kees@kernel.org>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 12/26] dmaengine: sh-rcar-dmac: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <aprq8PExjdkrVtZz@lizhi-Precision-Tower-5810>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-13-panchuang@vivo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709135846.97972-13-panchuang@vivo.com>
X-ClientProxiedBy: CYZPR19CA0004.namprd19.prod.outlook.com
 (2603:10b6:930:8e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2332caa3-7ff7-4997-7ee0-08df0a9d8e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BOMw4zFSx0dm3qbqeengHUGASS5xmvSiM/KY9HYysv4FOB+zkuIzoCGqarY4KDX8+TN4YLlAVX+ydI32dGJIDs4kIqc17GkTyreEO+vmr8hZbUcP/Ua38HRISqOam7ixzr1QBkzZDmLIEYXprF3H7JSnVK5DRfcDxKQj8XHR7jf4VvuPhsXEaSxNvnuvO0yXu0akOPKAnWF7nx10kF5TR6LFpYwAR0ZvPwEJSD3RclWOvSh1IZwgkcrAxnP7pj8hEQufJ+UPic/jJw28y46MGjdAqX7avn+dCSlja+umVHICEu5ar4FF38wPwo/csOsQVn+bp90EaF7vR8TFG+vmrhSTFj+mbZydvPLwMB5ZMKSxzXNZV2/aC4O6pm8lQqnTu+FqkptNx3bGOpiyi/qOKFf/V9HK+o++/iChTRxjrmUdq5iJq23WzsBaNOsA2Vg9LF5SUATl3yEBwdG2wT9al/cF6VFS28kZQwi4vZiJBl7tgMhV95MkAytY3/9hc5H6QgGfdmzTXp0aGGUuOsoH6qQVVSlvlvCvu7RTGtDBceXIM+igrivRe2UOCa2H7us4n9WmQ6jrn+hLgNTV0OGNVexXpw+LAnDzWxJdfzNzKQHex95bolkrRgIL5aC/wTjpZN4T8vKIKGxbpBWdem1UyY2Fh4FujZ66zvjOO1Mossg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ONL2YG6Vz7E6Fhl9ilRkaJ0WrfUsDAeG99oXyAMKQjBJuJuQ3U2sql+fgQLA?=
 =?us-ascii?Q?GE4zADbvbYkTEcj0jO5bzu3aGsyEvQ0MgPQW17snhrC4vK8pf5MPUO7Hwg6d?=
 =?us-ascii?Q?I4wEDxSUxIFPP5NJmbph0S0ADHYyh1VUmTbrAYx9UiRpzf5rOFtBrsV4nqmD?=
 =?us-ascii?Q?Tj2npGLDWPGdBO3FJpmbhoDCbBr/V8459waFx6ARpPceloasCt+MYmmUsyIQ?=
 =?us-ascii?Q?X3SZZXzxJN6RHllhJZqNudkKmg3obJ5fk6OIvolC9v4Kaakjw4equ7ZLGcQZ?=
 =?us-ascii?Q?/t4xyD7mj5CuCsOIyYWENNkQoLqNLwnMVvMESbtcMDihs3flA9omH2cNf4gt?=
 =?us-ascii?Q?WjOvFiIPRzQ1XzAvbnuDma3A5W0HVPOIbcNZk/ErpoDnQTpm2TJZKRPZj4M9?=
 =?us-ascii?Q?R3OU7HhjCFR9lENMuCkGGwM/wNq3JWM8O74eWwnFEPy8UjIMx/J8JXcpn/5H?=
 =?us-ascii?Q?MBiIQJSdukD81nw93BzdtokNuDpyDsvXrd4ZK2Zvk6JKO24MFdzUIs9DdqL3?=
 =?us-ascii?Q?xBGbrl90dmBbHLQreYHS52FjR/l3MPCeXWDus0lR2V/QJo3qGqGdpNFm6Qkq?=
 =?us-ascii?Q?AuFXEcIHe5fAWHiok/aEb9Kdz7Tqra7zUhWcvNhlvGlHlarRl3Zxo7x1yxvQ?=
 =?us-ascii?Q?vgFWq7y+CETzlEEZ4WKP0F3FbShaPNqeJ1TwbtpLAooxojxnyiGEer/NRnYM?=
 =?us-ascii?Q?2Ped8ld0IFGH4xba6lScy9J9MyuKGoDTIAA+TfZswxRgE5GHSKMMiVNq1eJ/?=
 =?us-ascii?Q?chy5p927wmKL2oaeeGpej15VYGECjw3s+6CW5+PDHUhR93p/Jhi5BPvfRDAb?=
 =?us-ascii?Q?KMxQx/lEsKuoB/jHkEE0HSjMSOPPwqI8AqLjQBgLY8wSPS0UlETxyZcpNSCU?=
 =?us-ascii?Q?CowH30x/yHPFkeVP7LdYDrQxnOuwvZeia65AKVtws4iXglKMdZu55T2AFfgk?=
 =?us-ascii?Q?WtjWB3HwPWn1uZXGiFP51V8y33AficYoZKCrFZFsVZ9cde77ReKYEpgLL4Ry?=
 =?us-ascii?Q?tU54EDE1lCkSFn6WRgD/eoyRJEqVYB1rFM5yTjiVUWZ/GgucSYPpfgHvXm3d?=
 =?us-ascii?Q?4cdYFFHgBQZJ83LNMmvrOovUVGEUqxpi/Phh2YnnGAyVCgUM3Xq2uFpFucUP?=
 =?us-ascii?Q?g50dLERE2S4rgDU2aUxolvsQb2O7PCpxe2/CFE5/JYElzMslWb9yoFr1Ypjo?=
 =?us-ascii?Q?taR6+kIj6NRjitbJTyC2SCsDBq1n7O+ohJ7hY8sTTGF1/9pfO5v12IPrV0C1?=
 =?us-ascii?Q?giFsxfcstW56+c/MZpHaLNSHf0XxB9aeTl4FXAyR4Rcci4mKOq73qfitFPtb?=
 =?us-ascii?Q?IsWAn0otvN8xFcjjr9ZiCrnXQQFP9Znav89rHJE4D3YM7YpPLKx/NO3UYqzX?=
 =?us-ascii?Q?t7xmPdSSeeYsy0Wrjoubce18r9QBVf6XjJWWfc0DYYZhh7Gw2t1gZaE2ag51?=
 =?us-ascii?Q?d8s2t9jNSWIEyOTmtuZKKHvUKJYJmonuvebSQMwF1Os2CqICK9UBicYqguXc?=
 =?us-ascii?Q?OITLYFymmpWrLg6FXgRn+fqiLnKMpK0Mn6Jw5NjjkrCAQNQMBUet3m0jbCri?=
 =?us-ascii?Q?pm+jgj1aF7sHR4MuXUGO5k5g1jMfNkHAovHx1CeJSlaNew00f+Hse3aC+3I3?=
 =?us-ascii?Q?qK5Bxz8YWlNiiXeLQi3boLL2sPBboJB+eNAB/hthuDE8Tei9r4wRV1G2xiEJ?=
 =?us-ascii?Q?Wwxvh6WwEr3/eQ5/OIkyx3rGS4/8wcxppNE48UESxMrPZQl2jLTBcXTEyPmm?=
 =?us-ascii?Q?x1i6tcB9lcOGiaMXck3NUbuo7R6QD2YeAdwQegeHfLdm9xPEuqkD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2332caa3-7ff7-4997-7ee0-08df0a9d8e0d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:59:52.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3gz/W3zSqNJQRCG9tR1bKVErhjdrR6SHggh7P4npppIjY+bmt4CSOgZxckpNwUCHFEHsOeY10QJaP38cr9KA+DJ4GI4Z/eQRlJcDJ1OA8sD2u4Y2kIpdD7csdXOa9kl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11714

On Thu, Jul 09, 2026 at 09:58:16PM +0800, Pan Chuang wrote:
> The devm_request_threaded_irq() now automatically logs detailed error
> messages on failure. This eliminates the need for driver-specific
> dev_err() and dev_err_probe() calls that previously printed generic
> messages.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sh/rcar-dmac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 44eab2d21d54..4cd7f0189bc7 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1793,11 +1793,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
>  					rcar_dmac_isr_channel,
>  					rcar_dmac_isr_channel_thread, 0,
>  					irqname, rchan);
> -	if (ret) {
> -		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n",
> -			rchan->irq, ret);
> +	if (ret)
>  		return ret;
> -	}
>
>  	return 0;
>  }
> --
> 2.34.1
>
