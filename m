Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75363E3DA4
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276937; cv=fail; b=DTqNMtUIRXu1+9EYktomIRB5sLilaNEfnyFu7fDcr8VLhSzo/xDN28cB5EmeKB8yjsq3JhcngJtzkcijIBdZqY9ikJQ+GRVz8wr/YrXT9lq92boVu2EJ2UTJCoyqopgZQDlBsLjTraJGaAcUzubr/tpFIQ7NLXrkKuINe8uoVmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276937; c=relaxed/simple;
	bh=HYlLc1g84IIOs2JVIqnm8sbDNVpWuHykeYi3OVNnmRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a/cowlqYPm9SdCXAt/GlU0lyIPRM6o5hBD8/IxLUpmvdu/4ZREjYQKo8AdJCrnArg4ebyIEUOhkL7zdgZQbpbqmLz4WCTnYqfEN/RQn2mNrVTbjP+fqcQ4nv/AdQtvWRERuFzEGK6ndZBdrWJhDFHwtlBy8U+FsJFC7wiNdsFg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RKsW/fIo; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RKsW/fIo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcJmqt7N0LR8/7Rmu/uwv18qwWdTHRMviTkw5GTgHEvR8DvTFGpWeDSscQEKt16IXQNoO3xFZ52Sdxg5Dix/+DH3XrRmJ8dhDnCTR/xkzMwkLld7Yalc/GP6ULiep4MQSAzsOEiI7exPtHT684AujCNqSkDjJUHyyG+fjGitamMLc9bsCjlJb7Ygk/BM9leUSJ/G3BkiCSoQmddteHTVwOxP2IyiKD0LPCPQRiQEBz1G5YSjyrRHz1+WBYk965PTAZiA0VIlNow8j1ymLS/5sKwqudLAxu603nQMci2qiEziLkqKAkmg4iTi7V6s0L97Btc5vPCpnLZzigys9U31Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq/LH4RBGDFJ9R0uYYmj+qpbqbf0/bpVokQrFjMBpdM=;
 b=SsO7nt8miURK97bsMRQNqODnCJCl7IiyftKLOd3x+SMg45hAkdvr1bMOEj7uasY/6e1i1AxbgcF+TzcUAstEzD/vXk61dAA0KRjjR70SrkIs8A1On68HUYP50nr2v4FZmfhL+WhAtW44+z4A46rgN3Iis8K9uYXSo1e387DIVyeS9tFWDd0IZzs7U99yDrpzn+xzi2Ne25nlscDDg2fe9F/IyaYf2et+mGpYYN7L01LioJTaiUKvglZgkDA7F1IJxqVRqYg15Iglrex61nSnhNbR9iCZKiHVShckOfrFhyYYJSjlWc2YasweFx8C4S55iLrQUAO/7kbswh2z5qlkmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq/LH4RBGDFJ9R0uYYmj+qpbqbf0/bpVokQrFjMBpdM=;
 b=RKsW/fIolDaoSLSqhJt1iGwVZ8ma+NMHOBWbJklFtzxREnTfA5rgrbJxH7NR6UzA5OIq3w4wLTfiMWe/3sYPLz3qLCl+uMc4k+ZUZSDzzjEqpVossaHuQdyu2p41FUXylet6osZqjv8/oHRjfYPBZ4k9fuwwyEgFxUfcLrM7AEHvuhT+BEtUMkX1xkQo0AMLItjSq40p19ascuOSXZDHALznmxKYNUkyJ8VNZB6WCQE1yBXQszsHTZrrLZ1ZxcOfoCCxVEml1Cf63Udk3wX77A6iwvAXJT85UMtfpxlQeksoeGujlLX/9Ih2WAZhJyvFkiuadJzZeh1oiZQ65hZtuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7417.eurprd04.prod.outlook.com (2603:10a6:102:8e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 19:08:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 19:08:51 +0000
Date: Thu, 24 Sep 2026 15:08:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org
Subject: Re: [PATCHv2] dmaengine: k3-udma: simplify resource allocation
Message-ID: <arV1PLuWOVmRdVIt@lizhi-Precision-Tower-5810>
References: <20260630013917.1537819-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630013917.1537819-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:930:17::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: c871d996-5f9f-414d-7f05-08df1a6f44c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kcXyaj2PtEIzBTO39cRoyJEyGk0AmYNxMjtj0keIcKg0bYDlO8R0+MGVrABPGVvt2wu4Kt9bxbWojVToXTMy6AFKB2L3L2ms9V01RRtFoG0NTPZBu+WMc++VDIn4fL3FcWxcfUSSBEDUA/FWoV34rucHIww+YGbgCggLkdo1OgSjHboEzV/qrK8rRoQqgnOUN7ysj069cZTNFv9VfQc9fuiTXzU+Ap8I99TIJsXkN9EeMM/YmC5j4GDcNzwhYsQlwVbYjXtQsStDwtTwKY3Y0RR1ud+PnQKfL3cc0Lt23dkI/JyyT/DRawKnxLeG6lIgu0LDNVLMguoMiciajIYwTZX8UIpLG7OslP7KPmMsJa4BHPKlJSwV1Mafa0AN2sNQTxnlmfZadhT3nXBv2a6jl5zWO2Ra9NIZX1laOA/AyI4EMBROBx0TOHtOUNgzJadQr4Z6pnC+VeL1u/xuAx5saGnbOWB0PELd7IpVw/WoQChNiXsTiVO42i4oeNEGsF30F1i9P4m8dfHQ/UJHYsmbSihfCYEB60c6mJXReFy6QqmC7U3TzFP08la73EKICogRTOPQNSklNBHiHrQt8QCigbc7VhoFm/b9M+x6WkqgjQKqK1V3AgO+i3u7S8WWgbMGvs13xax6Vn9MLbILqx7CieszPZUMWtQwz+UWwZ3KkQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A5l6Aom9FW+gSD7yl6ozGrZQzJ4qYyPDwDypuCzHdhrHqUoKqcpqz/4ewpjs?=
 =?us-ascii?Q?JGsDkNujlE3q+ompbQAD/WedHIYt65NgO2kH3rvHLn2Me26ujP9P5RPOYQKa?=
 =?us-ascii?Q?WzCD2dFE4jCm08pxDQt16HD02fs2TNiQPpJnz5XhQthUjHr/RZJJS4Nd8ky/?=
 =?us-ascii?Q?Ux6v6NV2I6nz6pinb91LWGi3VWL+dsMx6DStMIEgllrxQa+VWwhcHLqpnarF?=
 =?us-ascii?Q?PunnOgVkXWBjtpDZb91uAmv4Ys+MlHCbqnk0Okb4ie6OustUkIHnGDSei+AS?=
 =?us-ascii?Q?rTGqqN4LahgykyhbKtqqZ8L/2ZSo9P8PmyMV7QLnGaeP8b9c8UGlWBTBTFtx?=
 =?us-ascii?Q?VEBaa3Rs83NMFJQhLwJP8SMnqvBZez+hhS8XzJ64Nt26ueWTjW9XoUSViQD5?=
 =?us-ascii?Q?95mfcwLzk+6vlm9vvOeVasK5v5BnUjGRy+1GMSzKNyI0gsHY0MJQZZDe+a+z?=
 =?us-ascii?Q?OhHzzwdQCraZNjPVHJrvJcAcM2POqrn6hHSHDY0m5DewWg5WZ6caQCLCsX7B?=
 =?us-ascii?Q?ASR2e06FL7FgH6ZfYCS9IP8rQrBKRbbyDV5aFbDJboR5TOZ6FwSSDLEctjf0?=
 =?us-ascii?Q?e7JC0mCKe28p8Kffn6/jw5MDnzB3rvUzJsfuRCLUkWngxcBLnob4ZqvdyivA?=
 =?us-ascii?Q?CS6EseZ4fTxkCc/aS+2/nL9/MHgSXxKtGWiEj3RdOVhmisi89QqvRphjH7Je?=
 =?us-ascii?Q?aJMuijmpjui1sHX/FSwFLcmdSmWe9Ub3pHpyfNnU7X/SYjPkqlpE/6JMsMqR?=
 =?us-ascii?Q?S7mAUV0kUc7sRLiZSgN+IceXUZ2UxLeG7lqHeFMsN4xBZFpLg3C8e0xk0xFX?=
 =?us-ascii?Q?pWSubXi6GA1y9gFaYvXOhhoB4vjYPnwGSlm+ZziOAqVFnghlIk7pViRQKcik?=
 =?us-ascii?Q?TPEs8fTabkC1R2FOqbGKSbJjH7K6qeexO29Hi/gJX4j8Kfelm9JqRXD0EBDD?=
 =?us-ascii?Q?SfEkDmtRJhb4opxKh5bk3m+B1HXInzR7ytAJoMCEUwBB4ipHBrY6hV+tN5nD?=
 =?us-ascii?Q?tVKePrqI5Mq7ldRaQm+4IyK3S/MSXVxLbKPOg/cZb2Eg274vXbjQ34Pz0Po1?=
 =?us-ascii?Q?Gm/Z9kp+Igq38dE64AOHcG1VVvn1EGi8fc5i/2Nfs+O1CLrnL0ohxUzyfjAo?=
 =?us-ascii?Q?3z6hGHfkVSBMtqXReqLvUID9eZozk6xp5HoMgq3QCWOJXnvrrVD51kKqYpfX?=
 =?us-ascii?Q?kxaITUDvcPJL3MedgWvjs9H7+9512CUO6mEHaVulOJKcFfeW6/yQSLPNieKl?=
 =?us-ascii?Q?dWFJpiEdnyVARJmlckCWmVD1YEbzUbmF0xxAVUe6ebVFhv+IW+MTbd7Q3OPn?=
 =?us-ascii?Q?8T5J18pzzRz0TXNbKOhhKGsdPxXkcoHGFNTnoSf85U7AyfA1HmCxiByiXVgV?=
 =?us-ascii?Q?f9e8H7YGQ4MeQjsQu9JYHSjnenwj8/F0dfkaOGcwc9dmvJ3TRRIegQpcOsXl?=
 =?us-ascii?Q?t/yTsKdov0k/F0sB6EkO7wM3OJLUWaH+IKtcgqOUvzZI/Gl8JRrw6zlmlIQW?=
 =?us-ascii?Q?Xx5y/1uRxbEftrWqAUeAG8RQiDXAal7cUSzajs8FQWoAdWeJzi02p3B72kmD?=
 =?us-ascii?Q?weiy8WrtvIgC+MLXW6O9QdCpDxQSwrkY+6sFbe0nMlFGez4wWzyAeikPgX0D?=
 =?us-ascii?Q?1JvkFagNN7bzvPUrHofm10Y9w3CtGk4q5YikkIoR3GQfO2NlqIT3i0i6Pkgs?=
 =?us-ascii?Q?ZYf9kwZ776QtxIlSbtxoHUik3NVZ26QXL3B+qQ4EIxHSjv2ukt+eLq4Zrxp7?=
 =?us-ascii?Q?eDaibTtxIO5ZD7ImP/YWt9nf/XFfc4KXLI/a6ILxP0pODB6F3Zft?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c871d996-5f9f-414d-7f05-08df1a6f44c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 19:08:51.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8q6xqDe90Y7v68IYmuAUmhpD09kfdY6zWhxF/JuJ4gFuvXkNnyMUGNpPfINFnbq+H9rRrXRb+/AylJ60qXAN7bOcNY56fJug5YSmH5bXSFlODocTjX1BnxJzPuyDk9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7417

On Mon, Jun 29, 2026 at 06:39:17PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine allocations.
>
> Add __counted_by for extra runtime analysis.
>
> Fixup ti_sci as that also breaks with the header change.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Nishanth Menon <nm@ti.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v2: rename to k3-udma and add reviewed by for the ti_sci portion.
>  drivers/dma/ti/k3-udma.c               | 180 +++++++++++++------------
>  drivers/firmware/ti_sci.c              |   7 +-
>  include/linux/soc/ti/ti_sci_protocol.h |   2 +-
>  3 files changed, 98 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 1cf158eb7bdb..2480d22466f5 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -4584,9 +4584,10 @@ static int udma_setup_resources(struct udma_dev *ud)
>  {
>  	int ret, i, j;
>  	struct device *dev = ud->dev;
> -	struct ti_sci_resource *rm_res, irq_res;
> +	struct ti_sci_resource *rm_res, *irq_res;
>  	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
>  	u32 cap3;
> +	u16 sets;
>
>  	/* Set up the throughput level start indexes */
>  	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
> @@ -4664,64 +4665,67 @@ static int udma_setup_resources(struct udma_dev *ud)
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
>  	if (IS_ERR(rm_res)) {
>  		bitmap_zero(ud->tchan_map, ud->tchan_cnt);
> -		irq_res.sets = 1;
> +		sets = 1;
>  	} else {
>  		bitmap_fill(ud->tchan_map, ud->tchan_cnt);
>  		for (i = 0; i < rm_res->sets; i++)
>  			udma_mark_resource_ranges(ud, ud->tchan_map,
>  						  &rm_res->desc[i], "tchan");
> -		irq_res.sets = rm_res->sets;
> +		sets = rm_res->sets;
>  	}
>
>  	/* rchan and matching default flow ranges */
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
>  	if (IS_ERR(rm_res)) {
>  		bitmap_zero(ud->rchan_map, ud->rchan_cnt);
> -		irq_res.sets++;
> +		sets++;
>  	} else {
>  		bitmap_fill(ud->rchan_map, ud->rchan_cnt);
>  		for (i = 0; i < rm_res->sets; i++)
>  			udma_mark_resource_ranges(ud, ud->rchan_map,
>  						  &rm_res->desc[i], "rchan");
> -		irq_res.sets += rm_res->sets;
> +		sets += rm_res->sets;
>  	}
>
> -	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
> -	if (!irq_res.desc)
> +	irq_res = kzalloc_flex(*irq_res, desc, sets);
> +	if (!irq_res)
>  		return -ENOMEM;
> +
> +	irq_res->sets = sets;
> +
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
>  	if (IS_ERR(rm_res)) {
> -		irq_res.desc[0].start = 0;
> -		irq_res.desc[0].num = ud->tchan_cnt;
> +		irq_res->desc[0].start = 0;
> +		irq_res->desc[0].num = ud->tchan_cnt;
>  		i = 1;
>  	} else {
>  		for (i = 0; i < rm_res->sets; i++) {
> -			irq_res.desc[i].start = rm_res->desc[i].start;
> -			irq_res.desc[i].num = rm_res->desc[i].num;
> -			irq_res.desc[i].start_sec = rm_res->desc[i].start_sec;
> -			irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
> +			irq_res->desc[i].start = rm_res->desc[i].start;
> +			irq_res->desc[i].num = rm_res->desc[i].num;
> +			irq_res->desc[i].start_sec = rm_res->desc[i].start_sec;
> +			irq_res->desc[i].num_sec = rm_res->desc[i].num_sec;
>  		}
>  	}
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
>  	if (IS_ERR(rm_res)) {
> -		irq_res.desc[i].start = 0;
> -		irq_res.desc[i].num = ud->rchan_cnt;
> +		irq_res->desc[i].start = 0;
> +		irq_res->desc[i].num = ud->rchan_cnt;
>  	} else {
>  		for (j = 0; j < rm_res->sets; j++, i++) {
>  			if (rm_res->desc[j].num) {
> -				irq_res.desc[i].start = rm_res->desc[j].start +
> +				irq_res->desc[i].start = rm_res->desc[j].start +
>  						ud->soc_data->oes.udma_rchan;
> -				irq_res.desc[i].num = rm_res->desc[j].num;
> +				irq_res->desc[i].num = rm_res->desc[j].num;
>  			}
>  			if (rm_res->desc[j].num_sec) {
> -				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +				irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
>  						ud->soc_data->oes.udma_rchan;
> -				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> +				irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
>  			}
>  		}
>  	}
> -	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
> -	kfree(irq_res.desc);
> +	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, irq_res);
> +	kfree(irq_res);
>  	if (ret) {
>  		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
>  		return ret;
> @@ -4746,9 +4750,10 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  {
>  	int ret, i, j;
>  	struct device *dev = ud->dev;
> -	struct ti_sci_resource *rm_res, irq_res;
> +	struct ti_sci_resource *rm_res, *irq_res;
>  	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
>  	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
> +	u16 sets;
>  	u32 cap;
>
>  	/* Set up the throughput level start indexes */
> @@ -4828,21 +4833,21 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  						    (char *)range_names[i]);
>  	}
>
> -	irq_res.sets = 0;
> +	sets = 0;
>
>  	/* bchan ranges */
>  	if (ud->bchan_cnt) {
>  		rm_res = tisci_rm->rm_ranges[RM_RANGE_BCHAN];
>  		if (IS_ERR(rm_res)) {
>  			bitmap_zero(ud->bchan_map, ud->bchan_cnt);
> -			irq_res.sets++;
> +			sets++;
>  		} else {
>  			bitmap_fill(ud->bchan_map, ud->bchan_cnt);
>  			for (i = 0; i < rm_res->sets; i++)
>  				udma_mark_resource_ranges(ud, ud->bchan_map,
>  							  &rm_res->desc[i],
>  							  "bchan");
> -			irq_res.sets += rm_res->sets;
> +			sets += rm_res->sets;
>  		}
>  	}
>
> @@ -4851,14 +4856,14 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  		rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
>  		if (IS_ERR(rm_res)) {
>  			bitmap_zero(ud->tchan_map, ud->tchan_cnt);
> -			irq_res.sets += 2;
> +			sets += 2;
>  		} else {
>  			bitmap_fill(ud->tchan_map, ud->tchan_cnt);
>  			for (i = 0; i < rm_res->sets; i++)
>  				udma_mark_resource_ranges(ud, ud->tchan_map,
>  							  &rm_res->desc[i],
>  							  "tchan");
> -			irq_res.sets += rm_res->sets * 2;
> +			sets += rm_res->sets * 2;
>  		}
>  	}
>
> @@ -4867,36 +4872,39 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  		rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
>  		if (IS_ERR(rm_res)) {
>  			bitmap_zero(ud->rchan_map, ud->rchan_cnt);
> -			irq_res.sets += 2;
> +			sets += 2;
>  		} else {
>  			bitmap_fill(ud->rchan_map, ud->rchan_cnt);
>  			for (i = 0; i < rm_res->sets; i++)
>  				udma_mark_resource_ranges(ud, ud->rchan_map,
>  							  &rm_res->desc[i],
>  							  "rchan");
> -			irq_res.sets += rm_res->sets * 2;
> +			sets += rm_res->sets * 2;
>  		}
>  	}
>
> -	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
> -	if (!irq_res.desc)
> +	irq_res = kzalloc_flex(*irq_res, desc, sets);
> +	if (!irq_res)
>  		return -ENOMEM;
> +
> +	irq_res->sets = sets;
> +
>  	if (ud->bchan_cnt) {
>  		rm_res = tisci_rm->rm_ranges[RM_RANGE_BCHAN];
>  		if (IS_ERR(rm_res)) {
> -			irq_res.desc[0].start = oes->bcdma_bchan_ring;
> -			irq_res.desc[0].num = ud->bchan_cnt;
> +			irq_res->desc[0].start = oes->bcdma_bchan_ring;
> +			irq_res->desc[0].num = ud->bchan_cnt;
>  			i = 1;
>  		} else {
>  			for (i = 0; i < rm_res->sets; i++) {
> -				irq_res.desc[i].start = rm_res->desc[i].start +
> +				irq_res->desc[i].start = rm_res->desc[i].start +
>  							oes->bcdma_bchan_ring;
> -				irq_res.desc[i].num = rm_res->desc[i].num;
> +				irq_res->desc[i].num = rm_res->desc[i].num;
>
>  				if (rm_res->desc[i].num_sec) {
> -					irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
> +					irq_res->desc[i].start_sec = rm_res->desc[i].start_sec +
>  									oes->bcdma_bchan_ring;
> -					irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
> +					irq_res->desc[i].num_sec = rm_res->desc[i].num_sec;
>  				}
>  			}
>  		}
> @@ -4907,28 +4915,28 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  	if (ud->tchan_cnt) {
>  		rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
>  		if (IS_ERR(rm_res)) {
> -			irq_res.desc[i].start = oes->bcdma_tchan_data;
> -			irq_res.desc[i].num = ud->tchan_cnt;
> -			irq_res.desc[i + 1].start = oes->bcdma_tchan_ring;
> -			irq_res.desc[i + 1].num = ud->tchan_cnt;
> +			irq_res->desc[i].start = oes->bcdma_tchan_data;
> +			irq_res->desc[i].num = ud->tchan_cnt;
> +			irq_res->desc[i + 1].start = oes->bcdma_tchan_ring;
> +			irq_res->desc[i + 1].num = ud->tchan_cnt;
>  			i += 2;
>  		} else {
>  			for (j = 0; j < rm_res->sets; j++, i += 2) {
> -				irq_res.desc[i].start = rm_res->desc[j].start +
> +				irq_res->desc[i].start = rm_res->desc[j].start +
>  							oes->bcdma_tchan_data;
> -				irq_res.desc[i].num = rm_res->desc[j].num;
> +				irq_res->desc[i].num = rm_res->desc[j].num;
>
> -				irq_res.desc[i + 1].start = rm_res->desc[j].start +
> +				irq_res->desc[i + 1].start = rm_res->desc[j].start +
>  							oes->bcdma_tchan_ring;
> -				irq_res.desc[i + 1].num = rm_res->desc[j].num;
> +				irq_res->desc[i + 1].num = rm_res->desc[j].num;
>
>  				if (rm_res->desc[j].num_sec) {
> -					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +					irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
>  									oes->bcdma_tchan_data;
> -					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> -					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
> +					irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
> +					irq_res->desc[i + 1].start_sec = rm_res->desc[j].start_sec +
>  									oes->bcdma_tchan_ring;
> -					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
> +					irq_res->desc[i + 1].num_sec = rm_res->desc[j].num_sec;
>  				}
>  			}
>  		}
> @@ -4936,35 +4944,35 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  	if (ud->rchan_cnt) {
>  		rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
>  		if (IS_ERR(rm_res)) {
> -			irq_res.desc[i].start = oes->bcdma_rchan_data;
> -			irq_res.desc[i].num = ud->rchan_cnt;
> -			irq_res.desc[i + 1].start = oes->bcdma_rchan_ring;
> -			irq_res.desc[i + 1].num = ud->rchan_cnt;
> +			irq_res->desc[i].start = oes->bcdma_rchan_data;
> +			irq_res->desc[i].num = ud->rchan_cnt;
> +			irq_res->desc[i + 1].start = oes->bcdma_rchan_ring;
> +			irq_res->desc[i + 1].num = ud->rchan_cnt;
>  			i += 2;
>  		} else {
>  			for (j = 0; j < rm_res->sets; j++, i += 2) {
> -				irq_res.desc[i].start = rm_res->desc[j].start +
> +				irq_res->desc[i].start = rm_res->desc[j].start +
>  							oes->bcdma_rchan_data;
> -				irq_res.desc[i].num = rm_res->desc[j].num;
> +				irq_res->desc[i].num = rm_res->desc[j].num;
>
> -				irq_res.desc[i + 1].start = rm_res->desc[j].start +
> +				irq_res->desc[i + 1].start = rm_res->desc[j].start +
>  							oes->bcdma_rchan_ring;
> -				irq_res.desc[i + 1].num = rm_res->desc[j].num;
> +				irq_res->desc[i + 1].num = rm_res->desc[j].num;
>
>  				if (rm_res->desc[j].num_sec) {
> -					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +					irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
>  									oes->bcdma_rchan_data;
> -					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> -					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
> +					irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
> +					irq_res->desc[i + 1].start_sec = rm_res->desc[j].start_sec +
>  									oes->bcdma_rchan_ring;
> -					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
> +					irq_res->desc[i + 1].num_sec = rm_res->desc[j].num_sec;
>  				}
>  			}
>  		}
>  	}
>
> -	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
> -	kfree(irq_res.desc);
> +	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, irq_res);
> +	kfree(irq_res);
>  	if (ret) {
>  		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
>  		return ret;
> @@ -4977,10 +4985,11 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  {
>  	int ret, i, j;
>  	struct device *dev = ud->dev;
> -	struct ti_sci_resource *rm_res, irq_res;
> +	struct ti_sci_resource *rm_res, *irq_res;
>  	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
>  	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
>  	u32 cap3;
> +	u16 sets;
>
>  	/* Set up the throughput level start indexes */
>  	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
> @@ -5057,13 +5066,13 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  	if (IS_ERR(rm_res)) {
>  		/* all rflows are assigned exclusively to Linux */
>  		bitmap_zero(ud->rflow_in_use, ud->rflow_cnt);
> -		irq_res.sets = 1;
> +		sets = 1;
>  	} else {
>  		bitmap_fill(ud->rflow_in_use, ud->rflow_cnt);
>  		for (i = 0; i < rm_res->sets; i++)
>  			udma_mark_resource_ranges(ud, ud->rflow_in_use,
>  						  &rm_res->desc[i], "rflow");
> -		irq_res.sets = rm_res->sets;
> +		sets = rm_res->sets;
>  	}
>
>  	/* tflow ranges */
> @@ -5071,55 +5080,58 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  	if (IS_ERR(rm_res)) {
>  		/* all tflows are assigned exclusively to Linux */
>  		bitmap_zero(ud->tflow_map, ud->tflow_cnt);
> -		irq_res.sets++;
> +		sets++;
>  	} else {
>  		bitmap_fill(ud->tflow_map, ud->tflow_cnt);
>  		for (i = 0; i < rm_res->sets; i++)
>  			udma_mark_resource_ranges(ud, ud->tflow_map,
>  						  &rm_res->desc[i], "tflow");
> -		irq_res.sets += rm_res->sets;
> +		sets += rm_res->sets;
>  	}
>
> -	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
> -	if (!irq_res.desc)
> +	irq_res = kzalloc_flex(*irq_res, desc, sets);
> +	if (!irq_res)
>  		return -ENOMEM;
> +
> +	irq_res->sets = sets;
> +
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_TFLOW];
>  	if (IS_ERR(rm_res)) {
> -		irq_res.desc[0].start = oes->pktdma_tchan_flow;
> -		irq_res.desc[0].num = ud->tflow_cnt;
> +		irq_res->desc[0].start = oes->pktdma_tchan_flow;
> +		irq_res->desc[0].num = ud->tflow_cnt;
>  		i = 1;
>  	} else {
>  		for (i = 0; i < rm_res->sets; i++) {
> -			irq_res.desc[i].start = rm_res->desc[i].start +
> +			irq_res->desc[i].start = rm_res->desc[i].start +
>  						oes->pktdma_tchan_flow;
> -			irq_res.desc[i].num = rm_res->desc[i].num;
> +			irq_res->desc[i].num = rm_res->desc[i].num;
>
>  			if (rm_res->desc[i].num_sec) {
> -				irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
> +				irq_res->desc[i].start_sec = rm_res->desc[i].start_sec +
>  								oes->pktdma_tchan_flow;
> -				irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
> +				irq_res->desc[i].num_sec = rm_res->desc[i].num_sec;
>  			}
>  		}
>  	}
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RFLOW];
>  	if (IS_ERR(rm_res)) {
> -		irq_res.desc[i].start = oes->pktdma_rchan_flow;
> -		irq_res.desc[i].num = ud->rflow_cnt;
> +		irq_res->desc[i].start = oes->pktdma_rchan_flow;
> +		irq_res->desc[i].num = ud->rflow_cnt;
>  	} else {
>  		for (j = 0; j < rm_res->sets; j++, i++) {
> -			irq_res.desc[i].start = rm_res->desc[j].start +
> +			irq_res->desc[i].start = rm_res->desc[j].start +
>  						oes->pktdma_rchan_flow;
> -			irq_res.desc[i].num = rm_res->desc[j].num;
> +			irq_res->desc[i].num = rm_res->desc[j].num;
>
>  			if (rm_res->desc[j].num_sec) {
> -				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +				irq_res->desc[i].start_sec = rm_res->desc[j].start_sec +
>  								oes->pktdma_rchan_flow;
> -				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> +				irq_res->desc[i].num_sec = rm_res->desc[j].num_sec;
>  			}
>  		}
>  	}
> -	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
> -	kfree(irq_res.desc);
> +	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, irq_res);
> +	kfree(irq_res);
>  	if (ret) {
>  		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
>  		return ret;
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 590a464403c5..ef23d732e083 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3693,16 +3693,11 @@ devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
>  	bool valid_set = false;
>  	int i, ret, res_count;
>
> -	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
> +	res = devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNEL);
>  	if (!res)
>  		return ERR_PTR(-ENOMEM);
>
>  	res->sets = sets;
> -	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
> -				 GFP_KERNEL);
> -	if (!res->desc)
> -		return ERR_PTR(-ENOMEM);
> -
>  	for (i = 0; i < res->sets; i++) {
>  		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
>  							sub_types[i],
> diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
> index fd104b666836..7632bb11c862 100644
> --- a/include/linux/soc/ti/ti_sci_protocol.h
> +++ b/include/linux/soc/ti/ti_sci_protocol.h
> @@ -599,7 +599,7 @@ struct ti_sci_handle {
>  struct ti_sci_resource {
>  	u16 sets;
>  	raw_spinlock_t lock;
> -	struct ti_sci_resource_desc *desc;
> +	struct ti_sci_resource_desc desc[] __counted_by(sets);
>  };
>
>  #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
> --
> 2.54.0
>
