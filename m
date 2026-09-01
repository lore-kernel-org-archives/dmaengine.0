Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9426139DBD3;
	Tue,  1 Sep 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301829; cv=fail; b=kiGim6okBxtYgTWastL6iKaYjsz1dN5Qt7DQbuguw30pHSrn1eI5eyD42aEPGzNqofWeuejBQHwjjAm3+XZa0BoNyLdC1rvgUOjb9k9G9MlzSZ0agfIXoYRvLGkmenog+CAH0m5D2pknwg0m3uUd0DzWBu/VqjVZNKPk/hJftes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301829; c=relaxed/simple;
	bh=YJWSgbyRqeGsSaKASQRpt6z4NT33Ks6sme2+HOsAhA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gx/O8vRLNuTS2steJ7hEKUo8EPsxOKA1JMVjO0roYM9HDImWhGEPl7mj1CVCOph4Y02ZX8aoq7KxY0JXlK0dmANXoSfQxb6NQaMUvptKq8ClSECvZzPL0M/cdHiyIGUKR/F7svoYYhNaqG+JbVMsyvMoCvwpHc5SZR5g4QWG7MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gSpObIkY; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gSpObIkY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZJgV9LOiSwoQ1oXxEgwzg3TXW7R2+5l1EhNDslQkaCIUErwsOL8uhPWpqFDI5I8JNnYpPJAKdZRoXcBfQzqKxMVXL9yhMv5eUDtAjqjOxJQJzvkVKAZQuxPBkt7CqNO3G0e+E3zLc42BZu2RYBJYFmxIxf7KIdYqX6gCKQdRgbFBjLqp8mL5RQO2NUGvLBc5JTuF2z9Vyl/pZSY9AvLNxwcDlxb1AUyrBr7z1zSFxCw7gjh87npyHp2glgOB6S0ccfKC1vu4VrxySnbuYpTlAmhsoKU2FGrVVJTJn1jOL5PTcs+4LhuIeZN1TVL6bvo5wPXkZHLxktemTs30cklDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbkAV46C+Cnk4aj/zxtSJRhbjhhZvLUAvyUq7oMNNv4=;
 b=XmU9xFLleMz2s/28420izok3E2gzYdGsSn0eb3dTyxsphwhP/ZoHVfrXI53zQKXHYa6jr3/MOFhvOyLQvqITjaTSlEpEWV2P/acSFyMTKDKBLdha/olgGDWkWBhPAEYt6V5n2fJLXAy/7nU+O62TARsidwEIN+godXtWYAFCs4+6hUxB2ld4Qt0OQBrBMFxJojCjsnMYLv4LbrQxsB6Ynxa5D4SCc2OkecGklchHgIMbTGLG8l/tEGTXS0TK8TBG69diwi0+kXhhk2ndAPs2qPq3LyFJZY0Hkqud7jpGwb0VxUZ19WLzYdvIQMBTYQ4vdPl1ZbU5iDoxRxwC0tTv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbkAV46C+Cnk4aj/zxtSJRhbjhhZvLUAvyUq7oMNNv4=;
 b=gSpObIkYose8jLSkFXuccM3tC6RE1f0QTnR0TMo96vERxmLT6fj1SX7zX9Sd6Y8KzQJoJaVwLKoH0pNAs7LIGuesmED2o27iKtfJpa5zDKbsOVy3wTwJocf/G1Um8qp82sbTVSXusW6ts1Imae9d/hokTUm8KhicjnuyfLFIgSi2P/WvWWh7ESQR3+a1vJkC9QJpaa72fn7IhbJb07MgUaQKfi9oMuVGguwW1wFJiFgJZrgBE9UnT8cG4Rr5H5RZovF1Gu3V27Y4qmetuIEY5E/a2v7Nz31IwiC6CFxKv+RaW7Qfr/BFUQ+mx0QbYR9nkO9TzfiVJZnPaGvdvxpPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10080.eurprd04.prod.outlook.com (2603:10a6:150:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:30:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:30:23 +0000
Date: Tue, 1 Sep 2026 18:30:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 33/34] dmaengine: qcom-gpi: defer callbacks via vchan
Message-ID: <apdR90gPhAcVB3RK@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c575a24c789317a5ec330a4be0a6ea1ece60b5ae.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c575a24c789317a5ec330a4be0a6ea1ece60b5ae.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY8PR12CA0068.namprd12.prod.outlook.com
 (2603:10b6:930:4c::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10080:EE_
X-MS-Office365-Filtering-Correlation-Id: 79beeddc-7050-4772-9b8e-08df08789ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|19092799006|6133799003|56012099006|10067099003|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jax3u69SZVYc1H+RDTm08lZihIy9O7SvsBMcxVTBsroZYovKa7+qmlgitRxYNS4PiZVStzqITWLDIobWuTCvxaJhx6eyXv0U96yg+5DQflMOht8Dat1v1rpI4+oBRjwx2N858N1ixu/jr/+hqP2hJldlOv2VNJ9H9ab+Yx8x+IIkkCSb2X1thsxyu+EILqGeQK5/oJH2vLrd721QweBmRGvP6wBlpd47FG6T4Apus0ezT0FEGgzu7y71zUwVuog7Bb9gHtdRDtGPNnWXNd4cLhAGYTf11M6DoYcHrEuauEjnv+dx13beIDs7pdRDnx1Fp8rZp/KUNa+4q7qlopbQs9inGBPYye8/Hj1rNp4gfjZUo5zTMEBukuUAe4dncg81fL4RBj8pf5/KPChB959965wcNEe4ocGHmFsMPADpyVWhFdSrC91qI8mwKx7yi3hPIuJE2Ube59wVDQm3IGbXsdUMNgSqGroXwyMoXGM9WaEUBKLLFyubyRBLlw3cMC1JCYP/q2TA8jYjTfHPUenYvUKt5WCqyEBgURervUl/S2rY9dxfJK1AOkEXjLIHga3ERFq2HMHocV39iQkhtRmRLLvhTGVEzvrL4LQrLd8AW85qSRlPkbJe4aifMDhFnCtquTNMbx1irGcUwdeOVnt7FMeRimH/P+kNrMusgXtkPYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(19092799006)(6133799003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GLz1mTtKaaYLAP2W4evGxl7Y6JbLn4AwgJcEgmo33UrAY2/4tVhGEG/G+aq9?=
 =?us-ascii?Q?OREBvY/Skzjp4VWvtVj/LqdX9WsG5RQ8oBF8AdhbFkWOXYir6TL1HFIElQNT?=
 =?us-ascii?Q?AGfQKQacfebvfL+fzQObV0fTfP3U+YJ+fHYXswsplH+y0xT/h5DwHjo5MsOk?=
 =?us-ascii?Q?rLgemG08UGfiRVy8wuwVufdJDHfVc38QE4AmtPD9DrM/xTTAR/TC/x9DYA6v?=
 =?us-ascii?Q?62wBUUHo96tOUbhYo550ShM7Gj0vB4clV/8k4AIOZO58sv4EdnXwwTLO1bV3?=
 =?us-ascii?Q?Q7A94Cx3n/UapRXTEcqufLIlzQJcksnwBDAyRLdG93aKOBuNGeUnAfIbfhGT?=
 =?us-ascii?Q?OR0vTJq6+6ni85Q7VxWGvculBf713nHrDAdQMo7fZ5ECCasXaIJM6K/ycG1b?=
 =?us-ascii?Q?Ct8ZXB2G5lafRqmJ8xsT7y6VnWo5u4iivkKjft0LkHCdj9RjhIFkbHkoB7Q/?=
 =?us-ascii?Q?PSwLYnQ/O0E34KySHk73kfSXzU1aF8tsexEMHZRXWSi+3vsi+HOBMioALUDv?=
 =?us-ascii?Q?Plx68PTsHaTPlVp1rYRMFErq5gSY6bKLBm/CrPYdGKxDHkrkvgxwQ2c8tqi+?=
 =?us-ascii?Q?MLWkowiq9xyrm2BKlD5uPOSP9AOaCcT7qt2mq6KFIgZFz4UYHPxFD1uZMwPg?=
 =?us-ascii?Q?f92z+hgb1FzKDg7ny9eqqmwFBW7zwFt6hGAXaXrtVSghSv1Wt04oWFszcnto?=
 =?us-ascii?Q?JRGkG+4KNER3HDXntIN9ztxRcYNPUPmuTn8g+5HIVsXSITDIqJM8gVamBwWV?=
 =?us-ascii?Q?CPYfXrXvuWLbLaB0j4Ns8q0zAjvXAYo0d1x4Zv6duzoZggcL7cHBV/5E5aoJ?=
 =?us-ascii?Q?dDm6ND/hV1j2RW9suZkG5ku9IBkvPD93K2tdNU39PpvPlguR27REhLT3F21/?=
 =?us-ascii?Q?W6jinbu/dMvEBGCot90sZGuDDXxkhiPzXkDkmHJRA7vO8bqEg8+IetSLzVFJ?=
 =?us-ascii?Q?nCI/5EqSOzbAV3PLZfLTuI+DOmhKYkqcH5Zu9/xDC/vd93x4Bc0kC9VijKru?=
 =?us-ascii?Q?jW7huaozTH8qyezL/BLQAWr/I5IZ02y8508K7C+AfxCgWE5bWUh8QJUo7ROj?=
 =?us-ascii?Q?kkOBScb4sUWW0t4DqZAfNTR8p0KEH0CvRV/7kneIlSrCT7im60kPgQE3CZf+?=
 =?us-ascii?Q?RMkEUfH6MYHj1obFkrkyGxEFnXy7N9hFUxgeGA4EYf/J1lb/thC0QfwBqi7S?=
 =?us-ascii?Q?RRdZffrona2/NVw2UPqOTQt9z2O732sfl4j+TAIux7GWQzAth8dhksKE//hS?=
 =?us-ascii?Q?oipPhs1BSvMBHryP1isvmoShrZKguJPXgLVwxClMQ1W0rOJrR8Shxci17R+x?=
 =?us-ascii?Q?3ZCGywrrE5FAkTvekT6bekXxPgLJUIl2z0n1zrlyq1Exw56+isOLVmkReLU4?=
 =?us-ascii?Q?h/qF96zCg6D4kTkqACqBWEqRHZzGxlm3ZQPNNIXaM3vH3B/1UQ1RaHJTej8p?=
 =?us-ascii?Q?xAQsewGqJ/ksYDJ5taqakNUOCnv+6kkOlIAeif8vgTRZU17Q7hOJCYkUx0xQ?=
 =?us-ascii?Q?FdRlFjkQmhQyNNd+igqIlxFNKjZIZLnwTop8EA1RU7aCo1n1MT+fQCHMfNiw?=
 =?us-ascii?Q?A3RHH9c/Twm8KL3d/Q1LQHGU1OmWalVdZsPHdfxBXLEU8V6FhsfYTo2L5zre?=
 =?us-ascii?Q?FWokw5OrD7lmC8nklvW9eqkVkjpNQ+K0xNW21ff6WhoZxjjiBbXIJEOG5SQz?=
 =?us-ascii?Q?veHlDHS0oJXfZN5aR7rFqHgue1dNck5CS8GwJnU/ZAv5OpomNIeBtfpk41yW?=
 =?us-ascii?Q?3hQcxndRNVVsg2cGfqL6ucLov5mnYWyfR59bomlOmkYaNl6LsHDL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79beeddc-7050-4772-9b8e-08df08789ce0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:30:23.2533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fNCn95Qw0eGm9QYDXVUD9Sm8pzRbjxrVdod3Vs3g3GUw0CpF+DtHIM2Ot93mPAGFZuRZFRA3qwUf8PNXWodKCS+Do82rBpvT4HnkFoKmfDHXChFdclh/fzDnKF7tNnm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10080

On Mon, Aug 10, 2026 at 11:09:34AM -0700, Allen Pais wrote:
> Complete descriptors through virt-dma instead of invoking callbacks
> directly from event processing. This preserves the transfer result for
> the shared vchan BH, which invokes the callback and frees the descriptor;
> drain that BH before releasing channel resources.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/qcom/gpi.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..2bc3a07ef092 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -981,8 +981,12 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
>  		result.result = DMA_TRANS_NOERROR;
>  	result.residue = gpi_desc->len - imed_event->length;
>
> -	dma_cookie_complete(&vd->tx);
> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	spin_lock_irqsave(&gchan->vc.lock, flags);
> +	list_del(&vd->node);
> +	vd->tx_result = result;
> +	vchan_cookie_complete(vd);
> +	spin_unlock_irqrestore(&gchan->vc.lock, flags);
> +	return;
>
>  gpi_free_desc:
>  	spin_lock_irqsave(&gchan->vc.lock, flags);
> @@ -1060,8 +1064,12 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>  	result.residue = gpi_desc->len - compl_event->length;
>  	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>
> -	dma_cookie_complete(&vd->tx);
> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	spin_lock_irqsave(&gchan->vc.lock, flags);
> +	list_del(&vd->node);
> +	vd->tx_result = result;
> +	vchan_cookie_complete(vd);
> +	spin_unlock_irqrestore(&gchan->vc.lock, flags);
> +	return;
>
>  gpi_free_desc:
>  	spin_lock_irqsave(&gchan->vc.lock, flags);
> @@ -2009,6 +2017,7 @@ static void gpi_free_chan_resources(struct dma_chan *chan)
>
>  	/* free all allocated memory */
>  	gpi_free_ring(&gchan->ch_ring, gpii);
> +	dmaengine_kill_bh(&gchan->vc.chan);
>  	vchan_free_chan_resources(&gchan->vc);
>  	kfree(gchan->config);
>
> --
> 2.43.0
>
