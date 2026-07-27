Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F98C3546D8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186148; cv=none; b=FFdAuN9K2YNmwozYMsQzYTbH4VSr5frbytsA44OhU3Nmdu++3GTMBDcqqOjg20flHrsamijdTtiY/PGX64aqVnqoPS4i1V8Xz9gYRqwVQZk31XQjbEfniYCqu30KnFVoFJU3ke2URcd5r0MLYsS65lGipSMldDp2iAh2+7bC9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186148; c=relaxed/simple;
	bh=LOkhCWplH4KIsdleviRczb1Yo7jkTKkyWjP8LqZREBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kmbrRvlH068LDSepuikEm4exoeIa8dlXBjuZGKR8dNhgYevCC/dYpvEsrEAaOe/z5oPDvYPgXjjphBAnmX5E1tp36J3JV7tHHu8z6xVWjtFm6hny98sRSOgE/PNActdq1ybShz204AEEwA/WWagIF4RPCNejDq9QQw1n6Fyk3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsd5fgTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsd5fgTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4330D1F000E9;
	Mon, 27 Jul 2026 21:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186145;
	bh=p/IJvJFYHF1wz3bqz1EBXSTu39zag3O5zpDPq7KYw6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hsd5fgTH/X063Et96ZViSIbhQqphQiovD2ZFVkJfVzxwpeMumVY+ph6A71sN358AP
	 3pmHR9YtHgp8Ni94nd9n2SxOtD7rn1/QSJYgaExbIgnkgtgm+qRl3TpoXzBR9ht6dK
	 yYAzCLktMYTYm1gMIewEGGThdB4pca3XQZ7UhPvjI/gnchPY0euugHGX0LqGq/oMba
	 wgeluHylQyxrbdkXX4cr5a/bMxWimiPZUBc29oRyrkLxi5DheRjlwsE2KZdeZ31OyN
	 wy9Oq/WHwpFNfoL317wGtz6XNredcrDnh7vG3W3YYKnkY9psFIkljJgLbtIuYd+qyN
	 awS4HKLfWC0Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 27/64] dmaengine: k3dma: kill vchan BH on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <f0b555313c656381ca201c86de3f8e09d5f9fe0f.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <f0b555313c656381ca201c86de3f8e09d5f9fe0f.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:02:24 +0000
Message-Id: <20260727210225.4330D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent execution of `k3_dma_tasklet` and `k3_dma_remove` leads=
 to list corruption and a `LIST_POISON1` kernel panic.
--

--- Patch [27]: [PATCH v2 27/64] dmaengine: k3dma: kill vchan BH on remove =
---
commit 0a41ab53724cb23d95bb02f7dd926541fc428dd1
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: k3dma: kill vchan BH on remove

This commit updates virt-dma cleanup in the k3dma driver. It switches from
using tasklet_kill() to dma_chan_kill_bh() during driver removal, reflecting
that vchan now uses the per-channel BH helper.

> diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
> index e84f197fea76f..99a70b90a02b1 100644
> --- a/drivers/dma/k3dma.c
> +++ b/drivers/dma/k3dma.c
> @@ -976,7 +976,7 @@ static void k3_dma_remove(struct platform_device *op)
> =20
>  	list_for_each_entry_safe(c, cn, &d->slave.channels, vc.chan.device_node=
) {
>  		list_del(&c->vc.chan.device_node);

[Severity: High]
This is a pre-existing issue, but can this sequence cause a list corruption=
 and
kernel panic if a hardware tasklet runs concurrently?

If an interrupt fires and schedules d->task just before devm_free_irq() run=
s,
k3_dma_tasklet() could run concurrently and iterate over d->slave.channels
locklessly:

drivers/dma/k3dma.c:k3_dma_tasklet() {
    ...
    list_for_each_entry_safe(c, cn, &d->slave.channels, vc.chan.device_node=
) {
        spin_lock_irq(&c->vc.lock);
        p =3D c->phy;
    ...
}

Concurrently, k3_dma_remove() calls list_del() on the channel nodes before
calling tasklet_kill(&d->task) below. If k3_dma_tasklet() fetches a deleted
node, will it see LIST_POISON1 in the next pointer and panic on the next
iteration?

Could tasklet_kill(&d->task) be moved before the channel list modification =
to
ensure the tasklet is stopped first?

> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  	}
>  	tasklet_kill(&d->task);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D27
