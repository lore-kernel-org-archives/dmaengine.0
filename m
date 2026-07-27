Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3FC245020;
	Mon, 27 Jul 2026 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179485; cv=fail; b=egA9COLGu4QGo1pl4qugzby9QiOXZKGoYBR/UMxX0gPlSAe2BXzcqQ8Nm8u+qkDjF2jbybKnA8RfDt9sk/YbqdYi08uiBuL43mdVnMkt4kA3rVXINDjzcQAviZwETZO1Zwh9G+PXit3rWXkEeaJvatcSt2kJVdC1DBgPxTJ65hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179485; c=relaxed/simple;
	bh=6hJ7oeHF6wBdeiq/dkzn5sngLJbc3/O0rbq4yDzbIYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bTRayC1nv20vouILC53zkvHnC5WBEed4aQw8p86IMBY5CFwyeIYgpAm3bGUxZvrnguojD/FDX1N++Te8Fob/sj8+xdGTmfMzBi0IjowyTarnpWl6wgnxrCTyuWTQkLrIzLAOPBlalYpP/BOhVKi2fFxTW1JTY5vFVwByCCF+Qxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x0Cb4poS; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x0Cb4poS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1gNdJc6lf355d+l8fjrYUBI6lzjvbpuPD5AXh3xR2LI3nun0EPlXxV8p0VqW/mzJGyHk82FqI/sISwFogt003OH67GE7Z2U8H1+ekjPzIWkfm8rTQrcwevM23CSvgNyOmrAtDG9RpkYfefw0vCQIKjNWtLspCVEpDS7d7pp2EePz47NS19gPm7Xmfb+46x56jQ3QOlasdfALxA3qGtuEHzArM45CxHBLFrhr6SZynSpOWRFiNm1yBIJqzcAYRIyug7B5QUc5p598FP/sSgoK/Fr8pyMsvA9BggKVfU2LB+8Vrcnp4Nc5AsElZvlo1N8AnVahYBmPmktDvcQHnJYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcEVlIOO/nhjy7VzmdieUJD/CZyi/90IVcmCkmqmZxQ=;
 b=Ve3QprHEz1D8DQVU2Y5WF035bWIO1Xpu452FwM4zxStqpUgsn6JDdXrovVVp/Zoj45iOI1t5YvE/vGdH0yCHPBpi9FcCVrqg0IbY4GTjPhqZv5V9wQTaaLPCQxRhksMMbGZS3r3jECcC/P0dJHzq0vipZmnIhfWgcdtB5LTCC1j+WvkZt3N6UxgGCTiZvW6aVu/h4qrnZcRWkmsg4ix8HYV90sWntIlCcQ0gwgjCOYI6PuDnk6bobCoyrNvDEWZIqo8nV1qDstUPoP77HqP4dgfWFI6zjCwIOxMJOcZerWsfX7d17mHF+zL5nK/+n1RyC9jpPv9CxbL4EC78tWTgZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcEVlIOO/nhjy7VzmdieUJD/CZyi/90IVcmCkmqmZxQ=;
 b=x0Cb4poSt/jIcv5fXe9J90hoVoBQ/OspttYrTpSrCZV7mcok4l7nrSuzhkNjrdCN4E909xXwLFuZZRGjSbm7DZyACjTgCEJSztd/HJguM9OoyHOIgd5W8wFX/PWfxbw3LIiLepZ8gsl//qgd7GiYyd11LhsaXwRUCH2UKbqOT/MqzF5APOrQNL3Sd6JCDQ1Ef7lOKYMHCDYIkTrr5rP6bheFMxie8hq0Io5BA01xtVY7OX69HRltMadfJxH8K1zPZKDiQf5UQ3fRhiGlwuJ1kiH0ZokJumiJ0Xa/F2Efmqku2fkRvkMykK2s80uvOKOZYrevZ2Ht2/PP00e8JZ+IAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 19:11:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:11:16 +0000
Date: Mon, 27 Jul 2026 15:11:07 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/24] dmaengine: dw-edma: Dispatch DONE interrupts by
 channel request
Message-ID: <ametS1SV9Z3bPEWy@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-7-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-7-den@valinux.co.jp>
X-ClientProxiedBy: SA9PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:806:20::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 302f6d33-7c3d-4910-bf8d-08deec12d509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|4143699003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NkfPFmiytXaE9DKi19Os9mldtk4YoWW0iQDq+EC/P4WK0If/ZDLTCAobwaTuuuKiNAGOCujbe3BE59u/NvLVtuELE+xWi0BDQEeYsr9Ujb0FL1LYLpG56zrFajx+wK8uBicq8aAEbGetAU80Pw3c4RA0fkqCQ4f55nwhxnHJgZE2rY/HVzRLliPqrTRk2kf90LBfbF9cpOm29B/zzJ7v9DR4VcxrEh35zyw24Ll3N3VArON+HeLBeOkAjVZL2SehqagZvotUYx5RsgijIOOxOWdF5vqqfh4HPt6KxV0pyD89ndIYSZ3KD4AKU4JmK4m/ZeU5pUlwDNEuvzWEAn98alZnTk7OAj4lLxyKqHudPjX+sbkGWqE8NwCAM227f17g1Q1OOZ22wwKG9oCf9T9qIuUWo9x70DxIyOoK20wgyLHqM6DvC1E7giP263Gdo5hMG37WOQ39B51fSJH4om8Dqm9sntUBN8GoUhxfvMR4lIGKu46ibwRwCArgbQDIt+tXuHKH5m+laWrxM3kAskwCt/l645jtKbsPYqQzt8DkoTXca5UaK/R/4byhv+jgTfXYDi9XGgj5ng9qDYOpwD3/UovoOq++PdgMVj+wO/ILlyyBhu7jtPcEe9TYatpcQ6ucjz/0qHkl5IYaeP2csmOSrudbO8Q2JAYfPEvmrPbLtHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lL1hkJ4s35oJAV/7L6NyusD24gbq8V3tiXbCl8cvnt7JXOt8J3Tz4n9qRmOp?=
 =?us-ascii?Q?SfwIJxi0W0XXZUhDd4FWl+dJI+p6yLdaBmWmbSBbDVQu8AJAmQWpYR082tR8?=
 =?us-ascii?Q?XId3DWaK61I5e5Bioi7hXTeUjRKaYf8s1HK8Si8XSiSeeFfgBpVPOZOOyyKJ?=
 =?us-ascii?Q?DceC3H59Df75arILX0PqK5m/PjBQ9PJiAy6lmDxxGzTt56+lEVVkF+f0r6/F?=
 =?us-ascii?Q?YLAfND++fashe8Cv7FIeJk+VLOb+WhA6d5cBlwY8u4A9mPI+WWr2yRDrTJZV?=
 =?us-ascii?Q?HC/74Zl0P4yBzLg7y6r097bMNtofcREHfoGVcZTAWFRZpHfdtel0uvadxXTT?=
 =?us-ascii?Q?v1vB000VsbY7fop5KNIKgp3hpzSNIY5x0cHbWExJPYd8XQtfd3YvFX1Yk1ZT?=
 =?us-ascii?Q?IyWVpQBW/4lAbGbH5FmuPBLoHJqi1u7w3zXrfrCzjGUcIUDgKBf7BrcLkWJu?=
 =?us-ascii?Q?8+sROO6jT/jmkE0PCtCmx1X03m2tTMX9gfn/tt41pz1NW8CYr94ENv3IVmE2?=
 =?us-ascii?Q?PYSlNyNtRgb4ghg5SjAXFMSDGhItysBETzBUTnrys80exTt84Tz8w3jQ9EkY?=
 =?us-ascii?Q?da/9WzxlYGBk9ovLLzGR1ofuGTDzf4Wa/tKC9PFasaDksuJKK6PmGLUAyNk/?=
 =?us-ascii?Q?YescAcqxizb6eVBQbOONg/W0lTKyKO5T42x1/0NkD8HtGMLlyAn0HsczqR2+?=
 =?us-ascii?Q?r24bBM5j44hzNfT7GThflrLUhXsRkl8qCKeleIjnNTxMvMUbiRUvPXP7dy5o?=
 =?us-ascii?Q?vVrsnmlrbPq1swCC1G2h9+wmry4R+lz4b2JmxmAvPYReHOz9+93g4ErTde+7?=
 =?us-ascii?Q?fNVyG0gzSo5THzKroAfp1RGXfBMaPVVFUAj8HwZxRUNtmkj5hV3XYlIgdSnC?=
 =?us-ascii?Q?iQ/B5d69teClVK4bwupXBWKNhS6K2a4Q5SUO7+8wIkZYU7SvLuQRT2uM70F1?=
 =?us-ascii?Q?6D1d8OZjmp/aT7MBOaF1PtvDlnDzCxJcLEsF0M8MIfVCMrk9sZqvXbRTnem9?=
 =?us-ascii?Q?thzO2JND5mp2fOW3UmHSkSaf8oOE0Ls3yZkT3UInDnsoNpdlu/tr7+adkuBk?=
 =?us-ascii?Q?Vqk8KRR5jWxQBSPNr6g+cOsmz1mDofJY9/jb+MwpW5knGKn27PB3FWNsDlR0?=
 =?us-ascii?Q?kHOdRcuD6cILhGFPZLC1Kla2r2IsWDmdASowEGuciepGB1L1nTWu9syGnpWt?=
 =?us-ascii?Q?antYKjAFdLZH6X9dtCEFEoX2R7yZFijElcB6gjI7KZXCQYw7aA4Qc768OODl?=
 =?us-ascii?Q?CuyHv/g7ICOMs1xoyO1xJ0VlbQGHeX7ZkvPmIm4NEqyMvQpynZoXgs+DXuWZ?=
 =?us-ascii?Q?ix5iAc0rN9/zOO48P/UtGQ39IKHsBqBiHADz/aONaGEAoMgIH6WlRPIXbsoL?=
 =?us-ascii?Q?2WvLCB9dveytgNWj3UdCty35faJkQ6eybaxYHEVh11klfJj4OPv8MJPhvPdh?=
 =?us-ascii?Q?HOdMM1XZLEgJDmqrawNpedGCsy0bPDqE86o2/sQDPqErXv0FCeygXpfPWmco?=
 =?us-ascii?Q?A5RYHH36+DcVZpH8IcjbN2DTAgf80WDh+wsttTDdWLVtL1XE3BC1YAAffjnv?=
 =?us-ascii?Q?pkASLPmi1YX2bki4fJR+RQw1jZ0fv8Akn8i7zMqKjMaWc0/OA23c6YbBXGkj?=
 =?us-ascii?Q?Gi04OaxdxLJEBR2e8dEuhRVWPViSogcDREzITU6Ez5+EOdI6KQjPHWLQpzAI?=
 =?us-ascii?Q?JA0j8OweUEoTeJkUJes/j1XAd1AFcjhv77uz5SWKwGo0A/6qYw3cKZ/CNHSN?=
 =?us-ascii?Q?WWraS/sVsIzMjbiRa7g6FCvx0jFN2epR/tPJRtsHbWDdlO4rGorQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302f6d33-7c3d-4910-bf8d-08deec12d509
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:11:16.5173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw2IaPwRsFr2O1xldioTt7xzlFKmHyI8ThmKMn+jJJT4lDMF50boDgP+x41uW1q1q7YArhKBrWj+X0p3dpj2s3+YcJNxD6Jw2bNs6uD8/rlZd09J36KoozLUlIr8H94i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885

On Tue, Jul 28, 2026 at 02:03:05AM +0900, Koichiro Den wrote:
> Prepare for LL progress reclamation, which can complete and remove the
> last issued descriptor before DONE request handling runs. STOP and PAUSE
> still have state to update even when no descriptor remains.
>
> Move the request switch outside the descriptor check, and look up a
> descriptor only in the cases that need one. Keep this non-functional
> reordering separate from progress accounting.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


> Changes in v3:
>   - Explain that this reordering prepares for LL progress reclamation.
>     (Frank)
>
>  drivers/dma/dw-edma/dw-edma-core.c | 56 ++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 6e7d1f7c20f9..b419ff2becf9 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -697,39 +697,41 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  		return;
>  	}
>
> -	vd = vchan_next_desc(&chan->vc);
> -	if (vd) {
> -		switch (chan->request) {
> -		case EDMA_REQ_NONE:
> -		case EDMA_REQ_PAUSE:
> -			desc = vd2dw_edma_desc(vd);
> -			if (desc->start_burst >= desc->nburst) {
> -				dw_hdma_set_callback_result(vd,
> -							    DMA_TRANS_NOERROR);
> -				list_del(&vd->node);
> -				vchan_cookie_complete(vd);
> -				if (!chan->non_ll)
> -					chan->ll_done = chan->ll_head;
> -			}
> +	switch (chan->request) {
> +	case EDMA_REQ_NONE:
> +	case EDMA_REQ_PAUSE:
> +		vd = vchan_next_desc(&chan->vc);
> +		if (!vd)
> +			break;
>
> -			if (chan->request == EDMA_REQ_PAUSE) {
> -				chan->request = EDMA_REQ_NONE;
> -				chan->status = EDMA_ST_PAUSE;
> -				break;
> -			}
> +		desc = vd2dw_edma_desc(vd);
> +		if (desc->start_burst >= desc->nburst) {
> +			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> +			list_del(&vd->node);
> +			vchan_cookie_complete(vd);
> +			if (!chan->non_ll)
> +				chan->ll_done = chan->ll_head;
> +		}
>
> -			/* Continue transferring if there are remaining chunks or issued requests.
> -			 */
> -			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> +		if (chan->request == EDMA_REQ_PAUSE) {
> +			chan->request = EDMA_REQ_NONE;
> +			chan->status = EDMA_ST_PAUSE;
>  			break;
> +		}
>
> -		case EDMA_REQ_STOP:
> -			dw_edma_finish_termination(chan);
> -			break;
> +		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> +		break;
>
> -		default:
> +	case EDMA_REQ_STOP:
> +		vd = vchan_next_desc(&chan->vc);
> +		if (!vd)
>  			break;
> -		}
> +
> +		dw_edma_finish_termination(chan);
> +		break;
> +
> +	default:
> +		break;
>  	}
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
> --
> 2.51.0
>
