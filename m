Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794512313;
	b=SsZ1KbfquXjbnl22XPSVDkSRqWMOO369YKeblL3rq26kPYzxOncBmrbZPVgNBxvWftiM
	 KimdZ3ttuJK2q6GTi+MzO02El0+N5pgyUk3i3r9GK2SPrZCJF8omeTqXVgNveKK1xe942
	 Hym8MmSwg4gu+PUqKn/fhIpwWL+py36lDYhICSyo6U/b6S9Ue2bJaNSgtl9JHKHeHiAX5
	 oonNXU59uR+z4bggB9ye50oz+JDTc+yRCfcBtJ8XBQ90VtliazMOWNc6gIFPVC/W4f4g5
	 V3Lo+2widq7VnYAbl58cacxm25LzMT3EvI71vZbZnYv6ah1loPq9Lmu/FAUVtSJcl5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512313;
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
	bh=fQkHNGD6dV9/hSNkB44ELTDYAl+X00kFGDkLvIjo7SA=;
	b=QkZVkTkYobH21k/IV3p9VVtQlX3iuZIjvbjXpHYcTgd2ZUrxNiZ6eucK1iQ6xWDgZniE
	 1z0q67LqHvYZwYan/JSfK5ThAMeZjwffaLuz2h0ViKGPv/jRZMgf/COFrg4og2qUBFznv
	 tMfOe8wSYsSS75iEx/Zz4GBYRmolZYN1IYC979MxsEEsLudOM68KTiPHaqAA+0scRxgmt
	 iwuqICupiXNjv2xDI+xLj9mWiGr8TE7SlFF3LZMk2yXIpYinLqLrheBDU1H+L1uhf74vG
	 TjtYIaH8DR6/QdZL+T5V11NyCJftrF1UQg45o51RM8/KAJ3yRavMFfsNlTlEyuUpL7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="hQ0a/rhC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.26
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE94606A31C;
	Thu, 12 Nov 2026 19:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hQ0a/rhC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnbhPo+rR9DoazlQKf/47sED3GxbaTQEwsyBB82G7U8AR75VC3dYudGTOdvGdIPbXpE0jgbblY49zWFJOPJBRuhliTDNOBeiu8XRA+l9/UucnfgR1ex6+OpSilMtJOV7lmhAWGXSJNGvm0BNcbpDX2JlEhQ5rU/9ESW6zjbKBZJdVD0uLT21HaH/EoXw2G53EPNmZLbJkohe4EsDUKww/0R8zP+E8a1EX5Gww6rU3MbB6FVUjlhwsluREJSn2VSYdOwqpFho2T5Wie5cBim82fBJ075q2cpoO81IdJUePF7ZM70zy1Ba+KlHrmeA1jb+VBrZIjG5J9xjV1yk8VWxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQkHNGD6dV9/hSNkB44ELTDYAl+X00kFGDkLvIjo7SA=;
 b=OiXkZSsK/l9WOAXo6CuuCDljbxTQqnSUZ3/nFr6nNEdvlPqc3YnQ340ZmI14opf9VUcamFdnP76m6HMU0u6eJql0M/E6EzWKsGlEgvK3Hrnn5KdVoa20YMRnPNyu6gBDj3wmZWAsU3CF2rANVu1CrZ8+6jKX62kBP7fXH5WfSIp7GyrVTC+U4ASfUU4GAu5E8rTT3/RXZVE6gUANZXdme7qAiMtLbjH1vtVpBqdNKt+2hIXoNsz+BOCJhzSwc+zdw26oddCAtB7FA7KxuC3mc0P6tsY1cxZAdGJWa+bcwkw7g/Gfh2y/CS8jTg7/z+tZpLk4ROC3phqxpH9sJFZf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQkHNGD6dV9/hSNkB44ELTDYAl+X00kFGDkLvIjo7SA=;
 b=hQ0a/rhC75c7Nt28ZIIwCHSFo0nj38AM4LjgDtojLP52kw5Cs5c6CnZCLFNqEOwkdAOupYFhpB8xUfhOI+IllzqZzT3CftDvHg7a0eacKhGFdJgGSVAlWBxlOLKwLnne9m3/84Azlj6DpZF7jnpX98q+HXzAcRv5a3jrvVRRVqFR22G8uRBRo7u2+1koUc4NmAzmUnyiTxu8PmLKlKV1NDyh5f5MM5igizCXS8Ybih62CUr7OD1AXZjpPF7t2Chbph9aXuLQIe4Sp0yAgnEwTrG/Ap6ImkY4sgK0EwPTCFNyTxcIIy3KbSe1gecRYxZf8gOYE+gAsQdJ0MbI5QCDpQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB11956.eurprd04.prod.outlook.com (2603:10a6:800:31f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 19:38:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 19:38:28 +0000
Date: Thu, 12 Nov 2026 14:38:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add entry for Xilinx AXI DMA driver
Message-ID: <avX_Ak4dVXnNZE3v@lizhi-Precision-Tower-5810>
References: <20261112174613.2101876-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112174613.2101876-1-suraj.gupta2@amd.com>
X-ClientProxiedBy: ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB11956:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3fd627-3fe6-4fa5-ec5c-08df40f48679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	18vRTIAqX1UyDw9egbdw6MYHkVUbCV8E9vdv34R/Quyx1CKydW0axuxm7If5f/pGBolCVjs44q1/FhBLrHLRUkvAajc0Z21mnJonty73pqj22BgYp1rct5RhilLA4uzl/B1D6CROvOFr7AsH/NhU1rVAZM0ynBT2v/nIOvDsyBiDovP41rdD4LEV0z/zAx4oNERbM304oSswixmdqzSNxGjvGCg6Cj7CvHy2+fQxZo7Wrlz0Qiy0LgslCbSpR08W4fI1In+grGBaGI+otNVoULN6GX/F3mfjDOoisP/rweBjI84bwMd+Q7WeD6q0lYE5H9qZViREv3kxZiVfar2ykfoDFEPEyLBpopj2WE1PHqjQYhKN8o+c5AoPoihtyQ4kP+2Yayhw/n7jwy4WehJuRh7+7ZB5VQO9v06MyLpkcQA7oSW2csj3ist65ndw0xodrUTLFd4/Tdg5L3Cu7cDZcw9DNYbOfBVEmHEoFRun+Wtgo7I2DgopWhU1SNyuwZll3mnsLTkSlDj5jEcpT145xiW3EXF7qCL7wYmqksNlcgPXYV22GM6rjOCXXvRhV5OCsomi5l9c6v+oYOnWPUmGgf8PfNUV6U4Gw5cEUX6sqDs2cngPF0VW+vvSRRHXMuZd8nKuh6p/gv5aIBbcZVYBmZ71A4WKOaOYpfJYY1/yDi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zsOIyU2Li3KEZj5ST0Wq28blLdl4B0PAnkL+21C9iw64uM/txpmSe3t8BBlZ?=
 =?us-ascii?Q?lnxeCgtk4VaXmbLQnufRDVjFRJjIJyUFHlLwxaCAuUHcelssqDYX5soYpbnO?=
 =?us-ascii?Q?liyMfmZzwMl7nxVvC3GR0cuKwK4Rrstxn2exTC/E2CpMwo2ZvuMi0gUs9vGX?=
 =?us-ascii?Q?Y++4k94IqUh3GqZCZ/LD7KT7xbwMFN5X2mFGmkeEoXwg3JSJ+Yz+EX2sWJoZ?=
 =?us-ascii?Q?Gd/5jrsRmP1ASphOhQO23CqUyGv5wl5dqrKapMV+RGubrUMuSPCPbNWFiP4f?=
 =?us-ascii?Q?of5PtmHzKOa15wuELg4WkUGMUN80ilPgXEoLFSYB0eZKytEEYXV9X+gkUhZd?=
 =?us-ascii?Q?PjbG1ogGDZrjfyTmkMG/sqE5jonZcgrVJx/k/EQXNa32GVgvrSFOJkzTI5Oo?=
 =?us-ascii?Q?1pCYCI9Uuwx8AjrYx9sjto5QVCRaHRhcTLTPLK9/XYzVTvQ6AIktt+r07MTC?=
 =?us-ascii?Q?M66mAC6rDrX3XHwkYIhsn+IJdB4LwxuQa4wzEaI7YOKLvEBQcu7ET0/6C8pT?=
 =?us-ascii?Q?L2Yry/Sn4lwD3HZkK9Zm5ls+KDA/cd/iYNLnuHLIRNMGBtW6R4s1bJ0bajYG?=
 =?us-ascii?Q?/2VkxDAncB/+OGTNyvm8EfW8pLn0LbenCFzAJBWhMKlxXLAyPjoO3SQNdvf1?=
 =?us-ascii?Q?JxXRX4Q5yArnBhVd/GMnXFD2Nc1n5mPRWZ6NWAc/HQDryME/1tGpKyJ0gz/A?=
 =?us-ascii?Q?BDgbWLdZm0NmiTJmOnSEVQKSnJ/OJC2y5Jnpr90lGCeizTBdxR85h3KYFRkW?=
 =?us-ascii?Q?0LO5aa+FCyi2pA9oaJOZUvbIn8UbZCxXLrodqUSt5bgk/2INudfHANwuHwfy?=
 =?us-ascii?Q?6avUGHro7YOwwA9A91uAK5xVd7yhlQ+dyXf199Y4jwu1axypma31jRFVq+Cl?=
 =?us-ascii?Q?usJ8qdeYpyZQybKgkDCTbKnNEE0GoWO917vJCqCrBG4aaTtdwewTSTFtMMqU?=
 =?us-ascii?Q?STxJ9t5G9LsFBQ0+BcDhAUGmIsPd38FpChASNMl23J9aDRWPTdonLgDR2UBf?=
 =?us-ascii?Q?MxUdyOLvxf+iCr1r23G2/CGU5dvfv8kN8dVNZkJ9nDcMfJzIwuUjkpe0FFSF?=
 =?us-ascii?Q?s/R02qOPm3TKkEGUQxwFIn62FEJv5q7Blx8p6koOVNLN2DXPFpsjyFBnc5I+?=
 =?us-ascii?Q?WnKuPmZLbh6BUBYezFzD2PQasObUXRLwNNmDGq2wI8hnbyhVvmuwlIHuG62e?=
 =?us-ascii?Q?BanLZqzNoQgfu1D7YrFt4MkGCGeeic1XG5Hf/3z2uX70AaXL41pmtnDLaanN?=
 =?us-ascii?Q?YNlTkln/i3puorZLVXAb2jru//j/508hi7EnW2SkiRzON92bV2LmQfgPHcBC?=
 =?us-ascii?Q?NbtIVLxBKElnVvl56QmUZOSXuNiRveL1FWpAHw7JLbRGvvb0Pcq7XwO1PAX9?=
 =?us-ascii?Q?vBxoOyJ3KtcC7ZMZwdW3+4XCsI9x4nb8gBhPWQH1LCWE6jgzNo/RMVMu8jd0?=
 =?us-ascii?Q?PthHOwQIxuincdzMBb+StaRDl4N5jQlJVtPS2XaDHZeVc9wqjCKNm2n5xdK6?=
 =?us-ascii?Q?tezokmvSZZEdjc/tQgmwO8dLWLx0SkRWxllLWz+g4/lH0zTHShH0JQQbCw/5?=
 =?us-ascii?Q?Z+7+6fC4vabnOz+oKkv8O7Q55jl/jmPcuLD94vXsV/8FbSEgsLGurZh8pv/c?=
 =?us-ascii?Q?IzBgQUu7aO95y0jcwCToNqsKuZgJrXbM3N3tDTdxaStAGy0/sTi4/obN6H5B?=
 =?us-ascii?Q?9nJzBi7mUbtmsBxpai9Lhd/p7KUaG8iM2kJk9EYMIyEz/5b30Rr7juEADoUi?=
 =?us-ascii?Q?n6cUugNcMaLVPDU6x/ST7FK4KxgORzjtYuOdkkfJHBvu59j1hYNC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3fd627-3fe6-4fa5-ec5c-08df40f48679
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 19:38:28.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWULkXMPfUYcE81Nj6qClCfmIu/sB9J80B84MMyDLgyXWgn3jUjNvG5uxfKJ0nTUUqInS5kjbSFs2jJI4ADRRFzRn+Jir8Uy6owRq67xNUjpcBlKJNkQDstU21Us1PPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11956

On Thu, Nov 12, 2026 at 11:16:13PM +0530, Suraj Gupta wrote:
> The Xilinx AXI DMA driver, which supports the AXI DMA, AXI CDMA, AXI
> VDMA and AXI MCDMA IPs, has no MAINTAINERS entry, so patches touching it
> are only picked up by the dmaengine subsystem catch-all.
>
> Add an entry covering the driver, its binding and its header, with
> Srinivas Neeli and myself as maintainers.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..8f75c8cb6acf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30611,6 +30611,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
>  F:	drivers/iio/adc/xilinx-ams.c
>
> +XILINX AXI DMA DRIVER
> +M:	Suraj Gupta <suraj.gupta2@amd.com>
> +M:	Srinivas Neeli <srinivas.neeli@amd.com>
> +L:	dmaengine@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
> +F:	drivers/dma/xilinx/xilinx_dma.c
> +F:	include/linux/dma/xilinx_dma.h
> +
>  XILINX AXI ETHERNET DRIVER
>  M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>  S:	Maintained
> --
> 2.25.1
>
