Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396169;
	b=qigaqaGM7alYF/rzSsQERbC0nI3POAGNUfYroPrx7NB4mmLMZWSzf4XHSfffiWhGPQcl
	 VYHr2eIjSZB1yQNaiDweAKbIomtHP9TDIVnt2I3mTJ0bQOIzKHOLC+s57iOE2GrY5xz23
	 pkato/E17YZD98jVPoDmd6fEyuJ7sDWfPbSnoRJUHyihCrk4Rb+SSkfKDPPMXCZ09cw3E
	 4frC/GTBu7bvx6NgxTKWyXwqUJC4sRdM4LLpwWdWk5kT18arSjJtEmnbbpci8LTb7tD+A
	 2wQi/os7kH2KmTkeWDMjlAI3O5AW7ynt0kv2KVvltqHttzyon+85CudyThp5a7HN4Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1MjaqHmM5C5XU1vyvh9JSmAimK6pmg3JHXUPYV/mlm8=;
	b=ZATivpA7sHewOlr71jySsc+UjvlLYdI8DygU7k2bKqcHnCsVtSNwF8CiEUQzH9OSnV2t
	 fmvjL/eYf9A4xVoPJ0iP/JYDwgwV5BD85hASASNhZw7b+mTg/2P6LEWmKa/+VlkPQbHpD
	 vnT81eFWepQ7nnfU2LQe02gLOrwvVBsuEC6WpYtdQdo39KiUwyArz1lvt/5aB6Dspx/HM
	 Sj8zKdvTbO+SAwDtvtcTukoiD6/8TXufj+vXrgCL8IkcfJLYGlDuCQg7m8yS4M393FlQv
	 Eyj+4hXppAGGm6repM7XoBVoXWunV+ehoPGhRoYzfuAj8uIA+XqBjLFZwWHjiYGIWRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dykjPnXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC0606A31A
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dykjPnXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2351F000C0;
	Mon, 23 Nov 2026 01:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396169;
	bh=1MjaqHmM5C5XU1vyvh9JSmAimK6pmg3JHXUPYV/mlm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dykjPnXOx9huyMlZUi+LwFpBk/HDvRB8ys72S0m8yIAlgy9Qcgo8QLfkbvx+gjG4V
	 IsueL356r5omib0oTpe9OZy1b8tN8AqXml5Np0o0onMee3X68K/Bj+CLR6QcnjQL0r
	 yZD2rwwCpaHC0eFOCTo9eZgbm7MSMtZBaz4wGYbICXmKkJs1qsmwkAXrQRIm/bcB+W
	 c4sTwQh+h0YeYMGrMMLw/1cn6gpYVM1PGjWxfky5RSHFeB6RUFzZQJMG1mQ4K/yzyJ
	 EzuIGOKTFMCa1I40G4f6oxq7lcmRmuQ9HBMGyacGFTvBKDqs6ga9k2LNbLideCBfrl
	 wTu/u1uh0NM/g==
Message-ID: <sashiko-outbox-228507@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: at_xdmac: Kill the channel tasklets in
 remove again
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suyuan Wang" <shyckless@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-dma-chancnt-v1-1-f0eea0a4bb63@gmail.com>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
 <20261123-dma-chancnt-v1-1-f0eea0a4bb63@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:09:28 +0000
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
- [Medium] dmaengine: at_xdmac: chan_dev UAF and unclocked MMIO in
  at_xdmac_remove()
--

commit d1b41bac9406538e5524be5f60b8b97177c4c118
Author: Suyuan Wang <stevewong@hust.edu.cn>

dmaengine: at_xdmac: Kill the channel tasklets in remove again

This commit saves atxdmac->dma.chancnt before dma_async_device_unregister()
decrements it to zero so the per-channel tasklet cleanup loop in
at_xdmac_remove() runs again.

> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index ef0dfe9d37ba3..ef4012c225730 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -2436,6 +2436,8 @@ static int at_xdmac_probe(struct platform_device *p=
dev)
>  static void at_xdmac_remove(struct platform_device *pdev)
>  {
>  	struct at_xdmac	*atxdmac =3D (struct at_xdmac *)platform_get_drvdata(pd=
ev);
> +	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
> +	int		nr_channels =3D atxdmac->dma.chancnt;
>  	int		i;
> =20
>  	at_xdmac_off(atxdmac, true);
> @@ -2448,7 +2450,7 @@ static void at_xdmac_remove(struct platform_device =
*pdev)
> =20
>  	free_irq(atxdmac->irq, atxdmac);
> =20
> -	for (i =3D 0; i < atxdmac->dma.chancnt; i++) {
> +	for (i =3D 0; i < nr_channels; i++) {
>  		struct at_xdmac_chan *atchan =3D &atxdmac->chan[i];
> =20
>  		tasklet_kill(&atchan->tasklet);

[Severity: Medium]
Does re-enabling this loop after dma_async_device_unregister() cause
at_xdmac_free_chan_resources() to dereference a freed chan->chan_dev?

dma_async_device_unregister() unregisters each channel device, triggering
chan_dev_release() -> kfree(chan_dev) and leaving chan->chan_dev dangling.
When the loop below runs at_xdmac_free_chan_resources(&atchan->chan) with a
non-empty free_descs_list, it passes dmaengine_chan_dev(chan)
(&chan->chan_dev->device) to dev_dbg(), which is a use-after-free:

drivers/dma/at_xdmac.c:at_xdmac_free_chan_resources() {
    ...
	list_for_each_entry_safe(desc, _desc, &atchan->free_descs_list, desc_node)=
 {
		dev_dbg(dmaengine_chan_dev(chan), "%s: freeing descriptor %p\n", __func__=
, desc);
		list_del(&desc->desc_node);
		dma_pool_free(atxdmac->at_xdmac_desc_pool, desc, desc->tx_dma_desc.phys);
	}
    ...
}

In addition, because free_irq() and tasklet_kill() run after
dma_async_device_unregister() and clk_disable_unprepare(), an in-flight
interrupt or scheduled tasklet can also dereference the freed chan->chan_dev
and access XDMAC MMIO registers after the controller clock has been disable=
d.
Should free_irq(), tasklet_kill(), and at_xdmac_free_chan_resources() run
before dma_async_device_unregister() and clk_disable_unprepare()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-dma-chancn=
t-v1-0-f0eea0a4bb63@gmail.com?part=3D1
