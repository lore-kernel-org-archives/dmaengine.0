Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAA938910E
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336389; cv=none; b=k5DOpKdTKrwqJQCqA4tuBTJZfJHfVqx1wqkPnxUcVg7V0IEGVB9YxKhYbw49lNyquAYZdgNFgogjeE1YShRFcZBr78/LZnUCMao87K1zMItMRGWZ+zwif8puH0WT6Jc0BGmgj3taNdEpzJFGITHJ4LmJcuXlfeod2S1+AWC8Zv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336389; c=relaxed/simple;
	bh=fsuJG4OjJsqVawmS3POWnYzOUFKL4sr4HIhjtp4XH2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DAsGGxK5ECCydasatCtBWk9B9tIA/LGV+lvurj7iHk5T7bzDAobdQt9zfFWhxqBwbZmrO4DoPEl6EGEWWqofCGUEXJnwMDa8xM5VbJv2MJCS7LqhOoYWTXB2LOMIPOu5/5BMoYTDBXHC44KziDlDaTh5wYxnerMN7JFWDwYPpKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNO5UW0b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNO5UW0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B351F000E9;
	Wed, 29 Jul 2026 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336388;
	bh=ubzBs4mbva6UhC8DfNjHU5cMi7QAvseE7DLbzaVi7i0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eNO5UW0bHukG8k0L43Y+0ZhoivmJCAU1wPn3zYWd5DwmVt9s7ELflwRHVyllK4HVi
	 cHzkFj/a1zOBqVNFGxhqjlMcqL1pY43yapUL5maDJrSZS4tP6hrtj6YxjG84keshhh
	 4T+fXeV2uCyH/WzNUGZO4gKP2GEBMQzeghJ6m/dgims5Lodc+4JdaM1NQrqI5SaUG6
	 nv47nRQLHm9xWJJsBUmRXVYHNNvVfuN2YQ70dBG1axHVqR0Z0V8dcT4Y17da+c76Nx
	 IMu5cozBSJb6wWvPtGjha6oA6xZfCpwHPSWO0D7CixlOZt/s9RVytbTBnNojBujHvN
	 D992az3ZCc7XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:46:27 +0000
Message-Id: <20260729144627.B4B351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch introduces an unconditional `dev_warn()` when a matching=
 LLI is not found, leading to severe kernel log spam when querying queued o=
r recently completed DMA descriptors.

Pre-existing issues:
- [High] The driver fails to start the next queued descriptor in the interr=
upt handler, breaking queued non-cyclic DMA transfers.
- [High] Missing validation of `src_addr_width` and `dst_addr_width` allows=
 a divide-by-zero kernel panic.
--

--- Patch [1]: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterato=
r variable after list_for_each_entry() ---
commit 4909625fdc8e10245c908a5b3d250dd01aa7c238
Author: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

    dmaengine: loongson1-apb-dma: avoid using iterator variable after list_=
for_each_entry()

    ls1x_dma_tx_status() locates the descriptor actively being processed by
    walking the LLI list and comparing the hardware reported next descriptor
    pointer against each element's next-descriptor pointer.

> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd20ab5..8658d53777957 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -446,22 +446,27 @@ static enum dma_status ls1x_dma_tx_status(struct dm=
a_chan *dchan,
> =20
>  			/* locate the current lli */
>  			next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT];
> -			list_for_each_entry(lli, &desc->lli_list, node)
> -				if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D next_phys)
> -					break;
> +			list_for_each_entry(lli, &desc->lli_list, node) {
> +				if (lli->hw[LS1X_DMADESC_NEXT] !=3D next_phys)
> +					continue;
> =20
> -			dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad",
> -				&lli->phys);
> +				dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad\n",
> +					&lli->phys);
> =20
> -			/* count the residues */
> -			list_for_each_entry_from(lli, &desc->lli_list, node)
> -				bytes +=3D lli->hw[LS1X_DMADESC_LENGTH] *
> -					 chan->bus_width;
> +				/* count the residues */
> +				list_for_each_entry_from(lli, &desc->lli_list, node)
> +					bytes +=3D lli->hw[LS1X_DMADESC_LENGTH] *
> +						 chan->bus_width;
> +
> +				dma_set_residue(state, bytes);
> +				return status;
> +			}
> +
> +			dev_warn(chan2dev(dchan),
> +				 "unable to locate current lli.\n");

[Severity: High]
Does this new unconditional warning cause severe kernel log spam during
normal operation?

If a client submits a descriptor, calls dma_async_issue_pending(), and then
polls its status via dmaengine_tx_status(), the hardware might be executing
a different descriptor (or sitting idle).

In this case, ls1x_dma_query() fetches a physical address that does not mat=
ch
any LLI in the queried descriptor's list, leading to this warning triggering
repeatedly for queued or recently completed descriptors.


[Severity: High]
This is a pre-existing issue, but does the driver fail to start the next
queued descriptor in the interrupt handler, breaking queued non-cyclic DMA
transfers?

Looking at the interrupt handler ls1x_dma_irq_handler():

	if (chan->is_cyclic) {
		vchan_cyclic_callback(vd);
	} else {
		list_del(&vd->node);
		vchan_cookie_complete(vd);
	}

It removes the completed descriptor and marks it as complete, but appears
to lack the logic to initiate the next pending transfer in the virt-dma que=
ue
(e.g., using vchan_next_desc() and ls1x_dma_start()). Can this cause
subsequent queued descriptors to wait indefinitely?


[Severity: High]
This is a pre-existing issue, but does the missing validation of
user-supplied bus widths allow a divide-by-zero kernel panic?

In ls1x_dma_slave_config(), the user-supplied bus widths are saved without
validation:

	chan->src_addr =3D config->src_addr;
	chan->src_addr_width =3D config->src_addr_width;
	chan->dst_addr =3D config->dst_addr;
	chan->dst_addr_width =3D config->dst_addr_width;

Later, in ls1x_dma_prep_lli(), this value is assigned to chan->bus_width
and directly used as a divisor:

	lli->hw[LS1X_DMADESC_LENGTH] =3D buf_len / chan->bus_width;

If a client driver configures the DMA channel but leaves src_addr_width
or dst_addr_width undefined (0), could this lead to an immediate system cra=
sh?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143247.6111=
-1-mahad.ibrahim.dev@gmail.com?part=3D1
