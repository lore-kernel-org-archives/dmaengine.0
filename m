Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997021;
	b=eIR+vNMSs4iUNxJFv/G0cquNbbvqTLxxo+U/1PhxUpeho+NlOQX6Td8ogNnHqHUxrnb7
	 VDFb19RPMtRWL5MOas5ynDdJMfWdMorkOJo1YQx0ntX4ssWlBJ7HpNRglYZkTWzQ63TK/
	 LAu4Rz4GO+IvEp55Oqa6x4Q9ei/9DztERAxEzxwqPNPMdF/d+pEK6q4Gf2VnXbvkrpCYO
	 UQztiwVdWth7iNty5ZdJPbcXhJdSijPZwolM9tA/Xkg62WXK0gUQuQUeya63ivizEk3N7
	 ldt7rcfPvitSL/uFxabxO0E1H7RJKDt1alWWie+2NTcU5IpTR0Rt3xFjWBr9kdO3YAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997021;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xiINgtqolrZA/FZLLtdEzNNmepL0tt/bgGu21PT68uM=;
	b=KKKJpat+ZVhfsnIgvBYcM5hxWp+JLfAGdXET4PJchSsbxSMzS/JXd/wfksJ1wht+q4rQ
	 5KhtEvk1f/5Vx1wGrwTlUjWKqrJM2V9Mif3L3mQ2P3Imhx5Nez/LtMt6EP8ySF9QIJLDw
	 WaVMkANXrIcKyMuV8It1jFfoFMzNmh/gSDPKEaZlkTdqpLbqtLiphIq/fZx7pZlXZ7mZL
	 5fpmzw7PkxKB9j47QoIap+crNpiLArN/DBsPxOLEWt8qhxg1C0uiEL2hbV3KuT6bwkCCR
	 0tIx/Y2xYcy0lfLxQ7ms1Gp9bRICAHLDxqUh0XsiCigJ19SgcobR42Y61+ZMzr0CcSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/JioySf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15254606A320
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/JioySf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9E71F000C5;
	Wed, 18 Nov 2026 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794997020;
	bh=xiINgtqolrZA/FZLLtdEzNNmepL0tt/bgGu21PT68uM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R/JioySfZ94lN1irY9aDH+AAlUI+/kmLnAi6g6MZENHRZWAy1lkwNCLf0D++wGjpA
	 4dUOU3p+hTRpGcXU/aEo31QcRvM1/NwtJm3NKUo5LKWjkq2wHhJWSQ+DDuT54/clIt
	 Dtd5qy0cRVVkbHWAaKjw9JJAS2sI8a5mrBBPf7ZJhbecHGyaY1uKrJYxWkHWJ3K9eJ
	 w8XbwJIetK0OODrxdsntwqh8zs8fl6q7EcxnAs2DHreKCCuIy91r2Vlnl9M6UrSpjb
	 JsdqlLWgD0Zzyf2MNY72/jFkIKoVUZubjNkjy4wQ0JGWSboknv0QYLcfhspoj6nUPm
	 S5DZ2RU9Hq1Eg==
Message-ID: <sashiko-outbox-220671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dmatest: terminate channel on timeout or
 error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amita Mishra" <amitamishra@google.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118100839.3090172-1-amitamishra@google.com>
References: <20261118100839.3090172-1-amitamishra@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 10:16:59 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] dmaengine: dmatest: integer underflow in min_odd() [1]
--

commit 15e7b971cd84dccd06d2762018cf300f9236dc53
Author: Amita Mishra <amitamishra@google.com>

dmaengine: dmatest: terminate channel on timeout or error

This commit calls dmaengine_terminate_sync() before unmapping DMA buffers
when a transfer times out or completes with an error in dmatest_func().

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 2ae3469397f37..950b7a9e77695 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -852,6 +852,8 @@ static int dmatest_func(void *data)
>  		}
> =20
>  		if (!done->done) {
> +			if (!params->polled)
> +				dmaengine_terminate_sync(chan);
>  			result("test timed out", total_tests, src->off, dst->off,
>  			       len, 0);
>  			goto error_unmap_continue;
> @@ -859,6 +861,7 @@ static int dmatest_func(void *data)
>  			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
>  					 dev->cap_mask) &&
>  			     status =3D=3D DMA_OUT_OF_ORDER)) {
> +			dmaengine_terminate_sync(chan);
>  			result(status =3D=3D DMA_ERROR ?
>  			       "completion error status" :
>  			       "completion busy status", total_tests, src->off,

[Severity: High]
This problem wasn't introduced by this patch, but can min_odd() underflow
when computing src->cnt earlier in dmatest_func() [1]?

drivers/dma/dmatest.c:min_odd() {
	unsigned int val =3D min(x, y);

	return val % 2 ? val : val - 1;
}

When a DMA device reports max_xor or max_pq as 0 (or xor_sources /
pq_sources is 0), val is 0 and min_odd() returns UINT_MAX.  That bypasses
the (src->cnt + dst->cnt) >=3D 255 check by wrapping around, after which
dmatest_alloc_test_data() passes d->cnt + 1 =3D=3D 0 to kcalloc() and
dereferences ZERO_SIZE_PTR when writing d->raw[0].

[1] https://sashiko.dev/#/bug/linux-ca967586-4fc1-47a3-8616-4a9d21fe7455

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118100839.3090=
172-1-amitamishra@google.com?part=3D1
