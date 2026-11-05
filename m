Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885167;
	b=wqjJXfpWgfk58lz5n7+FdQE1YlFuzhENAATwmJM6wWkz1puE+WxINumA+/N9zSC0/h8k
	 k7X7pU4iiTN+dInZRUIb9c45Ih9996Xx7WzuJK4WZ3JLvG+Pf+SVEFeb5igqaZvwVhZFs
	 +5//ZgwM9lyeWhRWE6Qd5o/43jYyhnI4HhQ5wU8UvpJv+0FovpwR1uedv6ZOxKTpLmy4x
	 3m7EvymDXoQva7/aytitwHG1sa7SV93CbzL52jcgsWcaXTW57Lgdcfaf8sW0/QFjJullF
	 68BO/4CxBCCPO9RQ46O0BUrz9kMp0wfZe6uddz4qIJi6feRxnKOsW+43mXeUwmeneyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885167;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x26vePr9gSTZIqDXOfIfCUvoU4SE+IXLZ3SDFdos47c=;
	b=YYvC5xFizOuQCQRC/rI63L8MMtXCdQEv1mVXLHd472KJIU6Wx5zUEnt2B9JlWK6BdofT
	 9pFramNzHk2HO4/Ms1IPuaEIEXh6Q018HW1Osast3eXRVbzr9RMBxG6cvh7KeGw483ZNc
	 Tv0pEdauDUmvCQrFvWO1Cf/8vw5tQ58MdQN6Z+IucWXWP3CESaaeSXxEthSp2LQIUngcG
	 lEZf6nlFSGjkZPT/jm+5LythgfDy3J80YU24bYGBR19G9ouuVKMXpl5BHPv4egBNoFFNO
	 5YPKonzG04rsrbYBn1hBE3LeHJL/XbMM5DkBtym4eK/SyMok2WpU7D7VUXoJTWfus5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuTldtX+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C0606A31B
	for <dmaengine@vger.kernel.org>; Thu,  5 Nov 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuTldtX+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3ED1F000C1;
	Thu,  5 Nov 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885166;
	bh=x26vePr9gSTZIqDXOfIfCUvoU4SE+IXLZ3SDFdos47c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AuTldtX+1DHr7/GycRyNzgpBBQkqcWHakMDzKc2xsS0+3cMNXJ7AFrWlC96ylfQXy
	 3UQgHrgFOvkdzJFQtWihbE8+UZk88gE1gDHyNaAVSP+BlTTKvLs9fnGnB+nh41wAkQ
	 DSVL+/5itvSi98DajoY86ykP1p1WsD4YZjhCi34XgmxjyxlJB5qLWMh9GoV/+K+Zvb
	 BWkG6KCa0u8D10OeKyiNZHnUuXoSR0J3+se73cunLzf4+hHOs/Bmc46LV0cBajqCYi
	 w2TM9dS1k9SedUb2Dw10U2rWGdikHF5jfafhvsIXBzy60gULFog0N2tKa/MDRyHel3
	 KfWqekf/3nc1A==
Message-ID: <sashiko-outbox-199139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: fix incorrect segment size
 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Matsievskiy" <matsievskiysv@gmail.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261105131547.305510-1-matsievskiysv@gmail.com>
References: <20261105131547.305510-1-matsievskiysv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 13:26:06 +0000
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
- [High] dmaengine: axi-dmac: 32-bit overflow in axi_dmac_prep_slave_sg()
--

commit 6fad587f5aff185e8ba37fde1bcd2a484b6fa19d
Author: Sergey Matsievskiy <matsievskiysv@gmail.com>

dmaengine: axi-dmac: fix incorrect segment size calculation

This commit switches segment count calculations in axi-dmac from DIV_ROUND_=
UP
to DIV_ROUND_UP_ULL to avoid 32-bit unsigned integer overflow when
chan->max_length is 0xffffffff.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index d47ff27e1408f..bfa83ccfd7dc0 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -706,7 +706,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(st=
ruct axi_dmac_chan *chan,
>  	unsigned int len;
> =20
>  	/* Split into multiple equally sized segments if necessary */
> -	num_segments =3D DIV_ROUND_UP(period_len, chan->max_length);
> +	num_segments =3D DIV_ROUND_UP_ULL(period_len, chan->max_length);

[Severity: High]
Can axi_dmac_prep_slave_sg() under-allocate desc->sg[] and write out of
bounds on 32-bit architectures when chan->max_length is 0xffffffff?

While axi_dmac_fill_linear_sg(), axi_dmac_prep_peripheral_dma_vec(), and
axi_dmac_prep_dma_cyclic() now use DIV_ROUND_UP_ULL(), axi_dmac_prep_slave_=
sg()
still calculates num_sgs via sg_nents_for_dma() before calling
axi_dmac_alloc_desc() and axi_dmac_fill_linear_sg():

drivers/dma/dma-axi-dmac.c:axi_dmac_prep_slave_sg() {
	...
	num_sgs =3D sg_nents_for_dma(sgl, sg_len, chan->max_length);
	desc =3D axi_dmac_alloc_desc(chan, num_sgs);
	if (!desc)
		return NULL;

	dsg =3D desc->sg;

	for_each_sg(sgl, sg, sg_len, i) {
		...
		dsg =3D axi_dmac_fill_linear_sg(chan, direction, sg_dma_address(sg), 1,
			sg_dma_len(sg), dsg);
	}
	...
}

In lib/scatterlist.c, sg_nents_for_dma() uses DIV_ROUND_UP() with unsigned
int sg_dma_len(sg) and size_t len:

lib/scatterlist.c:sg_nents_for_dma() {
	...
	for_each_sg(sgl, sg, sglen, i)
		nents +=3D DIV_ROUND_UP(sg_dma_len(sg), len);
	return nents;
}

On 32-bit architectures where size_t is 32 bits wide, passing len =3D 0xfff=
fffff
causes DIV_ROUND_UP(sg_dma_len(sg), len) to overflow 32-bit arithmetic and
evaluate to 0 for any scatterlist entry with length >=3D 2.

When that happens, axi_dmac_alloc_desc(chan, num_sgs) either dereferences
desc->sg[num_sgs - 1].hw out of bounds when num_sgs is 0:

drivers/dma/dma-axi-dmac.c:axi_dmac_alloc_desc() {
	...
	/* The last hardware descriptor will trigger an interrupt */
	desc->sg[num_sgs - 1].hw->flags =3D AXI_DMAC_HW_FLAG_LAST | AXI_DMAC_HW_FL=
AG_IRQ;
	...
}

or allocates fewer sg entries than needed while the updated
axi_dmac_fill_linear_sg() computes num_segments =3D 1 via DIV_ROUND_UP_ULL()
and advances dsg past the end of desc->sg[].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105131547.3055=
10-1-matsievskiysv@gmail.com?part=3D1
