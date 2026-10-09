Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F54908CC
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538814; cv=none; b=LSCRukIRwOam9IkxBAFX6MZl8bKyYbTjXmMrCQtgB1fSMQPFJLSTMPsXZc/kCdbnkDpa4X17MgD63HsEZxHb6vB9YykvVotAMOJgPEJh3A9k/l9f84YxHPAQHSt+9+vGJZFenlA6L1c1RAxtfe+l9OtR9HDvaxVf9eLvG5qEM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538814; c=relaxed/simple;
	bh=i3AUEgnNmqX1j6FyrZUoOgrpq9E7+h83+W5O2Dq5/Vk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=R7Yhyjcy3kwiPUOYal9PXM638b80xDv2KQ2qlkbs0zqlMvTVAPup/ZYLvZ1YnDJ8FDiMmAsXc8mj71UrVyZRF32JnuJoVhb6OwY6ld2/zQhZo7qjTPT0R4ZjSJ6tXot4I/XH1ZQM3FDDxTTgSToQyyD7knVJvkoJQvEGqTAsnbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fblTEnZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fblTEnZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9101F000FF;
	Fri,  9 Oct 2026 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538805;
	bh=z0SGgt7Z3LhxzLgpY17Vl3UAzkzxHP3OrEYy80Lc77Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fblTEnZ27O8bnKUBuqD5Jay6qlIxHY1NrPGBOOY2U5M4qePg/JhKDW//rTy/cGNma
	 4gs1tYJI4gW+D46QiW/dfkEedKax0k7SavCujWog3vKRCz3Z7pK74BC/dft859UsUN
	 bXB+bWUDrSZaFKrmtnwS7iGduv9dYyXZZfzecTu+qKdZJaafa2AMyeVIT+6mYyrBZn
	 x/gUu3ChsiP6j7XffPByLKWkKSzQhddFuZomSr88VSH9RbPO8ZwraR04DZ+BDNOkSw
	 +4GpULutHXqqUA82d43qm9kRfPUi+iXa1Cf2sVcTDvJpLXk1kQHXOwwugWXogq4ukb
	 u8ktSC6paQ1eA==
Message-ID: <sashiko-outbox-165180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] docs: dmaengine: clarify ordering rules around cookie
 completion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinod Koul" <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20261009093745.539924-1-vkoul@kernel.org>
References: <20261009093745.539924-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:40:04 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] docs: typo 'architcure' and grammatical errors in dmaengine provide=
r documentation
--

commit 5e1e4fe7c0e4434abe23aff6f6d55d9b232ea575
Author: Vinod Koul <vkoul@kernel.org>

docs: dmaengine: clarify ordering rules around cookie completion

This commit adds documentation to clarify the ordering rules for DMA cookie
completion, ensuring buffers are flushed before drivers invoke the completi=
on.

> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentat=
ion/driver-api/dmaengine/provider.rst
> index f4ed98f701c91..073ba6c0f29dc 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -555,6 +555,11 @@ dma_cookie_t
>  - Not really relevant any more since the introduction of ``virt-dma``
>    that abstracts it away.
> =20
> +- dmaengine drivers need to ensure buffers are flushed before invoking
> +  vchan_cookie_complete() or dma_cookie_complete(). This would imply a c=
all
> +  to unmapping buffers or any such architcure calls to ensure caller see=
ing
> +  buffers are flushed is done before invoking these calls.

[Severity: Low]
This isn't a bug, but there is a typo here ('architcure' instead of
'architecture'), and the phrasing "to ensure caller seeing buffers are
flushed is done before invoking these calls" is grammatically awkward.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009093745.5399=
24-1-vkoul@kernel.org?part=3D1
