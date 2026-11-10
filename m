Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334125;
	b=Mq1S8OuJnYlj2TGFDfMoFwJDcT46t3rD2p8yLuivd0N4ayM4acpXyjz1gS0oYbmovOFb
	 KRLBMji2Cqm8EfWR/RhIJB8nSb8sD9a7l6ngl0RClSlUbj/oLMNX9LILm+Vf+Q/tas2cM
	 8TEJ+jFBwci19Mts0oBLPJTj1g5Z6ZsA1KA2cTWPCLUdvPwyFURiF09bWVAQt93eIzL+M
	 oaE7Xq5xYpMqlsxXubR8Z6c4q7ZKXxkAzq1LYOmle5tcW5nP5XApx6X/0PNig/s/P+Myt
	 TTTo/f8FXdKDsttCy86PquwxNA73XCY05c6UfCr7Fpl2iq0AaHLyAFE34O348U9PN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334125;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y/PQ/SG3AaQstxkr+UhC80a+XVuOZ3RXbh2bbnv0BhU=;
	b=eyA1T62tXtRrjET26FaddNQdnQn2ppok6gxPK11HetVgfxol/aOY7X/C3iUYgYKyazfo
	 KDALRJ+OA7ngK/gwQDT7jfghX5GoDWILdCrwIEessYDVTWboY2108UEqZB3rhJra38Alq
	 FbuPT++PyaIf/qmEXIz9O4vXT0rcK3mytH90+MPu762HcnVbhqCeRqaAWKj0Yscld9NP3
	 uKVTBuGvKyuXnEF+CPhMrawVjtMHO8m4DZn4O295bNwaUSCwUVbkYmUgyfJ8j3JP2efPm
	 h96Y9stFLEs8uZkiYC93wDdDYLYPbkuXAqXkrdL8Ymvg0EzE99r0OPUG6UydHYqwojg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAu536Wk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5761D606A326
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAu536Wk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB821F0089F;
	Tue, 10 Nov 2026 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794334124;
	bh=y/PQ/SG3AaQstxkr+UhC80a+XVuOZ3RXbh2bbnv0BhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MAu536Wkqz5s41wNqAYwpWrPSfVkm84G63dZmmO7LT0uQ+Qlhy/vHqsvuqpH1O3g8
	 naiyehioR8cI3WmavYpfssNzrrLDfHpSUNLx3DWqrgnWV8ls4jHE/0CERAbUd6zYk2
	 MdABxIUQogKIk/vm/i0mmOSWZF/JXTqtbLsMwz8jymNJ9JthQEHdu2Z6VAQDXz2lY9
	 bB0rbtki/EPG/P8ftOInk1ehGSBAPz7Va2i7WLbIpkRBkPuBLvYKXWneQQBHBIO0Ug
	 mTfE6EIOau8VKvwyzIaITeCxzf1+4/5cAxHWy508lhbR+Jpfp6WTANKSHeX3SmeaN/
	 2tS2VCWn67ABw==
Message-ID: <sashiko-outbox-207559@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] dmaengine: plx_dma: add dma_rmb() after
 observing write-back status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110173927.624629-5-logang@deltatee.com>
References: <20261110173927.624629-1-logang@deltatee.com>
 <20261110173927.624629-5-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:08:44 +0000
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
- [Low] dmaengine: plx_dma: missing Fixes trailer in
  plx_dma_process_desc()
--

commit 201d751ec8320e51bb4d2cc4d33f8ffc4f32e196
Author: Logan Gunthorpe <logang@deltatee.com>

> dmaengine: plx_dma: add dma_rmb() after observing write-back status
>
> Completing a descriptor involves two loads that must be ordered:
>
> 1. Reading desc->hw->flags_and_size and checking that VALID is clear.
> 2. Reading the destination buffer, which may happen in:
>    a. dma_unmap_page() via dmaengine_unmap(), when a bounce buffer
>       is in use.
>    b. The client's callback, or its processing after polling with
>       tx_status().
>
> On a weakly ordered CPU like arm64, nothing forces load 2 to happen
> after load 1, even though load 2 is only reached when load 1 says the
> transfer is done. The CPU can predict that the VALID check won't
> break out of the loop and issue load 2 early. If the device hadn't
> finished writing at that moment, load 2 returns stale data, and when
> load 1 then confirms the prediction nothing is redone, so the stale
> data is used. This is the load-load control dependency case described
> in Documentation/memory-barriers.txt.
>
> Add a dma_rmb() after the status check so loads after it can't be
> satisfied before the status read.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.=
kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

[Severity: Low]
Since this fixes an ordering bug in plx_dma_process_desc(), should the
commit message include a Fixes tag?

  Fixes: c2dbcaa8c672 ("dmaengine: plx-dma: Implement hardware initializati=
on and cleanup")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173927.6246=
29-1-logang@deltatee.com?part=3D4
