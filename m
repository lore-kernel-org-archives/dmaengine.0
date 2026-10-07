Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700F442B2F;
	Wed,  7 Oct 2026 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371158; cv=none; b=O5RKT3jo8Ful4TI19g74+y4MPRS61zY5cLFKzDVOkNtbaZ1Q95X6P+hUHyRCz5EmRnbCUOOIG+cCXL4KjMQ1tVOTF5FA9B9SJr9c14LzRBlLJBo7OKobViNGmEnsKwozKkaaboB+mGUmr14EMv3MJ/ip8B642+iI1N1vX9S5W14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371158; c=relaxed/simple;
	bh=gUMpOCfZE8qoEazQmjeJKIiyvqdVWeXD7qSIzalU3BU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kdhdpNic/N155r+Oq2mAbn43ur0W/LThcZwoO937QGVNre9U+p5vXJpUOldhDjiB9Bj30Cbg6YzJeFZexWwGt57xJGRDpPW5gyzUEeR4CgwBKzVN4TPZaX/t4DYh9EBOgk2rSgnDjO7TnsIXrv+ooMvtCuX9imlgoG8EheVOuYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPI7NKEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPI7NKEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7116B1F0089B;
	Wed,  7 Oct 2026 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371133;
	bh=lIgs7C3UT5MQL2dk39QsP/uZgwHQzRUm9Ov4Kt2aq6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QPI7NKEhkVr0rogT0EJHPULKpnmDT8fHau2+AavPIJ0/6VptPV+16SshCu2O/pGIW
	 yMVc+ladmbCjMpy2ichE6XTaObliaaqIPXRt98upqZjJ8ruLsLAwP2ud4QUCDJxp/Z
	 5X0ugKJypVWdw6Xsr//XEdTUjNZzSph4h76apb3cPnLiddiMT1Lmda5ne3Wtv09tCr
	 7ybfLfi5jbkR5pH4EfrhybITxZDbuQsw8pkG7Z4e1/U/KI9i6raCwnSmzprOqINXMW
	 h0pGy41Gp+5J3tbKKlsiMhTLfTfD6xjnSaTMBNTIRP/9CHz1L+si0NWz/PIrs8W02s
	 lRIre03tTtz3Q==
Message-ID: <sashiko-outbox-162906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 20/20] dmaengine: ti: k3-udma: Validate resource ID
 and fix logging in reservation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261007102936.2402427-21-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-21-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:05:32 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ti: k3-udma: missing lock in resource reservation leads=
 to TOCTOU
--

commit 710a674e34f14eb0ae15cca2c7bdeb8e8a4b36b1
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation

The __udma_reserve_##res macro currently lacks a bounds check for the
provided id. If a caller passes an ID exceeding the resource count,
test_bit() performs an out-of-bounds memory access on the bitmap.
This commit adds a bounds check and corrects the error codes and logging
for resource reservations.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index 846c1d72eaba9..a22dcaca754b9 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2046,9 +2046,14 @@ struct udma_##res *__udma_reserve_##res(struct udm=
a_dev *ud,	\
>  					       int id)			\
>  {									\
>  	if (id >=3D 0) {							\
> +		if (id >=3D ud->res##_cnt) {				\
> +			dev_err(ud->dev,				\
> +				#res " id %d is out of bounds.\n", id);	\
> +			return ERR_PTR(-EINVAL);			\
> +		}							\
>  		if (test_bit(id, ud->res##_map)) {			\
> -			dev_err(ud->dev, "res##%d is in use\n", id);	\
> -			return ERR_PTR(-ENOENT);			\
> +			dev_err(ud->dev, #res "%d is in use\n", id);	\
> +			return ERR_PTR(-EBUSY);			\
>  		}							\

[Severity: High]
Does this missing lock lead to a time-of-check to time-of-use race conditio=
n?

The macro __udma_reserve_##res() performs an availability check locklessly
using test_bit() here, or find_next_zero_bit() later in the macro:

    id =3D find_next_zero_bit(ud->res##_map, ud->res##_cnt,
                            start);

This is followed by an update completing an unsafe read-modify-write sequen=
ce:

    set_bit(id, ud->res##_map);

Similarly, __udma_alloc_gp_rflow_range() performs lockless discovery of the
free GP flow region:

    start =3D bitmap_find_next_zero_area(tmp,
                                       ud->rflow_cnt,
                                       tmp_from, cnt, 0);

And marks the GP flow region as allocated, completing a separate unsafe
read-modify-write sequence:

    bitmap_set(ud->rflow_gp_map_allocated, start, cnt);

Because exported glue-layer functions like k3_udma_glue_request_tx_chn()
call these helpers directly during client probe without holding any
driver-level lock (such as ud->lock), can concurrent probes race and
double-allocate hardware resources?

>  	} else {							\
>  		int start;						\

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D20
