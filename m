Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF03B0596
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337344; cv=none; b=UYTX1/MXBIJ/bZsYefiV1AVwtUXkUKyAIRM0VAvP4vuYM8RBGQgMUSETYVgTK7ESpLbNIVQsb8adzhQpcivdJgBCTy36dkRBas88CHQcxf9ni4C85c2AJsYBS01wRdItGkrpS0coOcNtqCOCkwCU2c/4/Cfst4hptJ8AXja/yWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337344; c=relaxed/simple;
	bh=u3vtE1AYJGM5BCWTbaAd5CemUXi6PT6Qafk/GJoo/tA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CHao2jqmjt4cI6KejUulKHsPOP8/XIkXIy7/iaJcEplyVLemaiZ4bW5mi8gDvt49XjJxIBnNkGr23hl1PE30kzfNHxo2V2nV3m5zxLXyczeYu1acUiHjANIqOXogzwjd3vy8FnE81We+keqttIZ6Hts6ihyIqBRrm4UzZyrTCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUXBtOWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUXBtOWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5F31F000E9;
	Wed, 29 Jul 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785337343;
	bh=2SWIsVe0/Q5o+0PiUPhrs/636jzL6CLe8r0kuLsLox4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FUXBtOWNKxP6SgVZAh5pmwk1pHOR8rarCifyoqyQnSHgIOC7eoK1QoYifiWpKWMgW
	 wdWx4hpfNg0kNKlbrw31PQwyfImmIhgc6LODl/lYeN5qWcmyMoTLALIOak76ExD+qY
	 XvbGXhOgSDjvxY6NFmbX74Z2V5ChFRCl3sl3QRdJo3ZW+OO8RsqQFrChazsuoD2AWa
	 mqPVIN6OUqDMSs72bg3msP32r/aM1GXE9ce0JNRJIbA2lQmO4RtTo/BxYydRZKGWB3
	 cNoeJHKCohlQk0GcKeTf7G617OrqvogZfC+WWYp4WPbcC1elnmhBPNQY2aF72VmKGM
	 nt+DqlyHnG2rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 22/24] dmaengine: dw-edma: Add engine recovery
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260729143036.3087722-23-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-23-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:02:22 +0000
Message-Id: <20260729150222.BB5F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware engine is left permanently disabled if a stalled transfer=
 completes spontaneously during the engine_reset retry loop.
--

--- Patch [22]: [PATCH v4 22/24] dmaengine: dw-edma: Add engine recovery in=
frastructure ---
commit d5fd1986862b1ea5049e2ba48c784328b9d2d605
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add engine recovery infrastructure

This commit introduces an engine recovery worker for eDMA to coordinate
resets across all channels in a given direction when a transfer stalls.
It gates channels, attempts to quiesce active LL channels, resets the
engine, and rebuilds LL contexts before re-enabling the direction.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index cbe60bcd4c9a0..616b0658b1ef3 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -785,6 +809,283 @@ static void dw_edma_ll_recheck_work(struct work_str=
uct *work)
[ ... ]
> +static void dw_edma_engine_recovery_work(struct work_struct *work)
> +{
> +	struct dw_edma_engine_recovery *rec =3D
> +		container_of(to_delayed_work(work),
> +			     struct dw_edma_engine_recovery, work);
> +	struct dw_edma *dw =3D rec->dw;
[ ... ]
> +	if (unlikely(READ_ONCE(dw->teardown)))
> +		return;
> +
> +	if (!dw_edma_engine_recovery_needed(rec)) {
> +		if (READ_ONCE(rec->active))
> +			dw_edma_engine_recovery_release(rec);
> +		return;
> +	}

[Severity: High]
Could the hardware engine be left permanently disabled if a stalled transfer
completes spontaneously during the engine_reset retry loop?

If dw->core->engine_reset() fails later in this worker, it disables the
engine by writing 0 to ENGINE_EN but may time out waiting for it to read
back as 0. This returns false and queues a retry.

If the hardware unsticks before that retry executes, the next call to
dw_edma_engine_recovery_needed(rec) will evaluate to false. This triggers
the early exit path above, calling dw_edma_engine_recovery_release().

While dw_edma_engine_recovery_release() ungates the channels, it never
calls dw->core->engine_enable(). Because ENGINE_EN was previously written
to 0 during the failed reset attempt, does this mean the engine remains
stopped and will drop all future transfers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D22
