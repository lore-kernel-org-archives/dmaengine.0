Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D724BD373;
	Tue, 13 Oct 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902755; cv=fail; b=ogP0JjQRWXU01uK47KjOX8EgNon9iysDOlso72ZMhcXAaEqUN/OzXOghwh+WRIX+HoeBLex4MV2fqFoS7aW3huxLcF6ZyH3SGyi7B8qy858/xat5TJnxHdONaU+WXV2/fiYSHjkOahbth5Iix6k5yG43iZpqayAMH/iZcCyrx6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902755; c=relaxed/simple;
	bh=1YRbqz9f5wUAbfNZ+1FyQ8nR8+FYTZqyq9PYVoP9PtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M1WyjpXMvqni+TyFDvYVfcCMiSq2L1u2hOCBaa4VFohrQaEBHOqGnpPtwZImyc1FPXz1GtBLItQVLD6/1YRAcqVNMNdf32KV2o7xm3vhKmU1Oxf49tzl2kCBMxFjhGqrbF8nPvFvSLuZ3m6hALIVG+QYcUmvl8KJ2KXlgiMyb8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NIIxD5E9; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NIIxD5E9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6UeI5Qj3U/1yFpTVqJQJJI241KldgxRRDtuY0tsm8SU+fIhOBfa9Kzm+rXPuAkh2/o9l7vWt6xVdMk/fjhttP8RdddfUQ7nICCQszHQNPS7VS2tVKUIQCQFGyGAH8BreRB2Lk7nXJi7Ze064X0Qi3xD3NP5YWp+tx5nxHgiHySBPkRFXVeHl05AsdPmfz026S8qjRUkk8n4T9L8X2fy8soIMUd2hZ9Ej0yJEujQm9o2ph5UTQwsGvbNnxmwvPu4lOGqlXrYa69clhuxdsVPTz8vV6gIFAY+5V6wx3kEjnc5p/MidltjojvIwi8MrxdNg8M+rSpWqyolH1coYk0+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LfXnhpl2ZWP8MUFSRZrEAbyPw0AhQF70pu820ogmXc=;
 b=IkDAXoGYdoETA8U9AXhPc2gN/ykDnWS91J6EPioEMYoX8e803qvePmysy/uyPnxJBYsAkPRhT+uc4BTaveafUIBVqg6bTWZ9BOcIRWNAoqJsj195zDHko8BcP03eRK9o/jRaUXbx1GsbR/5CFqHvGckIhxjzBk+D7vX9NV53ITuKkG4rTkfSuwrmqhG/qx/bFKqQlhL2w3TVfBHnpkb9ysSHvkyP2DgsQUzCN5AheFGrVgxKPahp7he3JtblO1P2m9sEw2DioLU+DVb/R+er5wPNjXekv45bIhxa/0kk5HVhCwbVomrvD64eDZguvGe8TDL6n84oVXGZsyFGWuxPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LfXnhpl2ZWP8MUFSRZrEAbyPw0AhQF70pu820ogmXc=;
 b=NIIxD5E9C8mK9x2knLmoNoc7qiipQZVcPLmF6kUuf0yskwywN7oUuTC0FyQdAvC/y0v8/Zr3FoA3+dztR3bgojlsJ9RIUqf/XSw8EWy4MmVB3nFqA5+IpVoMQb+lQ3fEm7P3GRDoY+9mII6SRdFFSE1AsUw/RKD9bY6s5H78FDg6KmtbUMzf45LObKgb9Y9kycj1ILsTP25wHo1ZVXUxfi31mkQjdM/V/2kzqhZNdPh+bGlOiS7N+OzhdnEv8QKbKpYD7aDGsnxHDN3ZX78GBM836P/YA+MK/oGXnqB5S6rWcLbunicck6AN15PAxtTFF8oSOPseMqa4520GC4sNLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7011.eurprd04.prod.outlook.com (2603:10a6:208:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:45:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:45:49 +0000
Date: Tue, 13 Oct 2026 09:45:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rui Wang <wr574332525@163.com>
Cc: vkoul@kernel.org, Eugeniy.Paltsev@synopsys.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Message-ID: <as5ED5zr6jhwJVxh@SMW015318>
References: <20260928035133.2046-1-wr574332525@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928035133.2046-1-wr574332525@163.com>
X-ClientProxiedBy: PH7PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:510:174::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: c24d71fc-55ae-4db6-f852-08df2938abe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|56012099006|11063799006|5023799004|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	clf4BMQePSOp2DyO6/VAGBLYbCJPPITQDzh9doUVNIaHo4v+lP5lKjz+CSJ0sdt1OHcCgOT9Wyb1FoWowd8UtLnMAR4CmfOO3M3Lf6E6X9+VJBdEI54rsHcM2t81Nd9UPZZz/ve33H933wTyW2/DL/hWE0RZZJ12mvz8gOsfxpyd9I+GrnZZk+dxy8pLsDcQqVJPaLHjCDvDQxGZXg1HXPNXQsaA+iY95RFnHCXZf0IKeoi00jpu7xFrEB++yUCHzBviTG7I11Bi4gBLMaBlnHsABCe7up1MYvC3qUEX4KO65OJT8X1ibyQ48JMbGe1TcDO5BQRqA2Rd/sKwwRC1Y0pDXd3AvBzQtKvEjIlL/lq+BiwM6e56igi9I96cAD7wVRFeO5iiw5bDjg4a1NEI/B0QQsh0Xr0FBv1kLrm8wWJhOz+OOLmlIRPpMEoY5ZxuzuzqF4EZBe9soZv4PVcNK2+bC+JfGKOe/J4WDkBrK2DvoYgh4P3S0IuZoIriQOfd/to1ydl8nuQHGYxHrm+VumebSgpdbRApqDcJPZ10p8KpQOm6zqV/DCh61G7hTSHpfLUxTF/WYaUPzW1c/7fSsmTqvE0fVwM+7MhqfPzkQFvIP3ZMlbbV5Iy402On7nZl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xhVODZYU96d4y2dTmSHebw8oirBhEElGMP22lBKCagABd9b958veCst5Xbrn?=
 =?us-ascii?Q?IOD+7kLNtpZe6fIDZqbXbz/VABZqJKSGAn73YepU9BAJ2FQOufqYSxWZPAOx?=
 =?us-ascii?Q?4qHuVIFWhrPHA2tby3uIJhlkwjJswuP9EHKs8dkvtmdGXbDbbHqX3DV2zRuJ?=
 =?us-ascii?Q?pgB8H7GfEiptl9NMZsVA8DKXOhbbZESQ0F5EBBJlIWxMUPrc8iZ0ALLv2Dkn?=
 =?us-ascii?Q?HxgQinNTyXIM+Q8NB33WvkGYPLGyE2/9zMsFzCAnf4N6WlDQ8HC61rG/AVRG?=
 =?us-ascii?Q?fklTYWF9UsNRWYfRD4RMn7sOc7xTWFiZR1aks3HdT8PyKRuUzNIx92/ar+84?=
 =?us-ascii?Q?PwtwBqkupd/GdOvqkJgEvrHe6LJselUQVvpC7FhBkHl5SsbsAa9DFCat3O23?=
 =?us-ascii?Q?NbkHXgbKCfCwwnkrjibIb7pvsIctg3H5HNFg9ZxVJOsa+uzEYSmRiBUgZAvw?=
 =?us-ascii?Q?natu6rkEkwn6fpnFU1kTnoa4uR6xWKGgufWmK5rKs+PTrmLcWKUAiBsyuhfj?=
 =?us-ascii?Q?HuWPwgnpbASGe5lqdyhmvlvxjgHYtJ0Um0f955hQhRDgrLFrZNUe2IhcB5A7?=
 =?us-ascii?Q?TobkD2+mH4Yx2bG9jX26neZjzJKGdBmffUL5UEYREIW7eOXHv5GdVv7ip4RT?=
 =?us-ascii?Q?A4zIPISotr4FD/25yNpesCAzSdl69KosEoKnN7ToZHRZqyL/5TJPhGc5VLR4?=
 =?us-ascii?Q?HjNDAPSpHrFVNee56CnWIjHPJCOsinZ4cBQetHklviSI5irziNjcafa9wjVV?=
 =?us-ascii?Q?a7k/kDsIUsPTGQtB/DUIfcVF4mHBcuAyP3QNwBel1AHMtq+iP1U/LY+YtOkc?=
 =?us-ascii?Q?V6hZsZ8MFeZ8DJSf/s0qesFAwaNZZ/WYcqOJuEjHNqyGvpqxl28pkVe8qN3h?=
 =?us-ascii?Q?+Uson3HQ5k1P6CYECVDSHTabWdMWyajLEffldBsUXJC9ledYkQhFexSD+4M1?=
 =?us-ascii?Q?NYYCx1tCDuuV3s9DL1ZmefVezl//zNuy3mLfe7lKaqj+mDYL735BjFseGfsC?=
 =?us-ascii?Q?GJW7TofdxYWoDvMXWMtQD6DbiGFRDhJhw8Z0/4iaDgoDm/hUMgpaU/X1DcyC?=
 =?us-ascii?Q?IJnLU9Ytzz+P9WDXRAxE0xs7zZSyWglxxjFQib2Qhf9oe6v6fU8CUNoCajuJ?=
 =?us-ascii?Q?ojF4R1xxsS5u/DHrTXQ/dwNoztoJuycDKlc371qPDOhUiuwNPKkQjiUPf5et?=
 =?us-ascii?Q?tz6yeDTVexVXvL8Cv4buoFwWlzfemgHnPvAM+H0Op8esWtpkNSmr7k7klCT4?=
 =?us-ascii?Q?9If9M1/Za6VkxR1y3WTXrjhoq73rv6Mp61uOWRWXoxAp5kW+KbZsiSlX4TdE?=
 =?us-ascii?Q?cbYTiVulhW6ynuDGCjJJy4Y9q9saJ6CwvIbHAo3Q+ALkEAV+pIZqHoxIeB86?=
 =?us-ascii?Q?Wv941KVZ2Gu326jmVhCQnVBlg1oYschutSSzJCRYVLRrJAcu3wEXNBytDoxh?=
 =?us-ascii?Q?6Av14JmO7VxO5reuKLTeFoZ6AoALszCc54StI9LipSK2bbGEMJRf4f/OvRYs?=
 =?us-ascii?Q?DJVptNM+0J7kp5o3T6A8vRmuEV5DjT69GMH0s0hwZoF7wv+a3SUUW97EyJGb?=
 =?us-ascii?Q?1R9DYdXAKYA9ZQjpG5lXoENUGK4NF/mW7zdjIyIAHOTkGgTGgILJySQXFAKS?=
 =?us-ascii?Q?WPlEFNxBZwgqfbvj/WNRGHsWA5HA2VcB2CkxIxWB+ztuHFxRvXOxJ15as5B0?=
 =?us-ascii?Q?ciLMbhBpbLa7mwI/rgA7Gpp2WC79s086JJ3tkLKKLXXxIxqT/TjdjRmnygNm?=
 =?us-ascii?Q?rb6M/Qe6JVBkCoD09bLlaq9R6981IYleUEKGApnU8sihpI8u07+2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24d71fc-55ae-4db6-f852-08df2938abe7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:45:49.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTdFMSTAnTX2Gbfh6u/eZpizPt7K/NmwpSrWJXvnF/lajcVusfkgz4Ke9yOwgIsll3Zo2gCpxEPCMWT2KIAgE4Q3lJvueGKzadtIbxILdDboum4BP75C2/luDm4XwFnZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7011

On Mon, Sep 28, 2026 at 11:51:33AM +0800, Rui Wang wrote:
> The driver implements device_pause/device_resume, but device_tx_status
> keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
> tell a paused channel apart from a running one. Report DMA_PAUSED when
> the channel is paused and the cookie is still in flight, including for
> callers that pass a NULL dma_tx_state, and clear the stale is_paused
> flag in dma_chan_terminate_all(), which disables the channel and thus
> implicitly cancels the paused state.
>
> Also, the residue of an in-flight transfer is currently derived from
> the number of completed LLI blocks, so it only advances in block-size
> steps and stays stale for the duration of a large block. Read the
> current hardware pointer (CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR
> for DEV_TO_MEM) and walk the descriptor's LLIs to compute how many
> bytes have actually been transferred. The 64-bit pointer is sampled
> with a tearing-safe double read, as the transfer may be running
> concurrently. The pointer is only consulted for the descriptor most
> recently programmed into the hardware, tracked in the previously
> unused chan->desc field; any other descriptor has not been started yet
> and keeps reporting its full length. When the transfer has just
> completed but the descriptor has not been reaped yet, the pointer sits
> at the end of the last block and the residue naturally reads as 0. The
> pointer registers are pre-loaded with the first block's addresses when
> the channel is programmed, so a stale pointer left by a previous
> transfer (e.g. when its buffer is reused) can never be observed before
> the first LLI fetch completes. Cyclic descriptors keep the
> block-granular accounting.
>
> Tested on an FPGA platform.
>
> Signed-off-by: Rui Wang <wr574332525@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v6:
> - Pre-load CH_SAR/CH_DAR with the first block's addresses when
>   programming the channel, so a stale pointer from a previous transfer
>   can never be observed before the first LLI fetch, even if its buffer
>   is reused for the new one (discussed with Frank Li).
> - Link to v5: https://lore.kernel.org/dmaengine/20260924025739.844-1-wr574332525@163.com/
> Changes in v5 (thanks to Frank Li's review):
> - Rewrite the tearing-safe register read as a do/while loop.
> - Drop the "never report full completion while the channel is enabled"
>   clamp: chan->desc matching already keeps never-started descriptors
>   away from the stale pointer, and the residual stale-read window is
>   bounded by the first LLI fetch after channel enable.
> - Use min() instead of min_t().
> - Link to v4: https://lore.kernel.org/dmaengine/20260923060045.5571-1-wr574332525@163.com/
> Changes in v4:
> - Track which descriptor the hardware pointer registers belong to via
>   the (previously unused) chan->desc field instead of testing the head
>   of desc_issued: a queued-but-never-started descriptor must not be
>   matched against the stale pointer left by a previous transfer, which
>   could otherwise falsely report full completion when its buffer is
>   reused.
> - Clear chan->desc when its descriptor is reaped or the channel is
>   terminated.
> - Link to v3: https://lore.kernel.org/dmaengine/20260923044104.3234-1-wr574332525@163.com/
> Changes in v3:
> - Report DMA_PAUSED also to callers passing a NULL dma_tx_state.
> - Never report full completion while the channel enable bit is still
>   set, so a stale pointer (e.g. a new transfer reusing the buffer of a
>   just-finished one) is not mistaken for completion.
> - Link to v2: https://lore.kernel.org/dmaengine/20260923034653.1413-1-wr574332525@163.com/
> Changes in v2:
> - Sample the 64-bit SAR/DAR with a tearing-safe double read instead of
>   lo_hi_readq(), avoiding a torn pointer when the low half wraps.
> - Read the hardware pointer for the in-flight descriptor even after the
>   hardware has just completed it (channel enable self-cleared, IRQ not
>   yet handled), so the residue reads 0 instead of jumping back to the
>   full length.
> - Link to v1: https://lore.kernel.org/dmaengine/20260923030201.859-1-wr574332525@163.com/
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 113 ++++++++++++++++--
>  1 file changed, 105 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474..0fa97b83b 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -352,33 +352,110 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
>  	axi_desc_put(vd_to_axi_desc(vdesc));
>  }
>
> +/*
> + * Read a 64-bit channel address register while the transfer may be
> + * running. The two 32-bit halves cannot be read atomically on all
> + * platforms, so sample the high half before and after the low half
> + * and retry if it moved (the low half wrapped in between).
> + */
> +static u64 axi_chan_readq(struct axi_dma_chan *chan, u32 reg)
> +{
> +	u32 hi, lo, hi2;
> +
> +	do {
> +		hi = readl(chan->chan_regs + reg + 4);
> +		lo = readl(chan->chan_regs + reg);
> +		hi2 = readl(chan->chan_regs + reg + 4);
> +	} while (unlikely(hi != hi2));
> +
> +	return (u64)hi << 32 | lo;
> +}
> +
> +/*
> + * Return the number of bytes already transferred by the descriptor
> + * currently on the hardware (running, paused or just completed), based
> + * on the current read or write position: CH_SAR for MEM_TO_DEV and
> + * MEM_TO_MEM, CH_DAR for DEV_TO_MEM. Must be called with vc.lock held.
> + */
> +static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
> +				struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_hw_desc *hw_desc;
> +	bool dst = chan->direction == DMA_DEV_TO_MEM;
> +	u64 pos, start;
> +	u32 xferred = 0;
> +	int i;
> +
> +	pos = axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
> +
> +	for (i = 0; i < desc->nr_hw_descs; i++) {
> +		hw_desc = &desc->hw_desc[i];
> +		start = le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
> +
> +		/* Current position is inside this block: partial progress */
> +		if (pos >= start && pos <= start + hw_desc->len)
> +			return xferred + (u32)(pos - start);
> +
> +		xferred += hw_desc->len;
> +	}
> +
> +	/* Position doesn't match any block, be conservative */
> +	return 0;
> +}
> +
>  static enum dma_status
>  dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
>  		   struct dma_tx_state *txstate)
>  {
>  	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
>  	struct virt_dma_desc *vdesc;
> +	struct axi_dma_desc *desc;
>  	enum dma_status status;
>  	u32 completed_length;
>  	unsigned long flags;
> -	u32 completed_blocks;
>  	size_t bytes = 0;
>  	u32 length;
> -	u32 len;
>
>  	status = dma_cookie_status(dchan, cookie, txstate);
> -	if (status == DMA_COMPLETE || !txstate)
> +	if (status == DMA_COMPLETE)
>  		return status;
>
>  	spin_lock_irqsave(&chan->vc.lock, flags);
>
> +	if (chan->is_paused && status == DMA_IN_PROGRESS)
> +		status = DMA_PAUSED;
> +
> +	if (!txstate) {
> +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> +		return status;
> +	}
> +
>  	vdesc = vchan_find_desc(&chan->vc, cookie);
>  	if (vdesc) {
> -		length = vd_to_axi_desc(vdesc)->length;
> -		completed_blocks = vd_to_axi_desc(vdesc)->completed_blocks;
> -		len = vd_to_axi_desc(vdesc)->hw_desc[0].len;
> -		completed_length = completed_blocks * len;
> -		bytes = length - completed_length;
> +		desc = vd_to_axi_desc(vdesc);
> +		length = desc->length;
> +
> +		if (chan->cyclic) {
> +			completed_length = desc->completed_blocks *
> +					   desc->hw_desc[0].len;
> +		} else if (desc == chan->desc) {
> +			/*
> +			 * chan->desc is the descriptor last programmed into
> +			 * the hardware, so the pointer registers belong to
> +			 * it; never match a queued-but-never-started
> +			 * descriptor against the stale pointer left by a
> +			 * previous transfer. If the transfer has just
> +			 * finished but the interrupt has not reaped the
> +			 * descriptor yet, the pointer sits at the end and
> +			 * the residue reads 0.
> +			 */
> +			completed_length = axi_chan_get_xferred(chan, desc);
> +		} else {
> +			/* Still queued, nothing transferred yet */
> +			completed_length = 0;
> +		}
> +
> +		bytes = length - min(completed_length, length);
>  	}
>
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> @@ -427,6 +504,7 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
>  {
>  	u32 priority = chan->chip->dw->hdata->priority[chan->id];
>  	struct axi_dma_chan_config config = {};
> +	struct axi_dma_lli *lli = first->hw_desc[0].lli;
>  	u32 irq_mask;
>  	u8 lms = 0; /* Select AXI0 master for LLI fetching */
>
> @@ -468,6 +546,19 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
>  	}
>  	axi_chan_config_write(chan, &config);
>
> +	/*
> +	 * Pre-load the pointer registers with the first block's addresses.
> +	 * The hardware reloads them with the same values once it fetches
> +	 * the first LLI; in between, a reader observes the start of the
> +	 * first block instead of a stale pointer left by a previous
> +	 * transfer (which may alias the new one if the buffer is reused).
> +	 */
> +	axi_chan_iowrite64(chan, CH_SAR, le64_to_cpu(lli->sar));
> +	axi_chan_iowrite64(chan, CH_DAR, le64_to_cpu(lli->dar));
> +
> +	/* The hardware pointer registers now belong to this descriptor */
> +	chan->desc = first;
> +
>  	write_chan_llp(chan, first->hw_desc[0].llp | lms);
>
>  	irq_mask = DWAXIDMAC_IRQ_DMA_TRF | DWAXIDMAC_IRQ_ALL_ERR;
> @@ -1077,6 +1168,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
>  	}
>  	/* Remove the completed descriptor from issued list */
>  	list_del(&vd->node);
> +	if (chan->desc == vd_to_axi_desc(vd))
> +		chan->desc = NULL;
>
>  	/* WARN about bad descriptor */
>  	dev_err(chan2dev(chan),
> @@ -1140,6 +1233,8 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
>  	} else {
>  		/* Remove the completed descriptor from issued list before completing */
>  		list_del(&vd->node);
> +		if (chan->desc == vd_to_axi_desc(vd))
> +			chan->desc = NULL;
>  		vchan_cookie_complete(vd);
>  	}
>
> @@ -1205,7 +1300,9 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>
>  	vchan_get_all_descriptors(&chan->vc, &head);
>
> +	chan->desc = NULL;
>  	chan->cyclic = false;
> +	chan->is_paused = false;
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>
>  	vchan_dma_desc_free_list(&chan->vc, &head);
> --
> 2.43.0
>
