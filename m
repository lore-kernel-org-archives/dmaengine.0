Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740134389C;
	Fri, 11 Sep 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136113; cv=fail; b=e7ptwvRRBclfkmr22uncA1/4SmV7RUx9jB5HzNaOkS5W8EYqbchPYX+nB1KrK3ND5p7vZPQxh+5IDdtKqv+79SeVaoO9ypVxHsRkeQtMQV/w+mH1FRg6V3REUDlHXJs8ZDp+8c+CBO9Go/8De2JSXYNfrcKeAqIKOhH3gethvA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136113; c=relaxed/simple;
	bh=1LV40/2CX5/x54shHa7Hz7TlzWA7rMMkshsVJVwU6HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XuU9Or61ba6U+7xTwbkYIt8c0gDmveJJ0UVMPRPjazfCifFdOo68Dt6VeSGPaDKqyGiq6uZKOpqAmbAu5oHysBo238Y+/vs4NKjvLRF/IG0sAxldGNSu+bmn35MtTpY7OBjGwZZcyAVSWxtOeVUljVjiPGliFLIMsCfAdG6+boo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YQsZnM7x reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YQsZnM7x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZWJKO4jzEEq85L53Dgu8ZRtINxI8ANhMZqbxRTQZLDRdfEwor6ZGu4L6rJVmQYCrvlJSrIoEyB1QcfOLHv/+YaXUMECc8VyBHZOmUhIOvcvsMGw05BI+4q6+/MtbvCfT+WDl/URvFkj7sI+m+bf2/Q1l9EjxkYNWMqD8Ho6SZrX9muTolbZg0J7hfExKoUM0isnPGUlF9lHJBrUJQHNe9UWnfYoS71LBneNFSQhjxEhggcWAdLdWAlHhXcp2qQNm8cFGwxx3IQ1LQdvl+Z78XvuOOwmoXsfbiV3eIlueRW7L4ke7syqmnCnx6LyMQHnW+5VqHkpMxLgRRmYb8MdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+Wy32D9URzEZVDOOiywHbeCfKr+x4Fzz0uiC9/Mmbw=;
 b=SrvW/r0EkZgeBzbWc5yieeoQfDTg6ftUdnaBqKvbxEdmW4cY0JiEyRyOeeJFzqeYCkVvU40d+frltVtLG27Y+D+IM920rIP9PYvbDEdU5F5pR4lVYuSW+gx5MfYvCGjCJpVn1SH/5bqAlyWUuaqn/qIfVoGmlqxyQhCGCGOak45vsHfkLZ+2h6XG7sJAzomW+gKA2ycsnyVVxd4S0bYZSYWSg6JEcQAOnU3IkrV+J3BN9jsgTeRicBsCz6fCtJ/0PEEhE44NRz1raMhWznY+TM+ogdtqbCQaNJBaB+IEXGnTdHaR91WIOdB3WN0Y96a+lVMQsx3+9OOhRTgvgWJM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+Wy32D9URzEZVDOOiywHbeCfKr+x4Fzz0uiC9/Mmbw=;
 b=YQsZnM7xwAdcRQ5NHufTguLSY+3w9OSiJZBq79R7XeEX/WUNXsqS9vlYohAU9TGqsSMNxGsnwcRPcwyfdo2TLoH4B82ZY8OWnjB4maRXfiVnfehvRulEZdozK8OhSdJt31Wl2tHYz1kNDGhUp2Z5KWkgNQ6T4uGzmTwY7JrmbbVfH6/mzwycMbnvWXgQ4Bd/rJskmWzvPhKMU/nqBO2Du0aNPabAhDvUvYuj8CNDEr+IfxCZ4+uyyA1wAbBGPOkjWfe6BLMm/MSRtjWr9Onx7OzzoRAKjD2Qz2Sje6vaknoR/AKqss1vmXcx/FoCZJ0EW/TA286YvQFvmXMfpZFwvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MA6PR04MB496254.eurprd04.prod.outlook.com (2603:10a6:250:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Fri, 11 Sep
 2026 14:15:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:15:07 +0000
Date: Fri, 11 Sep 2026 09:14:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Message-ID: <aqQM4rC18SoAA_KH@SMW015318>
References: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
 <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
X-ClientProxiedBy: PH7PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:510:325::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MA6PR04MB496254:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eed4f1c-e088-4bf2-45ff-08df100f14f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|11063799006|10067099003|18002099003|56012099006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HJI/YUnUoM7kU5EacQU7NrdmQKs+VtbT8OOltfrsKkgIt3vwquont9cKzWoFxPOIrcJpZaFe3wc7YKn7QXUlvG3BTOq3+h24u+KcTuKxUrXRdMIGCvuYLxTnnzhwwX+a/oL2GrOxV915z+OtyiJEINBmf+7/5rgwhkOZkZTNSWGy/Sg9CU9PiVm7DfgiSfljb82le31MQNiTDMVR8uWN7/p0A/ytkCiy6fzUlRFdrCeaDfFvsyPIHdXK6Z9cSBIbXV9SO6Rm3uo0xJ32dMLVTXmPquBHoZbadIf5feshoc3bWsPgNTPTGT6QIOD/BsRoQY200yY23SJdrYYAv1eQlXkhI///NFTxb95mQsJ2hf7ZnoKOKt2b7+XFEUSfsVEgsrV7taOeEncD0US2fER35QzWPKnBimVrzkx/gYte3ze4gC1LbXkdjMvIqYZXYnV1e6vUgrQf/6Hw/eWMCbVljBs8jXa18LMj+uzmURHdTaTcW25DxmizXwv7r8mFIOv1RL99OIGVoSF2jPGBWKrOZFwxCJYsah4j5B0Vakl5Sq9C4+ddUZCNYF+tWjUNp6kp9u6yZdpwbI9UoV2d0qml6lbmTCubWqBQm5WTRWXz68axlEKvAhxTxPYeJ7ihLyd+Ru7IzfZHkad+hwVXVtrt8XHOlJ1ihCtI+qquiUvlyd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(11063799006)(10067099003)(18002099003)(56012099006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?uwHJOOhKHAVJLAEcUL9LJ7hlwgX5i6vSZdD0S8a3YArSwz98LBAEYYvlzj?=
 =?iso-8859-1?Q?ecMuG9f9SpKfy7QhUasJzIqLlihY6qR/KHPWbVW2wME87aikeVtMlYS5UG?=
 =?iso-8859-1?Q?gLxdFjEy6H8A9sY7a1DnEHtP4YauBT/dhkkmnOJ9F0LE+SDvSnLF9M4bnA?=
 =?iso-8859-1?Q?u2NcpdTOz69+NXcrki2Caa/XsaLkyK8O2OSi7VRxRlgDzyMn+fZkC4RyXC?=
 =?iso-8859-1?Q?cTvcprIGpjqFXhRlR5dcotkRl6lwfLnAn8xyfkjqObDug5ckOOwBmnn4jb?=
 =?iso-8859-1?Q?XTsSUjmtDyP/YZAUIoi55wipV2hnmM8htHj55dtgV75laL/RLqKBHFRHqs?=
 =?iso-8859-1?Q?CB465Nexw0rBlYi+O9k/sBMXdEjxnHtJRQAfHPQduxUKS4FqFL6Fdfhvog?=
 =?iso-8859-1?Q?LK5k+AnADqRbPuBg3RZBbi4frImuusnzjhYiAYNE2yK4IyxFHL64/0I/et?=
 =?iso-8859-1?Q?frBOhysBuEpWnB/tZuMG2c7ccUtGl4NClSMm1qjAQe13N5uhVFQ1I2yhun?=
 =?iso-8859-1?Q?eFQ+V7Rql4OHdvkoz72EO2enTdODz/ww7sKgstwgQSTLk1ssxpNsY6ZNEe?=
 =?iso-8859-1?Q?IX0+W3VSuV4vJROSR1F2lpMASZtI2JQuOXIgHSbnByRY3cgLebH2sW20Nx?=
 =?iso-8859-1?Q?pimAyuT6Ws8LDZsVkBGdTdQ2oZgjw3JoqsfW5BaAVfWwwnUqFYdjTn9xxu?=
 =?iso-8859-1?Q?EFmQssSQBJthHUG28INtLTMfib/pjwvmZ09iEnGkK/TAgHkjc6Q7yNtmws?=
 =?iso-8859-1?Q?YxUJtQp7j+R+OpOlRMMgEcQzz6gGZM842XhcaU7QHgJfUeN+suOV+HG5Ww?=
 =?iso-8859-1?Q?X51gv+ySvjdRuw2H/1uvWMHqv+XKVrDUWYOfAwhJaQTj/dCxuY8OTgXG+Z?=
 =?iso-8859-1?Q?OnML4TyogUqUB6GsYkraaPxATl1WxRS53n5MSYFMAdLJUM+yEgBw7fJzuf?=
 =?iso-8859-1?Q?HHV419yi61v2yBZB6cnVhr9a7l/QjS40JJs/rZ7dfwOJfFWwttRzyyUync?=
 =?iso-8859-1?Q?Ccmqb+EbMkwe6csIcLXGvsnxWKC4+6mrd1NvamOJs8YExPoujagMNtQN4Z?=
 =?iso-8859-1?Q?kOItl6YTYqXx1+9KGg8B5ICZ0Y9CRdHmAfFYYfrH/2lARsnlSf1gKHFlW+?=
 =?iso-8859-1?Q?hghkED5N0nTqNV2tATeDWkvcK4CQkq2bWQl/WtN6wEy5RYDzTplDYIlZgj?=
 =?iso-8859-1?Q?I1LrzDAw4L6nHL2HLMGuK69llM3m1mFD3hv4Ua50j95F+ZUqhj3RjlchyV?=
 =?iso-8859-1?Q?sWWAIcM4ieM5YW5yMVlkxzT/pKjcFZeaHjxcYKHyUHaR+w/vaajsHLXByP?=
 =?iso-8859-1?Q?URNAwgzvQB2VNg/p05NhQdMWRw0iaM1EPwx36k2iLP35dWDeZ9dpb87Ar9?=
 =?iso-8859-1?Q?O1lIFLP6N4ipHef2INru4W/Tmy+rILXuYMb4VBdFidwox2/mlphiwKjb+k?=
 =?iso-8859-1?Q?iDK+tOssBo36Iv6ZekGonN+LGz2q+IGeatPbH6ZsOEv8fTe4k0uoQLz4Zo?=
 =?iso-8859-1?Q?rnSdlul65GHtOcEWOU4ZxhBxg+Dq5897xonDKOjfgnuG+L7hX5x1UhSxtB?=
 =?iso-8859-1?Q?jESSS8xNFIYMZCEAYIFqHPJwEUUErVUmcsMo5ntkxBdL2D9DDitYtlNEuH?=
 =?iso-8859-1?Q?9jCAHoweaTJ5rpx04me7ROYx1YtCEw1a0GOmueuD/McMFUjAk3SX4C1jk6?=
 =?iso-8859-1?Q?RCDSCFro0Yj1g0u9drsML6IQeANtIQNDlHWX7H5OQq25F7iZ2axuc/rkUU?=
 =?iso-8859-1?Q?lO5ptwl+bHoeYL9hte1H/Glcvp3S4Ly8IjSOtWgIMFVzTjxQHQRk3xwmBC?=
 =?iso-8859-1?Q?WgAZodTHsXqdV0ijZ1HFn+t9OeSSPC3WJiV793wj7lAo4wjiAqFM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eed4f1c-e088-4bf2-45ff-08df100f14f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:15:07.5557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiB5SepIjyBpcxNQcvUFGAsLzwxRVMu4Yhkye6ipr9FQ+cI+dwEVG4a3+IG0Wa141mRmv3kmK04ASausDs9IruKxPJay/CTKRNU6u/8QATDP6jm1aj8EGcBxiC8KU5oo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB496254

On Fri, Sep 11, 2026 at 03:11:37PM +0200, Benoît Monin wrote:
> Implement dynamic linking of scatter/gather transfers to enable
> chaining multiple DMA descriptors without stopping the channel.
> This avoids waiting for the channel to go idle if there is another
> transaction already issued.
>
> Add fsl_edma_link_sg() to dynamically link the last TCD of a previously
> issued descriptor to the first TCD of a new descriptor by setting the
> scatter/gather address and the E_SG flag, and keeping the channel active
> by clearing the DREQ bit.
>
> Also in fsl_edma_link_sg(), assign a non-zero identifier to the new
> descriptor that is stored in the EDMA_TCD_CSR_LINKCH field of the CSR
> of each TCD, after checking that the descriptors are not using channel
> linking. The use of this field (MAJORLINKCH in the datasheet) as an
> identifier for dynamic scatter/gather is suggested in the i.MX93 datasheet.
>
> When the last issued descriptor is the one currently active on the
> channel and has a single TCD, the scatter/gather address and CSR are
> also written directly to the hardware registers to ensure the link
> takes effect immediately, unless the DMA controller requires the DONE
> bit to be cleared for the CSR change to take effect. Clearing the DONE
> bit would disrupt the interrupt handler.
>
> Linking is done in fsl_edma_issue_pending(), which iterates over the
> submitted descriptors, links each one to the previously issued
> descriptor via fsl_edma_link_sg(), and then moves it to the issued
> list. This ensures that transactions are linked in the order they were
> issued. Linking of a descriptor is limited to 31 outstanding descriptors
> on the issued list so the identifier fits in the LINKCH field of the CSR
> register. The value of zero is left to identify non-linked descriptors.
>
> Update fsl_edma_xfer_desc() to avoid re-initializing the hardware when a
> transfer is already in progress, allowing seamless chaining of descriptors.
>
> Modify the transfer completion handler to check the DONE flag in the
> channel CSR before marking the transfer complete. Since this flag is only
> available on SoC with the split registers layout, only link transactions
> for DMA controllers flagged with newly added FSL_EDMA_DRV_CSR_LINKCH. This
> flag is set for eDMA3 and EDMA4 controllers which are able to perform
> dynamic scatter/gather linking.
>
> The completion handler also reaps issued descriptors whose link channel ID
> (EDMA_TCD_CSR_LINKCH) has already been passed by the hardware, marking
> them as completed even if their corresponding interrupt has been missed.
>
> Add trace event for scatter/gather linking operations.
>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl-edma-common.c | 138 ++++++++++++++++++++++++++++++++++++++++--
>  drivers/dma/fsl-edma-common.h |  11 +++-
>  drivers/dma/fsl-edma-trace.h  |   5 ++
>  3 files changed, 146 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index c5f5951c988b..76fbd2bc5154 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -55,10 +55,36 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
>  	}
>
>  	if (!fsl_chan->edesc->iscyclic) {
> -		list_del(&fsl_chan->edesc->vdesc.node);
> -		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
> +		u16 csr = edma_read_tcdreg(fsl_chan, csr);
> +		u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
> +		struct virt_dma_desc *vdesc, *tmp;
> +
> +		/* Channel is DONE when a TCD with D_REQ set completes */
> +		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
> +		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
> +			fsl_chan->status = DMA_COMPLETE;
> +		}
> +
> +		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, node) {
> +			struct fsl_edma_desc *fsl_desc = to_fsl_edma_desc(vdesc);
> +			bool id_match = (link_sg_id == fsl_desc->link_sg_id);
> +
> +			/*
> +			 * If the transfer is still running,
> +			 * don't mark as complete the current descriptor
> +			 */
> +			if (id_match && fsl_chan->status != DMA_COMPLETE)
> +				break;
> +
> +			list_del(&vdesc->node);
> +			vchan_cookie_complete(vdesc);
> +
> +			if (id_match)
> +				break;
> +		}
> +
>  		fsl_chan->edesc = NULL;
> -		fsl_chan->status = DMA_COMPLETE;
> +
>  	} else {
>  		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
>  	}
> @@ -931,14 +957,99 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
>  	if (!vdesc)
>  		return;
>  	fsl_chan->edesc = to_fsl_edma_desc(vdesc);
> -	fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> -	fsl_edma_enable_request(fsl_chan);
> -	fsl_chan->status = DMA_IN_PROGRESS;
> +
> +	if (fsl_chan->status != DMA_IN_PROGRESS) {
> +		fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> +		fsl_edma_enable_request(fsl_chan);
> +		fsl_chan->status = DMA_IN_PROGRESS;
> +	}
> +}
> +
> +static void fsl_edma_link_sg(struct fsl_edma_chan *fsl_chan, struct fsl_edma_desc *fsl_desc)
> +{
> +	u32 flags = fsl_edma_drvflags(fsl_chan);
> +	struct fsl_edma_hw_tcd *last_tcd;
> +	struct fsl_edma_desc *prev_desc;
> +	struct virt_dma_desc *vdesc;
> +	u16 last_csr;
> +
> +	lockdep_assert_held(&fsl_chan->vchan.lock);
> +
> +	if (!(flags & FSL_EDMA_DRV_CSR_LINKCH) || fsl_desc->iscyclic)
> +		return;
> +
> +	vdesc = list_last_entry_or_null(&fsl_chan->vchan.desc_issued,
> +					struct virt_dma_desc, node);
> +	if (!vdesc)
> +		return;
> +
> +	prev_desc = to_fsl_edma_desc(vdesc);
> +	if (prev_desc->iscyclic)
> +		return;
> +
> +	last_tcd = prev_desc->tcd[prev_desc->n_tcds - 1].vtcd;
> +	last_csr = fsl_edma_get_tcd_to_cpu(fsl_chan, last_tcd, csr);
> +
> +	for (unsigned int i = 0; i < fsl_desc->n_tcds; i++) {
> +		struct fsl_edma_hw_tcd *tcd = fsl_desc->tcd[i].vtcd;
> +
> +		if (fsl_edma_get_tcd_to_cpu(fsl_chan, tcd, csr) & EDMA_TCD_CSR_E_LINK)
> +			return;
> +	}
> +
> +	if (!(last_csr & EDMA_TCD_CSR_D_REQ) ||
> +	    last_csr & EDMA_TCD_CSR_E_LINK)
> +		return;
> +
> +	/* Set a non-zero linked SG identifier to all TCD of the new descriptor */
> +	fsl_chan->link_sg_id++;
> +	if (fsl_chan->link_sg_id > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> +		fsl_chan->link_sg_id = 1;
> +
> +	fsl_desc->link_sg_id = fsl_chan->link_sg_id;
> +
> +	for (unsigned int i = 0; i < fsl_desc->n_tcds; i++) {
> +		struct fsl_edma_hw_tcd *tcd = fsl_desc->tcd[i].vtcd;
> +		u16 csr = fsl_edma_get_tcd_to_cpu(fsl_chan, tcd, csr);
> +
> +		csr |= FIELD_PREP(EDMA_TCD_CSR_LINKCH, fsl_chan->link_sg_id);
> +		fsl_edma_set_tcd_to_le(fsl_chan, tcd, csr, csr);
> +	}
> +
> +	/*
> +	 * Set DLAST_SGA before enabling E_SG in CSR: if the DMA engine
> +	 * only picks up the former, it updates DADDR at end of transfer,
> +	 * which is not reused.
> +	 */
> +	fsl_edma_set_tcd_to_le(fsl_chan, last_tcd, fsl_desc->tcd[0].ptcd, dlast_sga);
> +
> +	dma_wmb();
> +
> +	last_csr &= ~EDMA_TCD_CSR_D_REQ;
> +	last_csr |= EDMA_TCD_CSR_E_SG;
> +	fsl_edma_set_tcd_to_le(fsl_chan, last_tcd, last_csr, csr);
> +
> +	/*
> +	 * Update the registers if the engine already loaded the TCD,
> +	 * unless doing so requires clearing the DONE bit, as that could
> +	 * lead to lost completion.
> +	 */
> +	if (prev_desc == fsl_chan->edesc &&
> +	    prev_desc->n_tcds == 1 &&
> +	    !(flags & FSL_EDMA_DRV_CLEAR_DONE_E_SG)) {
> +		edma_cp_tcd_to_reg(fsl_chan, last_tcd, dlast_sga);
> +		edma_cp_tcd_to_reg(fsl_chan, last_tcd, csr);
> +	}
> +
> +	trace_edma_link_sg(fsl_chan, last_tcd);
>  }
>
>  void fsl_edma_issue_pending(struct dma_chan *chan)
>  {
>  	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
> +	struct virt_dma_desc *vdesc, *tmp;
> +	size_t issued_count = 0;
> +	struct list_head *pos;
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
> @@ -949,6 +1060,21 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
>  		return;
>  	}
>
> +	/* Count the issued desc up to the maximum number of linked SG id */
> +	list_for_each(pos, &fsl_chan->vchan.desc_issued) {
> +		if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> +			break;
> +	}
> +
> +	/* Link the SG descriptors with the available identifiers */
> +	list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_submitted, node) {
> +		if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> +			break;
> +		fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));
> +		list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issued);
> +	}
> +
> +	/* Issue the rest of the descriptors unlinked */
>  	if (vchan_issue_pending(&fsl_chan->vchan) && !fsl_chan->edesc)
>  		fsl_edma_xfer_desc(fsl_chan);
>
> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
> index 0d028048701d..cbb077e98f55 100644
> --- a/drivers/dma/fsl-edma-common.h
> +++ b/drivers/dma/fsl-edma-common.h
> @@ -42,6 +42,7 @@
>  #define EDMA_TCD_CSR_E_LINK		BIT(5)
>  #define EDMA_TCD_CSR_ACTIVE		BIT(6)
>  #define EDMA_TCD_CSR_DONE		BIT(7)
> +#define EDMA_TCD_CSR_LINKCH		GENMASK(12, 8)
>
>  #define EDMA_V3_TCD_NBYTES_MLOFF_NBYTES(x) ((x) & GENMASK(9, 0))
>  #define EDMA_V3_TCD_NBYTES_MLOFF(x)        (x << 10)
> @@ -169,6 +170,7 @@ struct fsl_edma_chan {
>  	struct dma_slave_config		cfg;
>  	u32				attr;
>  	bool                            is_sw;
> +	u8				link_sg_id;
>  	struct dma_pool			*tcd_pool;
>  	dma_addr_t			dma_dev_addr;
>  	u32				dma_dev_size;
> @@ -199,6 +201,7 @@ struct fsl_edma_desc {
>  	struct virt_dma_desc		vdesc;
>  	struct fsl_edma_chan		*echan;
>  	bool				iscyclic;
> +	u8				link_sg_id;
>  	enum dma_transfer_direction	dirn;
>  	unsigned int			n_tcds;
>  	struct fsl_edma_sw_tcd		tcd[];
> @@ -225,6 +228,8 @@ struct fsl_edma_desc {
>  #define FSL_EDMA_DRV_TCD64		BIT(15)
>  /* All channel ERR IRQ share one IRQ line */
>  #define FSL_EDMA_DRV_ERRIRQ_SHARE       BIT(16)
> +/* Major link channel in CSR used for linking SG descriptors */
> +#define FSL_EDMA_DRV_CSR_LINKCH		BIT(17)
>
>
>  #define FSL_EDMA_DRV_EDMA3	(FSL_EDMA_DRV_SPLIT_REG |	\
> @@ -232,13 +237,15 @@ struct fsl_edma_desc {
>  				 FSL_EDMA_DRV_DEV_TO_DEV |	\
>  				 FSL_EDMA_DRV_ALIGN_64BYTE |	\
>  				 FSL_EDMA_DRV_CLEAR_DONE_E_SG |	\
> -				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
> +				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK |	\
> +				 FSL_EDMA_DRV_CSR_LINKCH)
>
>  #define FSL_EDMA_DRV_EDMA4	(FSL_EDMA_DRV_SPLIT_REG |	\
>  				 FSL_EDMA_DRV_BUS_8BYTE |	\
>  				 FSL_EDMA_DRV_DEV_TO_DEV |	\
>  				 FSL_EDMA_DRV_ALIGN_64BYTE |	\
> -				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
> +				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK |	\
> +				 FSL_EDMA_DRV_CSR_LINKCH)
>
>  struct fsl_edma_drvdata {
>  	u32			dmamuxs; /* only used before v3 */
> diff --git a/drivers/dma/fsl-edma-trace.h b/drivers/dma/fsl-edma-trace.h
> index 45d964a3726d..f4b0021d2bd0 100644
> --- a/drivers/dma/fsl-edma-trace.h
> +++ b/drivers/dma/fsl-edma-trace.h
> @@ -121,6 +121,11 @@ DEFINE_EVENT(edma_log_tcd, edma_fill_tcd,
>  	TP_ARGS(chan, tcd)
>  );
>
> +DEFINE_EVENT(edma_log_tcd, edma_link_sg,
> +	     TP_PROTO(struct fsl_edma_chan *chan, void *tcd),
> +	     TP_ARGS(chan, tcd)
> +);
> +
>  #endif
>
>  /* this part must be outside header guard */
>
> --
> 2.55.0
>
