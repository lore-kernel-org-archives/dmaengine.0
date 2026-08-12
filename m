Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C83A48165C
	for <dmaengine@vger.kernel.org>; Wed, 12 Aug 2026 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786551251; cv=none; b=b6zL0btqDyd1acDIiUf0nI/gNw5xPFwSLxVGDNNdavZm9D7X3det7c85ArJzmEcXMDBDsZR6cDk6bnwaKXu6oH1utQHbRf8XATOEhRxYByi2P1H8kysBEl60F4aECZN8bkkKoozHRgrfoLZ6blclP5NeiWvIOJoKtYpuLrX50p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786551251; c=relaxed/simple;
	bh=tdnbQWGuOv6ASsV761RGJQfneBZRqqHlvh0Mel+DiTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nBeW1VIiYAqPyrvn1DUShKOlBBS0uZEqW3nG90adeYSh9ni8XnIfsB/iRg1W9Hhx/BVe7IVhOuC5xHC94ylG8F+x0r/sDGC/2OsgOLhOpWk8SnqZQ0+PqyCiUdofujJ+BrblMDht8dCNVnA9qJcTMYw3NtiuF7qcYxP/CWNd4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHhcQBCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHhcQBCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD751F000E9;
	Wed, 12 Aug 2026 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786551249;
	bh=nyw8exlQgGB+i2xUtDt7DV/ErJC/9OMQajCZz9aRz6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHhcQBCOMSk6gebPKR1vAGwo3KEZT30Ya+tLiMC0EajT02STXO332inhLwstYGkA/
	 9ZZ9WDnq8iq6I5KrnnkopB2M4Cb4EKpMIqFLHr+YH4VKsqiw/nrto9JvGsbbUwqCjr
	 7wMWF3jpvmxinjnVhgXOQIB0chkXGKiB+GxlnWrE+77RRYtUIpDWkerLPDmEE2Vryj
	 Vzs5bBlg3qEuq7rZq10KtRMRHuDPEBYYYzUfCuofmIk6xHcPS3yAhJsDXNWL7Xj+JH
	 gsmIAKBqyJsmQ7yNLOs+ZrkiDFFeG1TOD0jLNYRW3E4QrWGu6IbWPSoM3Yw02l0ZOF
	 plsXrKOkWI65A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/24] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260812155721.2807506-5-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 16:14:08 +0000
Message-Id: <20260812161409.5CD751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver now outright rejects DMA descriptors that exceed the ha=
rdware linked-list (LL) ring capacity, breaking support for large scatter-g=
ather (SG) lists.
--

--- Patch [4]: [PATCH v5 04/24] dmaengine: dw-edma: Make DMA link list work=
 as a circular buffer ---
commit 4de65eea41cbb28142107d984aea6044ff700244
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Make DMA link list work as a circular buffer

This commit converts the DMA linked list to operate as a circular ring buff=
er
instead of rebuilding the entire list for every transfer. It also adds logic
to clear control words before first use and rejects descriptor requests that
exceed the usable ring capacity.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index a6bb68ffdfe26..1af262b6e881e 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t =
nburst)
>  {
>  	struct dw_edma_desc *desc;
> =20
> +	/*
> +	 * For now, a descriptor that does not fit would stall the channel
> +	 * forever: reject it up front.
> +	 */
> +	if (!chan->non_ll && nburst > chan->ll_max - 1)
> +		return NULL;

[Severity: High]
Does this cause a functional regression for DMA clients submitting large
scatter-gather lists?

Previously, large transfers were handled by chunking them into batches and
restarting the channel on each completion interrupt. By transitioning to a
circular buffer and returning NULL for descriptors that exceed the usable r=
ing
capacity outright, dmaengine_prep_slave_sg() will now fail for those client=
s.

Since the commit message notes this rejection is in place "until reclaim
support lands," will this break existing users who depend on handling large=
 SG
lists in the meantime?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812155721.2807=
506-1-den@valinux.co.jp?part=3D4
