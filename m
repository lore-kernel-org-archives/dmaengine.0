Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B608488748;
	Tue,  1 Sep 2026 22:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301944; cv=fail; b=r+F74fcJd4lrLdnq0iF27hBiJuof+4/URvAxJ0KPoembUnH9BgHmoabFold39KmONqvbXPBbhNSoDBpO8NzIbrPdTEmFfX8d7Y9AJEOgZ/UkYxBbojIdOmtFFU+Z9U1eGqGmIEIb7KrPKXcdiTGG/Pml9zHPGhLtzDlYxpWhO0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301944; c=relaxed/simple;
	bh=R/L7q6dKuMJB+vZsMT80g59jf+ODdpTVX3jtJP4MpWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m+i3wYNNsxfvXJWCzywYce7AcEfgGj/4nmBmBcOfVN+4t4HALBUmWE+uKiOS4wxayPlHNYhvLg+Uiq9hIBbV+bcl6Y07BsuhOqpydpSmVxN/ftTKPof9OSdT4ykpPWWp1Q770XYuvcAiSVTSFAphNgHIebPN7VN3LD4JbZasBJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jCLf/GyF; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jCLf/GyF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwsQ/68VAXiwGYsKja2V2nOerWvZn2njr/wiuAcFjnvToFXQKRuS6Hy2/pWYJ7raJhNNK0AoZQlJsxjJhOzXtNip46gGogUm1hZ14t+5YCSnZTE2knmwj1RlvsZbqduOg0AWrWWrnibWiPQGY/Izt/9e8wNo6rVfOOsTUlpYC23Symn1/tkSfx1XoQg48AMAYZANrb3RgrUv3kSO8rM6QMDsfzrZNhBAsiqda+ueIVQrldNVNq2IVShuNKZm0tZPQIJVDfQarlTsSciEGG2fkfvvGKVmfXQVapxcQP1TH3Pm945mZYY/HfCjS5aLHSsijQ19KpEgHmXY5iabLWS70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8umoIOiHlq6O9MjF4d/G4aj42DX/gVwivjE+q65GRk=;
 b=Z/k6DV3/Eppbw08HzP6Uj9dXXDaLdrpUJidEgsbqW637h9lCxCRa38SRibmSMEHShR+tJ+Fl2BT6SOmRrmicicpLtoS0EwSHGstFInnQjs5DOfPWsavbRM0fuYMpIFWipuXir5NI/EfjuRyBFPbWNLLtUGsT95MvRdKiqk+xAiO4pMnx9x5URxrOzS4sG+NWWRF/KlsUk5MegJIWqVQUEzskOXtB3eJK8ka09yx2DnRYlsP6MIB0d0hJWArCZbeuTzsVY0jkjliv2uohozMDSuoSoH4QVG1Z+ngszNx71nPpPunuTq6WacdOezWov0tJhmWrJUKp0LZ19DwjpUtJIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8umoIOiHlq6O9MjF4d/G4aj42DX/gVwivjE+q65GRk=;
 b=jCLf/GyFHBu9Cr5smwSf1EtTH9+sle+IJzxQGyFn0VGsx8mKYW6vYKy1dd6TL9tqbTEBMsN15u0vPx9XjijafHAw6GbhtArwH00EGWDvFvPYxMluueLzK+wurxduXs+q6wdLNoXhcFaLE0Esh1EdNbPuwX33r+23HpP5VhVdYpMlCB6hSckpH/QJp11YFoJSYyy6MlFMe9+4P6FWzger1D5vedPs53RSqOHkl+0Y+/xNbjojtefIG4ShkOmcLXToKYKN8vjeqVKY014P8CZg4syFcdrJwWCXvft4nuHb/n7R2OdxdYULCPh2bAKFhI64UBea9+eBNYh/GThMLn/Ygg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10080.eurprd04.prod.outlook.com (2603:10a6:150:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:32:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:32:16 +0000
Date: Tue, 1 Sep 2026 18:32:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/34] dmaengine: at_xdmac: move irq bottom half to
 dmaengine BH
Message-ID: <apdSaS3-dY6VNVdU@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYZPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:930:89::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10080:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e7ac3f-9439-4149-d06b-08df0878e051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jtUIV0z+6NWaYfLmV7R+7ExDovnd9FruWbnJgR5RQ2rYqHmEApdhPp5bdoAyl4DJOuAAyo6w5Z0NB88W4wzpaPBnC03vmq87aEk3/KLjPIH5WaK9/tzhop3/R2zbOKXvFFgExNeFNs8zrs1ifbOYMfwolhpLBE1H7fQAxFYTmdxq3L5veW/WkhlSCIG4IwNm9+1lsGjvmqnK2O7Ut4GjsdrrunB7qVeqeD0mXMH/VLgYwajWKzW+Hfi/eHDDQ54YnEPcILEJHcKFjQVYGVEA+lUp1ydWhcSA63cjAzbw9w1EmtGkGlMdyNL9ezXa3haBxtbp6QyDy9zdKOPGFDg9oRa6BMBD6ctOGvL2pBTGQpGHkeSqrnEUpkjSrYm5KhT00BqeJ24EZ33ZakOoeqV6RHFjQFEhh6xQJIfsvwyOPmcf8EQKe66qEyXj4gAVO1BJF71CMkFvCERdqd+lCKEeDZg/pM9jtXTROFC1Fl6jOCJKVN7xQ0HRqRvI5v6BxAzqlkgliJWVxzd540N48WVuV1Um5J/R18qzXfMxweadaKY/Xj4XgGPZKbzATjEwcVph2finMvseRjDNenRovJSjjgeYhiGmCZEwQmDhOJEzWYWHap+rcOPxlaOTqO2TXQABFgea+iPxwakHpIIEwTni++TzMwj5PbKIXspf65d/NAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9lPRFKNK87+IzuaMACKETry/FNTA/0PnRM49R4KIS1JCpCEZU/8Vcn9VTxqa?=
 =?us-ascii?Q?e3wisAaoxnrmACWhAM2i6YgYFpempX3v7EjlOeWl4JiTVbfR6lpTAhjxgfiU?=
 =?us-ascii?Q?i+dXkiLDgs+mBZ5++1TsEY6YRZwN9g5G6njy1lUqdrWxYqwcIRfB+63AqUjg?=
 =?us-ascii?Q?myR0I0aJli0wANl6Oflx8uzTpBc6dJwBZalYaIg1xLeL56m+YRvD+igjBGNp?=
 =?us-ascii?Q?21t0m5LLcXTVEov1uWLAkdRqSHjHn8O2ULix/p0ERTBtNSAQhoRAIInwF72Q?=
 =?us-ascii?Q?LMNKwg5n+FSAXzQlk3Jo/zpnJR+4IIxjBzCQ5FM59F1Oz6DF5S9YfY3lQS5S?=
 =?us-ascii?Q?u0bTJgC9XTg1hWGXY08l0j533EI7DlIdt+pAoIZql6dKoNuysqGk1dbU4D+L?=
 =?us-ascii?Q?nuzAbRT6Gff65untBab/soXGHHATyHRwEmPeOA06WIDr1T1L4QWgV3jqsyU5?=
 =?us-ascii?Q?s+L6wEsUytv9eRkLiTYS1dEls9oOC14vA3dxe52OQuzTo8BfqjP6MXOp5kPc?=
 =?us-ascii?Q?7HyBQu3juO/FWJgndS56L9AwBVDAyYWcYdlVZd5E2csj+CYruSu5foQk8it1?=
 =?us-ascii?Q?uUq+V5C49LuyLPuTqNYo6746FRGgknHPAt6VEDFPD2gkYI5Oz6REzDAxQ38X?=
 =?us-ascii?Q?KGxDiNUytBeGGgqWTJHGKjT71E7VF2y23hsFUhC0XA3SRgFzrvXXQt2bbHGX?=
 =?us-ascii?Q?YtJHoNPZiSe3Pd0Qsy7/g8A3Hd7DnSH1gEnip1anf6oqS5psFWFv2vgAQqyn?=
 =?us-ascii?Q?rr/MKFlpJmPMwrlxIFTmDry08iJmezSGQGzIX2tIHrTxsDQb2jm2H7CXPt8F?=
 =?us-ascii?Q?6EaylGBfF89rOrgu5+A9eahax+bztqGUwlVFnOb0E6hw3DNHjje/LrFemNNO?=
 =?us-ascii?Q?oEJDfSCuuqZwFm7hF+ROQieV+AuQC0s1SBX9ULVUSXA8gal91leqzXDBZFHh?=
 =?us-ascii?Q?pk2HcXw6yJq/r8v2UESYUZvfRkHbnQ6T3s88ureZ0F/6hCG1cAbS+to+hUT2?=
 =?us-ascii?Q?SeV5jKKfQi+sLVZk/kDPS4pzg0O4RCKdp5IziXImEYEK4aPRXxPjwSgsVh7E?=
 =?us-ascii?Q?Smiun+xxeZ5Gl09gTiEUGWmArgaF+90fJBN7QgXaqV/+UrX5E70hdyRLACMU?=
 =?us-ascii?Q?3ooOXTqrsg4I020gEW4zA8cj4wwlyXDkCsT88lQ+EiNOQWU6zWcAozjLVf0y?=
 =?us-ascii?Q?0l2MLH1bgKRkc0/YrQ4SKL3FF1TkZWpGOcqrzfSIByRz9Ekhm1YetYmnAroR?=
 =?us-ascii?Q?XdGTi6KQodyQym96BryY7hZjCKySChiAsGfdBF/Ocrez0T3u/E/uir06ZlrM?=
 =?us-ascii?Q?6h/HHMBI2DKbcbUeBYRH2AKbF6Axi7FH0GEHGopLKR7tMGfNA0Vg+Vq5kXYE?=
 =?us-ascii?Q?+dKcZlZ8b+58i07Z9daQb3dw1Qs6VVd/i5KZLyxpyIdsdcpIE37cTOhmyxw6?=
 =?us-ascii?Q?T4IAQYAiPzBdn/t27gsNMBrNMFBOLatzso65XERw0KiO2wb3DdBNJApQlP35?=
 =?us-ascii?Q?TpTyelzYmnp34fqlGH75NcDazOSApdNzy9ZILKpbKhL93l6gXN3hAn52KItM?=
 =?us-ascii?Q?w4B2KzHsUr8RI7N9+z/U0LJAUCCUmGiVw9fHU3gpPMoRx+44KDwZJzTA5vrA?=
 =?us-ascii?Q?T7xcGZlIXWEW/LJRRKqYDKSp7NbGg+g1q8t2MaNk+gTDqfjFFolj3H7ptMbN?=
 =?us-ascii?Q?Es9qFM/gwDgAF3D1J62OYdFEjkjjgz5OPqW+FqysRAxOhxXEg0las6NNkiwT?=
 =?us-ascii?Q?X0s1fzIjTL62pdyzzjSIRJMy5ROHoDLfn4JhdWuRcdzc9bGjuDDF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e7ac3f-9439-4149-d06b-08df0878e051
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:32:16.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qx1Z5q7GliGtvcQR9+rhVX0ePJzcl17h50vTFxGkBbldP8JthQx50Te9WJyqlQ513zWK8nSIl/0lN7b7v0vCmcST2b0a1ZEyTq7OWr53cUpkx9gL2+WzDqhbytcsDNlg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10080

On Mon, Aug 10, 2026 at 11:09:05AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/at_xdmac.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index 901971e8bae6..5a970f9f3831 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -228,7 +228,6 @@ struct at_xdmac_chan {
>  	u32				save_cndc;
>  	u32				irq_status;
>  	unsigned long			status;
> -	struct tasklet_struct		tasklet;
>  	struct dma_slave_config		sconfig;
>
>  	spinlock_t			lock;
> @@ -1759,9 +1758,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
>  	/* Then continue with usual descriptor management */
>  }
>
> -static void at_xdmac_tasklet(struct tasklet_struct *t)
> +static void at_xdmac_tasklet(struct dma_chan *chan)
>  {
> -	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
> +	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
>  	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
>  	struct at_xdmac_desc	*desc;
>  	struct dma_async_tx_descriptor *txd;
> @@ -1865,7 +1864,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
>  			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
>  				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
>
> -			tasklet_schedule(&atchan->tasklet);
> +			dmaengine_schedule_bh(&atchan->chan);
>  			ret = IRQ_HANDLED;
>  		}
>
> @@ -2317,7 +2316,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
>  		return PTR_ERR(atxdmac->clk);
>  	}
>
> -	/* Do not use dev res to prevent races with tasklet */
> +	/* Do not use devm resources to prevent races with the BH worker */
>  	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't request irq\n");
> @@ -2397,7 +2396,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
>  		spin_lock_init(&atchan->lock);
>  		INIT_LIST_HEAD(&atchan->xfers_list);
>  		INIT_LIST_HEAD(&atchan->free_descs_list);
> -		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
> +		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
>
>  		/* Clear pending interrupts. */
>  		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
> @@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
>  	for (i = 0; i < atxdmac->dma.chancnt; i++) {
>  		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
>
> -		tasklet_kill(&atchan->tasklet);
> +		dmaengine_kill_bh(&atchan->chan);
>  		at_xdmac_free_chan_resources(&atchan->chan);
>  	}
>  }
> --
> 2.43.0
>
