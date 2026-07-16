Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0273FE357;
	Thu, 16 Jul 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210820; cv=fail; b=Opku2FKhf0i3kWr+aiZ8ZB5VV+QS9cqV4bJpKI6s+W/5svAmLIvgSW/r79BMyzVjrUN8I/7twBOsJ6wnCtmcJicjJ6+YlPtc9pyYL7yKNd5u3xKYomgDS+fmgDm8pY5zPrRJTLcuNTFkofGyulPaIWqw/KW/WflvfbOz/AVDJtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210820; c=relaxed/simple;
	bh=Rm4buTEA+y8Ph/kjb+diyzUkD9XiPyzo3nKB11ULjD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MnVJktmGrthAanRWMcGq5sv7IYVgRjXZyLlQGrrFAFhPZLFF6+9UJrFG4tvb+7GaI7A3Fen5EQ4VP2gd9d1FKvlPt1dlqPz11g2+vKBnb70k6oEdmBYrC1Qr6qAmtWwbNkSuJB78mWSs3acfF5TAYMoQ1qC9nLIDYlrHp21aeG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EWGtX+k9; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EWGtX+k9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKpT+esk7kv0ms7Vxc4yuySSvsjew/XRNCrmfXKOyhYpJJJYR2idHUEYzpfrxp+tC9+5nkZtC5C6XoWcEZUdJ3YaV0e8d+fxSBPNxesrfszo9LsnkMKOx9OYxVV0U9qYVrrPp9kZs5p+PfutM/ILYMQ6z2r+PL2Ylm+PJFWAZ4ILJ3Kxn1tXMaPYYq/8VpRCA5Js/drv0KPLZBuNVtcVIOZLJVpr/yHVJ8S1tO2ekbVlcLOJQcIA06CJBrAVg2oNIQ3jVxiN2mC6At1j11YYoZAdIRgfEiiIndE+JjQF8//KJwIlgNEH/rRy6iRGbrv8xQz8zEWH/+ph9d4Y4y+Y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rFMolHtwZCwaXl0eYHuLD2qhqu7gRzt0ZPecqN8D2A=;
 b=CwrpoKmwmYZrfAp8VVz3KWd7PB6UhikE9/C9KxeHn1M7SVpb7wc8TOerdEUIT+DSge7HclxivVyaJJX2MdvaQ9ry3sVFcz5faCKVh5eF/LBk1XXBdE6bOtbwHk6Qt4Yi7tviFFE0YdDPbS3IJxjg5rSYexxjUVj889DsxzQGIefQ44L2gqXDApVIkzPg1caUCfGVU+dK9bWNVsKrcIP4qCYfHNVTrv1kUIMZDifR5oaVdpznaJVSYLOwu7ZaAjg6GNKdG9hxT6/153afUvRL/RfnaIfFMIVYFe9IrsbYdYOKza9/BT+0661X2YbQ/ebhJTv5IBaTkx+byXuqmuQmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rFMolHtwZCwaXl0eYHuLD2qhqu7gRzt0ZPecqN8D2A=;
 b=EWGtX+k9/uPwfWxX0xp7y0LDFZX3Kp61/rWCSj+L2OxNZeQVacM3pVIdAt0cUZOf0DKmif2+70YNTMv6fuyAyEMwNXmcJY7imO51CrYmv63zwokVZUcL85KTAm4FtNMc5aNrk5+QMewCN7egvdjlZMsGW3xJhrYcWaKo5w6wBGfbfN9R4Xcsb5zvP4O5IgspxTYBitJ8kVUb9ZgxHC2FA1bN2GqqYoeVCkdJZ4EPXtiM3MWH845NbG4KGXSt76Nrofh9ifk1b5yL/S3Q9ub3rxscQGvCYpdsBSPNcZ42t37gYlhokz4mnIMcg3GnrRgCoWbmRVfKCrXloTw0j5fdmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12324.eurprd04.prod.outlook.com (2603:10a6:800:30d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:06:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:06:55 +0000
Date: Thu, 16 Jul 2026 09:06:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: validate dev and name in dma_request_chan()
Message-ID: <aljld_tSHck9fZC9@SMW015318>
References: <20260716052758.23465-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716052758.23465-1-phucduc.bui@gmail.com>
X-ClientProxiedBy: SN7PR18CA0023.namprd18.prod.outlook.com
 (2603:10b6:806:f3::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cab2ce9-fde8-4514-96cf-08dee3437dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	t8Qc50OzCf/xxK++voKOIqIUcwfB7a+a7QYt2KsxkwsQKERydtoXXfOaZzIRdgxiwIxGXtWFLAqxWPjpQWQt2duajwq2qoW3FPq5dlo63KAw9Frvfd+LeCXtyIM7UlfyECOgfsB15KOWCrRmT6dA9qcnCgwNUBiftr60Dg+B2hI1dFSWWo4lyYSX/Xb+RQJZ880+USBo/v0hPSKK/EviDi4K6fDesyGXfvFBvyHFeWSEn/PbMmeS0igroaeFqy4tLYdkeNEiV6pgAiqTgNdHk4F5ilrpVmPPnVpsx2Z0InqFXACB2zGr06N35nn8t0qFI39VaXvq8iqNIzj5rzM2OpZi1+S2T67c+ZdJTzO8DRt9Mm2KVCfM4Y3WsyZH2P/LBqEsSRimDqEt8LRjiaJ0ofjBJrSgsEcUlXcsMFQlYylOcDEkjHR1eWufftDuwlzgXIEATNIpfZqPVWNsxLftW5fdvQCWLcweBP3RbZp48zbHHR0ie6/kmc1J8NXxfZcSBuDVABbD5SPkQ8SmDqV7VMsLfvx8T5GnMEIJVmp0IurdQ++qQv7qnGazac+88JQQxJ9SVnq/HxoeB7kxumFOVAXj+CA6TteiGpvIffOcp3IZobFcJE3Cl6ZbrrbLNyxAZtTCemE4I6Mu4p05MyJd9UcTAh0s8zRmzoXr3PoKTNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?49Z66WJl+FZ8DJxIdSKDBzcYd4CIdwwL/zQxvKjkXgQA/ZMyz3uPaQm7/mLT?=
 =?us-ascii?Q?v2ukbzMix7PU7VjjbrMCjl75dihfbzscPQhLsfHHWDg1gbfpx2az8ceCjavw?=
 =?us-ascii?Q?0mT0Eg2Fjn/RKIPlZct0S0tvdKLrmh0DY+6fy4xJw464eOHM/1zIG4CicQLQ?=
 =?us-ascii?Q?nnD0pGjv0yiXfjk5oUk38W4PksF8Q7Nd+S12lbJf37aC2RmJKIgOLyLRQgHS?=
 =?us-ascii?Q?PDiHF61DdPF3Bt/KDfhpm3soS2nz4haxXQDovXCBpot52xEH1EA3i/btxw0J?=
 =?us-ascii?Q?irjdvJ9yC2wjGOTJL2iviy91IJ+6JkhmlhPYycfCF+jn/zQb9L82viUHpDbd?=
 =?us-ascii?Q?+YzQw/yGQJf6tshYjSZ2I9qUh/z3Fj6298A+CyuBxYthLzfkeQUy3SaWqQkr?=
 =?us-ascii?Q?3vfA5j8YVqaYjMYhZANWyZ0YkCrduBs5C4YPmu3J+iboms+XwdK3bArP43kz?=
 =?us-ascii?Q?0bsGyCczk0tmcvrBSLI3TVMv+4Ui7Bf9cCLlpjLkCk4yHfYNwTiLA+5AOztd?=
 =?us-ascii?Q?2OTZv5MGYNeT5rQM/uD+Qquh5sd37nuHVd7ljvirr1+nOyxdhbACkTsw7kq6?=
 =?us-ascii?Q?kqdANJakGALUONbtkABi0skR5+8XHZdv4rFj4/NZcgtW+zdMe18x5CLJNaBU?=
 =?us-ascii?Q?lz1TFq8bTIYdFCaTyO9TxkX3/9D2qrbSwnz/vYGsn8wD0LKWaskEyOrdPIkG?=
 =?us-ascii?Q?TwlDIJWhWb0LWFqWHmBmHqp44StnxD/8JYtQ0rf65qxPI7riSy+7pDHu/kzc?=
 =?us-ascii?Q?XFD2jIH/Sga3hzJmjSuIOIOvQBb3YYlKkPSKnVgoOeZoWT0I39e/cfLhZBHn?=
 =?us-ascii?Q?QqPQr+GnT2dOjO4otaSJoqF5mObe9mFB98sMEzl9ee1eQky7wXYZRYYLYvtw?=
 =?us-ascii?Q?fhUEKdfcrB7NsLXAYFad12x1tQBqN2gc7zixIUw4+KkONMHtpL0dsM6pfjD3?=
 =?us-ascii?Q?YKxNEmaKr0Jwzj6JKU1SCjc3HPaM5gfg8Wv64Nmdp+VK9by4EM1coJv7mOwB?=
 =?us-ascii?Q?4LwaduhlE4H0K4Rwr3roWTD8WTMp6pV089HU8K6KMuD1+6jk7o//+xn1LZag?=
 =?us-ascii?Q?I/TDvNYBvKW+eZxnAk8ms7D0qQGgBJAGwEHHCjArkt4ziiQ7BQplUysQk8Td?=
 =?us-ascii?Q?40fR4tEiyR5bs31HK0KzPVWnHXS6sfj7XPm00A+K6hZvMv0ZRS0WpZQbbp21?=
 =?us-ascii?Q?623M9M6VdKEHPyD6oPnw1v3Yi0G3/oRXidba/wsTjGXostfn9OtgbL9Fd0WA?=
 =?us-ascii?Q?tg5d9OVJTbBbYZQUe3qwc4J9j/ZsQ9dO9uRFE5r47zzW3pYo8uBUpAg+Zi1j?=
 =?us-ascii?Q?QZToXOKEnURlx/S285uJttMhuA0snd1ZDqeIz97i33CSH0BGHUehVjQKiAYl?=
 =?us-ascii?Q?rk20sXvNO4WtPl8f5LIafUK6A5GlDJFJYhq3dZzjNgqxBpvjEPa6BLTjAHR9?=
 =?us-ascii?Q?kovRE9/6WOMrIDqvVNz1BsJ+sbbPPoDNTb7pjarZd/x4m2kJRI6bdSHebCNj?=
 =?us-ascii?Q?+H8b90d+tUYBC2USK+l/kTWlVkI4PAmz1gbBOR1JGryYgXdnk81ZaYlDutJj?=
 =?us-ascii?Q?yw1nzzptiS77m1+ndbfAPxNQlZkKfQsCLhSQgQn7C7G9G/fyGlqgY6A2Kags?=
 =?us-ascii?Q?CAqlAJBIV9aRL0R4czS/5Yx4SBX5Og6+NQClC/B63tBNuzLOXIeMIbe0y6gz?=
 =?us-ascii?Q?PL+EQz61W9dkcpMpbkt71diQn1876M7ta9nMZqRQQZDNcf2IpoNudTU7nRVf?=
 =?us-ascii?Q?Xy1oS4iGaFLgTwti/EooaQWyLbv04Zp59YRKCJLbYCgOKMGpq4I1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cab2ce9-fde8-4514-96cf-08dee3437dad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:06:55.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27ypboAwUI2afQTkVtVIojrEonezW+2NZ1WkdUnZ21SoMij6qBbrH4SGs20vdNWRMQkXhi1lVgODHXCw6ikT8L0hSU2QZnvYMHjdTpPAycCiQI0cV0cO58n3fIoFGGDT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12324

On Thu, Jul 16, 2026 at 12:27:58PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> dma_request_chan() assumes both @dev and @name are valid, but neither is
> checked before use.
>
> dev is dereferenced immediately via dev_fwnode(), which accesses
> dev->of_node or dev->fwnode without checking for NULL. Likewise, if name is
> NULL and the OF/ACPI lookup does not succeed, the legacy filter-map path
> eventually passes it to strcmp(), resulting in a NULL pointer dereference.
>
> These are caller bugs rather than normal lookup failures, so add a
> WARN_ON() at function entry to catch invalid arguments early during
> development instead of crashing later.
>
> No functional change for valid callers.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dmaengine.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 9049171df857..7b479cd93b9b 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -814,10 +814,15 @@ static const struct dma_slave_map *dma_filter_match(struct dma_device *device,
>   */
>  struct dma_chan *dma_request_chan(struct device *dev, const char *name)
>  {
> -	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct fwnode_handle *fwnode;
>  	struct dma_device *d, *_d;
>  	struct dma_chan *chan = NULL;
>
> +	if (WARN_ON(!dev || !name))
> +		return ERR_PTR(-EINVAL);
> +
> +	fwnode = dev_fwnode(dev);
> +
>  	if (is_of_node(fwnode))
>  		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
>  	else if (is_acpi_device_node(fwnode))
> --
> 2.43.0
>
