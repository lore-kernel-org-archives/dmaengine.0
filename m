Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECE3492E31;
	Wed,  7 Oct 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371457; cv=none; b=rGElnYyE5nX/IE4FmCwMtORISpsmFVFXLFRPrhU+Ulk5oIeh/CZz4rRRpb+OR2qwhRYoqq9ROFD93c3+Xqu8toq0AIfa9lJ7Cr4z5mDAg3/F0Egi1/S03PiXXEPVHdqHaTNO/u+b7eNcYCwuH9tn34v8zZr9jtvZXaBrOQY0KAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371457; c=relaxed/simple;
	bh=oK1kcJ+QEf+iZcsupVBXKBFN7f9SMDlPrQwUn94PKpQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dUkwfjusyrVUc1Cu/SI4fgLtd5xFrgREzg8c89RvECZGMOrTFd09NKrJtKCZSWP0GqVAFq5Q60qrVn+Hi+2TeNhBOnDLkAGEl0/CEkp7RZEQMyGDncR+vSlAlNA2MdJ2fsD7Jo9hDmZpXuQLN+2AKerS1z6563lQvqXqGBHrkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWFAjAVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWFAjAVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7591F0089B;
	Wed,  7 Oct 2026 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371443;
	bh=b4AziR0nJfa2h1mnpiM3ZJpF76rWKUBh6kTJjwNmZB0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MWFAjAVrtJPTvP+5Hdq3zEsnOlnOq/LB8GsKIzy/A+WydCh2HfJJxNGJUi+uSx6CV
	 vKphQPUGbMWWzLmbOiLtOrd0wRqbNL8Kjfl+tL2THjngfRRxla+8qFg7Pst7uSBVzU
	 xl95QCix4Hfff9KXCt1f1fH82hc52NLBdkCmXA2cgFQ3AwdBClJa5cN92S0vclwVyX
	 HWofsVQCyo17fcSTLeD4mngnbpB9ZxFHxsV1dwuz6vv0JloDhTYe6p8HBnxR8ZQJ93
	 zMq2OgCKiQqSzntaR5Ow2qPioJPqYSNCfsd5la6cQU6kQO2v4vxC6kcCE8AWimNp+r
	 oSodekn6v7QAw==
Message-ID: <sashiko-outbox-162915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 17/20] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261007102936.2402427-18-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-18-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:10:42 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] dma: missing BCDMA V2 hardware stall workaround in cyclic transfers
- [High] dma: silent descriptor drop on AUTOPAIR timeout causes client hang
- [High] dmaengine: ti: k3-udma-v2: division by zero in udma_v2_tx_status()=
 on zero-length transfers
- [Medium] dma: memory leak of RX flush DMA mappings on probe error paths
--

commit 5dc79a65acd74e4dd901364f6c663884a74b10f2
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2

This commit adds support for the K3 BCDMA_V2 DMA engine used in AM62L. It
introduces a new version enum for DMA match data and implements the V2-spec=
ific
static channel mapping, unified channel space, and direct IRQ functionality.

> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
[ ... ]
> @@ -958,7 +974,8 @@ udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_add=
r_t buf_addr,
>  	 * As we are in cyclic mode, we do not know which period might be the
>  	 * last one, so set the flag for each period.
>  	 */
> -	if (uc->config.ep_type =3D=3D PSIL_EP_PDMA_XY &&
> +	if ((uc->config.ep_type =3D=3D PSIL_EP_PDMA_XY ||
> +	    uc->config.ep_type =3D=3D PSIL_EP_PDMA_XYMF) &&
>  	    uc->ud->match_data->type =3D=3D DMA_TYPE_BCDMA) {
>  		period_csf =3D CPPI5_TR_CSF_EOP;
>  	}

[Severity: High]
Does this properly apply the hardware stall workaround for BCDMA V2 in cycl=
ic
transfers?=20

The commit introduces a hardware workaround in udma_prep_slave_sg_tr() to s=
et
the CPPI5_TR_CSF_EOP flag on every TR, noting that BCDMA V2 hardware stalls
if a TR's ICNT0 is not a multiple of 16 bytes.=20

However, for cyclic transfers where the period length is large and requires
multiple TRs, the first TR explicitly omits this flag. For example:

drivers/dma/ti/k3-udma-common.c:udma_prep_dma_cyclic_tr() {
    ...
    if (num_tr =3D=3D 2) {
        cppi5_tr_csf_set(&tr_req[tr_idx].flags,
                         CPPI5_TR_CSF_SUPR_EVT);
        tr_idx++;
    ...
}

If the period length results in an ICNT0 that isn't a 16-byte multiple, will
the hardware stall here as well?

> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> +static int udma_v2_start(struct udma_chan *uc)
> +{
[ ... ]
> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status !=3D 0, 100, 500, false, uc);
> +
> +		if (status <=3D 0) {
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
> +			/*
> +			 * udma_start_desc() above already pushed uc->desc to
> +			 * the hardware ring. Since the channel never actually
> +			 * started, no completion interrupt will ever arrive
> +			 * to free it - drain the ring and free it here to
> +			 * avoid leaking it.
> +			 */
> +			udma_reset_rings(uc);
> +			udma_desc_free(&uc->desc->vd);
> +			uc->desc =3D NULL;
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
Could this error path leave virt-dma clients hanging indefinitely?

Because the descriptor was already popped from the virt-dma issued list via
vchan_next_desc() earlier in this function, freeing it manually without
invoking vchan_cookie_complete() skips the virt-dma completion notification=
.=20

A DMA client that is waiting for the callback or blocking on dma_sync_wait()
will never be notified of the failure and could hang permanently.

> +static int udma_v2_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D udma_setup_rx_flush(ud);
> +	if (ret)
> +		return ret;
[ ... ]
> +	ret =3D dma_async_device_register(&ud->ddev);
> +	if (ret) {
> +		dev_err(dev, "failed to register slave DMA engine: %d\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, ud);
> +
> +	ret =3D of_dma_controller_register(dev->of_node, udma_v2_of_xlate, ud);
> +	if (ret) {
> +		dev_err(dev, "failed to register of_dma controller\n");
> +		dma_async_device_unregister(&ud->ddev);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
Are we leaking the RX flush mappings if probe fails here?

The call to udma_setup_rx_flush() creates persistent DMA mappings via
dma_map_single(). If a subsequent step like dma_async_device_register() or
of_dma_controller_register() fails, the driver returns without calling the
newly added udma_teardown_rx_flush(), permanently leaking the mappings and
bounce buffers.

Additionally, looking at udma_setup_rx_flush() in k3-udma-common.c, there i=
s a
similar leak where if the second dma_map_single() fails, it returns -ENOMEM
without unmapping the first buffer.

> +static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
> +					 dma_cookie_t cookie,
> +					 struct dma_tx_state *txstate)
> +{
[ ... ]
> +		if (bcnt && !(bcnt % uc->desc->residue))
> +			residue =3D 0;
> +		else
> +			residue -=3D bcnt % uc->desc->residue;

[Severity: High]
Can this cause a division by zero panic?

If a DMA transfer is prepared with a zero length, the transfer descriptor is
allocated with its residue set to 0.=20

When the framework queries the status, bcnt && !(bcnt % uc->desc->residue)
short-circuits to false when bcnt is 0. The code then evaluates
bcnt % uc->desc->residue in the else branch, which will trigger a panic
because uc->desc->residue is 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D17
