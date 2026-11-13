Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.130.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794602418;
	b=vM6zHYn2aK5GUdhxzrInqZbP66/ZMVqOn7hEKJaeQu+qZr3Vd7hPuDYLKQzh+VbEICws
	 c7SL4eEKjuZa/KAsTbuR2/1KjUbPMw2QMBYlh8+epvFTavwohwBYfIkUciy3fszAjkQCW
	 C3FtZhknEYxrtBQ2u4it9w7SswM5T+PZpTxdJ5HwseFtyo2HocHtMAr06lrYCF8Jlni8v
	 K+7DXXPuP8mYLym20UEIwVOy9YdJk6ozdI4nFHP5iCjRME195k0wWeiSkJkcpAuXzoIxZ
	 p4S9AT8r6FNk+4skUIwraT2QdAFGeUD61h5XAP3uhUxCBlqhi+jgb0O3UUv34h9yPyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602418;
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
	bh=kdNW0+a323ZNyp6CuLVGeNe332nC1j9K8ICSKOXtD/E=;
	b=PtxwewEgukwAGCmR0vOvw/go55CA/t0zJU3I8ryqawunQ5WTw60OpAwDXFSV1qOkzWW3
	 EswApYLoXosqDrdMMEM2Sig3+k18bYFo01LcONojwhPS8f5SLo7wogJRxEUFKwvRgvjyh
	 n04tBHk/9LxOxdwxDTGFNabGLgMbn5Lgb0vJ0fm2EVRHHUw5iDWzIIy02xM60cmI4+mUx
	 sRAgRtpY5y5tYswuCDIsbAPzKFBU252l1IYHNvuVZoV4jrf8bRnWFk7hRL5s1LqjfcePe
	 RQYNEX6MRLcuTMmrglccOLOZJ6jGYf+G18qTUNfC9FoSY6t44qDfKuJZN5GIkKNEnoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rMXOap1J;
	arc=fail smtp.remote-ip=40.107.130.22
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FD0606A339
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 20:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FD0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rMXOap1J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmUsffzYy13lbC3u/VtJMQsJCtBo7oNeVUrH09lLg2GcAogsJ/Z0BMoJBE1D9tzTXv13GZUxABIdZ8X7Zcg4LoadxiwQznz2DYDLcw7DRPNTc8Wqs1TXA/Pv9A5oxhuFL0KeBCf+kvpqqdOnS1h1rMgzlj3ZuMUt9gLrj+cUcfFCHT5VxjYu1m70MQYrYYDRTuFXloPryQ4B5QPg+dmasjV47bFCzlCHMjBUcxok8M/KmDdqGO28G/kA5dnDhaGMTPlHK+H/atom1j0f8boZkMaO1KAd7aSkzMb4mK8LGKmyOPQCteqpYu3uAHSMrQDO4vEnxzCWiPUZ+nwYLfg3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAi8nGPzAUtIo9GPe5dum7VH5u4DFj89/ggawqJPjqM=;
 b=UG2KLwWZtYdf5JqdGuJpNxzFMg32DrgFlHuv57Up8DJl9hEvYuKDCioJ5rkj05sJ/YEjuucyvzmx1qIQlUbrFwesDIspKsXmv8+adsBIbGKgQWzSwM5ns0608ADdM8CTMJOyOLZs+fwlwFQ4kBe0P3C51KuejuM3T3+7HP4zsLYnB2X68DXBBipBYlUPWZb8H8RiuP6z25dbo92gIK60XlnVrgTDZ/0tKiTsTnTP7hre8H/2uTzeXkb77qQ/5QlL3I0WFFZVCuJCck1hQtvE4DNHQ1VRrcfTn6aE2BgdTn0V/vCZY5A+m/6zCFBcQDnSfkm9fJRLhk5G0/prB1d1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAi8nGPzAUtIo9GPe5dum7VH5u4DFj89/ggawqJPjqM=;
 b=rMXOap1JS14v3kj/2mp7delGJIPIPJ3QCT4UkpgzdCC06rfqI4YSbu1clesG1ggzizfb54HV2ZW/XtrjL+TxvF15/cTdVY/EN/IkyzDYDa+priDU4k7qaM/AE8clNbv97xzmPLV8l1G4N69A4Ce5o1Ab/hU/FhwSY6syD33F6IETGTeGaIJfTZFQeewayRoxxKfJLydRXVbZn1ODPUqsNScGta8UdN9nEDdT30UE1zc3fukDCqT9Imk9r9pVJDWaM5RTjblp0/nLfMhI4b7eVmYXRG+5rBctnbtL1WUk6G/CJxmhKvdK3R2+pK6VbKBQ47nlK+Iu2QrbYwxSIwfHog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:40:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:40:14 +0000
Date: Fri, 13 Nov 2026 15:40:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jiale Yao <yaojiale02@163.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 4/7] dmaengine: mmp_tdma: synchronize tasklet when
 freeing a channel
Message-ID: <avd1qd7txnhKwJy7@lizhi-Precision-Tower-5810>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-5-yaojiale02@163.com>
 <sashiko-outbox-175930@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-175930@kernel.org>
X-ClientProxiedBy: DS7PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:8:56::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 41c6535f-3e38-4a5b-31ed-08df41c65201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|5023799004|261021121427099003|11063799006|4143699003|261028144727099003|261026121527099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	YT43KJzrtrNnYfeAMu+9h/SIk703VpHa3xcUeybLWZ4dsTb7ADJoyIeLIHius5vHeFwrPy/+xUQewVGrL27TFtg4ATdljFEqNFLyFoO4J0f76iphwEhB69H/AyTw+4qXYq+i0Xd5ngg1ZfKOIKukUb3JD1Tn9LOSdAsIz2Zjry5XlLy6dUOoVYsM7IY8bjMlDpzZPfD2/P3p7ehpUopkMDJVViHdHhENG/uN13Nb6SKCDTG7DLBh8wQ3fOAL8QKbR19GtG5j0BpLKLP+kkqlf8593/i8donNRapp3XBXG6H/3R+DrgrvaAZNMF2MO+dzqyf7iviqJqzwzEi0rKH/6Jnv6crHEfcYvBpfEQn8m8MCsuiroBoumeIIKmsb+5tPaq6UnN7CQhcr3bbKxcyt5Lk7Do68O6vsVi/UkSt79wFgBq+6iddfbJXTmf59/ZJ/XBEipngv9yrDtRS+w7W6cau1H0YpUxDqUVPKSTbZoIHvo+0MoEPgEimKozRQSeBAJfkZ+2EIHMI6GLostMA+mDBTioYeN9Sd86WqUvzAjz9M9BVqB6uxIhEIDUe5yMYTJ7MtPnYB5cG14oRJHY6hkA/BPAx8x0dcfMH/ELBuu/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(5023799004)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?jwfU8IW+dvnt0Uhd/Hkf0xWq9xhHD2MiVOnptc6bZJ4PpeixfFGTyh7MqY?=
 =?iso-8859-1?Q?eakLQM7OEUivl/kPzoXwu/kCKEOlB4pWLQi/oIHzVKiL3d7x4V11kSOwxw?=
 =?iso-8859-1?Q?ZQbbvNWbvhJrZVRkBTgyA3RBzM/v5n22BTOaBnUi4qas9RlpZ0F9p7NpHO?=
 =?iso-8859-1?Q?25APupKBjkE0dWQqdHokTfzp9DSMgBXayUZhJhXMk1Bwk/iTiglJ8braYD?=
 =?iso-8859-1?Q?RReBl0+yHnCeesKeUn5QHEriGaNxUxhT7FxG2XGC3YhLhj6+GFRwaqdPa5?=
 =?iso-8859-1?Q?JySod5C6uQNw+Va3e3zzzUacbJvkUAU688+HaDU+6Y8KOZ70YZKWh976cy?=
 =?iso-8859-1?Q?rFHZdDUECjXkF1vorItVshvRLmekP51LjqZsW4+kmOj9eJHjGzIZszUPRL?=
 =?iso-8859-1?Q?/N1ufNeY7WrUF+64sRyOd85oismOm3b7Qo0CVDTTVDamlpyrJ2js3jCcBx?=
 =?iso-8859-1?Q?tfx5RcQpudaEAPhabrtexGk74vNiSEYx8qzD5CJE21ukpzqcZevDHUXL14?=
 =?iso-8859-1?Q?OgkV2vwZWtp/gbU85XDxYLvOwtOLHIkh7J1gYDrm3M580hBomm9Z37lQu8?=
 =?iso-8859-1?Q?Ms4Zkzvi2VgC2fPw6jMDbVmFge0b6jzT4uqjbN+0PC1Pbtw6ftpo2WQCZJ?=
 =?iso-8859-1?Q?Ul8INkZUU1/3iJv5pvf1TXZ39lOmHXYnMHf+77SVO/UGlS9WKtqtzPIO34?=
 =?iso-8859-1?Q?4gCx3ZitM5DwiNTPq1YRZiBeZ45lSnJmTYj9LanJIRSMt0R4Mhg9FGnkLp?=
 =?iso-8859-1?Q?YZfrg7K3lhapKynj57qe2MKOOfkUg5FRn870JyV+wy0aSZpINE98Vh8W3Q?=
 =?iso-8859-1?Q?YzS78FVoqtpZD2zJO4moIADLMYfl1obyzc7zjzmci5rrWRsnVKeCvKW3wK?=
 =?iso-8859-1?Q?uPKF7S8I/vK7n9KnT/BamZK1BsUgKLtbZdgvixU9Lzg/DO/bH5+feHWblG?=
 =?iso-8859-1?Q?pOlMBA+idL6ircJeMYedNjn49htla0//7/uSgx1dXrtxrnVg/EsIgOmMYq?=
 =?iso-8859-1?Q?E6EZVzkBSoijNpsS5fQu5M0SN78cAuUCTmFvtNOJMUmd5/lASall/eGiyU?=
 =?iso-8859-1?Q?c9i86oB33HKv80l8Pvgxvh3oBSlvN4NR56UAgS/A+qP4WAI7AoM9vh1zFG?=
 =?iso-8859-1?Q?hrPrjaefJ7FS8rs6OBYUAV7xSpw/dxVJOpfrIA5rbrts3BKiGbAZrVTRxj?=
 =?iso-8859-1?Q?h+KzYqCdhbPMBeE3+Aae8IDOtj4IcQnkq4wghaAu6169gDp7OKTFSecL1m?=
 =?iso-8859-1?Q?iA62vJQfLqDfUmMFwowkPA/mupfbXJTq0nc6kPwQ32v2lW8SZViBp6xV7b?=
 =?iso-8859-1?Q?iZyD5PDPSpbBIfDKO0a+GLJVjaUOanKk7Z8iwUNUAYgGiFW4XgMKgPCTi1?=
 =?iso-8859-1?Q?L+O9PYSxX/dY+kavbKLIAsYeGuI3d0zlxoTDu97jLZ6C5Q24I8ETDnwV5U?=
 =?iso-8859-1?Q?MB7tzzVEOj3M9+8EUIlFLbo1Qa6rbjCKdpR4rpxrsGViNIxT3JdM6Ls5DV?=
 =?iso-8859-1?Q?Dbr9bTdEUsVWk1DnfC2OPr8XnJcRMScp/jESxZw6444Qv6kKs8CMph2k6d?=
 =?iso-8859-1?Q?f9VVyNMTi8LB74S6xhSwefXZTVS4GmPvHOI3cN7P1gVuLXd0krSAy+C/HV?=
 =?iso-8859-1?Q?VObqJF81Vdvq0UtM3whOj1xG84MlFXyP4AbYW62Cz+jxkDl5i6nQO+MDab?=
 =?iso-8859-1?Q?DWwkskJUGHFbO3LaOOSV623I6qTlgp32xT6IyZSsGH1h5yMSosQPytncUf?=
 =?iso-8859-1?Q?UE0C7Z4tAMU13y01U7eF86IklHq9PjuRWMaWJMkbpBNUDUrAs0P0zzHpu5?=
 =?iso-8859-1?Q?Nb2zgdjrz7HLYAWzBmEfwUsRxXqV9CJaP8hrTniThq5ENmn3Uox+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c6535f-3e38-4a5b-31ed-08df41c65201
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:40:14.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suBqcFOL+xsAgzYsdIeP81w9zNpx8ka63gf7h9mZDiQ6Uch+arhDwmT6/ZpsurIMaFeUtAJ8df9SXHBie0EBseTy/r49IROQ8kTlOIpJ2/l9YdxI6cZ8AEyvdMMaP/ta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On Sun, Oct 18, 2026 at 04:25:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dmaengine: mmp_tdma: shared IRQ race in mmp_tdma_free_chan_resources()
> - [High] dmaengine: mmp_tdma: unclocked MMIO access in mmp_tdma_free_chan_resources()
> --
>
> commit 6a728febb9516f46ef428e03caafe8fc8e1dbec8
> Author: Jiale Yao <yaojiale02@163.com>
>
> dmaengine: mmp_tdma: synchronize tasklet when freeing a channel
>
> This commit disables the DMA channel and kills the completion tasklet in
> mmp_tdma_free_chan_resources() before freeing the descriptor storage.
>
> > diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> > index ba03321eeff79..e0de0967d7e70 100644
> > --- a/drivers/dma/mmp_tdma.c
> > +++ b/drivers/dma/mmp_tdma.c
> > @@ -399,8 +399,10 @@ static void mmp_tdma_free_chan_resources(struct dma_chan *chan)
> >  {
> >  	struct mmp_tdma_chan *tdmac = to_mmp_tdma_chan(chan);
> >
> > +	mmp_tdma_disable_chan(chan);
>
> [Severity: High]
> Can calling mmp_tdma_disable_chan() unconditionally here access TDCR while
> the MMP2 Audio island clock and power domain are disabled?

Please check this issue

Frank

>
> In drivers/dma/mmp_tdma.c, mmp_tdma_disable_chan() performs MMIO accesses on
> TDCR:
>
> drivers/dma/mmp_tdma.c:mmp_tdma_disable_chan() {
> 	tdcr = readl(tdmac->reg_base + TDCR);
> 	tdcr |= TDCR_ABR;
> 	tdcr &= ~TDCR_CHANEN;
> 	writel(tdcr, tdmac->reg_base + TDCR);
> }
>
> On MMP2 (arch/arm/boot/dts/marvell/mmp2.dtsi), the adma0 and adma1
> controllers reside in the Audio subsystem power island alongside sspa0/sspa1.
> The mmp_tdma driver does not manage clocks or power domains itself; its
> consumer driver in sound/soc/pxa/mmp-sspa.c controls sspa->audio_clk and the
> runtime PM domain.
>
> In sound/soc/pxa/mmp-sspa.c, asoc_mmp_sspa_probe() registers dmaengine PCM
> (which requests the DMA channels) before enabling runtime PM and
> sspa->audio_clk:
>
> sound/soc/pxa/mmp-sspa.c:asoc_mmp_sspa_probe() {
> 	if (pdev->dev.of_node) {
> 		ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
> 						      &mmp_pcm_config, 0);
> 		if (ret)
> 			return ret;
> 	}
>
> 	ret = devm_snd_soc_register_component(&pdev->dev, &mmp_sspa_component,
> 					      &mmp_sspa_dai, 1);
> 	if (ret)
> 		return ret;
>
> 	pm_runtime_enable(&pdev->dev);
> 	clk_prepare_enable(sspa->audio_clk);
> }
>
> And on driver unbind, asoc_mmp_sspa_remove() disables sspa->audio_clk and
> runtime PM before devres releases the DMA channels:
>
> sound/soc/pxa/mmp-sspa.c:asoc_mmp_sspa_remove() {
> 	clk_disable_unprepare(sspa->audio_clk);
> 	pm_runtime_disable(&pdev->dev);
> }
>
> When devres subsequently runs snd_dmaengine_pcm_unregister() ->
> dmaengine_pcm_release_chan() -> dma_release_channel() ->
> mmp_tdma_free_chan_resources() (either after asoc_mmp_sspa_remove() or if
> devm_snd_soc_register_component() fails during probe), won't
> mmp_tdma_disable_chan() read and write TDCR while the Audio island is powered
> off and unclocked, causing an external abort or hang?
>
> >  	if (tdmac->irq)
> >  		devm_free_irq(tdmac->dev, tdmac->irq, tdmac);
> > +	tasklet_kill(&tdmac->tasklet);
>
> [Severity: High]
> Does this prevent tdmac->tasklet from being scheduled again when the
> controller uses a shared interrupt (tdmac->irq == 0)?
>
> In mmp_tdma_probe(), when irq_num != chan_num, a single shared handler
> mmp_tdma_int_handler() is registered on tdev and each channel has
> tdmac->irq = 0:
>
> drivers/dma/mmp_tdma.c:mmp_tdma_probe() {
> 	if (irq_num != chan_num) {
> 		irq = platform_get_irq(pdev, 0);
> 		ret = devm_request_irq(&pdev->dev, irq,
> 			mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
> 		if (ret)
> 			return ret;
> 	}
>
> 	/* initialize channel parameters */
> 	for (i = 0; i < chan_num; i++) {
> 		irq = (irq_num != chan_num) ? 0 : platform_get_irq(pdev, i);
> 		ret = mmp_tdma_chan_init(tdev, i, irq, type, pool);
> }
>
> When mmp_tdma_free_chan_resources() runs on such a controller:
>
> 1. Unlike mmp_tdma_terminate_all(), which calls both mmp_tdma_disable_chan()
>    and mmp_tdma_enable_irq(tdmac, false), mmp_tdma_free_chan_resources() only
>    calls mmp_tdma_disable_chan(), which updates TDCR without masking TDIMR or
>    clearing a latched TDISR_COMP bit in TDISR.
>
> 2. Because tdmac->irq is 0, devm_free_irq() is skipped and nothing
>    synchronizes with a concurrently running mmp_tdma_int_handler() ->
>    mmp_tdma_chan_handler() before tasklet_kill(&tdmac->tasklet) is called.
>
> If mmp_tdma_int_handler() -> mmp_tdma_chan_handler() is already executing on
> another CPU, or if TDISR_COMP was latched before TDCR_CHANEN was cleared and
> the shared interrupt fires (for instance from the sibling channel in
> tdev->tdmac[]), mmp_tdma_chan_handler() will still schedule tdmac->tasklet
> after tasklet_kill() and mmp_tdma_free_descriptor() have completed:
>
> drivers/dma/mmp_tdma.c:mmp_tdma_chan_handler() {
> 	if (mmp_tdma_clear_chan_irq(tdmac) == 0) {
> 		tasklet_schedule(&tdmac->tasklet);
> 		return IRQ_HANDLED;
> 	} else
> 		return IRQ_NONE;
> }
>
> Wouldn't that allow dma_do_tasklet() to invoke the client callback after
> mmp_tdma_free_chan_resources() returns and dereference a NULL tdmac->desc_arr
> if the callback queries mmp_tdma_tx_status() -> mmp_tdma_get_pos()?
>
> >  	mmp_tdma_free_descriptor(tdmac);
> >  	return;
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261018040724.534641-1-yaojiale02@163.com?part=4
