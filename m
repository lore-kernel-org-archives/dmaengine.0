Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBB32E729;
	Fri, 24 Jul 2026 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907795; cv=fail; b=JjubjmVtr93Tx1ITY2oN6bq6mIHFbeo9skOzgjN+/8srQ3/EsmS+Iv5RkY+xLxx0p7XIivZReaVqmFXCXVCBzqep4bJQ2Tg8GLwjGMuxIQowjm6DQzJCk/7lYrBNaD68VijB/Eual7fnG5gaWKzaxUN4oC3r0i0RiPBoEhSclDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907795; c=relaxed/simple;
	bh=3O0eChPb1UFx/VLPIUeLLqL7jb7/1LxUc1MUuSfKFEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=evZ4GYvXjCsmdCcC4paMUKnK7N7cAY2tIU0M0q0lA+y34x3+uzwziw2f0Cir/QV/CSMfliX31DUgqfSSdaP7gkXyMpj3msAuZLmmEZlihY3Qc+SIvV5V2nBgfn70SKfJV8Ov8OTncanoOX8s3WwOrOkL5yEs7AZ30eVCZc9nOM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Gkoc6jsn; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Gkoc6jsn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2jz0owVKR06Ibpaf64C47OXijHRYuqgw4NeokGnHuz43/cD5vb30ipBVcRSarEHBDmz4ScKx/FZWhLa6HnoUWaGtSDik7+zgHWtip2/Do6nGhB+JvWTsust2yMpQ+30i0r6zJY6nzwYBlK8Oc/m9YcGLuZ/knRgiHsWguGW7YYaA23OHDGFGPE5O+iGQ8Q85wXSUpuntH9wrDfuvTS17hj+GKy07nZouHdy9N/QelfHjZw/kY1MfoULSZMVdfX+uMDaGWKBzJUsniB12ahWsWTVDfKzG6xxFM5eu5wqor7eYNqe/QUJZR5QyBIgXL2RFm26A09XL4zYyNIcCA2P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBzY02W8M4rUG+3k9zaW1pbKVWs1ey8JqTc+S14CnvE=;
 b=vAvWEaut+VfSEH0GgXjLdNn6U3CqWIUTcuc2krftFhsf7MHcRsb4hkJELt4HaQkHGT74NU5OvOvTYt7K3T10nahpdjHz5yVTTHkbm3pXn8l16m+YJhjn73FjlRMC4LYE2zT7XK51ZkvPlFUj1poJTXMNHfkO50w1oz3ouvzLCIeBc9Ezmji4purCbSkLRW5Ov8TZrxAwaW48LKBrD0tULALIwCA5z8go59l7YQwf5zS//lXhTs1cayzSeQkF6hs3nfRvOp39HnT6bdEh9XOT9dhmaAq5mwVQF/BAR8g1H/yL2029ohr8pxY4h8SfVGHZYzLWacC3mt47/KNiLSfQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBzY02W8M4rUG+3k9zaW1pbKVWs1ey8JqTc+S14CnvE=;
 b=Gkoc6jsnbPtKpjaSy7bOEpq0z+GlZ1KbWAMTrG1tPLrI9MYqD5SjIhFaII02TarKv1ZckbhIXA/yVcRreXMgPQ0Vweky656ktf/CZWMntke4narUKD88oiu61PdGXl/OuYcIuRsQycof2+lV7Mu+DPd9EEwsy0XHn88wdQO1cwgu32fIc6awRP5Q9srzuUG0BTTQrQ+vXiGP2nXu8zZohut5XZkUIk4/BPmDRPmttd+ao2Ls/3oEjbbKN1566ajymp20KgQieU5ieqgt4kDBFe2cN+G7KSfdgPYrsLRLeHkoqHtC+Dfm8MtL9T/LX0xN02ifSHaPassSVf+4YHRCHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9819.eurprd04.prod.outlook.com (2603:10a6:10:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:43:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 15:43:09 +0000
Date: Fri, 24 Jul 2026 10:42:59 -0500
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
Subject: Re: [PATCH v2 07/19] dmaengine: dw-edma: Dispatch DONE interrupts by
 channel request
Message-ID: <amOIA52h3UeZA2go@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-8-den@valinux.co.jp>
 <amJH_IknotEHF5Nr@SMW015318>
 <3z6xrvrf726u2t63k4fqn4b6rxpr5dgkxhekyjcpmnqgtrnix6@htsgodh6lvkg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3z6xrvrf726u2t63k4fqn4b6rxpr5dgkxhekyjcpmnqgtrnix6@htsgodh6lvkg>
X-ClientProxiedBy: SA9PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:806:22::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c997a55-9b54-4965-6d37-08dee99a42f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yfbSmBcObt5gVzZ+zFzaeMsNPIHQ5mmC8AOMyfiE56/M6g1JYpr5EPw3A3K/YFun+Jvf3hYavm1D4dvfGxo4W4qqMcPwF/a9WNR1eSPoYq9qGG9LdjxplGtoh9fHjAX/z3ztq0iV2MCupacHQtiDCmPJv+z4zZwli4pJoQ7UGaKWjwbAhr8Gwx8XEFNET5RdRRk6uIg5CmpVURinZA5tb8dtVKfTokO2T7uIouDLKLZoj55jiXB6bXfYmuozHXOXfeThAj2bAM4Y2iNJGJ4UninCosMlqIwTqON1h5x7XKugvQ/GeZdpxSdfDBYuEti8BQKWm4i0lfveEcXucMrPhOfSbCBOZ5R+WkUcL98H79k0jULoK6gk14G9k2uf3vezCDkR+ny1rcGS95Wg30e92qSaZEusAzA1JOEZ0Tj1I5BPVPUg/8Ytk5xpmk8B6wgJa4M4aE9yOlyEju8WuM7OTIbgnZqsJyS9lNPQ52b71W4uF4Y1bXKxhVy/esORtRITp7jgOD/C32GVyIYrAkXu9c2iFkl2LnvS06MT0u7YqOa/clj62acfH2JdZDTHXRFOJhx10rny4CeOvNNJPtMQJJNomNBJT/a0Gf0Mcg6qCEtO93sR7tzvq/Fg6NawE1LtdGYKvWCNPOQZDw51EPRRZDlVWPyypc3IDlPuba4QBCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9pfMnXnj88kUsLdVNd9cUJNy5f8utlVkzTSfN/5IqEGt8K8JVZVtbFrsEu4w?=
 =?us-ascii?Q?uOXjIrqoHh+N8R7pObAJgUEwEtEMV+fsOHbSfjcBRZ+aWRtAh0Ah3ZBRSTqr?=
 =?us-ascii?Q?yNgj98J18GOryW/pHLwnprF/5EWolPRvSzjUDGwJqinmf0SkjLepQzuWTLBC?=
 =?us-ascii?Q?Xh5tqgcAYQ2IgOro3j7PTnPR5z94zWR4bczNnsuRNcSrGlhiw8I9UCeVtHTK?=
 =?us-ascii?Q?PpETACfmaVzePdx62KiQkD69AJerqqYY/bdiW75qLq33r4oOyYRIo8pP/Kq9?=
 =?us-ascii?Q?MtJmW07BWCDWsxsTG5+cmcFz6o68/4zIeQ3E6UrC/feW39qTUrXW1z7bmU36?=
 =?us-ascii?Q?doAkt9XYOj3mFBcKCHfLYAS4wxhTDM+kl524kJqy+ByqzUJmTPqG0s2m8uEK?=
 =?us-ascii?Q?Un0qZkjXnOi9BWyecBaPSj2t3KOqjDdVgjUfBxEZ3ehKO/Yrbehg2HIfzOEW?=
 =?us-ascii?Q?uiNhy7bRp4IKrE5ORmPR14If4XYVW3h5N7Lc5n/xC/8lalXGocfKKltiGwYT?=
 =?us-ascii?Q?7kOer8ngxSqdzwlSRYlUWM2SK2fCuMXmGw5AnPX/snM9X6nfCSsBqpoMabjr?=
 =?us-ascii?Q?gTY/jFrvk3qy8fViN6gcvU9nrz57B86KpH+wLXuXtR2xfi3GeoHJj0aweCot?=
 =?us-ascii?Q?Df7MeSwT6AI6pegf2lLj9aMiONfRM7lj5jFHa6WdRJdBerf4Hav+mpD8uqSm?=
 =?us-ascii?Q?gAgR9qrcp05CQ5QTT2AGFhGK2TJ8/jMA49Aji6u8SuqoHVnVisZ8K78m0tcv?=
 =?us-ascii?Q?Rrqn89oINxLgDJiAmLM3C4MQv9S5LfQlUx8KXBY0r9D0rJOdsyH3yaYtF2Lq?=
 =?us-ascii?Q?nXdLu7bv0mNKRHj7MmUDl4EYbfGcAMQsMdc3gLu/6aHItPukD1VvY17dgYyE?=
 =?us-ascii?Q?R6SPikPJhwKKvxG6iVP3x2Jnc6Lllsb6QtsS5ZAGj1/3ki59VzrBQF2WOo0i?=
 =?us-ascii?Q?LHunK1PpDXU58WGB1VmCbG08vkUNK4oOLVo1wcdjGawE9/wRXBT7rsPh40V1?=
 =?us-ascii?Q?yvUJoxA7tZlKHJQMTY1tflm0SssNY2IrREXVaTzwXySJjzJy8w9DRZBVy0wc?=
 =?us-ascii?Q?ul0TT9GNEkMpxmQtF96m1RG9pmFVoyyzVhKRlhDf+g47AfbgGxKOEEMW/O2w?=
 =?us-ascii?Q?4XB8S9XIzQ8JfROmLUxRWOOJTvDlwG8LUvItfBDCQlPyTCv6O9xR5ulT/OeF?=
 =?us-ascii?Q?WeGn55frkmlLwTB7My9m/3XULvnCjkwI7poQfPPNSNhNJoJ1ARppNQ3R73uQ?=
 =?us-ascii?Q?Nwrm6GPzZ3EDkaSxwvjYXghzcLnEOW5qPYanjPmSkbHJ1C/5l1koIN++i3D+?=
 =?us-ascii?Q?cC/Z0nI06QGxYcokHyqYj29YENvzwnHHw1StX0h8YznlIh1V68l8PM8EVCt7?=
 =?us-ascii?Q?FVSR2miX+9SAmZYqegYAy9fQ710l4VVqUMn1RQ31UW0oro267LcX6X5gmBrE?=
 =?us-ascii?Q?bNwkhIMCamjP2TFDR0x8Efb+gwXTnsAnuesNqfDvgzBcrsy/guWPFiWccb7g?=
 =?us-ascii?Q?6lx6euMw5sfK4NP15H4+eo1dIe/Ka3HMx7Gi9SFV/HTSXTbDGaV0ereLBTmO?=
 =?us-ascii?Q?QIcf2ihiomvf9VeY83L2L33weNM4c2To5Uly2z274Fh4enGdkMU+ims5OZe2?=
 =?us-ascii?Q?clFhw9IysNVOzooZRp25E54ft8jIKXqWObKjBVojEc8114K0IaAL0UK9WY36?=
 =?us-ascii?Q?fyZ7/oX4wiIpgCqfbFVSQfboMJQwTOlFecnoe7hp1xEP1Trai2ERlT81fsMc?=
 =?us-ascii?Q?Pum79mwhqE86vcarBdNapXV5DlzLH+FvG3+A8mu3Kw+cGdeU98/q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c997a55-9b54-4965-6d37-08dee99a42f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:43:09.3629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYBPTTYSNm6FjOkN93+NkzkeRdqyj0b7OtPvyB9wTuslIZb10ldvA9Fs/xL2t5++uFYa8MEW642nk6ls0L9Ii7jjYhSZTEBnCT9d30rQlelCD2cMuA0CqOV9WEC44JBR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9819

On Fri, Jul 24, 2026 at 01:50:44PM +0900, Koichiro Den wrote:
> On Thu, Jul 23, 2026 at 11:57:32AM -0500, Frank Li wrote:
> > On Thu, Jul 23, 2026 at 05:41:38PM +0900, Koichiro Den wrote:
> >
> > Subject:
> >
> > Check channel request firstly at DONE channel interrupts ?
> >
> > > Handle the channel request first in the DONE interrupt path, then look
> > > at the issued descriptor list only in the cases that need it.
> > >
> > > This keeps the existing behavior, including the current STOP and PAUSE
> > > handling when no issued descriptor is present.
> >
> > Need descript why need this change?
>
> This is a prep, non-functional change for patch 9. Patch 9 first invokes

Okay, just commit message show it prepare for ...

Frank

> dw_edma_ll_consume_progress(), which may complete and remove the last issued
> descriptor.  Even then, the switch still has work to do for each request state,
> so it can no longer be guarded by 'if (vd)'.
>
> I split this reordering (non-functional change) out only to keep the functional
> diff in patch 9 readable and easier to review.
>
> Best regards,
> Koichiro
>
> >
> > Frank
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v2:
> > >   - Limit this patch to request dispatch with no functional change;
> > >     move LL progress and empty-issued-list handling to later patches.
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c | 60 +++++++++++++++---------------
> > >  1 file changed, 31 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index 29f78405e9fb..fa104af4146e 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -682,41 +682,43 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > >  		return;
> > >  	}
> > >
> > > -	vd = vchan_next_desc(&chan->vc);
> > > -	if (vd) {
> > > -		switch (chan->request) {
> > > -		case EDMA_REQ_NONE:
> > > -		case EDMA_REQ_PAUSE:
> > > -			desc = vd2dw_edma_desc(vd);
> > > -			if (desc->start_burst >= desc->nburst) {
> > > -				dw_hdma_set_callback_result(vd,
> > > -							    DMA_TRANS_NOERROR);
> > > -				list_del(&vd->node);
> > > -				vchan_cookie_complete(vd);
> > > -				if (!chan->non_ll)
> > > -					chan->ll_end = chan->ll_head;
> > > -			}
> > > -
> > > -			if (chan->request == EDMA_REQ_PAUSE) {
> > > -				chan->request = EDMA_REQ_NONE;
> > > -				chan->status = EDMA_ST_PAUSE;
> > > -				break;
> > > -			}
> > > -
> > > -			/* Continue transferring if there are remaining chunks or issued requests.
> > > -			 */
> > > -			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> > > +	switch (chan->request) {
> > > +	case EDMA_REQ_NONE:
> > > +	case EDMA_REQ_PAUSE:
> > > +		vd = vchan_next_desc(&chan->vc);
> > > +		if (!vd)
> > >  			break;
> > >
> > > -		case EDMA_REQ_STOP:
> > > -			dw_edma_terminate_all_descs(chan);
> > > +		desc = vd2dw_edma_desc(vd);
> > > +		if (desc->start_burst >= desc->nburst) {
> > > +			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > > +			list_del(&vd->node);
> > > +			vchan_cookie_complete(vd);
> > > +			if (!chan->non_ll)
> > > +				chan->ll_end = chan->ll_head;
> > > +		}
> > > +
> > > +		if (chan->request == EDMA_REQ_PAUSE) {
> > >  			chan->request = EDMA_REQ_NONE;
> > > -			chan->status = EDMA_ST_IDLE;
> > > +			chan->status = EDMA_ST_PAUSE;
> > >  			break;
> > > +		}
> > >
> > > -		default:
> > > +		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> > > +		break;
> > > +
> > > +	case EDMA_REQ_STOP:
> > > +		vd = vchan_next_desc(&chan->vc);
> > > +		if (!vd)
> > >  			break;
> > > -		}
> > > +
> > > +		dw_edma_terminate_all_descs(chan);
> > > +		chan->request = EDMA_REQ_NONE;
> > > +		chan->status = EDMA_ST_IDLE;
> > > +		break;
> > > +
> > > +	default:
> > > +		break;
> > >  	}
> > >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > >  }
> > > --
> > > 2.51.0
> > >
