Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429523;
	b=GPsqbNg8abgNoUf9QUxdHTezBaH5L/bjfhIZGhZ4g1vt/KElXiwhQdWoWLBViUe67NjT
	 AFACzfA33j9RFx0x1d79xbuIpV2mSVNpGA+QUgIOAtOy4/nTZUst9COfb0FPOJ+2K7NFz
	 rXMdb39fzKDxHRtyrbLFrqVzNhW1X1742NPeHcRmtEF0Dyn0SmJazrkAvyezbI3t1WGG5
	 Dib0Vz0kM7l8zyWPkAnZ3gXOKdaICC9zGXn0MzzXM71hXusNW+L5NQGP+w6Tk4IIArv9Q
	 Ul5TLae12ghI8jTBOg5+Cys/YrflBAx6Tc3bnZZywRT0/dSAYzNlzLGQvEfM9praRsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yo778YiRXko6QBn5gHMbzOW2b4PMqxi8rbKDxrCQ4AI=;
	b=ZKMyuEYJ8cFytQW5kIGfNGwb+hQUP7EzQLaiYot1miRCXMr8e2KA2NDDUtvldF+Mw5lz
	 +SXfmfzUpfO7EXi4CbtedlgjryZYb20pNTmDxWbetSdLV/dfYKlF0WZ2hKEIcP/ud0O5i
	 ovoAitgQ112d/SzJ3KA44JC2jmcBhv0RkRQQb5K4zJDq4VQRQviEKFD9MuDesGnCRMdIX
	 1lxCMXkHv73aTc94OLp8v/vjxPAjlmcyTrmixXCsw3+39VnCjGXe/NRdEkkGf2MfAFoV6
	 4wp03KXbr3vYHHgG4Kj78jCbS4JZ4JxWym6r9w3+z1VnMAG59jqTAg1x1gUUsFQj1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooVE5T0I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B8606A31B
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooVE5T0I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A826E1F000C7;
	Mon, 19 Oct 2026 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429522;
	bh=Yo778YiRXko6QBn5gHMbzOW2b4PMqxi8rbKDxrCQ4AI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ooVE5T0IGqA6juMUwTfKNc1S8h+BVpx2BAvLNq1Ys/9duax8OWfi+DdN5PHvAhwC7
	 /bXaUtCLzbQHtrIzFd4ilWCnuI2hz7TBoTcosZOu5Qgtw+umSUB/K10h49YfHJT8hk
	 AxQAs6n/PpSaqNRKjmMOgB5N79KrdFw0BaOP8OFenGyzP0Kv6rJ1nuoDjlB9PP9OlD
	 xsMSRXA4qoZbWu009d1IDt9Df4gAzofdvr5OxGEAeDaIrIq8Igd5D+KiZwudxtsdXO
	 iGyKBEAK4wD1Mc46XaIiEI9oxh+tsWT2iFjcQtVOW2cIaiLn+movgSnCnthDm2eejB
	 oReHPimFOLWzw==
Message-ID: <sashiko-outbox-177989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/17] dmaengine: idxd: bound device command waits and
 fail fast after a timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-8-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-8-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 17:05:22 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: idxd: halt and reset take wq_lock before idxd_cmd_reset=
_state()
- [High] dmaengine: idxd: idxd_cmd_reset_state() lets queued commands run a=
cross reset
- [High] dmaengine: idxd: skipped cleanup and unmapped DMA on timeout and l=
ate completion
--

commit 1d80ba369e8b0a0f449fe56d6a77da3a16693f92
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: bound device command waits and fail fast after a timeout

This commit bounds waits in idxd_cmd_exec() to 30 seconds and adds
IDXD_FLAG_CMD_TIMEDOUT so subsequent commands fail fast after a timeout. It
also introduces idxd_cmd_reset_state() to clear command state across resets
and halts, and routes interrupt-handle releases through idxd_cmd_exec().

> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index a461cae7a4090..5ebc2c1a38599 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c

[ ... ]

> @@ -507,21 +510,69 @@ static void idxd_cmd_exec(struct idxd_device *idxd,=
 int cmd_code, u32 operand,
>  		return;
>  	}
> =20
> +	if (test_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags)) {
> +		dev_warn(&idxd->pdev->dev,
> +			 "Not sending command %#x: an earlier device command timed out, devic=
e needs a reset\n",
> +			 cmd_code);
> +		if (status)
> +			*status =3D IDXD_CMDSTS_HW_ERR;
> +		return;
> +	}
> +
>  	memset(&cmd, 0, sizeof(cmd));
>  	cmd.cmd =3D cmd_code;
>  	cmd.operand =3D operand;
>  	cmd.int_req =3D 1;
> =20
>  	spin_lock_irqsave(&idxd->cmd_lock, flags);
> -	wait_event_lock_irq(idxd->cmd_waitq,
> -			    !test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags),
> -			    idxd->cmd_lock);
> +	/*
> +	 * Wait for the running command, if any. Only its owner can tell
> +	 * that it is stuck, so this wait does not declare a timeout of its
> +	 * own: its budget covers one owner and restarts whenever another
> +	 * command starts running, and it ends early when the owner gives
> +	 * up and marks the device. Several healthy commands queued behind
> +	 * one another therefore never add up to a false timeout.
> +	 */
> +	while (test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags)) {
> +		u32 seq =3D idxd->cmd_seq;
> +
> +		if (test_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags)) {
> +			spin_unlock_irqrestore(&idxd->cmd_lock, flags);
> +			dev_err(&idxd->pdev->dev,
> +				"not sending command %#x: the running device command timed out, devi=
ce needs a reset\n",
> +				cmd_code);
> +			if (status)
> +				*status =3D IDXD_CMDSTS_HW_ERR;
> +			return;
> +		}
> +		if (!wait_event_lock_irq_timeout(idxd->cmd_waitq,
> +				!test_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags) ||
> +				test_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags) ||
> +				idxd->cmd_seq !=3D seq,
> +				idxd->cmd_lock,
> +				msecs_to_jiffies(IDXD_CMD_TIMEOUT_MS))) {
> +			/*
> +			 * The owner started before this wait and has the
> +			 * same budget, so its own timeout is due; it marks
> +			 * the device and wakes this queue. Give up without
> +			 * marking anything here.
> +			 */
> +			spin_unlock_irqrestore(&idxd->cmd_lock, flags);
> +			dev_err(&idxd->pdev->dev,
> +				"timed out waiting for the running device command before %#x\n",
> +				cmd_code);
> +			if (status)
> +				*status =3D IDXD_CMDSTS_HW_ERR;
> +			return;
> +		}
> +	}
> =20
>  	dev_dbg(&idxd->pdev->dev, "%s: sending cmd: %#x op: %#x\n",
>  		__func__, cmd_code, operand);
> =20
>  	idxd->cmd_status =3D 0;
>  	__set_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
> +	idxd->cmd_seq++;
>  	idxd->cmd_done =3D &done;
>  	iowrite32(cmd.bits, idxd->reg_base + IDXD_CMD_OFFSET);

[Severity: High]
What happens to a caller waiting in idxd->cmd_waitq if a device halt or PCI
reset occurs while another command is running?

When a second command enters idxd_cmd_exec() while the first command is
running, it passes the initial idxd_device_is_halted() check, takes
idxd->cmd_lock, and sleeps in wait_event_lock_irq_timeout() on
idxd->cmd_waitq.

If the device then halts or resets, idxd_device_reinit() or
idxd_reset_done() calls idxd_cmd_reset_state(idxd):

drivers/dma/idxd/device.c:idxd_cmd_reset_state() {
	...
	if (idxd->cmd_done)
		complete(idxd->cmd_done);
	idxd->cmd_done =3D NULL;
	__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
	clear_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags);
	wake_up(&idxd->cmd_waitq);
	...
}

While the first command sees idxd->cmd_done !=3D &done and aborts, the seco=
nd
command wakes from idxd->cmd_waitq and sees both IDXD_FLAG_CMD_RUNNING and
IDXD_FLAG_CMD_TIMEDOUT cleared. It exits the while loop without checking
whether a reset intervened or re-checking idxd_device_is_halted(idxd), and
writes cmd.bits to IDXD_CMD_OFFSET.

In idxd_device_reinit(), idxd_cmd_reset_state() is called before
idxd_device_reset() while the hardware is still in IDXD_DEVICE_STATE_HALT
(and the same occurs if the first command completes just as the device
halts). Submitting the queued command to the halted device will never
complete, causing a 30-second hang and setting IDXD_FLAG_CMD_TIMEDOUT to
fence the device.

Similarly, in idxd_reset_done(), idxd_cmd_reset_state() wakes pre-reset
waiters at the start of reset recovery (before idxd_unbind() and before the
later commit "dmaengine: idxd: hold device commands off while the reset
re-creates its interrupts" calls idxd_cmd_hold() in
idxd_pci_probe_alloc()), allowing stale pre-reset commands to be issued
against post-reset hardware.

Should waiters in idxd->cmd_waitq also abort when a reset or halt occurs?

> @@ -530,9 +581,57 @@ static void idxd_cmd_exec(struct idxd_device *idxd, =
int cmd_code, u32 operand,
>  	 * the command completes via interrupt.
>  	 */
>  	spin_unlock_irqrestore(&idxd->cmd_lock, flags);
> -	wait_for_completion(&done);
> -	stat =3D ioread32(idxd->reg_base + IDXD_CMDSTS_OFFSET);
> +	left =3D wait_for_completion_timeout(&done,
> +				msecs_to_jiffies(IDXD_CMD_TIMEOUT_MS));
>  	spin_lock(&idxd->cmd_lock);
> +	/*
> +	 * A reset, or the recovery from a halt, forgot this command
> +	 * meanwhile, and another may be running by now. Forgetting the
> +	 * command completes the wait, but it can also happen between the
> +	 * interrupt's completion and this lock, or after the wait ran out,
> +	 * so ownership is checked whichever way the wait ended. The device
> +	 * is not stuck on this command, and the command state belongs to
> +	 * whatever runs now. Mark nothing and leave that state alone, even
> +	 * if this command completed just before the reset or the halt: its
> +	 * status can no longer be trusted.
> +	 */
> +	if (idxd->cmd_done !=3D &done) {
> +		spin_unlock(&idxd->cmd_lock);
> +		dev_err(&idxd->pdev->dev,
> +			"device command %#x was ended by a reset\n",
> +			cmd_code);
> +		if (status)
> +			*status =3D IDXD_CMDSTS_HW_ERR;
> +		return;
> +	}
> +	/* A timeout, unless the interrupt beat the lock. */
> +	if (!left && !completion_done(&done)) {
> +		/*
> +		 * The device did not complete the command. Detach the
> +		 * on-stack completion so a late interrupt cannot touch it,
> +		 * and leave IDXD_FLAG_CMD_RUNNING set: the device may still
> +		 * be executing, so no further commands may be issued.
> +		 * IDXD_FLAG_CMD_TIMEDOUT makes waiters and future callers
> +		 * fail fast; a late completion interrupt or a device reset
> +		 * clears both flags.
> +		 */
> +		idxd->cmd_done =3D NULL;
> +		set_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags);
> +		wake_up(&idxd->cmd_waitq);
> +		spin_unlock(&idxd->cmd_lock);
> +		dev_err(&idxd->pdev->dev,
> +			"device command %#x timed out, device needs a reset\n",
> +			cmd_code);
> +		if (status)
> +			*status =3D IDXD_CMDSTS_HW_ERR;
> +		return;
> +	}

[Severity: High]
Can idxd_cmd_reset_state() actually be reached to wake a command owner if
the owner is holding wq->wq_lock when a halt or PCI reset occurs?

Most workqueue commands call idxd_cmd_exec() while holding wq->wq_lock,
including:
  idxd_drv_enable_wq() -> idxd_wq_enable()
  idxd_drv_enable_wq() -> idxd_wq_request_irq() -> idxd_device_request_int_=
handle()
  idxd_drv_disable_wq() -> idxd_wq_drain() / idxd_wq_free_irq() / idxd_wq_r=
eset()
  idxd_cdev_open() -> idxd_wq_set_pasid() -> idxd_wq_disable() / idxd_wq_en=
able()

If the device halts or a PCI reset is initiated while a caller is sleeping
in idxd_cmd_exec() with wq->wq_lock held, the halt and reset paths attempt
to acquire wq->wq_lock before idxd_cmd_reset_state() is ever called:

1. In idxd_halt(), the IDXD_DEVICE_RESET_FLR branch does not call
idxd_cmd_reset_state() and immediately calls idxd_wqs_flush_descs(idxd) ->
idxd_wq_flush_descs(wq), which locks wq->wq_lock on every WQ before
queueing idxd_device_flr:

drivers/dma/idxd/irq.c:idxd_halt() {
	...
	} else if (gensts.reset_type =3D=3D IDXD_DEVICE_RESET_FLR) {
		int i;

		idxd->state =3D IDXD_DEV_HALTED;
		idxd_mask_error_interrupts(idxd);
		idxd_wqs_flush_descs(idxd);
	...
}

The final else branch of idxd_halt() never calls idxd_cmd_reset_state() at
all and calls idxd_wqs_quiesce(idxd) and idxd_device_clear_state(idxd) ->
idxd_device_wqs_clear_state(idxd), which also lock wq->wq_lock. In addition,
later in this series, commit "dmaengine: idxd: flush the work queues on
every halt type" adds idxd_wqs_halt_flush() to all three branches of
idxd_halt() (including IDXD_DEVICE_RESET_SOFTWARE before idxd_device_reinit
is queued), so every halt path locks wq->wq_lock before
idxd_cmd_reset_state() can run.

2. During a PCI reset (via idxd_device_flr or sysfs reset),
pci_reset_function() calls idxd_reset_prepare() ->
idxd_device_config_save() before idxd_reset_done() (where
idxd_cmd_reset_state() is called), and idxd_device_config_save() acquires
wq->wq_lock for each WQ:

drivers/dma/idxd/init.c:idxd_device_config_save() {
	...
		wq =3D idxd->wqs[i];
		mutex_lock(&wq->wq_lock);
		memcpy(saved_wq, wq, sizeof(*saved_wq));
	...
}

Because idxd_halt() or idxd_reset_prepare() blocks on wq->wq_lock before
reaching idxd_cmd_reset_state(), won't the command owner sleep out the full
30-second timeout while holding wq->wq_lock, see idxd->cmd_done =3D=3D &done
when wait_for_completion_timeout() expires, and falsely set
IDXD_FLAG_CMD_TIMEDOUT?

[ ... ]

> @@ -1340,6 +1455,12 @@ void idxd_wq_free_irq(struct idxd_wq *wq)
>  	if (ie->int_handle =3D=3D INVALID_INT_HANDLE)
>  		return;
> =20
> +	/*
> +	 * The release waits for a running command like any other command.
> +	 * It is not sent, or does not complete, only on a halted device or
> +	 * after a command timed out, and the reset such a device needs
> +	 * revokes the handle. The handle is forgotten in any case.
> +	 */
>  	if (idxd->request_int_handles)
>  		idxd_device_release_int_handle(idxd, ie->int_handle, IDXD_IRQ_MSIX);
>  	idxd_device_clear_perm_entry(idxd, ie);
> diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
> index 915304ee70991..acb901e59a007 100644
> --- a/drivers/dma/idxd/irq.c
> +++ b/drivers/dma/idxd/irq.c

[ ... ]

> @@ -550,7 +555,25 @@ irqreturn_t idxd_misc_thread(int vec, void *data)
> =20
>  	if (cause & IDXD_INTC_CMD) {
>  		val |=3D IDXD_INTC_CMD;
> -		complete(idxd->cmd_done);
> +		/*
> +		 * cmd_done is cleared under cmd_lock when idxd_cmd_exec()
> +		 * gives up on a command: the completion lives on its stack,
> +		 * so a late interrupt must not touch it.
> +		 */
> +		spin_lock(&idxd->cmd_lock);
> +		if (idxd->cmd_done) {
> +			complete(idxd->cmd_done);
> +		} else if (test_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags)) {
> +			/*
> +			 * The command its owner gave up on has finished after
> +			 * all. The device is usable again, so let the queue go.
> +			 */
> +			__clear_bit(IDXD_FLAG_CMD_RUNNING, &idxd->flags);
> +			clear_bit(IDXD_FLAG_CMD_TIMEDOUT, &idxd->flags);
> +			wake_up(&idxd->cmd_waitq);
> +			dev_warn(dev, "a timed-out device command completed late\n");
> +		}
> +		spin_unlock(&idxd->cmd_lock);
>  	}

[Severity: High]
Can tearing down WQ state after a command timeout or clearing
IDXD_FLAG_CMD_TIMEDOUT on a late completion leave DMA buffers unmapped and
device state inconsistent while the WQ is still active in hardware?

In this commit, idxd_wq_drain(), idxd_wq_reset(), and
idxd_device_drain_pasid() do not propagate timeouts to their callers:

1. In idxd_file_dev_release(), if idxd_device_drain_pasid(),
idxd_wq_disable_pasid(), or idxd_wq_drain() times out, any follow-up
IDXD_CMD_RESET_WQ fails fast (leaving the WQ enabled in hardware with the
PASID programmed), and idxd_file_dev_release() proceeds to call
iommu_sva_unbind_device(ctx->sva) and kfree(ctx) while the device may still
access that PASID.

2. In idxd_drv_disable_wq():

drivers/dma/idxd/device.c:idxd_drv_disable_wq() {
	...
	idxd_wq_unmap_portal(wq);
	idxd_wq_drain(wq);
	idxd_wq_free_irq(wq);
	idxd_wq_reset(wq);
	idxd_wq_free_resources(wq);
	...
}

When idxd_wq_drain() times out, idxd_wq_free_irq() and idxd_wq_reset() fail
fast on IDXD_CMD_RELEASE_INT_HANDLE and IDXD_CMD_RESET_WQ, leaving the WQ
enabled in hardware, yet idxd_wq_reset() calls idxd_wq_disable_cleanup()
and idxd_drv_disable_wq() calls idxd_wq_free_resources() to free wq->compls
via dma_free_coherent().

A later commit in this series ("dmaengine: idxd: return -ETIMEDOUT from
drains and resets and leak what the device may still write") updates
idxd_file_dev_release() and idxd_drv_disable_wq() to leak ctx/ctx->sva and
skip idxd_wq_free_resources() and idxd_wq_disable_cleanup() on -ETIMEDOUT.
However, even with that follow-up commit, two issues remain when
idxd_wq_drain() times out during idxd_drv_disable_wq():

First, idxd_drv_disable_wq() still calls idxd_wq_free_irq(wq)
unconditionally after idxd_wq_drain(wq) fails with -ETIMEDOUT.
idxd_wq_free_irq() calls idxd_flush_pending_descs(ie, false, false) with
quarantine =3D false, which invokes idxd_dma_complete_txd() ->
dma_descriptor_unmap() on in-flight descriptors that the still-enabled
hardware WQ may still be writing.

Second, during the timeout window, idxd_wq_free_irq() skips
IDXD_CMD_RELEASE_INT_HANDLE and clears ie->int_handle =3D INVALID_INT_HANDLE
(assuming a device reset will revoke the handle), and idxd_wq_reset() skips
IDXD_CMD_RESET_WQ while idxd_drv_disable_wq() has already torn down
wq->wq_active, the portal, and the WQ IRQ. If the timed-out command then
completes late in idxd_misc_thread(), clearing IDXD_FLAG_CMD_RUNNING and
IDXD_FLAG_CMD_TIMEDOUT without a reset leaves the hardware interrupt handle
leaked and the WQ stuck in IDXD_WQ_ENABLED with its portal, IRQ, and
wq_active reference already torn down.

Should idxd_wq_free_irq() quarantine descriptors when called after a
timeout, and is it safe for idxd_misc_thread() to clear
IDXD_FLAG_CMD_TIMEDOUT without a device reset once teardown commands have
been skipped under that flag?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D7
