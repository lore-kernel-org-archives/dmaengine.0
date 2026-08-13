Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021093.outbound.protection.outlook.com [40.107.74.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC252D7386
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609908; cv=fail; b=Dr3CRvXCGN8p6gWPRvweErx1Kuf/n9hAfZRpaoZKCFDOlWRaL46Qw0r1kI2U31AaOcztXqcJ6IJ34ddHDAzDTv7CA2vf7jmDsPX5xCYfGcjrsX9Y23HtT/oVFEApxhhIqIwg6niP7FsNXIkDlqVpAIUORbAfagwROm2/Z38Rav0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609908; c=relaxed/simple;
	bh=f/dXab9im69w6XuOUCgB6JwnSnjfso5LxWDsCvsiOvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=afEsGcIKWOsGj2pqEheoFyxOSG93dJsf3UiU4VzOxH/82wqL3AjVmhBatBDTcM82d9d4G9eDhv+whVHuDbjLMpLw4Fj5mw5A2h9X5BEBCTPHFdB81o8glGMbavvmbK5vD9B1SK0jED71th2GugI+CsU+oS2N8y3ktjw8ft5otK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=PYM/5lKJ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.74.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="PYM/5lKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtVPeWTlbVNdDP7TtAKEd1B6pLungIDFycNppnZ67XE7HCL5mTpYEzyr48rj2WvWKpTFUuXAxvY1Z6i13s1GK/rBQHQOLQ9j/k+v+KeoFKWmjQ0FUHJ7t2L/jDM45Lym6NNVn3mIaYuWvDFJoL+1F20gyqBbclKOrEW3/MJcHbegE3V3D3rZ5qJ44X440Mgp+W0ls86SVFGadbMWF1kacWh0pCeQa01NZYrlGSk5SLhRwu70zlEi/WgI/JV1ydBM9nuRH1+fN7yzJGs1yzMqEBgY5fqhh+l9kKP7gduNVtTQLbd9l5sIUwXxq0Szs5ZoG7v5DWvBgg/YCnGCfWkb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9Z/RqzfXB8uAbAfC2rPKNuCaAX3kJkXnJtYJsuL0bQ=;
 b=FnBsqYarDXsHG4V3aKtsGLWpHrxeecJjpAnfA/4jFrMBAbP4paCJ5OBleO4Md9YjTZq5QFWtY9cn0kbuo1L8G1fQbSVYNPM5tb0yTcAzq/OEhRCU1rdUVwv4I0IRmpJaSmBUexq1uilpW/yU2xnAWH8Q/iEhi2IYyr8Ym3+AD7tNsH8TfXy4SPvGS3KetJk59DiiE3EORwQlNcAqc+bn6tUNX4r3PeXD7Om4p8SN+M77ebThYJWVCfipGLJmBq6kH874Q56Sngt+KtZdIv7sc6gdvmc9TLmXIOgals571Q0qkt2KwU5AI/GpYDLtrAo63zbk07s3jnY6j/fIIEpqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Z/RqzfXB8uAbAfC2rPKNuCaAX3kJkXnJtYJsuL0bQ=;
 b=PYM/5lKJk0jPXTl54Gtbnxql8OwR238ta3G+2Bvl2ajqeFKeKxNYW71CGtu49cRp4YNMloUmsf2kkbP2xJcHknKXFanTchYJN49OC9R9xaQF3DoyU851s9gd3N9MfPBmPeP6WRbQW7e/FJPSFOMpzPy9a1sFId2dMmE5XAjGiBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:468::22)
 by TYRP286MB4443.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 08:31:42 +0000
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71]) by OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71%6]) with mapi id 15.21.0315.008; Thu, 13 Aug 2026
 08:31:42 +0000
Date: Thu, 13 Aug 2026 17:31:41 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank.Li@kernel.org, sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v5 04/24] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Message-ID: <a62w2vkektwuksvz4oqkozqu27knzsqdroj7xprfm47twz5cs7@rd42oqapg5z2>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-5-den@valinux.co.jp>
 <20260812161409.5CD751F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812161409.5CD751F000E9@smtp.kernel.org>
X-ClientProxiedBy: TY4P286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::10) To OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:468::22)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOP286MB7730:EE_|TYRP286MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a364f54-f051-4b44-f80d-08def9154db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	AmfZtdDEFhZ3+IZPgtNmGTsRme+HJiPaAgFKcWFsO5m53R/tczjLM78s0H0UTS2gvs9qXnEqMcPjvxkHuM5kFf1RZ3GXLe9H9Dwu2+sRAScCV2vuDUQ9BG7VAYFeYwOtJ8q2ITn5e3E+zL53l8Y/bLUl7hYVZLN/wRNuVrfdNCSwjyXPXD6zJxh/+7Zff3CtiqJKmrBd/WWh7MsegIApLNeKG4hRtfMH9aeE6ojRdZN4UU3muOpc50XsAsGF3983DtdMYN/k5gRInDxfl9lCReF8DEkaaiTLesn3Z0uwlHpRUyHOi4kptVVIiByFowazRDIggq3pTDCnumX6XZXo/zJS/rfVlN+kElnqxQ7QcllfMxVMIxwiXhDwTRwt1NyW5f4K5aHvYoMSkZ6dNWWHxQXyeJqPf4s6aPTnlQOFKOZ6CV/tctgCXGPhkR/j96RKTWz41Fby8SUDgsEKgQL2qZtWk2KyhfPI/8DAJp7elsmNa4EE2aLV4w/tZPO8t2bhXp281FnMrm/p6llBsqDhkbFEDL6CdoM5T30Wtwn2a7X3sSePHp057L0h2D9Dw3DKzIaxSSJTfZc8/NvI6IGdH8IJQk5iVj8gDe5shhniVw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0SK61hxlJc5uNi6qsfvz+PLW/XG3JUq4J6snDEbezC2N/+AIUSv7IhZ9MN?=
 =?iso-8859-1?Q?OeeukI2T3fPCeLwJ64XPPFybCcppqC2IOT2TON7OEJ3hy2L8LZgq2AJA20?=
 =?iso-8859-1?Q?gnIf7WJxUQJhsvqpxb6OVkld1NJlSRE5z5yYjr5HpinBgLfonl1aQYG8/o?=
 =?iso-8859-1?Q?v7jKiisxVM9xewUoqBK6z/dbUrB82RDffRf+9ocjURPQOvxWinl2nlX0tO?=
 =?iso-8859-1?Q?+T8PEDf2IGWS0a3Bst1B8sfinE536A1kIdUrh2GI9A7gQ0wgw7R3HfKjxr?=
 =?iso-8859-1?Q?FpF/zp08O2ZKYHafCXHhBICeNjyH3bBWza0wg3r1M4qQ/EYg4k/3MYxbth?=
 =?iso-8859-1?Q?UMX714vPeVSmXMNTdxBk6RDYmEiJDMoFAXkMWg4iwisw0laoMNLarHpmfF?=
 =?iso-8859-1?Q?UL8Hkt7pwY0jWPzERakSgEU8QW7rHqh7k7kvDAIoewCvxtIeGrrnNxLQb2?=
 =?iso-8859-1?Q?5/WDn79Lk8FeRhxtU0DM8UkoF/z195DR2c+oaa4hTObgzSnCQdS+f2zP6e?=
 =?iso-8859-1?Q?Kb+U2JGZ0Obr5AyZsiUQnqEswB7XERRGNpFcSgVvNyOxzowfpneuxYoOs9?=
 =?iso-8859-1?Q?AIxsIB0eG5GoehPprPgkgW+tgXrdZ2ReIAdyT+MaMfvddTWj6cIfRnA1Vk?=
 =?iso-8859-1?Q?Ap+E2N1wv2Hjd0U56Ot7wTp3fcHPDrjDXs6Zu64/k5OtMZ5X11B0jSGalx?=
 =?iso-8859-1?Q?l4Bih0QEYp89Ws5D2ocgUJERYFFXru5+Z66c2t6pqJPAX3hoSBAKOpNDFM?=
 =?iso-8859-1?Q?aTv12erqv3JdjCrqR9KddVdMdwyvHOZZIrQaK1akoULWmUpbZBfHNZu0bE?=
 =?iso-8859-1?Q?tv1/Xz4gkIh+RyyMCDs66S0ya6owF4/22/zYpAUbM3jTQ7gL7aZSeqoQKM?=
 =?iso-8859-1?Q?6PkVd/YVz8+wDDvhkruMj9B0sKnuN9zBS9OmLMIBF6Dp33NBFcTXJuy5R9?=
 =?iso-8859-1?Q?4wqqPbQmqesTo6+K64j1kQUr1IpW+Xolb2Y0CYxL/3fWwdzHSOZ9a6yYgI?=
 =?iso-8859-1?Q?j/ncz+cvpTbnWDUJ+TqkT2X6AOC2DkWggkLvAXS6p7ETRC90jNy3lgMEHP?=
 =?iso-8859-1?Q?3OeUFmpev5qRYLXNYinPEBFiNDipB462hTo1JEWwNpxjrheEJ3egNcD2WZ?=
 =?iso-8859-1?Q?mG8zHVwlODtl442Jwj4T9f4tcWo25lubwAWbehiMk04BbmgUHwH7qMxTfV?=
 =?iso-8859-1?Q?tQOwF2ARqZvygUoDHYCrD94e9/ldrDBMOOCpWLV2uOKDH5d8tKP/ERVQvG?=
 =?iso-8859-1?Q?nDRvPu+yki68NbCrdPEFffgGrTSL7ValuwVnnqc6/miU9CeV+oCby40vaY?=
 =?iso-8859-1?Q?CT+btLmPvMjgtOb/skbju+C34gwJwgPb3/It/QdDlYopuvpPIoOLgx+Sos?=
 =?iso-8859-1?Q?GLXUTG3cSbbXgh0vycpmz17hr9irPrsAQ7G9aPB1FZyk3X8Oa5Yv7xwele?=
 =?iso-8859-1?Q?FG/mm8tPPiUoqxpRjrxgokmkBx92wFKtwg3Xcd8/EGliHUDBZqPRYHokFr?=
 =?iso-8859-1?Q?g7i/yfNBNxB3xRQ9QVhoH3SadQ1/BjGoJORuQuNtMsUKSNzGIJXhLC3K53?=
 =?iso-8859-1?Q?5mHS64VleMH3bkH5yKFS8RWJCbx+2CE2/U9NZM/lhRAMgCt5BJ7zLwBAfN?=
 =?iso-8859-1?Q?CV54j1Qx4q1F+FsVB9nJzzj6qIMN/C0A5ZnBPyL8zlCdz4cTy0P5QQyYsp?=
 =?iso-8859-1?Q?m1hle9kKrtFNRiKSk9vOme6NcyftzQuhcZqRTy6ghB1avFlGPdaxfD8PMF?=
 =?iso-8859-1?Q?3EcZIZcX7KawLbRh4lGqT9p+y25drL0HEjjd5lmDuHLkTKxgTAQHSd36D9?=
 =?iso-8859-1?Q?/65dczqCGzmhR5iHeRyLBHSh1V9zvVsGn4qxFNHauRN/SdQ3O4SU?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a364f54-f051-4b44-f80d-08def9154db0
X-MS-Exchange-CrossTenant-AuthSource: OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:31:42.7203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/+NfRWhDJudpbdtRzrf7ohEtfFVp4B5yVZIGVrM7sHKCErp010KKIztqER1HIRBh7HlhLc1XZyz+NpwKARSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4443

On Wed, Aug 12, 2026 at 04:14:08PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The driver now outright rejects DMA descriptors that exceed the hardware linked-list (LL) ring capacity, breaking support for large scatter-gather (SG) lists.
> --
> 
> --- Patch [4]: [PATCH v5 04/24] dmaengine: dw-edma: Make DMA link list work as a circular buffer ---
> commit 4de65eea41cbb28142107d984aea6044ff700244
> Author: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine: dw-edma: Make DMA link list work as a circular buffer
> 
> This commit converts the DMA linked list to operate as a circular ring buffer
> instead of rebuilding the entire list for every transfer. It also adds logic
> to clear control words before first use and rejects descriptor requests that
> exceed the usable ring capacity.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a6bb68ffdfe26..1af262b6e881e 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
> >  {
> >  	struct dw_edma_desc *desc;
> >  
> > +	/*
> > +	 * For now, a descriptor that does not fit would stall the channel
> > +	 * forever: reject it up front.
> > +	 */
> > +	if (!chan->non_ll && nburst > chan->ll_max - 1)
> > +		return NULL;
> 
> [Severity: High]
> Does this cause a functional regression for DMA clients submitting large
> scatter-gather lists?

This is intentional and only an intermediate restriction.

At patch 4, the circular ring cannot reclaim entries before descriptor
completion. Accepting a descriptor larger than the usable ring would therefore
leave it stuck one the ring fills, so explicitly rejecting it at prep time is
safer.

Patch 13 adds ll_done-based reclamation and removes this check. So the final
tree still supports descriptors larger than the ring. Patches 4 through 12
temporarily narrow what can be prepared. I would prefer to keep this guard so
the circular-ring conversion and progress reclamation stay separate.

... However, this might become a problem if I follow Frank's suggestion to post
the first 10 patches separately and the follow-up takes time to land.
(see https://lore.kernel.org/r/anzgNmxSV2vf1w1X@lizhi-Precision-Tower-5810/)

Frank, what do you think? AFAICT, on the integrations I tested, the LL region is
4KiB, which holds roughly 170 LLEs, and it seems unlikely for one descriptor to
be that large in practice. The in-tree nvmet_pci_epf consumer, for example,
submits each segment separately with dmaengine_prep_config_single_safe().

Do you think this temporary restriction is acceptable in the first series, or
should I preserve existing large-descriptor support before splitting it? I think
it is acceptable, but would like your view before spliting and sending the
series.

Best regards,
Koichiro

> 
> Previously, large transfers were handled by chunking them into batches and
> restarting the channel on each completion interrupt. By transitioning to a
> circular buffer and returning NULL for descriptors that exceed the usable ring
> capacity outright, dmaengine_prep_slave_sg() will now fail for those clients.
> 
> Since the commit message notes this rejection is in place "until reclaim
> support lands," will this break existing users who depend on handling large SG
> lists in the meantime?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812155721.2807506-1-den@valinux.co.jp?part=4
