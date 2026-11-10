Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334405;
	b=inBuGIyzc5PvfPBC7yJ/FX6ZXQOSUehsln3yWHlokTp/MAW05PX4UPDVpbiJec6M4t1Z
	 OK8FElYiszgnJiHENh9e10Mbh9Or/hqGcKUpVy0iYo/AFTRFk50bM33tR6ayljXneYByk
	 v9OesQziTUTjB3+mB220TzmiohrgXz0OObBBSiar6z8KoUQ4M9U9f1Gk0Z+rAvx+LynGs
	 2++SYLy1lPakJhfbBQ1WTQLnxQKWEhRqGBqIkNvFooHllB71TaPxTynNoKPSGpLB4OSG6
	 ap1kSxjCY1lmXq4kfO3ZF/Wqwg/2tlkgurgLtbNUcoTaymCFedSxIDNh5zkswXp4RPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334405;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZJktAM7auhcK5tshYIlgK0KF4TkSzGWNUsKvqIaEqPk=;
	b=U3m7EAdNtNiKM9lUL0oESlwFScemRk9S+NwtbBS9iucGwf+pA0cSDRX8eIELi9yBD6I6
	 8ByXgORHEXZa+6aqJWfnEm7kUADl30fdNmM+rhFaAv2d8PL22mdMNwYnj3qvN3Xoh0CbV
	 mSj5DHN51e+loE/QAT3LAa7NhPppAMYVeeX1UIJv9KVJiewhYYgBOdC+Q3nDwfXwQsqJk
	 wk61Am1TEBl6i1TRgF8clC4yCHf1+pl8RpUQrGZm0cHK3Btg3CmscgMNUxlDI8i0y51jj
	 S5CNgO+ybvr94KosK4E3OCy4QFeCWn2VwbV0r+s9S/nGjaxQzrUMPzYx+iEJWihjKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AepYtECo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D0606A323
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AepYtECo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7F11F0089F;
	Tue, 10 Nov 2026 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794334404;
	bh=ZJktAM7auhcK5tshYIlgK0KF4TkSzGWNUsKvqIaEqPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AepYtECogOQw6OgwEEkIorHvOP5knWhkiQmbBI14pB3DQI2YM55qRRcA/gcZ/ljyo
	 ye5PJ9BjeK5EbiI00M1BfVrKvz2mKQbY+vaqrGsujk6qHxNNm+AMMxQMRZJ9jOlGQI
	 3MgLF5ktfrEYKsqA0WO1WW8naqbtO9Qi1hEEfiCD28NZXR1HQUMX1gsJwvO+eGokxR
	 ds4Orm9QfHe1O7qMsRmxjzHA/GYBXrW2QL+YESiXX0kVZuKxA1F/3dtaASjn44bCNE
	 SsrG1GtLeJ/n0DelFmjTZTqhLmxaho+iarUV2jmi/ZG6NC03IQUQ9ltFxmaSkToz3P
	 uk5k2H+1FFiXg==
Message-ID: <sashiko-outbox-207563@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] dmaengine: plx_dma: use spin_lock_bh() in
 plx_dma_process_desc()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110173927.624629-6-logang@deltatee.com>
References: <20261110173927.624629-1-logang@deltatee.com>
 <20261110173927.624629-6-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:13:23 +0000
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
- [Low] dmaengine: plx_dma: missing Fixes trailer for spin_lock_bh()
  regression
--

commit 5f96c9ac9107b3e9b24578041180b3fa3a8f51ef
Author: Logan Gunthorpe <logang@deltatee.com>

> dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
>
> plx_dma_process_desc() is also called from plx_dma_tx_status() in
> process context. With a plain spin_lock(), the desc_task tasklet can
> run on the same CPU while the lock is held, and spin on it forever.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.=
kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

[Severity: Low]
This fixes the regression where spin_lock_bh() was replaced with spin_lock()
in plx_dma_process_desc().  Should this include:

  Fixes: 1d05a0bdb420 ("dmaengine: plx_dma: Move spin_lock_bh() to spin_loc=
k()")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173927.6246=
29-1-logang@deltatee.com?part=3D5
