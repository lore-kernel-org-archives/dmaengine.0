Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00900404BE8
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759406; cv=none; b=DauUMiEnfeaoUL70UIoQMwx7ys2lx7h1Z7K31zOI0dBRob3FCzFAwxYfgKp0j83hBxKeuXfoLvga2+uPGnGGy+0cAYUJRa0FKBNxBr+0ewgyXD3NZae5dGmVshpezLvupZ7Hol1FIv22yxYLNj3s4bSKGgTWE+6sLY7EnUu8gKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759406; c=relaxed/simple;
	bh=21LUjT6OX+pI1D5wMRHjsFIbz5Hx2i2mcF/MPBYGhx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A6PWDTZlIock49v3NdolwfDrhmnnGRWUvFqbvQ8bzHUJp927UnEUe1eFOqg6tt8SQlflsZK6JEm+mFs10yPz2qLkXA5v+iouk+SdUmvhEJXmvePJKCNHVxFfWmIoGDZ4j8mG58DGPoOdRWGKxTI6sIOp4LHSgbTjZVLE1DTgPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeDYupBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeDYupBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CE81F00A3A;
	Mon,  3 Aug 2026 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785759403;
	bh=o+6auPbk649a+8SNcbGhb0DSPryEYK1nK+L4UuxC+88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KeDYupBmPJMg6RiEY53TFOZri8oq5AcbGb/QLFXC0gfVMAdhetVANKJwX4F7LwZsZ
	 tDX61F3VrzqzgR5KiDB9fGvaVG9dTM5tKK/Q+goa/e1TzxpZ+uYHUiCKHNfIizCLKB
	 NcguM3YOww7o3zgNvr4LPDJR2PsrCcQbdMJcADT99cnWygPTaNoXDMkVtqA8OEcxIo
	 QpFq/TIoob9kdQCml7yWprpsZNZ/Ws3Lurw8LWfO+lygjU6uKnkgjBiJuz4xumgWT7
	 eYQuHmTH687/y+y7izY8IzO4AnI7BUX3OBglPxNAfys/w7y/413mpT1ovjTdwNkEvZ
	 qPtn5jXiZI44g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
References: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 12:16:42 +0000
Message-Id: <20260803121643.48CE81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Incomplete Error Cleanup / Missing State Restoration causes 750ms =
kernel stalls per channel.
- [High] Missing state reversion combined with ring freeing causes IOMMU ha=
rdware faults (base address 0x0) on reallocation.
- [High] Hardware state leak and DMA Use-After-Free of the event ring.

Pre-existing issues:
- [High] Dangling pointer in `gchan->config` leads to Use-After-Free upon c=
hannel reallocation.
- [High] Deferred shared hardware initialization leaves a dangling channel =
vulnerable to MMIO bus faults.
--

--- Patch [1]: [PATCH v1] dmaengine: qcom: gpi: Fix channel cleanup in unwi=
nd path ---
commit a2ee269fe4b77d9be025b81af8f6b123417e0e5c
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

dmaengine: qcom: gpi: Fix channel cleanup in unwind path

This commit attempts to fix channel cleanup in the gpi_ch_init() error
path. It corrects the channel indices used in the unwind loops, restores
pm_state to DISABLE_STATE, and frees ch_ring on initialization failure.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..c41bfac65ddf3 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
>  error_start_chan:
>  	for (i =3D i - 1; i >=3D 0; i--) {
>  		gpi_stop_chan(&gpii->gchan[i]);
> -		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
> +		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);

[Severity: High]
If gpi_start_chan() fails for channel 1, this error path stops and resets
channel 0, but does it leave gpii->gchan[0].pm_state as ACTIVE_STATE?

If gpii->pm_state is forced to DISABLE_STATE later in this unwind path, when
the client releases channel 0, gpi_free_chan_resources() might see
gchan[0].pm_state =3D=3D ACTIVE_STATE and attempt to send STOP, RESET, and =
DE_ALLOC
commands.

Because gpii->pm_state is DISABLE_STATE, won't the interrupt handler drop
completion interrupts, causing these commands to time out and stall for 750=
ms?

>  	}
>  	i =3D 2;
>  error_alloc_chan:
>  	for (i =3D i - 1; i >=3D 0; i--)
> -		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
> +		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
>  error_alloc_ev_ring:
>  	gpi_disable_interrupts(gpii);
>  error_config_int:
>  	gpi_free_ring(&gpii->ev_ring, gpii);
> +	write_lock_irq(&gpii->pm_lock);
> +	gpii->pm_state =3D DISABLE_STATE;
> +	write_unlock_irq(&gpii->pm_lock);

[Severity: High]
If initialization fails after the hardware event channel is allocated, we f=
ree
the event ring DMA memory here and force gpii->pm_state to DISABLE_STATE.

Later, when gpi_free_chan_resources() is called for the active channel, will
it skip sending GPI_EV_CMD_DEALLOC because cur_state is no longer ACTIVE_ST=
ATE?

Could this leave the hardware event channel active, leading to a DMA
use-after-free on the freed event ring memory?

>  exit_gpi_init:
>  	return ret;
>  }
> @@ -2065,6 +2068,8 @@ static int gpi_alloc_chan_resources(struct dma_chan=
 *chan)
>  		goto xfer_alloc_err;
> =20
>  	ret =3D gpi_ch_init(gchan);
> +	if (ret)
> +		gpi_free_ring(&gchan->ch_ring, gpii);

[Severity: High]
When gpi_ch_init() fails, it appears gchan->pm_state remains set to
CONFIG_STATE.

If we free and zero the ch_ring here without reverting gchan->pm_state, what
happens if a DMA client retries channel allocation?

Would a subsequent call to gpi_ch_init() bypass hardware initialization
because pm_state is already CONFIG_STATE, and program the hardware with a
zeroed physical address from the freed ring, leading to an IOMMU fault?

> =20
>  	mutex_unlock(&gpii->ctrl_lock);
> =20

[Severity: High]
This is a pre-existing issue, but I noticed a potential dangling pointer wh=
en
a DMA channel is released.

In drivers/dma/qcom/gpi.c:gpi_free_chan_resources():

        vchan_free_chan_resources(&gchan->vc);
        kfree(gchan->config);

Since gchan persists across clients, if a new client allocates the same cha=
nnel
and calls dmaengine_slave_config(), this executes:

drivers/dma/qcom/gpi.c:gpi_peripheral_config():

        new_config =3D krealloc(gchan->config, config->peripheral_size, GFP=
_NOWAIT);

Does this pass a freed, non-null pointer into krealloc() if gchan->config w=
asn't
set to NULL after kfree()?

[Severity: High]
This is a pre-existing issue, but could deferred hardware initialization cr=
ash
the system if a client only requests one channel?

In drivers/dma/qcom/gpi.c:gpi_ch_init():

        for (i =3D 0; i < MAX_CHANNELS_PER_GPII; i++)
                if (gpii->gchan[i].pm_state !=3D CONFIG_STATE)
                        goto exit_gpi_init;

If the first channel reaches CONFIG_STATE, it returns success immediately.
If a client then issues a transfer without initializing a second channel:

drivers/dma/qcom/gpi.c:gpi_issue_pending():

        gpi_desc->db =3D ch_ring->wp;
        gpi_write_ch_db(gchan, &gchan->ch_ring, gpi_desc->db);

Won't writing to the MMIO doorbell of an uninitialized (and potentially
unclocked) block cause a bus fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803120316.2703=
956-1-aniket.randive@oss.qualcomm.com?part=3D1
