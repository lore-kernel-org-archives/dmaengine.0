Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846EB357CEB
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616340; cv=none; b=kU4wBJtLt8X15ZYWGeBlnOtQ3LmvkNrcDI8/JgOs0qfme6T4CvjGk7Gr6jm7+HmT74vCXv28U5HNz0G6C1NoQLl4fZZ+1vNILnitd04NGkTcLwcsZjbRh2RZXgBMlzL9t3bBdgHODcB8ChyNOQv+eLY//lkopokB0IshTytldls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616340; c=relaxed/simple;
	bh=kgmrpkaawGPWLvpEO5jG3CYdRwkvk/nJZWsX4ITBtE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZmzRTUY1eYKMJx4Yj/8CyrW3Zow/zd8x855R8X8XipEhE2S7m54UxCTw+R0agSh4jIpAmMPuKIKI2NnvElZKq/6w+QUMX7QxHTkyxH+nA7MHKfi28m9r6QtNRKdITwWOrAkhPFT5kyR6kyQByrmR8tcMbC69XoK6/Nloc0Izzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzMnHf0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzMnHf0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6581F000E9;
	Tue, 21 Jul 2026 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616339;
	bh=f4rfS+kzSrXZx85O+DrYRWscDbG7oq2ij9wGZvxJqvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SzMnHf0Zs8+wFKZL6/ner7Xv8QTTuaNFs9G2gwr851lGi1NDUn9eQOar2+JhRqK70
	 ILwufJ3fwUvlSYLSlcnNA3pYiOof6Uuv5D9PsKPQ2JFKEQvrumnOZ1WKuCurHxFt78
	 xLKijskSbgM3svCKutSDuz6Mqsmr3uLRHNmRksw/5Xn5fpk5XM69ghTSudUlA8f2vN
	 zeuJBQnYUcWz3y5EjnccUMWlKrDVO8AmIor2VBHCVr0u7c+/uh+rYdhDQvCPke+5ko
	 G3hkHFijfgrgjfmWCnCl1mvg7spQXxGWd1kOawSb11X2TCVd2MG7lAqpJBeHanwERY
	 T20NYAs+zS7ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/14] dmaengine: dw-edma: Initialize IRQ data before
 requesting IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260721062815.4117887-5-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
 <20260721062815.4117887-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:45:38 +0000
Message-Id: <20260721064538.DF6581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA device is unregistered after its underlying resources (IRQ=
s and workqueue) are destroyed, which violates teardown symmetry and risks =
use-after-free.
--

--- Patch [4]: [PATCH v6 04/14] dmaengine: dw-edma: Initialize IRQ data bef=
ore requesting IRQs ---
commit 987fcaf0e4c8b1c734032a25584db5da396d1c81
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Initialize IRQ data before requesting IRQs

This patch addresses a potential NULL pointer dereference in
dw_edma_irq_request(). It initializes the back pointer of dw_edma_irq
before calling request_irq(), ensuring that shared interrupts have access
to it.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 3a8610862cff5..ee9a8c32adf4c 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does dw_edma_remove() have a teardown
asymmetry that could lead to a use-after-free?

Looking at dw_edma_remove() in drivers/dma/dw-edma/dw-edma-core.c:

	/* Disable eDMA */
	dw_edma_core_off(dw);

	/* Free irqs */
	for (i =3D (dw->nr_irqs - 1); i >=3D 0; i--)
		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);

[ ... ]

	destroy_workqueue(dw->wq);

	/* Deregister eDMA device */
	dma_async_device_unregister(&dw->dma);

The DMA device is unregistered after its underlying resources (IRQs and
workqueue) are destroyed.

If a concurrent client requests and interacts with a DMA channel via
dma_request_chan() during module unload or device unbind, could it
access a device that has already had its hardware turned off and interrupts
freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721062815.4117=
887-1-den@valinux.co.jp?part=3D4
