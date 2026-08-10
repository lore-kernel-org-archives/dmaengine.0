Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8339BFE7
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345820; cv=none; b=G3nFvmH9i4bjsMo0dNO6p2fh3MFRO+rx+gqp780o4ZfJYwAzxJO0Za7nMFc1k52L0KCcp9S5LmnaUDTcwFpC+N+LwFvh8DMJ/020RWZ1GZfdqR8F6MvX8IwuFtai3i7efNEloXNOmd9znfvSZj0JxJcVw3advrDfH5aG7cemiag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345820; c=relaxed/simple;
	bh=WzBKwYq0SeAM2ewZ4ez5sfIrBSMpxzxdNn+uhA7iMmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tjdK3HuL9igEv8+tVKJ+ZXi9eSYEi5jALcuhE0kF3LQE2jvHQZNpwGO+e4d2Sv/qDB30I5mSGghbOlJLK9Cc++at2iXtVSTntBG9ttdVyZVuQoCpS7FlODbHN3RYKFJq/b3wmLQA/ZFo+dsrUd3Ud2s404LVTdntnOGBRustB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFvEkRvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFvEkRvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC1E1F000E9;
	Mon, 10 Aug 2026 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345818;
	bh=/Rl7jf7CM3N1rAPJXPwY/LtXbJMgzxS6cQl0XpqMiWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LFvEkRvUNdpH4WLNjcs06F5TP9Wv4QPkqg1hAtD8kAd7TVSgoqRDpqiFWA0Xl1tIJ
	 kWhAHt8IsvP3sd4Hno46+eilH6JBa7mddjQvP/UNsMnBY75UQJBscq2uaVHYCjb/Ld
	 b9Hn5ucb6if7rI8idgoNdRUbLiHbOu9LFQ9R+4QUJ3hPRIfgLLpQNtNTC7hKbDNj2A
	 6ATPKHW7khPOoiyHWNfRhRLlSgc+B8CSS32DXBkuoxt82giIIHYVYsFm1plq+5Q9Fx
	 67/1bEzK1FWGqJRK8xTSRvpMwrH/eCsgSvP66ztI9CU++s86k5AWdgvG7G13uKlhVw
	 26W6asTXOE5ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com>
References: <20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:10:17 +0000
Message-Id: <20260810071018.3AC1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Setting `pm_state =3D DISABLE_STATE` actively suppresses the neces=
sary hardware `GPI_EV_CMD_DEALLOC` command, leaking hardware state.

Pre-existing issues:
- [High] `ev_ring` is freed on the `gpi_ch_init()` error path without expli=
citly canceling the event tasklet, leading to a race condition and UAF.
- [High] `gpi_ch_init()` error path destroys hardware state and shared reso=
urces for an already-active channel, leaving the sibling channel silently b=
roken.
- [High] `gpi_issue_pending()` writes to the channel doorbell register with=
out verifying that the hardware `pm_state` is active.
--

--- Patch [1]: [PATCH v2] dmaengine: qcom: gpi: Fix channel cleanup in unwi=
nd path ---
commit 47c71a5c319e41aac4e85d0f59c76a1364b2c273
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

dmaengine: qcom: gpi: Fix channel cleanup in unwind path

This commit attempts to fix three bugs in the gpi_ch_init() error path.
It updates the unwind loops to properly reset and deallocate sibling
channels, restores pm_state to DISABLE_STATE, and frees ch_ring if
initialization fails.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..c41bfac65ddf3 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
>  error_start_chan:
>  	for (i =3D i - 1; i >=3D 0; i--) {
>  		gpi_stop_chan(&gpii->gchan[i]);
> -		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
> +		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
>  	}
>  	i =3D 2;
>  error_alloc_chan:
>  	for (i =3D i - 1; i >=3D 0; i--)
> -		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
> +		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);

[Severity: High]
This is a pre-existing issue, but does this error path destroy hardware sta=
te
for an already-active channel?

gpi_ch_init() initializes both channels when the second channel is allocate=
d.
If the second channel's initialization fails, this error path iterates
backwards, stopping and deallocating both channels and freeing the shared
ev_ring.

Since the first channel's client successfully completed
gpi_alloc_chan_resources() previously, could it remain unaware that its
hardware channel and event ring have just been destroyed?

[Severity: High]
This is also a pre-existing issue, but does this lead to a bus fault or
system stall if the first channel's client submits a transfer after the
sibling channel allocation fails?

If the first channel's client is unaware of the failure and calls
dma_issue_pending(), gpi_issue_pending() will execute:

drivers/dma/qcom/gpi.c:gpi_issue_pending() {
    ...
    gpi_desc->db =3D ch_ring->wp;
    gpi_write_ch_db(gchan, &gchan->ch_ring, gpi_desc->db);
    ...
}

Could this write directly to gchan->ch_cntxt_db_reg without checking if
REG_ACCESS_VALID(gpii->pm_state) is active, accessing unclocked or
deallocated hardware?

>  error_alloc_ev_ring:
>  	gpi_disable_interrupts(gpii);
>  error_config_int:
>  	gpi_free_ring(&gpii->ev_ring, gpii);

[Severity: High]
This is a pre-existing issue, but does this error path create a race condit=
ion
and use-after-free with the event tasklet?

If a channel fails gpi_ch_init(), gpi_disable_interrupts() frees the IRQ but
does not kill scheduled tasklets before gpi_free_ring() frees the memory.

If ev_task is already scheduled, it will bypass the state check because
pm_state remains ACTIVE_STATE during this time:

drivers/dma/qcom/gpi.c:gpi_ev_tasklet() {
    ...
    if (!REG_ACCESS_VALID(gpii->pm_state)) {
    ...
}

Will the tasklet then process events using the freed and zeroed ev_ring?

> +	write_lock_irq(&gpii->pm_lock);
> +	gpii->pm_state =3D DISABLE_STATE;
> +	write_unlock_irq(&gpii->pm_lock);

[Severity: High]
Does this regression actively prevent the necessary hardware GPI_EV_CMD_DEA=
LLOC
command?

If the initialization fails, gpi_free_chan_resources() is called, but it
checks for ACTIVE_STATE before deallocating:

drivers/dma/qcom/gpi.c:gpi_free_chan_resources() {
    ...
    if (cur_state =3D=3D ACTIVE_STATE)
        gpi_send_cmd(gpii, NULL, GPI_EV_CMD_DEALLOC);
    ...
}

Could this leak the hardware state because the hardware is never told to
release the event ring context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-gpi_bug_fi=
x-v2-1-60555394cbf9@oss.qualcomm.com?part=3D1
