Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1402368968;
	Mon, 14 Sep 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401830; cv=fail; b=sFoFfpgE2b0M60p5/y0V6GLkAr8/L0suQ96MWBt57csOEZgsreKbk8nx71Gg8ajPfOFQFl92n/A0ANzanUjZQ9m3V+PZs6l0Slm1EGSc8Kw58vXXMxNwlkc7T1NZBm0lbXsAx9k/CfoXbyn+HX31KF6FXdNnSrFnKZgS8foX6rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401830; c=relaxed/simple;
	bh=ZyoYas9NP/I4xBYeNkT05hNV3Jmy6VvWZqwJr7q8Nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nPvQWM7lM74IrHsJTwfkQPT0E7nApRQP8s4x8ZYvGuiQJQCfvhe39Wujl2CNJLMeKIxL6ERCTjbQgRwpUfWa3aDR6zzVv0eGjo98yeZlfVWPfLIFS+6VEfJMCC1XHdSfA5rFFWfokAqDWPw8/bRIlHugtdHW2GBLEVtrEK0mqyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rfS+AgGt; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rfS+AgGt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1Was8yWFYcq8O8x/x1ppcLaOfLCYXrojCw85r2sKj6KqR5OBF6FT5VouQ/jtlm094Majy27tcKURkuQlz/YYP0qxEfoJmuq4Vsfz0y9/QUPXhuYafZvPfNcVyowMLkhaT2kRzqrvo7IY2dc+QM0x3OOdreYtbgNLaCCr/sLv3iUFlrAJXVzveKaIgRLPi86VK78fsjG9hGJPViwqrabODcx/yBDO5Ywvav0pM4KQ+gaCjysuXj8lFOJ0sRMmXhIR2wPxJYmSVsQtYEDdxC63Pwu6CIbjkpK/65mxr2Q+GL8U1y6WVxXvUG7kEYKdE2OLkoit1aW6Yz6feBE1tnHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5i89+Rn7heCJo0+r2T0HE47oEfZweyoOqEOOXvw1e3s=;
 b=In9wB/O8m0lCtB4mdnn2MOyU8yllg+vqhzP6oFIHa/FgZZFl3euTm56I6FhkXguWmHMciorrrXlFy3mwA7KWyt2AxWcZvZAOJZisCZu+pA9LR3+9QdgqG8CJENU8sUTsOyoJPTMlBzQkAVLUfH+0cffr62qAf7I5sJ75Id+nqSiftnSUSMA3xO6edQV5coH3goXsFkdP9Vv1kWv+NaC55mBOtChvzwgkN3J9Sp+3iZuGjPhEDBTda7PqAGob0FbGcTh6AF9C6/QNL3huWQDAUqAmRHJQ/KLM7FkqPzXXwjPVg1t2FjcOX4Gyi02dJnnvVqmOSySnEal67UbX91y02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5i89+Rn7heCJo0+r2T0HE47oEfZweyoOqEOOXvw1e3s=;
 b=rfS+AgGtgNyFuYyjylqmD9WJ/Jyz9AQa1QZBbrUwRavlF67cxixXi0BVDnVeD14c+S1PGUswjx45JNcPQVxx7UaOSi4G3pnYvoAUZH/uyp7xOIw3il8HHXjJLU/E4vkCvNsfFGqcP3mLbeWlOUNQTsahzaPV45pnI8OpW8OckxfCcb8zvsITOkitcNc5cjdC6fV4tUJErXBMalkoOGZ9HIncVP/46jG38SeHuk6OI9+p+fCi9WIKA7Q5CYaKTj0KrPgyNZzbx27bG0lhp9nF1KPNklsdVpkcwRPMg9YP0wwWZ+fz9yQcwkrhh5D6TJOmP1n88NkGqhiQ9ZkBzI/abw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB587880.eurprd04.prod.outlook.com (2603:10a6:910:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:03:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:03:45 +0000
Date: Mon, 14 Sep 2026 11:03:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: bestcomm: gen_bd: fix out-of-bounds access
 in PSC parameter lookup
Message-ID: <aqga2QY7UyRQuold@SMW015318>
References: <20260911213747.132694-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911213747.132694-1-rosenp@gmail.com>
X-ClientProxiedBy: CY8PR12CA0042.namprd12.prod.outlook.com
 (2603:10b6:930:49::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB587880:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ae9f1a-7f57-4226-7af5-08df1279c142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2eXtT7bCA2Vddb6xz6trQUkY6T5f5NUMLS8CWQGw1dKjcTD6nbLPHG0Vr1muDYBESY6wSQn6LIuPjsYRT0tEOetA0duLnRFyQzeYMCiZTA9s6yYE30y24FYh8FvhGWMvCsgsqVyQ62LWK3XjFmPOie1vPLNjx8bBpUip97ODFcYJ3gwoAQDSI5yayK4Q10EbQRZ50I52/C0tZxZ8LTTHsA02VlYm05Zxp9eQAwDx9VGiJP9Ldt1sIK6osU5sjaFNrAxgE0WzOSXosYjvSac2J6QOp6UumBTZQOZUrcu98QfpdOQnia+WjOI7uP9oCTa31hXZUQWLPkATrpxSGiZeIgXnOQPkfv+00wTbCEJNuyEQJFreV/hJqOJIo+ICTfFDa+jzaTvhnyd00UCqbqkQ0iQ6lkQdhCmvkNDBeFAAHQ7zx9v+0RZZGKGJsNToQCyf35eSixmImLRLFET6m+riynbWKdnLTO0HJriXqAClEis2uPD7q723Pf4jQ/m6fSSg0oPumuUDc+UQpkd1Sb2RV9sFAApC9ni8PEEjtdHIUCXpJvBEF5CqsVZbZJ4s1+qz/WhIEtGKZ29qtFTyHGm+bfqxTRjByUaH9iC5XnqhKkUhgkweSlWUgHusF0Q5qjjFrbZRq4ShOMmW6X/ZG4rAdap9PytAejsRumajCzagfhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2AS8L7R6cm2TFAR6h6QVOC+hKLLf48YNI5g8DiHmXteg0FqmBj5xLqk1CDy?=
 =?us-ascii?Q?ce8Bc0ATDlOBC91AeqW8c+vn/QbmtWQt/lwzbthmJuMXISbmNfc8rdiHbTzN?=
 =?us-ascii?Q?RLRAuG0UPhK9hivtl9ndE+Rzt6swmaEval5gOQpWAPhiHxNAwCBTASRRl/52?=
 =?us-ascii?Q?DnQUwRfna4gboE2AWtR1NomLEuiQRhf87zxCu7Mdda3zRH+l8+6npBwh/2km?=
 =?us-ascii?Q?eVc7XHJ+Wi8CnzTY19fgX6afNV1k9E2S5xv3+g1yhdU7qzvhgKPTk1kAm43M?=
 =?us-ascii?Q?2Ue4Gf+VSoZqGPmsVHAI1RCMTlW9XClJvLr9z13r+0bPY8reYMI+RnF3bG1E?=
 =?us-ascii?Q?qw4OMhB/c79OuGut75cNj1ZJDXZTWPyNm5DWnM/Qcb2CERQ4jWRn+zYKW4DC?=
 =?us-ascii?Q?oYuERbbtBpDn+KfTWgSgiW4xwt8VQCY4F2B2qOeuBMSLG9vk23VPyRHMJIeD?=
 =?us-ascii?Q?TDpdyP34GndFUF+EaqqMh8GjF3xAJuxJ9PvA9gDlaoDszgLJA6LAIb79YwMP?=
 =?us-ascii?Q?HXWA+Kglcpv8A8Ptr/a7Pds+E3htfqd8xF76bXhOdneNwLnxp8olcm8TGY42?=
 =?us-ascii?Q?fnuv+sLM1ne7YPRJ2GrP2ePBVYNFJnxBWMk5QsrmGmjwMHruQ1bdDO40QY0g?=
 =?us-ascii?Q?h+VhOY22lubYbfuepwCeAWJt3Puh2twrS1uWMI34tAot+IIcCEY6xggMD98q?=
 =?us-ascii?Q?YKaorjJlfAAmkHAFJh/YJiPhOnJfNU/CU7aLplEoO5sbpy00KOyPyVQB1xvw?=
 =?us-ascii?Q?HbquTRgk32byPqOd24UkObhfrOvwhQQzeztEwqaA6Ev7MAdVUdSlT0kyskQj?=
 =?us-ascii?Q?WMDmghlo7/Y3DGvvZ1oRFUEWByqJt4N+//s6sNeVpbCcgxyIHNcJP7dOe39r?=
 =?us-ascii?Q?djpSFcmrsNNQu8Qgd3Tap62tITLJLGH1baRvtC5ZDjWTt8WBgFM3Jv2j6RBI?=
 =?us-ascii?Q?1RQohe2yCD6LemWxiHed8nEF1ZPjypUFPgEY4C3kknyYqtqdqC3xTJ1BtLlj?=
 =?us-ascii?Q?/vPJ8Foyv4VqMY0tD1V3aD2ZXHOxiGaIt3cyQwAL5BkWIHzGx2oxQsq6DrtK?=
 =?us-ascii?Q?LTRtz1raEbPuYPxh/IMdr9aN+XC1Y/4AEUug2vij2k2ji5T7jL2fukVstqUU?=
 =?us-ascii?Q?biyngAgAg3CrtNVxw0X6vUKrShVsAr4mRNrPI/QOYLnrMaEdMaEPSNXz4LWQ?=
 =?us-ascii?Q?6SJooI4JWPwnnv7qUPinWDaiYOgHDGQ7JdEBrTfmTjPZuZXBkQxf3gIcuh2/?=
 =?us-ascii?Q?8YangDTb0kKmXo4oifdK6rEaD/1O62wNbAbCnafsA1a39eQYvYdc6PpbIB9v?=
 =?us-ascii?Q?B5nigkJjhMu5kN/kE4TpHpovNODxS1FsJkBBySbzcqVy17mg8BZuRdmdPDCv?=
 =?us-ascii?Q?QW3+1Sen1chbZl9Zz3irSlSWyCBAYV7W5OpFjWI047KXI4igLgCTQWyOnLJ+?=
 =?us-ascii?Q?1cp6lb/l1mVPEBZImeVPBzM+wKJGN6YzBeeWC8yXKDIj4HcEHrm5jGtmlh/X?=
 =?us-ascii?Q?/qNkzZL9S/eO3AiUYoLMsOc8WacH9ze6hpMnLaZSVl5K/9FQ5Vyel1ppR42e?=
 =?us-ascii?Q?DMBohPIFwIsPZUX7nloO0YnAWRA0js8lyNAUC7To2f0VsMY5eF6iPdEIUdcu?=
 =?us-ascii?Q?6S4jBNcgiE3KHWNvwmsQYyizAHBnkqY6aMSrJ/XvB2RIqp9mrH0iMjwPQpxn?=
 =?us-ascii?Q?/C3dsb5+JugL4+90A/MqGOHk56qTM8byp1RhX0UAdNKD5vE6V8NXPWNA58DI?=
 =?us-ascii?Q?usvV1jYbMhfeYp51IRFg991Vbo1gxfPF4zeAukWSu4NgeeHaQ08Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ae9f1a-7f57-4226-7af5-08df1279c142
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:03:45.6035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCwcmIuFJEFARG5PXQekQLsgts1TUsmTk7wm8vIEwYGJhA7KDTf2eI1Bq1imUL/OFeT7qjY1EIFkuQ4tcYIfaeD+izTDlKOU+S1ivqCG1HZwBSR6U46vnZESSrmOMGvJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB587880

On Fri, Sep 11, 2026 at 02:37:47PM -0700, Rosen Penev wrote:
> The bcom_psc_params[] array has 6 entries (indices 0-5), but
> bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
> be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
> and read past the array.
>
> A malformed device tree with a large cell-index could therefore trigger
> an out-of-bounds read. The garbage initiator and ipr values would then
> be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
> potentially causing out-of-bounds MMIO accesses.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v3: reduce bounds check to single function. It's not used anywhere anyway.
>  v2: fix title
>  drivers/dma/bestcomm/gen_bd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 61b5746e1a97..208340ecd2b7 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -321,7 +321,7 @@ static const struct bcom_psc_params bcom_psc_params[] = {
>  struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_len,
>  					   phys_addr_t fifo, int maxbufsize)
>  {
> -	if (psc_num >= MPC52xx_PSC_MAXNUM)
> +	if (psc_num >= ARRAY_SIZE(bcom_psc_params))

why bcom_psc_gen_bd_tx_init() do't check it

Frank
>  		return NULL;
>
>  	return bcom_gen_bd_rx_init(queue_len, fifo,
> --
> 2.55.0
>
