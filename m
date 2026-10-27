Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.130.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793129683;
	b=jmgQymhPU4kHOaHj3hOsg6ArqCLzTAgo24DSB60EzTCL99Z+51EW6e3BdV8zeNGpfu5S
	 rY1HvS+IluDZ0i8nIf048CpgVFD4mtQczeEvAcPw2YsmktK9gbi7TgwOFSHzw3KLX0q1y
	 JLFYF3QiulI3NUQpgz+IiLn7TmhEl90yNIQaDvwepctC3qqWMakkICiQp6oRDa1SxDHHG
	 b23sZbUXFDYTHp/OCbUFaqinnrp4ioK1TQHSBdN3/xQOT0SnyXeqMPCYn+WwNtHVUzT8e
	 hLhjMCflHYzedDc4AdetymMGA4SDR87W6pyKUhR8NAPaSrcA3rUnDJYAT5Zh5Z3Gnsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129683;
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
	bh=/78QzbmyNQcgtNpVQfu0yL7/dL85G5mBtAhh/wbW/io=;
	b=rKLdM22pA8yawt6QEP13L8O7TH/VejPBNdYVTchTY6DtQ2oI8e8FcAmj5fUJj4DjMvGk
	 PX98sdudrN39z86pDIMhI7es4NBSK5DV3qnurCdddRAVCg+LW6g4JeMQpe1cq4BEhSXQQ
	 k0yXL8naW6nlozGXYyQxvhkubLydgr4ARqK6ehyLzYNCwsMKlqP3t3CJqbJeW8Vw2+xcQ
	 1nu4gVsTFGYTcHePMl7EhSDykQ+DDuRBfCAG153fqNXczjR4fyA/MphO1Yykxn3CaYI9h
	 Dq4KORvqgvSQ7C9NV5ENQ+ei7JuLKpblLcncvBVLc7Bk1AHtu7Ffpc88H5CClcxYJmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NVeS0DFh;
	arc=fail smtp.remote-ip=40.107.130.51
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56653606A31D
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 19:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56653606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NVeS0DFh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru7Ji3bJvw8Eyx8Fhde7CqYKe9ZubAiVA9Mcsf0XdAeywPwshD+dx4w2sgGVkddf+EFlCsqZwVWs1B4jQ61d8TZWLtW8KVfqVNWbg4wKJGKCZFgG9PB10kspZ2Vn1xB8N9B+k5LNMocHWBmY/iJQrwlmbqNHPH7lFvBqKATiS6EzpFm0V3z7ozsb3oGHpDWQPGlyS6Sau3jzrAt92+P8J1zE1/NDUsmuJdXaIwY55NhE5tDwC1SlRb7GPwAfRc/msx7LIKh0wg58QLK2v/kKMGHB6vCSQY2ywv14RsUbJoonZ/Q2zFWMVlw6s5QMOnp+ASi27NzZbbsoVyKkaioU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAbdJbZyf+XkSJUOG4cZHoXys6YivdFnAAWjxp7YLx8=;
 b=UpKBtxejxG9BjLqgZnJC1SCgg07SHe93FAeXpyndY1zjCg94BW4rg6GvIKukzu9NPhRl9uFZFdE+hsRst7Q+24IKuxkWIX3Gon4l+raNrK+8aix2V+egoOe9XKzu1g9TWKbCBUqGn1MpobiH7JCquU1om04G6vc45PDuEhAdaVd5+toMwQOhVBoKEhwWVZt6enbqTclnDxNxvN0mKBtOAB9HOdkHyqF8o2xvhWZJvcf/uT2zV2zPZIOdS2qPv3Rqbarj6Gs9hv5HgqTmTelgE9mNV80/3lb+BKk8vniD2dQdBd+RgoXLfAHLxdL6Ht5sSw6Kt/4U3Bjd5PVlmQiyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAbdJbZyf+XkSJUOG4cZHoXys6YivdFnAAWjxp7YLx8=;
 b=NVeS0DFhcJllZzCWW3OCZZ23cqFMpZCLBeVc12b1TDcKoWuUJWVLzi6ndUzmOTQrzEC/k1Kptotfmv94CaIbM47DfY+4FvEknYO8LWYjeFVdsxcj+HlJpNDwN5q2UxQwQPRKiV6D3QimgD6CMaoRzkpg4wDz2FZVwefVQSvC/p7HzjOGvhX/zSlymSSsDyqGDVlMddsrmd2gnTC2Cjp2IiJ45A6rGnBU5kJwuSJc4uxieCVKQg/O1yKvsVDLs5HWNUIJKwKQF7dnfPkE6bk5uDxZMTi2yZ8+uZACSDv8cdsVPslFjs9IprqsGPVlVlvfLYjuAy6Y2KTW84+B+4KOXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:34:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:34:38 +0000
Date: Tue, 27 Oct 2026 15:34:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Li Ximo <lixicaicai@gmail.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx: Fix wild pointer dereference on empty
 segment list
Message-ID: <auD8yFdjxcak-RtC@lizhi-Precision-Tower-5810>
References: <20261023065806.3175584-1-lixicaicai@gmail.com>
 <sashiko-outbox-182385@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-182385@kernel.org>
X-ClientProxiedBy: DM6PR06CA0089.namprd06.prod.outlook.com
 (2603:10b6:5:336::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: a9510c63-7af1-431e-7551-08df34615718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|6133799003|22082099003|261026121527099003|18002099003|11063799006|4143699003|261021121427099003|56012099006|10067099003|261009223027099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	WQxJHisDFHJEhxU5lMAerTTBbpCbqwtXrgttM3ln73TX18T2RjcLgvq3FDww3MewfXCwOEXUgvPOPmSaYAb5n1iwTApgv6fGJQ7gtQZFkHEZaXkt+p1lToFa0Fb1SS/eds5sSuhnARc1gdUr9Q3wbVOpT87WAGCSClYQGsahw9RAnLeVx4KwxVFbSEeRAO4pT6eHno+LqnrHEiEDpRtBAHPcHOYG7BnUf270N9SY+9tKMcpdoyudOoU2wGJX8qKIlPOrRaQVIuanFuU/C28EftW74az5gFgLjR6PhHmnNWFwL3iDU65GKZqh2BEKF5NFPuUbF1vDOcfBwmTG8pQDZQn6coLOuQdtQV81l1pkBIFWvfvxpPgNYuDwnJRjkY/YO2op3nwjHyL5+TLm/DnCqAXHz6IrWbUBUqQQyVZ8xHgUEp3sb3p9p39GGEeYZQuVirRfjZQhw3JplQ+rTWQ+wdjPdYn2iI2RJcCKp8oak7mz62o11BudmOXkK3ph67GwPtz34g+8hHW2dC3Wwl3TI2QPZbQ9Pf+s0+PzZd6eN3lFq3I9zEk+brRplob4IhcIHBDscYEkQA+37Ffx//a1+kOuPRD9SX1gDjKWDuw3rjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(6133799003)(22082099003)(261026121527099003)(18002099003)(11063799006)(4143699003)(261021121427099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7eO6Y0tVMoiV47qUxs73Jve13FT2Unkl2cCFPdkE3JjBt0NNkeyAydurhb?=
 =?iso-8859-1?Q?SE+gqOweoSEQTIwGUQQNEKBejFLYLdOiKWTtNlK05ywGCoSS9/OYX8GGhx?=
 =?iso-8859-1?Q?RBk1YNrEdrrzVV4nybNGAfyR4OB0BWHYJZilZ3P+8MNaiVlBj7Be7JbufR?=
 =?iso-8859-1?Q?Rdc3+Q3sJDNtNadXngn8Q1XQ2vVNAfAsS2+Pok4d3jMsUJvvCpa9GQS5uR?=
 =?iso-8859-1?Q?3g6qQEI2pUia10d1GnQd/15xn6oijWtdaTO8k6Yxy4p0OQKH1POL02B1Zv?=
 =?iso-8859-1?Q?tSfuGBqf9mcVrgAiya0/LQYshQvUxbFIcyasX3mVrgssrd670UAiwuV7XC?=
 =?iso-8859-1?Q?u8iKqCMXDTOD/W6hMhE/tjgzXWWSRyTEe2aaciLleioKAmQjEC9UoGiAq6?=
 =?iso-8859-1?Q?d0T9Vt90WQvMSPf351PrmOtp8n9ZuSGMi3FrbRHGoZLtzDawgk2kGR2XTM?=
 =?iso-8859-1?Q?wJf4XuNn1k6gOdoCI0md1cCQD8Te8ZjR3aDeNdnYEm3e9YI/zZrSKZiYwW?=
 =?iso-8859-1?Q?CqAm0h37sesTb+jTwwxQ97gNEWJIuHGd07CQvQ7j56Bu6bqpuQ4trBZBXG?=
 =?iso-8859-1?Q?mHOwQRuJrInP1wLpgBYBiuGy+wCiv9lP9mYDmNOzE3SLOE1y5kMPyTlULz?=
 =?iso-8859-1?Q?Kdjk1abu3YRPVKcLUOIWukiZHnKUlXajawvyt64gThOXA3yvk3YuXXAYza?=
 =?iso-8859-1?Q?zcOSGj2n3a7wvcNsEySxGR2SdcwXj1PkPo9O6G1BC3lofjedAhIpHyH4BO?=
 =?iso-8859-1?Q?wJz+D+xzzhr2X+f1jiwZe2rvuqObEawk7/szV8UnIZB9Ksa9O//9aOPCJK?=
 =?iso-8859-1?Q?V6GS/rsyxMF5kAZnA/OJY7ZvHnrI1s6DfjkRJWP+1SusANDF5jUdp5Rinb?=
 =?iso-8859-1?Q?cqVVaKfsI3ShYVek7RuHLBorfY4Sn1RkEK3fbiaOQqaDK3yXVFTQxAoYXt?=
 =?iso-8859-1?Q?fEbnSgktJ76Tx0SWVQPZXmSjcgagVNryFuF47OeDOxmVtCzK61lj8H1Qj2?=
 =?iso-8859-1?Q?sGzY66uEjDI0qx2Ky26lWjP8LRAKcLHQciyxAlkrDd2D8PB3Ts/tiE65VT?=
 =?iso-8859-1?Q?AeJHT6QlueINYi+ePYlrIRaEoxVqiwphphOGsLfHxfGiHA59fbQTQUYnMF?=
 =?iso-8859-1?Q?CUk4RNs6+NU6wSIZN0Ra+i17Ju7S42fxCeOKO4iGK7NgkWBdzHSM9z8sgm?=
 =?iso-8859-1?Q?rk4wPi+fbGmC8feG7KypUSMMASvYzVyt0wPX3BQjYE7FdV1LuHtRqIZMoZ?=
 =?iso-8859-1?Q?41ftJHVwufWZjEjStTwi4YlDDIkMjYkgbaHp2nPubWfr1UwsX/8KyA3yDV?=
 =?iso-8859-1?Q?PBBXfFWjmQqHB+el9sMtJ+AgA/reMHptdNOEnBa8Tx61mvMFY4LC91WdlH?=
 =?iso-8859-1?Q?2rrBOq+MpAYRfWpVVBcQSEs01xMKr6CZ9t+1cBvnBJHdS9sivsDgjHtXsF?=
 =?iso-8859-1?Q?7lkI48O9pbZB1L3yugLrDBOEp/udGhnA7ycVdfi6ng1Vpyty0gkKGPvwoP?=
 =?iso-8859-1?Q?mgCnk1tM8Jx5tbEVkJMtWBV0YJBhEMnjWBm7w7h3Sd13xwdvCOsG/p1Aga?=
 =?iso-8859-1?Q?u1C6YOyztq9YRDzXbYKMnSH04oWaSLKIcwh5/OdkV2P/7mYHTWrapQQQNZ?=
 =?iso-8859-1?Q?szECi99EZJJHI2NE1N95R8EHkjCoGvzwtDj/mkLe8G8VxhV4Cwv0cjQ4ap?=
 =?iso-8859-1?Q?bViztQZDWU/6beNId7gspiEFRYt8fCZLPYuwRSFXLyZmMkuv8zIGi16A2W?=
 =?iso-8859-1?Q?Wj27tW7KVFfE8fzTdZZ7dVaHKupLAgsSyOlWtqojSLBr03uQMGwNIKurwC?=
 =?iso-8859-1?Q?XKgKpT7vDiWOCx0QXlTLwAJtjnDGTMBnjLsm9KEy3/PcYs1+NuTB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9510c63-7af1-431e-7551-08df34615718
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:34:38.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAcN3BWMD0PVTHMndmCWAQqg71RmsGGq2JRDH71Y52DAAjC3b4cIdkGxpzKKbnPbldANYZ5dw7nVdPq5CFM7+V1SjN/8pHEwp1OkKFZhSc1y1GfgGyvtjxweCJxD8a5e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

On Fri, Oct 23, 2026 at 07:10:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dmaengine: xilinx: NULL return in xilinx_dma_get_metadata_ptr()
> --
>
> commit 5ff31a1fefdaf467f495be421ba38281e2cbd1a6
> Author: Wang Haoran <haoranwangsec@gmail.com>
>
> dmaengine: xilinx: Fix wild pointer dereference on empty segment list
>
> This commit guards against empty segment lists in the Xilinx DMA prep
> functions and in xilinx_dma_get_metadata_ptr() to avoid dereferencing wild
> pointers from list_first_entry().
>
> > diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> > index cffe7c6fa6405..07f52f8412b10 100644
> > --- a/drivers/dma/xilinx/xilinx_dma.c
> > +++ b/drivers/dma/xilinx/xilinx_dma.c
> > @@ -650,8 +650,11 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
> >  	struct xilinx_axidma_tx_segment *seg;
> >
> >  	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
> > -	seg = list_first_entry(&desc->segments,
> > -			       struct xilinx_axidma_tx_segment, node);
> > +	seg = list_first_entry_or_null(&desc->segments,
> > +				       struct xilinx_axidma_tx_segment, node);
> > +	if (!seg)
> > +		return NULL;
>
> [Severity: High]
> Should xilinx_dma_get_metadata_ptr() return an ERR_PTR() (such as
> ERR_PTR(-EINVAL) or ERR_PTR(-ENODATA)) before modifying *max_len and
> *payload_len when desc->segments is empty, rather than returning NULL?
>
> The caller in drivers/dma/dmaengine.c uses the ERR_PTR() error convention and
> directly returns the result of metadata_ops->get_ptr():
>
> void *dmaengine_desc_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
> 				      size_t *payload_len, size_t *max_len)
> {
> 	int ret;
>
> 	if (!desc)
> 		return ERR_PTR(-EINVAL);
>
> 	ret = desc_check_and_set_metadata_mode(desc, DESC_METADATA_ENGINE);
> 	if (ret)
> 		return ERR_PTR(ret);
>
> 	if (!desc->metadata_ops || !desc->metadata_ops->get_ptr)
> 		return ERR_PTR(-ENOTSUPP);
>
> 	return desc->metadata_ops->get_ptr(desc, payload_len, max_len);
> }
>
> Callers of dmaengine_desc_get_metadata_ptr(), such as axienet_dma_rx_cb() in
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c, check the returned pointer
> with IS_ERR() before dereferencing it:
>
> 	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
> 						       &meta_max_len);
> 	...
> 	if (IS_ERR(app_metadata)) {
> 		if (net_ratelimit())
> 			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
> 		dev_kfree_skb_any(skb);
> 		lp->ndev->stats.rx_dropped++;
> 		goto rx_submit;
> 	}
>
> 	/* TODO: Derive app word index programmatically */
> 	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
>
> Because IS_ERR(NULL) is false, returning NULL when !seg bypasses the caller's
> error check and leads to a NULL pointer dereference, while also mutating
> *max_len and *payload_len on failure.

Make sense, please fix it.

Frank
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261023065806.3175584-1-lixicaicai@gmail.com?part=1
