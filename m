Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033575;
	b=lvv2eGKEXCLYWUiODawxS29HhS8MdEfsJ+vO0kYzg8ZRla230a2Ub23j4PLlC5C0Vgwv
	 Il5ebSHjiQ8mQGaXvyNiZGH3wz2lkGTrp9pBGWqbHw7s882OLkLz2hZzBvxXSpDuYVU6G
	 yDMEPE3nVgJq9lZRNRY39biRYmCPdWUf8HZu9IavUDfzxYdN1GWPcRg33ET2Q3PwKl/Ta
	 kVMFmmiz9jsKdBxViX9x4272ODQzKmdjQbkjKnr5eXIKUbcwMQuUiszJ3xAJScs0kFW0U
	 EUCGrlxTVmPgqxuIaPcEGOCj0JFx4B204wVod2npfo9HsjIPRZZyuQzQ5RqTi5Aj0PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033575;
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
	bh=WUiUya0RoBaglTkpkJIpKmvBEXkcdL6BChTVgeWR1K4=;
	b=apRMHzb3Aqbh4DP5rxMhsfiayX+jfO0IMRK6PKRSWb0mSzjsmgI+Imp42Hbl7YHXkxdt
	 dFkYXGErd9zBSTFL71BQVP5tNDoEzYA+OhH1tJwhqqn5gEpMwl3kLPh+6CnZOfXxbI7Y3
	 6d9gRudSPMsBUR1pXQHvj1HrRIIHDLaA6cqeek8EwbaJELCP4mIsHka4qUCdiiVDZTUXm
	 D7kchH0LN7SpQ3mgai4gJDQRUCHAa0lsHCab78hM1cFvLxKax4T/DiXCBmBhakqwKL0VV
	 GM8hZVrczzup+qR8zzoceU0hJLMfdQ6LKA/plf4e9ibS/rfYdjZV6CYNkryTY0XPjhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QHuFMH7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.17
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08F606A32A;
	Wed, 18 Nov 2026 20:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F08F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QHuFMH7g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cz6+6UBkKiAQHPiskFkv62eUBVsOzEUhq9YHhXB96XqK/fBpCYH2U+vV4zpB4U4wiK/z+x73v0xcBce0v2sawsC1CnvogcQpg6zQdThqBeMZFVX/RO9hcHeVU7UI6P7zg/GfBnY3fsFcPiifRp0wnQeQ/WnBM1drKKgtclkv5BkExdrb9msW7DkPc4n8BFR17U/NMmU/FEoSCYUsYrvNXFmtD55zIvFerCsYcnb3eYdcA+cHJpEOzyrxRdgyxPuZH12C1LHE0rQzjGPRRRl4EOSICtWXw62eIeZW3CZ/7FsyNvPWncIGVs3NAbCxKZ5rM6AhUYI/HN5rlzFBzEvciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUiUya0RoBaglTkpkJIpKmvBEXkcdL6BChTVgeWR1K4=;
 b=Lvi6o8MTLkhtM086/NuD9fmNyqw3JfxNsq5hKoSCsfQRsgyOuQdsZ3br23v+uVKnkHhRtqF2XkuD0cNYa3wCaDsUfVTxMteE/DLhbMDaArukwlx29i5dZXXpMQHfy6pJo4N04YQ6g41dWHR7r23A0RmojpxZ/nBCEwlDRprEgyUfq4i+/AmihALHcoeN2a5a+pCSQmCCw7kBCqLNf9Fv2srip07izkdRRZ0i/zXVreUfHSER+cifCkSnZWBHt39jYNnE4OQ14lntB46PCz+UTTaUKtA8yuYr/cpz1PgSP+/cs/yVd/bR8Qo4rNt/pzow1GDWwp3dQxjQuct+vzVrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUiUya0RoBaglTkpkJIpKmvBEXkcdL6BChTVgeWR1K4=;
 b=QHuFMH7g413JoPbffR1LnnD+WUGNGr2bDTrBdtDEd8ufhGRBYVdGat+JmRhR53cA2rdxjnzajuSFrSqkEeCQ2gni9eGS33aC3a7Txfd4JCe/hOJHB8ZcUkS0NpvuE0oYewIqyKKHaVXv4uDu36P/HELfyYR9NTm9AyhoGhtC8jr0Peoi9cUHbqOMncA9VTRUguolXCqYELHRKN6J5zIiLUcAV5L1Wd6rZ6EYG+ypkkxV0JlhMSNf0a0jqPlXtuUA7EwpL2NUqa8cbSTPyuGtItAevzpQPUInzPICnwzQxpXk5HoajeKbSp8xrkGV6D6ffeXSx+kYE8wxCzlCO4XV3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 20:26:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:26:11 +0000
Date: Wed, 18 Nov 2026 15:26:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v4 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
Message-ID: <av4J3CexdnCy3per@lizhi-Precision-Tower-5810>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-5-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110173137.623764-5-logang@deltatee.com>
X-ClientProxiedBy: PH7P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb7714b-e21b-4855-34eb-08df45b22fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|261026140227099003|56012099006|261009223027099003|261102123227099003|4143699003|11063799006|261028144727099003|261022105027099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cNzk/W3vI650F/lpFqdfC+KbbY0E0p5gIzuADur4mtW6FsFEcUgwwll7f8Uc08EIGR4L8MkNdZcX2hMP3R2bZxGuO37Uvag/n+BwJ345nRZBd3Czf3UNO/LgfDRAkY/Uh/CRzlYJ8oW0iUic6uKp2UyEHq6f1b48YUZG7B0+UL0IONK9onx17MWz/zZ6rFu8O6TIg/XI6CrEfxJ8iSoyFSK7HzUom0gH0yPg9LkBgjhdoRkwR0jCCLbSUXjyfiR3iB1tY8CbX8J/FMZ/7wer96p4PMlzdCdV7h6Erz+83f+fOfKYpNgPujxcaaCsDEST0A4CJgynyTrj99qPXlN0RKb7W/4irggdoueZUKtdT3bZV2O7UUqCkZToXXc/yNTZMg6jdg86UCtenB8SKaOuYYAx+x0XREKwn7X71SlR6CHxGXEUgM7UJ+meLv/aHFIlzCdp0P7D3WqNJgKbYEqWzBc6dgmm5UJEsEEP8gWlVVJmanZFCK1IPqmIFxYDujlrWrWS9miiLnhX6RS0KGNWCtpKlP5PYL5CZviViZFBf+R6p4XwodHY4bgnAzUzZO1Rix4q8ckJ0a4qTbvorl3YKjdPsZ7SfTZOmoOqj7eNNI4JTIU2EGlweZFOJolVZu6w3Dxj3uQ830XY50MOJrXjhcrBdyWQNhbm4FBTnEy/DUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(261026140227099003)(56012099006)(261009223027099003)(261102123227099003)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0pqF8n3iSBnHKP2qddud6txtbrh6MvEKb5ZmymH1RBnOMqXVmDG+u2kbZtEd?=
 =?us-ascii?Q?W91RAqsaojx2thyIZKegubuozfPglFW7lgVQ5qbwE/BxDG9dgT5w2rZqj5sF?=
 =?us-ascii?Q?BTt0MQF6Gj5mJTomT2fFPeSxSiX7fx1dcrDp0fwSfd4PQrEDAzcyttNs+B/V?=
 =?us-ascii?Q?DPRoTGF3v7Mo1umJsw38zvTQVyu/njbvw8s+HsotOeIFIxly+Tzg5MJ+cu95?=
 =?us-ascii?Q?KgP5yAUT1b7R1P4iRzPwsyAs0V5dhU1sLOAk0jlSYuFdvrlDDnfVMU4HzxDe?=
 =?us-ascii?Q?Sb2KxKENfySbRckADrkQeUtnnztvl1B8boUlM/Ev/MfidfLOjdIeDSIYs10l?=
 =?us-ascii?Q?1rksUw5zP4bwRm7aGyC7M1lPML7VISRDvYiVdiPY+E6jDBwANLekpU19hWgY?=
 =?us-ascii?Q?cWtwsU7A938OOfn5tGLBo118NvhkilLOpGjBgxNhAOXzWQJK4XLjs0Gx0anI?=
 =?us-ascii?Q?yY4uS9y/IwBe+n4MZ9iDcm1cUW3nJo22Y7s72gvDmD0aU/5+sQdWCeLJEQE5?=
 =?us-ascii?Q?Xbz9PRepmuGPnCWVf2zkicvXcrmCCR9612jHLc/rR2iNGCo8UU6oDg5B5708?=
 =?us-ascii?Q?8ICJonGm12OEeF/6N841BF3LLgLOKQV2Dl26QMJBy79uAiJbcGpKFbzDhitA?=
 =?us-ascii?Q?1S1bilEG8ftbZ0OHLPgMMzQG3t7ZS14WOBEyiI9PPBZ5stKuQIvp/9X7/gjK?=
 =?us-ascii?Q?GOCXHjCjJyb47d7eBjYN+wfgtcVU8/ZjgJoqSPySU5ey0hkr0hv1aIjau4u2?=
 =?us-ascii?Q?czQTcmaYY4q8iYifSMdkCUqd49N35TCPT2dcn0AVrOJmXV/tndBi9etSNi8o?=
 =?us-ascii?Q?v8zHcxhNe1DvpQOY0qMjSqTCZbG2Oy3Xicq0D7clN9+a5SobOedHFiaf4PfH?=
 =?us-ascii?Q?Z//X44IviWtPMNbp5QxBkoVoeBIrmjX6AJj/MD+gzKrh3zuai0pwLXBxm6Hy?=
 =?us-ascii?Q?ZWoskx4JUmSLi+cqJ/tlfUN9p2Zt16uT222Gebtwr0aXyNPNwiVJZhx1Qm0T?=
 =?us-ascii?Q?YBmKMOu+PRB1WNpdym+iViDdh2XB0hz2A8Tkhn9wgZMgpEUXD8/EXqHGVU7X?=
 =?us-ascii?Q?YG1S1VDEj68ZzCauofXCZztwD1mMFDx55kWoUj8bOCktayTT9cBGMlVJs2hA?=
 =?us-ascii?Q?mqi8KVARfL7MdbgjA0k3qjPurgAFjEfpiQ56eVLIExFtkqNo3DimO1ly0tFl?=
 =?us-ascii?Q?i/WpUrXA2p7DNi8RxCccogsO13rIIajQUPlqCJlCLCFOiKmx4P0ZV4zvBlj7?=
 =?us-ascii?Q?Kj4XB03UXcdaDLcjYxqcBHhpuHBHHGJJTmMZ7Tk9C7oMoS95rJ7e14LzLrdt?=
 =?us-ascii?Q?WLCmW7vK4iEpXexOBStfJHEhcDDUnvwH6n1OE7toCSShGcbh9JdTFWh4kDJG?=
 =?us-ascii?Q?xns7q16LuaoydArMRhPQ9kNCa3nUkTEk4marrZHx/CF0L8WUKIR6PvJVO0XW?=
 =?us-ascii?Q?N+HPw9XqhqHRQVcOYkkDLkNMb2/uR1+ZtTt94Cz5irW302Ce8BVFnuag6nfP?=
 =?us-ascii?Q?iD2OjQdXhrpUvi2XV9qAWmui3PPkjUuM/X93s7HvbqdYafLcKoftayd/bfc2?=
 =?us-ascii?Q?pW/APQ9yjSqSg8hmS+BnVj4BRv2fHpbPNG+kAztCeVsbwEe3YFqWWJA5oUuj?=
 =?us-ascii?Q?6XXt7+y5arEGJr/n8VMRgMTLZoo4HcFxrGfGKPVr+K66NcYNJSId0QUs0H/E?=
 =?us-ascii?Q?okWcRz+a535KYBwABt8fMFhLowpTrB/2F1lDb7Xyg0iGBqehnBrDHHMlAKz6?=
 =?us-ascii?Q?w/QvXCFDCtc6m38ZxjLpwlmapCj2LSHJ8LhS032XVyLvR2zLTs7N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb7714b-e21b-4855-34eb-08df45b22fce
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:26:11.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGl+pjkvJsN/C2Y+fBGBUUXikCKex+3bFsXhVpjq94p+XdxpEbEMN4YQD3gpowrXWtHVHPJBHxXH7LCmf3mvE0+VjueQpwuIDfHEhE/XC1LPFryO0T70E84fI4j28vKz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938

On Tue, Nov 10, 2026 at 11:31:36AM -0600, Logan Gunthorpe wrote:
> Switchtec hardware exposes some performance monitor registers which
> can be used to monitor various statistics of the hardware.
>
> Expose these as a "switchtec-pmon" sysfs attribute group, alongside
> the "switchtec-config" group added previously.
>
> The various registers are read through a small shared pmon_show()
> helper parameterized by a reader function pointer, rather than a
> macro, to avoid generating the whole read + rcu_read_lock/unlock +
> sysfs_emit sequence per attribute.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/switchtec_dma.c | 273 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 273 insertions(+)
>
> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 1ebe17095c61..774b418330ed 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
> @@ -12,6 +12,7 @@
>  #include <linux/pci.h>
>  #include <linux/delay.h>
>  #include <linux/iopoll.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>
>  #include "dmaengine.h"
>
> @@ -91,6 +92,12 @@ struct chan_hw_regs {
>  #define SE_BUF_LEN_MASK		GENMASK_U32(20, 12)
>  #define SE_THRESH_MASK		GENMASK_U32(31, 23)
>
> +#define SWITCHTEC_LAT_SE_FETCH   BIT(0)
> +#define SWITCHTEC_LAT_VDM        BIT(1)
> +#define SWITCHTEC_LAT_RD_IMM     BIT(2)
> +#define SWITCHTEC_LAT_FW_NP      BIT(3)
> +#define SWITCHTEC_LAT_SE_PROCESS BIT(4)
> +
>  #define SWITCHTEC_CHAN_ENABLE	BIT(1)
>
>  struct chan_fw_regs {
> @@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_config_group = {
>  	.attrs = switchtec_config_attrs,
>  };
>
> +static ssize_t pmon_show(struct device *dev, char *page,
> +			 u64 (*reader)(struct chan_fw_regs __iomem *chan_fw))
> +{
> +	struct switchtec_dma_chan *swdma_chan;
> +	u64 val;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
> +
> +	rcu_read_lock();
> +	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
> +		rcu_read_unlock();
> +		return -ENODEV;
> +	}
> +
> +	val = reader(swdma_chan->mmio_chan_fw);
> +	rcu_read_unlock();
> +
> +	return sysfs_emit(page, "0x%llx\n", val);
> +}
> +
> +static u64 read_se_count(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return lo_hi_readq(&chan_fw->perf_fetched_se_cnt_lo);
> +}
> +
> +static ssize_t se_count_show(struct device *dev,
> +			     struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_se_count);
> +}
> +static DEVICE_ATTR_RO(se_count);
> +
> +static u64 read_byte_count(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return lo_hi_readq(&chan_fw->perf_byte_cnt_lo);
> +}
> +
> +static ssize_t byte_count_show(struct device *dev,
> +			       struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_byte_count);
> +}
> +static DEVICE_ATTR_RO(byte_count);
> +
> +static u64 read_se_pending(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return readw(&chan_fw->perf_se_pending);
> +}
> +
> +static ssize_t se_pending_show(struct device *dev,
> +			       struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_se_pending);
> +}
> +static DEVICE_ATTR_RO(se_pending);
> +
> +static u64 read_se_buf_empty(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return readw(&chan_fw->perf_se_buf_empty);
> +}
> +
> +static ssize_t se_buf_empty_show(struct device *dev,
> +				 struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_se_buf_empty);
> +}
> +static DEVICE_ATTR_RO(se_buf_empty);
> +
> +static u64 read_chan_idle(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return readl(&chan_fw->perf_chan_idle);
> +}
> +
> +static ssize_t chan_idle_show(struct device *dev,
> +			      struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_chan_idle);
> +}
> +static DEVICE_ATTR_RO(chan_idle);
> +
> +static u64 read_latency_max(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return readl(&chan_fw->perf_lat_max);
> +}
> +
> +static ssize_t latency_max_show(struct device *dev,
> +				struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_latency_max);
> +}
> +static DEVICE_ATTR_RO(latency_max);
> +
> +static u64 read_latency_min(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return readl(&chan_fw->perf_lat_min);
> +}
> +
> +static ssize_t latency_min_show(struct device *dev,
> +				struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_latency_min);
> +}
> +static DEVICE_ATTR_RO(latency_min);
> +
> +static u64 read_latency_last(struct chan_fw_regs __iomem *chan_fw)
> +{
> +	return readl(&chan_fw->perf_lat_last);
> +}
> +
> +static ssize_t latency_last_show(struct device *dev,
> +				 struct device_attribute *attr, char *page)
> +{
> +	return pmon_show(dev, page, read_latency_last);
> +}
> +static DEVICE_ATTR_RO(latency_last);
> +
> +static ssize_t latency_selector_show(struct device *dev,
> +				     struct device_attribute *attr, char *page)
> +{
> +	struct switchtec_dma_chan *swdma_chan;
> +	struct chan_fw_regs __iomem *chan_fw;
> +	u32 lat = 0;
> +	int len;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
> +	chan_fw = swdma_chan->mmio_chan_fw;
> +
> +	rcu_read_lock();
> +	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
> +		rcu_read_unlock();
> +		return -ENODEV;
> +	}
> +
> +	lat = readl(&chan_fw->perf_latency_selector);
> +	rcu_read_unlock();
> +
> +	len = sysfs_emit(page,
> +			 "To select a latency type, write the type number\n");
> +	len += sysfs_emit_at(page, len, "(1 ~ 5) to latency_selector\n\n");
> +
> +	len += sysfs_emit_at(page, len, "Latency Types:\n");
> +	len += sysfs_emit_at(page, len, "(1) SE Fetch latency");
> +	if (lat & SWITCHTEC_LAT_SE_FETCH)
> +		len += sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len += sysfs_emit_at(page, len, "\n");
> +
> +	len += sysfs_emit_at(page, len, "(2) VDM latency");
> +	if (lat & SWITCHTEC_LAT_VDM)
> +		len += sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len += sysfs_emit_at(page, len, "\n");
> +
> +	len += sysfs_emit_at(page, len, "(3) Read Immediate latency");
> +	if (lat & SWITCHTEC_LAT_RD_IMM)
> +		len += sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len += sysfs_emit_at(page, len, "\n");
> +
> +	len += sysfs_emit_at(page, len, "(4) SE Processing latency");
> +	if (lat & SWITCHTEC_LAT_SE_PROCESS)
> +		len += sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len += sysfs_emit_at(page, len, "\n");
> +
> +	len += sysfs_emit_at(page, len, "(5) FW NP TLP latency");
> +	if (lat & SWITCHTEC_LAT_FW_NP)
> +		len += sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len += sysfs_emit_at(page, len, "\n");
> +
> +	return len;
> +}
> +
> +static ssize_t latency_selector_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *page, size_t count)
> +{
> +	struct switchtec_dma_chan *swdma_chan;
> +	struct chan_fw_regs __iomem *chan_fw;
> +	ssize_t ret = count;
> +	int lat_type;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
> +	chan_fw = swdma_chan->mmio_chan_fw;
> +
> +	if (kstrtoint(page, 0, &lat_type) < 0)
> +		return -EINVAL;
> +
> +	switch (lat_type) {
> +	case 1:
> +		lat_type = SWITCHTEC_LAT_SE_FETCH;
> +		break;
> +	case 2:
> +		lat_type = SWITCHTEC_LAT_VDM;
> +		break;
> +	case 3:
> +		lat_type = SWITCHTEC_LAT_RD_IMM;
> +		break;
> +	case 4:
> +		lat_type = SWITCHTEC_LAT_SE_PROCESS;
> +		break;
> +	case 5:
> +		lat_type = SWITCHTEC_LAT_FW_NP;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rcu_read_lock();
> +	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
> +		ret = -ENODEV;
> +		goto err_unlock;
> +	}
> +
> +	spin_lock(&swdma_chan->hw_ctrl_lock);
> +	if (swdma_chan->hw_cfg_locked) {
> +		spin_unlock(&swdma_chan->hw_ctrl_lock);
> +		ret = -EBUSY;
> +		goto err_unlock;
> +	}
> +
> +	writel(lat_type, &chan_fw->perf_latency_selector);
> +	spin_unlock(&swdma_chan->hw_ctrl_lock);
> +
> +err_unlock:
> +	rcu_read_unlock();
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(latency_selector);
> +
> +static struct attribute *switchtec_pmon_attrs[] = {
> +	&dev_attr_se_count.attr,
> +	&dev_attr_byte_count.attr,
> +	&dev_attr_se_pending.attr,
> +	&dev_attr_se_buf_empty.attr,
> +	&dev_attr_chan_idle.attr,
> +	&dev_attr_latency_max.attr,
> +	&dev_attr_latency_min.attr,
> +	&dev_attr_latency_last.attr,
> +	&dev_attr_latency_selector.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group switchtec_pmon_group = {
> +	.name = "switchtec-pmon",
> +	.attrs = switchtec_pmon_attrs,
> +};
> +
>  static const struct attribute_group *switchtec_groups[] = {
>  	&switchtec_config_group,
> +	&switchtec_pmon_group,
>  	NULL,
>  };
>
> --
> 2.47.3
>
