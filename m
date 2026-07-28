Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB5332EAD;
	Tue, 28 Jul 2026 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260092; cv=fail; b=OHbmmy+dRCYEZm/r9k1PKiJ/jfWazWtjr192vqxv+Hvb+dkyFTWozYchXryjpZ+aogmX+IxwvfQ0Bw2w0d6+z1B4nh8ew+S+dIIc3NfPhqHdiLbatDu7UQki2CwyfALtpDbTMfJ6Szv5AC0k6/a+V5K26A8nN9ckFdBMSJW22xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260092; c=relaxed/simple;
	bh=soHbwfoAr6GkO0d3rUiEY83LmWCrMw3+hzWUwDfAzU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M4cw1Voyr5aIar+pGdevJGeYiCaGWttsW4bQYzJYSlUemmgHSvnJdG7IE/iDi3iMxkvN0DIoMMJugfkSCt7AHXQyqJP3T4PvRozD3Z3Sz22xxxFlISJGRmBXchbYvEt4QBXLZnloWfFNwweuBFt6ReipkRC7LuuAhJjTP0KIhBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ItQac1Na; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ItQac1Na"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwmI5iYtk7Z4hMW7Do+jeAUPGhnEwU1rO0x9OAQole702QvL/SeG3byUAImaINz5XeMNkUuldY0PkWK4k5GiHvdUqnuhBk+PlOljnJBkb4aRLDn427d5Vq1BU/UH16klWbhNluJdF3AoEFLC3MMREke0l2xuuL3U1CY5RTms0zm/7E8EP9rVYL2OB5hGDtNLdLiPIc/HsSgVr02DQVBbQb+61gTxIvkr+VHoEWdhfy3/CIX1+pWyzsFQ5xP0QcgVuUCBdJ0MwqUYyNDgO4T++09QO7em7VIzzGW65S5izXPaiTZyV3DBgZY2BhjOTdwcComeHE/sY7sVFEhKkc6JIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlCvLHrJScyn0aEl1zDNxnklJyuLW6mX9j2pt4e4y9I=;
 b=POssGJFtZERlwUtlvPj40kDDC7HHic2W5GCXghUZx1r9vvutGbsIX4yhdx2zxsZsZy+kG3Ktb+H5QJlw4WyG86OY41uKbMiRE2yq6oEnIRzQjujewY0oubfPOsWhl/FnsblaCe9DI+MVE8sY6IsPlms1vlJFZyouL2W25SQk/jMzSeOJcQKZ5/GcNWrFHNJwoqutfRJ1kH4Rc2VHlJQliVkxPuUbf24KCe+5lFBaWTGIvww7ru1JD3HqT2pjQv6mxyr9KaI6dIjMuQ7NK9D3Cn8o7oRlzUtYGN9T4GrZmtZCgFJRZNsuZlWwmBu7ZGTAJRZzk02VFQkb8rhfY1IMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlCvLHrJScyn0aEl1zDNxnklJyuLW6mX9j2pt4e4y9I=;
 b=ItQac1Nae+3jxMJWLLDWo6TkvIqKKkUnIMsn2vCNPX2ql+idLpSj9xYUN6nmDzOQmfT8PJOjvs0AO5NKO+WGb8ubfl045qyhT/j3qFxAYB84J0q7MA8wDqdc2tapUsn8kTPpjgnq30CW20VgvVgdlLJQU3C/oTAFhCx12wmjtMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSOP286MB4129.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 17:34:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 17:34:47 +0000
Date: Wed, 29 Jul 2026 02:34:46 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/24] dmaengine: dw-edma: Prepare LL kicks for event
 serialization
Message-ID: <ud5l2wcf3vwbmt7cddnqzud4bemi5ijgbcy6gdr3spnsbjmsos@d4rbw46trcjl>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-11-den@valinux.co.jp>
 <ame8-QU4siDSPzaS@lizhi-Precision-Tower-5810>
 <uq7qe5ptxr4uekuxouqlir2ijusfxq66zffad7k7ypflfn2ezk@vxs2jonoc3hl>
 <amjOPbm174THHNlR@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjOPbm174THHNlR@SMW015318>
X-ClientProxiedBy: TY6P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSOP286MB4129:EE_
X-MS-Office365-Filtering-Correlation-Id: 72aabdbb-1031-48eb-0723-08deecce850a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|23010399003|6133799003|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IVcd31q7BqzkFQBtPIRMXwpFxx/HdOe4/LG320ZVGEgFeQYvCqwZod3qK8Bufi21+MzBZTnL4N+se7OqZqP0TnUk4k+v+P+qohiWhnG/dGtiJzZDBhQ0HeCEARcJDhrMo62iG2eNTE+yCcCkSeheEa/F/5+63b896gQJJueJ6jvAnTQLJtLMgeZYfAadTfp2cTy5JWhRC9QTsS/d6onyD2DBKUvfhKMO1zIRECKl3clfmuFERvs8//pkgstvIWEk+wMk6i1+z0LhcyJsOFqbdHx77TLJvW4NAXXU+dkK34sZSsrxZb9AHTKjI8H+j9GCfXroxV5l9NRvAel5qNUZlEzGpLcZm6WhT765ZnCwqcfCGT9UzyERhyJgCpKoaRvoYFezXoJ59JVyAQoaZ1LlPaYrF3AXUMrmKlq8GP6GY7E56ErolGCwPPbGw55a/KU0yGiLaj/iODjvGs+8OAh40kyLxyAhIfzZRPm0dcVLqb/F/kVwUo1eJ7oF2leFqEPWOEKTWYT7UmMFcEZ1NcLRqjU7ekOYtmETC2Y5dS9VqLKlviBEf+IdiG3Qc01vZqcFNDwLa6JIzz36l/GWCqaydaTKey1JhItwJC0I0CO8f+hppxQqTBM9Jl31GVZ9mn17lMHRebruox4pjHIylWIhjUn/bBzEmwjkp18CrH9/Q4g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(23010399003)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XdOQpfssHeUD44UmS/DfXnq+vjkMuOT848cKhH7lpPNZXUeb1ezoQWHt38Xw?=
 =?us-ascii?Q?qquyiP4X0MMa/YO26qkz1ef5PZfrQHFl+jd7vNVHmDHeKW8rPcFZI16XG2Qx?=
 =?us-ascii?Q?SAsIonCVUq1vB2uvNgClacADnzKOOVi4+RALQR7Qeks7w3sbMhfZ6inK3/IJ?=
 =?us-ascii?Q?LPnw2Ja0cIFnIssM6jmlXbxNFZ0hLSG8SAAJ8BEYNFMDXOW/GQvEDCZAEA2Y?=
 =?us-ascii?Q?q9Z9BIlZsSX20OYVkhQpcUDTwFn3V6uEy5I8q/T4eClNuTLfwb2R9oDjZC/J?=
 =?us-ascii?Q?wTm6l4Lj+02srzmIkuUVW/QpnDhqjiVyg6d7X0zf4n0Hv0UO/+qmsZVqPH4V?=
 =?us-ascii?Q?8+YIO4dt23MuL+3VMf/yUEWuVir3AYqhwJKBP5qq+lGWniBqh+2H2psiRjzx?=
 =?us-ascii?Q?4iifyL7xEV7L53DTT2aS3pfwRERfn48TTMUzevi8yPsAILhS60CMTW6bcppM?=
 =?us-ascii?Q?HjZ2pIvs7h2b8MFJN3Dxw26G4FiwpTaHczIkCYZ1LxcHUchIJXAtrxkCrILF?=
 =?us-ascii?Q?D864syWokVjgZK9Ni6QbAAwx12xYT2hbgySs32M4UvoVEdtszj7VvVthlbm4?=
 =?us-ascii?Q?Fgf7EWAayNec02AIr+uoV1lTB6YnTr4CmDXlovbffkZ4ovAzeX7LmzKUiE7H?=
 =?us-ascii?Q?FjlVcedQ7iknFfLMd3uC7PQJ//iFNgDdB7THcbz+RGnTpWPS09QCxBxkfZcO?=
 =?us-ascii?Q?ILYMSOP59AVErMSJGEY37BcZTTD0zs6Mqsu/coAbHmXWCQdpbhyIzmWQXzii?=
 =?us-ascii?Q?6yGvfflXMPLldMpIr2EVoyhIXjiXLIZs/7TCp9qRUAjvayYlIEITYQ/5UyIg?=
 =?us-ascii?Q?swEvlEAPb1n0Cghizjb3WqNOpRY+nn2x0Z0w6uvAu8PStPtesXmmDCTv59xy?=
 =?us-ascii?Q?ElBwxHpB3RFVVcFtQHe9adFfjS7RB9jpkrO1vGPoRTPIlfDl72aHiEowaAwT?=
 =?us-ascii?Q?/u6yQs1DiEVbCn6RYmkyEw2c8p5eo0+5NUs2Cy7SKESH1RIumHHvzZ3zdvdS?=
 =?us-ascii?Q?42M0vkrAFB1V2/19RS7Z3mB8y9mIfJyykY3hVXWuQkimFtvDJcbzb1j+u/9o?=
 =?us-ascii?Q?tzOoeX1l9ng+Qu1S0WvcVLW36Dmw1Q6JAixnsyUhvc93/i0ehJow+ilFhbF0?=
 =?us-ascii?Q?HrhDXjgc3ZtKeZxYa9QsMQAfa4kLBjrRD1mY+l65WJpGw0Yh0Oj/XnFE6VxY?=
 =?us-ascii?Q?Fk9LFGv61JXJj3G4s5heW290nfrh/i9ekWVueoIbSoarUOtmFHykp/WlXfOa?=
 =?us-ascii?Q?DMKGhURerhodUi+HoGIlwSiz1w325czM0WV6xcCUSi4vFbBL90y3IH4Bg2jM?=
 =?us-ascii?Q?cKv/oeLp6yd0wg3+mT07OzJFRYKcTzsyTEherURWU19A7xGlN7KRUZ6pi5kn?=
 =?us-ascii?Q?lOLxJYuOj+F37KsvWWYMiB8Gl9itFQM7K+eM+lCo9HYbrJnNO1X89IY0ewB1?=
 =?us-ascii?Q?lKz7kI4FVsl5c0CriYzo/sdKz7XH0zmk9sqFEiDsqBcChdQN4LX/F5XKgZ0P?=
 =?us-ascii?Q?Z5ZBKLvYSnUacNc8yZcnlJN1TuzajGcpmPnRs+R8pvjDMFTfvhIC1xxbm3Fd?=
 =?us-ascii?Q?z3Vc/ihvip5ccqJtZbkMnI0s7D7+eKsnRpUZyeuDy6HoFa1fuwSWOqIi3Xpi?=
 =?us-ascii?Q?itJ5QpuoEwAco5K93oPFkyCZywf4Catr/MUtW0yWh0YrXMIXdDYVoFVh6QG1?=
 =?us-ascii?Q?/tHJjv/x88K9LFpzKzPNo4yKy/gJofma6d5RTonmHgeUOPzYsmiYlHZZTb1i?=
 =?us-ascii?Q?aYyyFBNQfCI6/4xbJxJbRSPZhIjzSW2cw3K9VwdbGMSK78fuuhkh?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aabdbb-1031-48eb-0723-08deecce850a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 17:34:47.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTpycUdoUITscU2bBdUQIRimaS3cUYNEoPUgKPNzQES+nOj+sIzJIODJx8HxQbNtKLBTlBwDeCP0mzMtzinF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB4129

On Tue, Jul 28, 2026 at 10:43:57AM -0500, Frank Li wrote:
> On Tue, Jul 28, 2026 at 02:38:16PM +0900, Koichiro Den wrote:
> > On Mon, Jul 27, 2026 at 04:18:01PM -0400, Frank Li wrote:
> > > On Tue, Jul 28, 2026 at 02:03:09AM +0900, Koichiro Den wrote:
> > > > Both eDMA and HDMA perform the same remote LL read-back immediately
> > > > before writing the doorbell register.
> > > >
> > > > A later patch serializes each LL doorbell write against IRQ event
> > > > capture with a raw spinlock. Keeping the read-back in the provider
> > > > callback would hold that lock across a remote read. Move the common
> > > > read-back into a core kick helper, where it can run before the
> > > > serialized section, and leave dw_edma_core_ch_maybe_doorbell() to decide
> > > > whether a kick is needed.
> > > >
> > > > No functional change.
> > > >
> > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > ---
> > > > Changes in v3:
> > > >   - New prep patch split from "Centralize LL doorbell decisions" to keep
> > > >     that policy change focused and the remote LL read-back outside the
> > > >     event lock added later. (Sashiko)
> > > >
> > > >  drivers/dma/dw-edma/dw-edma-core.c    | 20 +++++++++++++++++++-
> > > >  drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
> > > >  drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
> > > >  3 files changed, 19 insertions(+), 33 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > > index bb57f2d39d1c..e3d0559206d8 100644
> > > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > > @@ -13,6 +13,7 @@
> > > >  #include <linux/dmaengine.h>
> > > >  #include <linux/err.h>
> > > >  #include <linux/interrupt.h>
> > > > +#include <linux/io.h>
> > > >  #include <linux/irq.h>
> > > >  #include <linux/dma/edma.h>
> > > >  #include <linux/dma-mapping.h>
> > > > @@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> > > >  	chan->status = EDMA_ST_IDLE;
> > > >  }
> > > >
> > > > +static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > > > +{
> > > > +	/*
> > > > +	 * Remote controller registers and LL memory may be reached through
> > > > +	 * different paths. Complete posted LL writes before the doorbell.
> > > > +	 */
> > > > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > > +		readl(chan->ll_region.vaddr.io);
> > > > +}
> > > > +
> > > > +/* Must be called with vc.lock held for an LL channel. */
> > > > +static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
> > > > +{
> > > > +	dw_edma_core_ll_sync(chan);
> > > > +	dw_edma_core_ch_doorbell(chan);
> > > > +}
> > > > +
> > >
> > > Can you move
> > >
> > > 	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > 		readl(chan->ll_region.vaddr.io);
> > >
> > > into funciton dw_edma_core_ch_doorbell().
> >
> > Could you elaborate a bit more on the concern?
> >
> > I'm guessing that one or both of the following changes look unnecessary to you:
> >
> >   (a). add the common dw_edma_core_ll_sync() helper
> >   (b). move it outside of dw_edma_core_ch_doorbell()
> >
> > Regarding (a), the helper is also used in patch 22, where the LL writes must be
> > completed before re-enabling the direction, without issuing a doorbell at that
> > point. So I think (a) is useful on its own.
> >
> > Regarding (b), this patch 11 puts the raw doorbell write under event_lock.
> > Simply keeping the sync in dw_edma_core_ch_doorbell would therefor also put the
> > remote non-posted MRd under that lock. I tried to avoid it for two reasons:
> >
> >   1. It would otherwise increase event_lock contention, especially for eDMA,
> >      where the lock granularity is a direction rather than a channel. The IRQ
> >      path also runs dw_edma_record_irq() while holding the same lock.
> >
> >   2. If the non-posted MRd completion is delayed, event_lock would remain held
> >      for the full delay, which can easily be avoided by this patch.
> >
> > Or is your concern more of the API design, that every doorbell call via
> > dw_edma_core_ch_doorbell() should include the LL publication barrier?
> 
> Yes, doorbell() should include memory barrier.

Got it, thanks for the confirmation. In that case, and if the two points (a) and
(b) above are otherwise fine, I will probably move more of the software logic
into dw_edma_core_ch_doorbell(). Let me think through the exact implementation
for v4.

Thanks for the review,
Koichiro

> 
> Frank
> 
> >
> > Thanks for reviewing,
> > Koichiro
> >
> > >
> > > Frank
> > > >  /* Must be called with vc.lock held. */
> > > >  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> > > >  {
> > > > @@ -261,7 +279,7 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> > > >  	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> > > >  		return;
> > > >
> > > > -	dw_edma_core_ch_doorbell(chan);
> > > > +	dw_edma_core_ch_kick(chan);
> > > >  }
> > > >
> > > >  static void dw_edma_device_caps(struct dma_chan *dchan,
> > > > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > index d883ca446f5a..b3098eb83442 100644
> > > > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > > > @@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
> > > >  		  upper_32_bits(chan->ll_region.paddr));
> > > >  }
> > > >
> > > > -static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
> > > > -{
> > > > -	/*
> > > > -	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
> > > > -	 * configuration registers and application memory are normally accessed
> > > > -	 * over different buses. Ensure LL-data reaches the memory before the
> > > > -	 * doorbell register is toggled by issuing the dummy-read from the remote
> > > > -	 * LL memory in a hope that the MRd TLP will return only after the
> > > > -	 * last MWr TLP is completed
> > > > -	 */
> > > > -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > > -		readl(chan->ll_region.vaddr.io);
> > > > -}
> > > > -
> > > >  static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
> > > >  {
> > > >  	struct dw_edma *dw = chan->dw;
> > > > @@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> > > >  {
> > > >  	struct dw_edma *dw = chan->dw;
> > > >
> > > > -	dw_edma_v0_sync_ll_data(chan);
> > > > -
> > > >  	/* Doorbell */
> > > >  	SET_RW_32(dw, chan->dir, doorbell,
> > > >  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
> > > > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > > index afc2f24fecd3..64a07fbc5be3 100644
> > > > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > > > @@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
> > > >  		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
> > > >  }
> > > >
> > > > -static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
> > > > -{
> > > > -	/*
> > > > -	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
> > > > -	 * configuration registers and application memory are normally accessed
> > > > -	 * over different buses. Ensure LL-data reaches the memory before the
> > > > -	 * doorbell register is toggled by issuing the dummy-read from the remote
> > > > -	 * LL memory in a hope that the MRd TLP will return only after the
> > > > -	 * last MWr TLP is completed
> > > > -	 */
> > > > -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > > > -		readl(chan->ll_region.vaddr.io);
> > > > -}
> > > > -
> > > >  static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
> > > >  					 struct dw_edma_burst *child)
> > > >  {
> > > > @@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> > > >  {
> > > >  	struct dw_edma *dw = chan->dw;
> > > >
> > > > -	dw_hdma_v0_sync_ll_data(chan);
> > > > -
> > > >  	/* Doorbell */
> > > >  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
> > > >  }
> > > > --
> > > > 2.51.0
> > > >
