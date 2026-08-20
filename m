Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74646E00D
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232730; cv=none; b=MJxXOLXLY2ucBFeW3IVGPOGUhun6ggPaGwMPW2GSvnkMcbvZvrHSDFZoEXyt0G2Gi/oYF1xW9hcJCcV7E0WqDtP2DRkdrG34WE7iJJYGbfF0f37PcaTERBNHed+v5rr5A0keOmtPRC7GQ0a2YlTgV/GTyf2iGeRBH7c6/1LQloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232730; c=relaxed/simple;
	bh=UJLLvQq6NL1irY/XjpInWqkhvAi7YfMk0ZBngg7yQNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDJ2ithCv7QAN+60nGrg9dh/fpR4Brr/0cdXwVRUq/9XKsDdl2mpaugS381Y2fleU7VJkkvwM6LDcmp7losKuB3QEjPBKxXFvIZtT2MEroosB6y5ZuJvJDrJnAQnsV8N/vFhl8Ewj7/ttAnPl6fUbuy2S8tgd2GJhgkiwVXe2Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LubM+Edd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LubM+Edd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33F31F000E9;
	Thu, 20 Aug 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232728;
	bh=ERgEsQNpCg1Rdph5YiAjwUoXi+iyND/SNkPgW75PIzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LubM+EddDIvjX3s+z6qmFVfaGQd59nvJ21sondkFuMNa5RyL9gNoCx1F57jLwXesP
	 lsMVYnmYH6znb0jufv/CqWM0Qq20xGJxwTnzNNS/tcqsyeIYra5OnM3spR2z9dP1un
	 z3aLcYvcwShK4QOj+PrnApehgVBmscmRTnmSLpPgs6fFpSCZAFA2fchI39ITeLypUK
	 847bU/7AgNDSpb63EokLSgdgSBazFtKKOfZnxY9RzzFLzoAmEN4lHZLdnoqCRKaTWV
	 lBP7EqvFAYJKUUIMDuNIJdgQp5FXKWSBt/ZG8+rnUWleNhxLlJmbKValHveSY/TFUj
	 bhKo8gq5AkA4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/13] dmaengine: ste_dma40: Fix logical channel
 bounds check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-10-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-10-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:32:07 +0000
Message-Id: <20260820133207.B33F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Changing DMA transfer direction after channel allocation corrupts =
allocation masks and leaks logical channels.
--

--- Patch [10]: [PATCH v2 10/13] dmaengine: ste_dma40: Fix logical channel =
bounds check ---
commit 77f491852f9c4972a650574c4a045eadf10238f0
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix logical channel bounds check

d40_validate_conf() checks the raw dev_type against num_log_chans, but
d40_allocate_channel() derives the lookup_log_chans index differently. This
commit validates the dev_type against the derived logical channel index lim=
it
so channel allocation cannot write past lookup_log_chans.

Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 4e840846466b8..7c777e410c104 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1737,15 +1737,26 @@ static int d40_validate_conf(struct d40_chan *d40=
c,
>  {
>  	int res =3D 0;
>  	bool is_log =3D conf->mode =3D=3D STEDMA40_MODE_LOGICAL;
> +	bool invalid_dev_type =3D conf->dev_type < 0;
> =20
>  	if (!conf->dir) {
>  		chan_err(d40c, "Invalid direction.\n");
>  		res =3D -EINVAL;
>  	}
> =20
> -	if ((is_log && conf->dev_type > d40c->base->num_log_chans)  ||
> -	    (!is_log && conf->dev_type > d40c->base->num_phy_chans) ||
> -	    (conf->dev_type < 0)) {
> +	if (!invalid_dev_type && is_log) {
> +		int max_dev_type;
> +
> +		if (conf->dir =3D=3D DMA_DEV_TO_MEM)
> +			max_dev_type =3D DIV_ROUND_UP(d40c->base->num_log_chans, 2);

[Severity: High]
This is a pre-existing issue, but does changing the DMA transfer direction
after channel allocation corrupt allocation masks and leak logical channels?

If a DMA client allocates a channel configured for one direction (e.g.,
DMA_MEM_TO_DEV), and then prepares a transfer with the opposite direction,
drivers/dma/ste_dma40.c:d40_set_runtime_config_write() updates the internal
direction:

    cfg->dir =3D DMA_DEV_TO_MEM;

Later, during channel release, drivers/dma/ste_dma40.c:d40_free_dma() relies
on this mutated direction to determine which allocation mask to free:

    else if (d40c->dma_cfg.dir =3D=3D DMA_DEV_TO_MEM)
        is_src =3D true;
    ...
    d40_alloc_mask_free(phy, is_src, chan_is_logical(d40c) ? event : 0);

Could this clear the bit in the wrong resource mask, leaking the originally
allocated resource and inadvertently freeing a mask that may be actively us=
ed
by another client?

> +		else
> +			max_dev_type =3D d40c->base->num_log_chans / 2;
> +
> +		invalid_dev_type =3D conf->dev_type >=3D max_dev_type;
> +	}
> +
> +	if (invalid_dev_type ||
> +	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
>  		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
>  		res =3D -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D10
