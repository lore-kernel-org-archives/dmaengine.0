Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D73AEF3D;
	Tue,  4 Aug 2026 21:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880060; cv=fail; b=l+MFtMERtZSNkvsyJad2FDUvRt8vtmLQTsA6BqQcXdI4LG+r5c1GUSb/g4dbRMvScLwBg2i/Gnq0jNz0SyUA1VusEx7Ye9KpcmvXVB3n4KjeCictQYOf+P7gD/1DJ7NBctJWwd3gz6swS58kpIz+zFulIGIMA0/GNyYohcnxI78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880060; c=relaxed/simple;
	bh=/UAlmBTpWUm2aMLvf2EElPpXvWhZnzSIte++/RcTG2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=caSevf2EntZDs0YmNB1ze4HrdtkDo93tBQ9eqArjAiMERKrmtFUESm+74ADnRRF5t+cyGkFM7rY+Ji88en0YVyULCFUDVnPho3HpZHtMUcY60TfIcdHxZUAY1IAjYaS2tcKR56BKm9LW+fUuNMLeJGcxA5UiUsq0bms/0pwNOZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XPOmsCtQ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XPOmsCtQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7OCPvuxjqT8MCft33gxR5ErQPLg5SOI8VmogRVuoKdZJxUov9JpD50eJdkCcn20LMAwpG5XCRq99DwhWbExDtp8+WJ5H8kiGKEYd5wXHZlUwoorpwc7szB84Sc3LPCyVMXwTKxbo74MHP3qONcEpoUDSBx6Lb72R9TcOVAt5P6j3ObKVDP0SL1Ctp8wViQbkYBugbdOEwr7WLOPsdywUFamfjQGc9Oz3PPnEedPSPBDAvBottVI6adof1is74AFqOW4VbkUu8VOrS8z91jzrKKlcmHWrcr6uJF0gQkC8d59vnD8Jap/5LQmv/kPwCtzeLZMOCZLCamSx6STKXdKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJndtq7Pr4bDdxK4YJozF6bETjSU41mYi+tOvkCf3lU=;
 b=Dsi3nJCqMFpzQsVAhA181Fg0KTMcEK90PlLc1dqpuhOs7n6GrGv4GV7tZr/U+xv4Fnovd1TeXqqGq/1AAxg4ks0y+jy+0oqrmv26Hsltcn4ctzm68/rQSxFtPH5lBCEeyVXIylCHA5DcnX2Efb9rfdZqpxA0LBMp1bMOMHrKLGY2odGLWsCgLW0cLA5vxANPCzVbYnEZtto9D6KLHBUDZIMm19kSGTjXjFhCl2EUW6iRpGQSFN5XNNGMxjEstyz5uZzZY2nJ1Ao9AIjf1WdpdnhMnZN5x0jQe3EUCYt/glGnJlmkTT2LIYj3Yz3U9XgzoyTLL0VZNx1h+NXg4RkbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJndtq7Pr4bDdxK4YJozF6bETjSU41mYi+tOvkCf3lU=;
 b=XPOmsCtQrbw21MJIcYXAdND4OZTX+WVIuHCHdzqWFIf7+eJjhZgQTSSs2PnaUDsGmJqp6W3XRwGv2++UphtnIJ3TeqJhQqFXVEFsb3Shulrv7ZCuHvxdqjO6VJVCFuyO/evEJb5Eb4SvO7G4YvcYuU2ytB81hP7Rx5hqGEOGjLMnHH0QsJHyepaIJStItLoh+CnKaZVO9To3Y8uth5ZA+KGy/LUP/Mb+1/cGo2b2wF6rhSsYwilEf3dY9ehZrY7Xuc1qfKdNQzZE9Ql/f2ni06EV4iuqGx+WErFJIXypcsD1d1V2/KQzYwIlAPHK3Nl1kJFyvL9jga7XmdDo/3+dHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6810.eurprd04.prod.outlook.com (2603:10a6:10:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 21:47:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 21:47:34 +0000
Date: Tue, 4 Aug 2026 16:47:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Message-ID: <anJd7dVNnDlqys0e@SMW015318>
References: <20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com>
 <20260803-fsl-edma-dyn-sg-v8-2-dc2b0317206d@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803-fsl-edma-dyn-sg-v8-2-dc2b0317206d@bootlin.com>
X-ClientProxiedBy: PH8P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: bd935fa6-a85e-4446-0468-08def271fe1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Hlv9RSW1aWxbRPaal0oLisL9XXM+kvYnV27CV/AYnpBikDrjijj5mrC09fo3XnLmhfrNbVNEattKQYgUlOD57ZkTlw5LZ49MNqv8A7Pm0UWCuBXXJrhGAyd4aQ+F+9PVD9qOmg3RaKCvi4UtZJQPKxit7a0JrtZzIhTLsuj9R2kMuePEUqoWm6zb0nc9aldh4yO9D0hq+P5FFErSNb/NXu3PM/R9MsbLpR0W8Vnk789SMrmpRU618HjZpu955YGl4jnDGGFu3il2+3+XwlXYp0KAe+2SQMIsXYi4EvW+gy6K8APcIiVI7K1sf6sZVUOv3QVHSkH+EDWZvCgu0VIudioGTu+dQNPpw0b6Ge+kcg4hGUljiXnDNYrdP7/O5qOk83eFnWyFFbSb7+eUMXFogl5MSnDSISGKHd7BrvgdsHBYw854E/bvfP63SsO2Z19a84VNN1PdgCC9p8qKQk79LI7yqbdD82ijS9h8l/SXtwyBsUaWNnnOW2L2PgnLOjaBsMXu2F4d63ut9IRGAjZD8wqr0Cc4TqWsTn+Tbdd0kp50ffaa7Z0r/tH4s7WiLzVixfbX4UHXGlKNVxgMaSBX7x7ZikzBHsUyHZlbR+jem+op0k9u3eUaLgOCw4w7jBI56IIniFdyPZyfvYAc+/ZUqc1zkiyEeYiW9sUNfDKzfDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pfm4kpCETGmJe4UDhNaieKGGwDqgI1PB9Y6XMhdYrT9EhSkmZXxruFYKKQ?=
 =?iso-8859-1?Q?VKJRWY0sxYyBedi26JgsSuxOrEl6OCq+fR9PrQ5FCZP0tqM+ZNVO1B6xa6?=
 =?iso-8859-1?Q?rshjMO+FAsCK5+7I5qjUR347UXBxPKD6Oj3iViyk2f4RWOcXOT+cEojpsB?=
 =?iso-8859-1?Q?ZAKGgqjLh8uCpCPb4GtNpa7Vg9LLsNREc8ODNQWMW5rd+KgheiHtDa5DLG?=
 =?iso-8859-1?Q?HGd86iVU10ynZKD7NxJsiWA44PtgwGb7wR9VGwPMpzPV+8Cxi0ODDtD3nF?=
 =?iso-8859-1?Q?/bTwwoUrcN+GOmzGQVfUo20vGHbqFzYtZUFpzZWbMGyEwBDQYk1Br1Ww/p?=
 =?iso-8859-1?Q?aIXDjEIl/Ib/AJSIKPrEXxvYIT8Ju8YKw95eNN7QgetnlaBhTmz83Bc/lE?=
 =?iso-8859-1?Q?j9qySByS9r4I3H56oEiqoRS2SgmbGS+Xtn9hudYEj03LEaQdh63A22RRnA?=
 =?iso-8859-1?Q?Cl5k9f/0hvnYG1IowgNPly4ph2W0TV1REidsw+Cy++oOEXLgXEi1KMzCch?=
 =?iso-8859-1?Q?WOCucipq7FKmAASE67Kd1BqXuWsVqVFNnvH53qPGn9d9T1Oo4YR9gHzACo?=
 =?iso-8859-1?Q?MiIlURynnyaS08jEPEo59ynFtxWC3VfESlREOAVdJKzDMhhsQYw0f4wDxb?=
 =?iso-8859-1?Q?kIlPsshBwV81KEwacgsD5235mdoE1tjU4QvIJ/T/uypgJ0+iggGTKVY9VB?=
 =?iso-8859-1?Q?IkX0xk3s9Zf1Qan6PvbdZRTlm8QxzqZq1ZOFIPqZ9ePkn2HMN5m2ed4KZJ?=
 =?iso-8859-1?Q?7BSnUNrxFV7jXFDG2dOLWv9nI1QWQRVIWqHUhoVRCDDjSyhxhJgy7ig7dr?=
 =?iso-8859-1?Q?jj0h2nV3oELrEbCpXCdB/OFD5/6KJI6lodhQG4X8rgKcB7JCybT1dbISZb?=
 =?iso-8859-1?Q?gAo1pNw0yM1WPrxP7xD1lWXhTfYv9RG5q0OP/5cZ+Sp0XYn6WpczUvOJL4?=
 =?iso-8859-1?Q?XJcI/ZOBMvcPiqV06YZqkodAyeroiayMYhTmRu2AjR85L7LfUHH6ncryxR?=
 =?iso-8859-1?Q?aQQvxIEgKZsHZpITr4lCXZ7YbVNHXGcyCXWgK5+NLyslhP4kDsm258383b?=
 =?iso-8859-1?Q?wGpb6hPptYHQGNfOlXLgkjsfR6O6OtYWj3HEt7XhB4ZzgpjNuZA9Lf4aET?=
 =?iso-8859-1?Q?wZul9rcVNc1sfcTSmxwhvKNRtVhs6LecWcAbR4SzKesMFQQlSonyjhl1zf?=
 =?iso-8859-1?Q?T5D7mOu/YtChhZrrgJ1XFHc/mtisy50i1TGfuE3OJN6Gz9xordQdlED1OS?=
 =?iso-8859-1?Q?s5zsCYdv6ICOLMQ9er+NblbokZXPlASIV7uEyANq3XhFZftCHxPH+XPLHC?=
 =?iso-8859-1?Q?jViHp1roxcyTpRf0uSCf1Ca4iuSfd/Dw2JtCBSpGy4LcOKB4ks8W38ObRp?=
 =?iso-8859-1?Q?XO28mXnxaeYmqoSUV966Hmk8mpHFfIfOVdJC7u68YsXsm3OkwDq1m1fJq5?=
 =?iso-8859-1?Q?DrYa/bBkWOtOTpdKekqAWq1MTHmD7JrZyXSTywXdYpMETmxKv5/k3WBp4L?=
 =?iso-8859-1?Q?B6aYS5n+3ontPhjHabBD787I/VLHC20Mmkm7lSO8MF7SSq4ORkFzOJ8NIs?=
 =?iso-8859-1?Q?Mx+q10hCJ9kD73mRidamjgXmPAkOWJ+Un755VmhYZlbh5uV/rzAa1ysw5P?=
 =?iso-8859-1?Q?BuUKgSs34r0xWRnRZifZ1zq4NH9KIMrHyxsAu69XE79VKfj+mEqatT4CAc?=
 =?iso-8859-1?Q?kMa4Qb1ntcR+/WXgSiEHfxFALrPw2jeytxbakDAXpsiE5Kkf//Vb4BR2kC?=
 =?iso-8859-1?Q?nOt9m0vsZYBWCG5R3ZdR7cLH+WYAX/VwiHJ5B3k9ZSYjj5CEUTAblGRjKG?=
 =?iso-8859-1?Q?osyb6VNCZGGesRo2I+4ca6uETn+jCDQiZ0ddCFPr02vlLQ3sewZ1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd935fa6-a85e-4446-0468-08def271fe1b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 21:47:34.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTyDleYB5CE+QeHRP1IVaiM0mTN8xFCXngYpwwxbna4E/EmGvwYLd7nkEsbqS76Cj0kCBi+N+ay3Zs1PmULyC/qIbAZaFuO93tDZlnTzM8ZoIoMTergg3NDrfxYiqX0D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6810

On Mon, Aug 03, 2026 at 06:02:01PM +0200, Benoît Monin wrote:
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
> Also in fsl_edma_link_sg(), we assign a non-zero identifier to the new

Nit: remove "we"

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
> channel CSR before marking the transfer complete. Since this flag is
> only available on SoC with the split registers layout, we only link

Nit" remove "We only".

> transactions for DMA controllers flagged with FSL_EDMA_DRV_SPLIT_REG.

suggest use new flags such as FSL_EDMA_DRV_CSR_LINKCH

>
> The completion handler also reaps issued descriptors whose link channel ID
> (EDMA_TCD_CSR_LINKCH) has already been passed by the hardware, marking
> them as completed even if their corresponding interrupt has been missed.
>
> Add trace event for scatter/gather linking operations.
>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/dma/fsl-edma-common.c | 125 +++++++++++++++++++++++++++++++++++++++---
>  drivers/dma/fsl-edma-common.h |   3 +
>  drivers/dma/fsl-edma-trace.h  |   5 ++
>  3 files changed, 126 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index c5f5951c988b..189eb9d1269e 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -55,10 +55,37 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
>  	}
>
>  	if (!fsl_chan->edesc->iscyclic) {
> -		list_del(&fsl_chan->edesc->vdesc.node);
> -		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
> +		u16 csr = edma_read_tcdreg(fsl_chan, csr);
> +		u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
> +		bool e_link = FIELD_GET(EDMA_TCD_CSR_E_LINK, csr);

Are you sure check e_link, suppose you reuse MAJORLINKCH, e_link should be
0 always.

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

good idea for using link_sg_id.

> +
> +			/*
> +			 * If the transfer is still running,
> +			 * don't mark as complete the current descriptor
> +			 */
> +			if ((e_link || id_match) && fsl_chan->status != DMA_COMPLETE)
> +				break;
> +
> +			list_del(&vdesc->node);
> +			vchan_cookie_complete(vdesc);
> +
> +			if (e_link || id_match)
> +				break;
> +		}
> +
>  		fsl_chan->edesc = NULL;
> -		fsl_chan->status = DMA_COMPLETE;
> +
>  	} else {
>  		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
>  	}
> @@ -931,14 +958,93 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
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
> +	if (!(flags & FSL_EDMA_DRV_SPLIT_REG) || fsl_desc->iscyclic)
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
> +	    last_csr & EDMA_TCD_CSR_E_LINK ||
> +	    list_count_nodes(&fsl_chan->vchan.desc_issued) >= FIELD_MAX(EDMA_TCD_CSR_LINKCH))
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
> +	if (prev_desc == fsl_chan->edesc &&
> +	    prev_desc->n_tcds == 1 &&

What means here of check?

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
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
> @@ -949,7 +1055,12 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
>  		return;
>  	}
>
> -	if (vchan_issue_pending(&fsl_chan->vchan) && !fsl_chan->edesc)
> +	list_for_each_entry_[Isafe(vdesc, tmp, &fsl_chan->vchan.desc_submitted, node) {
> +		fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));

if > 32, hardware have not link vdesc, move it desc_issued list. for example

desc_issue have 64, only first 31 put to tcd, where put last 33 to tcd?

Frank

> +		list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issued);
> +	}
> +
> +	if (!list_empty(&fsl_chan->vchan.desc_issued) && !fsl_chan->edesc)
>  		fsl_edma_xfer_desc(fsl_chan);
>
>  	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
> index 0d028048701d..ab7ec43f93cf 100644
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
> diff --git a/drivers/dma/fsl-edma-trace.h b/drivers/dma/fsl-edma-trace.h
> index d3541301a247..ac319d2dbb90 100644
> --- a/drivers/dma/fsl-edma-trace.h
> +++ b/drivers/dma/fsl-edma-trace.h
> @@ -119,6 +119,11 @@ DEFINE_EVENT(edma_log_tcd, edma_fill_tcd,
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
