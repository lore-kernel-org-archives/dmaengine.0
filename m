Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986132;
	b=bP/fNeQJKJLJO2NgsaINQH/Ah7LFDOI8pJ+QJKpQbjqSKyJXkXhGWGP6r/0NUF6wW4xL
	 OUPdKwjaPa+Oh2UO0v4RQsSeXrd2TBBhNMf+77+7YSkXCU4dAezhhY/Qqfnvz6og8XoEN
	 5oCfwKKCxO1XfDAaeY4kBrtQHSDmhrdY1WrMvizWdgFRM4+2+OKac+XR4KtmXUHzak8kd
	 FwkQPpIsZxdxngLocX6t2FoW8c8LeU1F+GnRzNoOmn6+HujGAWTzN+xv2eWkWXVDtSIql
	 40Eo2iO399XAgI8cAVeiLM84MhcTZ9xegwrhcM//Rv8cAed9bPUtNQflhRMNMyXIzGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986132;
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
	bh=KE+Kml9BkVVDx7AM7DZK9EQuhpRs7yyEfTkxOkFVzv8=;
	b=LQDMecN6DdskyZMZ836oL/HPcJqK2/0mnP+1HUdgtZVnPI69Gu3hC7nz4O/PvZtL9GlR
	 VnJZFYpi0tVDiNlMvbr62OKLIPzd+WaIW9PaDnE+Wbhcl/SZDz53vS+nrEZMb3vvsuo/j
	 CjwT05euyqGMwE2uzuYVVh4VwXN1Z/XWlEj18SDIRgj6sxbvrlwgTdbFA5uh20OE2wh2z
	 dZGuy2TQzyPQaod5DYAV6FWcjwV1G42aq+VLGzggJCHHbYQnUgXHdwvO3h9ZKBnJUx9bZ
	 jAF8IZsJaehNbTCTxGT2F3LMoAnpNDe4sYxwnGFEW5OhTshCyoeB1y2yQkxwc9aoUFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=u4zWdSyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB163606A32C;
	Fri,  6 Nov 2026 17:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB163606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=u4zWdSyQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPpZABA88L6GCo7YJolOO2jfFhCDOMLozHl40XilTEDZkKY8SasbaJKkb7AkWSfjBiEJ8+O+k+7darFLADijSqpRddHOioNroNzojC1jEPqjQFDPXvOqgVw7owULQ0sGi34QGr8vza08sSDhJ/BLZUxIEF5DMmSvOf0kfbXDqdXJ2Md7XiXgwoAwhMv3ItU81vpHcbxFczUSYPlLQmLtdCE7vADzsPjFO5rmPzt8faIf4vx/aiVWty/lrujdg1sRW3Cka1fnZnMO5A4mskdsLk165RaS+TfLuDhao2n++nLLPj3/P+DS3guxOB36xIWHwDs7HvNoWynj7KX3VZ5uSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE+Kml9BkVVDx7AM7DZK9EQuhpRs7yyEfTkxOkFVzv8=;
 b=IpM2BtJLZJ5PuzvcTYXkbNjBbRALVT+rtvP18PbqXXdXw0r0Pq7qpvGgwnuFMQ7gjz1A218Q04MUqPqXNfFQByra3XowdWY4624KS+VogMsbPyh+dZ9NamWvhMQ+HO7rIjQ897lRUb4fXEaojCCfgQ1OtEWXW82KLKT3j9+0ZyvIpLtcIG9sSLF9mMjAsLI/TcKj6zts9duFM1hqG8KpwkE+1D/a8sWfBC30Bv5wosfTpGhD/LxXAfPB3eKPFH+niAz1bHScrCLHZOavgs1U5k3iPFaHScbTFyltVtQaj5xy1OizROF8jq+XQMBPw+lN4JbI6nWMVBfU1lUELbCt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE+Kml9BkVVDx7AM7DZK9EQuhpRs7yyEfTkxOkFVzv8=;
 b=u4zWdSyQX981q5MF7kYjJ1AFjP90/xRsu9kAICyOGpW8t/z85k+eKvLec0gibLOFaJxVIxHAGt03kk8EF43REnR0lrdbEgupa+gZRjJDx1n17cw+/k7QYbgHVGcP0P6ddzGBvva46z1Kb5OS/pUJqV8OqV0HXSrCsNC/n0vHhgj0zDJoQOtpf7gE0NAuVipubZAL2G/XwLfHiqHWf4DosYUy0D2W4QLCe8dCGVniSesWaQO6Zr7JD94yASXKy8TSwcHw8jSefSZFZZUwqUbG/SWy3ZxoG9GueXEDNBlvpNxLQFswDIE5eyd4Ylv0nU/wY/YueVNVSMZuPzhKXBYkTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB12076.eurprd04.prod.outlook.com (2603:10a6:20b:743::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 17:28:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 17:28:49 +0000
Date: Fri, 6 Nov 2026 12:28:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/6] dmaengine: plx_dma: fix descriptor ring leak in
 alloc_chan_resources()
Message-ID: <au4OSzBcNIzoS6zC@lizhi-Precision-Tower-5810>
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-3-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103155202.461725-3-logang@deltatee.com>
X-ClientProxiedBy: DS1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB12076:EE_
X-MS-Office365-Filtering-Correlation-Id: 3813e18b-c0ae-497a-dee5-08df3c2b6b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hoGZUAgqX0aiMWkIO5BkpNeLL/2t5DgfGv3toTDPmLO7Rm1T9pAUqRnC6LUlfg0WvdbEtRCTqG+s0UOLvTDsGIvx2yqQ7dCu8OwT1taJpvIxGcqGbsMX3VRLtM4svqmRR3JH5A3DBn/cQSnwXknVulXXYLE22OP8eHkg3ZjSoc3YUrmDCsH4SeOxWL8vyFQ3WWOOpB3h9yNNvo2EjpM109eSZdK3aF+npfh47lz4blrLHWI529CJdQ0WdFOUC8hRFGCvWuwc0LmUMRvWWGq7EwGxa1bgdlwcGdKp1AjXG6f88/ZfTmSL1JC2YSRL+Wz0GFXTfXuJSIsyg75Z9ktJjmBMBvQ4mPafHMQw8t75371T9f4eFoSjtz4PgkenuJxwTNYs01N1aoq6L+VORv4MFHMmsscV/ai/8tpQCZotsslGasTU/0uRJi90jJ/dtU7/hFN7CLyBgylD9y1mbwU2ypsXlMotOQMe7FNps0eUp9aDdGtv6mVlnTAwwERngmWXXd6n/eL5Gnt7qAapH+ClF+8xMIppdZZD7ce/lV0NvcOO6A7Fa5ZIs3Z6/arX41O80nMNdFmY5RxtsLlfPTTgVEA1gTYod8ZGgn1r14/e3peUoDyq1ksKeB+KaDYmsrzP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lPslqGNb3WptP5eTCSqNO26ZYlytHgL7+Cm/O8MEekIwa8hzdQgJkF64d6Rp?=
 =?us-ascii?Q?3Js8ECUMREh7j5Rig1Rias9hJe+oXyZGnGoyzAsmPclRHqlp5I0XWpY5fh/E?=
 =?us-ascii?Q?ijhCK4k1t8nBWU/stky3TwhRf6QNLzkhwemdf2hDJaPf1vEMvoOy+CxBJty4?=
 =?us-ascii?Q?6J9RSVNACaZKw2NTYw/tVFF4CQm9E5ZqNZ+FF8LED4MBooAi+n7neDb9/tDb?=
 =?us-ascii?Q?D9a05v+3Psp5cw47Cb0tIy/tt9R32VygcD5cfFIvK7VAAVA3zVlKBsD5JaIN?=
 =?us-ascii?Q?etL/y74/vhTbGYP1wGu71hYRHOBRBR8JdSKoCrP1E7g07EX0RxFVq7aWOBT5?=
 =?us-ascii?Q?CYh0ROlxPDym5Ju8pUcr83+ZGZYb/Fw1zb+Z4o0uzayIJ6bZydhbERpEQ7C2?=
 =?us-ascii?Q?JHUUyi3H9GOc/YwFQzCfld5C7yp8yaRDETgn/jRqXwO5j75pJT3rHpqAJlHd?=
 =?us-ascii?Q?TiucpWfxnpGnjDHJj21GpvvjwQ8hP8d7Qh1fl/U7E4UVPr/VEsv73JNmdyHi?=
 =?us-ascii?Q?v4R4BVhLa9HDlXAAJ1e7y+38QLoPmpONzImCpCxPV0ClDWJH9sQuRWPoD48D?=
 =?us-ascii?Q?2qh7wHnuzAw8p5J/a1u6w7uzmgDH2fMcB82mKdUgcR/nsYSXASubcipr3wWi?=
 =?us-ascii?Q?dXbKewr1YgZGW1CkwU3JTo6Yxhd2h0nuwttn+6QYv5djdJgX57zkKvswS1jK?=
 =?us-ascii?Q?tWzf0UZ2T72cVFEeAYqiKN1rdTT7F7NNDGvoUsxE7V73XOQJOq1ebD15rUJa?=
 =?us-ascii?Q?q4fapqGToQ3aMy1e6AE6ItZH9+cBg+fAXaH6/QSJ2TzMo6SONFnDQtLcbdZy?=
 =?us-ascii?Q?2WXhYPJ4jHCxUXY9ggKIjSxyi98Fh9ZPtP03g6XXR87lEn1s4av5G21kl6Ws?=
 =?us-ascii?Q?+7abnx2cKbcVyGhltHfxprxSvll00UhCXxRpDZe5BfGZlaX0VRiAbPDp3AVt?=
 =?us-ascii?Q?v3Tvh7Q7mMQTNiYa1LN89CVT8ZteSRDcax+YAUoIZSxX/eviBsXRB68zsjGi?=
 =?us-ascii?Q?rNmG4QyM2PSShVLTjBZTSxyASiXaFTbvNHGIrk2MqgKoR1m/TWJoj8WXVamY?=
 =?us-ascii?Q?3y8Fbz2/ldHd75jDjQdy+8mSFa62JgRRLb2cl1px28zzhf0lfy4RhtmWIdB/?=
 =?us-ascii?Q?hbistReSt/A5IpLhqaX+m3MeUUH+Qd92zv6aja46nC2lYIBIl4Kxj6oQV1an?=
 =?us-ascii?Q?eWBOg7XvBVhLZnmvP4GhRoLBseqBAdQy526iKTtyRxXM/RsD+QoAgrZcEVvl?=
 =?us-ascii?Q?zvgsNL8zLswiUMfpPuyy7ZaH4S8lNE+rr7+mOh4RYdmN+k4f9baYzEFMUnyl?=
 =?us-ascii?Q?XHHMxABJz1VpiTBXOI+WBSbJpwzhOAbJhKhVgHV4/GqscPP31z78LhyKhXGL?=
 =?us-ascii?Q?bJ1/56p0iYwsnsilnqynaZ2kr2OnQayhWAZ7IxfLw2e7UyHAKyrPItpOuLhs?=
 =?us-ascii?Q?uVsKaCTcBaeM/oc1VabcRLTX7kR+Rg4MixMDDU684xxldfso6hwOWKdDKp6E?=
 =?us-ascii?Q?IvcGPyazZe8gS+IR1lwjJjZpFAd5wRWbtEUIM7vR8Qe8bbAdFKjzsAEuH4TV?=
 =?us-ascii?Q?39yTSBujrelj3GsFzvc/nCvR27NUS4aFrlOeyBW2P125svfDTIOwIG7foDHJ?=
 =?us-ascii?Q?wvU68k2lqacmL8nujy9ZINAE1Q+j2dx1goSO/Ibe6bztp2QRcmdBZ8wZJoJI?=
 =?us-ascii?Q?Nd8euiUxtQwU6JOEEg+VqoAeugPwNnBohZw1+MGMpopuN7thZzoli2/2HpwI?=
 =?us-ascii?Q?CBMHXTKoIavngHUy6JhMZPrCpDxSGZAhuPa13a0/xp6AIL3kuBYh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3813e18b-c0ae-497a-dee5-08df3c2b6b94
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:28:49.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHV+rwSiYY9zx3v7eEWrv/QaFrtBerrvm2186gNC8bgBGGmgIwQpfWrsxeAIGfc391iCIiijDnlSRBaDnAWCO1ru+8rp1mga4O4EI9xLo/eoCpUw35Zcy9yFOWTFYdTm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12076

On Tue, Nov 03, 2026 at 09:51:57AM -0600, Logan Gunthorpe wrote:
> If the device is removed between plx_dma_alloc_desc() and the pdev
> check, the error path frees hw_ring but leaks desc_ring and every
> descriptor in it.
>
> Add plx_dma_free_desc() and use it here and in
> plx_dma_free_chan_resources().
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  drivers/dma/plx_dma.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 0a7ad2473cb1..bfccbb0c70e8 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -404,6 +404,16 @@ static int plx_dma_alloc_desc(struct plx_dma_dev *plxdev)
>  	return -ENOMEM;
>  }
>
> +static void plx_dma_free_desc(struct plx_dma_dev *plxdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
> +		kfree(plxdev->desc_ring[i]);
> +
> +	kfree(plxdev->desc_ring);
> +}
> +
>  static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
>  {
>  	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
> @@ -424,7 +434,7 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
>  	if (!rcu_dereference(plxdev->pdev)) {
>  		rcu_read_unlock();
>  		rc = -ENODEV;
> -		goto out_free_hw_ring;
> +		goto out_free_desc;
>  	}
>
>  	writel(PLX_REG_CTRL_RESET_VAL, plxdev->bar + PLX_REG_CTRL);
> @@ -443,6 +453,8 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
>
>  	return PLX_DMA_RING_COUNT;
>
> +out_free_desc:
> +	plx_dma_free_desc(plxdev);
>  out_free_hw_ring:
>  	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
>  			  plxdev->hw_ring_dma);
> @@ -454,7 +466,6 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
>  	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
>  	size_t ring_sz = PLX_DMA_RING_COUNT * sizeof(*plxdev->hw_ring);
>  	int irq = -1;
> -	int i;
>
>  	spin_lock_bh(&plxdev->ring_lock);
>  	plxdev->ring_active = false;
> @@ -474,10 +485,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
>
>  	plx_dma_abort_desc(plxdev);
>
> -	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
> -		kfree(plxdev->desc_ring[i]);
> -
> -	kfree(plxdev->desc_ring);
> +	plx_dma_free_desc(plxdev);
>  	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
>  			  plxdev->hw_ring_dma);
>
> --
> 2.47.3
>
