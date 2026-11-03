Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673790;
	b=r8GPEoztia91VmT+yTH1sL+NlbA9w5doD7RSHLu1w3lMToZU4Gwae8pAwu1YX9VF4GyQ
	 Ciu5m6rspdd6DeivaAf2Z0/iDYU7CAlDc+gpSJ5ZrZiFtzZxWhERNZ4bSfqkCB9bI6uo4
	 K1VL4XXn8gRo9gWmwcsrX+oBDCVWMcuJk50PvB5Mb/VZLUTLyTjYFN8VlxJvqzEIEn2wW
	 IgLZzxH3dvIjPIpby6vj4vd5iGWPgdZO3TeN8tYQD/UzfGGcHs45HRQ9r0wzPmGkbGgr4
	 P3ia7nCW3x8grsEuYxI4/KjknBVHccBkkFU2YdN1bRu8+uIbavaFOM/GOPJIVNGn0AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673790;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cx2cDKT2DqnkcGRLRJ0Y2lbxjqCquvtWQWhooQIWa40=;
	b=2KnP5JMd/+9dfYhHifVJqU9IMgjneXKWrT9ix6uewBwjN12w72hotSSkgY2GbtPgFAaZ
	 5nTxZHbvHV9gIZLNKO/pqOlKpiR41A2uaX7UvIKgEHv1rAST6MMrPtYEzrJ+Nj/ldQIF5
	 8a1Q6WL8y1HPQPWPu1nOyVzVI0bM3eL8VL2Kl2qdSjOjUgU41AL1qFPkDG7Auy4e7Ajvl
	 GKIAP4sdGnwacWQvD25Hqe7xpnnJ2SZZfZ2LyC9ziAjsy7Epnp3Yezlh+ESiL+dfZY+l8
	 IwrGyASQXKvz+By+DC1oO4H1t27biTmbXDjCAtN9XdOdSOx0YbRjByAVefTS+QrH6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cZ0EZ/yZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A00606A324;
	Tue,  3 Nov 2026 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZ0EZ/yZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68EB1F00919;
	Tue,  3 Nov 2026 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793673789;
	bh=cx2cDKT2DqnkcGRLRJ0Y2lbxjqCquvtWQWhooQIWa40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZ0EZ/yZCgk1j5ID7lwc0lZg5itzfh+h8z7+vUUAXs+tbget/6Rx4Q6Q/n17bPT7h
	 V0n9FRHsWE53wFU9vaZBrEE1Bka816a/p8CZzTFhmdj9XSiC2D00kvrVewapU8Udei
	 MIjN8tio18GjuvfNS+11nfKYwKshE5vi8OOVs5Gp1GeW/oOWAc9AyaTPDw2dqm+QTa
	 iRfDWm6sUHWv6icMGsrlw1dlOQvqJ9RCbyTTWJaPLcHNorsghuhCKZfaJ8wwH6KA/L
	 O49m7Junb6s+ZyfkqOR01Rt8uH7GlckmEp0UMFQ4EQJNKZBu6qL2p7k5DBF1DvJwJL
	 r5TAgEdOshkJw==
Message-ID: <sashiko-outbox-194466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shan-Chun Hung" <shanchun1218@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103022202.2139674-3-shanchun1218@gmail.com>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 02:43:08 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] dmaengine: ma35d1: premature register setup in ma35d1_desc_all=
oc() and prep
- [Critical] dmaengine: ma35d1: active DMA after timeout and double complet=
ion in IRQ
- [High] dmaengine: ma35d1: missing PDMA_TBINTDIS in ma35d1_prep_dma_memcpy=
()
- [High] dmaengine: ma35d1: unvalidated SG segment lengths in ma35d1_prep_s=
lave_sg()
- [High] dmaengine: ma35d1: broken residue and status reporting in ma35d1_t=
x_status()
- [High] dmaengine: ma35d1: unlocked PDMA_TOUTEN RMW in ma35d1_pdma_interru=
pt()
- [High] dmaengine: ma35d1: state bugs in ma35d1_of_xlate() and free_chan_r=
esources()
- [High] dmaengine: ma35d1-pdma: fix signed dma-channels pointer and zero b=
ounds check
- [High] dmaengine: ma35d1-pdma: unsafe teardown order in ma35d1_pdma_remov=
e()
- [Medium] dmaengine: ma35d1-pdma: disable channel timeout in ma35d1_termin=
ate_all()
- [Medium] dmaengine: ma35d1-pdma: unreleased ch->desc and stale ch->cfg in=
 ma35d1_free_chan_resources()
--

commit f0cfa08c80802c32fef4b715415e04126d30e654
Author: Shan-Chun Hung <shanchun1218@gmail.com>

dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

This commit adds a DMAEngine driver for the PDMA controller in the Nuvoton
MA35D1 SoC, supporting up to 10 channels with memory-to-memory, slave
scatter-gather, and cyclic transfers, as well as per-channel peripheral RX
timeouts.

> diff --git a/drivers/dma/ma35d1-pdma.c b/drivers/dma/ma35d1-pdma.c
> new file mode 100644
> index 0000000000000..176bc56c80639
> --- /dev/null
> +++ b/drivers/dma/ma35d1-pdma.c
> @@ -0,0 +1,780 @@

[ ... ]

> +#define PDMA_WIDTH(w)		FIELD_PREP(GENMASK(13, 12), (w) >> 1)
> +#define PDMA_TXCNT(cnt)		FIELD_PREP(GENMASK(31, 16), (cnt) - 1)
> +#define PDMA_GET_TXCNT(ctrl)	FIELD_GET(GENMASK(31, 16), readl(ctrl))
> +#define PDMA_CH_OFFSET(ch)	((ch) * 0x10)

[ ... ]

> +static int ma35d1_terminate_all(struct dma_chan *chan)
> +{
> +	LIST_HEAD(head);
> +	struct ma35d1_chan *ch =3D to_ma35d1_pdma_chan(chan);
> +	unsigned long flags, pdmadev_flags;
> +
> +	spin_lock_irqsave(&ch->vc.lock, flags);
> +
> +	spin_lock_irqsave(&ch->pdmadev->lock, pdmadev_flags);
> +	ma35d1_pdma_reg_clear(ch, PDMA_CHCTL, BIT(ch->id));
> +	spin_unlock_irqrestore(&ch->pdmadev->lock, pdmadev_flags);

[Severity: Medium]
When a channel configured with a peripheral timeout is terminated in
ma35d1_terminate_all(), only BIT(ch->id) in PDMA_CHCTL is cleared, leaving
BIT(ch->id) enabled in PDMA_TOUTEN and PDMA_TOUTIEN from
ma35d1_pdma_start_desc() -> ma35d1_pdma_timeout().

Could the hardware timeout counter fire after termination and cause
ma35d1_pdma_interrupt() to prematurely complete a subsequently started
descriptor on the same channel? Should PDMA_TOUTEN and PDMA_TOUTIEN also be
cleared here?

> +
> +	if (ch->desc) {
> +		vchan_terminate_vdesc(&ch->desc->vd);
> +		ch->desc =3D NULL;
> +	}

[ ... ]

> +static void ma35d1_pdma_setup_channel(struct ma35d1_chan *ch)
> +{
> +	u32 offset, reg, shift;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ch->pdmadev->lock, flags);
> +
> +	if ((readl(ch->base + PDMA_CH_OFFSET(ch->id)) & GENMASK(1, 0)) !=3D 0) {
> +		reg =3D readl(ch->base + PDMA_CHCTL);
> +		writel(0, ch->base + PDMA_CH_OFFSET(ch->id));
> +		ma35d1_pdma_reg_set(ch, PDMA_CHRST, BIT(ch->id));
> +		writel(reg | BIT(ch->id), ch->base + PDMA_CHCTL);
> +	} else {
> +		writel(0, ch->base + PDMA_CH_OFFSET(ch->id));
> +		ma35d1_pdma_reg_set(ch, PDMA_CHCTL, BIT(ch->id));
> +	}
> +	ma35d1_pdma_reg_set(ch, PDMA_INTEN, BIT(ch->id));
> +
> +	offset =3D PDMA_REQSEL + (ch->id & ~GENMASK(1, 0));
> +	shift =3D (ch->id & GENMASK(1, 0)) * 8;
> +	ma35d1_pdma_reg_clear(ch, offset, GENMASK(7, 0) << shift);
> +	ma35d1_pdma_reg_set(ch, offset, ch->request << shift);
> +
> +	spin_unlock_irqrestore(&ch->pdmadev->lock, flags);
> +}

[ ... ]

> +static struct ma35d1_desc *ma35d1_desc_alloc(struct ma35d1_chan *ch, u32=
 sg_len)
> +{
> +	struct ma35d1_desc *d;
> +
> +	d =3D kzalloc(struct_size(d, sg, sg_len), GFP_ATOMIC);
> +	if (!d)
> +		return NULL;
> +
> +	d->sg_len =3D sg_len;
> +	d->dma_len =3D sizeof(*d->sg) * sg_len;
> +	d->dma_addr =3D dma_map_single(ch->dev, d->sg, d->dma_len, DMA_TO_DEVIC=
E);
> +	if (dma_mapping_error(ch->dev, d->dma_addr)) {
> +		dev_err(ch->dev, "dma mapping error for channel\n");
> +		kfree(d);
> +		return NULL;
> +	}
> +
> +	writel(d->dma_addr, ch->base + PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_NEXT);
> +
> +	return d;
> +}
> +
> +static struct dma_async_tx_descriptor *
> +ma35d1_desc_submit(struct ma35d1_chan *ch, struct ma35d1_desc *d, bool c=
yclic,
> +		   unsigned long tx_flags)
> +{
> +	dma_sync_single_for_device(ch->dev, d->dma_addr, d->dma_len, DMA_TO_DEV=
ICE);
> +	d->cyclic =3D cyclic;
> +	d->ch =3D ch;
> +	ch->error =3D false;
> +
> +	return vchan_tx_prep(&ch->vc, &d->vd, tx_flags);
> +}

[Severity: Critical]
Hardware registers and per-channel state are being modified during descript=
or
preparation (ma35d1_prep_dma_memcpy(), ma35d1_prep_slave_sg(), and
ma35d1_prep_dma_cyclic()) rather than when the descriptor is actually start=
ed
in ma35d1_pdma_start_desc() -> ma35d1_pdma_start():

1. ma35d1_desc_alloc() writes d->dma_addr directly to PDMA_DSCT_NEXT before
d->sg is populated or synced with dma_sync_single_for_device(), and without
holding ch->vc.lock.

2. Immediately after ma35d1_desc_alloc(), the prep functions call
ma35d1_pdma_setup_channel(ch). If bits 1:0 of PDMA_DSCT_CTL are non-zero (f=
or
example, while an active transfer is running, or after a timeout or
ma35d1_terminate_all()), ma35d1_pdma_setup_channel() writes 0 to PDMA_DSCT_=
CTL
and asserts BIT(ch->id) in PDMA_CHRST. Doesn't resetting the channel here
abort any in-flight transfer and wipe out the PDMA_DSCT_NEXT value that
ma35d1_desc_alloc() just programmed?

3. Conversely, when a descriptor is dequeued in ma35d1_pdma_start_desc() ->
ma35d1_pdma_start(), neither ma35d1_pdma_setup_channel(ch) nor the write of
d->dma_addr to PDMA_DSCT_NEXT is performed:

    static void ma35d1_pdma_start(struct ma35d1_chan *ch)
    {
        struct ma35d1_desc *d =3D ch->desc;

        if (d->sg_len =3D=3D 1 && !d->cyclic) {
            ...
        } else {
            /* Trigger scatter-gather mode. */
            ma35d1_pdma_reg_clear(ch, PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_CT=
L, PDMA_OP_MSK);
            ma35d1_pdma_reg_set(ch, PDMA_CH_OFFSET(ch->id) + PDMA_DSCT_CTL,=
 PDMA_OP_SCATTER);
        }

If multiple descriptors are prepared before dma_async_issue_pending(), won't
PDMA_DSCT_NEXT be overwritten by the last prepared descriptor, and subseque=
nt
descriptors started from ma35d1_pdma_complete() never program PDMA_DSCT_NEXT
or re-enable BIT(ch->id) in PDMA_CHCTL?

4. In ma35d1_desc_submit(), ch->error =3D false is written without holding
ch->vc.lock, which races with ma35d1_pdma_interrupt() and ma35d1_tx_status(=
).

Should channel setup and writing PDMA_DSCT_NEXT be moved into
ma35d1_pdma_start() under ch->vc.lock?

> +
> +static struct dma_async_tx_descriptor *
> +ma35d1_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst, dma_addr_t=
 src,
> +		       size_t len, unsigned long tx_flags)
> +{

[ ... ]

> +	for (i =3D 0; i < sg_len; i++) {
> +		tlen =3D min_t(size_t, len, max_chunk);
> +		d->sg[i].src =3D src;
> +		d->sg[i].dst =3D dst;
> +		d->sg[i].ctl =3D PDMA_WIDTH(width) | PDMA_TXCNT(tlen / width) | PDMA_O=
P_SCATTER;
> +		d->sg[i].next =3D d->dma_addr + PDMA_CH_OFFSET(i + 1);
> +		src +=3D tlen;
> +		dst +=3D tlen;
> +		len -=3D tlen;
> +	}
> +	d->sg[sg_len - 1].ctl &=3D ~(PDMA_OP_MSK | PDMA_TBINTDIS);
> +	d->sg[sg_len - 1].ctl |=3D PDMA_OP_BASIC;

[Severity: High]
In ma35d1_prep_dma_memcpy(), the final SG entry clears PDMA_TBINTDIS, but
intermediate entries in the loop never set PDMA_TBINTDIS in d->sg[i].ctl
(unlike ma35d1_prep_slave_sg()).

When len > max_chunk (so sg_len > 1), won't the controller raise a transfer
done interrupt (PDMA_TDSTS) as soon as the first chunk (d->sg[0]) finishes,
causing ma35d1_pdma_interrupt() -> ma35d1_pdma_complete() to complete and
free the descriptor while the remaining chunks are still in flight?

> +
> +	return ma35d1_desc_submit(ch, d, false, tx_flags);
> +}
> +
> +static struct dma_async_tx_descriptor *
> +ma35d1_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
> +		     u32 sg_len, enum dma_transfer_direction dir,
> +		     unsigned long tx_flags, void *context)
> +{

[ ... ]

> +	for_each_sg(sgl, sgent, sg_len, i) {
> +		if (dir =3D=3D DMA_MEM_TO_DEV) {
> +			d->sg[i].ctl =3D PDMA_WIDTH(width) | PDMA_DAFIX;
> +			d->sg[i].src =3D sg_dma_address(sgent);
> +			d->sg[i].dst =3D ch->cfg.dst_addr;
> +		} else {
> +			d->sg[i].ctl =3D PDMA_WIDTH(width) | PDMA_SAFIX;
> +			d->sg[i].src =3D ch->cfg.src_addr;
> +			d->sg[i].dst =3D sg_dma_address(sgent);
> +		}
> +		d->sg[i].ctl |=3D PDMA_TXCNT(sg_dma_len(sgent) / width) | PDMA_TBINTDI=
S |
> +				PDMA_TXTYPE | PDMA_OP_SCATTER;
> +		d->sg[i].next =3D d->dma_addr + PDMA_CH_OFFSET(i + 1);
> +	}

[Severity: High]
In ma35d1_prep_slave_sg(), sg_dma_len(sgent) / width is passed directly to
PDMA_TXCNT(cnt), which encodes FIELD_PREP(GENMASK(31, 16), (cnt) - 1), with=
out
validating the segment length (unlike ma35d1_prep_dma_cyclic() and
ma35d1_prep_dma_memcpy()).

If sg_dma_len(sgent) < width (or 0), sg_dma_len(sgent) / width is 0 and
(cnt) - 1 underflows to 0xffff (65536 beats), causing an out-of-bounds DMA
transfer. Conversely, if sg_dma_len(sgent) / width > PDMA_MAX_CHAN_BEATS,
the 16-bit field overflows and truncates the transfer, and if
sg_dma_len(sgent) % width !=3D 0, trailing bytes are dropped.

Should ma35d1_prep_slave_sg() validate (or split) each SG entry's length and
alignment, and should ma35d1_pdma_probe() also advertise the maximum segment
size via dma_set_max_seg_size()?

[ ... ]

> +static struct dma_chan *ma35d1_of_xlate(struct of_phandle_args *dma_spec=
, struct of_dma *of)
> +{
> +	struct ma35d1_pdmadev *pdmadev =3D of->of_dma_data;
> +	unsigned int chan_id, reqsel;
> +
> +	if (dma_spec->args_count !=3D 2)
> +		return NULL;
> +
> +	chan_id =3D dma_spec->args[0];
> +	reqsel =3D dma_spec->args[1];
> +	if (chan_id >=3D pdmadev->nr_chans || reqsel > GENMASK(7, 0))
> +		return NULL;
> +
> +	pdmadev->channels[chan_id].request =3D reqsel;
> +
> +	return dma_get_slave_channel(&pdmadev->channels[chan_id].vc.chan);
> +}

[Severity: High]
In ma35d1_of_xlate(), pdmadev->channels[chan_id].request =3D reqsel is writ=
ten
before calling dma_get_slave_channel().

If chan_id is already in use by another consumer, dma_get_slave_channel()
will return NULL, but the active channel's request field will already have
been overwritten with reqsel. Should request only be assigned after
dma_get_slave_channel() succeeds?

> +
> +static void ma35d1_free_chan_resources(struct dma_chan *chan)
> +{
> +	struct ma35d1_chan *ch =3D to_ma35d1_pdma_chan(chan);
> +
> +	vchan_free_chan_resources(&ch->vc);
> +	ch->request =3D 0;
> +}

[Severity: Medium]
When a channel is released in ma35d1_free_chan_resources(), ch->request is
reset to 0, but ch->cfg (including ch->cfg.peripheral_config) is not cleare=
d,
and any active descriptor in ch->desc (which ma35d1_pdma_start_desc() unlin=
ked
from vc.desc_issued via list_del(&vd->node)) is not terminated or freed.

If a slave consumer configures peripheral_config via ma35d1_slave_config() =
and
later releases the channel, won't a subsequent DMA_MEMCPY user (or a slave
consumer that does not set peripheral_config) inherit the stale
ch->cfg.peripheral_config pointer in ma35d1_pdma_start_desc() ->
ma35d1_pdma_timeout() and erroneously enable peripheral timeout interrupts?

[ ... ]

> +static enum dma_status ma35d1_tx_status(struct dma_chan *chan, dma_cooki=
e_t cookie,
> +					struct dma_tx_state *txstate)
> +{
> +	enum dma_status ret;
> +	struct ma35d1_chan *ch =3D to_ma35d1_pdma_chan(chan);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ch->vc.lock, flags);
> +
> +	ret =3D dma_cookie_status(chan, cookie, txstate);
> +	if (ret =3D=3D DMA_COMPLETE) {
> +		if (ch->error)
> +			ret =3D DMA_ERROR;
> +		else
> +			dma_set_residue(txstate, ch->remain);
> +	}
> +
> +	spin_unlock_irqrestore(&ch->vc.lock, flags);
> +
> +	return ret;
> +}

[Severity: High]
There appear to be several issues with status and residue reporting in
ma35d1_tx_status() and ma35d1_pdma_interrupt():

1. ma35d1_tx_status() only calls dma_set_residue() when ret =3D=3D DMA_COMP=
LETE.
For DMA_IN_PROGRESS transfers (including cyclic transfers, where cookie sta=
tus
is always DMA_IN_PROGRESS), residue is never computed and remains 0.

2. Error and residue state are stored in per-channel fields (ch->error and
ch->remain) rather than per-descriptor, and ch->error is cleared in
ma35d1_desc_submit() whenever a new descriptor is prepared. Won't preparing=
 a
new descriptor clear ch->error before a client queries the failed transfer's
cookie, or cause an abort to report DMA_ERROR for previously completed cook=
ies
on that channel? Also, ch->desc->vd.tx_result is never updated on abort or
timeout, so callback_result clients will always see DMA_TRANS_NOERROR with 0
residue.

3. In ma35d1_pdma_interrupt(), timeout residue is computed as:

    ch->remain =3D PDMA_GET_TXCNT(ch->base + PDMA_CH_OFFSET(ch->id)) *
                 ch->desc->width;

Because PDMA_TXCNT(cnt) programs the hardware with (cnt) - 1, doesn't readi=
ng
PDMA_GET_TXCNT() without adding 1 under-report the remaining bytes in the
current segment by one beat (ch->desc->width bytes), and ignore any remaini=
ng
segments when sg_len > 1?

[ ... ]

> +static irqreturn_t ma35d1_pdma_interrupt(int irq, void *devid)
> +{
> +	int i;
> +	struct ma35d1_pdmadev *pdmadev =3D devid;
> +	struct ma35d1_chan *ch =3D &pdmadev->channels[pdmadev->nr_chans - 1];
> +	unsigned int timeout_sts, done_sts, abort_sts;
> +	unsigned long pending;
> +
> +	/*
> +	 * Read the interrupt flags. Normally, only one is set per channel.
> +	 * Check and clear each flag separately.
> +	 */
> +	done_sts =3D readl(ch->base + PDMA_TDSTS);
> +	timeout_sts =3D readl(ch->base + PDMA_INTSTS);
> +	abort_sts =3D readl(ch->base + PDMA_ABTSTS);
> +
> +	pending =3D (done_sts | abort_sts | (timeout_sts >> 8)) &
> +		  GENMASK(pdmadev->nr_chans - 1, 0);
> +
> +	for_each_set_bit(i, &pending, pdmadev->nr_chans) {
> +		unsigned long flags;
> +
> +		ch =3D &pdmadev->channels[i];
> +
> +		spin_lock_irqsave(&ch->vc.lock, flags);
> +
> +		if (done_sts & BIT(i)) {
> +			writel(BIT(i), ch->base + PDMA_TDSTS);
> +			if (ch->desc) {
> +				ch->remain =3D 0;
> +				if (ch->desc->cyclic)
> +					vchan_cyclic_callback(&ch->desc->vd);
> +				else
> +					ma35d1_pdma_complete(ch);
> +			}
> +		}
> +
> +		if (timeout_sts & BIT(i + 8)) {
> +			if (ch->desc)
> +				ch->remain =3D PDMA_GET_TXCNT(ch->base + PDMA_CH_OFFSET(ch->id)) *
> +					     ch->desc->width;
> +			ma35d1_pdma_reg_clear(ch, PDMA_TOUTEN, BIT(i));

[Severity: High]
PDMA_TOUTEN is a controller-wide register shared across all channels, and
ma35d1_pdma_timeout() serializes read-modify-write updates to PDMA_TOUTEN
using ch->pdmadev->lock.

Here in ma35d1_pdma_interrupt(), ma35d1_pdma_reg_clear(ch, PDMA_TOUTEN, BIT=
(i))
performs a read-modify-write while holding only the per-channel ch->vc.lock.
Can this race with another CPU starting a descriptor on a different channel=
 in
ma35d1_issue_pending() -> ma35d1_pdma_start_desc() -> ma35d1_pdma_timeout()
and clobber PDMA_TOUTEN?

> +			writel(BIT(i + 8), ch->base + PDMA_INTSTS);
> +			ma35d1_pdma_complete(ch);
> +		}
> +
> +		if (abort_sts & BIT(i)) {
> +			writel(BIT(i), ch->base + PDMA_ABTSTS);
> +			ch->error =3D true;
> +			ma35d1_pdma_complete(ch);
> +		}
> +
> +		spin_unlock_irqrestore(&ch->vc.lock, flags);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Critical]
In ma35d1_pdma_interrupt(), there are a few issues with how channel complet=
ion
and interrupt status are handled:

1. When a timeout interrupt fires (timeout_sts & BIT(i + 8)), the transfer =
has
not completed all beats and the hardware channel remains enabled in PDMA_CH=
CTL
with an active operating mode in PDMA_DSCT_CTL. Calling ma35d1_pdma_complet=
e()
without disabling or resetting the hardware channel will complete and free
ch->desc (via vchan_complete() -> ma35d1_pdma_desc_free()) while the hardwa=
re
channel is still active. If another peripheral request arrives when no next
descriptor was queued, won't the controller DMA into the unmapped/freed cli=
ent
buffer or fetch freed SG descriptors?

2. Because done_sts, timeout_sts, and abort_sts are handled in three sequen=
tial
if blocks that each call ma35d1_pdma_complete(ch) (which completes ch->desc=
 and
immediately starts the next queued descriptor in ch->desc), if more than one
status bit is set for channel i in the same interrupt, won't the second blo=
ck
immediately complete the newly started next descriptor (or free an active
cyclic descriptor)?

3. If pending is 0, should ma35d1_pdma_interrupt() return IRQ_NONE instead =
of
unconditionally returning IRQ_HANDLED?

> +
> +static int ma35d1_pdma_probe(struct platform_device *pdev)
> +{
> +	int i, irq, nr_chans, ret;
> +	struct clk *pdma_clk;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct ma35d1_chan *ch;
> +	struct ma35d1_pdmadev *pdmadev;
> +	void __iomem *reg_base;

[ ... ]

> +	ret =3D of_property_read_u32(node, "dma-channels", &nr_chans);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get dma-channels\n");
> +
> +	if (nr_chans > PDMA_MAX_CHANS) {
> +		dev_warn(dev, "dma-channels %d exceeds max %d, clamping\n",
> +			 nr_chans, PDMA_MAX_CHANS);
> +		nr_chans =3D PDMA_MAX_CHANS;
> +	}

[Severity: High]
In ma35d1_pdma_probe(), nr_chans is declared as a signed int and passed as
&nr_chans to of_property_read_u32(), which expects a u32 * (triggering a
-Wpointer-sign warning), and the bounds check only tests nr_chans >
PDMA_MAX_CHANS without rejecting nr_chans <=3D 0.

If dma-channels in the Device Tree is 0 (or has bit 31 set, making nr_chans
negative), devm_kzalloc() will allocate 0 elements for pdmadev->channels[],
causing out-of-bounds accesses in ma35d1_pdma_interrupt() at
&pdmadev->channels[pdmadev->nr_chans - 1] and in ma35d1_pdma_remove() at
pdmadev->channels[0].base. Should nr_chans be a u32 and checked for
nr_chans =3D=3D 0?

[ ... ]

> +	ret =3D devm_request_irq(dev, irq, ma35d1_pdma_interrupt, 0, pdev->name=
, pdmadev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	ret =3D dmaenginem_async_device_register(&pdmadev->ddev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D of_dma_controller_register(node, ma35d1_of_xlate, pdmadev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "of_dma_controller_register failed\n");
> +
> +	platform_set_drvdata(pdev, pdmadev);
> +
> +	return 0;
> +}
> +
> +static void ma35d1_pdma_remove(struct platform_device *pdev)
> +{
> +	struct ma35d1_pdmadev *pdmadev =3D platform_get_drvdata(pdev);
> +	int i;
> +
> +	of_dma_controller_free(pdev->dev.of_node);
> +	writel(0, pdmadev->channels[0].base + PDMA_INTEN);
> +
> +	for (i =3D 0; i < pdmadev->nr_chans; i++)
> +		tasklet_kill(&pdmadev->channels[i].vc.task);
> +}

[Severity: High]
In ma35d1_pdma_probe(), the interrupt handler and dma_device are registered=
 via
devm_request_irq() and dmaenginem_async_device_register(), so devres only
releases them after ma35d1_pdma_remove() returns.

During ma35d1_pdma_remove():
1. Active channels in PDMA_CHCTL and timeout interrupts in PDMA_TOUTIEN /
PDMA_TOUTEN are not disabled.
2. The IRQ is not freed or synchronized before tasklet_kill(), so an in-fli=
ght
ma35d1_pdma_interrupt() on another CPU (or a timeout interrupt) can call
vchan_cookie_complete() or vchan_cyclic_callback() and reschedule vc.task
after tasklet_kill() finishes.
3. Because pdmadev->ddev is still registered during ma35d1_pdma_remove(), a
concurrent client can still prepare descriptors and re-enable PDMA_INTEN in
ma35d1_pdma_setup_channel().

Could this allow vc.task to run after devres frees pdmadev? Also, if
of_dma_controller_register() fails in ma35d1_pdma_probe(), the channel
tasklets are not killed on error unwind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103022202.2139=
674-1-shanchun1218@gmail.com?part=3D2
