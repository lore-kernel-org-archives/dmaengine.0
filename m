Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6790488D86;
	Thu, 24 Sep 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261323; cv=fail; b=oHuriyg+/6V9pEs9Wob21RW5GK4FrSU91V1UVMbktgqBNhwTR3ceQw8EfItYbUL1vzO4rayq6BOrns/QxbKMZd6iXUlJFftKumXiEHjAi2oCRGk1GQn1+Vpgi+9+KZMTtUgRRxvgfr3i6G+Nr1wmzCmqqL6t40Aa4HqBUq/uzcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261323; c=relaxed/simple;
	bh=X1LbE0LqrdAlvPD0hGaV3Y0npnB47gTjXtvxFeBjLKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NN6w/uMF2oa0GKwy6a4j7QqJRhW5RDLeiVJNWoWG4FzaC4m0siE/Dp19Zi7ejtTHEWC+kiadtsT2DmYpJWWTFSQdAZ1L3EAW02uBdrtFSwv8BByx5EBFBoBrWHE8nv4Wh33kp/Lhua0M2IHdgtR/BkuxS7JbYShNtUJXHdEZ/sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SSA9EH9S; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SSA9EH9S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peEd7k3H7OYW8R4Amlpn6UJ/TdkXWfQbHYiDVYNYgi0p5JTsS6tPvduqCSMxBR2nzukl9rSJDTR1zS8xNor19+Wkb6y9319qE25maHCDsFIu5qVj06RXXwVUEmaYnsYWiykVTxcxRkDne6kXNnetRzengUwHZ6C0HOawtcPAgacAHsjob4fvOTpEcTn0++aeE1vlAaZY2GPWqS1Sq5rnmLk4tP4lOQmvlBT4v2zYBSwobo+lzwGOQR2bcb29aKF9UvdDbul3Lc40A/04nQ8Qqnw+wcqCn4t5GTbC/crszv1aLDHXKPetJ3sdfqIxG62IsCRL9zVvFmAwQJHKtdkF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDV9RUeKjU0gV2BH0Z2ewO5aUI3PibVuN56Qe9QAoc4=;
 b=TeQm7c9j1BUw/p9bGvYTWA5S+nyH9S5zuOTYVYrzHGmJvf3YrM13a8GFgpPVBkji4W93M2OIeu7tiwkJWWxXbxIOKOoK8xysZP76OwPJDG3rOzClt/qi1xQ/DwZW4NigKjn+QkCd4vXz6wmr7kV0lgcjd+08ee7l9tSpAHq0obreEtix9ESqMVwWzlICMKKtm8z0TfnOui7cxY6LjRCdbxVUjHyYy42Vpx92IbQYn3om8TAGZi6ZBlzRsNtmNQwpfJGB40dwxU8fiq6eccGtR/S4fva+1F2M8IiVQpmX48TMbrusUFA5GumYDzxZgSCGgeZmb/mt8ErLSnpKpqkv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDV9RUeKjU0gV2BH0Z2ewO5aUI3PibVuN56Qe9QAoc4=;
 b=SSA9EH9SXzC49GuliliiLwK+ruF/eXLogO1CqTnW0IzvnktCLDfxrRpJy1kdCsRPXIzAWk+hTOnzxu/OoLk+6FrzsYYMNWprHAUvRM6U4qSk9MlcBPWJZCrT+B+CwZo4A/3MxOLWtWFeWtedGF2z2xlXuOSt1uPOexPHFwJ06LvvGW7GXBoTMaPEiJLonVLHY6yUsEQp6r7D1CHYfBYMuY5VwqgKJRPZvqqhTHm/l/oZfTw3BHMC3qS+Pkuya1Il9tgBHc6roeC38BRkVEVn8J9pU1ItM7+tbSX1rjYG1ukKa40uWdwv6AQlrAJum1+oAXR5WK4Z1L3AOLawDFV0/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11377.eurprd04.prod.outlook.com (2603:10a6:150:29c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:48:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:48:35 +0000
Date: Thu, 24 Sep 2026 09:48:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 03/23] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Message-ID: <arU4PAMX0wSdLEuO@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-3-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-dma40-fixes-v6-3-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CY8PR12CA0005.namprd12.prod.outlook.com
 (2603:10b6:930:4e::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11377:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d56e38-7415-41d0-b440-08df1a4ae965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	/d1El0yEgufB5nuLBJMNDWIE0CxgxPX73IHV7q1YUwmejWEz7Hjb+fUJ/z6QnTHdYIgY3C7d9a/5ckKUpZcqRwuNjH9aOC/BNxm+3OOpRYRrtWU+/i6cNfrb108oi8IZctJCmSBpIaxGIQqWWzqZHJreOgwS9fLODtJXuyOg3mF9jBGZrbmPyjWim8CkKKJmgXWT1UWsYn4sTbkZHSRVCAUEmytY2HUcztvRS3EFl2sOnDfXR5sp2e20Dc3BNDNySCUZGI0t10h4zyqSRPYxp+IBoIuP73xdjydy52VZDnHkIKQT/Pg7TCY1YCioVFtVSpTFrzWeluPUN/bClhGNWVEZdfaZnvsClV8jWgovHjoLLszcLK7O9m90XrNOg39cdl+UIMtuJdVP9eDRI4S/q3/8K1VY+RCeGx9VydV1dxaRslj0g2ydyD+ZI+CskGUZSbGqsdvYqbFgfNO8Wx+N75m/sVbS7paFxeVjWVUPecIsfC9i4f3H9YBnDJfOgrOcdsGv4748iDVColDgpAKR1bE6GWewznJigAluSsfm9sR/tl1fmM6jtwrinCoYDvnJM5nU8xd2WIJ5B+EVEpJdS6pfWmPOPRwBbdmZxMXgTpymXhJolrlOy9salZ0dilDztmwKdvGa1PBxcB9mFw+9eFoQoHfBVrp2GsB+8j7ntn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2F6NUtvRG11UnAxY0RHQXFMd2VHRVFTYTdBZEFtckE0RnR0aktONzVPNFVI?=
 =?utf-8?B?dlF0Q2IvcGNpSGpKazBZREhVMzl4eXN4bjJYb2dlOTFXK2RiZ2w3YXA0WDd0?=
 =?utf-8?B?bmJPaEJ2SFZOMHMycTE3NmlUYUkrUE1tZk93VVVJNXJnR0xYRzRpSXM1MTdi?=
 =?utf-8?B?WUV0clhlZERjdXhUVFplQUpoT2NPYlFLTDRpL2hrakYvSk4xWDVWanhsQ0tt?=
 =?utf-8?B?ak5vTmhpSWxqZWZmdTBpbmc3REtjSHBxRkFnektKZVFKTEVtNS9PZXlQSFIr?=
 =?utf-8?B?UWlzd0tRc1VVYTVxci9iOXBqSU9CaGtlNFZWbkZVL01tSDFIYlp0N2EvMHda?=
 =?utf-8?B?bDJkOHR3R1hFcU5DNjRERU9HUlZGdjZUc0szUTZEc0hOa3JadjZJcGlxeU5v?=
 =?utf-8?B?NzMzTkJvdlpUcWR0YlpEVTRTb1MvMEVOTjVESnQ3Vi9FN2RyTkN2OVo2YUVn?=
 =?utf-8?B?cWptRndDN29KZVdMRjEyaU83Rnd4L1N6RGlyNmRiWnVGb1Bsbmx5UzBScWxE?=
 =?utf-8?B?NmJvcUZKMmZpb2RENHpmUHJKYjUwcWhsRFZEdERCTDRwMU5wQlZoVmNyM0tN?=
 =?utf-8?B?Wi9BNWZydDkxWDZvYkc4REU5azJLUDZWU0ptbHd4OUNTd0hjbDlXNjZiOUlj?=
 =?utf-8?B?b3hlV1J0ZE8rSnIySVNqbUF4T1pNQzZvUWltdlVFZTR6dVJHL1lNUkxGVlRw?=
 =?utf-8?B?a0tzdW5sMWNEN0JYZEpRMkY1eU9melY0S3NZbi9Ha0MyMzRtRlpKWGJDS0Jt?=
 =?utf-8?B?cVM2M21Cdnk4ZmNaNmtFOWpja1NEdjlXSlpKcVBhQlpvd2hzakRXeVl2VE0z?=
 =?utf-8?B?L1dUU3U5Yzg0Ni8vLzFOMFJaZ3BHQTRHZkpHOGE4RWFZdEVNZjN0QjhIcnBx?=
 =?utf-8?B?a3hMOGN0Y1BUbjUvUlFLVGpmT2NRY2s5UVdqTEtkMzd4YjcxWUR4SVhmNU5C?=
 =?utf-8?B?eEFsSUs4RGp6a2x3YlVsOVlYVmpJOTNJV3NIalJYdXhLZUZJYzBjMFlSbVQ5?=
 =?utf-8?B?OFR5YmI2QUFHZGpSRUZKNm82bk5tdVF5VUpWc1JFbkxJOW1kQmFCS202aEx6?=
 =?utf-8?B?cUVrMHp3cHNJOUZqbG4xd3FnQVhPRzRMYnBCM1J4QTdIQWowZVNPM3NreS9q?=
 =?utf-8?B?N2hFVTRkRERqSXI5RmJ5MWtTSXZ4bjN4OFJUVEFBOUFqUFA5VEh2UXFvSmpK?=
 =?utf-8?B?UjQ3QVgxUEs1SHlsQk82UjZlZm9nOEFBckcwc2NHZmptcitQaHRKTTFXdHVh?=
 =?utf-8?B?VUo5S0VveGxPOCtNSHhLL1VrN3FkOU5Yay9rSHBWazRzNS9KTy9ZSHVOZStk?=
 =?utf-8?B?TnZ5MkNWWk15dzRmYzFBeEdkVS9uQ013cFZNRFJMMHFuSUcrL25kQllJamxN?=
 =?utf-8?B?cVZGdlFjKzZvdS9aT1pQQVVmM0tqdGZPaDdZSUgwRkQ0ZkhkRi9LYml2aDhL?=
 =?utf-8?B?VG16UUh2NUJEY1YzWXVPTUdoZFhkSjNYL3FSMlgzMUpWUkJrYXNTeHZmNkdr?=
 =?utf-8?B?eDFLeTlBQ0djdTE3NlQ3REVWSG1KZkxzd3lhWlorTFMzbFlIM2VvRHh3Z3d3?=
 =?utf-8?B?RnRDTmVDQ0hOb0NiazNxVkhIbjhMa2RPUlgwRUJ2RHRiN2FudU80VkUrR2pt?=
 =?utf-8?B?UEZkSFY4VzF4VGRXamQrU3kxTitRTnM5S1h1QWJQbExjdDdPaFBkNGF6akJx?=
 =?utf-8?B?cVNnRE1sZUlyYlRPRWZNWXM2Y0RlZmgvOUUwYnhLa1ZGZm8xR2hrTTJYY2xG?=
 =?utf-8?B?dTloZ0dJQVpiT2RnKzVQMGt0cWxEYW1FNjFQOThyaEJpTFlDb0RuOEljSUxH?=
 =?utf-8?B?QjlJRzlTQTM3aEsxQW83SmlyeUdXSVFadjR2enNKTlljY2loY2RIdHkzQ2tq?=
 =?utf-8?B?WTBaYmpYY1c2Yk9iZ1hwS01Obkc2OEFJTENBZjYzK21jZE02VXVTQ3VDeXRD?=
 =?utf-8?B?R0c2R2NFcllvdzh0Q1gxR3FqQTRWcERWNE9wZjYvaXJoZVJwWk1paTBSM25q?=
 =?utf-8?B?Y0E3VGoyaFgrMXNKR1V5Y1FaTXFRdWtwRE5Ha2p5eFNudmt4M2p0eDY2Ri9K?=
 =?utf-8?B?R3dGV01NYnltVmVRNjZvcUk0VnllMDgwWTgySEdqY3ZaS0NmaXMwTC9YRXht?=
 =?utf-8?B?TjAvYk9sdVQxQjU5Z2tNaWd4bDl6MTRYeCtkVi90MW5iK1BKeVdTU1RDQmFv?=
 =?utf-8?B?ZTJHemlYdDBjV2dYSWtWeWNINDc2bjBCa2U4cENKVm9KejBFVEIxUWVFczFI?=
 =?utf-8?B?Q2ZRQWxaZktyNXoyWCtoMXlMSVd3cjg4NEw1U3MyZmR2djR6a2J4eU9waGl1?=
 =?utf-8?B?ZWVLUkRFaVY1WkxwNXh2a0lxUEJ2NkZZckZmMTNzOUVxQnUzYk9Wbmd1NHkr?=
 =?utf-8?Q?ykSTZIGkzdVfWT+NlLFcOyHPW7LGxy7zX5uDB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d56e38-7415-41d0-b440-08df1a4ae965
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:48:35.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6J3gFJp5uyhaRwtFFn3SSdPHqlhMXqfERThMbRrDcWK6wPrz/V1dnGNjkyi86MQLjzxZ6wrp1AjAjilOJ635dg2pCi6yFevIWGY+RW2NBYvprWL3CH+dg8lkChHWfik4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11377

On Thu, Sep 24, 2026 at 10:35:15AM +0200, Linus Walleij wrote:
> DMA40 has one terminal-count status bit per channel, so cyclic period
> interrupts can coalesce.
>
> Use the memory-side pointer displacement to queue the minimum observable
> number of callbacks. If sampling fails, queue one callback and invalidate
> the saved position; the next successful sample resynchronizes without
> recounting it.
>
> The pointer is modulo the cyclic buffer: a displacement of d periods can
> mean d plus n complete iterations of the buffer. Report d, so the driver
> could have missed n iterations of the buffer; DMA40 has no counter to
> recover them. For an unchanged pointer, report one callback rather than
> risk a spurious full-buffer burst.
>
> This condition has not been seen in practice and is only a product of
> review comments that the buffer can miss interrupts.
>
> The preceding cyclic-residue fix ensures that every cyclic period fits in
> one LLI, so each boundary corresponds to one client callback.
>
> Fixes: 0c842b551063 ("dma40: cyclic xfer support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index eab9c09b4bfe..7384a50cb895 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -384,11 +384,14 @@ struct d40_lli_pool {
>   * @cyclic_dma_addr: Start address of the cyclic buffer.
>   * @cyclic_buf_len: Length of the cyclic buffer.
>   * @cyclic_residue: Last valid cyclic residue sample.
> + * @cyclic_period_len: Length of one cyclic period.
> + * @cyclic_callback_pos: Position after the callbacks already queued.
>   * @txd: DMA engine struct. Used for among other things for communication
>   * during a transfer.
>   * @node: List entry.
>   * @is_in_client_list: true if the client owns this descriptor.
>   * @cyclic: true if this is a cyclic job
> + * @cyclic_callback_pos_valid: Whether cyclic_callback_pos is reliable.
>   *
>   * This descriptor is used for both logical and physical transfers.
>   */
> @@ -405,12 +408,15 @@ struct d40_desc {
>  	dma_addr_t			 cyclic_dma_addr;
>  	size_t				 cyclic_buf_len;
>  	size_t				 cyclic_residue;
> +	size_t				 cyclic_period_len;
> +	size_t				 cyclic_callback_pos;
>
>  	struct dma_async_tx_descriptor	 txd;
>  	struct list_head		 node;
>
>  	bool				 is_in_client_list;
>  	bool				 cyclic;
> +	bool				 cyclic_callback_pos_valid;
>  };
>
>  /**
> @@ -1487,6 +1493,64 @@ static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
>  	return false;
>  }
>
> +static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
> +					       struct d40_desc *d40d)
> +{
> +	size_t current_pos;
> +	size_t offset;
> +	unsigned int periods;
> +
> +	if (!d40d->cyclic_period_len)
> +		return 1;
> +
> +	if (!d40_cyclic_offset(d40c, d40d, &offset)) {
> +		d40d->cyclic_callback_pos_valid = false;
> +		return 1;
> +	}
> +
> +	current_pos = rounddown(offset, d40d->cyclic_period_len);
> +	if (!d40_residue(d40c) && current_pos != offset)
> +		current_pos += d40d->cyclic_period_len;
> +	if (current_pos == d40d->cyclic_buf_len)
> +		current_pos = 0;
> +
> +	if (!d40d->cyclic_callback_pos_valid) {
> +		/*
> +		 * The previous interrupt was reported without a pointer
> +		 * sample. Resynchronize without using the stale position,
> +		 * which would count that callback again.
> +		 */
> +		d40d->cyclic_callback_pos = current_pos;
> +		d40d->cyclic_callback_pos_valid = true;
> +		return 1;
> +	}
> +
> +	/*
> +	 * The pointer wraps with the cyclic buffer, so its displacement is
> +	 * only the minimum number of elapsed periods. Complete buffer laps
> +	 * are not observable.
> +	 */
> +	if (current_pos > d40d->cyclic_callback_pos) {
> +		periods = (current_pos - d40d->cyclic_callback_pos) /
> +			d40d->cyclic_period_len;
> +	} else if (current_pos < d40d->cyclic_callback_pos) {
> +		periods = (d40d->cyclic_buf_len -
> +			d40d->cyclic_callback_pos + current_pos) /
> +			d40d->cyclic_period_len;

typical cyclic buffer can get delta without if branch

delta = (current_pos + d40d->cyclic_buf_len - d40d->cyclic_callback_pos ) % d40d->cyclic_buf_len
periods /= d40d->cyclic_period_len；



> +	} else {
> +		/*
> +		 * The TC status is a single latched bit. An unchanged pointer
> +		 * cannot distinguish a complete lap from a repeated interrupt,
> +		 * so do not amplify it into a buffer's worth of callbacks.
> +		 */
> +		periods = 1;
> +	}

above == case result is  period is 0.

So  if (!period) return 1

Frank
> +
> +	d40d->cyclic_callback_pos = current_pos;
> +
> +	return periods;
> +}
> +
>  static bool d40_tx_is_linked(struct d40_chan *d40c)
>  {
>  	bool is_link;
> @@ -1609,6 +1673,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
>  static void dma_tc_handle(struct d40_chan *d40c)
>  {
>  	struct d40_desc *d40d;
> +	unsigned int callbacks = 1;
>
>  	/* Get first active entry from list */
>  	d40d = d40_first_active_get(d40c);
> @@ -1633,6 +1698,8 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  			if (d40d->lli_current == d40d->lli_len)
>  				d40d->lli_current = 0;
>  		}
> +
> +		callbacks = d40_cyclic_periods_elapsed(d40c, d40d);
>  	} else {
>  		d40_lcla_free_all(d40c, d40d);
>
> @@ -1653,7 +1720,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  		d40_desc_done(d40c, d40d);
>  	}
>
> -	d40c->pending_tx++;
> +	d40c->pending_tx += callbacks;
>  	tasklet_schedule(&d40c->tasklet);
>
>  }
> @@ -2638,6 +2705,9 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
>  		desc->cyclic_dma_addr = buf_addr;
>  		desc->cyclic_buf_len = buf_len;
>  		desc->cyclic_residue = buf_len;
> +		desc->cyclic_period_len = period_len;
> +		desc->cyclic_callback_pos = 0;
> +		desc->cyclic_callback_pos_valid = true;
>  	}
>
>  	kfree(sg);
>
> --
> 2.55.0
>
