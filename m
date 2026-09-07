Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863703F104D;
	Mon,  7 Sep 2026 03:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752960; cv=none; b=ZqirDkEqh6utDC6oC+MQIiBXEdF+CNr6OvSBzZHCQ0klcVaYrPFiqdudhHgHDd1a38mVts0L5DvXOrnCtnLsSBGpfXHG7AXgOP569Wpj2AWLoOphjZkWft81ORdxHu0b7gwLdiVSk2enTJlv0Fe6Rhz5TWP2BK0Irkkzu4WleoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752960; c=relaxed/simple;
	bh=SUVTj2jsp2xaM2jMeUsjKW84yzL/tD40S51pOnDXyCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RFgQM9GsloF+brOPphrLaGULX4uKJicBr3wskMJlpuTULW0BUjb4WFK1oIN1Po2x0uP7onqI9ds7Rw7+hTMC11Zu51nTa7oRW2iAr1+U72et/u/RbXJ6Caad2ZwAESOViGsCO/ttVQLILMUgzLhiBQrFpaDFvrPl01GEfeh2mBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF6VWhzF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF6VWhzF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C681F00A3A;
	Mon,  7 Sep 2026 03:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788752958;
	bh=yk6wocONvf35c/K1+rbUnRfxtC6EBFHf4vR8YXxB/Hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mF6VWhzFmH7WnCwHUH9LCsywqoiJeMJvX+h+cn3sx8UKY3natxUoQe8Z16oDeMhYt
	 fTLLhLJnD/1HRmepl8o0Is5qkgNfm/3zS1NqO07jnYJjet/YCWjA1jG31IgOkCub4s
	 6oNuyes56Hl1eQOdc+TfkZpbxzWVb87aIDNUp8erHowwvFCh7vo0Ne8PlRByEx1gQV
	 G/SiQbvsT8i10aInDqf9dnNkZNXxkk5zFcme7Ot0yg8+td3avBemL8AwQEJOCRfdeJ
	 eg5mpx1Jneo7G2Zu3ckgusCKbn/cFsZjwVUgELXLOTnMfIoFAA8RXNEadzprL+fSza
	 eV8AivbI6KN3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/5] dmaengine: arm-dma350: Add slave transfer
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: robh@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907033404.596839-3-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20260907033404.596839-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 03:49:17 +0000
Message-Id: <20260907034918.09C681F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] DMA descriptors in memory are written using native endianness, cau=
sing corruption on big-endian CPUs.
- [High] Cyclic DMA residue calculation relies on fragile software tracking=
, lacks sub-period precision, and permanently desynchronizes if interrupts =
coalesce.
- [High] d350_of_xlate() incorrectly fails to allocate a channel if the fir=
st free channel lacks trigger support.
- [High] Valid DMA address of 0 is erroneously treated as a sentinel, disab=
ling descriptor linking and breaking cyclic/SG transfers.
- [High] Calling dma_free_coherent() from the vchan_complete tasklet causes=
 sleeping in atomic context.
- [High] Race condition between reading CH_LINKADDR and CH_XSIZE leads to i=
nvalid, non-monotonic DMA residue calculations.
- [Medium] Trigger block size ignores configured maxburst for DEV_TO_MEM tr=
ansfers, degrading performance.
- [Medium] Torn read of the 64-bit hardware CH_LINKADDR register due to mis=
sing retry loop.

Pre-existing issues:
- [High] Spurious DMA_ERROR returned for descriptors that have been submitt=
ed but not yet issued.
--

commit e35af7caf5e3e88f06c1135c2c306f3cb90773b3
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Add slave transfer support

Add DMA slave support to the Arm DMA-350 driver, which so far only
supports memory-to-memory transfers.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 4e17130de6c87..85e8c5e428044 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
[ ... ]
> +static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
> +{
> +	if (desc->cmds)
> +		dma_free_coherent(dev, desc->cmds_size, desc->cmds,
> +				  desc->cmds_dma);
> +	kfree(desc->cmd_len);
> +}
> +
>  static void d350_desc_free(struct virt_dma_desc *vd)
>  {
> -	kfree(to_d350_desc(vd));
> +	struct d350_desc *desc =3D to_d350_desc(vd);
> +
> +	d350_free_cmds(vd->tx.chan->device->dev, desc);
> +	kfree(desc);
> +}

[Severity: High]
Can this sleep in atomic context?

d350_desc_free() is registered as the virt-dma desc_free callback, which
executes in a tasklet (softirq) context. However, dma_free_coherent()
might sleep (e.g., when flushing IOMMU page tables), which could trigger
scheduling-while-atomic BUGs.

[ ... ]
> +static struct dma_chan *d350_of_xlate(struct of_phandle_args *dma_spec,
> +				      struct of_dma *ofdma)
> +{
> +	struct d350 *dmac =3D ofdma->of_dma_data;
> +	struct dma_chan *chan;
> +	struct d350_chan *dch;
> +	u32 req;
[ ... ]
> +	chan =3D dma_get_any_slave_channel(&dmac->dma);
> +	if (!chan) {
> +		dev_err(dmac->dma.dev, "can't get a dma channel\n");
> +		return NULL;
> +	}
> +
> +	dch =3D to_d350_chan(chan);
> +	if (!dch->has_trig) {
> +		dev_err(dmac->dma.dev, "channel %d has no trigger support\n",
> +			chan->chan_id);
> +		dma_release_channel(chan);
> +		return NULL;
> +	}

[Severity: High]
Does this incorrectly reject valid requests on heterogeneous DMA configurat=
ions?

If dma_get_any_slave_channel() happens to return a channel lacking trigger
support, the request is dropped entirely instead of continuing to search
the remaining free channels for a capable one.

[ ... ]
> +static void d350_fill_slave_cmd(struct d350_chan *dch, struct d350_desc =
*desc,
> +				u32 *cmd, dma_addr_t mem, dma_addr_t dev_dma_addr,
> +				size_t len, dma_addr_t link_addr,
> +				enum dma_transfer_direction direction,
> +				enum dma_slave_buswidth width, u32 maxburst,
> +				enum ch_ctrl_donetype donetype)
> +{
> +	bool mem_to_dev =3D direction =3D=3D DMA_MEM_TO_DEV;
> +	u16 xsize, xsizehi;
> +	u32 devcfg;
> +	u32 memcfg;
> +	u32 trigcfg;
> +
> +	desc->tsz =3D __ffs(width);
> +	xsize =3D lower_16_bits(len >> desc->tsz);
> +	xsizehi =3D upper_16_bits(len >> desc->tsz);
> +	devcfg =3D d350_device_transcfg(maxburst);
> +	memcfg =3D dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
> +
> +	trigcfg =3D FIELD_PREP(CH_TRIGINCFG_BLKSIZE,
> +			     mem_to_dev ? maxburst - 1 : 0) |

[Severity: Medium]
Does this degrade performance for device-to-memory transfers?

The trigger block size ignores the configured maxburst and is hardcoded to 0
for DEV_TO_MEM transfers. This means only a single item is processed per
hardware trigger, which might cause peripheral FIFOs to overflow if they
expect burst servicing.

> +		  FIELD_PREP(CH_TRIGINCFG_MODE, CH_TRIGINCFG_MODE_PERIPH_FC) |
> +		  FIELD_PREP(CH_TRIGINCFG_TYPE, CH_TRIGINCFG_TYPE_HW) |
> +		  FIELD_PREP(CH_TRIGINCFG_SEL, dch->req);
> +
> +	cmd[0] =3D LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
> +		 LINK_DESADDRHI | LINK_XSIZE | LINK_XSIZEHI | LINK_SRCTRANSCFG |
> +		 LINK_DESTRANSCFG | LINK_XADDRINC | LINK_LINKADDR |
> +		 LINK_LINKADDRHI |
> +		 (mem_to_dev ? LINK_DESTRIGINCFG : LINK_SRCTRIGINCFG);

[Severity: High]
Will this cause corruption on big-endian CPUs?

Native CPU-endian words are being written directly to the DMA command list
buffer (desc->cmds), which will be fetched by the little-endian hardware.
Should this use cpu_to_le32 wrappers to avoid swapped addresses and sizes?

[ ... ]
> +	cmd[11] =3D trigcfg;
> +	cmd[12] =3D lower_32_bits(link_addr) |
> +		  (link_addr ? CH_LINKADDR_EN : 0);

[Severity: High]
Is it safe to use link_addr as a boolean condition here?

dma_alloc_coherent() can validly return 0 as a bus address. If it does,
CH_LINKADDR_EN will not be set, which would prematurely terminate and break
cyclic or scatter-gather transfers.

> +	cmd[13] =3D upper_32_bits(link_addr);
> +}
[ ... ]
> +static u32 d350_get_sg_residue(struct d350_chan *dch)
> +{
> +	struct d350_desc *desc =3D dch->desc;
> +	size_t cmd_size =3D D350_SLAVE_CMD_WORDS * sizeof(u32);
> +	size_t cmd =3D 0, i;
> +	u32 residue;
> +	u64 next_cmd;
> +
> +	if (!desc->cmd_len)
> +		return d350_get_residue(dch);
> +
> +	/*
> +	 * CH_LINKADDR points at the next command. Match it against the command
> +	 * array to find the command currently executing, then add every later
> +	 * command which has not started yet.
> +	 */
> +	next_cmd =3D readl_relaxed(dch->base + CH_LINKADDR) & ~CH_LINKADDR_EN;
> +	next_cmd |=3D (u64)readl_relaxed(dch->base + CH_LINKADDRHI) << 32;

[Severity: Medium]
Could this result in a torn read of the 64-bit hardware CH_LINKADDR registe=
r?

The two 32-bit reads are executed sequentially without protection against
concurrent hardware updates, unlike the safe retry loop you used for CH_XSI=
ZE.
If the hardware advances the command chain between the reads, the CPU const=
ructs
a torn address.

> +
> +	if (!next_cmd) {
> +		cmd =3D desc->ncmds - 1;
> +	} else {
> +		for (i =3D 1; i < desc->ncmds; i++) {
> +			if (next_cmd =3D=3D desc->cmds_bus + i * cmd_size) {
> +				cmd =3D i - 1;
> +				break;
> +			}
> +		}
> +		if (i =3D=3D desc->ncmds)
> +			return dch->residue;
> +	}
> +
> +	residue =3D d350_get_residue(dch);

[Severity: High]
Is there a race condition between reading CH_LINKADDR and CH_XSIZE?

d350_get_residue() reads CH_XSIZE. If the hardware completes command N and
starts N+1 between the earlier read of CH_LINKADDR and the read of CH_XSIZE,
the driver calculates residue using command N's position in the loop but
command N+1's remaining bytes. This would double-count the size of N+1 and
cause the reported residue to jump upwards, breaking monotonicity.

> +	for (i =3D cmd + 1; i < desc->ncmds; i++)
> +		residue +=3D desc->cmd_len[i];
> +
> +	return residue;
> +}
[ ... ]
> +static u32 d350_get_cyclic_residue(struct d350_desc *desc)
> +{
> +	return desc->bytes - desc->period * desc->period_len;
> +}

[Severity: High]
Does this provide sufficient precision for cyclic consumers like ALSA?

This calculates an inaccurate residue that ignores intra-period hardware
progress, returning only period boundaries. ALSA PCM pointers typically
require high-resolution, accurate sub-period updates.

[ ... ]
>  static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_=
t cookie,
>  				      struct dma_tx_state *state)
>  {
>  	struct d350_chan *dch =3D to_d350_chan(chan);
>  	struct virt_dma_desc *vd;
>  	enum dma_status status;
>  	unsigned long flags;
>  	u32 residue =3D 0;
> =20
>  	status =3D dma_cookie_status(chan, cookie, state);
> =20
>  	spin_lock_irqsave(&dch->vc.lock, flags);
>  	if (cookie =3D=3D dch->cookie) {
>  		status =3D dch->status;
>  		if (status =3D=3D DMA_IN_PROGRESS || status =3D=3D DMA_PAUSED)
> -			dch->residue =3D d350_get_residue(dch);
> +			dch->residue =3D d350_get_active_residue(dch);
>  		residue =3D dch->residue;
>  	} else if ((vd =3D vchan_find_desc(&dch->vc, cookie))) {
>  		residue =3D d350_desc_bytes(to_d350_desc(vd));
>  	} else if (status =3D=3D DMA_IN_PROGRESS) {
>  		/* Somebody else terminated it? */
>  		status =3D DMA_ERROR;
>  	}

[Severity: High]
This is a pre-existing issue, but does this incorrectly return DMA_ERROR for
submitted but unissued descriptors?

vchan_find_desc() only searches the desc_issued list. If a client queries
status after tx_submit but before issue_pending, this explicit overwrite
converts a valid DMA_IN_PROGRESS status into DMA_ERROR.

[ ... ]
>  static irqreturn_t d350_irq(int irq, void *data)
>  {
[ ... ]
> +	if (irq_status & CH_STAT_INTR_ERR) {
[ ... ]
> +	} else {
> +		if (desc->cyclic) {
> +			desc->period =3D (desc->period + 1) % desc->periods;
> +			dch->residue =3D d350_get_cyclic_residue(desc);
> +			vchan_cyclic_callback(vd);

[Severity: High]
Can this permanently desynchronize the cyclic stream?

Unconditionally advancing the period by 1 software counter will lag behind =
the
actual hardware position if interrupt coalescing occurs or interrupts are
delayed, causing multiple hardware periods to complete between IRQ handling.

> +		} else {
> +			dch->status =3D DMA_COMPLETE;
> +			dch->residue =3D 0;
> +			dch->desc =3D NULL;
> +			vchan_cookie_complete(vd);
> +			d350_start_next(dch);
> +		}
>  	}
>  	spin_unlock(&dch->vc.lock);
> =20
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907033404.5968=
39-1-Jelly.Jia@cixtech.com?part=3D2
