Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBA23D7DF
	for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 22:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857460; cv=none; b=KqNwf+2e0OMXaAw7ZF1KUkCpm+XgHw5CorP9GXzInx+Bx/KwpQb/LKOhbas7tGUvNiSBKmA3cCoXJOYkrbRh77Y8wpyIviJpUNk2Q2c5KHCpn4oM0UeLYuL+QcrvrusKENVgEFEsAHaGHODKp7VtUSCKeP4AcIDkvVSw/JHlbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857460; c=relaxed/simple;
	bh=TfMGm8h/enaSdGr1XwRWbYVb4fmQohVmj3RKU7/k1Zk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OXp3IR2ux39hger5iSNNJJmuaP0bHdA5SqW8Xnf9pec0jt4AkeIG25mwn5MXXijnc+xA8LzeoYdVXUtiHNS//FtyNRlYb+9DM663avDR+9xVlvZaOIXD7R1d3nPKl6tuuO8EI/RwKmYJlhXhfxe9iObwv9hQ1VQ5LnV1C7bxtyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvVek3dl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvVek3dl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7381F000FF;
	Sat, 19 Sep 2026 22:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789857458;
	bh=axJv2uFJgi0Mq8/unf5ngITSF37AjoAU0N022bk0sHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvVek3dl5fJ313eZxGnjK3/cVVIvVcbazTZwUyx/63HF1OCYXm+zlTz2Nn/qr6YMR
	 Zg6Zsh1Ae+qaL5bK0OZggvkXrjAUzOLvZdAT8Jjri1q/4n4J14Rn0zfhL6epFId3mk
	 dn0RnqtgFiNlYr0/4d6OYnLr05fHThPOmr0LV+3WIHya+M87PEN4dmpZYboyi7vbZQ
	 hsaLKFuLYza2Ue/i4Q9wJYOHW2UmomieR6T1hYXw1Uvup+e/6jtodp0JQXx5uvy80o
	 dwsK7z81g/joeerIY6mQ5uHXKyo54fLPjgwr7TlGpPkvw4WO4AdIi6QMCufStxWDhA
	 LsosQRdlnMUMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/23] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260920-dma40-fixes-v4-3-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
 <20260920-dma40-fixes-v4-3-d751b2d9c23f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 22:37:37 +0000
Message-Id: <20260919223738.5E7381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: double-interrupt race causes full buffer spu=
rious callbacks
- [High] dmaengine: ste_dma40: duplicate cyclic callbacks on fallback point=
er sampling failure
--

commit a2aa4dd1ba30133f07fa06190999eebead74c31d
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Recover coalesced cyclic callbacks

This commit addresses lost period notifications in the DMA40 driver caused
by coalesced cyclic callbacks. It calculates elapsed periods by comparing
the current memory-side pointer against the last queued callback position,
accounting for elapsed periods and potential full buffer laps.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index c9983e600dafc..b992471e05f29 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c

[ ... ]

> @@ -1484,6 +1488,40 @@ static bool d40_cyclic_offset(struct d40_chan *d40=
c, struct d40_desc *d40d,
>  	return false;
>  }
> =20
> +static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
> +					       struct d40_desc *d40d)
> +{
> +	size_t current_pos;
> +	size_t offset;
> +	unsigned int periods;
> +
> +	if (!d40d->cyclic_period_len ||
> +	    !d40_cyclic_offset(d40c, d40d, &offset))
> +		return 1;

[Severity: High]
Could this fallback path lead to duplicate callbacks on the next interrupt?

If d40_cyclic_offset fails to reliably read the hardware pointer (for
example, returning false after retry failures due to concurrent register
updates), this returns 1 to legitimately report a single period completion.

However, since d40d->cyclic_callback_pos is left unmodified here, won't the
next successful interrupt recalculate the elapsed periods using the stale
cyclic_callback_pos, effectively recounting the period that was already
reported by this fallback path?

> +
> +	current_pos =3D rounddown(offset, d40d->cyclic_period_len);
> +	if (!d40_residue(d40c) && current_pos !=3D offset)
> +		current_pos +=3D d40d->cyclic_period_len;
> +	if (current_pos =3D=3D d40d->cyclic_buf_len)
> +		current_pos =3D 0;
> +
> +	if (current_pos > d40d->cyclic_callback_pos) {
> +		periods =3D (current_pos - d40d->cyclic_callback_pos) /
> +			d40d->cyclic_period_len;
> +	} else if (current_pos < d40d->cyclic_callback_pos) {
> +		periods =3D (d40d->cyclic_buf_len -
> +			d40d->cyclic_callback_pos + current_pos) /
> +			d40d->cyclic_period_len;
> +	} else {
> +		/* At least one interrupt occurred, so assume one buffer lap. */
> +		periods =3D d40d->cyclic_buf_len / d40d->cyclic_period_len;
> +	}

[Severity: High]
Is it possible for this else branch to be triggered by a double-interrupt
race rather than a full buffer lap?

If a second or ghost interrupt fires immediately after the first, before the
hardware pointer has advanced to the next boundary, current_pos will exactly
equal cyclic_callback_pos. This branch appears to interpret that condition
strictly as a full buffer lap caused by CPU starvation.

Could this extremely common double-interrupt race cause a massive burst of
spurious callbacks (a full buffer's worth) to be queued to the cyclic DMA
client, potentially leading to severe state desynchronization like ALSA
audio underruns or pointer jumps?

> +
> +	d40d->cyclic_callback_pos =3D current_pos;
> +
> +	return periods;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-dma40-fixe=
s-v4-0-d751b2d9c23f@kernel.org?part=3D3
