Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602340;
	b=aNbcFgehFDZR26C7htE5NH6q24EBw6YaIa2uSr5NUvfQTx9+eklPixPOXlyh1IttrQJN
	 QxY2tDSAaElW1XKzyvaqSjtYVIsaYvQfOKPwvuEv2TPoNy5r74UfprOeLEhioAyrMJ41x
	 7kebsGF9lDLv9wd/25bXyQ1XyKOkSdmWR+VkYridVfRldMuQ9PlTypJoYOg4thbHl7pRI
	 OJC2J8J2MhwqxREm3/RcGhjeMUlvg9Z67SCSLiCwzie5t9JluDcE7qzMGMHtHGsSVRfIb
	 sE4eqfGw0Q3edHpH0tYxWWLLg+QT8ZhYpHA+STYRPqKV/4hBD8+LRVO0pooR7LkdKPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602340;
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
	bh=TToq7DqoTwxn+3IWTI5k+5jC98FoV5zfN8nAqnk5AIg=;
	b=5s1UesOCKbqrEEsJSEyOzlX8O6NWg79TiQCvg/cdjk/v5FSIPrfqXuFKPTyQ5vmdKEgP
	 EZmqZxJpk+iaXalOAySxwQOecvllpUbYVZv9LzKYGhH9qXU7fJ5xq8TjJdPP2D5PHyfo4
	 GhmT/Y/Wsr18b4DyBA1CbC761nIl7lsQilVtCXiVnXuXmu3PSzcQRvPB1HZRWmCI3sv0F
	 OxxPA94aH9PE/m71DALtBZzgcTO6XsUXOcigprSDpAbEDDwXZsJbUeNg4M1PfQ/bD8ICh
	 yQGENc4ZS42RL/PJK+S03BMpsQf8fKu1F+2r6SgKOVBwnfX8VFktLi1oS6/sc7XT3OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XAFNCrtH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.52
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6480606A881;
	Fri, 13 Nov 2026 20:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6480606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XAFNCrtH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4FDxQRxka4fUU1pnOsE31sLmfYUgACvQc8Bp8Tu/OXfPKcsc0qJpnY477MXsIV8mLTvHk084db377b4MyTy0lJB8QZCkq8toSMwtB3AmXpp7tEQHBB7BtIXsK4rmC0DICQm4+DYfodsR88uJfO0kb3E0FZKLayNKLkob8GWQwJrPWuj7dtLo5ErmfY3TU2LqmK1OExneefxL6Rn2d9xzhJ/DmdFA6nLXVwXbTVwHRkq5tzHvL9mSesC1LX9llpFATheJacI2V8aDMMxpunPa/5dwpgpkgSSYjMNGlCz4p2YQhhLOjGN6er4+x2Q4z84UfLoFh6zwEYx6sw74ts8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TToq7DqoTwxn+3IWTI5k+5jC98FoV5zfN8nAqnk5AIg=;
 b=rqOMm3MeSdJ3YyGwdTX4cYJdxDF4HTmTh5RyyIycDktB65Zo2P4ydMlOWNecuTPxVePa5xCzU+S5NAAHsL1owf4CfFwmykXuiBJPR6c/Q0Nlnflj2gFe7M1egSwre4kAHWVEW19KHe2IIN0TB2MNv+gN4HWb0nEsAeRaax22fMlw0FAki20HX6/3jN6st73cRGk60ghk1I+cArnO/O+mn6T2EN2CZfRiB6aKtLOPoOS3y24pYENxdwGW9BnmsuSkKWCjl/LGBfUcrvA/MkB5fH2xWFLbr+8lEss0vqUPn4axVtaxOE33KHX2Z+PXFKIxC0AjazvfXaJ8Q4bwr0Lrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TToq7DqoTwxn+3IWTI5k+5jC98FoV5zfN8nAqnk5AIg=;
 b=XAFNCrtHP9IbUgRzAZxrcdKqJ1fmMJrYxOneLKQxzvfc+u9dfkfOqSXYq1mkV223c8MHEXegySEP0cWCEUO/7SXc7Qnw63MDgbUQOmoYEOFUXEQcormjQ5pBmAXSgja4SdiHHNuAYT/22PBxiAfHyQvOQgOVG2RGNEWutPyDIUwt8i8gmSgYpRinH55lwz2sk5ukqsWaBT3GHD+GZf+4UIOuEkLGOD5Ypf7eNMIbaK+cd3n3bpSAlDGa9/wubvwMlYoyjFgYZyTshiapk9f6F6ePLBoAEH/wppeJks4YoksvWDe8TpgFdWgrK9g2tfPJIYdIu0Adjs8+6tScT5Ukjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:38:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:38:56 +0000
Date: Fri, 13 Nov 2026 15:38:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Zhangfei Gao <zhangfei.gao@marvell.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dmaengine: mmp_pdma: drain channel tasklets during
 removal
Message-ID: <avd1WhxanbOgBqvM@lizhi-Precision-Tower-5810>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-4-yaojiale02@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018040724.534641-4-yaojiale02@163.com>
X-ClientProxiedBy: DS1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b45ba8-93a4-4fb0-2d48-08df41c6237f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|5023799004|261021121427099003|11063799006|4143699003|261028144727099003|261026121527099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	MrdqDy45ERe/HudFORCWEko7gdILq1CwopcodUE3lqckev+8tiuP2ffExlswa+3/NrB3hs6o7YtSA8tJP/riYvqHgjNofWK9Nu8e8alfxbiA+kgddqDDOylRyAsINSdM+Vru6a/sbNdBoyDo7YBiwMNR7TzutdGMs0IWxFSWIL8lw/7HOo0QvOgtioVUVXskY5HoyHQbw2vyV9Y5wbuZAK9ndEA4QQk1PXAoQxvDmvakmbXFfZbeRk0KCqpVM7vBjN4K/cBKqwTBLKDNCRWNniEmLEKI1H4TfNsoPYE1nFvWa+Jj0ukmkJfr984ZwwKH8N/qsvv+9nIJ1icKDClT2NGXhpzwJ+HV8j0ytUNBaVIJpvQ65JStiMlxATiTFiCo1o2tRdP3ja2JMeYFj93WC8hdxFTn4Sv2TX30rNVXvs901Zj8dLh8y1LOcjiyGZyi+6OGEn3zMIpZ5Ta6UbYs1v/zslsDzum30ejGhxB+AZbThKBp48+cLyFiQtDSB7JweWzZ4HA7WWufNweRVnQbWMqKvFA2+lI31Q6SDBDMCcikNSabh99AqXbKbqY0NCEkzVXlw0KRMdZ74UjtLGivLmy7FlUQ28TwsY5+xY9aGvRKeGUsMgFARUcNnJf0N9C3j7/ZPdrHv1xFL7gDpcVgcGyKfq1XRdvTekadXHIVSbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uCyn8o6LbL4unvynT4GdMPdWs9b0qIYhIOUm01jRLAOf3b4xDupoh+kPj8oG?=
 =?us-ascii?Q?iSZWeYKJ6OsLwvCyVppppkDTsi440skfJZLYSBGJHC4JVMnIcyk4haSIvH0Y?=
 =?us-ascii?Q?2GMMIl9jbBToDz9ov7b3N0wQxT6uOB62jrc7hwgcGhrkPhfnet20vDSaoG8n?=
 =?us-ascii?Q?bcR3Z2GiIr0YZXuANoch5YXwknWj/JdSP63Dz3+U0IqMBI2mXmUJ7D/ol6PY?=
 =?us-ascii?Q?SLCWaPvJx7t4AWmFQaUJa+uIHOYDw7VHWrKW2Ba30JsJxMtHtjfMAcH1r6PQ?=
 =?us-ascii?Q?2sQjr9qaiCXxMJerAW9j4+SYBw8ra4Vmdmj/Km7yUAgXvGCXdmUwt2eA1Gja?=
 =?us-ascii?Q?nOZvMB3nOxkM1fXpb9NoARvzdfmiforzVQ5/2qeOYwwhUW4N/alfsi3vMBKD?=
 =?us-ascii?Q?NbMBWylnPr2sD0UTc+eqK6K9dk+0idyDDh+Dppiv+BO4tEkOMPSSUb/RekdK?=
 =?us-ascii?Q?/TKgHaiBF+kTo6WRsRtMVYzpooGRQ6SAgTjSN2FJ8jgKMqK4EU/rNucXKZLh?=
 =?us-ascii?Q?Y8huJceFyYHtKu9C1mj4EQhZ8S9qyYm8RVPwFAnDaNMrOivb+AxesWUo8reS?=
 =?us-ascii?Q?UjiRsPasjdShTq4H0y9cRJxZ6pt9OYLOEUTzZzpcK/pB8/cjEPvJ7Pm833Jk?=
 =?us-ascii?Q?586hWAHo7UMA2YReYAd3ZjJra8KqVJ5bBJPmRM0tnotHOpO4ZQrvoNbr3LYP?=
 =?us-ascii?Q?F46fJcOt7CLzyr8IELtF6HnH+zUT9ApC3r5nG6LKafhPH/IVQV4GrnQ1ZyaY?=
 =?us-ascii?Q?CaWOgNmyV2OWE3WpKC/OIX76cXdKQLgHE3ySur01t0MXvgQPjDTFhvlMmfno?=
 =?us-ascii?Q?Fq4cABC3EfbfeJ23PJA1p2Wb4GShoPiu+wbUVAVK0X87IC4+9MkRd/TaR+HO?=
 =?us-ascii?Q?RB3gXcFK7G8zIb4D3SFrX7EmCWqon912otAnhYiYsvbUeDNLWEWX1SF/BGjN?=
 =?us-ascii?Q?J/qmR2vVVgl7sWft8fJCm7/i3e5NraHGBlCIw6VNIniYF5NCsVGLRlSjjxlk?=
 =?us-ascii?Q?W/nCkpG1XQNXA8geiWbb7WY/lsVoxbZBuNwNGuRFzKJVHiPZT3ON6KAo1h6h?=
 =?us-ascii?Q?uHwTiix0Y9PdPVx5YQ6agWvn9NspnA3pl/zRd69JiHOc/RJXso3S/h8K06QH?=
 =?us-ascii?Q?G2PxbVlvoR4FRwa5kbv9kUm63voa6Btq5HzELG0EvmwXteFOHj9BgkG6Qwvd?=
 =?us-ascii?Q?O/Ln6FuopQ/VJnb6Y5k52p72m0aYphgzMTLou3ZcU3TSvcIklnu0DVFuBttk?=
 =?us-ascii?Q?ZLToAp2BmuMd0ibXCfkQjFXDrkrHOm/8Q5Z4sKdHR0ggx/v42PvBEoqRnb9B?=
 =?us-ascii?Q?aHt4Ra35XcmaozoYpFlz88dBpywZyRLKJ5nUzydWAzvzqZn8h4h6T/dsbp44?=
 =?us-ascii?Q?6MRWA2d9vfk+/FfpNeY28aD/Ra644ZTltUuYn9f/QdEW6cnZbanxh9kv+Vf4?=
 =?us-ascii?Q?Z3u+EZI+eyxO33Lme6pghP8CC2e5s6h6EAbfSa1E7+1FRhfGTbhc9jwdPGyN?=
 =?us-ascii?Q?gwU//rrdDEHh/IF2myB0hKY5ejkTbnCEjuD8HHsJ/MVUKtycO9+8QVfxGa5O?=
 =?us-ascii?Q?rzObz9GwZXmlG8QdqUDmdWqP6j39JvfwtZuLw7+b3w7JjDm6EzQH+AZZ4ewu?=
 =?us-ascii?Q?9hE9kOPJjcww4gTPgfBHDxfmwflsD1nSeKBcEi2Z8f766TLI5BpY0XHE/CVc?=
 =?us-ascii?Q?6+Wq6xUJDjqsc5Y15uBQM98pYXPe5LyBjkxswiYU+hdsVTDA+FV+1Ar7BQT+?=
 =?us-ascii?Q?HUq9+38CJcp01udTkKvGJqTN2WYu1xOITvhfYufqQl8R9T8Uftqp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b45ba8-93a4-4fb0-2d48-08df41c6237f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:38:56.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bumKvax4UPNUARY3RYkLJ5pV+ci8mkQQvm/QSpe4+6TpXwcYL/jLrjgTBKdG5mAgXAOFisu3lVyrBT9r+1qTdrDal9Pe9N5a8G7dviNe6EPyM7KzSlIBoRYgnA4l9qAN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On Sun, Oct 18, 2026 at 12:07:19PM +0800, Jiale Yao wrote:
> PDMA interrupt handlers schedule per-channel tasklets that process
> descriptor lists, invoke callbacks and return descriptors to their
> pools. Freeing the IRQs does not drain tasklets that were already queued.
>
> After freeing all controller or channel IRQs, kill every channel tasklet
> before unregistering the DMA device and releasing its managed state.
>
> Fixes: c8acd6aa6bed ("dmaengine: mmp-pdma support")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mmp_pdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index ed520737882b..a371f017fc3e 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -1119,6 +1119,7 @@ static void dma_do_tasklet(struct tasklet_struct *t)
>  static void mmp_pdma_remove(struct platform_device *op)
>  {
>  	struct mmp_pdma_device *pdev = platform_get_drvdata(op);
> +	struct mmp_pdma_chan *chan;
>  	struct mmp_pdma_phy *phy;
>  	int i, irq = 0, irq_num = 0;
>
> @@ -1141,6 +1142,9 @@ static void mmp_pdma_remove(struct platform_device *op)
>  		}
>  	}
>
> +	list_for_each_entry(chan, &pdev->device.channels, chan.device_node)
> +		tasklet_kill(&chan->tasklet);
> +
>  	dma_async_device_unregister(&pdev->device);
>  }
>
> --
> 2.34.1
>
