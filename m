Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87804B5419;
	Thu,  3 Sep 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445266; cv=none; b=WtGhP6gDkKlt53aHan6CjYKReBX/nuz41BGxoZCoTeaAghAtzTdP0iCIORSauhS+4Km5/JYS0h43d6x7UMZ0CNSVCxttWIB+531gO3qq7oFd7v5TlUh/rE2FNEm2fikw8PgErYNUWD5X2Jhyrs+ELC2BxuV8AxkPwmre9GzFzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445266; c=relaxed/simple;
	bh=i6FdDXvX2TlvEtu62lSUM7i8qPpH/swIA8OXxgbEveA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dGfn6LNXP8aSoktZErejrokVP8Dizl3jIONyI1oIC9CeHbB72AO7rxBFyEiOiB2m0kgvJdBvThxwQns4ycdfo9FmVXnjy9m0MUcTmCcsuTriOq2XIAk8Vjqf1p9yteXgZms7MvJH+8SMtyv3KAtQ+8tTGrDLBDuyOz2TZ4dc0Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McKAFiJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McKAFiJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66191F00A3E;
	Thu,  3 Sep 2026 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445260;
	bh=fYhBCu/m+5zRhliVXZRNyGCvWNHSf1IWKBHWPgWSQaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=McKAFiJPne8B/Mlqjtc3wTMPMBluAY0VzpV41xi84dSbqb80XZbCjuDFibXZlQUB1
	 FL7VxnBt5eSbrphpwhrFTfqd3jQiUEho8U9Vm0R9I/MKdmoAXVPrFVOZAdvAEb8LWN
	 RII+QoRJK6CAOhvhZhZCzRlx01I4q8IJHxxFIrh9dz5JDs0CAf0fyIKkLYn+a9RGlU
	 LO0SPMnGjNr5UtkmjeuTjXJhT6C4MYYMyLayU8tq4oLBPaV0R5SoTeZvtKGgsMjatc
	 nisPOCl5ZHGnP5RVz3xO987aYtxnx/fpzmI0DesoOLgeW/1+8GMSlclfUFu+IW3Llq
	 P0sotdWs9wD/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dmaengine: Use non-atomic bit ops for cap_mask
 manipulation
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260903-dma-mask-v1-1-211ffd12c236@nxp.com>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
 <20260903-dma-mask-v1-1-211ffd12c236@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:20:59 +0000
Message-Id: <20260903142059.B66191F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Switching from atomic to non-atomic bit operations for dma_cap_set=
() and dma_cap_clear() introduces a data race because device->cap_mask is d=
ynamically modified and read locklessly at runtime.
--

commit c07946f79361ae1b6ffde1ddcb461591fa84c7f0
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: Use non-atomic bit ops for cap_mask manipulation

This commit switches dma_cap_set() and dma_cap_clear() to use non-atomic bit
operations. The commit message assumes these functions are only called duri=
ng
driver probe without concurrent access.

> dma_cap_set() and dma_cap_clear() are called exclusively during driver
> probe, before dma_async_device_register() makes the device visible to
> the rest of the system. There is no concurrent access to cap_mask at
> that point, so switch to the non-atomic __set_bit()/__clear_bit()
> equivalents.

[Severity: High]
Is the assumption that there is no concurrent access to cap_mask accurate?

Looking at dma_get_slave_channel() in drivers/dma/dmaengine.c, dma_cap_set()
is called dynamically on a registered, globally visible device:

drivers/dma/dmaengine.c:dma_get_slave_channel() {
    ...
    dma_cap_set(DMA_PRIVATE, device->cap_mask);
    ...
}

Concurrently, a reader checks the capabilities mask holding only an RCU
read lock in dma_issue_pending_all(), which races with this newly
non-atomic writer:

drivers/dma/dmaengine.c:dma_issue_pending_all() {
    ...
    if (dma_has_cap(DMA_PRIVATE, device->cap_mask))
        continue;
    ...
}

There is also a concurrent lockless read of cap_mask without holding a mutex
in __async_tx_find_channel():

crypto/async_tx/async_tx.c:__async_tx_find_channel() {
    ...
    dma_has_cap(tx_type, depend_tx->chan->device->cap_mask)
    ...
}

> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index fe33a20abc614..923d914691d06 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -1551,14 +1551,14 @@ static inline bool async_tx_test_ack(struct dma_a=
sync_tx_descriptor *tx)
>  static inline void
>  __dma_cap_set(enum dma_transaction_type tx_type, dma_cap_mask_t *dstp)
>  {
> -	set_bit(tx_type, dstp->bits);
> +	__set_bit(tx_type, dstp->bits);
>  }

[Severity: High]
Because non-atomic __set_bit() and __clear_bit() can be implemented by the
compiler as read-modify-write operations, can this cause tearing or
corruption of concurrent reads and trigger KCSAN warnings or memory
corruption?

> =20
>  #define dma_cap_clear(tx, mask) __dma_cap_clear((tx), &(mask))
>  static inline void
>  __dma_cap_clear(enum dma_transaction_type tx_type, dma_cap_mask_t *dstp)
>  {
> -	clear_bit(tx_type, dstp->bits);
> +	__clear_bit(tx_type, dstp->bits);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dma-mask-v=
1-0-211ffd12c236@nxp.com?part=3D1
