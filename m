Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834613DAAAB
	for <dmaengine@vger.kernel.org>; Mon, 14 Sep 2026 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397633; cv=fail; b=HpAAC0fE0zmVipza8lgFF3VTP5K/r1QaKTGUuamz6pA+tFLeFEGitZegqLZM3c0iR/mMtCB+JLik9vz75KMkE10PbnLyofFhLoWGCFPFOj9d2H7XHlk5oWdHH8JEcwe7Wcp9t/EjQ3TvV4n+XRESa5M6ZuCngBUCQ1Ng4aTYMqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397633; c=relaxed/simple;
	bh=W91e7uVxdtcOSwoEcKy/c7jX6YRSDoGelzkXOUmSrGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HBhh8r10ivuOtC6qnMupywj2zQrRSESA6U2wv52sL3FHEVYjpt1XasrbT4QRV6QwMwS8bxs+aW9gXfQ4ZDcRozA9ysmGOetbWYN+Kshb9y4qR4m6jjl9HYw8HEDoEfSOpdLDETRY3CsobK5/cn2tnIagW17yVmJZFpaK+RI2f2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iThW2PuP reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iThW2PuP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1IZpg7ckepr5fIHlnvB1QTw0WTeaxhh3igDXjPMvgepGDAPLjKtP0sGfXzNjO3itfb6QsEKJRAT0BgJNPefr15cBvtJYzr+IbcxAUgvdhgzYOvMtz3jCqlxSXt268aoBB0pY5hDaFsWtcmK6SWeGPDOO2PttCNUhi6MLS1KX2Oou7isx+mSsEBhWKANgwxYP0lUIlK38J2y7ZCUlDkpHld14e/TfXlYPaWamQyiFSZA/386cLQ00x88h7HttyTTf7/3SfqRtEgJPDmpaRUmqQqGBLLF5n3i5Eq56HlZ5F5895LXEBF9K1yiQMooybSyjxX1xg0+p3mSxH0l/s5Odg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGDjSJKFw7d+YSvsHgfy8qaLUDK9ue1aZsSc3Z/Mu6g=;
 b=duuO03OKbbfgfDdiyRDMqkhSGjHQVhIVmj3I4fWe0H4ISEJUUFhxfyR4msM22HoP4U/YKp6pEPNfEa4yv6ohLG4y7YVLmWcKzpjDkEV3fGIXskgFWWeROiEJ+CPp+iROR+RVhTnaAmZTCeDJ5FXBJXh89qqiN3sNX5CUpK7aL9xmvTS4fCVs03fN8re+l2Teq8x31DxGAg9RrZJgOKJUI/qj3YtiscaD3xiieS5bP5NSzXHTZ+p8tJrv6My19ZmApkPR+4u14gOImM9Cm61iWxOHVy9s11PLrIHXlwngxs8cppGfvqlceG7ltBjeoqpljbL0rWTzilDG5Xfl5yDIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGDjSJKFw7d+YSvsHgfy8qaLUDK9ue1aZsSc3Z/Mu6g=;
 b=iThW2PuPEfWJwq2Lpu3HDR2MXbFVcxk7YotOI9zueOND7HimV6KjcsIgToV8SxBCD3HdgNwv95C22KqokCQohF3FTUxsz375ipOmzWNZFe03wkvtdcKwaTk6UMuitldylHi3NMY2ho7UnfJdp0SjWBY+KXLMPCrjWzFWsa+x2fiDPQlMKjESvQpULHAtqtoPYN34faycOwNG+DhTUuUgYr9txqdqb+9KEIpAt/Mfua+atu/qUnBpFofPD3EvxwR20SswCzVHhj9sSTAscEITSFA/M63fODSnxdkVUipqROS3UEjIeOTOuy277Uab4es3Iz4b3HBKOhgaRV1Kl1ZAHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:53:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:53:48 +0000
Date: Mon, 14 Sep 2026 09:53:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rosen Penev <rosenp@gmail.com>, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCHv2] dmaengine: ppc4xx: convert irq_of_parse_and_map to
 platform_get_irq
Message-ID: <aqgKbf_wiS9TXpUa@SMW015318>
References: <20260913195547.41579-1-rosenp@gmail.com>
 <20260913200914.9A69A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913200914.9A69A1F000FF@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0180.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c5abae-87bf-40c2-1a5f-08df126ffb59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|18002099003|22082099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6pjnzjbbPSoI5ZgRhKE3jDo2oQdDvXgNUfe9XahYEQON36SYQVp1BKqkv/AVO+6LzlYNnyoz3aT0GtWPdtjG4aXA76JD7QjVAcLD9XgV77yK6vTEJIyCMbDR4TYA3EKDrrk1xz7YeDsYgYkWAPIjF9fAnmw6uk4WR/qRcXTC70a1m0HvbHlpfVJnHZtpu0Lgmx+yyuZe/qVCAFw0eIxyPbko1d1dwtNK1eKdg3c1mtLhldmvVMVt0Z58uqze0EjE01reBOFe2Prot3RAZtSsfdmGkCs5TBPWj9SbeFl6un/7ldnv6WE7/Aw4nQDwK8+e/DrF9wsw0WIMmHwMe/4h9JjXX+rcvS3MPliSJ72JkU75xRVyY6BCxKoC1Z0VrYDwtkDGKHU99dUTCQFO4/00k7w5WCVZzZc6OFhMPkWCKQa2xFJizKcpsLLgT7rGuMfoNh7NlYqD6hqppDrlfowZVffmmr13iwh+15pNmFNrEqwPTmi8R8jgifHSe5rBIWZTaWZUbLaNXwy3p4EpGVxkMk46Y/L2ERfwa/UGfX8Xiwaa9wGZZ4Z7/8pLEyaqWGVbHhj3aDDl4AhDwIlmdS0C6+mA+iaVgYaQpm/9yPB7oK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JgiC5VmZxaTrEDniIgvlo3bnhDI+br5i2VXTTtB1MdTFekkv58AXm94/ls?=
 =?iso-8859-1?Q?LmOLzgaNb1thxcJ4nF0/S7soGuUH4RSrhqkH8qWB2LRyFIpkgy7X7tKREz?=
 =?iso-8859-1?Q?0mB0zBBgthrBkZ98yHKgz4eHZqooJ1XkOOuiCAlahkrqFUzYgRtC3SJ/dc?=
 =?iso-8859-1?Q?BfJED0Yen4ggr+s4rZS9guO3+yI+MOo2vthobqOPzMprMaThLDewOPsvti?=
 =?iso-8859-1?Q?V69aeGAw4Ow2YKwjCLms29oZa5AoousXoVagnvFH4XkECcbWXF423lsbOh?=
 =?iso-8859-1?Q?99lap1IcPuhhkBk7T3mN8chZPrdekIXdPc1ccCcCjBnqk0aiMhwFurML2g?=
 =?iso-8859-1?Q?a1KBlPntvn6Uz4hu4ZmWXwFl78+t8XH6iwzczTvtLfMhQexBaUdS2GzZJm?=
 =?iso-8859-1?Q?dIc8LFzfGbfcAVGoIK2cJEZBe1SJwzuwudxjkUNX/4LnwTxrtml982ue1q?=
 =?iso-8859-1?Q?pLpUicua7ciODrMhhFYd5GOK4eWyVnZPhk3YbYRVFWTy+Ei7HI31FU4+U4?=
 =?iso-8859-1?Q?x95u8QjDf6Evzy4b+HIEMRnVPHDBsdroyMTdU/gqMjb8ZeKJDcF0Y9h5Wa?=
 =?iso-8859-1?Q?O3w9JpZ7azM7ovHDGGo6xrGRq9/31vgicrQhUvHMefYSJswAWOok9raknf?=
 =?iso-8859-1?Q?sjcjnUVDleMhU3C/A4Ns9/j+L1p5kXXG7Lejk7dshHbNdEZCa2crFH8HcE?=
 =?iso-8859-1?Q?xOoa4J0CSeznQf2r1yyHwy5MA0+r2QtEuhhRytipq8hxgWkamnVJY2yyip?=
 =?iso-8859-1?Q?A4cmYIxjRfPDxAhZkFc9zG5CRaW3L+eaCGiYXX9x+NkIujdPgWat5hiePi?=
 =?iso-8859-1?Q?gh0nEaYbWCRPDvuqqdp6wQZA44L7JzdFwQzNQYZYehJnNTNz4hnPLFdEfr?=
 =?iso-8859-1?Q?sJhSG//SQFV1t3AKrWSAjpKP07VdvSJm8c8GOxO3/TgMLJN7fQeTFWSmlo?=
 =?iso-8859-1?Q?/zO92lAz6/oI5qChH1sfSxDYYm1G+gAjCNDJhRMxzabTdQk5Mi/EqepqG2?=
 =?iso-8859-1?Q?5jS3kUFEjFNVmCp8KxjWy0BNxZjJsLDiztgdntxyWXuPG8a1sNvuMsdQ5N?=
 =?iso-8859-1?Q?QcGkzB+K/a6GGFQEs6o6Op3Tnf44ms7I5CFvJ2DHDNKksV8JVg3K7tXP9n?=
 =?iso-8859-1?Q?/NmFnj5yughfUvJt9zCXNBGorfZL5rrh2jFCEZcc3LhVvoPYXoGJCXeZRd?=
 =?iso-8859-1?Q?1x5+KOtaAz0FCQWevTOhEmWyDKYwKsoIeBEP/H8KVFQTMC0xOL5LnMu/RQ?=
 =?iso-8859-1?Q?X22nUq6utkBL+CFfP/kP9IlwozIz7/U/PX7asw6xJVUzxB7jv6V2ZN3qO3?=
 =?iso-8859-1?Q?6h+sBIQf+GEWXbRNDsgUwH042kzTjHqj40xtxlepAuO5Qd2scY9hz40zdl?=
 =?iso-8859-1?Q?r5Q1owhwsCXxGFi1dhHAiyYkW6L8Xdim5Lug1CN1GqncxTbwqjNtq/mtfF?=
 =?iso-8859-1?Q?UIqST4W6GY5399FrFfT/pLgzr3wWdA0HJW6n3s0lTCm/oUDCd6lLNzDHhB?=
 =?iso-8859-1?Q?4QZ4O/AHP6L9thgGJQ9QAeKFQ/+M+dmbblsHWVRPoJcYoXcJeglZPjaEqk?=
 =?iso-8859-1?Q?+9/6Cb+xDnrGE73JbkDgUUvgkR2NfRUI4+7K0cpxqdymk86AwwikdpzQas?=
 =?iso-8859-1?Q?8jnY4mqhYg5fPwgqfeU/Ddnag1NijmLPaV2GO9RFBYSTfKaCq5KejMdafm?=
 =?iso-8859-1?Q?LFAXwTYOPdhmarnPmd4Ywj5ThW6iWy41Svq1ZU5Ps7qAsDyvHcn9HbJYIS?=
 =?iso-8859-1?Q?gMRlG27uDk2PGVFL1TjCcyEjSgJ0tXQ92gs8LYmvbl/5vq7Ppa0Tteuk3v?=
 =?iso-8859-1?Q?TahxXYz/12sLwR/5ksx8hv4aJMig7gUsumW2yqXscoB7f6FV+r+/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c5abae-87bf-40c2-1a5f-08df126ffb59
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:53:47.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Anyo5mboWG5Vjz4t07csatOv0hZuoDy+6ktUxoETxIhdVfm0PczfmNlSo6sgLP3FLV/sqMTCatLY1ktFIzXUsWVSgCkBJ+JMWQsFkaTeRP+gXqi0Nn4se7uuSGiHstJa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661

On Sun, Sep 13, 2026 at 08:09:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [Medium] Failure to properly handle -EPROBE_DEFER from platform_get_irq_optional(), breaking probe deferral for the error IRQ.
> - [Medium] Inconsistent validation of `adev->err_irq` leads to a leaked atomic reference count if IRQ 0 is returned.

Please check above issue?

Frank

>
> Pre-existing issues:
> - [High] Pre-existing memory leak of `adev->i2o_reg` virtual mappings for the DMA engines on driver unbind.
> - [High] Unprotected read-modify-write on the shared I2O IOPIM hardware register.
> --
>
> commit 50a4484470a83649ae6d7a02d361e752aed3ddeb
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq
>
> This patch replaces irq_of_parse_and_map() with platform_get_irq(), which
> is the preferred way to obtain IRQ resources from platform devices, allowing
> the framework to manage the mapping. It also fixes a latent bug in the error
> path where the error IRQ was not freed if I2O setup failed. The device_node
> np declaration is moved to a tighter scope where it is still needed.
>
> > diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> > index 279a431ccae38..99aee726644e0 100644
> > --- a/drivers/dma/ppc4xx/adma.c
> > +++ b/drivers/dma/ppc4xx/adma.c
> > @@ -3865,28 +3865,24 @@ static int ppc440spe_adma_setup_irqs(struct ppc440spe_adma_device *adev,
> >  				     int *initcode)
> >  {
> >  	struct platform_device *ofdev;
> > -	struct device_node *np;
> >  	int ret;
> >
> >  	ofdev = container_of(adev->dev, struct platform_device, dev);
> > -	np = ofdev->dev.of_node;
> >  	if (adev->id != PPC440SPE_XOR_ID) {
> > -		adev->err_irq = irq_of_parse_and_map(np, 1);
> > -		if (!adev->err_irq) {
> > +		adev->err_irq = platform_get_irq_optional(ofdev, 1);
> > +		if (adev->err_irq < 0) {
>
> [Severity: Medium]
> Will this silently swallow the -EPROBE_DEFER error code?
>
> If the interrupt controller is not yet ready, platform_get_irq_optional()
> will return -EPROBE_DEFER. Treating all negative codes here as missing
> resources prevents the driver from correctly deferring its probe.
>
> [Severity: Medium]
> Does this inconsistent validation of adev->err_irq cause a leaked atomic
> reference count if IRQ 0 is returned?
>
> If platform_get_irq_optional() returns 0, this setup path treats it as a
> valid IRQ and evaluates to false, executing the else branch and incrementing
> the atomic refcount.
>
> However, as seen further down in the diff during release, the teardown path
> uses if (adev->err_irq > 0) which would evaluate to false, skipping the
> atomic_dec entirely and leaking the reference count.
>
> >  			dev_warn(adev->dev, "no err irq resource?\n");
> >  			*initcode = PPC_ADMA_INIT_IRQ2;
> > -			adev->err_irq = -ENXIO;
> >  		} else
> >  			atomic_inc(&ppc440spe_adma_err_irq_ref);
> >  	} else {
>
> [ ... ]
>
> > @@ -3987,13 +3983,10 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
> >  		iowrite32(mask, &adev->i2o_reg->iopim);
>
> [Severity: High]
> This is a pre-existing issue, but could this lockless read-modify-write
> on the shared I2O IOPIM register cause data corruption?
>
> Both DMA0 and DMA1 engines map the exact same ibm,i2o-440spe device tree node
> and access the shared physical iopim register during setup and teardown:
>
> ppc440spe_adma_setup_irqs() {
>     ...
>     mask = ioread32(&adev->i2o_reg->iopim) & enable;
>     iowrite32(mask, &adev->i2o_reg->iopim);
>     ...
> }
>
> If one engine accesses ppc440spe_adma_setup_irqs() or
> ppc440spe_adma_release_irqs() concurrently with the other, the lockless
> ioread32() and iowrite32() sequence can race, causing one engine's updates
> to silently clobber the other's and permanently break interrupts.
>
> >  	}
> >  	free_irq(adev->irq, chan);
> > -	irq_dispose_mapping(adev->irq);
> >  	if (adev->err_irq > 0) {
> >  		free_irq(adev->err_irq, chan);
> > -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
> > -			irq_dispose_mapping(adev->err_irq);
> > +		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
> >  			iounmap(adev->i2o_reg);
>
> [Severity: High]
> This is a pre-existing issue, but does tying the cleanup of independent
> per-device allocations to a shared global refcount leak the other virtual
> mappings?
>
> Both DMA0 and DMA1 engines independently call of_iomap() in
> ppc440spe_adma_setup_irqs(), allocating unique virtual mappings:
>
> ppc440spe_adma_setup_irqs() {
>     ...
>     adev->i2o_reg = of_iomap(np, 0);
>     ...
> }
>
> Because iounmap() is gated behind this shared global refcount, it only
> reaches zero for the last engine released. The mapping for the first released
> engine is permanently leaked. Furthermore, if err_irq < 0, both unmaps are
> bypassed entirely.
>
> > -		}
> >  	}
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260913195547.41579-1-rosenp@gmail.com?part=1
