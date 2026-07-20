Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C3F43784C;
	Mon, 20 Jul 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563025; cv=fail; b=dquB3X6/AlA8NTSJjF1E+U3cOG/+Fn7+OEf2NYpupQoTvsxVPsazVeDymqTVaqJkmtOPwkGAtTuWZOvnb2R3zpac7rFqMKPE8GWVs2gZ4OyBntJFjDGk/LJbG0Va+HwJz7PMUqlTnGTp79Wz7rFFQMfsk98rQrvt0FpydiXGo+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563025; c=relaxed/simple;
	bh=5qvmVoWgZjxZX5DZbYMlsjagNuAVbcTm5yXpyWqlZMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pq4Le+qQffUHWn2PHNxa39FWW5g+XeyeDVer1aM1Pd60z5RloKqrb2rjLkTiERuUQwgDa3xEBI0ep+lJGp8SXaRfSty9oK3Az/MjChzw6Xp2j5cyQbe7cZeXzNIrA+cbEJiorD8s5uMbslMzL5NTTmeijn6aw5IoCVPdM9g80Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vUFtDnIi; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vUFtDnIi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQhC1Ks/N7I3/u2Uw2zjbBfmRphvAZ6jHzmX63/juUvVnDE2omto5qcpS82DK6ZMIIh+m5+GxiQXg2daDiXaLWXkxPoCcC6t6c85241f+Dp41lDUnmG/5DXGqarID6MsrbBoG+iGuD392NjGepCai06LEDUDpFP8zyEl84I5KbV2CxwQX1vVEJ7vInOvOZJJTnaJTDBo2QhNR/fRZR1hnOWqQErWeVGf0OSLNK9Nx5B7scA7WPYIxm/X3CqGxbFUV07a+DYerjX/uUZ1q4EMEm6rerUg81jh7Cwj8SmDgK/m/rLijumavFxVYkBkhiKOv/eUZYpgXl7z7fFuGAVKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIXKKt47sQjXj2ciR0S2j0Aj4L/H9IOZUojhciPOUns=;
 b=GKmqhAodRv/5XsluyGL+UrmKWirJV2CrDMsEnoMkQYeVtGCfZ2RDmppUd9MJbC8sfj62Kd3djj8k26ubAPae+4TuE9Lo7QdRwzM1vSsA13R/hl7cHntZ9gXF1INohWv3D0qX+I2ttJ6J0pE1T6AdOx6E2ENsF5h9WjJk9G4Lw9CW5MojWTvwxjv3HJ3j1uQSiPVp5WuGG3SiPwjLbCKN+aTzD4b/8rsAG+//WHrUZ90kNsBzpwr/v/kx9upIiVtZetWBOjaEIdBiy3phztzA1J5/k+GO7AESvI8nbetwmSyIxXwWs2OP6LBF6wFzUeMkBsmS0BH0i26Ob5163ONCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIXKKt47sQjXj2ciR0S2j0Aj4L/H9IOZUojhciPOUns=;
 b=vUFtDnIiorKnq8RGYYNPcuZFrBxdrhWbC/j1XGQ1AM3nRkOFXW08q0sJcCsI/fw/L+sXKnLrtiWL8uQD0/1Rr6SFPQPz23KuRDBhRyQR59sSVtkJAFqQ32TaqtaIMno2ey7VNMiY8ITPGCOpnaoSREbM4ORj3DofJbi45M7HcZ7IoIWY4a4jElSdEek+dtDYLr5ymjWRRcHFM5CZqkscnYsAzo4oZQUkIQgDA9H40ebiiu9akW4bbYMVBsxMBr9k/Fz8aYBg0DE3Abbe2vAem2ce3UMKmZcstui1C7FOIn50PwTH8SaEk8TeGFqegZVAB2WVTkCOgaSWbYFqKDjtgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:56:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:56:56 +0000
Date: Mon, 20 Jul 2026 11:56:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: avoid free_q underflow in
 free_chan_resources
Message-ID: <al5FQeQO3tVWezR-@lizhi-Precision-Tower-5810>
References: <20260718235227.385108-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718235227.385108-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: e32baf04-136d-4182-4a46-08dee677866d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ybmaXgEuI0y18JdMzz/NvJ2DypQltseUTPvRB8Umnel98ch+OMYu+82bTnmbTNAm56M/1GAha4j9dOQQ3bVKjMC7eD+MPS3G77hkm40S0L73Z2D577WTxWwCrbSzqPhN37h/nxEkqEoofVJM3N+MJ8UgeIbnF6sHXcMSdQUeCc54cvMDybmHICW3tv8Gn4rh1tNdhCbydVt0QSvCyb+gxksfX+C2Jk4mfTRKyPW89g4o9+fsU3NOU+iSVtkHuaBrvGDcDsU5Zxv9lYCQbXjHVXG22264XfsnuBpYRTHkzdOF2DKSSxal7eqypLXvHgrqX9/OreiHDwqrMax66UTl5G+/t7szTofmpUYzgtaEIOnDdbTFOPTJdaI5BtPR2Kbxsz8ox4kCheKe1l8VEew1ko5gYubs1UD1aQeeYsRpTUTZlEn0zBT80aNpwlLRhK8fYYKNCarB5Xk/TsS9fYGbYoquhpUndrcKDtIwuwl1MGIgDKLym0FCIrSJspybZZ+jf7QaqkA25aUMSTAgmH/xlpPpkXnJHgukn1ECoFx+T+591mZIvadQQoJoZYi+Ya0zSPcVsoQmGceDDeo6KyDJsfTp/ddoa8aO3pyHSsE+j/ZDTm4dY2LzmZCtdSYam405N6JaJ0T6jmwfsHlEOg1T9sTSQGFprVJqgdiNXVH984g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zXXiN3ipYVGbHCL5pimeVKnd/FA84mOXVA62s5narGip1RU/RSGBLkAfNqA1?=
 =?us-ascii?Q?cQgRxLR4SlEXVx2XG1nEckzlhvBv4+CnSdN80EkgfgZKxz4gTKxZGWeSg8nw?=
 =?us-ascii?Q?z3ifwXZR0kj3VmcnrnZra2L4cTRHQeGQt4vxHjeIJsO5A8eQjphJO4eikfwY?=
 =?us-ascii?Q?BAzl7VDiGOeYSeYgK/LWNsmj1dIXUqGg+5S50qCdWocMGGYBoIYIMDc772MK?=
 =?us-ascii?Q?zrk36OlmxcXuVMM+cQzKuFRD6XBwQn8UCZoMlsn7b8Dq44y66v9i/rS09XOX?=
 =?us-ascii?Q?NXKE8Z680jxlK1DTgOCkXA1HaGYehnThEoeEUQ+P9QSIxE3HuwZudNOTAOp9?=
 =?us-ascii?Q?dTKJ4Gze3nMguKIhbKI7ztVFiaP+/97clfItbz2bECaI8wxJO8ISvXp6eiGO?=
 =?us-ascii?Q?QEfERJHVrGH5m0T+cv7pv7U81xMX3zyU2lvNQIeNl38KdeRasNwxy2ySn9QW?=
 =?us-ascii?Q?3dVLUMXFC+CZEEJfiYkrrSbCOGctR88xiH62CdlnhfeL+EGKOY8PLpZNYc0V?=
 =?us-ascii?Q?drgULMqiqz+8ZLAzzSzDa0czx+ezcpOCtPZQqJ54X/oyot6iixDvXWi0YE/d?=
 =?us-ascii?Q?ktdfm6lnDszWvVpW4NLlJpo7rEJxXxJdiZ3N0JeuxezuGgvYwsYAeHXgT15u?=
 =?us-ascii?Q?dgKofJ0QuOO0PgPDwvk45evsYCysBS59gHuap/t4g+3VtJd09PdEOrfLmwdA?=
 =?us-ascii?Q?WBa6Kr96jn2NeZEUfnNUvwihg4RtmPLrDc4RhDxtJbmPemnHzLxbYF/+lb6D?=
 =?us-ascii?Q?UuDz5cqVrx5BzW2PBDsE0ORlX8wia9bb9wdLSiZSJTI4GUXoWH2VQ+iUy+kx?=
 =?us-ascii?Q?aiponf16kKauGw60M23uyTBtDQ3oHN3F0xm0VYDkygqRLAjvYATL1OPbGf2M?=
 =?us-ascii?Q?bxkd2SYiK1fc85bx/TUfx5H3do3W4a2RpnLh/LThk4NXNOf0RKBpab43nfv+?=
 =?us-ascii?Q?xJ8sKlP/svd9czLobf6tCnS1WvH54M/rRdPzHFw2G8IG//g0/XkMDRv1eeZU?=
 =?us-ascii?Q?cPLncknfwpk9UDBmQj+R88Qs1eB+z71wlTdzS+vrZvRx3OlNwkqMvdoRtDXj?=
 =?us-ascii?Q?FJe4Haa51I9tzK/O3mmLAFVeKkYrbdntsvANWbkeLIh29kYXqpTOq0UP4lu5?=
 =?us-ascii?Q?tl6EDqSnz9JaINA38gCsNF9U0TbJE2J1p1WNrjbrnZyxQ455dyG8M11d0PRL?=
 =?us-ascii?Q?/dtvwGZ/ijGJ+SFVKERjhEL1/Rp2rTkmt2awd1cjOqYK0GBEVXoXIqEYGGU9?=
 =?us-ascii?Q?OCjc+Aq9xOP/l+oNKEOnfa868vbvocqumhruokdlQCLK/ScRnz6pwd0U+K1x?=
 =?us-ascii?Q?Un3tw8BDbFNvEtU9SGcxoPDDBr5gOiAtJSK0PPmNSHopxOn0GfigwIA8iKFO?=
 =?us-ascii?Q?SgxxCnpQjTnd/4hzmYJ1GKKKj4KpBaGZI/+pzNl2sUAdsHHqluB3dmn+4fqs?=
 =?us-ascii?Q?0Fg1WCAZZH2qAHll0GuEMJ6ACwnAMtIYVeg1NgYnPonqF/lA5fZCShdrbyqz?=
 =?us-ascii?Q?TlsSEb4pMS0+kftED8MQgUGDVNSGCa3mc/wA5RpX/i1N/Ht2aLkxcjt3ZBAa?=
 =?us-ascii?Q?FozAY46XGrhkEHrLclrEIvWAoKLP3YCJy8A6Pep1itZqxEBNfm74BO6yp3M0?=
 =?us-ascii?Q?fw7l7ZcjpcTXB0IKof9zz7zwTYTwtHGHN4z6bC6JHJe9SOmnE3oqXV09yZDr?=
 =?us-ascii?Q?UvVIKuE2IbVV5vA90x3/cv+J5GPFltj3hf0O40sX6U593Bi8UrReY3YV/E+6?=
 =?us-ascii?Q?jdwbzvsS5A4GlxLSVPepIl0bgyp7OoJdwijYsNPHMEWgq4bRwAkp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32baf04-136d-4182-4a46-08dee677866d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:56:56.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgpTaf1nki3up8FvGK6+TvLk1LG3I3og1Z46BZJidDww+qzX7fBOPMcEPX/7EWAWb9b2ODTb8QJndasoc6mC8ilsg+srTsU/4wqriA185UCeAsHyEe96UzUDe1vYt5jh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600

On Sat, Jul 18, 2026 at 04:52:27PM -0700, Rosen Penev wrote:
> fsl_re_free_chan_resources() loops alloc_count times calling
> list_first_entry() on free_q without checking whether the list still
> has entries. If descriptors remain un-acked or pending in submit_q /
> active_q / ack_q when the channel resources are freed, free_q becomes
> smaller than alloc_count and list_first_entry() returns the list head,
> causing list_del() to corrupt the list head and dereference a bogus
> pointer.
>
> Walk free_q with list_for_each_entry_safe() until it is empty,
> decrementing alloc_count per freed descriptor, instead of relying on
> the alloc_count count.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 30aaca81d855..db86f3e4e460 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -614,18 +614,15 @@ static int fsl_re_alloc_chan_resources(struct dma_chan *chan)
>  static void fsl_re_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct fsl_re_chan *re_chan;
> -	struct fsl_re_desc *desc;
> +	struct fsl_re_desc *desc, *_desc;
>
>  	re_chan = container_of(chan, struct fsl_re_chan, chan);
> -	while (re_chan->alloc_count--) {
> -		desc = list_first_entry(&re_chan->free_q,
> -					struct fsl_re_desc,
> -					node);
> -
> +	list_for_each_entry_safe(desc, _desc, &re_chan->free_q, node) {
>  		list_del(&desc->node);
>  		dma_pool_free(re_chan->re_dev->cf_desc_pool, desc->cf_addr,
>  			      desc->cf_paddr);
>  		kfree(desc);
> +		re_chan->alloc_count--;
>  	}
>
>  	if (!list_empty(&re_chan->free_q))
> --
> 2.55.0
>
