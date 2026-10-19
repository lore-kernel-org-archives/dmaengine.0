Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433977;
	b=IR2EYIhlxz+f967UHteZ+u/0NNFu3/OXtGyFgmukK1RkoUK97aeRHsh1iNgNHPSn2yaH
	 6oidpuH0o47BoBxACchYziLTPw0dGVKPco4Noc+bYB+yMOMWr5hbg248LsQa+SG/ZwbIE
	 +qyCGWs774beo4TF4btJQr8R1+2t9rDduF6r6Rwjg5JrXiopbPSrXT1iBon/8mQ/uy9a1
	 abdHghOCHDFYxHrBE41do2O3l+YFQrhmer39+Id9c4fVBZ4etsm2jdRAPEi5CyPm4rwNt
	 xD/f/C5q4vJlNL/y0uyzgxx4IldCZKpKP2NsuYqcWjclT1uMk3NMsBL6OGkBfHHzkZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433977;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ni4+U2KYVLRLANuycLAkCeDcRQMh5AwMN9BRLQ7FqEw=;
	b=K6YM9TIgjJPSxMxHnUPt4ARMkkLGYzZbRKpTORX4DNqwlMbz3wDg5v4nMi5Wrh+QwmWM
	 egR6jGCAImuAQMgw4Egm7jSh9jSyXXW7C/d/oTvshjtnxf8HW5o+b8NM1yUmV8Zby0SvF
	 jbKtJPNxyd6J3CRDayAaSdn8vvSoxfu2vxYJjQ6IIOdBtMcobRg3WiNkwfe+1pdS9+RvG
	 RCz3LjLq9L7Vo3/D6puiTwoPCViATLB1+t8RTcvLloa8x1PGlZIxdFNVl9x7bOPMSW0Gm
	 +wacWytJG7vrjamfNeB/CMpewzbPw74WdaYjaNDM4mP9W/zzPSnmmmN5EzMd8rWmOwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+t0ncx4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2492606A31D
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+t0ncx4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6656C1F000C4;
	Mon, 19 Oct 2026 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792433976;
	bh=Ni4+U2KYVLRLANuycLAkCeDcRQMh5AwMN9BRLQ7FqEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+t0ncx4dw5h0a4epEAugwFA1aZ3l0NKQYbvsuSqurngQ0M7xm5tWq8jcdopHInYU
	 U/w48sWYR/3pUc04MQ3sl8qkgLitiBpMVHgbvfJDR3VN+XFBQEjfvBdu/wZUu4BXLE
	 yRi5rc4SE7Yv4xd8NnJi8T4GwhEpdELcgF6PJMiPzNl7iER14dbloeVAISbEOFLziB
	 c0MlVk9nVtNjSa9tT5IEQWDaHF59roekS0/kahRQnZWIgA8XDfhzP8cyhBVYDopTgJ
	 1bZT/fA5CPAr7ckltbQz9G4IA0nh1Uz5PBNVr1LnC748ViS7HpzXwFo16Tgkb5Qj0G
	 0sNb5sUeupUaA==
Message-ID: <sashiko-outbox-178068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/17] dmaengine: idxd: hold device commands off while
 the reset re-creates its interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-13-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-13-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:19:35 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: idxd: idxd_cmd_reset_state() clears hold in idxd_cmd_ho=
ld()
- [Medium] dmaengine: idxd: idxd_cmd_hold() skips hold when IDXD_FLAG_CMD_T=
IMEDOUT is set
--

commit adf023de4cde0518acad5bf473d3a62f589687fb
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: hold device commands off while the reset re-creates its in=
terrupts

This commit introduces idxd_cmd_hold() and idxd_cmd_unhold() to wait for
any running device command and hold IDXD_FLAG_CMD_RUNNING across the
interrupt teardown and re-setup window in idxd_pci_probe_alloc() during
reset recovery.

> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index d3b95593a6867..222c201669bdd 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -724,6 +724,50 @@ void idxd_cmd_reset_state(struct idxd_device *idxd)
>  	spin_unlock_irqrestore(&idxd->cmd_lock, flags);
>  }
> =20
> +/*
> + * Hold device commands off while the re-probe after a reset frees the
> + * interrupts and requests them again. A command whose completion
> + * interrupt comes while the misc vector is gone is never completed, and
> + * its owner would time out and fence the device that was just reset.
> + * The running command, if any, is waited for first: its owner gives up
> + * within its timeout, and the misc vector still takes its interrupt.
> + * RUNNING is then held without an owner, and new commands wait for it
> + * as for any running command. Returns false, holding nothing, when a
> + * command timed out, since commands then fail fast anyway.
> + */
> +bool idxd_cmd_hold(struct idxd_device *idxd, u32 *seq)
> +{
> +	bool held =3D false;
> +
> +	spin_lock_irq(&idxd->cmd_lock);
> +	wait_event_lock_irq(idxd->cmd_waitq,
> +			    !test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags) ||
> +			    test_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags),
> +			    idxd->cmd_lock);
> +	if (!test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags)) {
> +		__set_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
> +		*seq =3D ++idxd->cmd_seq;
> +		held =3D true;
> +	}

[Severity: Medium]
What happens in idxd_cmd_hold() if IDXD_FLAG_CMD_TIMEDOUT is set when
wait_event_lock_irq() returns?

When a command times out in idxd_cmd_exec(), IDXD_FLAG_CMD_RUNNING remains
set alongside IDXD_FLAG_CMD_TIMEDOUT. Because IDXD_FLAG_CMD_RUNNING is still
set, idxd_cmd_hold() skips setting held =3D true and returns false, and
idxd_pci_probe_alloc() proceeds to tear down and re-create interrupts
without a hold.

In idxd_cleanup_interrupts(), idxd_mask_error_interrupts() only masks error
interrupts in GENCTRL and does not mask IDXD_INTC_CMD. If a late command
completion interrupt arrives in idxd_misc_thread() before free_irq()
finishes (or if idxd_cmd_reset_state() runs concurrently):

drivers/dma/idxd/irq.c:idxd_misc_thread() {
    ...
		} else if (test_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags)) {
			__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
			clear_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags);
			wake_up(&idxd->cmd_waitq);
			dev_warn(dev, "a timed-out device command completed late\n");
		}
    ...
}

Wouldn't this clear both IDXD_FLAG_CMD_RUNNING and IDXD_FLAG_CMD_TIMEDOUT
and wake idxd->cmd_waitq while the MSI-X vectors and misc interrupt are
still being torn down and re-allocated, allowing waiting or newly issued
commands to be submitted while interrupts are absent?

> +	spin_unlock_irq(&idxd->cmd_lock);
> +	return held;
> +}
> +
> +/*
> + * End a hold taken by idxd_cmd_hold(). A halt's recovery may have
> + * forgotten the hold meanwhile and let another command run, which then
> + * has an owner or a newer sequence number, and its state is left alone.
> + */
> +void idxd_cmd_unhold(struct idxd_device *idxd, u32 seq)
> +{
> +	spin_lock_irq(&idxd->cmd_lock);
> +	if (idxd->cmd_seq =3D=3D seq && !idxd->cmd_done) {
> +		__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
> +		wake_up(&idxd->cmd_waitq);
> +	}
> +	spin_unlock_irq(&idxd->cmd_lock);
> +}

[Severity: High]
If a concurrent halt recovery in idxd_device_reinit() forgets the hold
while idxd_pci_probe_alloc() is between idxd_cleanup_interrupts() and
idxd_setup_interrupts(), won't the command started after
idxd_cmd_reset_state() still lose its completion interrupt and time out?

Specifically, idxd_cmd_hold() overloads IDXD_FLAG_CMD_RUNNING to block
new commands, while idxd_cmd_reset_state() unconditionally clears it:

drivers/dma/idxd/device.c:idxd_cmd_reset_state() {
    ...
	__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
	clear_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags);
	wake_up(&idxd->cmd_waitq);
    ...
}

And idxd_device_reinit() immediately issues a reset command right after
resetting the command state:

drivers/dma/idxd/irq.c:idxd_device_reinit() {
    ...
	idxd_cmd_reset_state(idxd);
	rc =3D idxd_device_reset(idxd);
    ...
}

If idxd_device_reinit() runs while the misc interrupt and MSI-X vectors
are freed during the reset re-probe in idxd_pci_probe_alloc(),
idxd_cmd_reset_state() clears IDXD_FLAG_CMD_RUNNING and wakes
idxd->cmd_waitq. Because pci_restore_state() in idxd_reset_done() has
already cleared the hardware halt state, idxd_device_reset() ->
idxd_cmd_exec() (along with any woken waiters) will submit a command while
the misc interrupt is torn down.

Although idxd_cmd_unhold() avoids clobbering the new command's state when
idxd->cmd_seq !=3D seq, hasn't that command already been submitted while
interrupts were absent, causing it to lose its completion interrupt, time
out after 30 seconds, and fence the device?

[ ... ]

> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index a037a6e763622..312b4670b3e82 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -1212,6 +1212,14 @@ int idxd_pci_probe_alloc(struct idxd_device *idxd,=
 struct pci_dev *pdev,
>  	}
> =20
>  	if (!alloc_idxd) {
> +		bool held;
> +		u32 seq;
> +
> +		/*
> +		 * Commands complete through the misc interrupt, which is
> +		 * gone until it is requested again.
> +		 */
> +		held =3D idxd_cmd_hold(idxd, &seq);
>  		/* Release interrupts in the IDXD device. */
>  		idxd_cleanup_interrupts(idxd);
> =20
> @@ -1219,6 +1227,8 @@ int idxd_pci_probe_alloc(struct idxd_device *idxd, =
struct pci_dev *pdev,
>  		rc =3D idxd_setup_interrupts(idxd);
>  		if (rc)
>  			dev_warn(dev, "IDXD interrupts failed to setup\n");
> +		if (held)
> +			idxd_cmd_unhold(idxd, seq);
>  	}
> =20
>  	dev_info(&pdev->dev, "Intel(R) Accelerator Device (v%x)\n",

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D12
