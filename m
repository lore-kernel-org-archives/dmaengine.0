Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4C39A4CF
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068895; cv=none; b=LrdSk4clB5caAcOxQO2a3R9hDmu6Q5W4n/VFvaGn+cWxBWHGeZKThQjD+JyrB8W5FGwnzwwMtseY0bCmIekR6jq/H7HRVPZQkor2aSu0hvGUm+e6gSqv5MzuPOqT4M/Okaqm0JCznuY8ZchjHvUjVm01/decj7QYPklehHffT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068895; c=relaxed/simple;
	bh=PnGAfZqrjQoy2HRYK68cucXe01lJPC3VYPn+wyimTfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SB+F0cjcFA5lH+rvOFyriCE8CWeJGwgg64G9DSlIetMye07nr3EBjqdvQEtbkaDPHghkzL7UhT6gkP0JXRhly62w6JiE8F/f4imiCGp/PD+bwh06QHH8H5ZDQFCIjXb0RXUkMvzgrL80ycWMEqzwwoqEmv4belYbfnh98Ef+T0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpUjRGt7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpUjRGt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B881F000FF;
	Thu, 10 Sep 2026 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789068889;
	bh=1phwQB97tZMH0e44K8D4RzoShXFSH7DPQYJmeOseTJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SpUjRGt70u4qJNPIODd5LAeP5nPzf8sdKnc0M+JZKO7mDqvzkkVW6D5ibc+AVmq5Z
	 1a86AeSY/lQ3KILZakuGuAzeKJZ8091lwDbuIlxFju0XasO2bEYl50IWCYqnRP1P5i
	 G7RTuLSCOAOCmYECzjSy+dzLkzabVMRClRHHc8eQOYcL6zceNywJu8E9m5Tja2EP30
	 tg3gERUkmUzICUkH62YWA2CXz6yafluymznl45heR06S2icQhMom1Sj8OXI4DXv5ML
	 viq3rtuyCIbDAHNAA3iOiXSZWWeeHyr3AC8b3iMjhZ405TcgtEAR6BJY7eGusk9+QR
	 2vb8iS4EAo2Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: bestcomm: gen_bd: fix out-of-bounds access
 in PSC parameter lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910192404.21809-1-rosenp@gmail.com>
References: <20260910192404.21809-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 19:34:49 +0000
Message-Id: <20260910193449.A3B881F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing memory and resource leak of BestComm tasks on error p=
aths during DMA creation.
- [High] Pre-existing memory leak of BestComm task microcode (desc) in SRAM=
 on task release.
--

commit 151ed4c77a710a40a6d4463f6c561df7caf80bcc
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter look=
up

This commit fixes out-of-bounds accesses in bcom_psc_gen_bd_rx_init() and
bcom_psc_gen_bd_tx_init() by using ARRAY_SIZE() for bounds checking. It also
removes an unused forward declaration.

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
>  		return NULL;
> =20
>  	return bcom_gen_bd_rx_init(queue_len, fifo,
> @@ -336,7 +336,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
>  struct bcom_task *
>  bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fif=
o)
>  {
> -	struct psc;
> +	if (psc_num >=3D ARRAY_SIZE(bcom_psc_params))
> +		return NULL;
> +
>  	return bcom_gen_bd_tx_init(queue_len, fifo,
>  				   bcom_psc_params[psc_num].tx_initiator,
>  				   bcom_psc_params[psc_num].tx_ipr);

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a
pre-existing memory and resource leak of BestComm tasks on error paths
during DMA creation.

If mpc5200_audio_dma_create() fails during devm_request_irq() or
devm_snd_soc_register_component(), it returns an error without freeing the
successfully allocated bcom_task structures:

sound/soc/fsl/mpc5200_dma.c:mpc5200_audio_dma_create() {
	if (!psc_dma->capture.bcom_task ||
	    !psc_dma->playback.bcom_task) {
		dev_err(&op->dev, "Could not allocate bestcomm tasks\n");
		return -ENODEV;
	}

	/* ... */
=09
	if (rc)
		return -ENODEV;

	/* ... */

	return devm_snd_soc_register_component(&op->dev,
					&mpc5200_audio_dma_component, NULL, 0);
}

Additionally, if snd_soc_set_ac97_ops() fails after mpc5200_audio_dma_creat=
e()
succeeds, it returns without calling mpc5200_audio_dma_destroy(), leaking t=
he
tasks:

sound/soc/fsl/mpc5200_psc_ac97.c:psc_ac97_of_probe() {
	/* ... */
	rc =3D snd_soc_set_ac97_ops(&psc_ac97_ops);
	if (rc !=3D 0) {
		dev_err(&op->dev, "Failed to set AC'97 ops: %d\n", rc);
		return rc;
	}
	/* ... */
}

Repeated deferred probes or driver bind/unbind cycles could exhaust the 16
BestComm task slots, preventing further DMA operations. Are we missing clea=
nup
steps on these error paths to ensure the allocated tasks are freed?

[Severity: High]
This is a pre-existing issue, but there seems to be a memory leak of BestCo=
mm
task microcode in SRAM on task release.

When bcom_load_image() allocates a chunk of SRAM for task microcode, it sto=
res
its physical address in tdt->start:

drivers/dma/bestcomm/bestcomm.c:bcom_load_image() {
	/* ... */
		desc =3D bcom_sram_alloc(hdr->desc_size * sizeof(u32), 4, &start_pa);
	/* ... */
}

When the task is freed, the physical address is zeroed out without explicit=
ly
freeing the underlying SRAM chunk:

drivers/dma/bestcomm/bestcomm.c:bcom_task_free() {
	/* ... */
	/* Clear TDT */
	bcom_eng->tdt[tsk->tasknum].start =3D 0;
	bcom_eng->tdt[tsk->tasknum].stop  =3D 0;
	/* ... */
}

Since the SRAM chunk is not freed using bcom_sram_free(), repeated unbinding
and binding of BestComm drivers could eventually exhaust all available on-c=
hip
SRAM. Does bcom_task_free() need to free the SRAM before clearing tdt->star=
t?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910192404.2180=
9-1-rosenp@gmail.com?part=3D1
