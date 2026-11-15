Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730798;
	b=CJro/+x39TzTh0k1yWxdaMBRqACd+LA4q/fzXFBs1UUa22ZpUuRW4lwz9QehZ5x+++Ak
	 C8n3vk5acCnC1e3t25+h+PMN32A1PBuNQqKRLEMzMtbjm7QN/mMDEVDIoxY2YOf1rA3kY
	 ub9cbHdFLfxixjOVrkRg+EWjtMW3jLoM3opWtn5TiNsqidkm1opBgLFKlIycJk8rBDwG7
	 I0vCo38/uGa06zK1pkDAbBPoxws4BdFhNBBx7e6Ngpp150WYCt1yZrzYe8f7p5iQkGtRv
	 OvAQ8nD6lCTzoLq5xO6IPe/rgpuzSRK5U/xGPrr/biiRhvFjsWXmMMujBkAZUyNpF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730798;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5j7Rwm2P0PJF0PvP7jwrVutdkVt9Ye+i1TDwdN0dvsk=;
	b=EgOAlgyHCO04/MFPIpo2btk9zfUlhtjgZtqVyfUyIB3tDPjmjfrHU6PfswTliwjonnOd
	 LjpNL67QWNc5tELlEHCYQjLD6y6Vu+X+ax5wNzNb75fOhDFnAZOoLjoSZ05M6pcYnU+Lq
	 47lzcLBWUI8JLbMwagA6D+C/2NFargkynppqycjtbZMgIdpORdqFqVbDQlQ82pjYB1SYe
	 E58YRiUOPIrTu9Bd8LvXFgEjfjH4fAUqMLjIABkO5bW9WMd0JMuBVlyuEc9vd6rAsKUKb
	 4RuYVIE761YHBZd0qxdrhapWbutylsHiXN4CpyNZXyrljleW6r/PUGNMndQCWkD7YgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsUM0zGV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EA606A31F
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsUM0zGV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270E51F000C4;
	Sun, 15 Nov 2026 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730798;
	bh=5j7Rwm2P0PJF0PvP7jwrVutdkVt9Ye+i1TDwdN0dvsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GsUM0zGVF9t6DY2SmHrlX7f57fjYuvpVXIwwKYNYCT6oSlUwkqzdapoPZ+KRD1JUM
	 aOzgVokt3StP+WVuxL47phyQMmet6nL2Bb291luqG+qOSOBi+39ZmGh8c5xSmJx1I7
	 Oq71RXI/sh0LsZ+ICZVLYYNf+b4tqCdl4TmmWLcRNEt0lpdO2E9Tr+Y8ELn2M7iTc9
	 1/zyLtqAkkFSf5o/DHW5SiUYRZpCpkt6dsslCj3y0zJjUsS8naRfszZYkU2Pv5WR25
	 FmTozy0c4g259+uA6NsjMJFRFXerm6okLAioEX8hxh1kvVlF62blHdllC9Ncm1pc2S
	 GUz1S6137jblQ==
Message-ID: <sashiko-outbox-215288@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: at_xdmac: handle empty transfer list in
 tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziheng Wei" <zihengw03@163.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261115080245.910534-1-zihengw03@163.com>
References: <20261115080245.910534-1-zihengw03@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:19:57 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] dmaengine: at_xdmac: unchecked list_first_entry() in
  at_xdmac_tasklet() [1]
--

commit 7130c1ad653839b18d68794e4d33147aad0531b5
Author: Ziheng Wei <zihengw03@163.com>

dmaengine: at_xdmac: handle empty transfer list in tx_status

This commit uses list_first_entry_or_null() in at_xdmac_tx_status() and
reports a zero residue when atchan->xfers_list is empty after channel
termination.

> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index ef0dfe9d37ba3..bcfbb41ea4bc1 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -1553,7 +1553,16 @@ at_xdmac_tx_status(struct dma_chan *chan, dma_cook=
ie_t cookie,
> =20
>  	spin_lock_irqsave(&atchan->lock, flags);
> =20
> -	desc =3D list_first_entry(&atchan->xfers_list, struct at_xdmac_desc, xf=
er_node);
> +	desc =3D list_first_entry_or_null(&atchan->xfers_list, struct at_xdmac_=
desc,
> +					xfer_node);
> +	/*
> +	 * The list is empty once the channel has been terminated, while the
> +	 * cookie of the terminated transfer is still reported as in progress.
> +	 */
> +	if (!desc) {
> +		dma_set_residue(txstate, 0);
> +		goto spin_unlock;
> +	}

[Severity: High]
This problem wasn't introduced by this patch, but can at_xdmac_tasklet()
and at_xdmac_handle_error() also call list_first_entry() on an empty
atchan->xfers_list [1]?

CPU0                                  CPU1
at_xdmac_interrupt()
  atchan->irq_status =3D ...
  tasklet_schedule(&atchan->tasklet)
                                      at_xdmac_device_terminate_all()
                                        spin_lock_irqsave(&atchan->lock)
                                        list_del(&desc->xfer_node)
                                        clear_bit(AT_XDMAC_CHAN_IS_CYCLIC)
                                        spin_unlock_irqrestore(...)
at_xdmac_tasklet()
  spin_lock_irq(&atchan->lock)
  desc =3D list_first_entry(&atchan->xfers_list, ...)
  if (!desc->active_xfer)             <-- out-of-bounds read
  list_del(&desc->xfer_node)          <-- list corruption

at_xdmac_device_terminate_all() empties atchan->xfers_list and clears the
cyclic flag without clearing atchan->irq_status or stopping the scheduled
tasklet.  When at_xdmac_tasklet() runs, it sees the stale
atchan->irq_status bits and computes a bogus descriptor pointer from the
empty list head, causing an out-of-bounds read and corrupting
atchan->xfers_list and atchan->free_descs_list if desc->active_xfer reads
as non-zero.

[1] https://sashiko.dev/#/bug/linux-bba900ca-f8ae-4ff8-a433-e3d7588cc938

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115080245.9105=
34-1-zihengw03@163.com?part=3D1
