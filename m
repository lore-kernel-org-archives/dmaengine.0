Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF04772BF
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165895; cv=fail; b=mfwFW+xc89FGaq/Cya2lRIyMMfvfa7QXRd43a4YuGjmStPgtun4ZwORad9xBAZVozUJi8dr7vGFb8QiU92kjH8wDzhSlUlCMKdLHRh2iuGnuF7Ytp28nYbGL2Oe1hpx/kNX7n8XggCWlaH0UCWbFOiw7o8OEHO8+tlypS2auo8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165895; c=relaxed/simple;
	bh=w2KLGu4KaRCpm5bwYvGWZTJcoQhOPlzBVUGLQZTTlxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NuSRAfajEWEibuWzpziPh3+7PKP/MnVh64z1SrDQlx6PZGzaCMqdGgVVNhJSeMpo3lq17szYMNZZCWsZfvPjZJ+zh59XDzjRuiqHLi+BvMAiRqbXJZKEB/FtTMYZVGAAw6MMux7n2uEPSyg1Mm6TN2iMw6clGCtKXAoNOEFZDPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ADWMLJk6 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ADWMLJk6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/zhPWY17GbzEheYCNfGz14zctGd3ClQgSD5i6fX6Cz61HfshfMLF75ne6ezutfcHsZuPonkVXOkD7P/AWyUm4aPZ5cxSaN0WAIH3/v/MUy/Y+1dHVbNnyjUS2s5Yhpeajb0Mqej9KETG2DWTxhNEMOWb83iir6XIqK3rW+M0r9B8Z5deGq4BqSzctLKj9fx7eT/4Xecr1x+nTOMEmEJE2n50J/OkQQnO1fqgzt14oeLUDMnLJUDfhBYDxLmRYn5NDskeKVa3H4QhN1wZohtqwx3J81dHPT6iT9q8crT0CRd4MivTuUA24zM4Y3kv89Qj1cycGHaliN+61NzpfXFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TNYNn+HW+er8N5YU+PbPzg/YiCL4+GEy6DZ4RhDUI8=;
 b=igPytJNkpDKd+YszfTk9uD222TiNs18ne6yOsCawNV8lrQobcXYT08oD4szCWIdQREwx5b925y4mS/qhbo96VG/LyRSxzpERCBaMDGPOH3kVP38J5eX3NGlXTw/kCQirDcf0a3B8g5LtLEBRoUdejPsWjSaq8K+71Q1LAu9hdLGZq7nw3sSBFxew+vkkCQmQj4fkmIZ/tP5cskN/4MgZKW8Zu5pkr2+t9cvyE44d4ElO9sQnFSqyB2E3eTWJGQnUQpKrzcpbjBBIqTQAOjwghgtj4tgKkHu44YA6b5mDDoA3GCALD1Ku6ic+9UR4M0pbt49C213L9gr9tcV7LqcXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TNYNn+HW+er8N5YU+PbPzg/YiCL4+GEy6DZ4RhDUI8=;
 b=ADWMLJk63kxUcDLm+T8YbHzMD/M0ytXO9SAKbj8RiT9c6rEeymylE8PUzKviDBENK9zmjl51gum5OP3TE9djsPZI4TfsSwBCkNbmwg/trhfS3tLBF2EdE51xDWF506PjRlUUWOMwBPEazbIX8nfrQvIY/B8MIvz/JuRzKnAkwPBAIeeazy/9nGAfT6sGRR0zUVMwPeojMxTvatYJe1VorGwh0X0LbuRXYmqwnrldPBs3/cbCvQvnZjkRNSZkamOxca0/rpK6VOlNCaeZ0ddxoS+V0Tud46Pc/hjmprPSAazQsjegKCgZRPa2Ylg538kwO8H2IDqaAAShvGrU70+zgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 15:51:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:51:30 +0000
Date: Fri, 16 Oct 2026 11:51:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ruoyu Wang <ruoyuw560@gmail.com>, vkoul@kernel.org,
	dmaengine@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: mmp_pdma: Check virtual channel before
 scheduling tasklet
Message-ID: <atJH-4ZtPYdfOlIM@lizhi-Precision-Tower-5810>
References: <20260707150356.2257833-1-ruoyuw560@gmail.com>
 <20260707152604.37C7D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707152604.37C7D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: DS1PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:8:233::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 014cf989-c421-41cf-7a70-08df2b9d5825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|56012099006|4143699003|11063799006|5023799004|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lmOeD7+XuMnod9T8ChF3ZD46u/PbX41AJoxca9fO8RJH74Q2SyZqtXVCtVKnMLdGspx3eXLFzmRtaMDXADrwb9c4APGLIl08ZnlHDoepUzvpqfVTWa9xb5j60M65f3Dng7QL36PGQ18UsMWeaS4ciURmLmuGwvawmZQoLDx0pQcSbUmsIP7Zn8e+AWUQ74U4wpVggV4XynS1dRbB5m6MKvrR3ay1uX7W8Kcqx4hwJgHZaUN8WGnaQLqf7QWuoXPEbjoHw8vE9UJK6pofM60NCyOtha0kvOSCP0N20n8bYuBIuD9S7iO0qWYjnOcAuF9gJPUMJBQOnUUD97eNz8r+FwL3lIuF49TFSVIeUApasegYkwoaHJlAehoookwznY7yX7NNqH83kpgv4WUTIh+gXuWjQfnbSk2gjzsVvNXfzS4Gfp0dAZ4b6/0V9gcJI6HfPAAEsUMEcgavPuR8pJ8C2+EoGHseVhV2rUwhn3b7cJ6gxjATa3TF3FACUIiSuFgd1XYwhDFk9Xloa8dy8n+FjS9SbLEM47m1monaHSplsHF21fgeoYrTBXtpIdU6zdOXPqnspthJiGMbS4oQvJgO8xcII2/xiQl40zRjL3UgnL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(4143699003)(11063799006)(5023799004)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?92ne7hl+pvHesuelf/JF5GVdQIlLIXXlJrVR7WMLNPWZDnsPw0UWx0ecDd?=
 =?iso-8859-1?Q?QuLQ03/TwgQO1zHUapAoo18oTOQfrC3IE9yiPGkvoMXzdgzSzBBSpbodxv?=
 =?iso-8859-1?Q?5DuOOYWTSi4xP2QWgwQQ0EeuRU2AIYLZqM5rqmEbFonr4B0xZXDRVONUk9?=
 =?iso-8859-1?Q?7DZqwh1gxmCbABcBLT5nMrvM3emq6/IraoitfnBMv6DzQXnmXO92pGyYQL?=
 =?iso-8859-1?Q?Z4JjZr+/si00fcy5yB/oJ8lHRJJNQHGcUpqW0XrgZGiau8LtMlaf+ctC3P?=
 =?iso-8859-1?Q?3bwvTYnoQDQtD0U4f6NXxkrv7wJxZ0aliwR7e3vB66G/tbPsNbPRzwCMbx?=
 =?iso-8859-1?Q?rlGN9RcM2GSGKIu64ohrlCDZFi6K2X3WPK5BBCOWktOjsbzYkM1nrRQ7fu?=
 =?iso-8859-1?Q?pMYp7M5lwWu9sIJmfqlC1e7P109cAbKavl9sa7SlFKdcWUVYArRfPdOzds?=
 =?iso-8859-1?Q?ivoexVFWN1BLYrMbz8IaJLntd8NggbP1tmm70HITSy2YCwiwzpWLcWbZkf?=
 =?iso-8859-1?Q?X6XrmQkO3VU9OdashH+D0kxL5aBNGMKaNO0J3L3y8Rj5EE/Qac5fsaeh+Y?=
 =?iso-8859-1?Q?WsrnkYqNSbCohstboH7qlERHfFBCz82kI/OXWQSdSWO6Y5qb+toocFCjx8?=
 =?iso-8859-1?Q?Q5ip7AG7I6O35KT6/dzGGMX0p72iaWogD0BwVrhnK/m++cASJQMLe4Nx+x?=
 =?iso-8859-1?Q?FUoNk1zrqhllPB8XbXC1wtS52hIT7wcyKp3Sgg1dSS5HfOEaGEjSiSNvv6?=
 =?iso-8859-1?Q?qEZfahACS69Gj6BIiJCrz5DfPmefXE3bSJN34QCzYJOrC+vqtbVdtlpbvI?=
 =?iso-8859-1?Q?mKD0CTzKBtZVije5AogKNDtcRNmSAyD6qJ/KDX2iIERlOy9BPFtnP3tOiO?=
 =?iso-8859-1?Q?ZHYqWV9uhkme/eehC59W9BMMnnB/R3HCqYJW8quKAWpkQqO7XpSAGizjP6?=
 =?iso-8859-1?Q?32ecRDhbqReiPrKpGLUYUSMVIREhJ8hIacekpKhWqLG6MaOO+LcmN3gE6/?=
 =?iso-8859-1?Q?3O7H1qEUXdH3R16CHOgjjGCMdBpafOPgTEOyHFh+0P/t1QCGlQrVsakbdI?=
 =?iso-8859-1?Q?C6zZVs+q8ZD8YGAlWnzKaROVT3RGrxToNL0d95slJXA5EoVnc1+tKArlMl?=
 =?iso-8859-1?Q?Eqi0+fdcvx8Xw5wG6xNsTOff3ltPkOClZmkA8nLo+E/gNe8ECHxM67H3iu?=
 =?iso-8859-1?Q?6AjsxvZYxGIZDVrqIAJSpj7mRJER4hdzjtBcJ2Bd4odXYBWx4sT/0HmXPR?=
 =?iso-8859-1?Q?IqYflJf3Knix6C5AbPVYOaBrNNtLKuvRhQtXpN2ZiZa63rQ8Kt3v1HpsKF?=
 =?iso-8859-1?Q?jXxz/ZdciuijepR/PJTb0N7l/RfEDC0sFvblz9KKbsFXaiZXA64HH0f3zf?=
 =?iso-8859-1?Q?k4wA351bFSkTqUjFxMijCSF0VRSJWOWS0JaUZg/yAKS68H1id1gWI4euBz?=
 =?iso-8859-1?Q?Bl12714WY8TpwD+jimMXOkvEREPKj9NRzW5iIH09S+3Om9PI+QhV4ryfLF?=
 =?iso-8859-1?Q?xCZw6W/xUE95GVENmyTDb5pteoFGEfrQqsvU7T7ZJtvXRU3zxavNZwXWU/?=
 =?iso-8859-1?Q?MHNYhjTlV7BFZ0xljqdKU4RWw7aMtT7n0HC6bGQlWEV9vycUbrcY3Ao9Tj?=
 =?iso-8859-1?Q?sn8InLp4679msCHLiAndfKqarOOqARO/uZx4atiXPjSPwWj/3orB9PSznT?=
 =?iso-8859-1?Q?DWANWhjS/1r+R986N/vJwCUEMA4JBIuKCWrshevIu1LWBbrHsuwry4Bn8e?=
 =?iso-8859-1?Q?OGM3LQPFBPKG4BjkKyxPqbaepXa/RWTOlfJ7tgSn1ZRZBCSeXqIG1qgYar?=
 =?iso-8859-1?Q?Qt/Ovc8IOqVxKiAE66Ny6u6zXxGIgGGXJBPtyCfHpzsnyPDjohVv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014cf989-c421-41cf-7a70-08df2b9d5825
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:51:30.0183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3ATswfTdt7fxWwPx/66UOIgmYsAaXvPY56xcpr4Q8a8Q4ZPe3jz1PeVNlelMEV+UAAOGOTjC9h7v58LC2LkJmXODarZgbKO9+aEuRUMsb6PsnrtXHKChqniOBNhXrTK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899

On Tue, Jul 07, 2026 at 03:26:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] The patch leaves a Time-Of-Check to Time-Of-Use (TOCTOU) race open by taking two separate snapshots of `phy->vchan`.
> - [High] Time-of-check to time-of-use (TOCTOU) races on `chan->phy` can lead to NULL pointer dereferences when racing with channel termination.
> - [High] Missing `tasklet_kill()` during channel teardown and driver removal leads to use-after-free vulnerabilities.
> - [High] A use-after-free write occurs on the error paths of the `prep_*` functions when freeing the descriptor list.
> - [High] The DMA channel hangs indefinitely if multiple transactions are submitted before `issue_pending` is called.
> - [Medium] Stale hardware interrupts are not reliably cleared when a physical channel is disabled, risking state corruption upon reallocation.
> --
>
> --- Patch [1]: [PATCH] dmaengine: mmp_pdma: Check virtual channel before scheduling tasklet ---
> commit 4969ecc3a7a7a671c042835c34adbdf0229a2d70
> Author: Ruoyu Wang <ruoyuw560@gmail.com>
>
> dmaengine: mmp_pdma: Check virtual channel before scheduling tasklet
>
> mmp_pdma_chan_handler() clears a physical-channel interrupt and then
> unconditionally schedules phy->vchan->tasklet. The physical channel can
> be detached from its virtual channel when the channel is terminated or
> when no pending work remains, so a late or shared interrupt can reach the
> handler with phy->vchan already NULL.
>
> Snapshot phy->vchan in the interrupt path, skip tasklet scheduling when
> there is no virtual channel, and use the same snapshot for the BUSERR
> warning. Use WRITE_ONCE() for the matching attach/detach stores because
> the IRQ path reads this pointer without taking phy_lock.
>
> Fixes: c8acd6aa6bed ("dmaengine: mmp-pdma support")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
>
> > diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> > index 386e85cd4882a..6f379e9f10017 100644
> > --- a/drivers/dma/mmp_pdma.c
> > +++ b/drivers/dma/mmp_pdma.c
>
> [ ... ]
>
> > @@ -370,11 +372,16 @@ static int clear_chan_irq(struct mmp_pdma_phy *phy)
> >  static irqreturn_t mmp_pdma_chan_handler(int irq, void *dev_id)
> >  {
> >  	struct mmp_pdma_phy *phy = dev_id;
> > +	struct mmp_pdma_chan *vchan;
> >
> >  	if (clear_chan_irq(phy) != 0)
> >  		return IRQ_NONE;
> >
> > -	tasklet_schedule(&phy->vchan->tasklet);
> > +	vchan = READ_ONCE(phy->vchan);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does taking two separate
> snapshots of phy->vchan leave a time-of-check to time-of-use race open?
>

Although it is not introduce by this patch. But you try to fix some problem,
please fix this also.

I am not sure if it is safe schedule tasklet, which already detach from
vchan.

Frank

> The commit message mentions using the same snapshot, but the implementation
> takes one snapshot in clear_chan_irq() and a second one here in
> mmp_pdma_chan_handler(). If an interrupt fires for an old virtual channel
> exactly as the physical channel is reassigned to a new one, the two
> READ_ONCE(phy->vchan) calls could fetch different virtual channels.
>
> The interrupt would be cleared for the old channel, but the tasklet would be
> scheduled for the new channel, prematurely completing its pending descriptors.
>
> Could this be fixed by returning the vchan pointer from clear_chan_irq()
> instead of reading it twice?
>
> > +	if (!vchan)
> > +		return IRQ_HANDLED;
> > +
> > +	tasklet_schedule(&vchan->tasklet);
> >  	return IRQ_HANDLED;
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but can this lead to a NULL pointer dereference
> due to a time-of-check to time-of-use race in mmp_pdma_residue()?
>
> In mmp_pdma_residue(), chan->phy is checked and used locklessly:
>
> drivers/dma/mmp_pdma.c:mmp_pdma_residue() {
>     ...
>     if (!chan->phy)
>         return 0;
>
>     if (chan->dir == DMA_DEV_TO_MEM)
>         curr = pdev->ops->read_dst_addr(chan->phy);
>     ...
> }
>
> Concurrently, mmp_pdma_terminate_all() can call mmp_pdma_free_phy(), which
> sets chan->phy = NULL. Because chan->phy is accessed without READ_ONCE() or
> locks, the compiler might reload the variable from memory between the check
> and its use, resulting in a NULL dereference.
>
> [Severity: High]
> This is a pre-existing issue, but does the channel teardown path miss a
> tasklet_kill() call, potentially leading to a use-after-free?
>
> In mmp_pdma_free_chan_resources(), the descriptor pool is destroyed without
> synchronizing or killing active tasklets:
>
> drivers/dma/mmp_pdma.c:mmp_pdma_free_chan_resources() {
>     ...
>     dma_pool_destroy(chan->desc_pool);
>     chan->desc_pool = NULL;
>     ...
> }
>
> Similarly, in mmp_pdma_remove(), the driver unregisters the device and allows
> devres to free chan memory without first killing the tasklet. If a tasklet is
> scheduled just before the DMA channel is freed, dma_do_tasklet() could run
> concurrently with or after teardown, causing it to dereference chan after it
> is freed or operate on chan->desc_pool after it is destroyed.
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the error path in the
> prep_* functions cause a use-after-free write when freeing the descriptor list?
>
> In mmp_pdma_prep_memcpy(), newly allocated descriptors are appended using
> list_add_tail(&new->node, &first->tx_list). If an allocation fails, the error
> path passes the dynamically embedded list head to the cleanup function:
>
> drivers/dma/mmp_pdma.c:mmp_pdma_prep_memcpy() {
>     ...
> fail:
>     if (first)
>         mmp_pdma_free_desc_list(chan, &first->tx_list);
>     ...
> }
>
> During cleanup in mmp_pdma_free_desc_list():
>
> drivers/dma/mmp_pdma.c:mmp_pdma_free_desc_list() {
>     ...
>     list_for_each_entry_safe(desc, _desc, list, node) {
>         list_del(&desc->node);
>         dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
>     }
>     ...
> }
>
> Since first->tx_list is embedded in first, and first is freed during the
> first iteration, subsequent iterations perform list_del(&desc->node). This
> modifies the list head inside the already freed first descriptor, corrupting
> the memory of the DMA descriptor pool.
>
> [Severity: High]
> This is a pre-existing issue, but does the DMA channel hang indefinitely if
> multiple transactions are submitted before issue_pending() is called?
>
> In start_pending_queue(), all pending transactions are moved to chain_running,
> but only the physical address of the first descriptor is programmed to the
> hardware:
>
> drivers/dma/mmp_pdma.c:start_pending_queue() {
>     ...
>     list_splice_tail_init(&chan->chain_pending, &chan->chain_running);
>
>     /*
>      * Program the descriptor's address into the DMA controller,
>      * then start the DMA transaction
>      */
>     pdev->ops->write_next_addr(chan->phy, desc->async_tx.phys);
>     ...
> }
>
> Since descriptors from different transactions are not linked, the controller
> will stop after the first transaction. The tasklet in dma_do_tasklet() sees
> that chain_running is not empty and leaves chan->idle = false:
>
> drivers/dma/mmp_pdma.c:dma_do_tasklet() {
>     ...
>     chan->idle = list_empty(&chan->chain_running);
>
>     /* Start any pending transactions automatically */
>     start_pending_queue(chan);
>     ...
> }
>
> However, start_pending_queue() returns immediately if chan->idle is false,
> meaning the remaining transactions in chain_running are never started.
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but can stale hardware interrupts be
> incompletely cleared when a physical channel is disabled or enabled?
>
> In disable_chan(), the read-modify-write sequence might miss W1C
> (write-1-to-clear) interrupt bits that become asserted during the window:
>
> drivers/dma/mmp_pdma.c:disable_chan() {
>     ...
>     dcsr = readl(phy->base + reg);
>
>     if (phy->vchan) {
>         struct mmp_pdma_device *pdev;
>
>         pdev = to_mmp_pdma_dev(phy->vchan->chan.device);
>         writel(dcsr & ~pdev->ops->run_bits, phy->base + reg);
>     ...
> }
>
> If a hardware interrupt fires between readl() and writel(), the snapshot's
> W1C interrupt bit is 0, so writel() writes 0, failing to clear the pending
> interrupt.
>
> Similarly, enable_chan() performs an unlocked read-modify-write on a W1C
> register, blindly clearing any pending W1C bits without processing them. When
> the physical channel is later reassigned, this stale interrupt can trigger
> the IRQ handler for the new channel.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707150356.2257833-1-ruoyuw560@gmail.com?part=1
