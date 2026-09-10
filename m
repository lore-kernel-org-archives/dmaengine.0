Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8E1E51E0
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 02:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007224; cv=none; b=ESHThYZ6QlW7GP69GYZZCM4ZT9cTMYrwB7muXyWaHjsgSU9lsF4ViC3BkSNYXkOj6ownD+3zYwYiyW5gseTMTTpXM18vyxBbT7IECSepz8VaGXqTPyonRxV1e3v6/dVOsLw5ChdPgplr3zQuqkHF7BvuQylSbjlB2c2L6/9N69o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007224; c=relaxed/simple;
	bh=iBUfjewTD+peRbomO4/CbtUG1qAhQVn9VXcIQdcoKeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Td8VEuqVkuPIBVDv1g1c2CcxHZ2GtJKgvSZmthwUfGDO86dtMdKRxMejMQqDu2p++cIpXNrdVLORSK9Htxuz+EhhfzzpqU0y0ejKIhw20r0e8Mm3a7BTEt0mlcfoqQ4s1ZGsotm9UAR9UfVXUoxNReKx+mAGqfl7ZoGd3t2jvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdyR1LLv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdyR1LLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670331F000FF;
	Thu, 10 Sep 2026 02:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789007222;
	bh=CobqLB/+6gTjU5t/+Q6RbqthsOXTRtKCV2s8asu86fM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AdyR1LLvA6+FIvR09t5xP5llAufRhBCOyoGUK3g6TRVTSbTIvkVqB4dU0YexsTOIL
	 HkjMK2n9vzyi6dEEJ3DvoqsXrDk+a2qPI+TStFGoy600HUEZA3R9FtHaEScFkmRznC
	 Z3ezBeEfI/UKYqiliaGm2l6AAUqNWf0rY13buT9FdslIYLkuZo/p6IvU1RTSsmP9BP
	 fQeLzFTalwxSMu4O3lBYxAFz0lB0RIYt2s9BGb0WdxK7/acsQDi98MzP60ShHHQ/FP
	 3PUIo4akqEYmmgOE03lvrBEMQh03AJOEsq2qmlnY5AAl4El1QoNuFpwkh58zP8nCN8
	 w3w1gzT4uhm+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: mmp_pdma: fix wrong sg length in
 mmp_pdma_prep_slave_sg()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baineng Shou" <shoubaineng@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910021652.1296640-1-shoubaineng@gmail.com>
References: <aqHJKbBTNrreoMuI@SMW015318>
 <20260910021652.1296640-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 02:27:01 +0000
Message-Id: <20260910022702.670331F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free of list head in error path when freeing descriptor =
chain because the list head is embedded in the first element being freed.
--

commit 5f1b06ea0ed695c8b6d14358fdfb48649d799152
Author: Baineng Shou <shoubaineng@gmail.com>

dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()

This commit fixes a bug in mmp_pdma_prep_slave_sg() where for_each_sg()
read the entry length from the list head instead of the current entry.
This led to out-of-bounds reads or silent data loss when handling
multi-sg lists of varying entry lengths.

> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882a..e90fd2023af71 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct=
 scatterlist *sgl,
> =20
>  	for_each_sg(sgl, sg, sg_len, i) {
>  		addr =3D sg_dma_address(sg);
> -		avail =3D sg_dma_len(sgl);
> +		avail =3D sg_dma_len(sg);
> =20
>  		do {
>  			len =3D min_t(size_t, avail, PDMA_MAX_DESC_BYTES);

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free
if a subsequent descriptor allocation fails further down in this function.

If a subsequent allocation fails, the error path is taken:

drivers/dma/mmp_pdma.c:mmp_pdma_prep_slave_sg() {
    ...
fail:
	if (first)
		mmp_pdma_free_desc_list(chan, &first->tx_list);
	return NULL;
}

Inside mmp_pdma_free_desc_list(), list_for_each_entry_safe() iterates
over the list and frees each descriptor:

drivers/dma/mmp_pdma.c:mmp_pdma_free_desc_list() {
    ...
	list_for_each_entry_safe(desc, _desc, list, node) {
		list_del(&desc->node);
		dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
	}
}

Because the list head (&first->tx_list) is embedded within the first
descriptor, it is freed during the first iteration.

If there are multiple elements in the list, the second iteration calls
list_del(&desc->node), which modifies pointers that point back to the
now-freed list head.=20

Does this result in a use-after-free write into the freed descriptor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910021652.1296=
640-1-shoubaineng@gmail.com?part=3D1
