Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006239;
	b=K5i3uDIpwN380/bgTABjisdV1aUWGDgAbPuznT1ylIDE+0OEYY/CsQC98lBrYh0X7Chy
	 yZT512X8xPHWt86WaKhE+G0D/5/rjjU0d81tayaeP+RyQ0c2hEzRBAH12vL/FXN1LffBz
	 YDihsOMQPKvLtJI5/j8aML3/d/Rmj5ldrvoq90xKQmcsSyitWzeaMAjZoZIgBxg8zNhQR
	 AEACQ2PHLUQlksZkuaPEwCNYQz7BubnGIH3doudEGTqo7eoj4ogb3pyKLMztRaLvVpj2m
	 4z2UHE9+sHR8ctTyQPPPfrIVoA6+QHkmnXxOwDSl1+vW6Nh9Q82Xcg6dhGgbLPEvqLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EHH/3AkjxKMqnd16FVEmNpDkN6cA+wBLdKLRsE61fU0=;
	b=tYCji7fbnHi4dff9F9RzUDKeJAxcs316C0b2dp627yoV4eXyBZ0zrJXduWhhwYO9yoyp
	 /wpYBtuJFNwWxjOUPPO3YStXT+qHbMPU8Qg/jQ6Bw+aqw6FhV6SOg6ZY8CwHLn7RsvlK/
	 H4kdvmA7Ygyq5VyKSOrIzNd0iCHRXnTlVC6ZSZReJVEr2ZyoEPlF6kcytPUfYRP+2wLGV
	 ncuAD6p7v2JXTRjBC/40VuSFyFmzKvMo5fwtRR9QbMfGpZyz2zwZC8FPL1ak2+qutACT9
	 eR/lrpr42vqbMQpF+hN9RrNth6/gYj5X3P8qv7pp22DeUriDpFQjMTHl+iu3ewU+GrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isBaxCDP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD7606A31A;
	Mon, 26 Oct 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isBaxCDP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206071F01825;
	Mon, 26 Oct 2026 09:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006238;
	bh=EHH/3AkjxKMqnd16FVEmNpDkN6cA+wBLdKLRsE61fU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=isBaxCDPKmCJOXoAL/1UkzUnUkG3nCYKz8x4SbGXyrQusb5/Omrk+7jEp/K8BYGAc
	 RZjpwDhQZ1fJmPXFneMBz1MfQa2jfe2QWN6KC8pjgbTUveYp+/Ww05CCU5Q/m+ZmSf
	 i/MjRqeJ+PBUkgiWWpe3QtISMH3bvm1RCynROhcaAkqhp2FVFhyaNL/B7tHyzwpLwi
	 iGCvetrqbSO4CyhJqTZCDPRlAd2YLNPXZqSlHBiWzm4GnpJIi3yXSX2a4XiVNL+LcI
	 3iEzbWD8YQ83kWnB4gaCaozTP9ESYK0blhMYaDbheI0HNQE9UMVL8UOt5iroyyEKnK
	 /qGmfblCoY2VQ==
Message-ID: <sashiko-outbox-184754@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dmaengine: loongson: loongson2-apb-cmc-dma: Fix
 cyclic residue wrap NULL dereference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>, dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <e094c8dc1d01af2f296457f6c18b5d85ae76905f.1792988985.git.zhoubinbin@loongson.cn>
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
 <e094c8dc1d01af2f296457f6c18b5d85ae76905f.1792988985.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:17:17 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: loongson: wrong next_sg check in loongson2_cmc_dma_de=
sc_residue()
--

commit d1cdc3886ec73f6a09aef30478b0b2741d57690c
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap NULL de=
reference

This commit updates loongson2_cmc_dma_desc_residue() to check desc->cyclic
instead of lchan->desc->cyclic when next_sg =3D=3D 0, and adds a comment
explaining the cyclic wrap behavior.

> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index 2037120b23caa..f090fbe0b8a1e 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -484,7 +484,19 @@ static size_t loongson2_cmc_dma_desc_residue(struct =
loongson2_cmc_dma_chan *lcha
>  	ndtr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CNDTR, lchan->i=
d);
>  	residue =3D ndtr << width;
> =20
> -	if (lchan->desc->cyclic && next_sg =3D=3D 0)
> +	/*
> +	 * For a cyclic descriptor that has wrapped (next_sg =3D=3D 0), the
> +	 * current period only has the in-flight entry left; the entries
> +	 * from sg[0] onwards belong to the next period. Adding them would
> +	 * make residue exceed one period.
> +	 *
> +	 * Use desc->cyclic, not lchan->desc->cyclic: this helper is also
> +	 * reachable with a descriptor that is not lchan->desc, and only
> +	 * the active-descriptor branch passes lchan->desc today. Keying
> +	 * the wrap decision on the descriptor being queried keeps the
> +	 * result correct and avoids depending on lchan->desc being set.
> +	 */
> +	if (desc->cyclic && next_sg =3D=3D 0)
>  		return residue;

[Severity: Medium]
Can an active cyclic descriptor ever reach loongson2_cmc_dma_desc_residue()
in drivers/dma/loongson/loongson2-apb-cmc-dma.c with next_sg =3D=3D 0?

When starting a transfer in loongson2_cmc_dma_start_transfer(), lchan->next=
_sg
is set to 0 before configuring sg_req[0] and immediately incremented to 1
under lchan->vchan.lock:

    if (lchan->next_sg =3D=3D lchan->desc->num_sgs)
        lchan->next_sg =3D 0;

    sg_req =3D &lchan->desc->sg_req[lchan->next_sg];
    ...
    lchan->next_sg++;

Similarly, on cyclic period completion in loongson2_cmc_dma_handle_chan_don=
e(),
loongson2_cmc_dma_configure_next_sg() wraps lchan->next_sg from
lchan->desc->num_sgs to 0 to program sg_req[0], and
loongson2_cmc_dma_handle_chan_done() immediately increments lchan->next_sg =
to
1 under lchan->vchan.lock:

    if (lchan->desc->cyclic) {
        vchan_cyclic_callback(&lchan->desc->vdesc);
        /* LOONGSON2_CMCDMA_CCR_CIRC mode don't need update register */
        if (lchan->desc->num_sgs =3D=3D 1)
            return;
        loongson2_cmc_dma_configure_next_sg(lchan);
        lchan->next_sg++;
    }

While the final period sg_req[num_sgs - 1] is in flight, lchan->next_sg equ=
als
desc->num_sgs, so the loop

    for (i =3D next_sg; i < desc->num_sgs; i++)
        residue +=3D desc->sg_req[i].len;

naturally executes zero iterations. Thus for an active descriptor,
lchan->next_sg is always in [1, desc->num_sgs] when
loongson2_cmc_dma_tx_status() queries it under lchan->vchan.lock.

In this patch, the only caller that passes next_sg =3D=3D 0 to
loongson2_cmc_dma_desc_residue() is the else if (vdesc) branch in
loongson2_cmc_dma_tx_status() for an unstarted queued descriptor on
vchan.desc_issued:

    if (lchan->desc && cookie =3D=3D lchan->desc->vdesc.tx.cookie)
        state->residue =3D loongson2_cmc_dma_desc_residue(lchan, lchan->des=
c,
                                                        lchan->next_sg);
    else if (vdesc)
        state->residue =3D loongson2_cmc_dma_desc_residue(lchan,
                                                        to_lmdma_desc(vdesc=
), 0);

With desc->cyclic && next_sg =3D=3D 0, querying a queued cyclic descriptor =
(while
another descriptor is active) returns early before summing desc->sg_req[i].=
len,
reporting only the active transfer's ndtr << width.

Even after the later commit in the series ("dmaengine: loongson:
loongson2-apb-cmc-dma: Fix residue for queued descriptors") switches the
else if (vdesc) branch to loongson2_cmc_dma_desc_total_len(),
loongson2_cmc_dma_desc_residue() is only called for the active descriptor
lchan->desc with lchan->next_sg in [1, desc->num_sgs]. Doesn't that leave t=
he
next_sg =3D=3D 0 check as dead code and the comment describing cyclic wrap =
and
non-active descriptors inaccurate?

Also, regarding the commit message description of the NULL dereference when
lchan->desc =3D=3D NULL: since vchan_find_desc() searches vchan.desc_issued=
, and
both loongson2_cmc_dma_issue_pending() and loongson2_cmc_dma_handle_chan_do=
ne()
immediately start the first descriptor from vchan.desc_issued under
lchan->vchan.lock, can vchan.desc_issued ever be non-empty while lchan->desc
is NULL? Should this check and its comment be removed altogether once queued
descriptors use loongson2_cmc_dma_desc_total_len()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792988985.gi=
t.zhoubinbin@loongson.cn?part=3D1
