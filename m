Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9742369D71;
	Mon, 24 Aug 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584769; cv=fail; b=ZVdnyuOnbh5GC/ur17y+5yV2l656bEgvRcazTYkYpbq0pGF7Wn1OkgbpziaXphxA0FZQsaFalqf9Ziek7PLfPvKgq9cFtdF16XzGSzThCz5sYiSJXMuXJ+exxAIfrBTbaZzEsw8NRA8hsnsl6JNiUeJZsvVk4MoYRG/aiDfcETI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584769; c=relaxed/simple;
	bh=rI35GoxJnaKyEstM+wwaRbBKO3mtbZdKjuygv0axmyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E/LDnaaZE80j03nC74oEPOnzHDJohn7q6fDPPTqTfM11Fv2I3lKWpsQUz7JlNHwQynQxZUcE4wE1+emOBbyM+AfS0AMkM1TSjK2aWYIXtQGF3H+MjxCXyKU4eWxbMZWzlxLbQ62IGY2pgU4DOQMf4WSUJgI8vZbPsm3KitcS/7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CIBNsgnF; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CIBNsgnF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQHUSKHQqzZvTMCuFANM9ACdsXKgKK25sP3LVH21AdDGgVnehmCXSO7joKTTZevyOzxAzxo7Sgoq44SKsJht7nEZYFww2WAZ6PUnm+ZvnEoYKyLHY2CSeLQ14KmbKm5Fb7gDCSgWqUH1OvsmqEzYRNfuXmaf4vzxdPoRDftwVLmo2/TnAdSejS7uQaRf2UPFz0Y/TNcGExOxoz55MOajleOGxzoN4JWSUbT3Bj2WomlAZao7KjyTtZXk9x2hsml3N3LwcOzJ2XkE3fALrVN2e5O2L12ML8AhS4Y61axbAv32ZcYDLoUyWNIZxFk04pqcB+acsjrGWLCxjvDXw7X/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdX85KyNezFeIkaudjveBucT1NAtxBw+6rosp/2zUFg=;
 b=jkXXK4rHVrkocrYswsWYVXzseDT/l28jxs8lOvnh4Sccs5f9M4Brxqs6XNktWa95Ufk9jgaJgF5PiL0zVy29IcedHyGZm6Rn5FaOfQz6u+K0cvtJHV8vTbPd99P1biTR2jRJUYfwLp+aSUpae6wRK+u8i8I6sba2cLRv0nfd3WlTu8VVMh8SktOdQQBw2tc6USCoFHc7u8G0QcULKaQGpRACruimte+ChNX9hwqZ61HxrPJ55zOotEh2FSPwlC5HyrXbswbo/3pYBpT1zU6KXVhZetIwjUpYKia1byMFwhbBgnvX/WKLij5N+HqtdnaZgn5mTJ4v9jq9zjEJ58xOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdX85KyNezFeIkaudjveBucT1NAtxBw+6rosp/2zUFg=;
 b=CIBNsgnFqpXs6Q0WkBFlM5vaoVLgnkGWmE9DEA5ha2P64BCN4Qjq2Nl4e5J3yOeMxX44s0I8I0tgraq7JxtVnTAbFULFRx3PXnn2U/J46jlcFXMJINcmbwVm6k/wAOzXfVvm8+DI1DTWS8I7hHUzEpfiwAqtSE/+JMN4QWh4qdXJsgBpupcF+YFf1NeHOKP17zVAw7/M2nG8rAW0Q8Y9f58BQCpsRBVCmDGqXlZ07JQqYuN54Xg3V1sGNjUmcIF4yWTXcMn5k50dyB+kTrsFabFs1P70xX7TPM0Rd4uWMXrcgUXjkHskaK9ZI63AQsg5X+mjmixjrZwNRekl9kKqpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:19:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:19:24 +0000
Date: Mon, 24 Aug 2026 10:19:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alex Bereza <alex@bereza.email>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
Message-ID: <aoxg9NkrKiRmIFGJ@SMW015318>
References: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
X-ClientProxiedBy: SA9PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:806:a7::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 3623e263-112f-4858-9a51-08df01f3147c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|56012099006|10067099003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	bYg7nXCCly9TI490AG1PTxrw8s9NvYMn0AmXMfQsDN3hsI2sssZKQ+sKu/VZTwHB66fWC0wKpCAyg/R3G5cqSa3ll3w+sitYOyvXmln3EyDt4Spnp+uViG3DjBfI0zr1O1Ije8pOxe8oJaJjycMpnS6spNTnDxEuFw7P9yEUnKrvsAZOL7f8t0jmXwBmo0fWjUzEYQLI0407/eky9iYQr7tU0SF3aKWowa9cc/MjaiBRa0jleuCLjfBFfxweeSjCRjMUFQNwrGJbgcORD8/APdf6Lny+Z4n5JHKvDjZobE/Qfo+T23vGmmmhWg6WbKZPl0XfMyGEYY9vpwvUhMNf4hU/itD4PgmyRbMVBTbBWQG++VeHsdSIwZ4p2rPVeHDgNMwEJCePSa5m+fjFcCkcsfU9LXNmIieGmjvSGSY6NBXdstusZGktz3KMahGygbtDElvf0NjSWJDWXJV6Wz+tovdBBSQrJEvMj+yCTBn0iqKgz2Td6KrmvfRPraDzOVHlhUxU3nL9H15p72h+JYzgyn55VNDjgfkgbSv4/7C20JdCUQ2T8RPMLzdgbMIaFA4UXricIYTa3/HRiyupr7xW0730i8Y+U7PN8tKZVzIviIau4B0FPvtQp3iMNVWwuG3J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8IY3RG+mcLRyytoMsPZWCuuTG4G/23dysk9MsYl5ehibFokOfDlt0K88C9Pp?=
 =?us-ascii?Q?pReKBkPzpXsRdwcGJGAnQ96UgWMnND6TPcdwZtWlC+u6jx+6uQ8ClVmaQl+V?=
 =?us-ascii?Q?Vt2yVLyIWN4ZCEAFK279G/0Dp3chyq79B7Qyj3cSykyu/YqiAvjBbuZOxYly?=
 =?us-ascii?Q?Na8i8zXha/lz1YAuRmisjb3Mo26JfWoom5x5VPahLwIvaAECZNakqq9NXJKz?=
 =?us-ascii?Q?MRQpeiy3Ut1fJJIz2bLneGqaP78VGpsp2xgU+kALjU1ksSqF1o4xReZAoffT?=
 =?us-ascii?Q?a1ba+0omfPjSx9f/AJ4nSuVu0HqOsOlMG8vgH6J6XKhMVTox9dKumtF7tfur?=
 =?us-ascii?Q?/TJDtSrD+yoVBko894sYkGdIN047nzEZCbaBGLeZCSD0OFRIRXyx+vE6fDDj?=
 =?us-ascii?Q?8ItEUxr6gGWU8iYG6uXobkhaJterbhCYITivtIGo8kDjGkhJ4xzNVAB+4sIn?=
 =?us-ascii?Q?o7MgzfyKpOHFlgnLwBR9f5MSqp3r0PeaYprI/gNx7j4IvQEwMI8ksNBWtmfF?=
 =?us-ascii?Q?6b8JbLPtCEz0wC4j/WQNbcNpsazX+ak59O1CyBJzyMjMXQ6/9gl0YwEiX7zO?=
 =?us-ascii?Q?u8b09Gv9PeuJIthnVSLcYzQS2s6ZzooqoqKVGP9jjTMHqv4g13jMxz3q6gBE?=
 =?us-ascii?Q?0RNtmg232GpF1fHGrA6FPfP1zZdhQetasktSvo0AAiAkT4IQ+cwmaS62BYOB?=
 =?us-ascii?Q?O0WKpU+zSgMEXKywuHffajW085+akezN1WcxzYdqSgaM2OddZQ5ArDGdGrMZ?=
 =?us-ascii?Q?N/s0I5yo8ZWDlF858fbQY2/+Vyf/4q25cy7iwy5LNs5SmIQvZIp0oAAso6Wj?=
 =?us-ascii?Q?e8icGn27goy8IZRUw0NYkNzhHwCD/ufB3uKV9e5vYcrUKZwhpuy+eNI8YLj/?=
 =?us-ascii?Q?kQRIZh7fwvxsn44YkItpVoK5NpPgyM0CJOmQHjyylsex1H2sVj1N75UGRGyH?=
 =?us-ascii?Q?Rj3zVRrtbRVXaoVts6GmKEo214FfQ1XMB23TOIZz4+XcwqlcWSdZZN0pu+7T?=
 =?us-ascii?Q?Uecz4UsIapS1VUiMv1LxwFBjt/8k2cOhZcS65VI72eRCelChYHnf7nD1sjsX?=
 =?us-ascii?Q?7WeA0sGC5Ny6YrrvCwciiF0Nj7tWy7Z8ni9/9xN6za8bMC9o9ZmVTuTAMfhs?=
 =?us-ascii?Q?6BJ5z5SLnvhvZRjIDa5F/Nsio7rujX4at0nzIXgWUq5H3/DVH6H9IX8I0/pT?=
 =?us-ascii?Q?WDF/j/55Q9h6DKhiyQsVmcALo+GyFbkocplsS5Z2Lzs0VXOERN0JKxTzfh2f?=
 =?us-ascii?Q?cqIvFgUYeg3LW6c626dHiWEE29+B6IKzpdE0hhh1Lu71qqdSeGsemVCcBWfb?=
 =?us-ascii?Q?b+/MC0u1wE0gRHlzu/A4ACWOBQ/UPNf7mlNvgEpOg7qyUpSQacoefjXft2rb?=
 =?us-ascii?Q?OrVlRI/guCAKt3q9sBqqeu560amb5QujI3fEhMhXO5KNuUjPLLTtLc/lHF7b?=
 =?us-ascii?Q?QltC8zu4ItGPhpVudviPTjyZTO/QQAVHfBFhdcOwDPMByupbAvF72y9mZZSg?=
 =?us-ascii?Q?QzRdW50aX8u3Z/agcxA+K8Tn2A/YAfiKvHjA51Kp9b6FOBU+eWCnqLXxWduq?=
 =?us-ascii?Q?8XTlAPtHnldBaQ9VeWU0QFy6Gj8o3mWWDNJwmzQpiWcY3ZVF4WlobBq2Fqqg?=
 =?us-ascii?Q?M4IYA0C0uuHCkxzO+Q14FsuQuhrH0awbn3SJPmo7KBxsLfaCxKvSUivok71Z?=
 =?us-ascii?Q?8ONykkUR7ntFxUXoncfg+OeDHY/bzR9FC/fqBpMlfDLwODIAkWfkyzUs3+xJ?=
 =?us-ascii?Q?c5FO4Ncd7td9mFyFcI5hVSDnHIj0TdcEdKjkJUI1h5uaEWfVlnQV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3623e263-112f-4858-9a51-08df01f3147c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:19:24.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqWaDYoMJjkbth5TqO0Z8S0Sp5vCqLVUB2TtpmWm1aZbCF5CDRMhB+mp/CkI/bjQlJeH/gemfIPnJm8URJ0Aoy6AxAB2I6DFpXs8TQopduJBF1+dmKV6MV00z13gHzSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On Tue, Aug 18, 2026 at 09:36:29AM +0200, Alex Bereza wrote:
> Using the DMA in cyclic mode modifies the hardware buffer descriptor
> chain in xilinx_dma_prep_dma_cyclic so that the last descriptor used by
> the cyclic transfer points back to the first descriptor, but it never
> restores the original descriptor ring. This breaks using non-cyclic mode
> after cyclic mode with an error like:
>
>   xilinx-vdma 86000000.dma: Channel 00000000354d5c8d has errors 100, cdr 6de40000 tdr 6de40400
>
> The only way to get out of this error state is to rebuild the hardware
> buffer descriptor ring by releasing and re-acquiring the channel.
>
> Fix using non-cyclic mode after cyclic mode by always restoring the
> original buffer descriptor ring in the same manner as it is set up by
> xilinx_dma_alloc_chan_resources().
>
> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
> Signed-off-by: Alex Bereza <alex@bereza.email>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Use pointer arithmetic instead of potential 64 bit division in
>   xilinx_dma_clean_hw_desc() as suggested by Frank Li
>   <Frank.Li@kernel.org> and sashiko-bot - Thanks!
> - Link to v1: https://patch.msgid.link/20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email
>
> To: Vinod Koul <vkoul@kernel.org>
> To: Frank Li <Frank.Li@kernel.org>
> To: Michal Simek <michal.simek@amd.com>
> To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/dma/xilinx/xilinx_dma.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index bef2b031dba1..650e078fcdb7 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -756,15 +756,25 @@ xilinx_aximcdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
>  	return segment;
>  }
>
> -static void xilinx_dma_clean_hw_desc(struct xilinx_axidma_desc_hw *hw)
> +static void xilinx_dma_clean_hw_desc(struct xilinx_dma_chan *chan,
> +				     struct xilinx_axidma_tx_segment *segment)
>  {
> -	u32 next_desc = hw->next_desc;
> -	u32 next_desc_msb = hw->next_desc_msb;
> +	dma_addr_t next;
> +	u32 i;
>
> -	memset(hw, 0, sizeof(struct xilinx_axidma_desc_hw));
> +	/*
> +	 * Restore the buffer descriptor's next descriptor pointer to the value
> +	 * set up in xilinx_dma_alloc_chan_resources(). Otherwise using the DMA
> +	 * in cyclic mode leaves the next descriptor pointer altered and
> +	 * prevents subsequent non-cyclic transfers.
> +	 */
> +	i = segment - chan->seg_v;
> +	next = chan->seg_p +
> +	       sizeof(*chan->seg_v) * ((i + 1) % XILINX_DMA_NUM_DESCS);
>
> -	hw->next_desc = next_desc;
> -	hw->next_desc_msb = next_desc_msb;
> +	memset(&segment->hw, 0, sizeof(segment->hw));
> +	segment->hw.next_desc = lower_32_bits(next);
> +	segment->hw.next_desc_msb = upper_32_bits(next);
>  }
>
>  static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
> @@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
>  static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
>  				struct xilinx_axidma_tx_segment *segment)
>  {
> -	xilinx_dma_clean_hw_desc(&segment->hw);
> +	xilinx_dma_clean_hw_desc(chan, segment);
>
>  	list_add_tail(&segment->node, &chan->free_seg_list);
>  }
>
> ---
> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
> change-id: 20260817-fix-hw-buf-desc-after-cyclic-mode-cf0a7834ab50
>
> Best regards,
> --
> Alex Bereza <alex@bereza.email>
>
