Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383821C8FB1
	for <dmaengine@vger.kernel.org>; Wed, 12 Aug 2026 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514642; cv=none; b=K7hDxz/tIwbZrxZPwmE0RoO12oJgZi0vzlgIb86FYn3jraw9X6w0oJSZ+1jQtgm92WU2Xn8BIvwBKVRTxvXm2fiLnxg4evZuDDgoCCJPECCJW8Ww3KnMcOQt3Yq+uFcDIMrgPvLRljG0IRiGaNz2QFba3zUJ8fLjr9hIgwlHRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514642; c=relaxed/simple;
	bh=jc9+RXFYmCYJOSWusajnzwFqlPfwnPO4Z2ALTWBqL0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uaMzC2BXb3LDNG04vRcopQ46v+5jnNvM+Wosi0aFUSxuoINK2X+eLWu3mXW2M1PiTsL010DWbg3N+r+C6vcFFaAwlK7VRE5rX+tg1tTpvS+Zx26hvqwRHoiY3JoSmxlme1KtSCS/PBdft/YWhgbmb0hMr8W2RX1omGDmk/OdGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8QrQnHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8QrQnHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFD21F000E9;
	Wed, 12 Aug 2026 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786514640;
	bh=1sgIgI/gN+TcNRj4UviK8q5e1u0spg4P8VczKjUvflI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A8QrQnHTIr3jBvnZv1cv+3ZCKx7wDxpxwmDIf3tDmQ6SZsboCwunR79lTJpge0we9
	 FlWKsMTlQdHzxOFV8s5zgnuu2AXRD4job9i/P6af+N93fs85KSngD7yJHt2aZO6nU9
	 KQ9on1IIcvAgN1KYmrdoQ3WoRpE0eExxALB8rKFz44Q4fYfL6UGjdGxjx9bCk/76l2
	 gb7AyZmfgIZhRbPsNBWSCF2VYfHjp7X1vsWg3bePtoFbMkrkiZiMadAZzXISXOIIUU
	 nb6EFzRFmSAJqh6DtNc+SKuMyIfcIkNc8SwWevX2K49Ol6iVZQg/OQm37CtXqPwFJk
	 di/EIgpy4sh7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: ti: k3-udma-glue: fix NULL dereference in
 k3_udma_glue_release_rx_chn()
Reply-To: sashiko-reviews@lists.linux.dev
To: Alexander.Chesnokov@kaspersky.com
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
References: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 06:04:00 +0000
Message-Id: <20260812060400.7CFD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error cleanup path in `k3_udma_glue_release_rx_chn()` can read=
 memory out of bounds (causing a kernel panic) and incorrectly free unowned=
 General Purpose (GP) RX flows (causing resource corruption).
- [High] Integer overflow in the GP flow range boundary check allows an out=
-of-bounds bitmap clearance, leading to massive memory corruption.
- [High] Double free of `tx_chn->ringtx` occurs on failure of `k3_ringacc_r=
equest_rings_pair`.
--

--- Patch [1]: [PATCH v3] dmaengine: ti: k3-udma-glue: fix NULL dereference=
 in k3_udma_glue_release_rx_chn() ---
commit 7e8964856380a3ca6be40518b2b7b3a48d46e4be
Author: Alexander Chesnokov <Alexander.Chesnokov@kaspersky.com>
dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_release_r=
x_chn()

This commit fixes a NULL pointer dereference in the error cleanup path of
rx channel request functions. It skips the flow release loop in
k3_udma_glue_release_rx_chn() when the flows array is not allocated.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 686dc140293eb..70eaf7ee57e68 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -1243,8 +1243,9 @@ void k3_udma_glue_release_rx_chn(struct k3_udma_glu=
e_rx_channel *rx_chn)
>  		rx_chn->psil_paired =3D false;
>  	}
> =20
> -	for (i =3D 0; i < rx_chn->flow_num; i++)
> -		k3_udma_glue_release_rx_flow(rx_chn, i);
> +	if (rx_chn->flows)
> +		for (i =3D 0; i < rx_chn->flow_num; i++)
> +			k3_udma_glue_release_rx_flow(rx_chn, i);
> =20
>  	if (xudma_rflow_is_gp(rx_chn->common.udmax, rx_chn->flow_id_base))

[Severity: High]
This isn't a bug introduced by this patch, but can this error path lead to =
an
out-of-bounds read or an incorrect free of unowned General Purpose (GP) RX
flows?

If an early failure occurs (such as devm_kcalloc() returning NULL for
rx_chn->flows) and flow_id_base is -1 (used to request dynamic allocation),
calling xudma_rflow_is_gp() will execute:

drivers/dma/ti/k3-udma-private.c:xudma_rflow_is_gp() {
    ...
	return !test_bit(id, ud->rflow_gp_map);
}

Since test_bit() expects an unsigned long, passing -1 will cast to ULONG_MA=
X,
causing an out-of-bounds memory read.

Additionally, if flow_id_base is a valid GP flow ID that was not yet alloca=
ted
by this channel, is it possible for xudma_free_gp_rflow_range() to
unconditionally free a GP flow range that might be actively used by another
driver?

[Severity: High]
This is also a pre-existing issue, but does __udma_free_gp_rflow_range()
contain a signed integer overflow vulnerability in its bounds check?

If the cleanup path calls xudma_free_gp_rflow_range() with an abnormally la=
rge
channel flow count (cnt), the bounds check in __udma_free_gp_rflow_range():

drivers/dma/ti/k3-udma.c:__udma_free_gp_rflow_range() {
    ...
	if (from + cnt > ud->rflow_cnt)
		return -EINVAL;

	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
    ...
}

could overflow the signed integer addition (from + cnt) to a negative value.
Since a negative value is not greater than ud->rflow_cnt, this would bypass=
 the
bounds check and pass the huge cnt to bitmap_clear(), potentially clearing =
bits
across out-of-bounds kernel memory.

>  		xudma_free_gp_rflow_range(rx_chn->common.udmax,
>  					  rx_chn->flow_id_base,
>  					  rx_chn->flow_num);

[Severity: High]
This is another pre-existing issue unrelated to the rx_chn changes, but does
the TX channel error handling contain a double free if completion ring
allocation fails?

If k3_ringacc_request_rings_pair() fails to allocate the completion ring, it
frees the forward ring but leaves the pointer dangling:

drivers/soc/ti/k3-ringacc.c:k3_ringacc_request_rings_pair() {
    ...
	*compl_ring =3D k3_ringacc_request_ring(ringacc, compl_id, 0);
	if (!(*compl_ring)) {
		k3_ringacc_ring_free(*fwd_ring);
		ret =3D -ENODEV;
	}
    ...
}

Because *fwd_ring is not set to NULL, the caller's tx_chn->ringtx still hol=
ds
the dangling pointer. When k3_udma_glue_release_tx_chn() runs during cleanu=
p:

drivers/dma/ti/k3-udma-glue.c:k3_udma_glue_release_tx_chn() {
    ...
	if (tx_chn->ringtx)
		k3_ringacc_ring_free(tx_chn->ringtx);
    ...
}

will it mistakenly free the same ring a second time, potentially causing
use-after-free and ring allocator state corruption if another process reuses
the ring ID?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812053426.3521=
589-1-Alexander.Chesnokov@kaspersky.com?part=3D1
