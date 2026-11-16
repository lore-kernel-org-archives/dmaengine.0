Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861152;
	b=d1ORveN/Wav53dllAgmBmc81dMb0As7dB3wbGTQJqFpBrFckbxVNOSwrjlINZfGPyhMd
	 ycyWB6UeIHzegGUMVpiFne7JVyOWZYfUrmF9JLyaE3ol26JnZzjTivDuIaAIOgKdAjgyN
	 63RKFW7Rdasg1nXyIAd7l8bp6Lq41R/C3MnmqN6usT7dkCF7G/UJtZX0FyJhOeKScb/PU
	 dUsTokgqggfnTu/t9aSlALXEXtM/BuafVBV9tq+Kx3Na/1hXbHcWQ0X+Ed1BtBVpbSszQ
	 X7x0UhablHU9GuRwgUnG5j+3oIvu7p6zKD2D3MA8fRtBwy8zxooI2EMF1WJXBIntfeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861152;
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
	bh=qwbM1uM4QDihkG1/BwUg6zsJ5IJSrrEkzppQf9cOOjc=;
	b=3GmeyJTx4G49BNCU9Ymd0Uj3RzMzlE6VtIDnH2EzEXTwwA1mZu2IsHRdwNJKMlC3fRPZ
	 GGAngFw7A2JLCaGo/HQXDB1RxD+df2k9LhAPxFYauvpJQpk0JBanYfdyseUxx9AVKbvHG
	 OmSk6RMEZJn0NX+qpy3f3QC6+WH2E0TYV8cjdHeGV66e2ZKGwQiECsjRHQvWh40h1gH5v
	 0I2Sbzr+ny40yIrnS2fuE/i/Luq+VuESFIy9TiTPZOPpNLWgkGUEDJ4u5TqvjjVrubXL0
	 5H88nJ8bPj0Bd2wADg9oKpuOKKuqsZ75YHuaFJ/5I0cUYhU1uuAsi1UkaaujYO3X8vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wsK9aQ96;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.51
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70F606A32A;
	Mon, 16 Nov 2026 20:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB70F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wsK9aQ96
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st6fxPsjLxg+lZNrE2Q2RfGCCTdYEqbmFWWmuwTsys+hFKYQwO2A39yVcO5x1j2t5WPZYroSCHG8DZ8CzT+HBJ3pimDWBoUHOuY0p6YnqqkYeCAYUATKCyvR0kQCF1MRgue58woZHnTwzdlKjEK8SiJqm6DRBzIAxqLBUspk9ogXVlL3N9FiABql+MYj95m2vPqLm+aMk3+EXyPkGBR5sz2NtrxAHytGt1YisHcxvn78mJaAl5RpiyVblw+ekhrOww/0ysItpJtMw1K6fVUwz7T+qXasjCmNlNcew0RUPYy3k79Gp2h3MY+1XomuVg9k9xYSn+GZeCt8skxgQIetBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwbM1uM4QDihkG1/BwUg6zsJ5IJSrrEkzppQf9cOOjc=;
 b=UYjjslnhZUjmPUIzemnNLcQTEBDQstjAyhbml48G/lw1bM0NvV3AwGuRejstx1pfu8rDNjS7dQkepvIyH9C1x0srBSbK3hB7xqbJn0dxzsdc5Qq/PyNFrGLZpyxyGf86wBRrKojJdbPCqeRh+ip1csVFS0njzenVtdLajmmi9Rumq3g8GVnVbs2W62V9U+Lh+OQMVyyp2q0/p/EUa6LYce+0SNQ7QkVnM2A468f8QxEvTZd3Uj5lRol8BL9WJS3/8jYJEb6jYwZs7fjKZKIObPIlIgwuETk0vojTpz4fF2ZC0Sxi4yOYCJCsa3wxKaSVxa1YvIaB9PCpyx8CBggSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwbM1uM4QDihkG1/BwUg6zsJ5IJSrrEkzppQf9cOOjc=;
 b=wsK9aQ965QbFyD0Ri+AoZCqhSnC1vvQ4YNeKnccx3qabi36KF+tMhVvjJD+FnOfNo82/or3sWLD6+0tgmQBjkX855cSeevD6e1bLvPDJGbDXt7uUgBERoJ1oPEdzydMBPr5U/17HDGTrv/OWfaJlKJkkN/V902hiLOwmM7wfUj+hcBGowjYNFQOC7EjtlCkF4PtMJTm5PfNh5VnP7pXDiWcp/QvI9POmVN3omXA6WiAkk7646XC1/q5H6IBOvv1wToSlxNptJopy9qp1dxn33kv4SvCqJLF6uxIN25UPx2hidaALSb1xT4OVJtl/vbpVShGvbqez/iTjDITdzSvW1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:32:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:32:29 +0000
Date: Mon, 16 Nov 2026 14:32:17 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v5 1/4] dt-bindings: dma: xlnx,zynqmp-dma: Require resets
 for Versal Gen2
Message-ID: <avtoUSvrM-lpNnZ0@SMW015318>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>
X-ClientProxiedBy: PH7P220CA0140.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbea0e6-f343-4502-96a4-08df4420bbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gn89cZ9wvTqcKWQ3f8iGeErbx+KIBiheOmcxK39BvDbGZT+gfSIvXr8vFNZU/oQUmWzhP0DXO+31ZT8dMjZq3fObXzMI+yq+/E3brVx09m9naucZVJdYW6Dd69jAnpgFKL2w9pyO/uWaFnu/hDE7h1N2jxnULJbaK07Kf0hCw3Zn0Igby6A9nwSsx1yFC+zj7y5MDra+J9fADdmkd6idGczS+S0Ga6HvzjdUQe+qi4E1jgJGFdpWOh0Z2G1HkYqoP5uBDVt9vftm4sOU+hk9uivBvaMIfup47aJkDmUO7paYHRHOVncl8KDVmtslMQyxR6TgJ+/CwfTRIcl4F8Z3f7UzWdXcNNq4b8uPWVly+cEaOPDL3lYbvyvK1hnipnuWDpRh2wyLmLcFNneeuI6TPgjmZMt8PJthi7s9Bm8G7vHi1OWwb02Ht2Ce74eDFllp84+66dZXymR/BCELQL8khvmCawkV2gGrPUSZx+CFw+AssBlGVNaYl0FfpTFwCOkKH6ycLZHNT0vFUls2vo7DykWDAepWj+rqt7UjJZRvprJnWUdMEtJ+oO5S4TFyI70aCrbDzBpHpp1dpjYV6/szKTXrCFajAXnjbQYLaEtNTZylQM/Orrvgc1C3N9r5Olr0WZ1Yt653OhuYnBGzC+kA94ydo+W/b9LnCvANYEBysng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yYItYroBA68GmLc6c2Nw9DNvMVQknVDRkHx17hQfI3pOHu5PCqm2rDor1G/k?=
 =?us-ascii?Q?k05iQjPus9+tLjwOiwHVzkJP09aNLvkVKQ6gCiCklbM9yo/4dXIB9MR/H/29?=
 =?us-ascii?Q?2Msj8s+pJVFcB3Q34xL6suCnp2wP6XazSAaSZvlyQtBWz1mHHUQUzh/45MYW?=
 =?us-ascii?Q?2QjgyTOPiawcZLRo/9DmSMyvl+REEToDTTvGQok2KpQsnXG6+vCfenRwGJ2L?=
 =?us-ascii?Q?IS+wisEFuYpdsOeArTjdNoy96DM6MIfrmgqOp50ZcFD7qG8cOD/PD4qmTFoU?=
 =?us-ascii?Q?mK45iZZiJI/5KmpkPwQq5DIzi18BTBJDZm0OfQhOl2RBlyrWcnJLPDIOtWxg?=
 =?us-ascii?Q?H7tQV8eEUaZd9od2rNUY4Zj52+WSWceCgkI1CwE+6ubPdekT6aiN0bQe/ual?=
 =?us-ascii?Q?qmoLD4+E0/JH15Oe7OGbFuB1d1Zd20NgKbErhmUOgbpxy7HWB2sTyuJT1Tt4?=
 =?us-ascii?Q?SkZNPkw+jPXW0vO0sdBMnqtx3W52j88iI2cCy93lrJW9OSRHFe47shSx0ntI?=
 =?us-ascii?Q?Lj7FTHMklJdPpr7LYnMLRR+u7ztF/KL1ZDuRKZ6cKSFZSN4Rf4lebY1LSCg3?=
 =?us-ascii?Q?2YGfoXPTdtBlY1QNm9f/NOaNLPdrR3lWSM5WGfLG9lw7nu9E/L8z1XgbZoFN?=
 =?us-ascii?Q?NuBrj9SJdGqmNuM4tSJnpkYkOgGow8JwLrQvcedS3tVp37UPmmnQWDtviyDl?=
 =?us-ascii?Q?a+oQVBZBMqIS4WpiX8aBgnufdBUk+5RZ/WycujQorTj9vBTMYi5upf5YjhZB?=
 =?us-ascii?Q?kcHvyYLq8qOWbZYJEXEp3D0LLnnzAxCazxSFF7+vYusy4mC3z9glmSzyBbXi?=
 =?us-ascii?Q?C+/QRucYZI0NQpLGC85sTWtsV8eD95K9I1zdYV5vUMR07wp2RIqg7xa1Z1YM?=
 =?us-ascii?Q?q0yVJIjJZtmAz71sBMd4ZF7/VZ3D0VDsjJjMMZ5JnSYMAS7ZMlozCcq2vWTU?=
 =?us-ascii?Q?zyNorJv19jg1FZy8xm8egu+FfvNiV3CtiKHryS5nfazlf16LFqJAjpfCdYUO?=
 =?us-ascii?Q?W4s/vY+Ca8B9Kn6jUyuwBskvzg76QSWn/a95AbjzrDrrCEDu9CgSw9H0eTS3?=
 =?us-ascii?Q?1ysNANsImQ6nue70ujfrZKPJnJEbmMUlDYHxvRBypiuzLa7xzHJcIT/cMaLq?=
 =?us-ascii?Q?UqK4l9GKaKl7kYIiparqkcXBAbwHp6kAua22RBUfyUXK2SfK/89GxIvKxRw1?=
 =?us-ascii?Q?AO81YHOBx/d5ykUE+xEPe27ROnn0uwIrQ8MU29xXJq//95E8qBoXXn4ofMtk?=
 =?us-ascii?Q?o7kYpgz6zeNyzSdWYA+cRgCU3ruHynPI3BLxp/JV08CnmBK6Y6QVY/edAhfj?=
 =?us-ascii?Q?KkDC02PPQXELWQdrNmb4zlN27e3ewG9i0qNwJ422Ob2ntWVCYkNBLQ5LLZ8M?=
 =?us-ascii?Q?lum5e2+T3Lx8uV9tVineZQKvFB8vUaXWsiKkow2A3TZ5sD39z2SklC18IL+Q?=
 =?us-ascii?Q?HutP2hRhEUC19HeT8tED7tyvtkNZvlWMAHFfnJdP86omPGA2gFoaZHab96yu?=
 =?us-ascii?Q?zSyG1hxfnZZUTX1VoGCU1sCuNODqZafcnOKzDyZ7+oxQFksJFgVlkMlw8m4p?=
 =?us-ascii?Q?DjKo8eJ3NCL962SPnwODxm9weVGFFnJMdj0jRErgIxEGuuZ/AFn3xGdlIQEj?=
 =?us-ascii?Q?1LEiTt+b8cjBQm8EbStpCv1/hh3uiWkvIl487DzmOkenBKyocBSZUmH14cd/?=
 =?us-ascii?Q?3S0+mOD4/vXEC3F51aX8cteTSt1c+oZKSWCszksEHMzEWZQJpUXkj6nHDxZh?=
 =?us-ascii?Q?OqRcrxOCEbTG6B2TmxQ+dT7NxF0fasuHhFGrxwZG0XfoEs9szsud?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbea0e6-f343-4502-96a4-08df4420bbb3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:32:29.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG7F93nzV7UCHpmbw7dYY+TjEw0P2lcwWAFqa+ApgxGZYXLfCZqUlycprSPJje/HLSnpVrv7hq718cA0x5UdmN2XloGlW030itQKh7Y6tW/08fOAYRghFMW6j23N8o84
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001

On Fri, Nov 06, 2026 at 03:40:23PM +0530, Golla Nagendra wrote:
> Require the per-channel resets property for Versal Gen2
> DMA devices, which expose dedicated reset lines.
>
> Making resets required for Versal Gen2 results in an ABI break, but this
> is unavoidable. While the driver works in many scenarios when no other
> firmware has used the DMA prior to Linux boot, there is no guarantee the
> channel is left in a clean state. In observed error scenarios, a reset is
> necessary before Linux can reconfigure the IP after previous use by other
> firmware components. Due to configuration differences or the DMA being
> left in a bad state, DMA functionality fails when sequential software
> components use the channel (e.g., firmware before Linux boot). The channel
> can only be cleanly re-configured after a per-channel reset, making it
> essential. This ABI break is only applied to Versal Gen2 and where the
> per-channel reset capability is available.
>
> Fixes: 36545c6a68b8 ("dt-bindings: dmaengine: zynqmp_dma: Add a new compatible string")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> index 2da86037ad79..59dec441307e 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> @@ -16,9 +16,6 @@ maintainers:
>    - Harini Katakam <harini.katakam@amd.com>
>    - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>
> -allOf:
> -  - $ref: ../dma-controller.yaml#
> -
>  properties:
>    "#dma-cells":
>      const: 1
> @@ -59,6 +56,9 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  resets:
> +    maxItems: 1
> +
>    dma-coherent: true
>
>  required:
> @@ -70,6 +70,21 @@ required:
>    - clock-names
>    - xlnx,bus-width
>
> +allOf:
> +  - $ref: ../dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amd,versal2-dma-1.0
> +    then:
> +      required:
> +        - resets
> +    else:
> +      properties:
> +        resets: false
> +
>  additionalProperties: false
>
>  examples:
>
> --
> 2.43.7
>
