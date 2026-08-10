Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6ED431E73
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386440; cv=none; b=qOAivVCuMiNbrtPiJj2GLMHoel/KECXIj4ZiHhqgk4eakYvXngxKF+pxq0sdiVyN9KeBgXTzZiK5hh4eejhxwlLxXw9gZd7+eZKWBYCLZBQc5j5ofm/bABaethRjbE/qibvNo54nSho+QDLETSGg/J7czSQdJkxdYDCUUxFVOkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386440; c=relaxed/simple;
	bh=TxE7/jR4LVQogNcXYvAb2FgrBigLBqbggDW0bJXnp30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YPCfOXF+8vSyhKOR0iSWgzdX8Qvkbm5pq02eHNVSt3c0UBvcz4JO+HE5M63Eu53acFZoGL/N7+Y9UC9iEfC6JUZ9NkDpC0b4yfrkuwlza6onjYRDbNrdMaKRA56petCkQk+jmDry/g0z6Byfdy2WrjV3Osla2p0A71UQWaXbx0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU0sqJ0v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU0sqJ0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BF61F00A3A;
	Mon, 10 Aug 2026 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386438;
	bh=cjnxoMrj81pXugt0pfPrP48nv2Z31W9xBlau2LvyLdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AU0sqJ0vBWJTo4L3l/DjGLD/jnhfk8og+F0kHIU0YdEAXiq8IEEB7nZ43z4UOv2x/
	 +UMfhu62grv5foWvIHUzLDpxUEZ8eANFzmOzDSArGI+0oHUExtcmovsqgU4U9Rb49S
	 tkKerI0Oc90wYS0gmSNvUJCeS+jR5gvVZ+Appia6sa+1uvs9EDbDc/DhIQ3hDVIvLp
	 vhOvfq5jB8vmvuuVy1ToFnIUQnFUo9Biap3SDfq1NN5zHW6+14Z52MRdRqJUhKymtP
	 iktnxoCGO+MUyGYJB1TgLsNQwEESoQg9Zggg3ItVHMRQ16PYhD/NJl8u5NSkV6rnW4
	 PQtNrI3V5KP1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/34] dmaengine: ioat: convert cleanup tasklet to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <00e0c9c2fea2a0b00a2f3a91bcea240c6021648a.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <00e0c9c2fea2a0b00a2f3a91bcea240c6021648a.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:27:17 +0000
Message-Id: <20260810182718.33BF61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The channel timer can be inadvertently re-armed during the teardow=
n sequence in `ioat_stop()`, leading to a use-after-free when the timer fir=
es after the channel resources are freed.
--

--- Patch [9]: [PATCH v3 09/34] dmaengine: ioat: convert cleanup tasklet to=
 dmaengine BH ---
commit a9e2b8b1c21fd37939157d4bfd1e3ccc9c58d182
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: ioat: convert cleanup tasklet to dmaengine BH
   =20
This commit replaces the per-channel tasklet with the shared dmaengine
BH helper. The handler continues to run in softirq context while dmaengine
owns the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
> --- a/drivers/dma/ioat/dma.c
> +++ b/drivers/dma/ioat/dma.c

[ ... ]

> @@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
>  	/* flush inflight timers */
>  	timer_delete_sync(&ioat_chan->timer);
> =20
> -	/* flush inflight tasklet runs */
> -	tasklet_kill(&ioat_chan->cleanup_task);
> +	/* flush inflight BH runs */
> +	dmaengine_kill_bh(&ioat_chan->dma_chan);
> =20
>  	/* final cleanup now that everything is quiesced and can't re-arm */
> -	ioat_cleanup_event(&ioat_chan->cleanup_task);
> +	ioat_cleanup_event(&ioat_chan->dma_chan);

[Severity: High]
This is a pre-existing issue, but can this teardown sequence result in a
use-after-free by inadvertently re-arming the timer?

In ioat_stop(), we use timer_delete_sync() to stop the timer. However,
we then manually call ioat_cleanup_event(), which eventually reaches
ioat_cleanup_preamble(). If there are hardware completions pending, it
will unconditionally re-arm the timer:

ioat_stop()
  ioat_cleanup_event()
    ioat_cleanup()
      ioat_cleanup_preamble() {
        ...
        clear_bit(IOAT_COMPLETION_ACK, &ioat_chan->state);
        mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);
        ...
      }

Since timer_delete_sync() doesn't permanently prevent re-arming, the
timer could be re-armed here right before the device is torn down and
ioat_chan is freed.

Should this code use timer_shutdown_sync() instead to permanently
deactivate the timer and prevent mod_timer() from succeeding during
this final cleanup phase?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D9
