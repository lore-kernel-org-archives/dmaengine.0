Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793130310;
	b=wrK8/6YoGBz9IvEdW9haOwXzdt3AaIc5mAnoFEUEE0/SAkRLJndFKJAFjLV/nqs4I+M0
	 yKpIT5DtDjp1bg1MKKClgUMNWYecemTCb2Uwse3rmk0rxFdGGuHM681atucI+eSlmU/9V
	 FC8Ysm6BLffKIgod+khk6vjd2xyUL+CtDfWTyNBNmAjzMUq0KMo0XnMmkvXG125vBbe8q
	 xWn02ZYIBrbDiY+TV0gayBeCmUDdV1YZNQJPMWl/sxFgQJ/POjMyP6CvGvvrRDhFfmU+y
	 H1RQ8GZ8dRPHgOgyxOh7dRfQs+bKg+IZCApY2EVbqGu83gsMl+zV9Nw29ybPygOuG9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130310;
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
	bh=oErQvoyWidPnf1wzEqiUOymqZMAm4Mju+7g7K+LFqdM=;
	b=u3BbGstHrd9kR5CBBzHVHY8fSNTmpQ2VC8poeW0U8r6nZkl2DA2TEMACnnGZo9Zw3KUw
	 9+nFIFJhc9W8IFnjueD0A2daztAhT9jwQ6/3D9UXikPpOGws4/bY0iFtoZPpPvSU0BwYi
	 C+Lzn2KIe9uSyuS+3pAyy0BSS+Dzn+Y/DABpkBVekT8r0aF+hvrNYGCJGq7Ro/c9NtICv
	 vAcOZr9APA7nY15NEDdm1EEKjTYcZFlnXEbGT5+wjP9txNZissCo4E6/SHX6+TdDayVhW
	 KQbETX3zYBuqkGTm6NYp2kQnk1FIxGU8aslelKRGfC6h0IPzXyCnNKAHD8lLcW0MJgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZXBAxQLy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.24
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3E606A321;
	Tue, 27 Oct 2026 19:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA3E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZXBAxQLy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5lP6AEKQZIb9qGhf5ZPvMtSoA81piwYSEs7qYrOFS9cCQhFpDpVsBH6jaVbsxUvwDTmUGP/1ECA6To89MiBx2VOp7QK6eTWgQrCRs3aUpwQI/JEFF5Wvhq+6PW5TmRhrRbRHRPqbbeiCgVOBhT1QLDgSnG5zhQDJcqATmols74uVa766yvLujkVK69Ywhhg1gkwERkjWXQe3KP01Uo9u/8yuBDSj38rBdMasMl9NwdWjwyAo/8FzaZaVF3mlAV9m/OZK980StPQ+mYPEqxo/Iv78Pe8ccKq4LrMhFsoT1RGcNwXH7gHGIeV6mm6p8kYBeIklAepO0tiNH2E8auRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oErQvoyWidPnf1wzEqiUOymqZMAm4Mju+7g7K+LFqdM=;
 b=xbtFVNU+zHEC4AbY63hQ8b1zXT34ecZpAuMdlWvMXQS9yQaGs2EKGMfHfiHPCcmybjTj97/QmaEbkJLz4Bm0LQS3zIu86cXHEcOXeUSEWFhQQy79Cuvy8HcRfOtqYkaT7fv6GaT0G3o659fbVMe1YQ3XBdPNMaeTfQuaLS/T46Z9zwknDc6+qaAjRMqiSQ7f5gmTSeiDZ2yH3AKHidRWWjBcobmt/RYFLGyT/aeG1LUIzxY0R3BEN6yUJsx+fZm+pCCL2kijY+so7GPVHNPxAnYNFJvn5YTqp7K4Inlabue+Ua1bkNqnpOexHjXXLIPSe9jWbZUiKz3Zf7qCV0RR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oErQvoyWidPnf1wzEqiUOymqZMAm4Mju+7g7K+LFqdM=;
 b=ZXBAxQLyzz8eGoOIIRnNDX3xI6npimaDRPPC0VC0H8XdHzN9W24sqqSxIsMNaN5Ht1SoPUeL5dVX0fjicVNoFRgdA5qjSZfSJ1O922uxBcPrZeuTTzkK9o+HTfTuXBUridyLHybM9zHk5k3DYv30DlnwfYsE7xR4fFHAyNew8/8GVLnZvF0DqOSydojY0xTbslD+BwXq48CpmUcQFgQ3frgOzZBddiTLkfoPJs5Mwehyqoc9H5Hc2wYwJiPZnkLuYT9W+LsbXoV3x4RgK488W+DspbRwAKtKT8q9+RZe5xXDxTJ/5Iku98w/BZoKB8tpsf0U5QzEjSbWwtdb3BnlWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB8PR04MB6954.eurprd04.prod.outlook.com (2603:10a6:10:11c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:45:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:45:06 +0000
Date: Tue, 27 Oct 2026 15:44:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx: dpdma: Fix crash on zero-length
 cyclic transfer
Message-ID: <auD_OiHTRaig1Q0A@lizhi-Precision-Tower-5810>
References: <20261023065900.3455414-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023065900.3455414-1-lixicaicai@gmail.com>
X-ClientProxiedBy: PH7P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB8PR04MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 118291d7-674f-4ef4-849b-08df3462cd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|18002099003|6133799003|22082099003|261026121527099003|56012099006|10067099003|261022105027099003|261009223027099003|11063799006|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	92XdyHUU2fIdLTqiGUtG7d7/j9Zo5kB5IoM1gQPZKkAZUudDbu3Y4r6ncKQbrG2DTM0QzTx50BztbxxViU5t9yMXyKJlWZ5IcX33o9HmMfdRdx/r8u0cVqwXGkjccsrx0u5N3erkoUpkETKTveQ0JuSRftdotF5OO+XkfPRzja8V2ZdT77p4jXYf50U7gO/xXEgvK/NlrKM4RBZgyjDTGnwx9FYac4DvaTgAA3Gd+vs+iNzjgbkAVnT2RXeTaQ75uSt9g4q1lvZbEcv7Ua8zT30bRyhgSjIsVszAWMgsbNK2nm6BmfT1NCFRhI8KJ8zpjVfREWyGTDeyFUd1T3FxUYpTRXjS8OA3NZ1C35SHxXJ/ImAT3Caf3+KY1AmB53dhBD9E1U/7pWjOrkNuYaLYCEs8rT64EBpJj/7bjbraD11twb7KYEs40Yrv+YtNtcvlYlCWeibQcMrQFAiwmSnaAdN0PBIqh8TfOS5jUenqzaN/CheZhbXtXDXzJNrGeDcDTgEBKLPvZIA7m7Mpzd1nY4azAHlr4nizx8aCTO3JcEIonCRj7WXjF9irvEd+0keQSPYv1YScW60ONfKAu5208SSuAKQyLqqWZFfFqgEK4SoUzIKRXgwmf+9YgGGjXlLnrOpbudqOjfrhELE8lOvh/FYxKA/9JfK86Q20h9uqwT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(18002099003)(6133799003)(22082099003)(261026121527099003)(56012099006)(10067099003)(261022105027099003)(261009223027099003)(11063799006)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PUeqJQH4mXuhwOVADMN5BDZFLys9AC0OIhcP1hbrxdmWOpB1FLRnrSZ4SUxR?=
 =?us-ascii?Q?HLUJ4Lem0Cn+bfbxC6Sb9wMAAKd1BFvuaseacHEtaDHj3A6KIywnlJKD2RgD?=
 =?us-ascii?Q?4qy2bwXslC4Ga9aac+w2PSMSsLy3ZCSX1lcw9ywaNA9Eu38bA9F8JgYdQeDg?=
 =?us-ascii?Q?BxowNqhATX/tFVq71BNuw8WIwaEKtgOt3lEkdYn/MhIqwFq5mZNWx8WT8tWP?=
 =?us-ascii?Q?uhm9RhXP0cknOQ2e3nDdnmylldacxM6wDIhcMzmPrfhuW+0a0nIXrdNjvAgq?=
 =?us-ascii?Q?63rCWACQv/F1PGcVP9g/5Aek1tZTG2sUQuAGaLRrnFz+tMkxQKj5i9oP9vFv?=
 =?us-ascii?Q?kuCpDoEHzg1y3aTKRl+an1TQhdkrNUX/jPNIHKZF1DQIwSYjRuO4LS5waYMS?=
 =?us-ascii?Q?ZiPTZK2/CwfVK1l8DYgcBT8cEPGO8xDQAt2P3ecn8n61vj0f9vC5OGF2I79K?=
 =?us-ascii?Q?jbTnfQ8qvnks4nhAzZH2THBSOhXGau3cgwp83g2B1gBmlIoCnDamVwJpVQi/?=
 =?us-ascii?Q?m4aoZL2zploCXJ7CSlDgtf612c08Pxyihe7JSs19R0bgQy+hMnVWSn9eS+u9?=
 =?us-ascii?Q?l5Rnvcl2nRpUfU3XgahzlrMlxE59Lc9yHoWJQqzmc0bMcpGK9/IY1BJsoJnT?=
 =?us-ascii?Q?w05IjRfTBjFieXpW7WnGnvHoFyJWk911cdb7fWcR9iOM1ahlljCUHk8YGKPF?=
 =?us-ascii?Q?GFdIcWZQ93oRtk+QxN42OH4RrP76AnDnGA9GeRwBQqzpV3o3aOfyVuIZYDnt?=
 =?us-ascii?Q?WB9tvLNOb09fanEPJPqr0M8+y5rx27y2AoFWOfyEpKxjsDqxqbF/oZ06M9Ts?=
 =?us-ascii?Q?+qqfIXUF/ctUyW0SijCqutxPQCTtfqcpwIzRX8FhQbQlV4J4J1jXGa+ZVVp5?=
 =?us-ascii?Q?/U1dwPTKqX6gV3CrNbv0CQQv7jOp9EFf1U8ym/PGu4KzuSGg/8BQz1wrhLd8?=
 =?us-ascii?Q?qxTzLvvLUiw7Xolo/2CP7+qsX6eIeJAPRxb5BlsF54KQs5O9nMtHeuK2BT4Z?=
 =?us-ascii?Q?U09ghpWyS++f75Pvs7EyhDn0TAiEsVKJzHqqlJWBRawO76i/X1ZByF+wu976?=
 =?us-ascii?Q?gXllA4I/9ZnIcEgt7CvJoc6XIq8KYm5chVcFcqic/GBsLVllKCV8xK6GuDWm?=
 =?us-ascii?Q?ZgJlKAIhr33AcJ51KC2dAqJKmVuyLkJNp7AD1tO46SRYbGw7sHlX3fY9NagD?=
 =?us-ascii?Q?S+OAWOOUmuS0ojqb4doB2wDTvsBsra22Qp8dvHkQ0cWeo/DbTMNrSXXV/ROp?=
 =?us-ascii?Q?nDjza0ijnYBTOitY3qe5XDt9nmWdbmA6YG8lXYriy3AgoXs12VKeBF3iwdRN?=
 =?us-ascii?Q?cN6rtR/7LuJ1yYCLwj/nUNsp1WZmWUw6sKXql9Q+1SQxEfRBSWFQ4t3H5CLU?=
 =?us-ascii?Q?yP0ZY4qkgy4QvRo2Y3w5e+nu0n9U0NbIWPVFj80+jGn5TugNPpaob7mfrzUf?=
 =?us-ascii?Q?T4z82t7W1cTUdSP62wyjRnm2sMCoADt/pHvAcl/+yaT+TFbfYngWny0x2KAO?=
 =?us-ascii?Q?9AO6FIDMxw3rxhdXRkepyr23cMAJE+RgFClTZ6OX5m5jW7gmN2f9X06Fy7ud?=
 =?us-ascii?Q?pmDDDBWzL3O6e1VcGXne4gP1dmA2asDMjhU8jYViYnQlNP5+67FWO5B7yq7o?=
 =?us-ascii?Q?TwpGMQJcebubqmE2B2M7VpixxecNzrn2/mnyVz59SzTRDEK6IeUHUUw81utt?=
 =?us-ascii?Q?2c/9avlivpjndZeQzqH1KVniTjDFNeNQfc45sqpe4GItC5RsLM8Qi2jJprNO?=
 =?us-ascii?Q?aJOT/mPz1XBdlLfhRi3LptdylDQ/lfs/q5u+Wt8OKupNZTA3/o56?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118291d7-674f-4ef4-849b-08df3462cd22
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:45:06.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVj+4TOUTmVndqTgxBOQlSblZwIJ535yAHU0cnhKezITKYaS0kKBZ93DX9Cu/E9ViE5G9aL65I9Ru9edSIbDHsA6OnH7e5pe2a/b0VkDhc9NmbPNi2DVCEtWaP+K9JL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6954

On Fri, Oct 23, 2026 at 02:59:00PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> list_first_entry() does not return NULL when the list is empty; it
> returns the result of container_of() on the list head, i.e. a wild
> pointer rather than a valid entry. This was found by code audit.
>
> In xilinx_dpdma_chan_prep_cyclic(), periods is computed as
> buf_len / period_len. When buf_len is 0, the wrapper
> xilinx_dpdma_prep_dma_cyclic() does not reject the request: it only
> checks buf_len % period_len, and 0 % period_len == 0 passes. The
> build loop then never executes, leaving tx_desc->descriptors empty
> and 'last' still NULL. The unconditional list_first_entry() on the
> empty list returns a wild pointer, and the immediately following
> last->hw.next_desc write dereferences NULL, so a zero-length cyclic
> request leads to a near-guaranteed kernel oops (plus an out-of-bounds
> read of sw_desc->dma_addr through the wild pointer).
>
> Bail out through the existing error path (freeing the tx descriptor
> and returning NULL) when the descriptor list is still empty after the
> build loop. A non-empty list also implies that the loop ran at least
> once, so 'last' is guaranteed to be valid as well.

Can you use simple words to descript this problem

dmaengine: xilinx: dpdma: fix crash on zero-length cyclic transfer

When buf_len is zero, the descriptor build loop never runs, leaving the
descriptor list empty. The following list_first_entry() on the empty list
returns a bad pointer and causes a kernel oops.

Return NULL if the descriptor list is empty after the loop.

Frank

>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>  drivers/dma/xilinx/xilinx_dpdma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4..bdfa85b80 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_chan *chan,
>  		last = sw_desc;
>  	}
>
> +	if (list_empty(&tx_desc->descriptors))
> +		goto error;
> +
>  	sw_desc = list_first_entry(&tx_desc->descriptors,
>  				   struct xilinx_dpdma_sw_desc, node);
>  	last->hw.next_desc = lower_32_bits(sw_desc->dma_addr);
> --
> 2.30.2
>
