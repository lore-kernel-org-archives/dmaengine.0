Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794938493;
	b=2LIE9pUmbhGOK1YxHqQryxeJhjVocSWMYTyT9e/DFtalUItRbvT6OBgnuqclQqlrBB1x
	 HfpVXRPkykaUE4nCN4aTlcOR5uZPtVjSSQxQIfuXc2mfpSoOuIqrKT3GcpVV0QUaAMwm9
	 QWgsbtJi1MDFBPsA0v3B2aVxOPk5CrWxtUrpjzvY4cQduqko6t/NKkEJyRlMF7G8iV3cK
	 FG2YfjCQ+khKNQDv3T6WMXPnwpvgaZZu6N/pAlVBwooAGEX1fs3/JofwoFIe5uyYBfNhX
	 EuDz/VcSFKj7UXF5Cd4siiZDTVXvH35IJ1PaYDDGbaE7YzYwJMySmc03WjdDWa1IyLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938493;
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
	bh=E+dQUfzznmJ3LEHhFWbwJfgBSJLL6ovvtZtr+wwRC+Q=;
	b=HIH6YlJ012srY1+cSDfFeLM858d6k6ZrZCrxrcGrF2xqh6Mr53v1Qw4ou01TY4k1u3Zi
	 vxc5/y+74FTvGDaKmKVe/QzfgiBI6tSWUvJiBstnTqK6lkN9N/LIfpB8Z36GlX+gGnaJR
	 haqqXbetT1JoA10PTFeKOE0SaqRd/MzVsSRikd97QqJCGehT1I//E39F5f+bhtQ/u6mlq
	 iH/wjH7dRkF1kPwMP/ovpxWOZ4K8irpuIhYIhCbehrhdLRmvCeBLnuD51DxvwI36+QuFQ
	 8i2IvV6tYrnqmSpKFp4n33wYQfHhUconXbLWCdqbuy9GP5RxmBX6Fjw/Z49KdgknKPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ExDvcD5K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.70
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3595606A32F;
	Tue, 17 Nov 2026 18:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3595606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ExDvcD5K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnQL9tMGx3Fy60+2Sm4WNng7dOidp9rQCDujrIXRyk38lZuyq57adp9e93tZBnfyHi4Vd3V372j13pdwo9HK2RIZW1+PjSzqyj9ZQmYGu2rhg3ytmjB7dootl30neeu1jSFADCp82AT84bhaKNVvKOTf/unWoHnVI2oNlDXTSTH5E2wjq4JPWiXwpW/e4lhOqSrhdg9HGYSZNZsEjfFoCSnA4Zz2VIMCLoVwINk1WdXY4f6n/QUB1ZSrC2bSs5bVCnv+GfERQzxl/1XLvsM+jliwTX/oU8Kbl+Uvv4NA6NnZaMwDM71bwA4DOZ9mXkqEAE6O5c9jgm0L/nF5z/TSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+dQUfzznmJ3LEHhFWbwJfgBSJLL6ovvtZtr+wwRC+Q=;
 b=SucNNt0Q9i2ztAsGnil6eFEAtBQw5sEqAyKVL9I6U+XccMM+Jm0RvF11f0dI148xwpIywc850tGhVlVDk6e25KfbbC2xldMBP8lnRRR2C24DMbqDw0GZK2F7siZmSlbY51p9S62xm4l/IEgkvp+YZqXu962JvRmIb5AGFN8DL0S/5WBTNcRsINtaRKWfoyYUepVkfJOlHYjoyH+UVIhZ9DnIiunjK8WdJlHySEnvMUO6CUs8UatWq6Xq9JaTqgHK5OjA2XBxGkXhoHdquqXsgO3X3emijOiX1uBU7+w+639wD6dcthhxI4OczxnUyCmS46V3lv8qNssIlBHxCOstMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+dQUfzznmJ3LEHhFWbwJfgBSJLL6ovvtZtr+wwRC+Q=;
 b=ExDvcD5KW1RrtgNRxjz+8dvzopg4HAnG1pM9vwpw7gKS4a+LwXJDt8QqwYlTKNWmF9mpFJ88m9f+/7ScmSWOcYSTykGPoZLGvvstcegXK3P8qf81IvdZcOhouFXEnV6sMrdl5PiM3/Iqn4C/euPpJUSBzWHh4l8/C7PRAF/Nywib2SL5Nbj1ue3+C4puBLTtGSE+Ba1ukPv31ibW/Sgs0bmycJE0bbGtgdPgRuYFOBg34wvYv9CWAip3XvUZZqlxEp1ng1J59TACIAw3HHkvgBYGJVF042xVRXGvCR/ventqPmvL8p7+QV1/PvuLyFJdN8DiA5Q+QKyPbgWIhdH+hQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PR3PR04MB7435.eurprd04.prod.outlook.com (2603:10a6:102:88::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:01:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:01:29 +0000
Date: Tue, 17 Nov 2026 13:01:21 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v4 2/4] dmaengine: ioatdma: convert per-channel sysfs to
 chan_groups
Message-ID: <avyWcZyBI6_s4BX-@lizhi-Precision-Tower-5810>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-3-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110173137.623764-3-logang@deltatee.com>
X-ClientProxiedBy: PH7PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:510:33d::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PR3PR04MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0b66a7-a615-4d75-e491-08df44d4ce45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|4143699003|261102123227099003|261028144727099003|261026140227099003|261022075727099003|261021121427099003|261022105027099003|261026121527099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DS2QSHzUQcw9EQ/ylgt7fy0/mffQTpLjMHKKI6fSeiZtHZcTlE1MfwN+SYQjsw9ieGuzlpqBQCnGvDkvrHT5svPYWN7/uQ+LRi9oFaZdOLK2VXJSv7NbG2gUXUtnW1Xf+hhd7RYLH7BOBmDsD3xJV8fs4XatOInMASOUMII4X/zw+kiqlEMjkE4O8qWB905bn3hp6T1O1XguHn7aZDT/TJamjrdWqYmDRugWv0yz/bKQpaO/EFmZCYKYow6ZAv9nBD8ERE+ZxVwy4O7qe/qu8J6iZzPIfsYH45a6pCB+FRBcqYi1CtnIoJRw57uGr5+M7MS7r/fLAOe0t0mGqbfCk/JWH+Ond4CjtOPmc14t8IL4e1CdMwKqVEfaOeGcjiBDCrichQuF5mve6vflgA/Rk1aFiYpwZBNiPHFhBmQGFV0UYBaS1BROqHAD/iTigobYwg8+OnOc/KyfkVVjNW6WPeMJ9/wRMNGmxf0negeDUlbzvb1IV27Nrk5h0Hy55H1y2RdCzsGAkiREYl2lQLFkP6QK1OWzdBa2EiYspT+6xSvfuAvo3M0RvIQLKFP5GHPkpg2j97p+GN1UpKJonU3OGtQpmoFMRdGjjKRqpg+8gQYklpfsaX+hzwQtHG2++HRP5e8kSES7ZvLv8nNWz0kyAsZuqeie62V4HD8EcS7EQyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ga97u77TmbaROK65noMSWHVhvwN/6ttg2d3UEhcL9t+pLdNo2JZusfNEu8YC?=
 =?us-ascii?Q?Hw23KI4PiV1x6Z26JT5fVsU2rm83n4EregZSj3P3l7pGMDM9jEQK9vdVDwgN?=
 =?us-ascii?Q?Lkk7d/NkORJrDWaZF3GOsxljtE4Rx8i+8t+vB8P+hW+GjKTGsnfP8oYIYTxU?=
 =?us-ascii?Q?uSK+nmixh+LfCSYxsBqAFLLfTnFhhLMoz4Q9zEa9AzmdZmubgmNkAJg3KJsa?=
 =?us-ascii?Q?y7Tso8OlqBiMzQoqPq6FaZyydYvik7XP7LxY3V1Cx8GMopeQgltBhFsipPon?=
 =?us-ascii?Q?YnAEkefg2SoNECFGDzx+vBVYidMITVYHYzuGYAp7j5sCSwVpaTf4iVx1J/o4?=
 =?us-ascii?Q?sAJh5EACwRTljYNaBpb0BwFcW1gr7TNht6w6DXUbE2Qe4QQ8uYYaZ8JACqsu?=
 =?us-ascii?Q?DCrDxRhi9JPKdi4dKkVVsldHuFkuZCFLshljRxz4+O1t0G8ffnG23nPaGQQ+?=
 =?us-ascii?Q?Nx6YMjHIoWWUqiwACCRH7JykZJ9OG4T4La6QFYri2clrGSar2rCOwq21s5fh?=
 =?us-ascii?Q?VK6NdJoiVglogeqR3uL+6R8iEfyfwb1f7cHQslJU14C+8fyByLr3zZVwPIks?=
 =?us-ascii?Q?RYZIiith8Y42ZMniZXgmiC9659LxPYWiSSwmyHc8DmePxYW37wH2foRbr6Tg?=
 =?us-ascii?Q?fx6E49iA6QKVM9yE/IxCwoRgSY03vkmqB8WSkxxDv4m73/iZd3j3q+ebderK?=
 =?us-ascii?Q?5VqDKDYqJiczh0wOBY0f7KXDaLaPbWltnnfh88x42nLj11OTKAMn5c/CHD1N?=
 =?us-ascii?Q?RTJvdTI1sB5XJ6Zts31wQTHLZplPq2GsqYmxW5atg3mg24D6quWvzPo0KQlF?=
 =?us-ascii?Q?Rwj7IEABeHok3yH3XWhpOGYlXvDIRcWdHoSwnwek+HQUYXWxLapZcQynZmoK?=
 =?us-ascii?Q?YndeQRzpMiwCoKfHACHjrfVSC5aMCp/6f5dK9DQp2UcfI1apXm0Pr5HDp3wC?=
 =?us-ascii?Q?2M1VTJZb6I5/hFFGyqWTUPUZlCGcYEqU6/ozrAfQf3CaAJ/omzrVAKkh3mv9?=
 =?us-ascii?Q?JdlFN5oeY8gg5CF0EL6WFS1izmoerEgZo3EEFqr28UZxUxmt5EfZESDh0i5o?=
 =?us-ascii?Q?R6tc32q0v4bZGT/oAAMOBBxK1/ZhEv+cvM6iYNM8R0wnBPIpS2ghsK/LV9xo?=
 =?us-ascii?Q?/8nNkjmgOuJkGgMxxS4EYxogGK/xsANSC9mnelNhBBfNKxETK74x7B/E0teW?=
 =?us-ascii?Q?nTE6stratPqgpfDw97IDXbo3qabEYjzRBGnKjkjU+JQzzFL6cc+jcM8YC/D/?=
 =?us-ascii?Q?3jcwZCkFWPXfVm+aV+A0IiM+vFxOKmpOeBiTRqk2B5i14tXR+cyjhodN7cho?=
 =?us-ascii?Q?9RSLcwpADedRFWZ4++lGKJJtgyqUx04vms6K8i/uuTxL9pRiFfHkB3nlieht?=
 =?us-ascii?Q?lCReLIIDMUmfRuXiYR4INE9ORLjp4/G7ZOfDoOMhpbBl2EVtARHCLofpNgbi?=
 =?us-ascii?Q?L0//RiKG3bmdzkI38lnMUIeSzaxYcWf2EDAriy5F+uiyuE8fjKzLYDtIy3MX?=
 =?us-ascii?Q?eugQPjWoKpepdualKic3qyy/sDj6jLhVGydsNQzVZpMNfYLm63fWlD90UQhW?=
 =?us-ascii?Q?Qtph2V4qTJtm4e5dY/f4snU32pXRIqBQBMmZLJSnssrqdlc9FM1YueBTkJsM?=
 =?us-ascii?Q?nTPn7KIMjaNa78G4yiofaKWKDsL0IuCHZAyFOhRPDj5xt7mpNjnhKXqcnSin?=
 =?us-ascii?Q?NuaNetYId0R1l87NuQNNOyJXkHqp65SxCZiKx1vFJd42RLIUGzRnazvInbwq?=
 =?us-ascii?Q?P8xmDyOdFtn8JSJoE7IZLfKga3Hzv5GymQd7sCYOqBGIaZ6bdxJk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0b66a7-a615-4d75-e491-08df44d4ce45
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:01:29.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlJ5JHO+fo0z7E+rsiSzxMAA8jvgtfb6DYiGLwtzVSi34OVQKdXz57LOsYyjOkVbprsI7aEH1GRW1p3PKUAGNbWmDTMyJGErY6OJP4vFyNlQrhh/G+vq1B6neCrDhaxZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7435

On Tue, Nov 10, 2026 at 11:31:34AM -0600, Logan Gunthorpe wrote:
> Use the new dma_device.chan_groups mechanism to add ioat's "quickdata"
> per-channel attributes directly to the channel's existing struct
> device, instead of a second, separately managed kobject
> (ioat_ktype/ioat_kobject_add()/ioat_kobject_del()).
>
> Each show()/store() now recovers the struct dma_chan via
> dev_to_dma_chan() under dma_list_mutex, the same safe pattern already
> used by the core attributes, returning -ENODEV once the channel has
> been unregistered rather than reading it after the fact.
>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ioat/dma.h   |   6 +-
>  drivers/dma/ioat/init.c  |   5 +-
>  drivers/dma/ioat/sysfs.c | 166 +++++++++++++++------------------------
>  3 files changed, 67 insertions(+), 110 deletions(-)
>
> diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
> index e8a880f338c6..d36cc2df74ea 100644
> --- a/drivers/dma/ioat/dma.h
> +++ b/drivers/dma/ioat/dma.h
> @@ -103,7 +103,6 @@ struct ioatdma_chan {
>  	#define IOAT_CHAN_DOWN 0
>  	#define IOAT_COMPLETION_ACK 1
>  	#define IOAT_RESET_PENDING 2
> -	#define IOAT_KOBJ_INIT_FAIL 3
>  	#define IOAT_RUN 5
>  	#define IOAT_CHAN_ACTIVE 6
>  	struct timer_list timer;
> @@ -112,7 +111,6 @@ struct ioatdma_chan {
>  	dma_addr_t completion_dma;
>  	u64 *completion;
>  	struct tasklet_struct cleanup_task;
> -	struct kobject kobj;
>
>  /* ioat v2 / v3 channel attributes
>   * @xfercap_log; log2 of channel max transfer length (for fast division)
> @@ -190,7 +188,7 @@ struct ioat_ring_ent {
>  };
>
>  extern int ioat_pending_level;
> -extern const struct kobj_type ioat_ktype;
> +extern const struct attribute_group *ioat_groups[];
>  extern struct kmem_cache *ioat_cache;
>  extern struct kmem_cache *ioat_sed_cache;
>
> @@ -393,8 +391,6 @@ void ioat_issue_pending(struct dma_chan *chan);
>  /* IOAT Init functions */
>  bool is_bwd_ioat(struct pci_dev *pdev);
>  struct dca_provider *ioat_dca_init(struct pci_dev *pdev, void __iomem *iobase);
> -void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type);
> -void ioat_kobject_del(struct ioatdma_device *ioat_dma);
>  int ioat_dma_setup_interrupts(struct ioatdma_device *ioat_dma);
>  void ioat_stop(struct ioatdma_chan *ioat_chan);
>  #endif /* IOATDMA_H */
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index a57024c4b066..984078920c2b 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -541,8 +541,6 @@ static void ioat_dma_remove(struct ioatdma_device *ioat_dma)
>
>  	ioat_disable_interrupts(ioat_dma);
>
> -	ioat_kobject_del(ioat_dma);
> -
>  	dma_async_device_unregister(dma);
>  }
>
> @@ -1185,12 +1183,11 @@ static int ioat3_dma_probe(struct ioatdma_device *ioat_dma, int dca)
>  		goto err_disable_interrupts;
>  	}
>
> +	dma->chan_groups = ioat_groups;
>  	err = dma_async_device_register(&ioat_dma->dma_dev);
>  	if (err)
>  		goto err_disable_interrupts;
>
> -	ioat_kobject_add(ioat_dma, &ioat_ktype);
> -
>  	if (dca)
>  		ioat_dma->dca = ioat_dca_init(pdev, ioat_dma->reg_base);
>
> diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
> index 976134df8108..9bdc0fbf7696 100644
> --- a/drivers/dma/ioat/sysfs.c
> +++ b/drivers/dma/ioat/sysfs.c
> @@ -14,134 +14,95 @@
>
>  #include "../dmaengine.h"
>
> -struct ioat_sysfs_entry {
> -	struct attribute attr;
> -	ssize_t (*show)(struct dma_chan *, char *);
> -	ssize_t (*store)(struct dma_chan *, const char *, size_t);
> -};
> -
> -static ssize_t cap_show(struct dma_chan *c, char *page)
> +static ssize_t cap_show(struct device *dev, struct device_attribute *attr,
> +			char *page)
>  {
> -	struct dma_device *dma = c->device;
> +	struct dma_device *dma;
>
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	dma = c->device;
>  	return sysfs_emit(page, "copy%s%s%s%s%s\n",
>  		dma_has_cap(DMA_PQ, dma->cap_mask) ? " pq" : "",
>  		dma_has_cap(DMA_PQ_VAL, dma->cap_mask) ? " pq_val" : "",
>  		dma_has_cap(DMA_XOR, dma->cap_mask) ? " xor" : "",
>  		dma_has_cap(DMA_XOR_VAL, dma->cap_mask) ? " xor_val" : "",
>  		dma_has_cap(DMA_INTERRUPT, dma->cap_mask) ? " intr" : "");
> -
>  }
> -static const struct ioat_sysfs_entry ioat_cap_attr = __ATTR_RO(cap);
> +static DEVICE_ATTR_RO(cap);
>
> -static ssize_t version_show(struct dma_chan *c, char *page)
> +static ssize_t version_show(struct device *dev, struct device_attribute *attr,
> +			    char *page)
>  {
> -	struct dma_device *dma = c->device;
> -	struct ioatdma_device *ioat_dma = to_ioatdma_device(dma);
> +	struct ioatdma_device *ioat_dma;
>
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	ioat_dma = to_ioatdma_device(c->device);
>  	return sysfs_emit(page, "%d.%d\n",
>  			   ioat_dma->version >> 4, ioat_dma->version & 0xf);
>  }
> -static const struct ioat_sysfs_entry ioat_version_attr = __ATTR_RO(version);
> +static DEVICE_ATTR_RO(version);
>
> -static ssize_t
> -ioat_attr_show(struct kobject *kobj, struct attribute *attr, char *page)
> +static ssize_t ring_size_show(struct device *dev, struct device_attribute *attr,
> +			      char *page)
>  {
> -	const struct ioat_sysfs_entry *entry;
> -	struct ioatdma_chan *ioat_chan;
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
>
> -	entry = container_of_const(attr, struct ioat_sysfs_entry, attr);
> -	ioat_chan = container_of(kobj, struct ioatdma_chan, kobj);
> +	if (!c)
> +		return -ENODEV;
>
> -	if (!entry->show)
> -		return -EIO;
> -	return entry->show(&ioat_chan->dma_chan, page);
> -}
> -
> -static ssize_t
> -ioat_attr_store(struct kobject *kobj, struct attribute *attr,
> -const char *page, size_t count)
> -{
> -	const struct ioat_sysfs_entry *entry;
> -	struct ioatdma_chan *ioat_chan;
> -
> -	entry = container_of_const(attr, struct ioat_sysfs_entry, attr);
> -	ioat_chan = container_of(kobj, struct ioatdma_chan, kobj);
> -
> -	if (!entry->store)
> -		return -EIO;
> -	return entry->store(&ioat_chan->dma_chan, page, count);
> -}
> -
> -static const struct sysfs_ops ioat_sysfs_ops = {
> -	.show	= ioat_attr_show,
> -	.store  = ioat_attr_store,
> -};
> -
> -void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type)
> -{
> -	struct dma_device *dma = &ioat_dma->dma_dev;
> -	struct dma_chan *c;
> -
> -	list_for_each_entry(c, &dma->channels, device_node) {
> -		struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
> -		struct kobject *parent = &c->dev->device.kobj;
> -		int err;
> -
> -		err = kobject_init_and_add(&ioat_chan->kobj, type,
> -					   parent, "quickdata");
> -		if (err) {
> -			dev_warn(to_dev(ioat_chan),
> -				 "sysfs init error (%d), continuing...\n", err);
> -			kobject_put(&ioat_chan->kobj);
> -			set_bit(IOAT_KOBJ_INIT_FAIL, &ioat_chan->state);
> -		}
> -	}
> -}
> -
> -void ioat_kobject_del(struct ioatdma_device *ioat_dma)
> -{
> -	struct dma_device *dma = &ioat_dma->dma_dev;
> -	struct dma_chan *c;
> -
> -	list_for_each_entry(c, &dma->channels, device_node) {
> -		struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
> -
> -		if (!test_bit(IOAT_KOBJ_INIT_FAIL, &ioat_chan->state)) {
> -			kobject_del(&ioat_chan->kobj);
> -			kobject_put(&ioat_chan->kobj);
> -		}
> -	}
> -}
> -
> -static ssize_t ring_size_show(struct dma_chan *c, char *page)
> -{
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>
>  	return sysfs_emit(page, "%d\n", (1 << ioat_chan->alloc_order) & ~1);
>  }
> -static const struct ioat_sysfs_entry ring_size_attr = __ATTR_RO(ring_size);
> +static DEVICE_ATTR_RO(ring_size);
>
> -static ssize_t ring_active_show(struct dma_chan *c, char *page)
> +static ssize_t ring_active_show(struct device *dev,
> +				struct device_attribute *attr, char *page)
>  {
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>
>  	/* ...taken outside the lock, no need to be precise */
>  	return sysfs_emit(page, "%d\n", ioat_ring_active(ioat_chan));
>  }
> -static const struct ioat_sysfs_entry ring_active_attr = __ATTR_RO(ring_active);
> +static DEVICE_ATTR_RO(ring_active);
>
> -static ssize_t intr_coalesce_show(struct dma_chan *c, char *page)
> +static ssize_t intr_coalesce_show(struct device *dev,
> +				  struct device_attribute *attr, char *page)
>  {
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>
>  	return sysfs_emit(page, "%d\n", ioat_chan->intr_coalesce);
>  }
>
> -static ssize_t intr_coalesce_store(struct dma_chan *c, const char *page,
> -size_t count)
> +static ssize_t intr_coalesce_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *page, size_t count)
>  {
>  	int intr_coalesce = 0;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
>  	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>
>  	if (sscanf(page, "%du", &intr_coalesce) != -1) {
> @@ -153,20 +114,23 @@ size_t count)
>
>  	return count;
>  }
> +static DEVICE_ATTR_RW(intr_coalesce);
>
> -static const struct ioat_sysfs_entry intr_coalesce_attr = __ATTR_RW(intr_coalesce);
> -
> -static const struct attribute *const ioat_attrs[] = {
> -	&ring_size_attr.attr,
> -	&ring_active_attr.attr,
> -	&ioat_cap_attr.attr,
> -	&ioat_version_attr.attr,
> -	&intr_coalesce_attr.attr,
> +static struct attribute *ioat_attrs[] = {
> +	&dev_attr_ring_size.attr,
> +	&dev_attr_ring_active.attr,
> +	&dev_attr_cap.attr,
> +	&dev_attr_version.attr,
> +	&dev_attr_intr_coalesce.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(ioat);
>
> -const struct kobj_type ioat_ktype = {
> -	.sysfs_ops = &ioat_sysfs_ops,
> -	.default_groups = ioat_groups,
> +static const struct attribute_group ioat_attr_group = {
> +	.name = "quickdata",
> +	.attrs = ioat_attrs,
> +};
> +
> +const struct attribute_group *ioat_groups[] = {
> +	&ioat_attr_group,
> +	NULL,
>  };
> --
> 2.47.3
>
