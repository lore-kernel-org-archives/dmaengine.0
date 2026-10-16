Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9604D6C55;
	Fri, 16 Oct 2026 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163138; cv=fail; b=N8ggn5e5yB70s0WbiJl8YlMnu86oLfeCZ04r0IWZpVz/6gj3C6TYfBDHF8QMmAoPMTocZgq+e3rAo8RgurdF9lC41OG5N7cS/zTXChyhZoflQ8auc4NkD3YhAY/Ql5geXo9YDOZG+KvIF4osJ+0STsIi4zd0fpDniwSj7R46SUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163138; c=relaxed/simple;
	bh=0WRYcQLREGaClhqZ/JdhBSgncat4WTNqeIeZVaw1i+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qr1vy//M5yShOfHrGmyhiiDK5kKgNBbDs27zt82PjdhNu9+PJd9F5Yzy2CEIsjSiHWhNWugYJZ3hUXv7zdJGTz+qEZfMqRXXz9OLOKuNjbBg6pgKHzInRA3FDBMfx4IFpgbs/NcAjAIYfO8gUoetNhpdTDpbq0UM08EuWIuZk2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MSDLhApF reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MSDLhApF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjFw+lmQVt1D1K9V9gS1XRppXjGpCtgpjMqK+4O9wafLppP+CNPqS6P6CDfq2Ux+T/z9cn+sHtiBwCZAtGmgMeJfGc6rUZ7eiN6ua5mM70IumBJdcRbZgaVvSHRnDxkysw1VSAni0It/gYy7Ym6kQzTTQ6c6/rQWIFdphML1rpF6e8Z0wWHn7VUfiahUkYkiOk20DeLC7lvZYzGzoMCfOvLZ89TSgDuLzQXeilzAldeyrtwauHosu2w1PNdK2X7dloYoWvSkgA01ec8GPxlox1RPKxNtafTjuhle1GmjBEKzadJZt0YDGsWGb/a886NjQh125QxeyhIXZ+QcZG+H4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycmdzewuDr0AEqdQsXNiWDEcvWLW4j6qyCR2R59mBxw=;
 b=G3HCxxRHh/tYdZa3MvjEXJpJfvFIEsTVKKIpq/SUM/06W3Zf3o9+DzxctYBzz6bcR9kZ9zqSAaivjT5cbVHHIiIsSSVwO7BDSr61nnRfBjYlIvPNfc2NAj8AwyB/QRCkDfF7e+0Nqk7QF8oY15SqO6j/G9T1jIX6W2KunM22Wdh2xT7KAfrsmIeoLPtgQhLnhJOPa8/oFe78HR7fSwx/RgZTy5LmKdTIjpXc013PcD1hdAuvOxnkh6Fy+iC29DQLATPLMPsLNmK5AIl8uMpaIUF2qRVaUhhxAfMiZNhI86/jOGMc9TzHd24pXyuvACHhiYeO6Q+uWWcZnsAkCFuQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycmdzewuDr0AEqdQsXNiWDEcvWLW4j6qyCR2R59mBxw=;
 b=MSDLhApFkqw1zxp6Ljc680xZburBfuyFopvLjPCTT0y/zikjv1fHrwzs+30CPkmCrHZXoXoRBDfTObxDXroFQSo4bHxPFeS3kK+rYdoa889yrMWx3eM8eBL2kC9s7ufPzdY1w268KMmGJzTu6RddPOVc8ONXPZq/PBQdbNTvDtY7E7yaBwxmzipW4LtfX/tIJwvQnLlBMC71RXsgLU2QPCIkyZX3Zr2qmhbN1ukS6VKqkUc3H9BKTNftqPfRBwJJu6fh0okwtTJtM7+BCd9LmyLIKp8Y9IoSDLYnmiXYoZw8OfCzjgCzXlx1VivzXxQpGcJeOK/Ua5H88J+eMm/dLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10905.eurprd04.prod.outlook.com (2603:10a6:800:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 15:05:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:05:32 +0000
Date: Fri, 16 Oct 2026 11:05:22 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, imx@lists.linux.dev,
	vkoul@kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: fsl-edma: support per-channel DT child
 nodes
Message-ID: <atI9MsuyHFqi1i_4@lizhi-Precision-Tower-5810>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
 <20260930-edma-iommu-v2-2-72a62bf44c74@nxp.com>
 <20260930064224.59C941F00899@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930064224.59C941F00899@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10905:EE_
X-MS-Office365-Filtering-Correlation-Id: f19ddb54-2909-4049-8c3a-08df2b96ec35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|18002099003|22082099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	s/EhvnWyVRB1MYF+xFjCjw+TqMhJT4W7V4wLbijoYgSNp2dkeKJt9b2P3QJeyYBjhpCv+cfiqVOOpsO4Acli48cNrLXrvkNEhXl/PLaZCxRs/102155akduicrDaGrVqMsStCMeP8Ka3PQYBE8543townmqL5tK21rT7lupO4YwbX6pBOWfEGeXnl/tY2WqFYoW9bsR6NCrSj1JeyVxxLrgtD4p27h283gfc+k+eljdpskKVf68KPJycuIC24v2/H8tXxdhcV2ROWpHhLOJDgR+OLONIU6a9+Htyl5DtqfnZC25lGQx4ggOw4EoI4pHdE5rlfb5fVn7U8bMDsxQ6yenu/mp6kuNGsJZ3Nj+ly90S0eW6+jkMJYG4R56pYEatqy4DnbDjusYMqiYaNv+JWfP69U6BUrujM5/s3HP0YIbzR6MnR6CSpvMtzqzxL6omSdRes9WjMF5NbaBPnPsa/wNIbYtSE4x4fVwTfCfcJgGLhaH5RlBou3pFhECjMEnQXlt09HakJThHLE25/BKXV86MYFrKVjdIWxK71pqlnXOy5zZRPs6/yUx6NR4CqB7xGJzb/1EK3lG+WN9f2d697e/crwLgkdRNSA+vsbld1/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?S58ur3BtCHts8/ZJ/CHAT5bP9C1U+cFrYe+axRFjR026qEtFxoZiFfubav?=
 =?iso-8859-1?Q?nx3hMYZPCWtz7HTWKzYMEkvEE9qeVhGYLHJ2szdFDceW/0VZWjcl6oP4DY?=
 =?iso-8859-1?Q?P9gJVglq6c5KUSZcdKpz9PRVh+XD5qgs00twBPYvCMRRJEIxALH4wgVMva?=
 =?iso-8859-1?Q?WDC8PbsEhpH0HmIPpysvwji7KSJOlrsybQSDlHozhkomZztfv5/M9F/TYL?=
 =?iso-8859-1?Q?Aot3H5nADWOA2wjtZElUuRhbuIssFKeyuTaDkxBhKY4od3EtUOaye3Y6dQ?=
 =?iso-8859-1?Q?+8mX9Q+yeXRFw1XYcPpV09MvuT8O+YNTURD6qzXOYhmJRNM2bos45FnqmU?=
 =?iso-8859-1?Q?waA87WaVoCjkDLWOI0ucGgdKFIEvTbFF2NZCwvu1M5LKVrsF0TLZcgn6JA?=
 =?iso-8859-1?Q?sSIbxg3rmArHxJyVr4eLt13k9279cdAHelqVpADKdVBxK/D1flhG6STKeL?=
 =?iso-8859-1?Q?D1y4ZJmFanuupW4xrSgGR+6CWkJpAxPEMxPJBsqQoy0cPQ+n1c/IHblpSq?=
 =?iso-8859-1?Q?onByjJEk3zpjg8wCHyuVIFXm7xujunyoT3M9JG5f3gLeKdz6KmkW/T+8s7?=
 =?iso-8859-1?Q?Ao7TUz7cK8gOp0bDIJBc4X/w6kTUt6clL1AkoKWfS/5mRFATxLDHL+M6pT?=
 =?iso-8859-1?Q?1O+wBF63dxQ6eGpPjK7+TkT5B+l45LV1GArGA2KLir7DWgubYC3NNxQWPc?=
 =?iso-8859-1?Q?kLhG8s+2ZrRtiK5FZfQ4KOChDPxBlHqYrjfSDWL3pQyqS+yYTQ+TkeA3b2?=
 =?iso-8859-1?Q?wxbpXfRsZYF/OCHjSWxif0MLjiyHrlN4uDbaoOxBYmUaQWzt50e4++J2hK?=
 =?iso-8859-1?Q?9UGfTo5Pop1a/tTIpQ1gqVcdfPYqrS2G79FISMUO8bQg9uEx68EYfgaTzS?=
 =?iso-8859-1?Q?n9XBOacrRbTXbHj9mXgJfQQ4/aF0GEkDkueQ+8kq81N0I9q2cSp+sI5fiC?=
 =?iso-8859-1?Q?Xf7QiB4krZ2ZwKf2K2oQRdy+GCUouW2o0MUFDKvp5jti3BKadVJ9A7Ju+F?=
 =?iso-8859-1?Q?54FARlFFBfM0ne+T00mZdoyb+4L6DNKPSd1PxpIyuA9NDxnKAnS+J+ySta?=
 =?iso-8859-1?Q?xBWpXh1CQsx2ZrDgRWNzjvCguQn4hETok2XyfSQlu685vK4JJIGAggbkQ+?=
 =?iso-8859-1?Q?xXbF4pTHriYUywqrn7K6T9vgcLt7Z0VfblmKjIuLHznFb3jle19akK3J8P?=
 =?iso-8859-1?Q?832ADJHYqykJGuIxR8wNhh4yqZHa8+83t4yxvajG+0Llk0pSLzZ+m419E/?=
 =?iso-8859-1?Q?OWS9oTH/OBMDqdXqhEOBBJvQCqmlp2eh+2Ss+/WBDnMuAawVEan9vTaYd6?=
 =?iso-8859-1?Q?jyUeNw+e6OhlTkDiMsEvjsO3nEyLMm9Lvhms9RD0ZPRFZ3bvKEWVwps1Iy?=
 =?iso-8859-1?Q?D8VbpmLo7Vazdj0L5MjPAk7DXHqQCcXL9Ea1vz7d4vnuWOk00/RT2K9S3J?=
 =?iso-8859-1?Q?ByQmcgAkgCTljiRThQrmrOPRYKYP50iVQ0/84syAZJqyvVDrdqvbn966qM?=
 =?iso-8859-1?Q?M6zK6tgSlibDyi46L0LpxapGHF/+RxsVNHvo4K9t2R3VW5Sfdg9FN1Cc25?=
 =?iso-8859-1?Q?KcQVAvKzHcvnHHYGhVeJvpAdAceJ6oT5gRp4xUs8/ogWZu6xVHDNQGPEiu?=
 =?iso-8859-1?Q?dESGKOXgT5G6jajtqnPC/6DGRtkDd1bOi5OgeNr0ZF/9y/5kJ9ApmJwW2+?=
 =?iso-8859-1?Q?hYDwyuwQlFL4KWM+FAgmr1DjwJch9rkDAXSvn+0nXefIVS2i6vxzAROKri?=
 =?iso-8859-1?Q?GDnnwfXTG9MJ4FK4sHWsuwD7E6pDfUOLdoivJvg+239Oe0l+E5pG9U9WEK?=
 =?iso-8859-1?Q?V2uS7JNTq+eojhNs4hlZP5gYeKUgZsZ1qrXQ9tBgvvRdlIRVkvif?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19ddb54-2909-4049-8c3a-08df2b96ec35
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:05:32.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvIjsRbQiJvhOHgAu/EB0hoi9DVPtHwEqFuCeSxz1zSAjj0bdgID5L4fdfFXVppdyFApwYAm07ym57UVDWQXv2nWDzyWH+cPkcf1d2odEfAtQcuOH+ubu5keRHzXq8vX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10905

On Wed, Sep 30, 2026 at 06:42:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] dmaengine: fsl-edma: kernel panic due to post-registration dev->bus modification
> - [High] dmaengine: fsl-edma: probe deferral masked in DT IRQ lookup
> - [Low] dmaengine: fsl-edma: compilation failure due to undefined function and member
> --

Need fix these sashiko report problem or provide explain.

Frank

>
> commit 7b47892ce3017d20fbf0bc531e1531f30816d5d2
> Author: Peng Fan <peng.fan@nxp.com>
>
>     dmaengine: fsl-edma: support per-channel DT child nodes
>
> This commit adds support for parsing per-channel child nodes from the
> devicetree. It configures per-channel IRQs and IOMMUs based on the child
> properties. Existing devicetrees without child nodes continue to work as
> before.
>
> > diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> > index d9fb717b5b53c..e7e5b33cfcb20 100644
> > --- a/drivers/dma/fsl-edma-main.c
> > +++ b/drivers/dma/fsl-edma-main.c
> [ ... ]
> > @@ -695,6 +699,133 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
> [ ... ]
> > +static int fsl_edma_configure_chan_from_dt(struct platform_device *pdev,
> > +					   struct fsl_edma_engine *fsl_edma)
> > +{
> [ ... ]
> > +	for_each_available_child_of_node(np, child) {
> > +		struct fsl_edma_chan *fsl_chan;
> > +		int ch_id, irq;
> [ ... ]
> > +		fsl_chan = &fsl_edma->chans[ch_id];
> > +
> > +		irq = of_irq_get(child, 0);
> > +		if (irq > 0) {
> > +			fsl_chan->txirq = irq;
> > +			fsl_chan->irq_handler = fsl_edma3_tx_handler;
> > +		}
>
> [Severity: High]
> If of_irq_get() returns -EPROBE_DEFER because the interrupt controller
> is not yet ready, it seems that error code is silently dropped since
> only irq > 0 is checked.
>
> Later in fsl_edma3_irq_init(), if fsl_chan->txirq <= 0, it tries to fall
> back to platform_get_irq() which will fail because the interrupts are
> defined in the child nodes.
>
> Would this cause fsl_edma3_irq_init() to return -EINVAL, permanently failing
> the probe instead of correctly deferring it?
>
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int fsl_edma_configure_chan_iommu(struct platform_device *pdev,
> > +					struct fsl_edma_engine *fsl_edma)
> > +{
> [ ... ]
> > +	for_each_available_child_of_node(np, child) {
> > +		struct fsl_edma_chan *fsl_chan;
> > +		int ch_id;
> [ ... ]
> > +		list_for_each_entry(chan, &fsl_edma->dma_dev.channels,
> > +				    device_node) {
> > +			struct device *chdev;
> > +
> > +			if (to_fsl_edma_chan(chan) != fsl_chan)
> > +				continue;
> > +
> > +			chdev = dmaengine_chan_dev(chan);
>
> [Severity: Low]
> Does dmaengine_chan_dev() exist in the kernel?
>
> It looks like this might cause a compilation failure because the function is
> undefined.
>
> > +			chdev->bus = pdev->dev.bus;
>
> [Severity: High]
> Is it safe to modify the bus of an already-registered device here?
>
> Since fsl_edma_configure_chan_iommu() is called after
> dmaenginem_async_device_register(), bus_add_device() has already seen a
> NULL bus during registration and skipped incrementing the subsystem reference
> count.
>
> If probe fails or the driver unbinds later, device_del() will call
> bus_remove_device(), which will see this newly assigned bus and attempt to
> drop the reference twice.
>
> Could this cause a use-after-free panic in the bus subsystem?
>
> > +			if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_TCD64)
> > +				dma_coerce_mask_and_coherent(chdev,
> > +					DMA_BIT_MASK(64));
> > +			else
> > +				dma_coerce_mask_and_coherent(chdev,
> > +					DMA_BIT_MASK(32));
> > +			ret = of_dma_configure(chdev, child, true);
> > +			if (ret) {
> > +				dev_err(&pdev->dev,
> > +					"IOMMU config failed for channel %d: %d\n",
> > +					ch_id, ret);
> > +				of_node_put(child);
> > +				return ret;
> > +			}
> > +
> > +			chan->chan_dev->chan_dma_dev = true;
>
> [Severity: Low]
> Does struct dma_chan have a member named chan_dev?
>
> This looks like it will cause another compilation failure.
>
> > +			break;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com?part=2
