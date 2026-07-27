Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D342A16D
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172646; cv=none; b=ZUPsAYTrt88cDn9geLRhv6M+bw+bRMbiU3oenZ+xt6a81nIKbK01VfypaYSVQmB38BZ3EvrAFIiqpljdPLVwyT3iS5o2ZZXHciQ/N3WZgmshW6T8l99v5uXMwlqvoR4PxFhSMS5uGTOOPLFW2D2ungMpgFWPfaaeXluwnlcBdYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172646; c=relaxed/simple;
	bh=YoJ0i/CcFZtOLS4Hjp0/d4Sl0u1femIhJ9YzMKsKPE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e5brs7Q215j+S6tsPquyQ6QU0XGc3EZQ0O7AUwYxH/dbrIGGdfs5ucyaJ8vPsxgCLh5fdsTTXHqxhQaufaEh7A06jsSDcSzvEW24u3XoNQsXuezqGnQbDlACEJf0Stf0u+w8R2oHY8k8IhYdxrqjKYBwuaHOxS+sR8RDFRSz9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0zOFmxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0zOFmxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8431F000E9;
	Mon, 27 Jul 2026 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785172643;
	bh=d+CPfHJ0NwVkdfTnnjx5raQSSmhW0LcB+eXqdu8RCo8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T0zOFmxF6pw0gtqoCUXnJleLfcur3WkP1RJB5NxzOEy7QTyHq9BANHOaT7/rgwODN
	 TowJYo4hvh43ndOOE2DG6nPqsHqZRv39xQkByqGAynXGjob8XxH52Y3QKtvd668bEh
	 +wUtRpx11fPvBuKY6X9tMaOwoqogPJE3x8y2y1fd2cHEkRonxvdHjBQE5dbm7Tl3XM
	 gu2NKXENpNFnZxuKrFZWjw5z0594e5oN09El/mDtnFR5MHbueNTNf75HcxLK9vEyyK
	 rf2JuMg9eJvopr6Hsfo90bpCrezss1tIzaD2/ktnqP7pTAk14nwrmYNxbWjYSstVSJ
	 gWA0QXrq275AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/24] dmaengine: dw-edma: Add
 dw_edma_core_ll_cur_idx() to get current LL entry index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260727170323.2321369-2-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:17:22 +0000
Message-Id: <20260727171722.CF8431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Torn read of 64-bit hardware register 'llp' leads to false -EINV=
AL when the DMA is running.
--

--- Patch [1]: [PATCH v3 01/24] dmaengine: dw-edma: Add dw_edma_core_ll_cur=
_idx() to get current LL entry index ---
commit 8302239cbe55e73285af81992cde8e677977d567
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry i=
ndex

Add dw_edma_core_ll_cur_idx() to get the current LL entry index. This
prepares the driver for dynamically adding DMA requests while the engine
is running.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -616,6 +616,24 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_ed=
ma_chan *chan)

[ ... ]

> +static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val =3D GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base =3D lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * An all-zero pointer means that the channel context is unavailable,
> +	 * so an LL region starting at DMA address zero is not supported.
> +	 */
> +	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))

[Severity: Medium]
Does this conditional read of llp.msb risk a torn read if the DMA engine
is actively running?

If the linked list ring crosses a 4 GiB boundary, a valid descriptor can re=
side
at a physical address with a zero LSB (e.g., 0x00000001_00000000).=20

Could the following sequence occur:

CPU reads llp.lsb as 0.
CPU is interrupted.
DMA engine advances the ring to an address below 4 GiB (e.g. 0x00000000_FFF=
FD000).
CPU resumes and reads llp.msb as 0.

Will this cause the function to falsely evaluate the pointer as all-zeros
and incorrectly return -EINVAL?

> +		return -EINVAL;
> +
> +	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
> +	return (val - base) / EDMA_LL_SZ;
> +}

[ ... ]

> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -384,6 +384,24 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_ed=
ma_chan *chan)

[ ... ]

> +static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val =3D GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base =3D lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * An all-zero pointer means that the channel context is unavailable,
> +	 * so an LL region starting at DMA address zero is not supported.
> +	 */
> +	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))

[Severity: Medium]
This shares the same logic as dw_edma_v0_core_ll_cur_idx(). Can this also
suffer from the identical torn read scenario described above, leading to a
false -EINVAL?

> +		return -EINVAL;
> +
> +	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
> +	return (val - base) / EDMA_LL_SZ;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D1
