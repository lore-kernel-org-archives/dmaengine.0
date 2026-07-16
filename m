Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235A39EF2C;
	Thu, 16 Jul 2026 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234967; cv=fail; b=lUGKd+6LzptoCJ+NGO1ZBUvCGB0R3Odfp9SW2ErrvFD4AouRXz7lwlCejf7PiNIy3eCwUTkPnInwwsDLAe8gLYqIXhszVAuPpkBqU40KLP5CpG6ND/l4y6wLBQLf/DnkN3j7Ygtl7XkIr/foq9i8EVT4nKeTgAbDGNUlL4TH4Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234967; c=relaxed/simple;
	bh=DYcEimywC6NEUNi5gUi9D4lFl5S+RPcSZSdNOVMcFf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C0zVhH8N+sEu/bFSGqwqYlU1ToBnzhrrioG0+c/4wmq5DbhKRZL7xDhtoB7Clze1/Yhr52o5Lqq/W1Q2XR6DBquFN4LJp1WFkeOm4GQ2lpcKV4rqH943BXyZN2ejdtXy5IAGtcI0LzgEKBZHnLG5RNYwBVfGCyGXZVjZtn+o1KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CFEwIFjU; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CFEwIFjU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeqSunzUhvtiiaDO7Pfy4AVI6QxtpmpVnlf40CN1oD6+ZqMoTQ0ZWs3YwQnNXKWfEIQTNEJyzg4OwnAPsCBb0oITW9ZihsYjhh9aT14vRtygVlLTmHxUKfr2snOVlwqpNQbXswVkAmPGGQqrXYJhElkVo4hdR7YoY0OIEap3CENFeMWCbNZuREQllC7WdujwrCPBFJyKtUXMpbESO9Hcpw1ci26V54IWAukpNFKJnjYKV10L6fsRCaIu97kx8Z0CT71OWQmV/OWT68En0Bd5jCxsq4Jcwbym56LiAdgbK+7SWiaYyzN1oFOJCIDzTWCrXZDH7ST1kEZsu8hz6ridhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cD7drh5q9qzD5bZKp1D3fDqYajQMzoW1RjirjCwJXR4=;
 b=vR61US3TsKLZsCsqweD5At3yezDFj9h/F5kCDzrUV2YnGc7DsP9rzWDiDzqBsAHzMxeV9t3aw/PHAdi0sJwl+N8crtPcq4sN8h3CrUkw6zK0a3wcvFTPhLhGY8wTo8HVdZsl5oiDFL6NQZdC6FM49BUilVwSByhhvDFP1Fy0byt7/KFFSdGvtnYqLSIvSbb9qIeWEmiSoImeHeZ/xcjRlnJLsvcatEj+7gN5B3Fmr3YOYgUs5ANNe3HPc/1jRWPvPtaGnGbHN8bXw5mjGCTBJdk+aujn3TkAmCHZwOULuhnlShZ7n3OO1NgkQH4DmgiAAkhkYGuxMue2d15cqOxeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD7drh5q9qzD5bZKp1D3fDqYajQMzoW1RjirjCwJXR4=;
 b=CFEwIFjUNKNx3oB1qBZyRIqztMUA94DRUTfHRABWcZZeNh2TMd4IC4bJk6PN16YPoOUtDM/x87eQTiymQXID3fw2FBrfPUF/NwsHmkGFRSsDSZqJKUvgRQ7HKrwAZ8VaMSdkoAblZk34eBEisHgkWzrXEntk/I2S83jrehJ6dFgfdJ3LV7oMNUkyq69ZGMC2Rou159On5RwbRDbMlfSzHBT8UCNCtOth1k07xY74Hid/XYMP4Um8WMiW/XnfhHnh/hfhtwQ0upEGWte6LeGMuQGD65KRoeGLVPIcrzZn5tAB6JraKDjpk2ulUYlpagKx0YokMI5kY272sgw2OaWn2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11195.eurprd04.prod.outlook.com (2603:10a6:800:291::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 20:49:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 20:49:22 +0000
Date: Thu, 16 Jul 2026 15:49:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 1/4] dma: fsl_raid: convert descriptor stores to
 big-endian
Message-ID: <allDzCDamp255Ea0@SMW015318>
References: <20260716202949.677290-1-rosenp@gmail.com>
 <20260716202949.677290-2-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716202949.677290-2-rosenp@gmail.com>
X-ClientProxiedBy: SA9PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:806:27::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11195:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8ba213-273c-4f82-0081-08dee37bb6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U8iDNgIap1Dai3opiEuYwQt7U1qDwDUQZv9jokIdR8tytey8yxQriaz4UWx1GsN1xU6bWcT6kA3FngwGDq3GNN6oUtof9pjh5bmFJMgPViZE1srb/EjRfwj8QLzulL/MjgHfFa2rIazLLrcTdKlI4nCtZpokn4pxgHwu/Ch+powJQPuPViPRKaHUscKCCQKMtpM+7n2Hk5X8M7rOe60URO8uleFhykZ32cG0mXWIhcuX1wOfL1KVbS57Zk79EOH00mTduL558OiRRIvGt9oT2R3DIVmPybQIN8XpH31kdhG347QYKLE3yhtu4tt22wGhYE1NGdy9OogoVwun/C8BXGnLGllDFLL8CtBpQdonTlphzz0vCYaUo2f4lGcqSp5RiXKeY/DrEEi7BzaHyWd1BZygo0ysh4NUXITDBAq7LeJn5jqFGT/GQqiUvsfLr1aCIVKICuopTK+RNMLl0TDpi0l6ng4vqP97a7npCFtq6P3ip+1skOtX945HdzGNEqyM8dqfJhmNYJu/YpuPgGxui3h8uc4iy0tnSm6QNNFqsQSNTICz7NDylH4bqWqi/9vfNzktqDLV2LII1UzerntCT5g9vwH9m2MNPCtwXdefj5qM4JwfBgaxb+IbAOneH17gnV14EYUOo6LyoS+PARn330Bv7Hhb4GTjFhrkepo6dAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?49np4rrw0E9VCgCb5qEkI52gdxnBPIYMaVQm8pGSrxYXGLIOfJg964V9R5cw?=
 =?us-ascii?Q?YByYtqfBoKu+4eTFbpFLBL4hdL1+9fnquzRRHdnzjX2XA9S6lCT8+vhSw/On?=
 =?us-ascii?Q?b/KR843U8NWwwQLRtAyDBeGMRVcsyIipdAmfwwx/jyKOjJFdB5raRY+VlqR2?=
 =?us-ascii?Q?MqH6kBPmElsqNi4arv6f4BwVhf525JUSkkxHpb/xYrrqk11lR+5ye7F1Dv34?=
 =?us-ascii?Q?f+3K0QjTnx4lxZ1cVwbzh7dshU4LpoVSYv1NG9RB2FacOy94nSNcpYzApEwZ?=
 =?us-ascii?Q?9awEEzuFD9Qfa3SD1nwpOMhMlnyFexISm9kYOA/pZGSDfsaDRAT3Bl9gTP4J?=
 =?us-ascii?Q?Xd1uLGCUHMNJZl8sNejf9c7yYqkWyFAfXdCX6wHwhYt3P+CGpzGcb8MxBZS8?=
 =?us-ascii?Q?cDK0Oi5pL2xOZJiUSoFgLqGnOQsOUBN+hGsa7kFlI7Z/6ICalp31wjNsLcUj?=
 =?us-ascii?Q?78ExdKm0mfUNlvtxIKcKHqEYfCyhe1ZGb1KYJfLhkKhm8XNoppsxb3Rdsfi3?=
 =?us-ascii?Q?SbFRdfIFSzWdL66IvmCBk7Vfj/Ouzru64rP98y1Hi8x9poqx31uJWvOt3tj/?=
 =?us-ascii?Q?OZCVc9qUq53qtAeWu1fnDo4ibRtYZomTIRgGSrUmOmhZ+waV2WZGtZNtuAED?=
 =?us-ascii?Q?TfbUGn8ubwApNJraRxfF7LYWdIqvULpkxKfoTwwg7HpIx5DzZyc+6Ec58Teo?=
 =?us-ascii?Q?xEGycBWUwxyEqQ/46mKk2sE0waWKIC1GWgDGFVwvxk+FX7tESryI8j8zeMV5?=
 =?us-ascii?Q?NDQkqt+PzLT4jz3QkM6q/I9ThLFvPd3BubGfkH689+dGIf3jgVuocGqdxRMF?=
 =?us-ascii?Q?/uv/7UTJOqIT8VbGxBKxapLyuIO9TKBYyA1EVHfmpyFudSCi5xdb8KEepuSw?=
 =?us-ascii?Q?6Uq+mndNbZYOpgRRYDmOk+UTUd4Ta9Jlz3HJSzQQfHSYWAB9oZFPm03p/PgF?=
 =?us-ascii?Q?VQFBX35UUBeT/5szVum902DCgSW4oenYrlcQrYUc4UbSymry5c+rpIjKpW7b?=
 =?us-ascii?Q?gfYhT+qbPSbBpvdh3PL91gn6sZP/PrsNNVgGylfqV/G2eaGbXejmC3bCz3EI?=
 =?us-ascii?Q?G0gtwz3UyajwtsMm/bHv2IarCF37QXgPRpPoPZEnkOhNtan3bh7PLNZOnILB?=
 =?us-ascii?Q?2qXiiH9XKPvw0LskbNJsKtKEzh9ITanVu9po/6a0JyUvZPyit9q6Yd0cpmUv?=
 =?us-ascii?Q?FA8FxCLqQeTsvD/Db7Sgk28WAHHYqQe0w6v629vumQEJwu4v4x6o0y5lngiN?=
 =?us-ascii?Q?OqtAgb+neBbbRFBLpKWK/69kppQwyleKuBPowXarIcpxNEEJd2F6PzQrDPvm?=
 =?us-ascii?Q?znxD7m/diey6mmPuqAuZRMePU4C3/A7Il8ElO4FsV7YmUmPi/CH0I0eqV+0O?=
 =?us-ascii?Q?hB3Kv5jMpD2NzZpR/oAn6mz8T/U1sDjyNaooa18SMGohc6igK9im2qcGZSw5?=
 =?us-ascii?Q?6Rpi5Q7dWlhVrBgRP6hVx8L8eaxQb2JPk8tddNSpeMcEqGXzkG2OjejwYYJj?=
 =?us-ascii?Q?fZ2zEieoXbHK1lrUX7b7qbujp0AqQFB6r56gEOWDSMKExFNclYU9jhVQHsDJ?=
 =?us-ascii?Q?7SZbxCI3Ixi5eP+0QVOU/znTTfAUtlZnobaESyRUMEVPjAADDOx+A+DIWRnC?=
 =?us-ascii?Q?dnA/pGH5I59QO6LT+54F0SXM7iznbRZqqOPrHg55js1uAJ+nTraXsxh8puWJ?=
 =?us-ascii?Q?0aUQZ8Xew83y9mYneJwE92H+242tRGOhB+IzmxMIWEcCi0iM9p9VTvgRlthD?=
 =?us-ascii?Q?EF/GWYqs3rfalbOE7GT9w4bzUSst3Hy+W+2AAvZ5GxtMTl0qoM8L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8ba213-273c-4f82-0081-08dee37bb6c8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 20:49:22.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+wiA9p2mV6i2zcixxlzY1FDIr9ETGeqF3uEEUt2zIhTvmj7YEJRI83NmGVslVPQAPmkr/QMhyuyNAS49vGkxTxc2Y2vhmHE9lV1O5oPoSzln4NWrSnYSNAmbK072khG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11195

On Thu, Jul 16, 2026 at 01:29:46PM -0700, Rosen Penev wrote:
> The descriptor structs (fsl_re_cmpnd_frame / fsl_re_hw_desc) are
> in-memory but their fields are __be32, because the structures are handed
> to the device as big-endian. The driver stored CPU-endian u32 values
> into them directly, which is both wrong (the engine would see
> byte-swapped lengths/addresses) and flagged by sparse as a base-type
> mismatch.
>
> Wrap those stores in cpu_to_be32() so the values are little->big
> converted.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@intel.com/
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5..2778d07a05e8 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -242,9 +242,9 @@ static void fill_cfd_frame(struct fsl_re_cmpnd_frame *cf, u8 index,
>  	u32 efrl = length & FSL_RE_CF_LENGTH_MASK;
>
>  	efrl |= final << FSL_RE_CF_FINAL_SHIFT;
> -	cf[index].efrl32 = efrl;
> -	cf[index].addr_high = upper_32_bits(addr);
> -	cf[index].addr_low = lower_32_bits(addr);
> +	cf[index].efrl32 = cpu_to_be32(efrl);
> +	cf[index].addr_high = cpu_to_be32(upper_32_bits(addr));
> +	cf[index].addr_low = cpu_to_be32(lower_32_bits(addr));
>  }
>
>  static struct fsl_re_desc *fsl_re_init_desc(struct fsl_re_chan *re_chan,
> @@ -256,9 +256,10 @@ static struct fsl_re_desc *fsl_re_init_desc(struct fsl_re_chan *re_chan,
>  	dma_async_tx_descriptor_init(&desc->async_tx, &re_chan->chan);
>  	INIT_LIST_HEAD(&desc->node);
>
> -	desc->hwdesc.fmt32 = FSL_RE_FRAME_FORMAT << FSL_RE_HWDESC_FMT_SHIFT;
> -	desc->hwdesc.lbea32 = upper_32_bits(paddr);
> -	desc->hwdesc.addr_low = lower_32_bits(paddr);
> +	desc->hwdesc.fmt32 = cpu_to_be32(FSL_RE_FRAME_FORMAT <<
> +					  FSL_RE_HWDESC_FMT_SHIFT);
> +	desc->hwdesc.lbea32 = cpu_to_be32(upper_32_bits(paddr));
> +	desc->hwdesc.addr_low = cpu_to_be32(lower_32_bits(paddr));
>  	desc->cf_addr = cf;
>  	desc->cf_paddr = paddr;
>
> --
> 2.55.0
>
