Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7937E5D0;
	Thu, 17 Sep 2026 03:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614987; cv=fail; b=Mx0fQ+neZhlln8ThVhQGMDKd47Rl1vyFP9B15YJSzPM5sYR8c5eUvjFHOsnNbqQaVrQLbWKAWb1MPXeDkw/ymtfXCSypZ1JUEFjQ8TMzNZta+BQIEq1i3VTVeA/cTaLtYWcFr13jMawue80yxIbNvNyI+yKdPXlBgZsLbYgpjH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614987; c=relaxed/simple;
	bh=tkROgtR5mOJtedmxSjpmpvKopej+u+WjoXCiTfe5koY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IZmOR+Jg+PopBc12VTXDryYog2azVOKMlKjcjA1gcoaYLaqX5fy5KobyH6FDgC9+XW9jSa2cn+3hmV5fiOcoYTWpHBghJnZSvbTz9skhUVmA5RhO5RT8lEIFIWFkEOBtxaE321hryiu3FPrZmUpJCp7Ob3zbvYE4g8JZLSK9TO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tEEpn9nC; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tEEpn9nC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL8tgYyEVl7p2WM1ScX/K5BiL4/qCh+3KRv7lNd1RN25xqzIxmoqSDM7GjTP8rv79eum3euWflVIpxFQlAKF3yDXRcxaTmam7uj/XDKfWEY4xybcCF8IaauhgoOwZFUZ6MZkoT68ABu6WvRmi0ik1uKeYCfip92JJsBsG33TukKC9BPMTtVtVKVPwAorjsnnYPwPJBRxHEiD3tJkAn31k+gLBuBGp5OvcFi391qwDAd119L5Kv6TmkK+xa4TYe4ylAB2g5GQi8G8cR7BGYq6J53sTyv7R0yNUk7XQY+ChASTNvGHIHS23OtNgXcSMjKy5bq7nYaRLEoPBdTwK+1ZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UZ9/JSlncUJapMhBRZg9AIREHKfq8e0Mb54CdmXCQs=;
 b=hy0LDdxbp/Hzyub4DfSGG3g+twNXuNifSK/8qCIo51MYnJDYjBfCpz/g19FgdFFGHPqtBjfqa5eDpxUHzgQ1jYiRVX96Pon2QfJw8rmhypj+WzzfZMI5f1OXGCy+eS2O/dQ8v9bQ1icomMsQOMn6EyPEg0U9vpO4VNINfHVGq/3HoZvJ+5q4HbOEvTqPq/ZswqB7tQ9hdKYqIPKzAheS+Df4NRg6cmGOKBXKxd06y6fXV0+kOXLRT6uYucCqBxWJHpJMTZ+E4pUTe6HBlt69RR2hEV4PZ5S/Y301/HlgOa1INUu5lM+wLEv2KlI9wFGyHvhXA/SMXR4cjNO1t1atZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UZ9/JSlncUJapMhBRZg9AIREHKfq8e0Mb54CdmXCQs=;
 b=tEEpn9nCoKJUK3462V0Xd3kVmldiRbm1OAhYNhnI3jzIZwBOu5hYmO9uSCL+ln+A5TMJIsCTxubswwKYbXR0HKQX79/bevomqgFVzuy3bXhixPYNohf6OcZI9v26TZidtATSJ9TnGZrgrHE6kFefjdWWtRfYftvJVxZDNmmreiPtKQDO2BJR1bXc1TuHr8HiD+FN+b8qcFoHPrkk1lT1QW4VNz4L0/vET8oUF71k1U34oRn8TTEYMDgCdCcVLuFuT3iWtupZH4pHhZWMk74R5bqACTpmNQ6QqjUQ7GdEzPPf/GpqIabHuSLxaaJM8kWgbzfmISper03BPNvXxj+2HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 03:16:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 03:16:22 +0000
Date: Wed, 16 Sep 2026 22:16:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv6] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Message-ID: <aqtbeqQUJkeirY6V@SMW015318>
References: <20260916230228.283615-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916230228.283615-1-rosenp@gmail.com>
X-ClientProxiedBy: CYZPR14CA0027.namprd14.prod.outlook.com
 (2603:10b6:930:a0::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea4ddec-5e40-475d-457b-08df146a0c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	wyt5YkBxATy9vSNqH/n2MRK2MxYIQ9fzoZcfKlagHQYkFYX8qC1z+2G6Xws3nKF/LoV9UfnAQh1hwWDfqaGlFzH8yaokyqS/zgygCFl17OVMe+NhNT0kotHqgN4GsPekDLMu2Q2MrICkiUzsobv5oelrOu2B+zFtZS28anor/9cq8AVnwDki8E2B2ifxL3PZHh0GBf0tpZMrSSXuzIymUsMWbAceL69S2UNNxPQRrBOfVma3agC1iUTOXLSvf5Kh7sn4LWE0cQfxBluyYKWSvh0qQlZk4URu5z6gM3vIbbr5P30ozXISxyIy13scqrJZpAfCTV5gZQDkkxa/he8io4XN3ztPy2cCjI7+oAYuRLFCsoDv5wgRd0JzVKQqZlq7tWMM5vF/+S15wY/2sdjwNfZOuGmtXuID45nK7ieGfaEnKYyizJ9XWTEr41m6QvfD3eBsZHEDTxC5FIhi7oCqHSW3l/mNzhkWEzBy+ZED52yZQFZlBfKTcLqt8xSjqjYE4HJxrTR9+3ysHj3eE11vf+9kC9RPc13poGYSeLmGZODT63SrhjCMO9GT2QK7oxQGQab7QIyKry8BwWx71UhQkxCBvQFLcETjUjH12YfzJwlIWu/OtmDC0bU+nF9NSRsvCdRbiVDdU4O6PGS6h/PW0Jn93cELF2Oavvuwe7AqNKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6vlFE9fIEz5MDniXJXcjDy4s7BioA1rLvWSPOpqHpfEkKJ+WAViL+LO97p3i?=
 =?us-ascii?Q?EubcBj9raY6LdlDeHOMRjzwAFb3gDUU6OQcq4Pjg+ijUWkuWzlF0fp7uixrS?=
 =?us-ascii?Q?W0optwmeBOyVBUm8lxGDu8lypSPyhOXa7AeowgMIGGeqpj0fCDi/srkMEv27?=
 =?us-ascii?Q?Ur/Nysz3usv5eIyAR3Ltmra73hxjIeaLsAFJb9WV56kAem8KPhyvXHxxr7kC?=
 =?us-ascii?Q?GKAiUEv9FQBQy3OFgF/M9A8RTXwaWHvoHq3+DFCDrJjamcq0+x50e8GtunyD?=
 =?us-ascii?Q?8KP+Eup9J5pgdSc91iyw5XuojswxWyYubVvWOZqac351x1fYKJ6zpbLsvXVF?=
 =?us-ascii?Q?vYHTrFkyO3X8rLSrJdjq6NbRTErMRFtbRRnrEiQUWDHm4U6Htx1rsqNvXbNQ?=
 =?us-ascii?Q?mRNOZYSW5BCFivQtjRpYjOP+m0E7QFb4jZ4k6q6AEW7ovhFD06+t6skGO7hE?=
 =?us-ascii?Q?4wA3guumbkFhE/1DmWWwpFoH+vpbO8tbjl/oJD3GGpC4i6dH49NV7AkkiFQz?=
 =?us-ascii?Q?6+7jNuAc1L9LZOVBUvY1uuaffGcwkCXh36/wtfY44giqHAaENhBZfiWBT20t?=
 =?us-ascii?Q?XwJklkx+f00vsGcLFNZn7ko1tpw9h+vUkf/mG5shGEN7+/HdGHBmDoMbjMCs?=
 =?us-ascii?Q?EUaS2kvZuVc+fevKco/ubYGvqRjd6mqMQIMJs7tKwWtU5QbYKujOXgovWmyP?=
 =?us-ascii?Q?9235vibkS/wxIgHMMmVAu0zgp7G9AwEy/ycxKwci9P2k7t2csxApZUFGm8R9?=
 =?us-ascii?Q?FCPvuMMPc9b5iNRs0CIOA+/PPtkyIb9+msijnhKru/xliAGwceAgYRNHdVVK?=
 =?us-ascii?Q?OXM8arz7A74aByoFulzJ+nAtZ4u6322Cg1XjP2vEp/RTP3My/pHfSreoDARh?=
 =?us-ascii?Q?S6YMATSWoSgf29US44kr7pySYX2MfcuX2CFBD633oIYtoDhpNEfpZYo18/Lx?=
 =?us-ascii?Q?kywYcUm+IYI4auORl0q+93L95xmmRAFrre4qvbJ8jiw2qPRgOWWAXmVu+SqY?=
 =?us-ascii?Q?gAs66E9f5xeHW4QfD5dONzq0DY+YrVZ/vuyc0Cce7D4tik79aU/PjzmNv78P?=
 =?us-ascii?Q?3W3bxJx/DiZHCkWFUHtAaV4JeK1THiTpjNcBPkeRNyqZLyqQ8wo2K1BjAIBN?=
 =?us-ascii?Q?chsLLz1IcpxLBlk0gjs0Gq+RNiEkKkdNjCC83Sz/NKCSPoRK/K6IC9dCGn5k?=
 =?us-ascii?Q?Fdwn6CTUO4+yNVAaUe/ZPpK5G+xx7S2slumeAooe82KEDWwpxkNGVrIlffhc?=
 =?us-ascii?Q?Ir9RgZAraR4IzF5n02Mdtm8pgFSkBulf3odmhGMYP25aLrFYm3wKuwTJYASC?=
 =?us-ascii?Q?Puv7D+R82R2Twn5ANc8w09g0GyGKbfOlOPak9MhBG2HEYTmn0yjf+ZXaGCqB?=
 =?us-ascii?Q?qvEz6UNa3svDCUYbQfiCKkag/jzeKMKRdr5rh3cw0A+4WFgx16e4z2V2482C?=
 =?us-ascii?Q?mUYDbRtjgwKPtgsMdWZ/teo1ku51EAM0qI/fzkYc61SsV4sJknrkfhEewh5x?=
 =?us-ascii?Q?4X04tJHV4X/9cm7QWKtNpLdB0TsLrb2Tvo2plLUnGGtRfvAWgfuj1Vv3/Q6d?=
 =?us-ascii?Q?j3PBrNz6ZawyQggp4JeUVN/PdwFFjBzCzwiFiL8Z/61LgiuPGonYytQiKPiQ?=
 =?us-ascii?Q?0QvIvTIWzjHxvyHtiLTeBKNHo6gbT5W3VK+3QzfbLkj90U0cP9exG9+wYjhB?=
 =?us-ascii?Q?OWHDOq/FA7hge2vuPLgxr+YCRdcFrpECLH6P0ccoEd3RHW6Sg/SnIo0QSD0n?=
 =?us-ascii?Q?tc6RHa763nxVC7Gkus722scIzvmmj+/ND6Z3yoadYhMvv4rloF42?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea4ddec-5e40-475d-457b-08df146a0c72
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 03:16:22.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C7FxXHQlBEcvK2+YRSr0Qr49mjTaA5hW8cdxZLG4IYD1LMxXp4qILeuKRqo0+AGhn4nu9XpXjZ7edpNUH/ji9G9uNIsyRWrSDeL4eDJR+NXrAyExiV0wkmfW4Wfa6qW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577

On Wed, Sep 16, 2026 at 04:02:28PM -0700, Rosen Penev wrote:
> fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
> unconditionally increments total_chans. When a channel fails to probe
> (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
> total_chans still advances, so fsl_re_remove_chan() later dereferences the
> NULL pointer during device removal.
>
> Check return value and only count successfully probed channels, and guard
> fsl_re_remove() against NULL entries.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v6: increment ridx before continue;
>  v5: put some stuff on one line for easier readability.
>  v4: use break;
>  v3: fix sashiko review
>  v2: fix description
>  drivers/dma/fsl_raid.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 9cc289f7129e..f059ff2e37f8 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -836,18 +836,30 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		}
>  		/* Find out the Job Rings present under each JQ */
>  		for_each_child_of_node(np, child) {

look like you need rebase, latest code

use for_each_compatible_node_scoped()

Frank
> -			rc = of_device_is_compatible(child,
> -					     "fsl,raideng-v1.0-job-ring");
> +			if (ridx >= FSL_RE_MAX_CHANS) {
> +				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				break;
> +			}
> +
> +			rc = of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring");
> +			if (!rc) {
> +				ridx++;
> +				continue;
> +			}
> +
> +			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
> +				ridx++;
> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;


>  		}
>  	}
>
> -	dma_async_device_register(dma_dev);
> -
> -	return 0;
> +	return dma_async_device_register(dma_dev);
>  }
>
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> @@ -872,7 +884,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
>
>  	/* Cleanup chan related memory areas */
>  	for (i = 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);
>
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);
> --
> 2.55.0
>
