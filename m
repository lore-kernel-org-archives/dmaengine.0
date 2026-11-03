Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695338;
	b=pz+kFG1NjBrA0MuG/UKj+rNG7al+w99XewDEh910ot261R9LewNmvkH+6DEkYI6ioayj
	 tbNiGZ5X1TefDi5gLkFrpyaK9hQD8gqsmmQzrwHLdtPY6AEsiAoozBTTsvAW9BHE8Zh0y
	 tYdaoMLLUDMyHEqsU0CZ5Qn5sc9TG/JndiNW9dfvK+fCr30PqWLQhjRJApCSC12jC9KQd
	 uQA+ZxqEzglCMwhdMTq6GoaYxo0kYZwALqOFadZwbaqlcYHhTCqX1yzH0Pkh4G0XFFQYC
	 k6GJNxJdXplD1qFpumCvXwJirDDU1HRdQ4osDFOah8M4PmNhLEu2JoLhQRQM8k1uaOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695338;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9gwEicJ/Ymf8YSJ4s2rZykKLEiOvo8BrmlnfIqbq3o8=;
	b=mTZnZGtKJsBMlJF33cchi9c021QDQrVGrwfvqxlltX2vOaAQGBNqXgIMTwzrfcvojYwO
	 By1tqLk46gIawA2jRrGEAChQTnllL3bV66bmRrHXD5CDGnkHEIBNqyJ3QAHY9UkPgrX8H
	 PrZP1Z+QWnvNm78kwjH4dfjCB+PDLYdhvBfnuXrLEwyJEP2WROVDJmZfIgJZKbpwR95q3
	 ziZNcTByt0GVlnaVxMg3mKF3sA1Udgx+2efAbr/LX6LJ/mSt4+NVwgFKOsjN2YfRqwQUv
	 ZKqRznjhrd/u+a1mcaapra5ldbR6C0uIudr4iKoWKzIW/bnbHrbBCw0t0/C5rRP121A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CY2QNnu/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F054606EEBE
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY2QNnu/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5111F00919;
	Tue,  3 Nov 2026 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793695338;
	bh=9gwEicJ/Ymf8YSJ4s2rZykKLEiOvo8BrmlnfIqbq3o8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CY2QNnu/zYa+FvhmfbUDsrXfgh975j/OgpygIgYBhToWb7HD5FrOBSOfbjyTZyCUU
	 fY5S1hX25pkmVqj94zsLPek6MBo+jVirTT+jHhJrP0/eC6GsICAhQdiVU8hwtKbX9b
	 CyKrysVtbFA6ji/6BNs6m33c01HXOUCtT1837WNnuldh1QO4U0qq7EQyhuY04HD0A9
	 J7FWrs8df61xx4R9f2HcPxgSMZ43qnhz7TPrKgR5mVp4WDpkPGIfsqA+v83qVN2a9m
	 R6iI4MGP4fYiAXztfiB8yrSUPYNyYup8h7tFuIbj9pH+51ZYELvFXHu6LWyFg4FKxC
	 gEuns2l8KejKQ==
Message-ID: <sashiko-outbox-194855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: xilinx: dpdma: fix crash on zero-length
 cyclic transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Ximo" <lixicaicai@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103083132.1122990-1-lixicaicai@gmail.com>
References: <20261103083132.1122990-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:42:17 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: xilinx: dpdma: misplaced and incomplete zero-length c=
heck
--

commit 9ce2097539c963154302835e8e5bdaba12caffe7
Author: Wang Haoran <haoranwangsec@gmail.com>

dmaengine: xilinx: dpdma: fix crash on zero-length cyclic transfer

This commit checks whether the descriptor list is empty after the loop in
xilinx_dpdma_chan_prep_cyclic() to avoid a crash when buf_len is zero.

> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilin=
x_dpdma.c
> index d9a3542c4531c..bdfa85b80c6a8 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_cha=
n *chan,
>  		last =3D sw_desc;
>  	}
> =20
> +	if (list_empty(&tx_desc->descriptors))
> +		goto error;

[Severity: Medium]
In xilinx_dpdma_chan_prep_cyclic(), every iteration of the loop either
jumps to error or appends a descriptor via list_add_tail():

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_chan_prep_cyclic() {
	unsigned int periods =3D buf_len / period_len;
	unsigned int i;

	tx_desc =3D xilinx_dpdma_chan_alloc_tx_desc(chan);
	if (!tx_desc)
		return NULL;

	for (i =3D 0; i < periods; i++) {
		...
		list_add_tail(&sw_desc->node, &tx_desc->descriptors);

		buf_addr +=3D period_len;
		last =3D sw_desc;
	}
}

Because of this, list_empty(&tx_desc->descriptors) can only be true when
periods is 0, so checking after the loop allocates tx_desc with
xilinx_dpdma_chan_alloc_tx_desc() only to immediately free it under the
error label.

Also, in the caller xilinx_dpdma_prep_dma_cyclic(), buf_len % period_len
is evaluated without checking whether period_len is zero:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_prep_dma_cyclic() {
	if (direction !=3D DMA_MEM_TO_DEV)
		return NULL;

	if (buf_len % period_len)
		return NULL;

	return xilinx_dpdma_chan_prep_cyclic(chan, buf_addr, buf_len,
					     period_len, flags);
}

If period_len is 0 (for example, when both buf_len and period_len are 0),
won't this still trigger a divide-by-zero crash before reaching
list_empty()?

Would it be cleaner to validate if (!buf_len || !period_len) upfront in
xilinx_dpdma_prep_dma_cyclic(), matching how
xilinx_dpdma_prep_interleaved_dma() checks if (!xt->numf || !xt->sgl[0].siz=
e)
before allocating a descriptor?

Additionally, the commit message states:

  The following list_first_entry() on the empty list returns a bad pointer
  and causes a kernel oops.

When the list is empty, list_first_entry() computes an offset from
&tx_desc->descriptors and reads sw_desc->dma_addr relative to tx_desc,
whereas the NULL pointer dereference happens on the next statement
(last->hw.next_desc =3D ...) because last is initialized to NULL and never
updated when periods is 0. Could the commit message be updated to reflect
this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103083132.1122=
990-1-lixicaicai@gmail.com?part=3D1
