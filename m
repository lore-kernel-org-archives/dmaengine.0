Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021077.outbound.protection.outlook.com [40.107.74.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C132BF3F4;
	Fri, 24 Jul 2026 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868652; cv=fail; b=jatPFGBg1E/PYYiSB6Dcl2RrnqUDI8tUn+FD9B/yuz2aK8U/YTkPHoHbPlnIuuzIcRZAp/QwEZIIGv3C3P71ZNHAuekpoN4AvT3d7Uq9D7CPhL6har4V16Uy8kqjYVHa45Ot3VkQY1mKIx7mLVDcAIuhp4We8sO81NlEdJLMczY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868652; c=relaxed/simple;
	bh=6gITzVv0UuMKnZfMykEOJyIlq4KxvjpB9tz/d3Ahb/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BfDW5BC4k15O+72B+VIO3zBhehd53xhIAUf5MHSkW8Ka5sswKr19E4IfLOXwx59OJ32xPJ1b4qJd2nlTpbjQcUmjoBpAv8lZ9Jf3wCwC39H26IYLq2b/YlS0r9FoC/FJ04zRGIRZ1A91dQGDvz0XAKVY77i4RHwMVAEciHISfkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=TLVarvyV; arc=fail smtp.client-ip=40.107.74.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="TLVarvyV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnqutQXCF29U8/LKF15DdOKG1j18G7YXDcp9F9P3RYreXBnycy4XdN8Djb/OiDKk5yrAjJPsar19aiIecqnNfe0DNEJPhUfgc3G3wOZnGd/kc6kFFN922r0C/wuxOnYosAIGRewRkN+eQJjQAIXrpZWRmLtHyrPs2lE04eY4SoEN9NzvyX7NIr+KkdPQqFKHaGGreCZiGWp38jswVUgwNoTaZLSAX6afuNA49Nfa5EB2EvAhezaeqKRBOZjLOj0QUSITkiVTY7lbIy4zfG2mc79y9MxFradOEY4kHPzvkH7lROSBxIT36r1yLJxAM4dpce54043rP83xM81AngFMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjRJf/In44QaL9rWBdlRs2Rc2kYHNag82KCOOMFqyr8=;
 b=Gr1HtY1jH1flCCh0XYJJ8qn9EDW4YPweNkH+v+JGILqRCTFVL6ddqRgVtXg3DNtLjvXmTR98wMtLhqOT9aLhQ1FU5oBYQxy0fDVqMzXQfsqPYgmXZc3uYmdd3UUMYjKHDLbpg/rKA9Hc0ScXFvPcfpMUFL/OODUXWE979GVILwP4Dqpbc1l5Bcie/wp91DeR8st25UMTAk95ymbTdXsbm/76qGHtdxAnUemCx2CPfclZoSNc6ph/IX6Aru/cPqfBXfs3WBTc5Wq6ePOLPI347tLW5BKdRj0mwgZReqyKLrgzvTquUNlZqbfP+sZ+TalniUVzpjYtStGzla+uIXVUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjRJf/In44QaL9rWBdlRs2Rc2kYHNag82KCOOMFqyr8=;
 b=TLVarvyVUApjSuvqtFPwyq+OJTHjnQ/pyllf1LGBpKfSpOkFtZjq5YqqGFzuW/1pDNyScqKetYF1i2Mda5mvvTp8dmQxyTzX+L5sSKYy/hycNCy2kTgXi8oruLhQD56ae+O70+f8udNkdheGxaiAuQj23dZhwQZCk4SHGRF/0jQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB2931.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 04:50:46 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 04:50:46 +0000
Date: Fri, 24 Jul 2026 13:50:44 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/19] dmaengine: dw-edma: Dispatch DONE interrupts by
 channel request
Message-ID: <3z6xrvrf726u2t63k4fqn4b6rxpr5dgkxhekyjcpmnqgtrnix6@htsgodh6lvkg>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-8-den@valinux.co.jp>
 <amJH_IknotEHF5Nr@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJH_IknotEHF5Nr@SMW015318>
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB2931:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbc51da-c647-4fdb-6b67-08dee93f1feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|1800799024|366016|6133799003|10067099003|4143699003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OYPzOgjuDQouSgBpkR/O+f1QVWwo7e10Z63nzW4bNeK92gCHx4PW3IBc6nrnRMSgxNFnCYmqsMobiT2sMe65JTRUedeefdj48kUXTgpp0Ai4itkkw4dZDRkvhBFEL45SN0nWrAF0b/2yFXaN4hcgSetowlUdUCvKdmpaIsQ9T/llT4yiCtJE9DuqlIZkvkhP0k0pJQKC0rvBnFoWS9RI6wnsjIWtXiFCAa91uRT30eZOAK4I87Z3ELBC3ctMbV3Rs+9DvkSTog60dNqzDEdsoTCUL73ZvfH6ggRYf2BqpHx+pQM3jyWa7sSMHcScIICrYc6ILey/lMcyCvlxb0y8xtn/yMhBXS1uQmnSW9PxZn4uPT6npCxxwWA/W37E9o0zwd6kbogjQNLmWSoNy9CRsDNkymw1d45OWAHai/KVIYSdBD0j9ogthdIRoy1ETo+U0Y4cGX2IiKqUZb87m5uP8Ji3huKP77mYNkVnBsWStn0nCj1zAdZmq9AFC5s0eH+1NotO1dp1xTf+oAza88/aiNDEK6kWchKIOOkE0XZgzI0rYPVRcLju/xweSOIkmH9Ftp8Mhe91GVr49JzsqKKmQorIFPFZVsujbpmjt8VASC9qNn0Jr0BMxaVI5zwb+2kwhlPCl4vyxi7BR8Rf6XluVxY8jQAQMTOK8jrFBpzf1FE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZSVKnQlTZaChVCajTNcW/j+BQSSAX4JaUb0ynTn7Z1dcSAgpktwyJ5jmYxl0?=
 =?us-ascii?Q?pZA+AmO3NHDoMkoUKbgn1jiVKd94jI45R2MFjjGsGtuUs/o/jAt3/+Wasjmi?=
 =?us-ascii?Q?LO7Ev334gG1Lr1xA6Si2cwUMmAkztQqngatw1A/21gFPQxlrlrwwagfZ1vVh?=
 =?us-ascii?Q?uKQCw543t/waOScAe3VcTBgXvlOUnfc17pkB1+nlGUHUCPlmaNVwPXNZTjm8?=
 =?us-ascii?Q?QIGdhAy0DCuwOTRQxxP/JRGKvdOGCnGVwsLrRGP9fDcW57eQeV1W3YkBbWrz?=
 =?us-ascii?Q?mdx8zfqMkSu7dowJ597xB8hpi7GHFwxPyG3I6naSKMF8dy5o/jkpVaYh7pX1?=
 =?us-ascii?Q?ZY3wYzCVPghcXr8G8jr+hQFe2kT9znHuvpcFccFZdM8f/bDaoAVOpVynqQAr?=
 =?us-ascii?Q?rQhk5ZQCM5F2v8/CQBpN6ivNN5LlcSEpTHwynGb3srIl0QM58cNHvy1QFiVI?=
 =?us-ascii?Q?qjmi1q+gOYYOfJk9L5jFE2XvMN8KNE41gjFy96AMg+LNsnVn3WZaU+KKH4zi?=
 =?us-ascii?Q?5jZ4CAHGH4tpXZSpEAyYGXUvTHZzwWmIuzaoFZo98dfq5Gqtd68+dOeh/92x?=
 =?us-ascii?Q?jObIejfBP9wkRJoDT0UDXucB4kts+kHVZ5uboMrR41eaddggrX/9ahybMRlv?=
 =?us-ascii?Q?dTdcsVhDQhVAFZ5Jgud8WaS3gsmDg3L4YCidKpd34hPO7pz38Ony4hBr2hnw?=
 =?us-ascii?Q?NHdCswpOdMhGQrfBtY37bt/C1hU2H6fHpzP0d+8fD85SKNJ1WqCaqkaRtM9M?=
 =?us-ascii?Q?hjJwUirQZiN33xPqdcfgrajGx4R6FLjIaY78v7LSLAaMnxe4eg9C8tx/CIV3?=
 =?us-ascii?Q?vhciNilq6pfd6kIl/MfGm6Qt/opLopB0GUbaIXr/bWXlFWzAnYOj3aJLs3Bj?=
 =?us-ascii?Q?Eyb3akjCtIgwUetr69DFEDDZZ8sl5dzjfG1nhSeEyVVo8/1D6TrUkGB3Sh87?=
 =?us-ascii?Q?JjNhmOwM5Cjv1nCsnxviGhTOqeVwnZRz/9WYH7GFM+SCQw3h6PEr7HfybT2e?=
 =?us-ascii?Q?yRCSWKy1o7jwePcmC38plGsKPztXEDBDU+vTF2rl17z28fYasTVsFsfej6hZ?=
 =?us-ascii?Q?jMYEvReWS6Ps3aL1W/AqBSYywJRMaLAB1+e5ueeomx1DKbTSTZ3XA7WPJI2J?=
 =?us-ascii?Q?0Q+kGtGg6H/qGAfuRkV7jB9rjs7A4jHSQM1ArYcj/MypKZ+2mOdn0+xTvR4S?=
 =?us-ascii?Q?6FHLbKRvfuJFUKXIYVvvlqvoxKss2qWXGPFDTTj5gsNNJueserJ+b0RwzYyT?=
 =?us-ascii?Q?HUEwluMj3Z8SvQjoAtD4zjhDCEO/3ijmx9hzau3yiAI3SoWe4cEI+dyFNw/N?=
 =?us-ascii?Q?p5ZuFil3uOFblOwlpoOPgsSiFgUB+fjgpZZ1+pygGVvrR+UqSQ7UOBv8qI4B?=
 =?us-ascii?Q?p0L4jTKexlI7+XS7/s91YWuoKV2dWan8ozDgiSDSfB0L2imn6n3/YG7oaYiE?=
 =?us-ascii?Q?Rj7VcsYWhUU8vjspwjoV7M9PygSvbQs8E5ShZPU6K5egzx1r/pqCL3R/4D4E?=
 =?us-ascii?Q?+L8U5mt3DQ/LQFHAXNqB1/FhfNnTly/OepLLujTCs24Rmss67+cwP4vapuxt?=
 =?us-ascii?Q?UPSxTMAptAdl/3957J46pqYEoDIl0vLmpdjG9awy5r+/CjtvXLQ2JctuAlrw?=
 =?us-ascii?Q?nCrFwmM99BMs2oHMdxfri28sycVVTMaCsfothdfSm4wbJBJIZFdWUTMbe+h7?=
 =?us-ascii?Q?ZdiJc+lBf3f0abJHHbDGdOEPIxn1dKId2oFOjHGBe7bFvkcfBmrZZ1+/TxI4?=
 =?us-ascii?Q?U7yFXVQU1kPcsNgeeKQhUnbVpaej2u8Qk3aaSwkFCPQZ6yLvvWBF?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbc51da-c647-4fdb-6b67-08dee93f1feb
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 04:50:46.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnrfq9Y7to8qN1axUbuyzHjn2y+Ag4mpCiFHKoojaPRi/ah80v39rKmPwaFFNpqEX9AXWQE/J6Qye12SYWW6pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB2931

On Thu, Jul 23, 2026 at 11:57:32AM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 05:41:38PM +0900, Koichiro Den wrote:
> 
> Subject:
> 
> Check channel request firstly at DONE channel interrupts ?
> 
> > Handle the channel request first in the DONE interrupt path, then look
> > at the issued descriptor list only in the cases that need it.
> >
> > This keeps the existing behavior, including the current STOP and PAUSE
> > handling when no issued descriptor is present.
> 
> Need descript why need this change?

This is a prep, non-functional change for patch 9. Patch 9 first invokes
dw_edma_ll_consume_progress(), which may complete and remove the last issued
descriptor.  Even then, the switch still has work to do for each request state,
so it can no longer be guarded by 'if (vd)'.

I split this reordering (non-functional change) out only to keep the functional
diff in patch 9 readable and easier to review.

Best regards,
Koichiro

> 
> Frank
> >
> > No functional change intended.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v2:
> >   - Limit this patch to request dispatch with no functional change;
> >     move LL progress and empty-issued-list handling to later patches.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 60 +++++++++++++++---------------
> >  1 file changed, 31 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 29f78405e9fb..fa104af4146e 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -682,41 +682,43 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  		return;
> >  	}
> >
> > -	vd = vchan_next_desc(&chan->vc);
> > -	if (vd) {
> > -		switch (chan->request) {
> > -		case EDMA_REQ_NONE:
> > -		case EDMA_REQ_PAUSE:
> > -			desc = vd2dw_edma_desc(vd);
> > -			if (desc->start_burst >= desc->nburst) {
> > -				dw_hdma_set_callback_result(vd,
> > -							    DMA_TRANS_NOERROR);
> > -				list_del(&vd->node);
> > -				vchan_cookie_complete(vd);
> > -				if (!chan->non_ll)
> > -					chan->ll_end = chan->ll_head;
> > -			}
> > -
> > -			if (chan->request == EDMA_REQ_PAUSE) {
> > -				chan->request = EDMA_REQ_NONE;
> > -				chan->status = EDMA_ST_PAUSE;
> > -				break;
> > -			}
> > -
> > -			/* Continue transferring if there are remaining chunks or issued requests.
> > -			 */
> > -			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> > +	switch (chan->request) {
> > +	case EDMA_REQ_NONE:
> > +	case EDMA_REQ_PAUSE:
> > +		vd = vchan_next_desc(&chan->vc);
> > +		if (!vd)
> >  			break;
> >
> > -		case EDMA_REQ_STOP:
> > -			dw_edma_terminate_all_descs(chan);
> > +		desc = vd2dw_edma_desc(vd);
> > +		if (desc->start_burst >= desc->nburst) {
> > +			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> > +			list_del(&vd->node);
> > +			vchan_cookie_complete(vd);
> > +			if (!chan->non_ll)
> > +				chan->ll_end = chan->ll_head;
> > +		}
> > +
> > +		if (chan->request == EDMA_REQ_PAUSE) {
> >  			chan->request = EDMA_REQ_NONE;
> > -			chan->status = EDMA_ST_IDLE;
> > +			chan->status = EDMA_ST_PAUSE;
> >  			break;
> > +		}
> >
> > -		default:
> > +		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> > +		break;
> > +
> > +	case EDMA_REQ_STOP:
> > +		vd = vchan_next_desc(&chan->vc);
> > +		if (!vd)
> >  			break;
> > -		}
> > +
> > +		dw_edma_terminate_all_descs(chan);
> > +		chan->request = EDMA_REQ_NONE;
> > +		chan->status = EDMA_ST_IDLE;
> > +		break;
> > +
> > +	default:
> > +		break;
> >  	}
> >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> > --
> > 2.51.0
> >
