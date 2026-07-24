Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386342587B;
	Fri, 24 Jul 2026 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890357; cv=none; b=KL054ZE+wso5tHQH/W/n/7cC1zBwwFuOxvZjNVn5Sce09VIYs3gNTrw29D9dbNKwUMjOSj0TUtDaRIxJI2oPUSV2IoMes928aGc/i+rlNeQcCaCZsAGBmHgGlfP7ESrEIgNDadM/ZtNIMgpGkNYs5mZRT6VvtaMh1U4gZC2d3MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890357; c=relaxed/simple;
	bh=nivbMWYTpuBr7Eb7p9qP4UEJ3yHFJhRjOSxY7woZLuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IGGAizvOrTDN54Xksqo6ILI2C/r6VKFRSUfgOu76EYCB0VWDbXXuwz2ISjuI6NwvaSDn50xtMqUzv9GOWOvyhpUYQBYy8TSDpIrngn23gyLlVteJkqalHXvxuMkLrch4Z7afM4jauZ5F/U75LaB4Ctt5f/SLU5+IGhlXM1eRfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZL8BE/9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZL8BE/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84761F000E9;
	Fri, 24 Jul 2026 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890353;
	bh=plyDL0tHSmwjrixQV0T65hsRiJHtVh05UcJdcnaV5Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZL8BE/9KIFN3NcXglg4oTbF1L/NZ23I2TjGrus7k99Jnsra1VB0A61WqDPhyuRHc
	 41D0pDYzEbj9bF2a1Xi1J+rgBuV+GlRs05omRyz+7ALzhq07X79NjI+vZQYTB0CHvq
	 7FRM4vFH2WQ8YyPX7INYHVJnbsp7JGWeSYJCH2NaNXvJQXeFT6o94kejX/+3BV6nHn
	 3+J2XHzLYKufCr6MG83HvBTxS1rPWVq/WnARxys6574tFdvnniK7E1VkMy+jgWQCPT
	 mb7Qpk5c07/qofZFVIxMTi0yauYlbsiOP6tkG5grtf3Glg3UFsZDxRaCZBDN7cMr2E
	 PGZtaz4msOKcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/19] dmaengine: ti: k3-udma: move resource
 management functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724102115.2854-10-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-10-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:52:32 +0000
Message-Id: <20260724105232.B84761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Tasklet can dereference a freed cyclic descriptor due to missi=
ng `vchan_terminate_vdesc()`.
- [High] Missing bounds checks for resource IDs in `UDMA_RESERVE_RESOURCE` =
macro and `udma_get_tchan` before performing bitmap accesses.
- [High] Lack of synchronization in UDMA resource allocation functions lead=
ing to TOCTOU races and potential bitmap corruption.
- [High] Incorrect boundary check in `udma_get_chan_pair` leads to potentia=
l out-of-bounds bitmap writes.
--

--- Patch [9]: [PATCH v7 09/19] dmaengine: ti: k3-udma: move resource manag=
ement functions to k3-udma-common.c ---
commit e7614ebd200c614b2a17303347bcfc13ecd5262d
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move resource management functions to k3-udma-commo=
n.c

Move functions responsible for allocation and release of udma
resources such as channels, rings and flows from k3-udma.c
to the common k3-udma-common.c file.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -1891,5 +1891,447 @@ enum dmaengine_alignment udma_get_copy_align(stru=
ct udma_dev *ud)

[ ... ]

> +int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
> +{

[ ... ]

> +	start =3D bitmap_find_next_zero_area(tmp,
> +					   ud->rflow_cnt,
> +					   tmp_from, cnt, 0);
> +	if (start >=3D ud->rflow_cnt)
> +		return -ENOMEM;
> +
> +	if (from >=3D 0 && start !=3D from)
> +		return -EEXIST;
> +
> +	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);

[Severity: High]
This is a pre-existing issue, but since these functions are exported for use
by other drivers (like k3-udma-glue.c), can they be called concurrently?

There is no locking (e.g., ud->lock) around the bitmap_find_next_zero_area()
search and the subsequent bitmap_set() operation. Does this expose a
time-of-check to time-of-use (TOCTOU) race condition that could result in
double allocations or bitmap corruption?

> +	return start;
> +}
> +EXPORT_SYMBOL_GPL(__udma_alloc_gp_rflow_range);
> +
> +int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
> +{
> +	if (from < ud->rchan_cnt)
> +		return -EINVAL;
> +	if (from + cnt > ud->rflow_cnt)
> +		return -EINVAL;
> +
> +	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);

[Severity: High]
This is a pre-existing issue, but similarly to the allocation function, this
modifies the shared bitmap without synchronization. Could this cause data r=
aces
if multiple flows are freed concurrently?

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__udma_free_gp_rflow_range);

[ ... ]

> +#define UDMA_RESERVE_RESOURCE(res)					\
> +struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
> +					       enum udma_tp_level tpl,	\
> +					       int id)			\
> +{									\
> +	if (id >=3D 0) {							\
> +		if (test_bit(id, ud->res##_map)) {			\

[Severity: High]
This is a pre-existing issue, but is it possible for a client driver or dev=
ice
tree to provide an out-of-bounds id here?

The macro calls test_bit(id, ud->res##_map) and set_bit(id, ud->res##_map)
without verifying if id is strictly less than ud->res##_cnt. Could this lead
to out-of-bounds memory accesses?

> +			dev_err(ud->dev, "res##%d is in use\n", id);	\
> +			return ERR_PTR(-ENOENT);			\
> +		}							\

[ ... ]

> +int udma_get_tchan(struct udma_chan *uc)
> +{
> +	struct udma_dev *ud =3D uc->ud;
> +	int ret;

[ ... ]

> +	if (ud->tflow_cnt) {
> +		int tflow_id;
> +
> +		/* Only PKTDMA have support for tx flows */
> +		if (uc->config.default_flow_id >=3D 0)
> +			tflow_id =3D uc->config.default_flow_id;
> +		else
> +			tflow_id =3D uc->tchan->id;
> +
> +		if (test_bit(tflow_id, ud->tflow_map)) {

[Severity: High]
This is a pre-existing issue, but tflow_id can be controlled by
uc->config.default_flow_id and is used in bitmap operations without being
checked against ud->tflow_cnt.

Can this cause out-of-bounds reads/writes if a malformed default flow ID is
provided?

> +			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
> +			clear_bit(uc->tchan->id, ud->tchan_map);
> +			uc->tchan =3D NULL;
> +			return -ENOENT;
> +		}

[ ... ]

> +int udma_get_chan_pair(struct udma_chan *uc)
> +{
> +	struct udma_dev *ud =3D uc->ud;
> +	int chan_id, end;

[ ... ]

> +	/* Can be optimized, but let's have it like this for now */
> +	end =3D min(ud->tchan_cnt, ud->rchan_cnt);
> +	/*
> +	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
> +	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
> +	 */
> +	chan_id =3D ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
> +	for (; chan_id < end; chan_id++) {
> +		if (!test_bit(chan_id, ud->tchan_map) &&
> +		    !test_bit(chan_id, ud->rchan_map))
> +			break;
> +	}
> +
> +	if (chan_id =3D=3D end)
> +		return -ENOENT;
> +
> +	set_bit(chan_id, ud->tchan_map);
> +	set_bit(chan_id, ud->rchan_map);

[Severity: High]
This is a pre-existing issue, but is it possible for the loop's initial
chan_id (from start_idx) to be strictly greater than end?

If ud->tchan_cnt > ud->rchan_cnt and start_idx > rchan_cnt, the loop condit=
ion
chan_id < end is immediately false. The exit check chan_id =3D=3D end will =
also
fail, bypassing the -ENOENT return. Would this cause the set_bit() calls to
write out of bounds?

> +	uc->tchan =3D &ud->tchans[chan_id];
> +	uc->rchan =3D &ud->rchans[chan_id];

[ ... ]

> +void udma_free_chan_resources(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc =3D to_udma_chan(chan);
> +	struct udma_dev *ud =3D to_udma_dev(chan->device);
> +
> +	udma_terminate_all(chan);
> +	if (uc->terminated_desc) {
> +		ud->reset_chan(uc, false);
> +		udma_reset_rings(uc);
> +	}
> +
> +	cancel_delayed_work_sync(&uc->tx_drain.work);
> +
> +	if (uc->irq_num_ring > 0) {
> +		free_irq(uc->irq_num_ring, uc);
> +
> +		uc->irq_num_ring =3D 0;
> +	}
> +	if (uc->irq_num_udma > 0) {
> +		free_irq(uc->irq_num_udma, uc);
> +
> +		uc->irq_num_udma =3D 0;
> +	}
> +
> +	/* Release PSI-L pairing */
> +	if (uc->psil_paired && ud->psil_unpair) {
> +		ud->psil_unpair(ud, uc->config.src_thread,
> +				  uc->config.dst_thread);
> +		uc->psil_paired =3D false;
> +	}
> +
> +	vchan_free_chan_resources(&uc->vc);
> +	tasklet_kill(&uc->vc.task);

[Severity: Critical]
This is a pre-existing issue, but does this sequence leave a window for a
use-after-free on cyclic descriptors?

udma_terminate_all() sets uc->terminated_desc =3D uc->desc without calling
vchan_terminate_vdesc(), which leaves vc->cyclic pointing to the descriptor.
udma_reset_rings() then frees uc->terminated_desc.

If a custom completion tasklet is scheduled and executes concurrently before
tasklet_kill() runs, won't it try to dereference the already freed vc->cycl=
ic
memory?

> +
> +	bcdma_free_bchan_resources(uc);
> +	udma_free_tx_resources(uc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D9
