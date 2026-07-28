Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E902E1F0E
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251532; cv=fail; b=GFHhl7Qn1gmnKyKDkNcSvfo4Ysdpta1hWlI8CjK6LBTBiOP5d8xRD1Q4EuSx+vx3UP991dih1JBzZScADt/tSjwRabXbM0n+/hgtSc2k6Uk8EKmYsA5lgxJ5ywcfc02ndecz1h+Y3TASHkWAF+huwVj1BgPPMu9oRS1EPZCxVmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251532; c=relaxed/simple;
	bh=6eKGM8Je7m/IUiPE3AwHv8qTl8QGj3bNLG5x5buEcRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=czbEW+dCvaCWHieQXMAshjNTZ0hfsh81zpZp8dP6gwNCkRzA2Kin/U5wXRODKbDqkrrkm1UiDYDYFBytG15k4ci5DnB9HdW0bt8d43tnKLD7ZfDYENUI//NkSj/OkYDMSANbDZ/TLNPiE2q2OW9sxxEmGcnlHpw6a0shKWLoyJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cf4tBCv4 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cf4tBCv4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK4bcZUCm2xmLyLhmaoq6Kg6cd0QqZDiSRADNcXSs9cS2qJw70Sf6sYqDV2o8Tpt37mPZ316goNO0QopEohdAx9yjsYQnxLwYcq2zGORbu4dueT+UWcq+m9kW9nSFQUal4zdLA+mS9k728rVaUTBvuHys05fVjFEYqDUGkkCop0vIToURfMR9yR9UPJwb1XwIR2dFhftvEHzztLjAcT/B/Ve+9+cFDKDZwmYHnQcAS5QFLRbh/SMhz008wOFyTentwYY+VoInWbBSlq/56Z4eWO5AvqzRCvPY1Fmo3dWaPq3c+PHggab6kH0gvM7iPGiagQ/w2AKbQ5meu1AaMoQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLBi8S4YX+rglfHwFQ0n/wU582NcUQt2aOxIsyJa+D4=;
 b=bQRSZ1m7o2TbbQOSRrr40zlKzawY2dGrbF1KTvEvcTEi2A+UYfVv421ric9rRvyOfrmbQsv8sQj9OX6KTL2ehLntX7cUyuv5B/PQf3sUO1xQn3TXyuIvjWVsmreRpygqLHKe4RaJl/CljgbBVfjq82hPdoG7EYf2UHfkBcoW8l7gudRos6RaS9nJGK4NGaIRpbgQqovgaIu53yiguIErGo7DIxZxHzuezTKZTGRKvdUKCW66dF5jH6/Br7u964tCMNV99mQu/aaqiUh9BirnitvmjrJadwTXYPYm2tE9lR+3rMixCtLGSREiPUwam0HtAROJWtWPEeaVNuj/HmPO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLBi8S4YX+rglfHwFQ0n/wU582NcUQt2aOxIsyJa+D4=;
 b=cf4tBCv4devoVqSi8CNpKQwoc3xsBvXpMGkyDPMTGcWJjbYWs80ePToPqGVP86aTjexvyFXwd/MALBBDHHdu/jD4NZ6ox+jawk6s3mKOWkO915VX1m/zKGp45jgoNDVky9d4UWjsvho8KOsRznsAxtj+6/hZEgrldkARJMpll1z9nTWUb+YC2Tg5tJHCPgJN3bLvXb+rlAIkQG2/RPVJ/oiR17MBfIUV9qtBpIECfe7vSNGtV32nv8oleejWMtByu+QIYGAe7ilPwTz5eCbMLH1ZvlQzgasG8dnxaTHB1J8m/+zmTsvYAWjoGBmA9tWBunxoJ4riyvtyPD3UnvO8rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12640.eurprd04.prod.outlook.com (2603:10a6:800:345::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 15:12:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:12:07 +0000
Date: Tue, 28 Jul 2026 10:12:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v7 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Message-ID: <amjGwBcvweTwkvZu@SMW015318>
References: <20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com>
 <20260728-fsl-edma-dyn-sg-v7-2-10dffb4167c2@bootlin.com>
 <20260728142110.A103D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728142110.A103D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:806:23::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12640:EE_
X-MS-Office365-Filtering-Correlation-Id: 239d6d11-d1f6-42d1-61f7-08deecba9703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|19092799006|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YhNGxhmzqLijJy3u1Lozhw5iyScNoN7cbgIdLFIWyZo+oIE4Qsy+ClHxSeD8RxKLdW/xYy3rzrg0mwj33v6HB4nRsiJFUVt9Bcc4nvhl4lzOk52zppcQyDziLS4SegNJ5NXpUMm9c7FE1BYzu9LbRSKGvp52EdTRGLH1sZW3cs5+rFNAOvqdhI4eShEqGSM/C9Oh4bLcF+443K1RSJRaRgKL/C+mzPmH0h/M7FjK1Ku4aKZKZPF830+3rteLyOCj5kBesmjUI1JV7k2oyF/KIKSARz9zzdpB4pg1/tD0FxbIbD98YnvtjyXJJmjwZdA0lFOfwh87nrwrCXdqRmhEYaOLM8tN9lWxysJvZp/tCisweGAL3wa07GmsGdwK+HlO4/GMG6xMynxLUw7qa2uvtQy0HkhMUJCRCKvBgmM445ZFuqzbdtX1DaGssk8+GmW6cpQnn3Y8ElztuG0sQ4NBwmZ2VrZrsPirOdRpuhY8TE8zMGTYMXtj81faIO8YoorjUr1sc8UPUQV1CRo1FjqlicsBQTtRwtQb9nUVhNkRqsWc7bN/6gykQ1xgYALjvK+GnaQnu6bCNcJq670JWFvnwmo3Q688Yyx9UaO9fj/LUqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(19092799006)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qNLgs44pRJAkVE1g7ORlLb6bv1rXEs/4LuRsMO/2zN4VbHGTNwHCqTed9A?=
 =?iso-8859-1?Q?scGS0nofy2sSUd30tE0ytLvE4foXUZqzmlIxuilG8BkhtsJxs9mQd22G8g?=
 =?iso-8859-1?Q?843KWC6dD9bFrNRaX4S3/zOOfLiLCdPw9gsnxefsdWUB0LpGtLm1xLQh5a?=
 =?iso-8859-1?Q?pSTtcDogW3P7Q11WahUYnscA+d9ONU2KnSuQ61Of9NLoQb/n7F3lqn6aoJ?=
 =?iso-8859-1?Q?HzWqKmw9J9eCMHn2evnw9wvWrS+6FQlOM9uQT+HE9XbAQgRSgogZxJ7Xg2?=
 =?iso-8859-1?Q?QjKqZhuhWZ5wVPn1CjmVMSsmbm5idywiHrv5/Dg7q9PirKJ89AbRBInSdv?=
 =?iso-8859-1?Q?YJzXBYj0pdxtWLBhJ0yXbgiCOamcD/d3bnGCzcnIb/KUvqg+SgDMNPVwOt?=
 =?iso-8859-1?Q?7fg/F7PL6svC1h5lbi88YGDUtsiUyY/EJThq8ZZCq9nyzkyKZB0GuAcR/e?=
 =?iso-8859-1?Q?aT0UIPQTrIdggeQj5GDGzlbvv1J/ScDfBmsc1WBiipbJoLU89wkUre1GFc?=
 =?iso-8859-1?Q?7tM9FmZ/iprTfTNtzrgM05SR/8ZeDmOFc2A2akdClg2f4fyVkGK7h1q7+F?=
 =?iso-8859-1?Q?HhRP3AYQYHN15UX82BeQFX8m6jle+HpqSIfeBRWJnr+yJSkJfMZMqx/Cef?=
 =?iso-8859-1?Q?vWalvdsUy8SjdOMK888tT1jngtZi5uDvjfL8uLfccNF3FdfY4hKeFR/UNz?=
 =?iso-8859-1?Q?afmqHaQZJ+NJ0WZV57u6xSWK/qk/1KBR2zQTEJB7QyuWGTD22kwjPchFG5?=
 =?iso-8859-1?Q?jsPC3/Cq3+5quMGoQnmrfGBolsHL0JuiFDqC91ksJM1sXH3q9JvfIeViyL?=
 =?iso-8859-1?Q?N3Dn9ygKsB8v4WQD1L3vBgfu/MamipXaOBvhIXF9iQ915tmyZknz8YL4ZW?=
 =?iso-8859-1?Q?RL4kQW6uRX8cyAmYbPW7kaVlAWXUnx1VTjsh2nWO3PmWIdAELp6DaTSjST?=
 =?iso-8859-1?Q?gb1JXDvMA4wiZ1wzjuTXv0gVVlGQeDA67U01SMeUt3x0BnxVi/2L7phZab?=
 =?iso-8859-1?Q?y8FZabV7yvxMRN9Q26IGtsmro7RtkJugOhUDCuMAbddah+h0/CuHbXDQKk?=
 =?iso-8859-1?Q?hPUggSspNpGDoTe+4YcRKezaOEELnVEkB7DJsrn0K5JYkyiuLC/c3zV5jp?=
 =?iso-8859-1?Q?KJi+pGGAXEYgUS2flEHc1pbvU7xeVVNrbOHJAShFz5yc96YmKOpv6h+Wla?=
 =?iso-8859-1?Q?tFnvEfhoBBRcKgJlqw8W2ZvwRl11N1E0YG2zCqL4T+xRIYPPbCHRlXRSsW?=
 =?iso-8859-1?Q?QieeMoJlXv5w6+xGpDITR0bBQW4/zcO5k9VdVID1p/ikLANPhukLBzi/Ty?=
 =?iso-8859-1?Q?Njbu7bELgEULog1xQYoeBPLPJ4kJyeHodmW06B2FBMJmj2t6TiKg2wCNhz?=
 =?iso-8859-1?Q?b7OxNiMk8tw3Z3XDmJbS9wX4wIirbEoM9J46DX5m2mUdm/UC8Zu9Q2tQa8?=
 =?iso-8859-1?Q?1+BZtdYPq0genCcRiiyumI00t4t4U0jHjc0Dc6pAWuCcB3b5oWlDqobDBt?=
 =?iso-8859-1?Q?DQ5tyIO/LFmj44WxWjRe4erGLywvYxEO12Y7AXaM/A68Gjivn5x+jNP9ED?=
 =?iso-8859-1?Q?X2S5NLbqsr4DEba4SMhphXGQx99l/evq5CD/jgEQYaqA/7j7IMu42OO3dD?=
 =?iso-8859-1?Q?Vq/DIq4G7tNP9ygQls7w4psVjeP59MxMZGg0DOqCUXsFq1f9SCDGEY5lzx?=
 =?iso-8859-1?Q?NiF2w9vCl+xJuiT98FUrP2SyUm8v0V5rvARqJXuy9AHBmfuP2OKu2m8QzU?=
 =?iso-8859-1?Q?QcE3xtZ7rETatO6BNgBu2UKujifzmyNL/MxAB9lg6MOfJ4Tg8BZ86iKr1R?=
 =?iso-8859-1?Q?qo1qVEodOTEyVdkzpGfs/Tf4WNQdS4P1e4ScvduM+dTIjlsnqNbA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239d6d11-d1f6-42d1-61f7-08deecba9703
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:12:07.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdT2lQa8XKD/IpSJRHS9ANP8oVtV70VAor5xmTwyiH3s2q+VKNmYhXtB47K4XnR2TPD5fpvat9f9nfCudJorqJyJrxfXChSN1tASB+dMBc/wyrN7yHz/IYSyb6et1fBA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12640

On Tue, Jul 28, 2026 at 02:21:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] A completed dynamically linked scatter/gather descriptor will be erroneously re-issued for execution if its interrupt is delayed, leading to double-execution and memory corruption.
> - [High] Descriptors can be erroneously marked as completed without execution if channel linking (E_LINK) is configured.
> --

please double check above two issues

Frank

>
> --- Patch [2]: [PATCH v7 2/2] dmaengine: fsl-edma: Support dynamic scatter/gather chaining ---
> commit b8502bf27e9fa2ac70190840a26c1603f5640651
> Author: Benoît Monin <benoit.monin@bootlin.com>
>
> dmaengine: fsl-edma: Support dynamic scatter/gather chaining
>
> Implement dynamic linking of scatter/gather transfers to enable
> chaining multiple DMA descriptors without stopping the channel.
>
> > diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> > --- a/drivers/dma/fsl-edma-common.c
> > +++ b/drivers/dma/fsl-edma-common.c
> [ ... ]
> > @@ -55,10 +55,29 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
> >  	}
> >
> >  	if (!fsl_chan->edesc->iscyclic) {
> > -		list_del(&fsl_chan->edesc->vdesc.node);
> > -		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
> > +		u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, edma_read_tcdreg(fsl_chan, csr));
>
> [Severity: High]
> Will this misinterpret a hardware channel link ID as a software SG ID if
> channel linking (EDMA_TCD_CSR_E_LINK) is configured?
>
> If a transfer uses EDMA_TCD_CSR_E_LINK to link to a non-zero channel, the
> handler appears to unconditionally extract link_sg_id from the CSR. This
> channel number would be read as the link_sg_id, causing id_match to be false
> for all pending descriptors (which have link_sg_id == 0).
>
> Does this cause the handler to iterate through the entire desc_issued list,
> prematurely deleting and completing every queued descriptor without them ever
> executing?
>
> > +		struct virt_dma_desc *vdesc, *tmp;
> > +
> > +		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, node) {
> > +			struct fsl_edma_desc *fsl_desc = to_fsl_edma_desc(vdesc);
> > +			bool id_match = (link_sg_id == fsl_desc->link_sg_id);
> > +
> > +			if (id_match && fsl_desc != fsl_chan->edesc)
> > +				break;
>
> [Severity: High]
> If multiple dynamically linked descriptors finish before the interrupt handler
> processes them (e.g., due to system load or interrupt latency), could a
> completed descriptor be stranded in the queue?
>
> When the hardware stops on a later descriptor and sets the DONE flag, this
> loop will break early when it matches the link_sg_id of the finished
> descriptor, assuming it is still running because fsl_desc != fsl_chan->edesc.
>
> > +
> > +			list_del(&vdesc->node);
> > +			vchan_cookie_complete(vdesc);
> > +
> > +			if (id_match)
> > +				break;
> > +		}
> > +
> >  		fsl_chan->edesc = NULL;
> > -		fsl_chan->status = DMA_COMPLETE;
> > +
> > +		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
> > +		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
> > +			fsl_chan->status = DMA_COMPLETE;
> > +		}
> >  	} else {
> >  		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
> >  	}
> [ ... ]
> > @@ -931,14 +950,87 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
> >  	if (!vdesc)
> >  		return;
> >  	fsl_chan->edesc = to_fsl_edma_desc(vdesc);
> > -	fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> > -	fsl_edma_enable_request(fsl_chan);
> > -	fsl_chan->status = DMA_IN_PROGRESS;
> > +
> > +	if (fsl_chan->status != DMA_IN_PROGRESS) {
> > +		fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> > +		fsl_edma_enable_request(fsl_chan);
> > +		fsl_chan->status = DMA_IN_PROGRESS;
> > +	}
> > +}
>
> [Severity: High]
> Because the channel status was updated to DMA_COMPLETE in
> fsl_edma_tx_chan_handler() above, will fsl_edma_xfer_desc() then fetch the
> stranded descriptor from the queue and erroneously reprogram it to the
> hardware?
>
> This seems like it would cause the hardware to re-execute a DMA transfer that
> has already finished, potentially leading to data corruption for I/O devices
> (such as duplicated writes or dropped reads).
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com?part=2
