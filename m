Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0547C0EE;
	Thu,  1 Oct 2026 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887880; cv=fail; b=sBJG3WsHY18KpH5jJkMNzBggMfxXPS6UIlzmXLA8QpctOm65L9fjQoxJPBtS6VHExpNJA5OxGh9PMn9PXsgf4JQOLu/XVrcZBF98A9ZIPk219Uci6QRCVM7o8gTqk+PUG9DTxuRN8rPWPV5AciI0Aii6HJcEistUONNNFTGzEkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887880; c=relaxed/simple;
	bh=8yfgnUqpms6tV4crgHNvSaX8IFLwx5prVBrCNm97OXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z9Fhegao91YNAG1tQPjk8tpzodMuBdj42Ht/WZk2a6jxtm6FIk6vzSgP9BW+RY9hBcBTHfLjOLuzmhvgQ/I9m+MtUFDGalQj6zl2V1UFMw0Nw2Ruh17Ng1GFXJLg3GKe0f3i0pvX+Tcdxtlvn47vShLkKMb4Os3yHlHC1FuiG2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QpP16LA8; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QpP16LA8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1ElXGIKDjDawk3o8Oe5G0XqdHtC951ewdKFcvxVqX1ZcmozTdOeZgyUnH8MCN4c574kJaUVVB9qQIaelt6MTdpgZ1s08fqAotrncHWjcoUBjaItqJzuubS6yA9p3J1Z4WMTctmc+7zQIwIZt/mP/KdacgUTPFrXIedvVFZoGlF/FrLh017cSB6Krrzz9o6F06Y3AIGTniKRh6X5P3vlG8gbIyteJTI6sPEuNdVNM1Aw3/h8j8oKR7NFMdp6/pp0lJocQ2/lIHSgdS0YH7iacyCHhcbcoqgDbXkoZGpwiP/brDZ42i2TJG+Kv5mjQWd0K7bD6fuT+4s9ez9S31yNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIVx6o82PaJRej2GW2jUDVd1+/oZRxZLSNyowyuaqso=;
 b=kaeRCOyOtceVwmIb2XkPvUM3hwAAiaz5yk9GuiXtQqscQ2Uh3BHpwb294BcOEosUuFwAmFH0hzDfHVEA0WpMTL2QYH9kkyN0k7NXyHWX8PuQuw75wez4lH+LOTibdsT1rviYKQQR6hWK8bFSSZVV1UAZMK+ZuPWc2+f6RCAmPIxOc0C/63bxV//Wa7siE2iEbwhOJ7pXIxT8IitVZ+xJNCJyaxGKUNUUN6ovjSslANTj8ER0fz+CPeTMH2hcIpJhaoUadgn539ConygZ5RGEd+Ytf3irW0stBT84OtevhWceCIURJxs6KAqZpA/tlNpPr4Fwv3a1GgPzrBpaV1ZNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIVx6o82PaJRej2GW2jUDVd1+/oZRxZLSNyowyuaqso=;
 b=QpP16LA8+0+Kd1N1xOz/V6k6yIjQq77x9PIMpeIdu6UPsCYYbLBrBZZ1Ld7vYc9JTS6qnIxhcrMqFUTokKq888xUOCUAvJRX8bD4ZwHEnvzhS45msgg7t5G6zQBzZYJVwPE/4PI6vZAs2RD2rLrD6YKof53ZFLZ2z53TLe7YPdIYmc7nnx1lPlz4sN//dAhtj//QYPrrSPp9BJF4QHbcmlacELbjgCjZU/OY5VnrZ/S1fDTVVQENfYUkJxt2R/D2q+rgH04Ec96guZq6oBVLgmfEV0+Q0BJ0c6SHF1qG7Kc816YSmZJxLV/mvZYwfiZEVpqz5qovcAyI8lLbLyTBjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8692.eurprd04.prod.outlook.com (2603:10a6:20b:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 20:51:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 20:50:30 +0000
Date: Thu, 1 Oct 2026 16:50:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jiale Yao <yaojiale02@163.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string
 terminator
Message-ID: <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
 <20260926143415.GA764757@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926143415.GA764757@killaraus.ideasonboard.com>
X-ClientProxiedBy: CY5PR15CA0209.namprd15.prod.outlook.com
 (2603:10b6:930:82::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: d528dea7-e488-4cbf-ef94-08df1ffda151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|366016|376014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Aserf5OcubU3fb/hhvZVBpDGmamtCZPdvxOlDDjYFTEQEIt6Qy8BZL7ddEf44PRE1TLvyZh5sfjSnKBYOO1MkeOn0dU20ORV2Ufgefd3vWzIlfn1Po3cUbHLKkXG0hYzzEBCP3zS43aSffhOYhUfJ655cbJuHiSa8lbgy+6hS4AtVpxrpQYrxtNLp3V4KDm6cJkmQSciPt+YcIptGoiolqzhjIp0ZFV4qjiT+otrEpdIF3O+z3zpE8LqWnLCntA4sOKp895xdXg4LjxeM8cBfJPpQzpGYtDsUVSox9l2fXEeZ4KcT2QI9C8vhL0k/yhn2Dph1jp2b/Tg7bMNtcjtUJsIPKgGNoxZBl5/SwEvnR/ECUcAD2YJAksuRUQO8E36QZw/MzHbxTNA6ilMrHwAyZ3EFOG57VvQx4eBY1mVO5gROP/Hjqqs9/AzdC0KnVTWLDU9SMu27OFGO340Z2z15ah0oiiUX0s5Doio9I01Xm2V7nqsBanbQHrfRIIYh84S+/f7+qxns+uZXs+ayQ1MOxUMtwTxhr9bSa9QFXlEsKPLrVcaQjxxfvfYw67qaB+7n6lYHKP/mjbei4gf3Ica+zbqZdSgBN+AsCYCxinfmgm6dKYucXZsvcY2T4y+M/1vDfa24CPMXKtQ+1MdEOUwnMCGJcbzjjiSHoz7m7lrZtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(366016)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b/Q0wm90KQ8+CEHGBzi3Y48rra6YvOFpZnWX7D6UCPlmVf7hSEb87FMF4RpC?=
 =?us-ascii?Q?lyuCoUToYMvLC7A8zm8KAfZtWaWGkwQ3i+ZLL93eML8pPnAOsYN+ymkMxkGG?=
 =?us-ascii?Q?w5B1mrox65QBxdOyye4D470qTPt+9LaTku0w76jfqO12oDKh5uyHT/gsytJB?=
 =?us-ascii?Q?KjzZ1hcRqdhxBvIkS/qHmggw7ulXjj2xDZ74MDXNYHNO1Jtirv1tWKU3JOHl?=
 =?us-ascii?Q?00qxFXdRuVzjaRrpUSRw+PA3g6DFfQN74fVmHPunNT1HdSh1L0OuLFq18Wjp?=
 =?us-ascii?Q?aiaUsj3mv4h3G+VtspNmKHIswqw0OSFBv/gcleYC4Y5fy3Yqaa1D/d5Whras?=
 =?us-ascii?Q?VduBC7OActrp6xBgPsaXP1ocFum5/HwCEK87Tu2RUh3bIXVEN0p1ao0wPF7J?=
 =?us-ascii?Q?hun/iQ32TmkJOZG7DF7jIMOni5PcS+od3wFyIWjC5tchzmyq5wZVoTC846FQ?=
 =?us-ascii?Q?xDkpLEWpFk8zIz+obyUCQEzSvVHrXcA551PQn3FFXEj8/j4wh5yviKg8t4Wg?=
 =?us-ascii?Q?IUif7dH25HIoslJzCFHLP0oxHR5UhPNF2Gh4OH9f4xCTvMj9hEjAe/AbL7p3?=
 =?us-ascii?Q?dlq0n93PXjx4dUr0achvUV6jAU0VtaXuo9A/iSERYeOXqYd0Uq55bWAqin8K?=
 =?us-ascii?Q?K0H5rjkbLxdq6aTPTPkx67EMcAW/+n77j9bmQ8FtROxT9o4qByjfIJ37pClU?=
 =?us-ascii?Q?67O8xvSTc/GtvbT2uwtS/T3TIqgRE9YHmSDW7sfKQGpaaet2Lwqkliw/UYG+?=
 =?us-ascii?Q?QAR0Lj2c6q7KScz80qGPy9slQMw/WZikBUSc1105F2r4wu60BJBK4Zgdz4SS?=
 =?us-ascii?Q?nQeHDCQCStqyDyC9SrenpGW0FDtpTXfk465k/5h7yqmuQvCJqY7NW3ucYi5A?=
 =?us-ascii?Q?sKjL8DLtO+zQ/IZpyJgYsnNku+ONwY5UuzB89nadlMmfGRAofJ7Z437qQJJD?=
 =?us-ascii?Q?JZ8MJCaCg7RY9xrTXYXLZDaE8pknrYRlFUhp8zsHA0o1vUtzafZNc1wrlQwB?=
 =?us-ascii?Q?xXPA2clcphl+aPk6ISYr8HhwaNtUaz6Xf8jD3XqD79iU+ogGOWOAcRa9aZu0?=
 =?us-ascii?Q?NeJE+2CMQ5lq2pmq7sHQyty6k4DrNhSZt55P0CwEueG6YwsdI6i3ePnK7nTY?=
 =?us-ascii?Q?7PvzgXMbywgRXQLSkdYXx811vfErRmbIASMFITCMN4FQ6JrZro1QIF91RMac?=
 =?us-ascii?Q?ZyflkR2qKSDI2QvtKgsb1HjTVRETHZHgGzrRGRpEysHgiyF1+nbCnpvbs55a?=
 =?us-ascii?Q?OwatadTrcSPjzH6UfGBeCUvATQjfPudVX1746+IEeFpsSjYjxiEFt5OG5MLe?=
 =?us-ascii?Q?1SCOP+U2pgk2K/tbA5e5O8fzykX43TDRkU1VF7qD+dfwcCgDLo0Xm2RxbeQ2?=
 =?us-ascii?Q?/FxoMfJfjLzsa8ZyiFlgMRrw6JcX6fK4T9oDUP7pXosjn23JkjxCauzVT5Vl?=
 =?us-ascii?Q?h+FFEZDc+FpKw0kb3lwkd5vR69q4lnC9yXKsCJKlcsHTwvRk6wVsWWwhuesM?=
 =?us-ascii?Q?7LtM/qXvVd1z/m+MekpKbxMAEDMXMkZ8f3thdZ4HfdErqIJibUuieuiq/rZH?=
 =?us-ascii?Q?2mge4WjA1rJNtA0rMyrNkNybpYd333KxRlkd94isay/evHSogt1Rf0hRWSe9?=
 =?us-ascii?Q?ZURFdGwPZrhzuo7rjkQ4Fjhvnq7D+vJlodBhpfVCRKT96Gqsqz253Ajk3xDR?=
 =?us-ascii?Q?DeirMgP2ZEpz4PZSM4QGsDYUgXcG7MCMrB0/C9KcF9IYfShsCG3VCNaX4IjT?=
 =?us-ascii?Q?nDizXpZPohnbMLxT63J7FqXL8ezhIBi3kvcU5eTTSU3p8jCwH8uw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d528dea7-e488-4cbf-ef94-08df1ffda151
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 20:50:30.6877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIfJcUtJCHgQpyiK4qyOyOlmoxhIdJa+vPfvW214NhghsHuKrHGuLfbMZcD3cauGekZhRDiWh8ehw91cn7h6snJXx3flSdGoMKbwQ+0A/Z2XgTp6LTE4WO7c1Ym7Rybf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8692

On Sat, Sep 26, 2026 at 05:34:15PM +0300, Laurent Pinchart wrote:
> On Sat, Sep 26, 2026 at 08:12:50PM +0800, Jiale Yao wrote:
> > xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
> > strncpy_from_user() can fill it without a terminating NUL when the input
> > has no NUL in the copied range. strsep() and strcasecmp() then read
> > beyond the buffer.
>
> strncpy() has long been considered unsafe, and has finally been removed
> from the kernel in v7.2. A better fix would be to similarly replace
> strncpy_from_user() with a safe equivalent.

Do you means use strndup_user()?

Frank

>
> > Allocate an extra byte and keep that byte zero-initialized, so the input
> > copied remains unchanged and the buffer is always terminated.
> >
> > Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> > ---
> >  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> > index d9a3542c4531..b61ef3062d84 100644
> > --- a/drivers/dma/xilinx/xilinx_dpdma.c
> > +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> > @@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
> >  	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
> >  		return -EBUSY;
> >
> > -	kern_buff = kzalloc(size, GFP_KERNEL);
> > +	kern_buff = kzalloc(size + 1, GFP_KERNEL);
> >  	if (!kern_buff)
> >  		return -ENOMEM;
> >  	kern_buff_start = kern_buff;
>
> --
> Regards,
>
> Laurent Pinchart
