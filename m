Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE414908AE
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934615; cv=none; b=SvNyi5l/09IodOA7ctZX4S5G97OR2O05Shb1M4oaO7r1Vm4i5cWcUk5OCDboJbGx0dLP8sYVVWBEMAPApF0mx+qHnpDwLTxN4mqc7rx/A09GGXUQnkv9Qu/om9PXz5FrTTA0s7r5GXxf+JDFI6ARVWphBju4CUHBdpuqRuYbJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934615; c=relaxed/simple;
	bh=SWXBIYvoklg2F13oljV7p5qX4pQhYOj2EMiHhfXKgwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RAk4s4/dI10u8OMjL57rWTH06EvK5hFMcmRWlad3Pq7KRLLAArH7uNwup9myYWH+p+9I6OaknZJAH6ldX3YxnLywjV3u5pqMT2xeu+0KySbLQqNEiFmfYuLnCAEsK7huzkbXv7L1lFA4XfXLFuc/K9SC8S5dfCteOUQ1QYU78Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNgmiKZr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNgmiKZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44771F000E9;
	Fri, 24 Jul 2026 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784934614;
	bh=uwk0Tv6VKWOv0wVKF1eKN5bodSicCTF2RbHdwpll9S0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WNgmiKZro0QTUykevsvvDtOdVyJElOf8TCJgsRSufJ8c6nWsPSxpEJE8j9r4soyiq
	 VfcMxiuFQZl3hIkMLhutewXf3Zk48U0qriMzzukXSE4vb9uHXqp7pzIVCb5XYFKuSy
	 3+juPo6bfzok2GymT2hKFIAfCvbqIBAeWw72WLWY5Sp+p+FwgSgcm5WpzuIksh81Xq
	 2UeeuU7ysmCoBQKAq7A3W+Pp0fCMA02A4w6ceTAV8hd7t7cCL/TmayzkA/cgkQGOz7
	 j+Yi++63pgQAWKZOWmRzNiYl38iQD0xt1YAvgja1mWnMlpTWvoRm4Il1FSxYsh8d4N
	 TR0851ZzkaBBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast
 warning in memset helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260724225958.43925-1-rosenp@gmail.com>
References: <20260724225958.43925-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 23:10:13 +0000
Message-Id: <20260724231013.D44771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but atc_prep_dma_mem=
set_sg() fails to broadcast the byte value into a 32-bit pattern, leading t=
o incorrect memory fills.
- [High] This problem wasn't introduced by this patch, but there is a guara=
nteed kernel oops on error paths of DMA prep functions due to dereferencing=
 an uninitialized vd->tx.chan pointer in atdma_desc_free().
--

--- Patch [1]: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast war=
ning in memset helpers ---
commit e39a1989ac7867eaa551256bdc408f22e82b835b
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers

This patch changes the type of vaddr in memset helpers to avoid sparse
warnings about casting away the __iomem address space. It also updates the
memset_vaddr field in struct at_desc to match the actual usage.

Link: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel=
.com/

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..7c071e6496371 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c

[ ... ]

> @@ -1189,7 +1189,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
>  			__func__);
>  		return NULL;
>  	}
> -	*(u32*)vaddr =3D value;
> +	*vaddr =3D value;

[Severity: High]
This problem wasn't introduced by this patch, but does this correctly format
the fill pattern?

If atc_prep_dma_memset_sg() is called with a non-zero byte value (e.g., 0xA=
A),
the hardware memset pool buffer is initialized with the unexpanded 32-bit w=
ord
(0x000000AA). Because the controller repeatedly copies this 32-bit word to =
the
destination buffer in 4-byte chunks, the resulting memory is filled with an
incorrect pattern.

In atc_prep_dma_memset(), the value is correctly expanded into a 32-bit
pattern before assignment. Should atc_prep_dma_memset_sg() do the same?

> =20
>  	desc =3D kzalloc_flex(*desc, sg, sg_len, GFP_ATOMIC);
>  	if (!desc)

[Severity: High]
This isn't a bug introduced by this patch, but will the error paths after t=
his
allocation cause a NULL pointer dereference?

If a failure occurs later in this function, such as when checking buffer
alignment, the code jumps to err_free_desc and calls atdma_desc_free().

Since desc was allocated via kzalloc_flex() and vchan_tx_prep() has not yet
initialized the virtual channel structure, vd->tx.chan is NULL.

atdma_desc_free() immediately dereferences it:

atdma_desc_free()
    struct at_dma *atdma =3D to_at_dma(vd->tx.chan->device);

Could this crash the kernel under memory pressure or when invalid scatterli=
sts
are passed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724225958.4392=
5-1-rosenp@gmail.com?part=3D1
