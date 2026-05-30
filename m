Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3F4288D0
	for <dmaengine@vger.kernel.org>; Sat, 30 May 2026 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110781; cv=none; b=CZOAGly8rO+hniQgjhPo3hHYhBRe3Wvyi8R3vmph2rpjcOqTI6nY/DFR/mWLKyTuQulV9fbJlPpP/RO+j6AHPEbUfV5F0nHz/vFe9B63vFUJS4CIUi4Pzb0g7Y9EasRSy0oASZZRpMTGP7YB9nCVof8ZuM8vKyNpHWh2OQaFeoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110781; c=relaxed/simple;
	bh=0uCvjvjua2Ie2LNjHaJ+8JsOR8BD3Dcdqd0aat3vDFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hyVSoJTzeOb8qEpXsXzZRhVqyPe6SjOjgO82nN1BCM36DboR7uNdCMJh5wLLRNlUjz+h+Wb2e3PvxHT0fj0K4NiXx/0l5tFzsj+jteH8owVh5072zb7jdQE57zYcuvKZ5th2ww0dIOBRZdfucxIdVuQgMKUQRx/Lh52H0wPsxh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/aUzJbZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/aUzJbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A630B1F00893;
	Sat, 30 May 2026 03:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110779;
	bh=lxBkCW30pMpwgr0mLxC0lXM7iluJbu+nrXT11/683DQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/aUzJbZ9o2ERblJyNkNE5dP/GfdCYSTa4HNp9+rv7bc8c3W3kcAgR8nk3hEt75gh
	 cJITFHQ6RdpClOf5iMgc7G053H1pN4ODNIkhLPvl9dinLmuf8TYtu8gVLkJJILTWHL
	 wxWiIbLPG7GO9YRrX5EeGwTLq4CA6SuVwpoHb5hxQXSUaI4AkaPocB3YUGx/mRjXTw
	 /n7Js/eENHc0HDHDMQNHsROSr6nL+0YRCZC6R/7zPicS4gXrr5+SOXz6+C5cNQ0Ts9
	 dGgSSPqb4GxoGJSu9XHCM1/ZH3J3nZCpKSXDVYfo52gaNyqXwfraWOvogHqleea2dI
	 eHXPhhhFyCwBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] bestcomm/gen_bd: fix out-of-bounds access in PSC
 parameter lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260530030152.49759-1-rosenp@gmail.com>
References: <20260530030152.49759-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 03:12:59 +0000
Message-Id: <20260530031259.A630B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unchecked array access in `mpc512x_psc_alloc_clock` and relate=
d clock functions where `psc_num` derived from device tree is used to index=
 arrays, causing out-of-bounds reads and writes.
--

commit 7a3c433b5cd814a1fd0d2b57113cd41cb03279a5
Author: Rosen Penev <rosenp@gmail.com>

bestcomm/gen_bd: fix out-of-bounds access in PSC parameter lookup

This commit fixes an out-of-bounds access issue in bcom_psc_gen_bd_rx_init()
and bcom_psc_gen_bd_tx_init() by properly using ARRAY_SIZE() for bounds
checking on psc_num. It also removes an unused forward declaration in
bcom_psc_gen_bd_tx_init().

> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 8a24a5cbc2633..75d1a6f543df9 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -315,7 +315,7 @@ static struct bcom_psc_params {
>  struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_l=
en,
>  					   phys_addr_t fifo, int maxbufsize)
>  {
> -	if (psc_num >=3D MPC52xx_PSC_MAXNUM)
> +	if (psc_num >=3D ARRAY_SIZE(bcom_psc_params))

[Severity: Critical]
This is a pre-existing issue, but while looking at this fix for the psc_num
bounds checking, I noticed a similar unchecked array access regression vect=
or
using psc_num in drivers/tty/serial/mpc52xx_uart.c.

In mpc512x_psc_alloc_clock(), psc_num is calculated directly from
port->mapbase:

drivers/tty/serial/mpc52xx_uart.c:mpc512x_psc_alloc_clock() {
	...
	psc_num =3D (port->mapbase & 0xf00) >> 8;
	...
	psc_mclk_clk[psc_num] =3D clk;
	...
}

Because port->mapbase comes from the device tree via
of_address_to_resource(), a malformed device tree could supply an address
like 0x11F00, allowing psc_num to evaluate up to 15.

Since psc_mclk_clk and psc_ipg_clk are arrays sized to MPC52xx_PSC_MAXNUM
(which is 12 when CONFIG_PPC_MPC512x is defined), wouldn't this allow an
out-of-bounds write of a pointer to the BSS section?

The exact same unchecked psc_num calculation also appears in
mpc512x_psc_relse_clock() and mpc512x_psc_endis_clock(), leading to similar
out-of-bounds reads and writes.

>  		return NULL;
> =20
>  	return bcom_gen_bd_rx_init(queue_len, fifo,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530030152.4975=
9-1-rosenp@gmail.com?part=3D1
