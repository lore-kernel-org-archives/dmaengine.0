Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B544C513
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140621; cv=none; b=a8U/uDYb/AJjF4ejOeR0C06cYdI//Hs5BJdAqqSyRmYtf/mIQjMWW0dFSenshEy85TjbLgBAe+iTMmYei/YmcGR2A6tEHRMZ1FywgN9PyGe1niuQbGUT91P1N/Mx3pdcgUx4bE0WXhlwZ92YNITy34p0uAWrNFLD1ubB5mMejEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140621; c=relaxed/simple;
	bh=GXEi3xpxU5y74AzuvKPEHecNo0+NQTkzi7oYYF8MiZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JxH04GyWREcZrq0HGfpgpkNz6ZRvNgfcV/XJW3muigrkWJlbojjBWPEJKmKr5DQxGUsjs99eJ2JMKXf0eyhCtz0VtJBixk633FGxhQQ6zf1zqXPEd4VY3nkNkxA9668vqpq9F5TpgkY7tBH+LKN/g6UdxK7JQAvYfPhrOfNRwyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdEdUAh9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdEdUAh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689001F000E9;
	Wed, 19 Aug 2026 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787140619;
	bh=8yKTBcLFnBYh3nuvaQfS5482RkUJQl45M/d1Pxx/rkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XdEdUAh9zH2HuPBIbc0ctFlsQ7kY5a3gZHg3DU3zUzM0D2a13Vfp8tQzHS94NEokR
	 tLLjk6/74hcVM+TPeAWJA3ysdHMkKhbHyVkxBe0kEeOU9FFnGWUb4JpfvONA6sPvWD
	 GdJr7XfSQWVnrMtPD90ENyb2aFg89Kx1op7dvDRvb1JGfg+EBmhx79PI6sZnbSeuzR
	 5eQsBz+SO0KtlIStvYjqd4k1O79wsABxnEYuT8b2g1Ou7fA9V8nQ6myU3hVJ41uwye
	 1dOaZ1vswsroYSQtPQL9+BCGNtrLCOC1FUpTifPUcQk+5L4Ay2bL7wozzlsHLsR2G+
	 6q+PFr3L2zwQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: qcom: gpi: Fix resource leaks as part of
 channel clean up
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
References: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 11:56:58 +0000
Message-Id: <20260819115659.689001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Inconsistent software state after channel rollback causes duplic=
ate shutdown commands and timeouts during client teardown.

Pre-existing issues:
- [Critical] gpi_free_chan_resources() unconditionally frees ev_ring, causi=
ng a double-free crash when an initialization failure occurs.
- [Critical] Hardware event ring is not deallocated in the gpi_ch_init() er=
ror path, causing a permanent DMA Use-After-Free.
- [High] Event processing tasklet is not killed before freeing ev_ring in t=
he error path, leading to a Use-After-Free.
--

--- Patch [1]: [PATCH v3] dmaengine: qcom: gpi: Fix resource leaks as part =
of channel clean up ---
commit f50a0a6a0fc075e17ad27e65c7651c6aa5bb6a12
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

dmaengine: qcom: gpi: Fix resource leaks as part of channel clean up

This commit fixes the gpi_ch_init() and gpi_alloc_chan_resources() error
handling paths to properly iterate over the sibling channels, release
the ch_ring when channel initialization fails, and restore the event ring
state after freeing the ring.

Link: https://patch.msgid.link/20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.q=
ualcomm.com

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..c41bfac65ddf3 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[ ... ]

> @@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
>  error_start_chan:
>  	for (i =3D i - 1; i >=3D 0; i--) {
>  		gpi_stop_chan(&gpii->gchan[i]);
> -		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
> +		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
>  	}

[Severity: Medium]
Does this sequence leave the sibling channel's software state inconsistent?

When gpi_start_chan() fails for the second channel, this loop correctly
rolls back the sibling channel in hardware by sending the STOP, RESET, and
DE_ALLOC commands.

However, it appears to leave the sibling's pm_state as ACTIVE_STATE.
During client teardown, gpi_free_chan_resources() observes ACTIVE_STATE
and incorrectly re-issues these commands to the hardware:

gpi_free_chan_resources() {
    ...
    if (cur_state =3D=3D ACTIVE_STATE) {
        ...
        gpi_send_cmd(gpii, gchan, GPI_CH_CMD_STOP);
    }
}

Because the hardware is already deallocated, do the commands time out
in wait_for_completion_timeout() and cause a blocking delay regression?

>  	i =3D 2;
>  error_alloc_chan:
>  	for (i =3D i - 1; i >=3D 0; i--)
> -		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
> +		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
>  error_alloc_ev_ring:
>  	gpi_disable_interrupts(gpii);

[Severity: High]
This is a pre-existing issue, but does this error path need to kill the
event processing tasklet before proceeding to free the ring?

If an error occurs after gpi_alloc_ev_chan() succeeds, a hardware
interrupt could fire and schedule ev_task. A concurrently executing
tasklet might read from the freed ev_ring DMA memory before pm_state is
updated.=20

Would calling tasklet_kill(&gpii->ev_task) before freeing the ring prevent
this regression where memory is used after being freed?

>  error_config_int:
>  	gpi_free_ring(&gpii->ev_ring, gpii);
> +	write_lock_irq(&gpii->pm_lock);
> +	gpii->pm_state =3D DISABLE_STATE;
> +	write_unlock_irq(&gpii->pm_lock);

[Severity: Critical]
This is a pre-existing issue, but is the hardware event ring deallocated
before we free its memory here?

If the error path frees ev_ring without sending the GPI_EV_CMD_DEALLOC
command, the hardware might continue writing events to the freed memory.

Additionally, does setting pm_state to DISABLE_STATE bypass the fallback
cleanup in gpi_free_chan_resources()?

gpi_free_chan_resources() {
    ...
    if (cur_state =3D=3D ACTIVE_STATE)
        gpi_send_cmd(gpii, NULL, GPI_EV_CMD_DEALLOC);
}

By forcing the state to DISABLE_STATE, it seems the fallback DEALLOC
is prevented when the sibling channel is cleaned up, potentially making what
was previously a race window into a permanent regression of the event ring.

[Severity: Critical]
This is another pre-existing issue, but does freeing the event ring here
cause a regression by freeing the resource twice later?

When gpi_free_ring() is called, it zeroes the ring structure:

gpi_free_ring() {
    dma_free_coherent(...);
    memset(ring, 0, sizeof(*ring));
}

Later, when the client handles the probe failure and releases the
previously initialized sibling channel, gpi_free_chan_resources()
observes no remaining active channels and unconditionally executes:

    gpi_free_ring(&gpii->ev_ring, gpii);

Since the ring properties are now 0 and NULL, does this cause the dma layer
to attempt to free an invalid page?

>  exit_gpi_init:
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-gpi_bug_fi=
x-v3-1-4c97333e6f5b@oss.qualcomm.com?part=3D1
