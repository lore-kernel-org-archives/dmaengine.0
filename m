Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6AE54A7ED;
	Wed, 23 Sep 2026 19:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191428; cv=fail; b=mKANi/qmKrYbE0hgptRs+z+/Se7HRlw4drkS2afRmmSuAnSqUfucdeyVf2u1m94KVM4EIg7xq4FyYhYlNZY//ro+T3NcQDbW/Dbi9qo7BWyxEmmmZ+Vf37QiWmoWNTVnz7KSNooL1A1FKv45YvcDGxjxlg0UhFIWgDahJTtn94c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191428; c=relaxed/simple;
	bh=vpQNPfCrf2PwLpQ5u7WM1zTuyQ369AQfuimAJ8TvlQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iAC5QLRcnDSjAd1UIcG4NAnmNBiOa4SbV8XdDxefPBDXUTBRIuL7k0pW9LWl6AmB+P0tt48wuLyKBhpAGZbGw1x2enMwkFONYa4/jURqlc3yDFUUF29fajrSwjIf+xcGhKmQKf28/F4ZrahZiMimV6Ijys7yBgHctDCEc/lkbng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vzHN0ucn; arc=fail smtp.client-ip=52.101.83.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vzHN0ucn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWaP9oUy2d3Q3yZCN1iJiL8YgXq4m0heWBR1yUg5tCWpODv5rjCfQf+sED5vPfp8sLThfgOIb/wmbCljWsIbxix7QIanC0OFzaNUV9LVpthgtWAk3hknWZx71+K5swn374UFbufV/q1hYJSXsUr2pZBiGMGVq+T86H6V+yWcq5eGWlbkWgtO65Itf3VPGZIW7qE2ARMDREAhY2vnBIVVXIdETUoGB6MWV451lhDwktDQNYzhoM5v1li9hdGTTd49wd4UsNXwh4NBpg+dLH/6rUWX8xPm6hU+297M9w9oX2DV8wqt4b9qyV7ThSrA9CDgq4x+5/helAHdKdOQuFRRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0keya5864EylKqhKMFuFNH0WWmOBj3l4K+21YR/hlu0=;
 b=wMkfcKdDb6YnoX6OoQr2HM1zkbubCJw0XobIgWmP4d3cj2YRKC7fOF/17k0+cHrhroLbo+rWM+OCXlISvVRKTmg6//5jXyaSkcDJfGSFircIGifhGC8Hf4JYILzQ7+wmQYnBvlRBaWwtEfAEJVRZxwHq4tJASDrwlPwJpqZs+B3oqP6Z/Od8MBZFElxD1m1a6rA6RdKxL7cNDmZVpiw5PsN9EIdHVQxYjw1mPuo9ytlJh0KIYGzvpB1iO2uebLRl4d6FNpyWf8QqNJIVcg4ekmdce4BETu6VcBqckQoJCeFjfur/QgZ0rdHnG3dsnejlasCYnNDYnDSFSDQv17d9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0keya5864EylKqhKMFuFNH0WWmOBj3l4K+21YR/hlu0=;
 b=vzHN0ucn54ieZ5/A3KyPCCTToRGpiqbxSFm5/eN/hAa0io6pu80eZLeopf19fzguwLT/7IPneaqV8hPgo6aLun1gu297DQOv8AJKTMHJDug7yOIU4uAmGibSFq9DJvMA2l1RCXNSIwRJsTiGx3tGIXawZGYgQejWyPCCYsNm0LP/IRof3zzpfrMCEkhQxF/fwAUV9CtN3K7eiXRIsaERmW/pdQSZkqAsv4gUMp9ued0dpY/EBA/7V58BUVAZy2oDg1G91zqk1j/bJS45lN8Fe/rQwUoNbWRtVRqx6GvWsKxDvDAnGLdhMLXb5Xy2CQVozK8KilKM/xDcN0YMRkSZTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9336.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 19:23:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 19:23:42 +0000
Date: Wed, 23 Sep 2026 14:23:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rui Wang <wr574332525@163.com>
Cc: vkoul@kernel.org, Eugeniy.Paltsev@synopsys.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Message-ID: <arQnNiDh1Gp7OXUE@SMW015318>
References: <20260923060045.5571-1-wr574332525@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923060045.5571-1-wr574332525@163.com>
X-ClientProxiedBy: CY5PR15CA0091.namprd15.prod.outlook.com
 (2603:10b6:930:7::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 474cfc2d-692a-4d18-5bfe-08df19a82d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|56012099006|11063799006|5023799004|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IbPLaGnTqoY3K0vabiH4Wtj4EhJfgSQdGqOdDds6rTSB6FROdm/s7fg0lq2CS7bgqhTquViD5x4QEu4fTwBtXbPd0fa8HaG2bpB35fL/Xp9LQDfkFzWX0uxSNix+BLhaoo41aOP9JyXxH2uzHvgg0504qGRyx4hTaa8Y81VnGWyCX41HFA6qDaDuz4z77HtO3sBGZ6S38I5mEwAKW0GrBHK0LTMdDyDhsF1aGcAMzsB6CPMw4FUExajfeMJDoPjEo8vLaDI7OXoJfg8gIE2dDAmrz7HW8/oyPWsi+hz5Po3FoJKg893JfJ87fddCFkfl01Dpzdvgt3+C6Po5+KttoAOrQ708zsNRwN8Um4u/5ju7a7fLafBrjfSgYp9qNr8e29TaNeIIwt+7CgVHVcXyPOJ2ZoRCQqCT55c4YYFWEAiI+BWuz/AHGc9Lnp5GVlGe0MgihnOxUAyMCeBaatNZhF4tG1XLbMuL3OO6s7xhZgCY+EJvMVgoSSXtSLt2h3r8wWPdMIxaV4jdLp8hXPs46wmvculwueasjr9QLbve7noOoCwNyk1fmmUdovfjGK2+la9+BhM+MGMDxgYtrwpZ/IPIkGIxnXo/0TIbUKUj36QF9W3Ne4Le/DyhcY5QhrxA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?StLGAXxdLIstyjqplSIQL4zx+72dU+2IZKIiLyejbqbb96GELtq4fSR4ZYxx?=
 =?us-ascii?Q?K01qcWQHdexah9gs/81laTBZuB1h+yJ6nfjeGVOqpne31RXp2dnUyeJOHYbU?=
 =?us-ascii?Q?/DHzwtoiiYx/vKHDyZ6a9F5lvEvT25XpvQ/VDt/a3qvDNOtnhQIuxtshSPsY?=
 =?us-ascii?Q?LDdWlfZrUPzvYT2Ex8fkHQ0p9RmbmQSbH2rhaPxKv0v4DNLeggGSWDxP2pLN?=
 =?us-ascii?Q?bTbSFYTZl/v0PgJ6CNsAP2I6CnRcAKVFKxz1j+KaaFwuBg+oJdXc2RTctwEb?=
 =?us-ascii?Q?qwDGzM55kVW+xI7N9Nr0/mxpha4u9aFFv6T8l+2kpr9pkF1CFTMZhqd+qs/G?=
 =?us-ascii?Q?5Iy9lvmyzyxgeUeZJDIinpkgao6AeHvOjDvV8fh0xXIdDf1XbsuFVDvIC+JY?=
 =?us-ascii?Q?RPhdEpLo2fG3CvLEzPxTMpa4xUl0mzkAAWz+KVnjr7PgMbVAfBMiHcVmt8Py?=
 =?us-ascii?Q?J0ybqewDCrqU4A6GOnBsH6gSUrXUrouOvPgHQA//eXjGhhADWcbsZuIko4/R?=
 =?us-ascii?Q?WX07cnVg4QfVD8jBhKTajiNzEARhfQDYplVaPsTQyIfDCc8T1Fg4p2oLqz8Q?=
 =?us-ascii?Q?w1g9KeDqFhg3U5Sw+Wday5DzNAoYJ2vBZ0AYI1lxY+oqEA3npj4KNdDsrks0?=
 =?us-ascii?Q?8VL5QuG9hWYPwgcjURSj+AtLbsETPRxRI6DK55XpirJHY28OIuilFr2INdjd?=
 =?us-ascii?Q?zqtoZp5Q4g01dYIVlY0zKP4cNLM3Ad10BKlWLwCWhrxOEio3WEPVp92aBa14?=
 =?us-ascii?Q?gVbHHMd0/Bx9ASjdDuPgAfjalJ/4B5eXHonoJJT5JXw51HwJCW+XHDh/XKdR?=
 =?us-ascii?Q?zf7mhXJsDyUoI1j3zqxhF/bG8P3bfb0eS5GsK6+WBE+n7+ExgSDCNX9O9obn?=
 =?us-ascii?Q?V6J1CUjAzf5RF47NDPW0tIund3QlFdTIab0i/FchB1Gqdax4VciWfA0psHxV?=
 =?us-ascii?Q?6rjRH+7eUWFCfvXBwqUSJkNOKHazSnN/Yz0bq8NW8AlFJ3fkoW5x6xwTmVOE?=
 =?us-ascii?Q?hQwVdZSgX+YAcFRgAJOKikIeuaLSaD44ud4ah54Xfj0M2ecJWuwzxSuV4LQE?=
 =?us-ascii?Q?g/sn8ccVeo8iPf2HkRx8YNqFzG6qqNrXfDIQaOFKBLDImUoN9PQbm48ZstBT?=
 =?us-ascii?Q?3UoA//i3CoIVYjDUqPmm68E8iDkSL2aJJP5RGXwJwrmlMkLJpSDBJUwTDBEj?=
 =?us-ascii?Q?HzBNVDyncCsaZgUuFxZ1TbmGNjvTNq0uKVs6ClWJJGBZXZ+5tljVKXeFc5gT?=
 =?us-ascii?Q?TYkSYXBeGeGn2nL6krdzxrgmmgSgfcCxyMq3actCXpV2+gPO83jffTsYOung?=
 =?us-ascii?Q?6RIcetISDnj4X9Vg/nTRxHYGRYCtbdS8MXVJnUJakpuvOea21Rmsj16bOh9q?=
 =?us-ascii?Q?OgZ5UgJPLatsoXoyTwKvA1sKC/neJGdebaxZ6v7aSg1MmbFMzu71auNpiE3/?=
 =?us-ascii?Q?+w9iJPYlentDodv1sROsoTAuS7zCpR/gAwGGNhUewN4xc3ekhNV4G9rfYS9V?=
 =?us-ascii?Q?e1CGZ9lpfv3UFoc3w1qKKLw4INj41PlwE+2hUOqUdR/DJlvnHjryZilL1oNh?=
 =?us-ascii?Q?auPXffHpZ3oXr9n1JbdJU1IfKk9PUO/sPANIEE9K5Z6slcBiWbXySogkDkOk?=
 =?us-ascii?Q?J6CxVd0QfF4u2BMO+AFbjOkOLtEQm2538cnFtYrQ+OrTIyIiPlBRwRBk9X2l?=
 =?us-ascii?Q?yjf+r9+zJ3xmtxatDuzE9MTVs4wQn6anBWVkLZ3CEmqEy7a7efwddLUs/wd8?=
 =?us-ascii?Q?Ouzx1QU+QnlEJX4wmKdi8RKTAF0SI+BIqQ1Ys1C6kuvtB0A+uq9W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474cfc2d-692a-4d18-5bfe-08df19a82d64
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:23:42.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbQYgaLET8OETdziOtvg3bGtEgfMd39jY4ZjRUpdKZB1EOpvbd8DPj33I8OlQiNRCVgc9aXsuEMS0JrleJdkH6dDd27fmY1pB/Nk3v5sy/HK4ULNNT+rl0odHMHu2P9l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9336

On Wed, Sep 23, 2026 at 02:00:45PM +0800, Rui Wang wrote:
> [You don't often get email from wr574332525@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
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
> at the end of the last block and the residue naturally reads as 0;
> conversely, a channel whose enable bit is still set never reports full
> completion, so a stale pointer left by a previous transfer reusing the
> same buffer cannot be mistaken for a finished one. Cyclic descriptors
> keep the block-granular accounting.
>
> Tested on an FPGA platform.
>
> Signed-off-by: Rui Wang <wr574332525@163.com>
> ---
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
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 114 ++++++++++++++++--
>  1 file changed, 106 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474..66da247ff 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -352,33 +352,122 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
>         axi_desc_put(vd_to_axi_desc(vdesc));
>  }
>
> +/*
> + * Read a 64-bit channel address register while the transfer may be
> + * running. A plain lo_hi_readq() tears if the low half wraps (carrying
> + * into the high half) between the two 32-bit reads, so sample the high
> + * half twice and re-sample the low half if it moved; a second 4 GiB
> + * wrap cannot happen within these few instructions.
> + */
> +static u64 axi_chan_readq(struct axi_dma_chan *chan, u32 reg)
> +{
> +       u32 hi, lo, hi2;
> +
> +       hi = readl(chan->chan_regs + reg + 4);
> +       lo = readl(chan->chan_regs + reg);
> +       hi2 = readl(chan->chan_regs + reg + 4);
> +       if (unlikely(hi != hi2)) {
> +               /* Low half wrapped in between, take consistent samples */
> +               lo = readl(chan->chan_regs + reg);
> +               hi = hi2;
> +       }

common pattern for this type problem is use do while loop.

do {
	hi = readl(base + REG_HI);
	lo = readl(base + REG_LO);
	hi2 = readl(base + REG_HI);
} while (hi != hi2);

> +
> +       return (u64)hi << 32 | lo;
> +}
> +
> +/*
> + * Return the number of bytes already transferred by the descriptor
> + * currently on the hardware (running, paused or just completed), based
> + * on the current read or write position: CH_SAR for MEM_TO_DEV and
> + * MEM_TO_MEM, CH_DAR for DEV_TO_MEM. Must be called with vc.lock held.
> + */
> +static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
> +                               struct axi_dma_desc *desc)
> +{
> +       struct axi_dma_hw_desc *hw_desc;
> +       bool dst = chan->direction == DMA_DEV_TO_MEM;
> +       u64 pos, start;
> +       u32 xferred = 0;
> +       int i;
> +
> +       pos = axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
> +
> +       for (i = 0; i < desc->nr_hw_descs; i++) {
> +               hw_desc = &desc->hw_desc[i];
> +               start = le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
> +
> +               /* Current position is inside this block: partial progress */
> +               if (pos >= start && pos <= start + hw_desc->len)
> +                       return xferred + (u32)(pos - start);
> +
> +               xferred += hw_desc->len;
> +       }
> +
> +       /* Position doesn't match any block, be conservative */
> +       return 0;
> +}
> +
>  static enum dma_status
>  dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
>                    struct dma_tx_state *txstate)
>  {
>         struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
>         struct virt_dma_desc *vdesc;
> +       struct axi_dma_desc *desc;
>         enum dma_status status;
>         u32 completed_length;
>         unsigned long flags;
> -       u32 completed_blocks;
>         size_t bytes = 0;
>         u32 length;
> -       u32 len;
>
>         status = dma_cookie_status(dchan, cookie, txstate);
> -       if (status == DMA_COMPLETE || !txstate)
> +       if (status == DMA_COMPLETE)
>                 return status;
>
>         spin_lock_irqsave(&chan->vc.lock, flags);
>
> +       if (chan->is_paused && status == DMA_IN_PROGRESS)
> +               status = DMA_PAUSED;
> +
> +       if (!txstate) {
> +               spin_unlock_irqrestore(&chan->vc.lock, flags);
> +               return status;
> +       }
> +
>         vdesc = vchan_find_desc(&chan->vc, cookie);
>         if (vdesc) {
> -               length = vd_to_axi_desc(vdesc)->length;
> -               completed_blocks = vd_to_axi_desc(vdesc)->completed_blocks;
> -               len = vd_to_axi_desc(vdesc)->hw_desc[0].len;
> -               completed_length = completed_blocks * len;
> -               bytes = length - completed_length;
> +               desc = vd_to_axi_desc(vdesc);
> +               length = desc->length;
> +
> +               if (chan->cyclic) {
> +                       completed_length = desc->completed_blocks *
> +                                          desc->hw_desc[0].len;
> +               } else if (desc == chan->desc) {
> +                       /*
> +                        * chan->desc is the descriptor last programmed into the
> +                        * hardware, so the pointer registers belong to it. Never
> +                        * match a queued-but-never-started descriptor against
> +                        * the stale pointer left by a previous transfer.
> +                        *
> +                        * If the transfer has just finished but the interrupt
> +                        * has not reaped the descriptor yet, the pointer sits at
> +                        * the end and the residue reads 0. Conversely, the
> +                        * hardware clears the channel enable bit on completion,
> +                        * so a still-enabled channel cannot be done: right after
> +                        * the start the pointer may still alias the end of a
> +                        * previous transfer reusing the same buffer. Never report
> +                        * full completion while the channel runs.
> +                        */
> +                       completed_length = axi_chan_get_xferred(chan, desc);
> +                       if (completed_length == length &&
> +                           axi_chan_is_hw_enable(chan))
> +                               completed_length = length - 1;

suppose you should call DMA done handle here. return length -1 is workaround

> +               } else {
> +                       /* Still queued, nothing transferred yet */
> +                       completed_length = 0;
> +               }
> +
> +               bytes = length - min_t(u32, completed_length, length);

now direct use min()

Frank

>         }
>
>         spin_unlock_irqrestore(&chan->vc.lock, flags);
> @@ -468,6 +557,9 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
>         }
>         axi_chan_config_write(chan, &config);
>
> +       /* The hardware pointer registers now belong to this descriptor */
> +       chan->desc = first;
> +
>         write_chan_llp(chan, first->hw_desc[0].llp | lms);
>
>         irq_mask = DWAXIDMAC_IRQ_DMA_TRF | DWAXIDMAC_IRQ_ALL_ERR;
> @@ -1077,6 +1169,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
>         }
>         /* Remove the completed descriptor from issued list */
>         list_del(&vd->node);
> +       if (chan->desc == vd_to_axi_desc(vd))
> +               chan->desc = NULL;
>
>         /* WARN about bad descriptor */
>         dev_err(chan2dev(chan),
> @@ -1140,6 +1234,8 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
>         } else {
>                 /* Remove the completed descriptor from issued list before completing */
>                 list_del(&vd->node);
> +               if (chan->desc == vd_to_axi_desc(vd))
> +                       chan->desc = NULL;
>                 vchan_cookie_complete(vd);
>         }
>
> @@ -1205,7 +1301,9 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>
>         vchan_get_all_descriptors(&chan->vc, &head);
>
> +       chan->desc = NULL;
>         chan->cyclic = false;
> +       chan->is_paused = false;
>         spin_unlock_irqrestore(&chan->vc.lock, flags);
>
>         vchan_dma_desc_free_list(&chan->vc, &head);
> --
> 2.43.0
>
