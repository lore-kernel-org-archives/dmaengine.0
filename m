Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277B4503E4;
	Mon,  5 Oct 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193574; cv=none; b=bNWTe4ZDQYYz5LpvF7/dOMbWKsEZAGx3ThHveZUdh7tiYfkLP+DVAAaH+BuQzSbmQtDPhfMHvR4r0S/KUFAJ1myuBnNLnNqSXQ07d5r6kGEuTX1fJbs2Iil0fz6lKB5PdNoJMtLg4I1VylLPnW+somP28cs4srAt57RGqL3iy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193574; c=relaxed/simple;
	bh=ul5xBavGUV3BJnrn16M4rueg+VNDwAIkL1Sf7XxwCzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bGOszQ7rryrN1oopslgPJVt6dvPeEeR4cifPfEmbCGrWLALcFyusYxtEoeSn04v5Bi4fj44V1KUipGE/Zfa3aB06A8r0Nc8/7NVp7Q2Z1lkqrXV/CZDzSGjkvWhp3BMfHzvxgJ4xWTTXdaO6EhfHsF1dZwTxp8ww9a4fkNfDmgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hd8pP30f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hd8pP30f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172221F000FF;
	Mon,  5 Oct 2026 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791193563;
	bh=8QSl6eNFzO5K4AgUcFGaHmDMwJIdFkwlEYyxJaykHaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hd8pP30flTFxoQOj4lpMx++eeLlT9guk4G7V+rjdLco1yKIPGjAMouz1QJudtRyHG
	 oQ444dLj2XC+c5tEiL9QB1g4n1afMmKZ61/jejuLY9S+hbbMbL8u7R2S+itVNFTEbn
	 10bUKJ8nKgyCPuWOl9Gc3aMOc78bVk/FW0hlUcxE0zm6QSmTukxddPCXywIU38NHhi
	 0RGFOvYbwVuxePQKSHzPKj6IE2p47WQGqXdiuUiOfj0cCDyeXzwhIksdZdCXHh67sT
	 PZ/lFS6/wyxsFboduliv8kZlT8jb3j+ZNfQGWwYhAiHCL6l7NnWBZQyMGI+hkWiJ5Y
	 NzkmvBegS1Xxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dmaengine: add
 dmaengine_prep_dma_(pq|pq_val|interrupt|xor)() API
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20261005-dmaengine_prep_dma_pq-v3-1-a4a241f26fa7@nxp.com>
References: <20261005-dmaengine_prep_dma_pq-v3-0-a4a241f26fa7@nxp.com>
 <20261005-dmaengine_prep_dma_pq-v3-1-a4a241f26fa7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 09:46:02 +0000
Message-Id: <20261005094603.172221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] doc: incorrect flag names in dmaengine_prep_dma_pq_val() comment
--

commit f5c4a27207edbbbf16dc41d215bb04c300d1dd66
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: add dmaengine_prep_dma_(pq|pq_val|interrupt|xor)() API

This commit adds inline wrappers for several DMA engine preparation
functions to provide a clean public API. It also incorporates proper
pointer checks before accessing the underlying device callbacks.

> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index c3a49a33307c6..6a187136f9493 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h

[ ... ]

> +/**
> + * dmaengine_prep_dma_pq_val - prepare a DMA PQ validation operation
> + * @chan: the channel to use for this operation
> + * @pq: array of two addresses holding existing P and Q parity buffers
> + * @src: array of source buffer addresses
> + * @src_cnt: number of source buffers
> + * @scf: array of scaling coefficients, one per source buffer
> + * @len: length in bytes of each buffer
> + * @pqres: output flags indicating P and/or Q check results (SUM_CHECK_P=
_VALID,
> + *         SUM_CHECK_Q_VALID)

[Severity: Low]
This isn't a bug, but the documentation refers to non-existent constants.
Should this instead reference the correct SUM_CHECK_P_RESULT and
SUM_CHECK_Q_RESULT flags?

> + * @flags: DMA engine flags (e.g. DMA_PREP_INTERRUPT)
> + *
> + * Prepare a PQ validation transaction.  The engine recomputes P and Q f=
rom the

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-dmaengine_=
prep_dma_pq-v3-0-a4a241f26fa7@nxp.com?part=3D1
