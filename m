Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114112F1FE4
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265492; cv=none; b=CkPTvRzvwAIcY4BKZCPJrwTtkgsfFb2ZWbFiK2lS7H+J+2xJNb4GNLF4AZYolKYku8eY4A4k5ETFTvz6p+TmCw/VDUGF3Lri12EVeAosU04yMNkrNs65Iv9s+/t742aV827X8AVkrfsxhElm4hYCyfNIl5sJnSPDhsunaoH0fHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265492; c=relaxed/simple;
	bh=97ey76CLyqvBy0KQH1iPI5eU0lStqj9QmgaS07ovwF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F738aS+QJVHeFZbP/KXNnUQYICHd8osr9KrGHPo90L7EJFionF56NDTXhN7kID6IWNCOK2Dy8Jdnm9CcGMtTcWF/fyxUKa8bL3uLvVLq6umm/etLC6GTnqptptXsefc+xas4FHeJOQk6Z8if9iiXqZTA0hhmbhuCT5DD7aaJ2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edL4Nulp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edL4Nulp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D581F000E9;
	Fri, 17 Jul 2026 05:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265490;
	bh=ySs6GVpLtafLGC2E2HTGhRUlPtLmv1X5/G6Rwz7IudU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=edL4Nulp1AJwmvrvbTI1I0WnV2KvrWoZguaFZb2NtF11WuLLbG4hPQGdTbgifkiIX
	 C5zgw4i3dxzafSe99sqKDq+2OSNslb1iuqwhaLkBBmmGObamlo6DvMLLqTHog8+ldj
	 GgopksxnypDFdDSQG7nmsGCy7VVPXPJQFHhWQTZmgwYgzvsT35suHjo5vgh8CSgu/J
	 WIhwahzLlL8tLkKQAI/i7TmW9kCAL/p1RrRvKY5DmYKhs3v8RVqwvhA3RpQ+dNE1mf
	 es8pqX4JXUd/dijKipcth53lgxqsnzNUqE6klUxYlVCqqAlYwjMfBshhpUMtfJQ99f
	 6lwL7QoomLxaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/14] dmaengine: dw-edma-pcie: Handle optional data
 blocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717050308.2144108-13-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-13-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:18:10 +0000
Message-Id: <20260717051810.70D581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IRQ vectors allocated by pci_alloc_irq_vectors() are leaked in mul=
tiple error paths within dw_edma_pcie_probe().
--

--- Patch [12]: [PATCH v5 12/14] dmaengine: dw-edma-pcie: Handle optional d=
ata blocks ---
commit 668bf3e5a48eceeac33c0a1fc5620f41d4cdbd7d
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Handle optional data blocks

This commit skips data block BAR mapping and debug output when a channel has
no data block size. This allows future providers to describe channels that
only need descriptor memory exposed, with no functional change intended for
existing devices.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index a5d65cc9706c2..8c4d1359a5456 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -497,6 +499,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  							  ll_block);
>  		ll_region->sz =3D ll_block->sz;
> =20
> +		if (!dt_block->sz)
> +			continue;
> +
>  		dt_region->vaddr.io =3D pcim_iomap_table(pdev)[dt_block->bar];
>  		if (!dt_region->vaddr.io)
>  			return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this error path in
dw_edma_pcie_probe() leak IRQ resources?

The probe function successfully allocates vectors via pci_alloc_irq_vectors=
()
earlier in the execution, but if this dt_region mapping fails, the function
returns -ENOMEM directly without calling pci_free_irq_vectors().=20

Failing to free IRQ resources can exhaust system IRQ capacity and prevent
future allocations. The same pattern appears to exist in the read channel
mapping loop and the final dw_edma_probe() error paths. Should there be a
common error handling label to properly clean up the allocated IRQ vectors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D12
