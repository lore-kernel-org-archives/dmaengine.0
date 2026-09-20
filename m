Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA79361958;
	Sun, 20 Sep 2026 23:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945402; cv=none; b=lwtoEsi51eIkn9GgGURPGCPtuOxBHg27XcveT3LpmvjNf0So4oVFi0era9UKhhMUwxQDtmH09sCDAVqMTpbhrurwdQygd6IO65EudklQ9m6wRc8ki7wlQAuxNrWhs7tUlxMwS9vE0uGIurbAyfM1csxwEVOXd2jc7nyaAKDbwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945402; c=relaxed/simple;
	bh=ERPYHOw3td1rpCOp8WfH124Y4HR2P3gqiohuTCDKiqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q49ruBGPzGjpzT/FfIb0Vim+fB6Hcv9f/AjsHjyQ2HCCjmG2zlsKTxDzpbhmUHoQSOy97A5p7q9jiGxUj0GlBBvq0Am6+mlV6XKg7iOvWleXa6SUShEVhPJuL3iWh2WLlpRdfYBKkFaJCWYAqg7EWl/FDQBdlzuxmzKGpzgutuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alml1slu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alml1slu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B731F000FF;
	Sun, 20 Sep 2026 23:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789945398;
	bh=26oe2jAPoqXYwEcHfcDDT78TNErQ6LyHQyIVEG51aVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=alml1sludyQ5vrL93jPdo3vsD10VJPvpR9X6V2cUW23xGHKIXYEPCjkSrVmz1gsJP
	 IGYP/y2AQ1MdL2z6JcWvbeJ2frlwpc52MSRPEm5JQfOT4Tz4PHnUdp2RAZ83TWRdf5
	 088AT20+aPG5ybGnFlurGnylXzmjeNgLK5iXCidZIOiuy6JyTGv4mcYaTGj/C97L4Z
	 egd8sjguEwyUWTi93svE7mCFPTd4ywAn6GCizRJlW031pCNqUjMGTyQGuWiaJ+Eolv
	 eQX8D3SLDZ92OYRMzOApO+xonnh5M/1pZb5yLOuw8yUOL0BgiO5dfm/cdTX3qRFJ86
	 H3yul7z1IZhWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for
 LCLA SRAM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 23:03:17 +0000
Message-Id: <20260920230317.B8B731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: pm_runtime_resume_and_get() sleeps in atomic=
 context
- [Medium] dmaengine: ste_dma40: unnecessary LCLA SRAM power domain wakeup =
for physical channels
--

commit 711af1477e65e64325b0b0970b88c4b5d746ee74
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Use power domain for LCLA SRAM

This patch replaces the LCLA ESRAM regulator with runtime PM handling.
It adds a reference to the SRAM device that owns the ESRAM34 power domain
and holds that domain during descriptor preparation while transfers are
active.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index eda3f91741ed5..2841af5b160b8 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c

[ ... ]

> @@ -628,6 +632,36 @@ static struct device *chan2dev(struct d40_chan *d40c)
>  	return &d40c->chan.dev->device;
>  }
> =20
> +static void d40_transfer_runtime_get(struct d40_base *base)
> +{
> +	pm_runtime_get_sync(base->dev);
> +}
> +
> +static int d40_lcla_runtime_get(struct d40_base *base)
> +{
> +	if (!base->lcla_dev)
> +		return 0;
> +
> +	return pm_runtime_resume_and_get(base->lcla_dev);

[Severity: High]
Does this sleep in atomic context?

When d40_prep_sg() in drivers/dma/ste_dma40.c prepares a transfer, it calls
d40_lcla_runtime_get(), which invokes pm_runtime_resume_and_get() here.
DMA clients can call dmaengine_prep_slave_sg() or dmaengine_prep_dma_cyclic=
()
while holding a spinlock or from an interrupt handler. Since lcla_dev is an
external platform device and is not marked pm_runtime_irq_safe(), the PM
core's rpm_resume() will attempt to sleep waiting for the power domain.

Could this cause a scheduling while atomic panic when clients prepare DMA
from an atomic context?

> +}
> +
> +static void d40_desc_lcla_runtime_put(struct d40_chan *d40c,

[ ... ]

> @@ -2246,6 +2283,7 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterl=
ist *sg_src,
>  	dma_addr_t dst_dev_addr;
>  	struct d40_desc *desc;
>  	unsigned long flags;
> +	bool got_lcla_pm =3D false;
>  	int ret;
> =20
>  	if (!chan->phy_chan) {
> @@ -2255,11 +2293,20 @@ d40_prep_sg(struct dma_chan *dchan, struct scatte=
rlist *sg_src,
> =20
>  	d40_set_runtime_config_write(dchan, &chan->slave_config, direction);
> =20
> +	ret =3D d40_lcla_runtime_get(chan->base);

[Severity: Medium]
Could this unnecessarily activate the LCLA SRAM power domain for physical
channels?

In drivers/dma/ste_dma40.c, d40_prep_sg() unconditionally resumes the
domain here before checking if the channel is logical or physical. Since
physical channels map directly to hardware registers and do not use the
LCLA SRAM, does this unnecessarily keep the power domain active and
introduce wakeup latency for physical channels?

> +	if (ret) {
> +		chan_err(chan, "Failed to enable LCLA power domain\n");
> +		return NULL;
> +	}
> +	got_lcla_pm =3D !!chan->base->lcla_dev;
> +
>  	spin_lock_irqsave(&chan->lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ux500-powe=
r-domains-v7-1-v3-0-9352be6b86b1@kernel.org?part=3D15
