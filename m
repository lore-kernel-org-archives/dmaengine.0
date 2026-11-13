Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.159.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794600283;
	b=qQVS/9xV9d51elWVZUK0snAnMeI8IN8+k3PwBsmGNcWCGBlqH/A5FcNCP8gcBImQviL+
	 EIKnugMhMxhoNVIjKrb89x/s4aW33c/G4zIK0vIJRLc0Qxyy54rtIgA1V3+Qgf+/HSYfi
	 9XcireOqy/Q7Xxl4+6bVplGA/+SRjMfq9nroNwLi55Yp/0ScHpby/zmPenfCDvAPVau9N
	 nQRtFUcL15u8foci1ZW5d6qJmgDul6ybt43492ffiqpXBRYQnvBRnnLkj2TjEzNpEQtr6
	 nl/Lf5T1Mya99bBMQfTayeAB7XCuI3UWY627+oe6xh7/TuXQ+eu16Ur/dqgscMitl8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600283;
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
	bh=my1P96R50u8+L398DThu7Aw/skAq9kj14o1z9Rbd2Xk=;
	b=2vGZhq4JVm2HF5/2meUN1P4jj3YxsuRE9k9KR8ESu6HxCgGI/7qKehL4lnZufGhF22cw
	 UbcMafYsZxLqFmyWW5Jv9bwjOFNr5zQAVpt8GZQJGERW+3VVYDkkqmgDoONusigSktP/T
	 Ud1+MyoshRlNf3Km0bLTQQ1JfcgHuaZ59DwX98V9ToFXdBpkdB4LIZrEals2Kibyg7IPV
	 sNKCuXsh4dGI9Y7G2dL0qLrhthR+I9Yd6Mxib74cnRkAcqqoNRI7h2VJoIpLcopFRZHWb
	 MZncERSC7Qx2jwESswr6i4CpyxY+QY+gS1fbKqJDMVWi3DaD2+fhoLFmjGsYl4JV68g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uiSENmo3;
	arc=fail smtp.remote-ip=40.107.159.12
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33C606A338;
	Fri, 13 Nov 2026 20:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F33C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uiSENmo3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpwFV/1J7SmBoU/oo3rRLMzgcuNFSHAV1kmSwocDqZevKznvxqsbZDaA+93RNmcbVVbH4s9OrnWdzIq242OAG4hANZhBOlE7HYYMxFZoXY53lsA2pHdrDM+MgUWQUlhuxY0Nh2LP4NgVVal0xAuLW9+afFP9Z1HShc4FkF2KJDo3AIxJt54x6oLejRzu9CFLzx6eSmXf/O5dd9B6LOuDC22SCupZ6I1S0/riF/vPIF79LgnkIiQafVS9yCXy6mEfp6kByAMkJ6Pkg11x41Owo27m2KK0ZUK7byrAsRV0q8Of/86d6o8DmWXypKGm05XstmE2l1/4NeNCHa9J8Ub92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9zdcbjJiJckYZVG0tkNrMHarCVdgPuP9lhX1/UDHlU=;
 b=j/wbTZ1Y+ddNli8AT0szGuc+I5+OBN9BCGkBanU8fvJBe9p7LBCwuPsTmKKAb2tBElLsTHA3LgWlhwLZ3I7gA2JE9YgNVIi8XvbFXaY5/Uc4afC/GISlKZt9cN4PQMTiXOcfhIXg6u8QinMYjchqm8pS4xB4wyUZOAvF8O5DhSxOuigd0Ds0t0GklrHskXYMgbRCW4a9afC02YDIMJnqZZI4fy8qwbVU8lx7ShGyxg21tyUFiNAUUTbv4mVXp+/TuQyjeRpNfydIHpQ1uKrFWbSKiT/AoUnDgvTkP6pJ7kK8JRImeG9HteAV/liPOkTKnnQFTJ2HSQ1cXwZ77RpOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9zdcbjJiJckYZVG0tkNrMHarCVdgPuP9lhX1/UDHlU=;
 b=uiSENmo3DbncW/56vtN1Z1ghzR2tVAd8nUXQ0zgSldP5iWUldCrHnP/5qP3E5CyeM3ZxgXRxeMxuafNRRED+GdPZqCY4XXzuQWnagb9QFhngymKhpWNZSjnSGQXAAtyQU4zIou0/qd1If8M15e6LlpXTKwUeGhxlCljF/Pn08czCcrYJ6QrmFQTlH1L3cRruJskP9Sa3TVZEHCx7FyL+DhJAVClKycwHH+I2ZMahz94Oz7FOiGsftweAaqLjem/JT4qow1qn63MyAqcKBuWGObteWkr67G6dB5xo7fM87W2B/ewvB6vWUndHGkXK/guKzlZCl3gV1svQYGu4s8kX0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB11753.eurprd04.prod.outlook.com (2603:10a6:10:615::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:04:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:04:40 +0000
Date: Fri, 13 Nov 2026 15:04:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 4/4] dmaengine: loongson: loongson2-apb-cmc-dma: Add
 pause/resume support
Message-ID: <avdtUqpPcPf9Ykbo@lizhi-Precision-Tower-5810>
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
 <92800ae186112366116647ee4f50d4ba09249ef8.1792988985.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-184805@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-184805@kernel.org>
X-ClientProxiedBy: DSZP220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:281::8)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB11753:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e30fda-9fbf-4246-286c-08df41c15a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|10067099003|11063799006|4143699003|56012099006|260925021911599003|260925022911599003|260925021311599003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	25kYAKWcNWyNpZG1rr7VQcPfPCfuh56oHoncnb+pPRTihcGG/HKFqpPjYrpsSzMpwk2dhCuYJG+ozBgVf0MRQ1sgLaBPzKp+a/IQsmMKUXNanUn+0YiSeGVSFJM6E6WH4eZBV0py06mgCVsqPtijrb0DLb1Gy+c0G0l0uugUBByk6rb2MW6jPdMNX5F7nRpCXHXliKINglTfD4BJbIZi6HI99gnhFabRZ1eI1H6u0lRzMaUHUdN1Bv96JLYymdylDQFNvVik1scX7OXfvkQR5n26e0wLrwgdV2sQLqrd4XLbjJDBI1MU3EjgygIb77WLIfvDjEAye8kUZADpL1Zz322hOxGjEAhlCvmN8rphB6CJtR4ffHxFAksh3d7p0o5OiLMF7lRMlnyW68C1DgO+bJNRjvhccUJQMPZSz+biF/yHj3WLKQK/AeLbXsyr4B8ehkkLMfCsorwM7jxEWJTYf1A23ErAD4GbNybg4iUIjQN+WnCLGIeM057wD3n+b9LFi7uR3tuyhDnIOOjJ00D8LekEnNEi1jlN6EAVHv+Msb5BWa0ai/9IT8GGqbDjmJCIJEnNTsWljbPC2QEjlk0JZNhE5HTOLPVub9lbjNwkjag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0+sjJeyxfpzzJrpe22wDMhJJeaGzvSfsBZgJZg/hTL8sBvJmvrSsDJa9hc?=
 =?iso-8859-1?Q?eL2mlsin1lIrUs5kHBlAh7QaBOqid8wHCy2QpgIRsspDLjzvryCHKcgd7b?=
 =?iso-8859-1?Q?vnxLjwuQzud4syKsFcsgjXQ2YEqBhb7IkzneXa/Y2M4/Wa5/OAgqJMt7Db?=
 =?iso-8859-1?Q?uaDm4VwDRlf5jhcTd8cqXcf7BJl426I/KTtlEYikg4FAFIBwOHYFsZHbjl?=
 =?iso-8859-1?Q?kdnGaKY2vIMLuL9klkzZikNfCVzJIO3vs6cE5BLOjzDShll8om79gu5zjb?=
 =?iso-8859-1?Q?J2zqgre8ePhVvITItY2MIqMiKstqn/xSPxCe3hMfWN3WPdLanWzjinm/u6?=
 =?iso-8859-1?Q?qUdchlksEyrlHIutTyIcwiOIRJ5NdVnVxuq6quJI3Anyoq1fEYy0dVKXQV?=
 =?iso-8859-1?Q?nlAOFnIqJ+/Y3mJ20+hYl9G3XXKmNw11BIGr7xdxJWfh2YjFe7SmCng8Yz?=
 =?iso-8859-1?Q?vgrL1VyXfeJVMRkomnH5xsWdIfmQIDYwSu1LkQYJC0RYwOjIiKYqEzFhsr?=
 =?iso-8859-1?Q?pd4wsblVnTkcNr8yVRiOZL2kFZjKcgR88P0woGDG0lgImThoaShqkYnMZs?=
 =?iso-8859-1?Q?Tj5LPE8e2k8wh7H7yD+kfPRRWsHYQlUpu15joUPyqKOMms2lPZuDYLfZhP?=
 =?iso-8859-1?Q?6aAl82WYU7KkAE2YJJvCTJeneVuEuxSzvUcb4l4M4PcbREseO4BKYthfVr?=
 =?iso-8859-1?Q?oAyxKfPezvg+pkDNjTYmz2npptvDAGPXXMCoz/yVlBOGrVYjXr6wYfVB6m?=
 =?iso-8859-1?Q?S4QErIsCyK8QwVAfY+gRIsf0KS7nYaAl1X3ThR0mA79akzlz7XSxTdDHsZ?=
 =?iso-8859-1?Q?5OI9/GmjBeFU6qEQmEhKHai0uOXBbZ2Sg5T5Jcy5coE899oaR/Sq7OdyRE?=
 =?iso-8859-1?Q?itD0EZ3/JXgJ3PPKjTPyB5xdf62s4g/68dXOs2KnxTczSFdkxUPy+8iv8z?=
 =?iso-8859-1?Q?c8F3jErangr7VpK0tXOxU95+0QQ83oEeyzf8bs3fYEdKGwryntbUPZYlSQ?=
 =?iso-8859-1?Q?E9yX+ld1DwxW/R1c3WmXl141VsRtvoLS/KP/zN4STGpl6D42AJM6YQEABJ?=
 =?iso-8859-1?Q?73D7Og7j9IfYX8M2dRaVOGC4/G035z8H5p0jw+Ai4IkYWWYpvWqISqEWsw?=
 =?iso-8859-1?Q?f/ii4sMm8Y8bLworZgCcaspACTg+inSJwUvuNOsw4wk6LDtTrPjr5A1+RH?=
 =?iso-8859-1?Q?ezUI2EkfvXE5WvgcMExllPkpkebgftyhy2fDr8W+pgjVh7opuUpDrJmMOK?=
 =?iso-8859-1?Q?6L8nraPzpHlAN85QpeNjtB6XHWH4Nile1Qoz/u3jqv+kXJI0iPKbHZ3UGD?=
 =?iso-8859-1?Q?fwtUSZeV1tJ59C8eKd7KPsdLDBhYefA6Jo1cDNgFVHviFRFtpWFhbohDme?=
 =?iso-8859-1?Q?gQ5JRD8h65ekzZ1VAazaKmzqKgJ4+Py20vHHHieJZ6ZF5tz9YkMnAu34dI?=
 =?iso-8859-1?Q?IAcxUvfuGmetqrZUpeMYWTfX3o46L3Ui4rI16pJrMBOWT7Hs4KH31FaHFv?=
 =?iso-8859-1?Q?6dCEJNC9pzlH1sR2IquMNVEqmmO2PjN/mp9qv89X6ptk1EXL0WeGvwFy4u?=
 =?iso-8859-1?Q?ZAj2GqzuHC+HR5GesViLwURuuILLWbse5SmLKUbH8Y+v4eeCs3tURbHUOR?=
 =?iso-8859-1?Q?s2oJHqA4CNEwTggyiZc5iETkj9HTv8I0ihJeLDZipSG/tfP3/S+0AaXEcQ?=
 =?iso-8859-1?Q?mpIuFYchQTspZYSNmpP869MWBMYbcUfMSc4EZH3lorxqDbD7RwfhOd7rYg?=
 =?iso-8859-1?Q?5KKf1pn0pK4ITkddb5kYWjykvCDt5vNmn69+uuTJ05HsOOoefouRO6zrM9?=
 =?iso-8859-1?Q?xxWSRaKDOnzlXbuChUq8/NjJDiFvA1SXbPv9p1GSWUw7dRINRiHw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e30fda-9fbf-4246-286c-08df41c15a33
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:04:40.9449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHSsQh57v+SoCrx8ixzbR09K6frxchsqVeKy29LiSCPkilMbgaPknW6ITXQRurW41Tg7s2Gj7EL/T6Ic436OulxbnKS+cGfbni+OWr/YL4l+4A2Xs58Wwkz+AHqYSS89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11753

On Mon, Oct 26, 2026 at 09:35:17AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dmaengine: loongson: loongson2_cmc_dma_start_transfer() clears pause state
> - [Medium] dmaengine: loongson: loongson2_cmc_dma_tx_status() ignores pause if !state
> --

Please check above issues

Frank

>
> commit 8e161a43d78d90e76eaddc39b1b96c7a28b1dd6c
> Author: Binbin Zhou <zhoubinbin@loongson.cn>
>
> dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support
>
> This commit adds pause and resume support to the Loongson-2 APB CMC DMA
> driver by clearing and restoring LOONGSON2_CMCDMA_CCR_EN while preserving
> the hardware transfer position. It also updates status reporting and
> cyclic scatterlist advancement to honor the paused state.
>
> > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > index c654e05729024..a4153ea854623 100644
> > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
>
> [ ... ]
>
> > @@ -184,6 +185,8 @@ static void loongson2_cmc_dma_stop(struct loongson2_cmc_dma_chan *lchan)
> >  	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, ccr);
> >
> >  	loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_MASKI);
> > +
> > +	lchan->paused = false;
> >  }
>
> [Severity: Medium]
> Can this reset lchan->paused and restart DMA when a segment completion
> interrupt races with loongson2_cmc_dma_pause() on a non-cyclic transfer?
>
> loongson2_cmc_dma_pause() allows pausing any channel with an active
> lchan->desc, including non-cyclic slave_sg transfers. If a scatterlist
> segment finishes and latches LOONGSON2_CMCDMA_TCI just before
> loongson2_cmc_dma_pause() acquires lchan->vchan.lock and sets
> lchan->paused = true, the interrupt handler will subsequently run:
>
>   loongson2_cmc_dma_chan_irq()
>     -> loongson2_cmc_dma_handle_chan_done()
>       -> loongson2_cmc_dma_start_transfer()
>
> Unlike the cyclic path in loongson2_cmc_dma_configure_next_sg(), the
> non-cyclic path in loongson2_cmc_dma_handle_chan_done() calls
> loongson2_cmc_dma_start_transfer():
>
> 	loongson2_cmc_dma_stop(lchan);
> 	...
> 	/* Start DMA */
> 	reg->ccr |= LOONGSON2_CMCDMA_CCR_EN;
> 	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, reg->ccr);
>
> This clears lchan->paused = false in loongson2_cmc_dma_stop() and
> unconditionally sets LOONGSON2_CMCDMA_CCR_EN for the next scatterlist
> entry or next queued descriptor. Should non-cyclic scatterlist
> advancement also preserve lchan->paused and avoid re-enabling the channel
> while paused?
>
> [ ... ]
>
> > @@ -534,6 +545,13 @@ static enum dma_status loongson2_cmc_dma_tx_status(struct dma_chan *chan, dma_co
> >  			/* Active descriptor: compute residue from hardware progress */
> >  			state->residue = loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
> >  									lchan->next_sg);
> > +			/*
> > +			 * A paused channel still has an active descriptor but is not making
> > +			 * progress. Report DMA_PAUSED so clients can distinguish it from a
> > +			 * running transfer.
> > +			 */
> > +			if (lchan->paused && status == DMA_IN_PROGRESS)
> > +				status = DMA_PAUSED;
> >  		} else if (vdesc) {
> >  			/* Queued descriptor not yet started: residue is the total length */
> >  			struct loongson2_cmc_dma_desc *ldesc = to_lmdma_desc(vdesc);
>
> [Severity: Medium]
> What happens if a client queries transfer status on a paused channel with
> a NULL state pointer, such as via dmaengine_tx_status(chan, cookie, NULL)
> or dma_async_is_tx_complete()?
>
> Earlier in loongson2_cmc_dma_tx_status():
>
> 	status = dma_cookie_status(chan, cookie, state);
> 	if (status == DMA_COMPLETE || !state)
> 		return status;
>
> When state is NULL, loongson2_cmc_dma_tx_status() returns early before
> acquiring lchan->vchan.lock and checking lchan->paused, so it will return
> DMA_IN_PROGRESS instead of DMA_PAUSED for the active paused descriptor.
> Should the lchan->paused check still be performed when state is NULL?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1792988985.git.zhoubinbin@loongson.cn?part=4
