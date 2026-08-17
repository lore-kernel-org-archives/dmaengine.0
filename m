Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF57D23741
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 00:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786928070; cv=none; b=GOVHIcDOtJnUB9oaxQIZlg4hBqjqz1EXJhwTM1rCNzxM8cnM3hwJNXivpqyiMlzRH4GXQaZEU9Iw4W4gABzqQERn5vFlm27n9G/EiTOzmS033D2xrr/ZE5x7mdLa/C9kux7ehg3qD3xFRAj3s+gyBRWAHRbl3nQjiSZW8vAZmmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786928070; c=relaxed/simple;
	bh=+l++hAthhjtGuCnuhHdozFOKSnIDZm3z5L2dGIZd9Kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oXH+7J6XjAUxsKUo8XV0JUxy9hGCdDPKQLIFh/meuQvSSghdCaDHU/3Ue4Vnu2bYbR8yfI7177p/tBSuy24l1f60yOoS/7nY3MhP9UTM646YCegdoWOc9J+qL9cLvx6j4/Eqb83sqCOPPXgEOooGnNiEzX/eTrLOq/0+76Nw7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f672B1uI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f672B1uI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2BC1F000E9;
	Mon, 17 Aug 2026 00:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786928068;
	bh=7K7phNtwzVmcvgOqcI2G2S2A/4yUn2Nl4VtV9NZMySQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f672B1uIEEA8sip5+cZsA0x2cWaW+lZqiRVccFLp6NDyurnqiraSCVBnJ79EJ4Wwp
	 eYsq1wmebRP483q9nSecSQCFH/p6Cs9qi1e9xUJF9SZ6ZecVE9TTFfBrz0PW/OvhE2
	 15fuUqO3gm1QOULG5ypfkGHCLTlm54jgxZ6hbacus5GNFv+4sP1rhnNAtk+Wg1OhVJ
	 ZlImqPvUXap1ejpRD990Qoih3WBtgrtCGxtAZoRa4xMBHUGon+uJLP1XWVSZ+yKbzT
	 WW+fcjgX9zUUClEu+abCeTLWrEi2Tk0vWiuCT0CxfLkjOUS1J0e9FKBBr/34O9I6SQ
	 f3DEIioLdkxnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap and get irq early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260817004500.59251-1-rosenp@gmail.com>
References: <20260817004500.59251-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 00:54:27 +0000
Message-Id: <20260817005428.3E2BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] bcom_task_alloc() returns an integer error code implicitly cast to=
 a pointer, which bypasses caller NULL checks and causes a kernel panic.
- [High] bcom_task_alloc() permanently leaks a reserved task index if platf=
orm_get_irq() fails.

Pre-existing issues:
- [High] Probe error path frees the global `bcom_eng` pointer without setti=
ng it to NULL, leaving a dangling pointer.
--

--- Patch [1]: [PATCH] dmaengine: bestcomm: ioremap and get irq early ---
commit f02c723e90824bdf0feee229bfc42b04e0be6dc0
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: ioremap and get irq early

This patch refactors the MPC52xx BestComm driver to use managed resources f=
or
memory mapping and to acquire the IRQ earlier. By doing so, it allows handl=
ing
potential probe deferrals before allocating resources, simplifying the clea=
nup
paths.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> index 432b43520ddc9..55ad7bc34df78 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
[ ... ]
> @@ -68,6 +69,10 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_si=
ze)
>  	if (tasknum < 0)
>  		return NULL;
> =20
> +	irq =3D platform_get_irq(bcom_eng->pdev, tasknum);
> +	if (irq < 0)
> +		return irq;

[Severity: High]
Does returning the integer irq here implicitly cast the negative error code
into a pointer? If platform_get_irq() returns -EPROBE_DEFER, callers such
as bcom_fec_rx_init() that check the return value with if (!tsk) will
assume success and dereference the invalid pointer.

[Severity: High]
Does this early return also permanently leak the reserved task index?
The task index was reserved earlier in bcom_task_alloc() by setting
bcom_eng->tdt[i].stop =3D 0xfffffffful;.

By returning directly instead of using the error: label, the cleanup code
that clears the reservation (bcom_eng->tdt[tasknum].stop =3D 0;) is bypasse=
d.
Since the total pool size is strictly limited to 16 tasks, repeated probe
deferrals will rapidly exhaust the pool.

> +
>  	/* Allocate our structure */
>  	tsk =3D kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
[ ... ]
> @@ -439,15 +416,9 @@ static int mpc52xx_bcom_probe(struct platform_device=
 *op)
>  	return 0;
> =20
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);

[Severity: High]
This is a pre-existing issue, but does freeing the globally accessible
bcom_eng pointer here without setting it to NULL leave a dangling pointer?

Functions like bcom_task_alloc() use if (!bcom_eng) as a safety readiness
check. If the probe fails and hits this error path, subsequent or concurrent
API calls will bypass the check and dereference the freed memory.

>  	bcom_sram_cleanup();
> -error_ofput:
> -	of_node_put(op->dev.of_node);
> =20
>  	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817004500.5925=
1-1-rosenp@gmail.com?part=3D1
