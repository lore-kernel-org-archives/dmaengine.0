Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304740DB4F
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797887; cv=none; b=nxB/Dcfwdu5balf5XtIkQuEhntg6lBmVO1maBdybzvIWF/BPD7Pa0CRSDAGrjKecNDvsAi7pRDgzcKWJMukxDZ7l8sZEJ4eEOFjWte/D5NypFYQZ8gg5LZ0EF85SP2KvPqTKi9GDi0bfpM6KWK8y3pxTn7c4ORmZWoVgT+XJYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797887; c=relaxed/simple;
	bh=C7+BPxpKyepLQEJ2hl6KeWqpyPXVGLekO+Ckrk8nz3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lo87TzaUUDeb9W8PP1PpwYgeTJvwgu8zAh/AHRgqFdAAa/4UDM5g6Ugyh6JjzpGDVs3aRDRJ5PLleGITzt2FZZ9bLujJZHSSUqOM2Qcxh+JCi74qdyG+c5Zd971WXbFDUpy0fK8cgvvSENSlV67ui5YKEHenvvkHSFXavIY3hIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVmHyFee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVmHyFee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2151F000E9;
	Thu, 23 Jul 2026 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797885;
	bh=hDiB1YHc7LNafuceS003k8XhmWCelGFZto4Svn2hoBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nVmHyFeewBguFRe79rED0MfbYTNR9JgJIRIdufOcMz8wvz6Jv8Bi1UoT02zwIsp12
	 14yEKf4eBqyYz/LmuorD/sxQPQ+4j65gUO4OXLUYP9JTA/vlv03cmLpCcr6nGQfBBq
	 ZwcNbuMOLsXe5xZSYBbyZtpwbIzHk5Oo3qWIm/XYWRK8mqknAYw618ci4uhPqI9lPs
	 AtkPmshVHw0CoUCnarG6LYOJ3HmXSQrDfzqbsMbLTpaYRfgNGjK/EVbUvg1IrNE+JG
	 gCteB5dCK1iQp7/uqsdEQ1q2mOo69UWT34+1AtKrb3+1WE4GBirY89oTITsr4i8d4+
	 6N3/zZQifffxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/19] dmaengine: dw-edma: Add engine reset and
 enable operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723084150.521366-16-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-16-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:11:24 +0000
Message-Id: <20260723091125.2A2151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dw_edma_v0_core_engine_reset() fails to handle HDMA compatibility =
mode, unconditionally accessing the unimplemented ENGINE_EN register and fa=
iling to properly stop channels.
--

--- Patch [15]: [PATCH v2 15/19] dmaengine: dw-edma: Add engine reset and e=
nable operations ---
commit 480649ecac905454f1c85b3804e44856e4e73d24
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add engine reset and enable operations

This commit adds separate engine_reset and engine_enable operations to allow
rebuilding LL channel contexts while the engine is disabled. Reset clears
ENGINE_EN and waits for it to read back zero, while enable restores the
direction and handles HDMA compatibility mode.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c

[ ... ]

> @@ -220,6 +220,65 @@ static int dw_edma_v0_core_engine_disable(struct dw_=
edma *dw,

[ ... ]

> +static bool dw_edma_v0_core_engine_reset(struct dw_edma *dw,
> +					 enum dw_edma_dir dir)
> +{
> +	/*
> +	 * The databook says clearing ENGINE_EN resets the DMA logic while
> +	 * preserving configuration registers, but does not document drain
> +	 * semantics. On the tested integration, ENGINE_EN read back as zero
> +	 * only after outstanding transactions appeared to drain; the stalled
> +	 * channel then resumed after reset.
> +	 *
> +	 * If ENGINE_EN does not clear, do not re-enable the engine. On the
> +	 * tested integration, re-enabling after such a timeout wedged the
> +	 * controller and also blocked inbound BAR accesses. Return failure so
> +	 * the caller can keep channels gated and retry.
> +	 */
> +	if (dw_edma_v0_core_engine_disable(dw, dir)) {

[Severity: High]
Does this function need to handle HDMA compatibility mode similarly to how
it is handled in dw_edma_v0_core_engine_enable() and=20
dw_edma_v0_core_dir_off()?

Since dw_edma_v0_core_engine_disable() unconditionally accesses the
ENGINE_EN register, wouldn't calling this in EDMA_MF_HDMA_COMPAT mode cause
a 200ms timeout in read_poll_timeout() since that register isn't=20
implemented?

As noted in the driver comments, failing to clear this register might wedge
the controller and block inbound PCIe BAR accesses. Could this regression be
avoided by bypassing or handling the disable step correctly when in HDMA=20
mode?

> +		dw_edma_v0_core_engine_dump(dw, dir);
> +		return false;
> +	}
> +
> +	/* Discard interrupt status belonging to the contexts being reset. */
> +	SET_RW_32(dw, dir, int_clear,
> +		  EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D15
