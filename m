Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010A2E8DEB
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 20:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689899; cv=fail; b=vBBYQzuVVd8rxmMlLtDukxXLRRAZJQpaUhL+HnLyQcrnzIojCa7/rZ3Ua0+5+qgIZTrjc4nFSWoAwsN3pKMsa7sgvghCLSRuf5tO82+WkLfOP+O8PESmxaRnUIJ3s/0VtlvA9LJQPr21TfvUDB6hXQPOAxriVACeau5aDru36Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689899; c=relaxed/simple;
	bh=NCxWJJEqJTp1lju9JpipF72kI1zRjdlf/XYRCyf4OXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dm2A0I/+ZvdOu92Q4/+RjPfZgPoD5V68mwEUpUldQrIaJQaGnVcGe5McxlbLcL/KXptipzMTTXJ1k7AE2rUw+n0NIZwN/GKh3GhaghD+0p2OLAgpNPm8I+vpFKkKMtfIrWP5yYoLdG9MwrqL7+vCH4GP5ZmGCHhWt9tNpFBNPFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KSD2KjKf reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KSD2KjKf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lONMLwh0PWuoBXRlEeEAMUZD6kgNoZfduDg4Xl+wb9dr86YUBJ68nJXTN7yQ9i3neZeGxOdPHqvcFEKFF/yjKvUTp5cHyz1TkZQ7/vQt/ot8SNeIeUwyQaaVUgATe8OFvd4NijSpgMlx74Q7YiryRid63eQjFE95guD/aDeZ7L9/JmpcAcxVPk0d2gidHWs00iYeEyO7x98wKlrbJX7qqC7LWK5cgWGMT6MYQn/f9zqd1T9DSo75ON3mXAPKOroQCcktEw4nqoNhrZq06OJuyRNt6uVtVi7e81BdRRDgohIvV0a53C9B2oDDFwrpkLhKgJE9C2rPiK0AxNC/UiZsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27asUaGYBRcgRY29treC39Npd5nLkTud2QLEP0LIHYE=;
 b=SdehFZFi6ACdU1wlTiU9XGqIimKCLcVjw88N0aBZczO4wXmGUE29dTogPnRPtoS0FHfvzKJCnLAjEFXSuyp4wd/DGmNcyaxWzxkU4//eh0N8bISucsnMCr6iLYeV9c+Zq9pAYZce0KWVZEvCV19tpITpe6+MkMJa1WOBylJGN6tsX5qmYNSTXQ9BoSNJu5X+OiU/vcD6zHUEspS+/KCt7BBl/7A0fvO1nPzpvFjbZAlHH5F5sGeMXBik5LVj0GxXtky4Oi/zn+ZgSFSxp5Q7DFShAXMem7i9oH/FZ6I+qp7XjpkDN2EGFMn9o5n8SIFSbYJgntjGY2UVqqdFMHgu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27asUaGYBRcgRY29treC39Npd5nLkTud2QLEP0LIHYE=;
 b=KSD2KjKffos6BSezU8vGVPPEunHjntKvDAZArEVkMk1oxi76QyUYIEEi63/22QtOn/B0fcdN+9oWiUaY/xGGLGgvC2RzvpJxH6ahsI+td0Xe+8k9+CfhvkuXmtq5hOxaIkCQ7aUJIPTf83sHOfeowrwY7M8mgyOcAgUepibewvoiQs13xOJwNX35xbDnmQC+XMZ/aoOA3PaqOHgcF3hPGIvl52ZuD8Agh4NpqwMGwiiYJmC6qLKeMGZ/+g74njdE6SqZxiSybAk5va2e9NSBcHngN8jvW6eqUjnDst026o2Ch3UrSNFGNAxkcFlxBVIg1u5N9EeTckDzXsqpBfeFLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7946.eurprd04.prod.outlook.com (2603:10a6:10:1ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 20:31:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:31:34 +0000
Date: Tue, 25 Aug 2026 16:31:28 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
Message-ID: <ao37oOa-EkMe5qXH@lizhi-Precision-Tower-5810>
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
 <20260824113653.402771F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824113653.402771F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 95886961-44fc-4838-e7c0-08df02e7db14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|4143699003|22082099003|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LzYvOvo8CWgpFzouUrOH3WWWtJUAsxQdy72KAf5U8NO/X4ssIsFgIwd/Q+H5jxCGEwN35CMF1sqLGDQ/WeFiDNg5Z/aG4hsXyHFpnZCnntcCU96421kA238P2a5UB9cQScNchzrqGcjlLhsZ4pbL+ceWnMPAqAEiBPuJPlCqoj7gi1X377x60ct7eLstCu5FDmuF5QmfRdIYV32uViCbFWV02p9i0C0NT2nAp4+XPmnR6Obecd2Ekv+raiijNdD7uhMnuUjLF+0k/a4oRukCFNz7CykX4MAHuD13cq9lDU9gs9ExITTPJK2iVIaaTbT4kGvM1uUdW5rUzE+TSqbdsI+uf+OakRtxudW63d4sJ/W3y8Fyp7j/C+ljO4yId7B/Vw6IHlIw3eo8aY5GEs/g5H9oayzEn4sDBIpPATbdbuKarj1O758ELk/efAUv0oEUuWyjZFjGqQ1f0MZpc2tuM6WpFNgPrFBuwFgexLM6MSuTOzxAdBdBZGPH3KoWnIEOjL3X16PPYBoWV+7abs1ACJMMLh+5t0KPWioDlJLDsgH9Vx73pjZuvdMIWc0nxo5LbWX3yd097ssTA4PzF8YVFZTxbCn9AN2zNN/ZnDnFtxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3smZoLyPUGpMOyCxorcHb3NVY1hNpTvoY7BLNMkzmj+nW6fX9IhP/5DBQI?=
 =?iso-8859-1?Q?y0zfk3WYcjMwVGlK+PKbsNaL9b9d+aG737/QWLKgJf77lef88dC4Fox4ZG?=
 =?iso-8859-1?Q?hRLyoABpyXPI4Gm2py+lQVmM2oDElHs8b/9bVAgZ772O5bXl0f2hLd4fyj?=
 =?iso-8859-1?Q?UJlCAtWDQXOvNk9PeZEOJpf5wmO7SqQmYAzw6BriL8wlWLw4eJKoemWdeY?=
 =?iso-8859-1?Q?QprTmFPSn47aGVBh9iaQxFGSUehOc0nSJfogZHKUDHnTM/AJtdDrYALizw?=
 =?iso-8859-1?Q?7bFxDgGYhBr8q6stnJsNrFjA7ZSzYM/7XE0myESwoSLOP/+u6zGbGCQLV5?=
 =?iso-8859-1?Q?VNSeKJUrfop1m2SANV4pDexJyqsnoBYTSj1c3GYVvcH/Q5gDkcman1fHnk?=
 =?iso-8859-1?Q?xRbFDdpgaM/FbAOsq6P0/O/CrbhafiVqkG1Ce8P7LKqHdm4h70d42Ust7P?=
 =?iso-8859-1?Q?KuQSjmmyLDmD0/JFycsViY727QBGs6YMU6qSS0wOJAg4SlvDNRCknYoKQl?=
 =?iso-8859-1?Q?oiLvcBfgeD71DL5Q86v+CfgrNpi0DH+yVuaLG5XNxGRwCDZNr5bu0QSZje?=
 =?iso-8859-1?Q?neMaLb2REQstHTDtiNQlVlMzNieobmT96iAjfitMXMCX335z4w5W+cJopw?=
 =?iso-8859-1?Q?iHbnGq0PIOFqAV6PLGjfR7QKCc0pNGP00zmnU/Kw11yz86fzOF/bf0LgSk?=
 =?iso-8859-1?Q?Af48VhG4JQt5HvCICL3AfNeEd3IjrequinpyW6Hf2HfzbkKqRuTPIf/f6V?=
 =?iso-8859-1?Q?SmoXXcrlSEiob9TtykKFViNWZrcOK2PHcBewgR7AnwkWtv33zfhWSVVr/T?=
 =?iso-8859-1?Q?a096rIkdkCC056F7R1qiCvqTfnMtO1xOIPxSWecVoa/OgfpSB3LXsScSqu?=
 =?iso-8859-1?Q?hFDo5sVpXE9/d7oK+4aCaAJq1R+4Cv5qDLL2Zx3RyTV8/vYu9vnc61gCKa?=
 =?iso-8859-1?Q?Ghs6PA/q/GXlIEiZPdfQ7TKUzXfGGhBjLY+xoRpkoq8lSHtNpbVLqqNReK?=
 =?iso-8859-1?Q?1k70MS+qsxfvGKCwa5sn6xkCCiV3BYtCTwZWnu2n8QNDMW9ABHyv2pW93p?=
 =?iso-8859-1?Q?wyAtxp9AIBznc+h6/ZW1n108HvjUaHGrTJuM8+xMTv84QW6ltUzXDVcptr?=
 =?iso-8859-1?Q?7aUk/+7codMBRB0IutCo1WNpI9JShJZOUNJzjsfoxdHeyyEmm9sgSfbKzp?=
 =?iso-8859-1?Q?2Pc0E1jzaLNcErW+/em7MnEhAkfxlVQX7PhF1DzdK65VgyhxVFf4vAOmOZ?=
 =?iso-8859-1?Q?7JIuMQB/vqGWqZfKQY/5KBLzenqNaN6ze2CZspcqwPWnmeI9rP42rCUDVQ?=
 =?iso-8859-1?Q?6QgrwwmgyF78hoLbeEZSTt3oZCItlxfCgtsH/6mHXDMQqgsw6xkdPOPlip?=
 =?iso-8859-1?Q?ukEtdD6zraxZNV0gENtYeGekygEU51T6manqpaXrVXHIbTE884BnFCkmpp?=
 =?iso-8859-1?Q?q611eQ6NLo0RJRnHi3cYxAfxGNAXGIowkEuy7FxvJ5zY5YE9UIsNZu/N8q?=
 =?iso-8859-1?Q?dEzQiv8mlT1CfRs0pIXQKu0xWpmKYnPXJuEUsy6AqJnPgYAVBaEY9mifOE?=
 =?iso-8859-1?Q?6zcZg4V7rck88BkTw9UZ0H6tA1jFbwkurz2XOXCDN3/eRDo9Df3uYj6kJi?=
 =?iso-8859-1?Q?CZ5BsRv5HXVmXTkIjAj9Iyky9fQNtdhMKH/pjJEitQwDvCRkPmknwKpjxB?=
 =?iso-8859-1?Q?7uXVFk1gaOUAxnffIJblbE3Cyqqh6bFm2sRKhWk4jcHOKQxjFhIhtXGiAO?=
 =?iso-8859-1?Q?D390AOimILEpvx4Ii6Qxuwbp9Xwdgef0tW+uWA/uWlmhRbq2W9oiKqK/l1?=
 =?iso-8859-1?Q?cyDfanSZsSJRN6H5L/TBh4EZRCIoS0u1jOslS1jWTl4Ea8vLf0s7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95886961-44fc-4838-e7c0-08df02e7db14
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 20:31:34.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5FIWVFVEu4IEL5eEaUf8bC/TBAhj7Xs/+p2g7U5P77osNNogszvv4Ybfjh7EsyU4QWQPOW3cgP4xC57HcvZdstXeMgqls392AfveCM18kwwdvfvAEc0kX492S2DBrMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7946

On Mon, Aug 24, 2026 at 11:36:52AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Heap Buffer Overflow and DMA Address Corruption in I2C High-Speed mode due to insufficient MAX_TRE
> --
>
> --- Patch [1]: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support ---
> commit 0c2b77de6fa90756115b4394bd0db3e62bed9d2a
> Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>
> dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support
>
> Add support in the Qualcomm GPI DMA engine to configure I2C High-Speed (HS)
> mode transfers. This introduces support for the CONFIG1 Transfer Ring Element
> (TRE) to convey HS-specific timing parameters.
>
> > --- a/drivers/dma/qcom/gpi.c
> > +++ b/drivers/dma/qcom/gpi.c
> [ ... ]
> > @@ -1631,7 +1637,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
> >  	struct gpi_tre *tre;
> >  	unsigned int i;
> >
> > -	/* first create config tre if applicable */
> > +	/* first create config0 tre if applicable */
> >  	if (i2c->set_config) {
> >  		tre = &desc->tre[tre_idx];
> >  		tre_idx++;
> [ ... ]
> > +	/* Create CONFIG1 TRE if requested */
> > +	if (i2c->set_config1) {
> > +		tre = &desc->tre[tre_idx];
> > +		tre_idx++;
> [ ... ]
> >  	/* create the GO tre for Tx */
> > -	if (i2c->op == I2C_WRITE) {
> > +	if (i2c->op == I2C_WRITE || i2c->op == I2C_HS_WRITE) {
> [ ... ]
> >  		tre = &desc->tre[tre_idx];
> >  		tre_idx++;
> [ ... ]
> > -	if (i2c->op == I2C_READ || i2c->multi_msg == false) {
> > +	if (i2c->op == I2C_READ || i2c->op == I2C_HS_READ || i2c->multi_msg == false) {
> >  		/* create the DMA TRE */
> >  		tre = &desc->tre[tre_idx];
> >  		tre_idx++;
> >
> >  		address = sg_dma_address(sgl);
> >  		tre->dword[0] = lower_32_bits(address);
>
> [Severity: High]
> When I2C High-Speed mode is used with both set_config and set_config1,
> can this cause an out-of-bounds write to the tre array?
>
> Looking at struct gpi_desc, the tre array is statically sized by MAX_TRE,
> which is defined as 3:
>
> #define MAX_TRE 3
>
> struct gpi_desc {
>         ...
>         struct gpi_tre tre[MAX_TRE];
>         u32 num_tre;
> };
>
> If we generate CONFIG0, CONFIG1, GO, and DMA TREs, tre_idx will reach 3
> here. Writing to desc->tre[3] would overflow the array and overwrite the
> adjacent num_tre field.
>
> Later, gpi_prep_slave_sg() sets gpi_desc->num_tre = 4, which would
> overwrite the first 4 bytes of the newly written DMA TRE, potentially
> causing an IOMMU fault or bus error when the hardware attempts the transfer.
>
> Should MAX_TRE be increased to accommodate the new CONFIG1 TRE?

Please check this one, look like make sense.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com?part=1
