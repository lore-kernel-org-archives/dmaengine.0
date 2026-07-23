Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9013C366553
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825025; cv=fail; b=HJBYMZfe8qwATqw0602pjFachm1IObtX1ct+lbPg3cjGUvn1WxrmKNu7NolrAGnoR4qpkFNtmHMbxlYt17zvfyb5tKNH6bqofe1lwtba3o3hkzmYmLDrwrfwNS6fWaSjdQgCsGEwHip0m7htoQ+doohev5EPvyclaHZmNKcs+FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825025; c=relaxed/simple;
	bh=G4XkLfOK8Hk8qbNF9ogsqn2Jldnabgns1GSvO99oAEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NE6SA84pavXK2gPNB0aiYCiTVFA2FjOJusKJ2zgOY7+yenbA38gcXWLjcihqmQ9CUbjH/It/cON0FnfYp3ils8xAG0e8twghWluU5ryskBRFWkmIleGbs4YmMXTTS+A4EJeBjWuPPNVdMtbPWJ2HGKoWtMfTrBxLgIlKpmU/Yy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f+P3KxDb reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f+P3KxDb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f04ogysb30SMYbtKw9Wg+2vtmZ0cbilK/2CNbTs8igw3CU28WvdgtF03RekV+rkKs4CRKoQk4UbhShf/CbpIzIwEVC2/SCDKietTsCIkpgO1ed26SY5sAKixl2EAfir7O1pzkbkPOk2A6gOsYChG9rUS8nwcIIYvnvf/fMOUbXdP+uRnFb58gVl08xFDMfGYwDvcQsuPjD5ODGOvLQ1dn9yDe+VoU0gYJ4Sq3Tv5omd+oBo+DPbQ6nzHc9nkK/9pQbvkr2qf5FwqDt8M4PAP5bgZbkoOFF1JTLSHW8tuc3TQjBU8sVChxRa3/3zfnqWl5Y1C0NYr3GgsafVaN24VRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5O5oSkJB153RHtNc9CReIs3rsx6MHyMe4/eKFNuOaM=;
 b=ostkctd/I3/mKHYixYREsLiEpqrKBJILTYSrim0h2RdB0SrC51vxL3RKfzCmOVG/E6G6+iPuLFUV6rGlKfI6b0w4YT4Ci7Rn7mBN9LmfLmBGwNc32/eWyeLM1ykQ8nNYiiaOBLws5MQrNcA/QIEfBOTmr0O9pC8Ecbo4FBElkJZeF/KqkqtC7pMDFjeoeyAAOiO6y1lV9H+RKPYbKlWb9y3lccp57Q2yRdbK3a9O75Mb7dMMBzrXrCFM7l8c7dRT9L+BZsvqHiowds1awmN9TdrXmWgDNS7xjQAcM3+UDXCMUObw6M4bilhx1RpAwd4F8Tii5zQr+j9s4js8q7s9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5O5oSkJB153RHtNc9CReIs3rsx6MHyMe4/eKFNuOaM=;
 b=f+P3KxDbx1662+ZdMcmQgvtwuZwKwcy1CRBDzSvu+BuZGQXfIlcwR9Pa81XkM0YzI8dfRo81ECzLfAc78ouzGnB9KDPWwcrufochYBqS56eBQi9UOabij12vPLH5hnrY5Bl9aUGpe0ouyFMKqs2nxh4GUMcsiGQHZ641jLLmyJUndD7nOSLa0Ltm9TAT4JdMKFmB4Dh9nP4O98b0pGPGsaiaGfUIpoUXdyG3a/uQ9mKqYsMyl8QHo2pS77cV1wWRquDDslJkcIUzShaZu7ehosbs9qI8SI7EQ+uzBAPOdNIq82DvBWevu4HY02GInaeMIOKePtWeFp37Il9VGchD4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7714.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:43:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:43:38 +0000
Date: Thu, 23 Jul 2026 11:43:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Koichiro Den <den@valinux.co.jp>, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Message-ID: <amJEsX3XipBmJ7qT@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-5-den@valinux.co.jp>
 <20260723090705.9E41D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723090705.9E41D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:806:126::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: fe47a299-5d56-4d5f-5b69-08dee8d98b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|366016|1800799024|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KX+SR9Xocpd8PbOLLEmIUZ4icdTQ+/yhCCCBoden2n8JQIueuhdi5pTRNttHeh8sSPqIC4zsPQzGvoghqyQCICuaOEn1mvyODAFQ0WqWM4bNd7SE30AJI8PCReYZTQie0UVJP5a1TO9nsVHaMl4z8qJSypEJKOZ8DuPE62Q1ol7a8K2YkekzfLP2pt5derPhG5p1hbeUw8zaT/0Q2yFgw76SIu710kRucMD0nln4loWLWGgDQzDOaenZpxKoOckv9mTnela3zqUhNcY+lTRpOse+u2IuNBJ4vGvRz8Y3XII0N2zb3YM3RevJ+ksHHQFAQmDlz5TbGYspq2iUn94US7Vdm7BaFCbvOpigpKUKUmwXpkWqpwSiTVcyGueNX18m3+Kmu5+rqm+SiD8bl6SYfBpBjoMYSf93/YA/H32LsBz5lLFicl0jCf+/Sbw3PlcP4CgNQBlOGzmkNvTzBBwP3Vl/lO6Z9o9awS5AOt83cdd9+cW9YSR2xaEH1aatM48WKBpQjBWhDWefzTP4CqZplrjDqp3cCKDztmbikF3sY4cJekH2XMVrgUxv8H51KWU8AfbkhDfpiZ1jmN+hhcdJO087JhsJtTRhy89lcpKZSbE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cDn+Qc/UVKRwphO8RNWfoixeF+IB2iNSrXvOREWdkW5laGF9EkOEoB6ku8?=
 =?iso-8859-1?Q?8yPijGZc278Z7dZAxkqu1l9DqTNTGmPM2VCzQkQdTzAEMj/9DxbD9+7sz9?=
 =?iso-8859-1?Q?YmuVIXp5VSso3ZidkEszJt0ufDLB2qbja4Fq8S6cqOGmVjPB1ZDOoSiON9?=
 =?iso-8859-1?Q?snzdvQ6Tbi/1bX5VeXD5EL3fKj6Z/vknR7r5Ulbov+G26PUZOd4gj9K1j/?=
 =?iso-8859-1?Q?93xaN7FOTsKmgoO2jUbxhniiXoAG2Rtb3aKKpfiK8KSCXTKcjKpSMB77QN?=
 =?iso-8859-1?Q?4+DHHpMbxpZlLWMTWsRWp+urrviZu9scAAr6V5FbDc6eTX1Lpwq1jk/M54?=
 =?iso-8859-1?Q?nf9rnLx7fKcc1y1jUrw1gkMp+aMNQBh9yDITKJzAE2ShXFM1G1YMJV1rNX?=
 =?iso-8859-1?Q?RpVhbVbFdzjw7R27nfsQHmbTwpyxjXGd4vlwdthmso1KvMULuwQ66Zu2v0?=
 =?iso-8859-1?Q?Mgu4ouWwb0YFBGm2BWs0QWed9b44c83q6ke1MJIerV89TB6o78uBf8wl18?=
 =?iso-8859-1?Q?Ru/4nhIs8WpXMvxWj0zINiCO5YG1i5M+8+IpEjHCM+ovUo/wVAmvJFhJ/P?=
 =?iso-8859-1?Q?G/e8kLhmAv6aGLUl5jA+gOD+LrdKBxbDrmPrsxV02V49if5XafxAYHvFet?=
 =?iso-8859-1?Q?UcwF11HFvLfAtMP7GeAB4WN7DrpaPcYxEvbVsZWQ97Rczgkrq787cqLglA?=
 =?iso-8859-1?Q?Pw7X3+flpb8xvLOCUusoyUZgGCIr/zL2DDOOdif/IPo19AMa3al/yjtfll?=
 =?iso-8859-1?Q?6x3I5JjerdcvpVRW0k5XHUlmGnIpUqTQp2FfXDCBAJ5yiJPMzUWfvosUbr?=
 =?iso-8859-1?Q?mP95UocWe/dg9kpugRusfocVsbzFu+hN0jI6XsjqLsB5SZrrrD0j77A101?=
 =?iso-8859-1?Q?nCiIatEOWhfazmC5lJMrbwKwGdL/su0O31h3d2Mxn6gtKKUR4FrmN/ZLYz?=
 =?iso-8859-1?Q?i+Sz00bw9YYNjGFGbamyn77AfLHIabTXcLdWiRQS4YbrrxUSMR0p5XE98L?=
 =?iso-8859-1?Q?XbCd2uvATUbBP95P2KWBl/4LbBHLvmIs/ryKhxifXW/YOariumucKWtwQF?=
 =?iso-8859-1?Q?8Yk4O9pz6yD87c2iwZDUtQn49O2H3b8wqgHzfUoQ2AypSv+hfJ9CngSlvQ?=
 =?iso-8859-1?Q?U4KT656yv8FjKc6GBuK3jOd/Kdzx0aBc2DQjE2Sxa6IzuCuFQBkYGUGjFG?=
 =?iso-8859-1?Q?lQqkwnN3Z8SZcL8OSTtSa3IwIjG63oo5fjJtvcRjsH0pXfV4S7kJIOT6yb?=
 =?iso-8859-1?Q?MEMA7jgLbkRNBza1F5zYhZrI71Ps6Ibft6yppv0WksCW5peJgxod2WaiXD?=
 =?iso-8859-1?Q?iBIBXetezzFx7lF/AAUDOEQnQdvqEJnOKWEc61yOQqGRSoMtAAesW4eEeS?=
 =?iso-8859-1?Q?EQMskkJgD6VMh9n788slPcrPGieC0KCKtGLWF2bRCGkv8VSwNLxzXPwQvx?=
 =?iso-8859-1?Q?OOkHOtzNXnDSp5IxU6gdtVa3Xdq5eGLA68bxgfFLezgFpiOMoVAnhauFz4?=
 =?iso-8859-1?Q?Rvz17b7mGdccAUKwwdDcwiDGPup5CM+3BS1Fy5I43NIqG0QpZ2wKBbhmVm?=
 =?iso-8859-1?Q?0EudZF6WoghExyyvLGg9wB8KntcPqwZdQ0bpDM1B/osap7L3ITGC9qINBP?=
 =?iso-8859-1?Q?/TwfEASPL1QH4cUuK+PX95JfbAfsICITKLxuXOzl9ZOWjuS/WH8R98tA3A?=
 =?iso-8859-1?Q?Nd+8f+RNlr1rpZW4nJZ4XMt77kgiGLgP5h+sc7kwNVIoOtlg6MvK52dKNV?=
 =?iso-8859-1?Q?R7tTrehX28btUZWjFW4X47fAmH52L4dB3r1bjhrGOLxxkc8St0Sj8JNjjp?=
 =?iso-8859-1?Q?0m5RY8KUMxYuQvoNFBnIzuf/TYRQqLe5hatYF1QM3uU5jHoNVjCf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe47a299-5d56-4d5f-5b69-08dee8d98b96
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:43:38.3940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QjSf2GIqiTgZtOBd43WadF59P4+gwP44dvvr2PB0C0H5/7bogOzp8Why7iag61h9luPvDZ0+oWF2bdauz+A8gEcIg2558vHW0CLDKLaTMCyiHLySXdW+Bicx3n1FsZM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7714

On Thu, Jul 23, 2026 at 09:07:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Ring buffer capacity is permanently leaked on error and termination paths because `ll_end` is not advanced.
> --
>
> --- Patch [4]: [PATCH v2 04/19] dmaengine: dw-edma: Make DMA link list work as a circular buffer ---
> commit 2d5b6554b58830487f70a13eab5e1ac3de304658
> Author: Frank Li <Frank.Li@nxp.com>
>
> dmaengine: dw-edma: Make DMA link list work as a circular buffer
>
> This commit updates the driver to use the DMA linked list as a circular
> ring buffer. It appends entries at ll_head with the current cycle bit and
> reserves the final entry to link back to the start.
>
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
>
> [ ... ]
>
> > @@ -645,6 +687,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  							    DMA_TRANS_NOERROR);
> >  				list_del(&vd->node);
> >  				vchan_cookie_complete(vd);
> > +				if (!chan->non_ll)
> > +					chan->ll_end = chan->ll_head;
> >  			}
> >
> >  			if (chan->request == EDMA_REQ_PAUSE) {
>
> [Severity: High]
> Does this leak ring capacity when descriptors are aborted or terminated?
>
> This block successfully reclaims ring capacity on successful completion by
> advancing chan->ll_end. However, if a client driver queues transfers and
> then aborts them (for example, via dmaengine_terminate_all() or during an
> abort interrupt), the descriptors are removed from the list but chan->ll_end
> does not appear to be updated to reflect the aborted descriptors.
>
> Since chan->ll_valid remains true after a termination, subsequent transfers
> will bypass the dw_edma_core_reset_ll() ring reset logic and continue
> appending to the un-reclaimed ring.

Make sense. Need change at these abnormal case.

Frank
>
> Will this eventually cause dw_edma_core_get_free_num() to permanently return
> 0 and deadlock the channel once the un-reclaimed slots exhaust the ring?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723084150.521366-1-den@valinux.co.jp?part=4
