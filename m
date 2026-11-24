Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549633;
	b=sM2gNfMSwLROXs26V3efFtNX2TIpxcRtxKH2k50l/vQoA6/hNg9SzNXPy3c9Tf18NtGv
	 Fvmy4rs0IM6rKWz5kxtZOSS2HcC5xN+3koANEol/XQSWlzxeoqASt+V6mARTyz21QpHcX
	 kPl+g45OR79Xbl6YCnYenjpxgfzi44LskaMjXZivDSzPfZZDZzFgg+UPCAnbDG48IKGhW
	 1RLDDSXNDOMMQBJPpA80En2ee6txTS/H3tnfTdkX19j0xNf/W6G/Jrt6DFOtNJFzTeJKa
	 PuT3CXm883U6WHmy7CZbGFwtmWeF6FZoePdBlwavJzGoRwVtPdwlmXa9CM+F415nUNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549633;
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
	bh=cRxv9YhZaJJP2/c0rugwOhvWLqO2hf34ZvOcJWVVPzg=;
	b=w4bQIEKZkJ/wvMZ+MgsmWeAE4m8uo9/tW+fVvp+9NpiN38R55KaplV0Ek82fMqr6Vcks
	 /evQ4hTwLxKXh4KYA8kuS0stsMRRlSBUeNjBAQXI8Vrg67rQr52mpM2Fd8B4VX5Fvy215
	 Em6lshPvT051M0JJF2R+Xai+yPrM7sB+SckL7zE0F1AvXTulE5RJ4qXkrrLEcG7sadV2p
	 mMKtpNFUhoMGgtzX4ACkFusJVTWNZCsZLIi5tiFymywZ3hln8JfhcPDrLBiaYEOC5Jy6H
	 MDJou4/EfKQVgteXsIYMDPizVB//JeqP96fHpzE4S9L8cPafEfknnwTa5GH0gqOMV0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I9GzgUiq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.4
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9251606A31E;
	Tue, 24 Nov 2026 19:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9251606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I9GzgUiq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psUkD45Gblqw3R5uuPmx/xYGOXm4mJXMppzNlzVVNKb6Fso6mDpxNa7nNJoCesc3GxPRHyGNHd7fFQfQvb6REZJt/nHx1qsRXsIN0N64aBzP9xQNvKp4qFfTVp6exN9jfiqX0zIQs07gc/17PbIa0mCYQGS9eZHeeQPQyehtaWzSvaW1x3hfFFCON79xe2f5ziiSVhogdQKcoxYBE5KAF4uqx8EKhc2Q8Pwz2DDHsc+qObpIaARReJ4Uw0DfiQHDAa0OXr9bEfqE2EQvswrL6m4ctPrBz+sBkukwd1vJBw9CPTHvAQ06ZTBW4gQby1fPgTwGCJb/pX3+WbTIHgDN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRxv9YhZaJJP2/c0rugwOhvWLqO2hf34ZvOcJWVVPzg=;
 b=V8axjCcdSCzX/nQDYaHHBJkKQlmtg2U/00unhGecpcFaTX3/Uss/SZH6ST2dq/UEPdwIcngDr110LS8L/KXi06hiJ6HUPbecjSjLQWquKgHMXhWr5TtJzt1r7JeKJO0VOpOT7xNBGykVUYOE66G84UJvDkSPAayl2mu2R3JALiMohZq8It/BXT7FiGzjp9FdCm6CUvU578YalCxR5hrBrUSQ4Q7BoCKwmzIwrLlAnnrhP06zjn7PQ5SONl+PCNljGbfM59bUfXoKWD48IgG2baVG9W+zwVeRt1KGxIbtbjyuif3wprqpEMEUGaQAtgy06BHSD017xdZN84Enygj9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRxv9YhZaJJP2/c0rugwOhvWLqO2hf34ZvOcJWVVPzg=;
 b=I9GzgUiqdqUUVV7QloY4/T6SjxG+AULh/f289XlSFjx7O6FHkfd6xHz5FBU6Wd/w+nWkAxJ5QyQQlKRbMPMqFCW8BPtAUIYWi3MJnjXg1VpL16E1gnZbk+K6p/5zhJ95ptwOd+9TVpgFTZdHcpP9S+ZYwdKijM69G4ZJTH+9K8QhqpyTtmSpL6MwXwcEXxjpzYWDGYHtpvQA+MxkGefZhhufitDC03AsGopsInJTjY8Y0P3yYbJBvun1G4mYVeFrsc06nbuzqUru43iVHw8cd8isDqCXVbQDlA1HVT8f3V+CimU/k3332ABA+1aBuDVRaTgsoTFO8ZXXb3lfJdh06g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA3PPFF2AAB1E98.eurprd04.prod.outlook.com (2603:10a6:108:1::b5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Tue, 24 Nov
 2026 19:47:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:47:09 +0000
Date: Tue, 24 Nov 2026 14:46:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/28] dmaengine: bcm2835: make address increment
 platform independent
Message-ID: <awXpsh-ZbSqbotIm@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-11-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-11-andrea.porta@suse.com>
X-ClientProxiedBy: PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA3PPFF2AAB1E98:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abc0ce6-895f-40d5-0860-08df4a63b9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Sqyce2dtzprkek595XiQYArdHI/YQLr0yTGGNQqwLa1mvE5iImnCArTCnJNlhikbgxDSpxP6Q76ix80tMkDqegg06isOP/qikQdrYVUEMxUyTJLoub4WKXHM9cRihVfv6QTTi9u/jXhQ9a+N4aSFU6kJusHoTg2lQRVvHH37Y/f20iwI6Qaccdyoo4Jo0B4PTk9APt6IkIux/LSL5/8KtUyHshHog76ubhAh6HZgoIG4Mqn+wYPQ/CMcKvmQQhb9dwPK5PdMTFD8mMebyiHtlIeytU7dYxMmn748EV70vWTzzV+LssGT7PA6R+p+ZPE0mu8E/soogrmHMgjo4Yt0nIUoOprn+lzYV68m5y/uPeKehv/HENkqdjWfZRdYveVZAXvdkNA8RnD7ODDZ8AdjlLZ4y9IDLLbqk07hxZkQ9fbBP5JmZ/5xRBOqaJ3UtosIfTBAYSp2tVSSwr1RXeM4TrWRmoACVGyN7gHe5kVLJXrKeRSoc1UYk8W3Rr1csiwQFyGyCW0MxskyMpeTB5CkU8ji4lNhK5Dw//WkwJOi2+PD6uDUblR/+Cg3Hv0YVOcnaB9J0hCmy6ceKb/2c0iQR1t8TvSaJuww5QF8uIfpI3dWT1leZ54PSC1wFGoipwayr3HovQeGP0eVGqrbsvP77zFYigSzAB4Egyd8S4SOF/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xHabr9eiceTzN6f5wtBfVCI0pBwspA6A40XD0+1Smbcu1zqJhA/VYrgm2tFt?=
 =?us-ascii?Q?v6ErIDAP/SaeLwAZ872jALtrNQo46uH1ggeZRNK5eQFSeCgtvnnC8JXEkgQc?=
 =?us-ascii?Q?UpcGtlJhGpdxTglpQKeAXca+DA6o8rQoWR0/ppsALftFYFDfyShlUQ2w9oFX?=
 =?us-ascii?Q?ZZV/JMBZ4FMZtbrKDoJw8Z5ftUv9SgwB7kNSuinMzLx3kl73StRKEF3waECw?=
 =?us-ascii?Q?HdmCHEkpthLVFRFLREeBH28dhog3ySLz7P9wtvY5V+VNFgpHLfaAcfcmMkGf?=
 =?us-ascii?Q?1U0lNPvJhytvRSD3YVNcyaV4PU0sK1y1CtVnkRroPTKoJWa49lS8rEui0DdX?=
 =?us-ascii?Q?i6yuBhXO513Qig1rdA0amhU+DSDFoBCsRDaVH0QgVVwkfa2/PXqvh1IefiwF?=
 =?us-ascii?Q?kSnC+l7TBHZDMShj3rEYp4vLzt4hfNigX2Mei7BwCbeAmGQwfoQ4BolrntIf?=
 =?us-ascii?Q?DL8hoxXalgtbzQJ4gU29MgfToKuo18pW3y4gnc6UnjfXUA46foQfwtyd+3Cy?=
 =?us-ascii?Q?0mvMH2V4bGK0Gc+S3LfOTb9DcPIcKNUrrrSmmVvc1w4ExAbnYjAzf/0/+rk1?=
 =?us-ascii?Q?Zq3yNsvARaODkm42l9Brqc16ACur0O3aIwe8ydFUdsN/0OcIjkIFmctYSgz+?=
 =?us-ascii?Q?xuU8Ke7oVuURpU9LCao0ygg8vo2bnjfL2O66C4VfO2qPZ9HMcZHoWW1Vgvug?=
 =?us-ascii?Q?lz9HnwMjtApitpBBkAFImT6XeO0Cv1HKAvorL4F6iUOaRGVWvgViTcJnHr+P?=
 =?us-ascii?Q?fNtKU5MDxvz6OiQF5Bmg3ikpOdpDLWmlohuCCTpPXAA9fYy0xZc50GUHJojI?=
 =?us-ascii?Q?RG31wv5xz39ZYalwCZJQS7mtsIJkniwRKH5Soe4EJQ6t+vivA8iZMmzZx23Z?=
 =?us-ascii?Q?hMab0srsBCWXmxFnhyOk21XquXjAiMQ/ivhykHcnLEfeAbOdysVMeaEBqVk/?=
 =?us-ascii?Q?JYxRMdTv8TDXCsqXlYO8FAbQyks8cdmicdNc+T6X5P2uizPFvrHx78CVPM/E?=
 =?us-ascii?Q?nKZFNyRFoTwGpzvmwlXr2zW27Y4HCh7mGV34ZGjTD5Ryqc7kJeSCSaQN8Nv9?=
 =?us-ascii?Q?dzfZLL/sC8XdShx2ZEUzkyaiXZ9Cntwg69WUesGUVkp8BvGHQMc3DPwG14FT?=
 =?us-ascii?Q?PgHOT/WTb2A7lgl8r/8qGL5pAbF8emBQWx8rwVm4mgDkvdmcdIOrGuNMroHM?=
 =?us-ascii?Q?faeQTjIn3Q09PmYxXZnZN61I/GAeS9o473rBlu5Q2ywQIi1l0Vnf6l1nqIqu?=
 =?us-ascii?Q?2vqaIt5Jd3r2l2S1io0qAIgLkBBBFzCTPZawkhnpml1j7mx0qRFFhIxbfgau?=
 =?us-ascii?Q?kLE42OqLQySoSd5ttJXBgk7rLa+pY5O7mL/Lvr4I+LSn4ZbN8KJtJ02jYK0m?=
 =?us-ascii?Q?6ZrVed+NVEP3zWQ6Us2e4X1wKaNU/GBqSVWcRvEYN5LCHGu6tdNmN0L6Xcc9?=
 =?us-ascii?Q?uB1S2ru0lBqwStKe9iISg6uOuywjzJKLWWENDCAY64IJ3RQ7DlITQ4ke8Fxy?=
 =?us-ascii?Q?rd8jJNg50BDtEDq2fcb0pLuphEw2rHMavMQt/3wgiQYkXuSFBj/Wg49PoBtw?=
 =?us-ascii?Q?MM7CYkzrEbF5WFxnOejWuItRcr4qB8J6EY3/sTr9DIlvext8avbRRwnhqGE3?=
 =?us-ascii?Q?/TmYfEYNhmxZABvSH68SVYnVwGhomM3lMrQxFIbXGrAueuVekuBkoWZaqJsR?=
 =?us-ascii?Q?7C+cZcOo3Xx+kjHxlxui5k+1oqcsWZk4Xf2YpX/alv977bWumMr8orjIpIW0?=
 =?us-ascii?Q?x7eEHv5eg0CbJQrRABUGw7fxCr7PNQnLERwG+c95NmXUqOrG8US9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abc0ce6-895f-40d5-0860-08df4a63b9f9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:47:09.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T18Ee6L1kSyZXXkIwnSq10use+KFTjdRMaeNfmGBbDn8/SP2ES+7vtkTzaptL/kOar+BLCwtl2Fo2Jjne8YtKPgCL5SaOOc8M1LY5580xU0n11cIAdVh7kY3K4Pohc6H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PPFF2AAB1E98

On Mon, Nov 23, 2026 at 03:56:48PM +0100, Andrea della Porta wrote:
> Actually the criteria to increment source & destination address isn't
> based on platform specific bits. It's just the DMA transfer direction which
> is translated into the info bits. So introduce two new helper functions
> and get the rid of these platform specifics.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 77b3e2f58ac5..6180a2737e07 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
>  	return result;
>  }
>
> +static inline bool need_src_incr(enum dma_transfer_direction direction)
> +{
> +	return direction != DMA_DEV_TO_MEM;
> +}
> +
> +static inline bool need_dst_incr(enum dma_transfer_direction direction)
> +{
> +	switch (direction) {
> +	case DMA_MEM_TO_MEM:
> +	case DMA_DEV_TO_MEM:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> +}
> +

This is not 100% correct. there are case DMA_DEV_TO_DEV, and some peripheral
FIFO is a range of MMIO space, not fixed address.

Frank

>  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
>  {
>  	size_t i;
> @@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
>   * @cyclic:         it is a cyclic transfer
>   * @info:           the default info bits to apply per controlblock
>   * @frames:         number of controlblocks to allocate
> - * @src:            the src address to assign (if the S_INC bit is set
> - *                  in @info, then it gets incremented)
> - * @dst:            the dst address to assign (if the D_INC bit is set
> - *                  in @info, then it gets incremented)
> + * @src:            the src address to assign
> + * @dst:            the dst address to assign
>   * @buf_len:        the full buffer length (may also be 0)
>   * @period_len:     the period length when to apply @finalextrainfo
>   *                  in addition to the last transfer
> @@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
>
>  		/* update src and dst and length */
> -		if (src && (info & BCM2835_DMA_S_INC))
> +		if (src && need_src_incr(direction))
>  			src += control_block->length;
> -		if (dst && (info & BCM2835_DMA_D_INC))
> +		if (dst && need_dst_incr(direction))
>  			dst += control_block->length;
>
>  		/* Length of total transfer */
> --
> 2.51.0
>
