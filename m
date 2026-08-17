Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEAA2405EB
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932528; cv=none; b=Rk5FkloGpx80asCzpiH6BMrEn99mv0PHmA8q9zHCHIGkK6IG+CtbWhaDFl//9iBSH43OfD8j940cPnLkL3STTMFV1nWD6j1WPm/thnlWPX3pUnpljGFw4+KeHWyOKZrweFfkeGctJBG/VFSiKXrLUHWADaGY/xmO4zYxCVhfVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932528; c=relaxed/simple;
	bh=SPkBg9U7Xk5JZPN7PRTbCnUCVm4/aF8yhVJoan8M4u0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K7d5feO7B0WeW9H5jH+eVFrDs6Uvm6gXlYGqm9uEBzhUgAP41T0Evax+fk2fn3Sg9GZ7jlieuDWfQcA5VtQiA/+VYR4Z5oYauS6+C/9+jLNDmjHpoVnwZsrdF52aoj343AyWYHo48ygfzS6TGyxHsbAdTodSHf5VwtJqEwxg9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhJP+W2I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhJP+W2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED201F000E9;
	Mon, 17 Aug 2026 02:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786932526;
	bh=XWpG7SHssUhIJmyFVDWGckUPtXS/+5eL7OENkrwfx50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YhJP+W2IWeZOoJU1KcsMxYLn17zW8jTUF9O0Ywctud1v8ABF8B8XZjogydttWsfk0
	 utXMuYnDOAWxGSK3kIWKN9jTNqvJvMRohQKBAZ4gn4fq2jNnd0Sqa8mCP0v8GRMxA1
	 Dh3GjiVnDOorpJMpmTsDinmqjw4mHYwWiQzv4tXRSGoXUDZbGHMkiyz/lbH9n3MdLW
	 yDwLjn5/4tYlTIDAbi2KNrsI9sYAgouoU2niwQixS7K+jRQyJd8hWXne7xUoUsZNeq
	 gt7vae9xwbomK/MhZti5/vk7f4hwcZlaoPzL6eXm1aQhUcVnH/9mLgshGJE5SQayDY
	 Ddi0mvsV4TiHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: bestcomm: gen_bd: split struct
 bcom_psc_params from array definition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260817015903.137062-1-rosenp@gmail.com>
References: <20260817015903.137062-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 02:08:45 +0000
Message-Id: <20260817020846.6ED201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function `bcom_psc_gen_bd_tx_init` lacks bounds checking for `=
psc_num` before using it as an index into the `bcom_psc_params` array.
- [High] The bounds check in `bcom_psc_gen_bd_rx_init` uses a macro (`MPC52=
xx_PSC_MAXNUM`) that can exceed the actual size of the `bcom_psc_params` ar=
ray.
--

--- Patch [1]: [PATCH] dmaengine: bestcomm: gen_bd: split struct bcom_psc_p=
arams from array definition ---
commit 2de5fbd01540d512aabb05b4b1f3cc916af97378
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: gen_bd: split struct bcom_psc_params from array defini=
tion

This commit separates the bcom_psc_params struct definition from its array
initialization to fix kernel-doc parsing issues. It also adds documentation
for missing members and marks the array as const so it can be moved to
read-only memory.

> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 8a24a5cbc2633..61b5746e1a972 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c

[ ... ]

> -static struct bcom_psc_params {
> +struct bcom_psc_params {
>  	int rx_initiator;
>  	int rx_ipr;
>  	int tx_initiator;
>  	int tx_ipr;
> -} bcom_psc_params[] =3D {
> +};
> +
> +static const struct bcom_psc_params bcom_psc_params[] =3D {

[Severity: High]
This is a pre-existing issue, but does the bounds check in
bcom_psc_gen_bd_rx_init() adequately protect this 6-element array?

drivers/dma/bestcomm/gen_bd.c:bcom_psc_gen_bd_rx_init() {
    if (psc_num >=3D MPC52xx_PSC_MAXNUM)
        return NULL;

    return bcom_gen_bd_rx_init(queue_len, fifo,
                               bcom_psc_params[psc_num].rx_initiator,
                               bcom_psc_params[psc_num].rx_ipr,
                               maxbufsize);
}

If a multi-platform kernel has CONFIG_PPC_MPC512x enabled,
MPC52xx_PSC_MAXNUM evaluates to 12.

Since this array explicitly only contains 6 elements (indices 0 to 5), a
cell-index between 6 and 11 from a malformed device tree parsed in
mpc5200_audio_dma_create() would bypass the check and read out-of-bounds.

This could cause bcom_gen_bd_rx_init() to write out-of-bounds to the IPR
register array.

[Severity: High]
This is also a pre-existing issue, but is there a missing bounds check when
using psc_num to index this array in bcom_psc_gen_bd_tx_init()?

drivers/dma/bestcomm/gen_bd.c:bcom_psc_gen_bd_tx_init() {
    ...
    return bcom_gen_bd_tx_init(queue_len, fifo,
                               bcom_psc_params[psc_num].tx_initiator,
                               bcom_psc_params[psc_num].tx_ipr);
}

An unvalidated psc_num from a device tree cell-index parsed in
mpc5200_audio_dma_create() could cause an out-of-bounds read here.

The resulting garbage data passed to bcom_gen_bd_tx_init() could then lead
to an out-of-bounds write to the IPR register array, potentially causing
memory corruption.

>  	[0] =3D {
>  		.rx_initiator =3D BCOM_INITIATOR_PSC1_RX,
>  		.rx_ipr =3D BCOM_IPR_PSC1_RX,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817015903.1370=
62-1-rosenp@gmail.com?part=3D1
