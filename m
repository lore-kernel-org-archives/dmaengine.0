Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793820513;
	b=MbIz/0e/ZGN8veBDk9/++UfUmmitwIze4h2/cjE49HLUx17RAw2/ysS1Pi3BJxQ0uLBR
	 fvx2QH1iaA0vXJpUTHHUBBht8bq1qCRPjjzjc/U1z5bTxXQhVh3tu1MQWM1gNsutpT316
	 EAseNNgJOmPfbKZ4VbHnhqBM3DjYCjia9bSBHq1l/BNsa4w4WoDflnsJ2VsWR9T5kQSWv
	 ugIsxrhNz7e7Qt4pBlCNysoyNuSnpPZkb+FWslv+SR5a3tUO+ZMsT72JD2CWKUEVmZwEy
	 7LZXBLyDd1Wev5U1RoX/VzBOrupIxlJyvTfVmfVBBUkRa5D5VbBsQZYjRv4uWymL8hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820513;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NocGzT8QVkNY+soELpAYFx964rL/SzazN+1VDhQTXBk=;
	b=VxWrqrWlOcx8kd8SajrLIykKol6zBt8gzRjPHmwesURzzE/Xlry3cV4a7416QvOUfIoJ
	 yj4oVt/F2kQFvQP9AA3N80kZMcwaW5quPleO+kpft3BDKnANA+kBVreb7oFpNVaapQbsQ
	 Bm8JmOCxwPCa4pMtY64i65gnkhU+kTILr8W/v3O8xXcOTn1sxkJWb/W4zfXPVIGIPto6N
	 M0YsLrgG1M3/Hv1wUrF7VsE+FoWgOogiv6Z8DvgAO7b9F70HleqTdqHyIQBRA8XFWMG1n
	 A5pH0n3MtbzrSzpxbiB13lGI6pv5HzkXO8P/XjuNsou2aV3B1B4yqeZVchvH8NWX25Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mCSJSDB1;
	arc=fail smtp.remote-ip=40.107.162.71
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD1606AB3E
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 19:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDD1606AB3E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mCSJSDB1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq3KvlO8EAMzCBv/djWSLd9MfBkBURwx9J3R9YwiqxEYyCVeQto3T/425piyswzwMJ2U2oF0Ws0/khhATD1n04eXQDeJgqaFZeoquy4E/fxFfcaPvnP2Vn+tq44pQi60BNYFnCCgH6OCbzL9z35deHMM0c4OqeJIJIWJRazYKqolPdS64f/+sv71Jbbgel8xGTPHFHmDyi4vnYeRier+BHLxN/1NrDK6Nvz/oRbSz8U2yJkRPWKe2tma8IQYnDz8EcxWqmIEB7841qIkZlSJXFXCSjWfycZ2e7wCl/smMLcgiH9ht1Eaer+0JzQdXB2G8Dt8IxvLqH/0iPKHpjnNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzEmf52UR1TxKo1HCV+rjZ683qrFxzbO0isnHTid1W0=;
 b=MZwW4vCspYlWd2A3B/tDrJBZZA0TVBKDf/ntyNpndiri9jBldSEqnObEVM2z3U/1AiEJ3zEvnDo7XbwXV/U/H0+RLhYyztad9dnA6bMs6zR3v/X0LebdyqgpA1sLK6DGda2tyTeWVmYCsF57wN4Nm9kxFJlORPymutM7BSaezR2U5fWeTIZROg7SgdJL8ok8sNqnsyBE8NFsF/R+L1eLkmqTIu+XzBoj9BlN6LMp+rNqcr2Qv8/q9Ac/Nri0eo4N9J4GGdLeLyJNe2GsQBD00GEu5JeQt8hp4k5usFSOis+Vy2mqn9PIhT1Bp8OEN8ZPFNyF+kccrJRFlZd394Nx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzEmf52UR1TxKo1HCV+rjZ683qrFxzbO0isnHTid1W0=;
 b=mCSJSDB1UFyzp9xgQWKlYW8jgsx8Aw4mSihN3o80t/Ta7qfup41mJBIHcjmxK8ZCREOHmExaFGIJJz/oXmYxU0of0cd9jH+79euD6XjL/mpdGLUDSeIR1FdwtQrRflydM5/es9rmLnGje3Vf+DqQ+KcTrnQ8dbpI1l6Fsg/URCvCUhm9bpBuuXhASEzIPYdvZt68LhfuRA2PyqXb+0o6H3E01i1aYPCbAovzCVzmKkL5DRYSZDE6F/8ALydyI7nzHNx27e0rVgzWkHkm9UuijJqB0GhqX5ruhz5oOt5c0ZuegE/3p0xnNS7ryxrZyEvey0SWUH0RYQeOmglqtYVpSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12014.eurprd04.prod.outlook.com (2603:10a6:150:2be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:28:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:28:27 +0000
Date: Wed, 4 Nov 2026 13:28:18 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Yang <mmyangfl@gmail.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: pl08x: Release the reset before reading
 registers
Message-ID: <auuHUv-LlUuoP1aF@SMW015318>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
 <20261104154542.3131916-2-mmyangfl@gmail.com>
 <sashiko-outbox-197555@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-197555@kernel.org>
X-ClientProxiedBy: PH8PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12014:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7075f2-f947-4530-b7ec-08df3aa9ccc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|22082099003|18002099003|11063799006|4143699003|56012099006|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ratm3nFAMMNqnx5XHmZBgXlPFaq8RF1cesSejpmTU1v9leHq2L07GMZm+tvCF/zIVEpw4IvreJKf2fKQCcsGwPEEnSELjTEnHGsFIOu1ZBu716kv2Cl0XgFmDra8PxYyDhSpVU1aA4Q4wt3m1pQ0eqYi7HCNqi3mHmN7jQM3+rLrECzPc24dw8nAW7cdFHmyghyerEqFCMTvoHS/bCmp2LK49BujznUtkft7fiVVB3n6P300t+J9zGo+MUxjG4VXzsdrIIznNsMMXOZZ8CvNYnoVJtjmSNsxV9RafaBjvup3e6C7f63eV5LMnAYYvnmt9Gw8JG8xbExSeVE+knGhcPt+xHnjkArQyTq/dfDgyny/z5dimb+szF8iFTcbaoAjQ+kdbM+qn5+m4yVuZYhmjggPoLcMz1c96JANvVvsILHKYz8lfhxBllKblCKPJt8/sbqUuDCa2Gkl/LOnVpGEpBZFS861z70PiHHSnR4oYkSgivstqgQ41KZWtuQbFyXWhA6d89IDFGBrCmNh9BywgxN2ZfWxY2HdYrPMHSeD0cSVI/QlzGphbFVH37JJBXYCH3dMLyRqbP97iKBgQi0mSMg7XzCSEuisJUeC2M2Ktc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mi80oFlLtODKcHC+tWYo4bjlkxuYrJ6pccKxPnySjcv5Cu6jRRFTv1ILTV?=
 =?iso-8859-1?Q?3rHrJdo6DtZixmXc62uXmUjnHvjUXJL6+EypbGsAIzZH45tLx86YpkhC+x?=
 =?iso-8859-1?Q?+2Xt5b0yiFzgnDevxaDfxo24BLBHOXo7KCSZpoGtrXXjJJAZXdfza3/X6x?=
 =?iso-8859-1?Q?o8RXChAzZJ11if4UIEyqP0CCcc6chiLRWajEQiHyQZJE+JOAVGAaVBJd0c?=
 =?iso-8859-1?Q?gjGEC5Qiye5M18CEJ+jVxz4Kn6gNenGOaWnVDlb+Xz6xSSG8tCMeJ1PLNE?=
 =?iso-8859-1?Q?5X8UoZMguVc6drhl+IXRakLjaVvt4dZ2libiOIqyu2aD2SYuebWm1Si5QH?=
 =?iso-8859-1?Q?2uwveSb9yR0/xmA/uw174qUvbw3I920uFViTUBZcB/ocNBzF3bag+CSU+J?=
 =?iso-8859-1?Q?gJHHbCeJbyfM2PNve3Qm4tTgoGMVjqowSiwBd2wIpX9VSawTdLuVFU+kcH?=
 =?iso-8859-1?Q?LEbKX/saXuOls9MoCWGSIjSMys0iMP7MtGHRkxxkhtfgIaZk0m6jKkA6hx?=
 =?iso-8859-1?Q?HrfdQLMR7A06rDrXK1obXt1tIk2kj/7NYVT4wx0jIqVuFGPNamyuSG52zv?=
 =?iso-8859-1?Q?BmC7pfufHVTsG7dJqn3EoEwAyt4igDQ/9DONqMIN8F1xREnP2x5E614CF5?=
 =?iso-8859-1?Q?LxK+IoS9rjORoc4S8bqh2ldyb315qcR2kVH0F7IqDUJnMylQI8onzpXPHD?=
 =?iso-8859-1?Q?Uo17eaFX2JhRIG/wsfcyAJNFaDB6U8Ls0ucYbcdmhQA4SoMllpVrm9WRZQ?=
 =?iso-8859-1?Q?0HJOOcw9l0ItryKCRKACPAmyxEOf66KBli69CGvKvXR8W70Ux0aTn788EU?=
 =?iso-8859-1?Q?g6UEzcGLHJP/33Z9Q6LMPMMwqs63ZHg8XV/4FRhAlNsQ7/2ArmACUF6pB4?=
 =?iso-8859-1?Q?lJR3bVWtwx7pWEh6wdsI991RkfkT+2U5s1G7/C+EMOfiC5lVbxycYhBQZF?=
 =?iso-8859-1?Q?60ZHKS8K1d2XZFFFGbE5hMgI/G+RRsRIOzzN+FKoWoqq96cSDm68FNFL49?=
 =?iso-8859-1?Q?85LPZ1uNy6boPYvbRW0flkGMZJMug4WwHs3rfUSOKRPwvvfR0ApyOJ2LLx?=
 =?iso-8859-1?Q?VxiIFL09GQvvyy4AciOqSK1AdY/lwOMC+YErnXJ0rwDlVHpUVIRaw5Oej4?=
 =?iso-8859-1?Q?0pnyVrcKkMIEepk6weT400sE34VZ9eB7wfB5pnIob62gxKIY7lD53zuZBd?=
 =?iso-8859-1?Q?vMf+aT+qXOTMd+afxXbvenPKyBZlhxPLYNxmmnkc85BEPPi+XVzjVtVZBJ?=
 =?iso-8859-1?Q?Jrd+VRYdO6n7+RL1WoOXJk/aRSwQIVG5oFmiyBygNcD44a77BUcRwiL/DI?=
 =?iso-8859-1?Q?UnIEf8oE+bctY3fqsPjkNenMVuHlKL5p39Z+HRqcpS/9pqb+CkKh48yH1I?=
 =?iso-8859-1?Q?PF0CrdHN6WwcA0IMkFs75q3Iif0zW14dBRZ/gz9dU458HRAlQamWq2NfQx?=
 =?iso-8859-1?Q?pybxTqn6zNgE/vHlPFoB9neF3J9jzz5MUoAsGrPjWHvpslB+A3akFUO1pH?=
 =?iso-8859-1?Q?6DasbSV2Y6oa5rsGCS6pvIbDhdGaVHMgh2DmHRcqv073Hx4B+VS9tIfFPt?=
 =?iso-8859-1?Q?Ps1422GuCcN4RDJtCLwYGJp9+eere0CX+R1v6J8C89ppM3oFJsynSHssqc?=
 =?iso-8859-1?Q?IbziUqRiUX9DrtZ0D563Bbx+D/XxSo6S1JvsnT97d+fIhJ+H3yXHTRWr2f?=
 =?iso-8859-1?Q?UdT4KciAQ16K++Ilarcdc5vMZ3kbq8I9HHB50GDIlEZHnmYUmDzml+XKLw?=
 =?iso-8859-1?Q?p3aQlxPYfj845FKYkm/iPcoGnmJg6IiJ/eU1lnqFaXS0vXj983433vvf7S?=
 =?iso-8859-1?Q?H5CqsRzSGCYHuDUTrjXU9GD2atjWg5t8AuM3Rp9PI/Ztrlty3OCw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7075f2-f947-4530-b7ec-08df3aa9ccc4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:28:27.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNQaIcdqidPtnFrPI+9OFwXlcCAsZ288+kiYqsHY8DatSIIUP3Mjx1ckyVm62jQry9hL6/6vxeCF7s++Eo45VRchZNinsyxBQSIz2Lg3FGATi0RP9cW+oE6TF+o9jtSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12014

On Wed, Nov 04, 2026 at 03:55:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dmaengine: pl08x: exclusive reset breaks shared resets in pl08x_probe()
> - [Medium] dmaengine: pl08x: MMIO mapping leak on reset error in pl08x_probe()
> --
>
> commit 5b724fceef572df4410288b36fa49f5ba64ab7da
> Author: David Yang <mmyangfl@gmail.com>
>
> dmaengine: pl08x: Release the reset before reading registers
>
> This commit acquires an optional exclusive reset control and deasserts it
> in pl08x_probe() before accessing device registers, covering devices whose
> device tree nodes specify arm,primecell-periphid and therefore bypass
> amba_read_periphid().
>
> > diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> > index 543c2eb8cfa81..33ad6c42cd7fb 100644
> > --- a/drivers/dma/amba-pl08x.c
> > +++ b/drivers/dma/amba-pl08x.c
>
> [ ... ]
>
> > @@ -2725,6 +2727,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
> >  		goto out_no_ioremap;
> >  	}
> >
> > +	/* Release the reset before reading registers */
> > +	rst = devm_reset_control_get_optional_exclusive(&adev->dev, NULL);
>
> [Severity: High]
> Could requesting an exclusive reset control here break platforms where the
> PL08x reset line is shared with other peripherals?
>
> In drivers/amba/bus.c, amba_read_periphid() acquires a shared reset control:
>
> 	rstc = of_reset_control_array_get_optional_shared(dev->dev.of_node);
>
> On StarFive JH7110 (arch/riscv/boot/dts/starfive/jh7110.dtsi), the PL080 node
> sdma (dma-controller@16008000) carries arm,primecell-periphid and shares the
> JH7110_STGRST_SEC_AHB reset with crypto@16000000 and rng@1600c000. Both
> starfive_cryp_probe() in drivers/crypto/starfive/jh7110-cryp.c and
> starfive_trng_probe() in drivers/char/hw_random/jh7110-trng.c request that
> reset line via devm_reset_control_get_shared().
>
> When pl08x_probe() calls devm_reset_control_get_optional_exclusive(),
> __reset_control_get_internal() in drivers/reset/core.c rejects mixing shared
> and exclusive controls on the same reset line:
>
> 	if (WARN_ON(!rstc->shared || !shared))
> 		return ERR_PTR(-EBUSY);
>
> Additionally, manually calling reset_control_deassert() without a devm action
> leaves the reset deasserted if pl08x_probe() fails later or when the driver
> is unbound. Would devm_reset_control_get_optional_shared_deasserted() avoid
> both issues?

look like make sense.

Frank

>
> > +	if (IS_ERR(rst)) {
> > +		ret = PTR_ERR(rst);
> > +		goto out_no_ioremap;
> > +	}
> > +	ret = reset_control_deassert(rst);
> > +	if (ret)
> > +		goto out_no_ioremap;
>
> [Severity: Medium]
> Does jumping to out_no_ioremap here leak the pl08x->base MMIO mapping when
> getting or deasserting the reset fails (for example, with -EPROBE_DEFER)?
>
> In pl08x_probe(), pl08x->base has already been mapped via ioremap() right
> before this block, while the error cleanup labels at the bottom of
> pl08x_probe() are ordered as:
>
> out_no_platdata:
> 	iounmap(pl08x->base);
> out_no_ioremap:
> 	kfree(pl08x);
>
> Should these error paths jump to out_no_platdata instead of out_no_ioremap so
> that pl08x->base is unmapped?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261104154542.3131916-1-mmyangfl@gmail.com?part=1
