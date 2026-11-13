Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602280;
	b=Ych6aXODvJVWwTEQQOh4rSlX/o+ETXCvVkJNjVV8gf1BCAKDBVuZyrX6OkSmyRt6SojA
	 fUqPV7q+B4qM2oA3qQ7gaOkG42fJKnGtzTLU9dTUOJIe0MoW/RzG/kBFVfshiM+vEFp2c
	 MCY7KGMkf7nxNcmb0V1sxbvm/AZoia/WoDif6M2biQx3siViEtinffR3RQuNcudxt9dfG
	 G0G0TdY4ztbOiCxy02NgZ/Yk/WwdtgUokup3bF2a/hl149MUMDusHs2M10nGhQwLtb7S0
	 tn3I4XYUpsOe1si+rZXf5pd6c5IuTNVLATFs1JlOFSyQGeqAQXDm2aQvs/uVbD0E0OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602280;
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
	bh=7/LZqzrEEa58askogRKVvZ9i/hreaMLpBgTOvLrzhb0=;
	b=nJq5dkhXQfAoXk7dm+jsN7Vjp26CKUEFhIa5TmFLkJkj7ovw/tNrOBeTPHUqMQIlwU1t
	 JgmDhDDa7dDXTr5j0d/TAqKnN5cLidQW1+uCtc5lHw84YAadlwyiBl/Fyx10eYnETwN6i
	 U40nIUexfY2GQSRlpzGy5tQWlcjk2u8zJ+kAArTQVIV4eMNRwcoYvNVOf7pM9+lfygZKB
	 YRqgJsT0Vqxllcf+a++sd0gd/f/Qdf2aZXNxOCq6FaX2S9vm+S54lv0LEeA07erKCAlTC
	 hcEVKj66iNzxUXxpNCTdkZExMxMXz/05ZLb9MItx0syzU58ffa2qD8ftKplUVBQU3+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uzq+ZZ2k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E8606A33D;
	Fri, 13 Nov 2026 20:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6E8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uzq+ZZ2k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvZah913wqjnmMcDtR9iAF2TeHPG/tbzFN00q/fjSgeyJJ1ezhJgETP7X3QQdUcDW9hAtPL0gzWCB6Pybuiaah+ujXAnLltQTlU6Lkc8TBavh3u/jCAuOCCJpx0mNzrMjq3fpK0bQ3VEVUS0sTAGtVUAw46DdWLOTw0ekFxg4hbghs7zhWUj4G+ob+W3QS4TtDDZ3TF2XruXGq+lu7RJxIZtm7BeU57tcWFczJGEIqokCX5sEGFvOSGYNjv7LCJQVGqt80ANeKZP+K9Qdc7LTc0votZ9y9RYvWjj7zpqhxocSaTD958muKS/qyNmb2B10GCth/h+ie3PQZ+w7LqFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/LZqzrEEa58askogRKVvZ9i/hreaMLpBgTOvLrzhb0=;
 b=ZrEn7uDoDJZqklypwRwrQqt/AgH6dw/P4v+txm9BOVg7zm0bErtqV121jUERpwrF9aIy17wJJmOYRz1Ck+JvuyJNbCLbSfkYzoTICFY6YJBQtJoRQdDGF4TlgBNngAUMFohV2YZapKZIDi8Y1SpsQ726PBNV58mtFbTXAWkecQ7k3gEwQEPca6V48zlaAfg4XiSRcpcizBMpDgGKFyvSsf//wK4JSzPeb05lEAgxDs9NI2XigWs+Cc43/4ISDKWCPvbPeFVq7mrm9M+59ZVSvZpTbQsYMZcbFa+lVfS9Fe0DMTPOI7+bDrN7Q6G5wPTtFCZQqTbhpIHZJqZxfU7VKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/LZqzrEEa58askogRKVvZ9i/hreaMLpBgTOvLrzhb0=;
 b=uzq+ZZ2kIr1PdjccOi0UIQKaYg9fQegSOp5A6wes8plJw4/vD5eoNlKbo0TcyiIbM0uCYwwrY/b09O9W5NJi3R+OReAdYukzNCeNWs6tLKDp3ppNqOBjqaa2+hVrOSRHep0j5hbpxUVTqOhLzcNrNsxBnQEivTdN1NQQ6ns9m/ZiIAzWO6QqD4RfFmYONAFH7GqaM5G/uhIzhUebWUOADQm9SWXdKlgARAvL32gFA2HV8YRFELYE27l86AbJAoPAikutaYgLgHWA3RJUANPo0davAnBy8/ciL2EyZHzoQBj9xJp0NW9Iiy0RBicRZX9AGtlmXjeTUkT4DIUCI5HvRw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:37:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:37:55 +0000
Date: Fri, 13 Nov 2026 15:37:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Ryan Mallon <rmallon@gmail.com>,
	Mika Westerberg <mika.westerberg@iki.fi>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dmaengine: ep93xx: drain tasklet before freeing
 channel resources
Message-ID: <avd1HMdPWhSk-FST@lizhi-Precision-Tower-5810>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-2-yaojiale02@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018040724.534641-2-yaojiale02@163.com>
X-ClientProxiedBy: DS1PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:8:233::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acc5b22-ba62-4f4f-aae2-08df41c5fec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|5023799004|261021121427099003|11063799006|4143699003|261028144727099003|261026121527099003|261022105027099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	Fct2KgkjAd3iOXFj6HBQfmogOOMkin3KRCqpyppArBdaKw8ufibrQOlU15dEam14h4/pLxJsRQJ185DCEhNTsDHa5PuA8nqEaRuJrn+KgL0VKZf/gL9IQuNqYENNTYoIJ9q85kHcHFvSYpUFLPD3LQcRsxpgTvUhRzP5ZJy+GMcVAAzeUs16V+zlMK95x1lj+DeEjUSu5bJpeMiRf5YP+JvWuwAVviGsi++Dp5NLIvrHkItm3nmh2xKL64afT4I2o29DJ6hRMNtj9CSvyQ9JcWr/bVysJExLODD0SIHuHgisu3OVYstPQ15lEwDzusltHhmZtUvq+PVNDwdt671HswWvU6qm5487KR94gHPUcvrGs+2GGSoB5SinC6anArJEnH3GtdN9TOFZ2KqKqbMDm7fC1uTYv8zGZ3B/9ziXoVAvCccAnlgdDFye+ff6wYqZV0j/WxTLgWK/cvw0EfH/fKx+Vllj0+NYksOWrRom8hahGn/gGeCwm51sMK/C6PmSkSwMN+S3jxIZbP/gSbSsLlcA+6aCuC9Vdyivs1JMJ/zEu68bMUUhtszJofJ5TX93tF3tBq5hCYZ0sfDCzHvWW1ZblfenMyBLo6WAU95qlGBZyRMCoNHABzSOv3N91aATqVgh0Ldsxuh1QhurNIA6FEbAdwaWg7g90ezCb6LpJJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c2xJw6LNjtUwtv5tkQSnc6kVm2USieCIKFsNlD6X8XiolDtPYGSi3ZJEsRcz?=
 =?us-ascii?Q?e/Fy1uZI5siQNyXEuYFbKrhLPXOWrBD5PuD3hcHBXESORuzkHH73h8r+DbSh?=
 =?us-ascii?Q?MFCqY/FP1tTsPd5Ag5+hxxPh7i8MViAYF6Qzq6w2m5h0dmp9UqHA7LzSwb5e?=
 =?us-ascii?Q?4PDy9/X41dcnxRqDE2nms2qu/QLAQ0sDC4v7QZjplbzUfVT7vLBEhzldaHuB?=
 =?us-ascii?Q?4hkzp5KItrjT8FoxqntU3EjOG6/oOXD1D4DRwPomgqan97TmR+7kNQkwRbQo?=
 =?us-ascii?Q?11Zt9qqJ+zr7uACll9tdiGFluWey7DfgrGheZ+4HlJ72jq+/D6y/V+7JYxSX?=
 =?us-ascii?Q?d13oDzb7GtY68euhDBA7ATmsubCCDkVYaG1hj77scSooV7CT/Br0NTFdtbZz?=
 =?us-ascii?Q?x+ufP8GQ40dm838Q1piBWTKBmtT3gxHWG8/FNesVp1Wr/7m/dQhC3GHG6MiK?=
 =?us-ascii?Q?E0Nk87aJH6FczNwgs9hOjk8tZzqOIP7mFaaGn+fuQN5eBUp9k6Fi8YPL+1Vx?=
 =?us-ascii?Q?i3yMQXfUuj+f9kOX7kPB62YdKi3Rcu4IAl4aBRKUSRBsHOKZR4/mVDfG5SFo?=
 =?us-ascii?Q?YPgFpIZ1WiZ0wRi0zRLgwqG+zmwyifHrJ/fMGAct3T675+B02eYEW1wzpFWe?=
 =?us-ascii?Q?z4r8BggUpcP3iTzKB8ik/T5TaY8g/t1PoSNO6e052YANb7WNYG/hjirGpHLo?=
 =?us-ascii?Q?AO1GsTaNbLI+LsCy9eZ19xkV4u2exq7TA6A0WTdr7Mlv9dzoli4TmssMQhfz?=
 =?us-ascii?Q?lF9Gb3Oyw5qnXcRV6TRJON0QqPgv+m4exMkAwesIjZGsLYUW6O+3n+D+K6sC?=
 =?us-ascii?Q?O1n8+EeLVRcVGuwLYQmRPhBO4MM4GFpwVxcvT749NJFtAKAIuwHNe4mC8uqR?=
 =?us-ascii?Q?VtaZ/xVO+pr7HEcRwAC2O5XzTmzuDmdur+yIQwHfnWzNlN3dxNjzs2aaZqnI?=
 =?us-ascii?Q?Wrq4L8/NeWgGUc9uscaGiyIWdekj7zr5ozj0YmEWO98iBZDIplKAyx6SEabs?=
 =?us-ascii?Q?Ne9gEZA+VzzsFTUZ0GXUXjBD/06pTNoDk5SU+SEy/GpbxmQF6XYNR4d9sYIN?=
 =?us-ascii?Q?a4LoH/6HS+6+eFsSBM5/XhDnp193o4j5x8ubNM28P8SfA33J2f12kK9kbg0M?=
 =?us-ascii?Q?8bWGVdw9oGWrR28t2aTwJEgvY8MQMf31OEkjfFILdXOdzmRWeEgGMp0z0kQX?=
 =?us-ascii?Q?agGP77xBvL5hbuM0xfsJ088YQJd7uBH7whNlysX0PHMpu6jyd7YnA/q71+/V?=
 =?us-ascii?Q?dBP28StHJBLlzIHFmkQZH9X7BDgWWb7+L9+HsPDqO+ih+1zELPigMtMlBqIq?=
 =?us-ascii?Q?pQcPa5dY7J9zU0ojJQCigliddTyb3IBp20iGyRzj/NkRQwdMKW/hAfa4nA8J?=
 =?us-ascii?Q?BaveQwdVrmkKK21ou3g9/EJ6eARJfY8naEqiAJUfi5iA5A5GeE/MxILwqx/z?=
 =?us-ascii?Q?VT419Pjp1PgtPxlb+/81mNeuUoBWRpTRP8b2nf3O/lixZ3e5qkVgB0AOALz2?=
 =?us-ascii?Q?jRTIU0wvxl4Pz04Sur33MHxAeh6PkjGGdlgHEQViUKE/RgY6/vhKIrLYnnP3?=
 =?us-ascii?Q?6wHL77lgAqhfLawCGXxXvIAymKexLRz6lxAQBktwNqnW+vwIrRe0ydedCdCG?=
 =?us-ascii?Q?VP1H8alxQEb7dOtEE00aAxGCHG6QHA8iKg1zlF1xA+pUDUQ1e1/HOF+t7w33?=
 =?us-ascii?Q?S4IUNehhkUx1vxNrTbW2b6SDeWS26Exs8dWiDb1uJ/gFK7M3OFwZbEb/nm+Z?=
 =?us-ascii?Q?YDLz7ySBXuf414AOhG9M49xFEB2R2nJM0bGBzTpkjTdw5m8hE5Kc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acc5b22-ba62-4f4f-aae2-08df41c5fec1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:37:54.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsXMlniNWVajtEJmULVopJf0vYPkZZQT9NXYP3hAL38j0Di4idz6ZJR/TicyfP8PxH5uOFLbYKi4/cX9n+M0JApz0/E0PT37tvqyRnrimKyGKd8e219OiNtc9O3bPjmQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On Sun, Oct 18, 2026 at 12:07:17PM +0800, Jiale Yao wrote:
> The DMA interrupt handler can schedule the channel tasklet. Releasing
> the IRQ waits for a running interrupt handler, but it does not drain a
> tasklet that was already queued.
>
> The channel resource release path frees the software descriptors and
> disables the clock while such a tasklet can still access the channel and
> invoke a completion callback.
>
> Free the IRQ first to stop new tasklet producers, then kill the tasklet
> before releasing the descriptors and clock.
>
> Fixes: 5fa29a17fabf ("dmaengine: add ep93xx DMA support")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ep93xx_dma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index 311e55a97ba9..6134e9ca699d 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c
> @@ -1015,11 +1015,13 @@ static void ep93xx_dma_free_chan_resources(struct dma_chan *chan)
>  	list_splice_init(&edmac->free_list, &list);
>  	spin_unlock_irqrestore(&edmac->lock, flags);
>
> +	free_irq(edmac->irq, edmac);
> +	tasklet_kill(&edmac->tasklet);
> +
>  	list_for_each_entry_safe(desc, d, &list, node)
>  		kfree(desc);
>
>  	clk_disable_unprepare(edmac->clk);
> -	free_irq(edmac->irq, edmac);
>  }
>
>  /**
> --
> 2.34.1
>
