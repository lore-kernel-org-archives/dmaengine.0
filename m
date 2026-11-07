Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794014009;
	b=NQN3Lt77HIVoOrx8GSS2kdQp8Iie6UEij/ZwZ+KPiTHaD1Q/O+U2pjhvnSgN+4xXSPOW
	 K2zkqANxiwVL6Hsps07OPJM4yrd7Y4zbQcQLhgQZt6/1QiNp5ERK58J7DNMNJNotoNr88
	 XYqV2j2NDsVVajpm6E3QnBVAaKPG/D7vm6ppdOcO0lLKgROx5pANMtKR89BlOGav79Ut4
	 TgRs2aSIwZBkw/5SvNCm5cheZU9eYsIHD3Gt7VD1BUK1Q9iBtsKqDLwqz/5PQ/+W1t7xS
	 HsP6nAUtK23lvstrkhaf6mOM0QdRWFKFTJUyOI1zag08zoGF/lN3fBqrUPwBiT+6zvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794014009;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tL+83dUCGRJBYYSWbU9D4fg0mIecz0YgqBh2+9wixO0=;
	b=ylhxpt4W4IIBDlGzE5J73tDm5cExcUHO7RKEgSxQ2eGYrtOg1ErKHrFeONeNEKMKdyPX
	 7YyaDSv2FYr9xdlFvgiI1Z5bKZeHSEuX5KtTF8cA4l5WxoG7e/RLO6W18QFPhqnlfiK3O
	 onjLofN3u+pJ6kKO3pTNdgSyHh49cT9Ba3VU3XcGaxDkuzLR2BPvm+rCYPEBTahomIFZs
	 p6JhxeV+Jl8C9W4kaWM+TrqSieCXrjbO2va4wxAN9tyFxKICYMytdebyvxE5+TBXBI83E
	 3PcstOP/2IxiYr6emJoS6BQ8x32HKTfeEMefwW9fTxeineDdus7I9+UpiGU76Vkg3Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKjKZNTM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5396606A326
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 01:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKjKZNTM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7451F008A1;
	Sat,  7 Nov 2026 01:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794014008;
	bh=tL+83dUCGRJBYYSWbU9D4fg0mIecz0YgqBh2+9wixO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKjKZNTMLPKacgJreiMdKFJUy3a48ZyxkMYxhgj06rOf/CuT4M7i8ND/jqAuB4TuZ
	 0zURxfBtGQQSxEwgkffUbRtqtfx4Ejdolrb3ajvXOKWFg9wcNRtHh8hzthV51cWfLz
	 ceIVFVQcgbfI/Xm8d9fBqyHg3mhoCejJ3q3PHfOKz4eVbDHpq3IF6iIXZtin8Bfe88
	 t5Ikwlc8krfAJx5NWfgosV9jnvpo6a+ZiF8aTLKbeEB3lNivM/TLo7bjJIKIbesu+Z
	 NhxB8L3Fi91DR2p81FGumJsm2lJA6nc74U8qmhgLRazXAL2KOb9Z+hi0lDd6XnlkxW
	 OTkphBN2N/tUw==
Message-ID: <sashiko-outbox-202452@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: convert to
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
References: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 01:13:27 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] dmaengine: qcom: gpi: UAF on module unload without .remove
  teardown
--

commit 022d58249a5185506a5361f23cc1e72841878880
Author: Brian Masney <bmasney@redhat.com>

dmaengine: qcom: gpi: convert to subsys_platform_driver()

This commit replaces the manual gpi_init() and subsys_initcall() registrati=
on
with subsys_platform_driver(gpi_driver), which also adds a module_exit()
handler that calls platform_driver_unregister().

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c41bfac65ddf3..d6c76ce1846e2 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2325,11 +2325,7 @@ static struct platform_driver gpi_driver =3D {
>  	},
>  };
> =20
> -static int __init gpi_init(void)
> -{
> -	return platform_driver_register(&gpi_driver);
> -}
> -subsys_initcall(gpi_init)
> +subsys_platform_driver(gpi_driver);

[Severity: High]
Can unloading the module now cause a use-after-free on gpi_dev and unmapped
module text?

Previously the module had a module_init() without a module_exit(), so
delete_module() refused to unload it with -EBUSY.  subsys_platform_driver()
adds a module_exit() callback that runs platform_driver_unregister(&gpi_dri=
ver).

gpi_probe() allocates gpi_dev with devm_kzalloc() and registers it through =
the
unmanaged dma_async_device_register() and of_dma_controller_register() APIs,
while gpi_driver defines no .remove callback.  When the module is unloaded,
devres frees gpi_dev and the module text is unmapped, leaving &gpi_dev->dma=
_device
and gpi_of_dma_xlate registered in the global DMA engine and OF DMA control=
ler
lists; any subsequent DMA channel lookup or sysfs access then dereferences =
freed
memory and unmapped code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dma-gpi-su=
bsys-v1-1-b37dcb4ba3c4@redhat.com?part=3D1
