Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607332;
	b=gJGnRV2ouXL3KipsrNsFEacJGZuf3PqWSCplrqI7HaEQSx8rGAeUgetjVQaYEr3AKQt8
	 qN1Ud5lHYsPEnBa8xJkL27wx4id4E2T5ytkZzkNMCwwUQ0JsANgYqiGZTJHMYki4UW6YO
	 r6o6V5r9pkD54b84tJ3HsXW3D0ApyuKuklyrmSbzQGI5BK4Iu0b5lfKusHG8A9WKNyxdZ
	 DloAQCEzfJY8um6JM22jcV0dfTnkAseXT5M31anv874DTR5Jucj6ah/GHhHbUy/nZRqdD
	 AH5BRQWeHrX4/4jnlYB1QEobAhMx69t17MEq1uN8R0VivU/e5bzhW8vKCjCqdcjGhdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607332;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wDI+oUgpYsLCsLGsOKKJFNO8N72+mK/yyeDgKBUDsMQ=;
	b=0PA4XBOvJp4ZY7991vkeBBWV6gCrRsWe+nkxT7yeSAFfBBQkA6LlE/hXYCFsY3kePVTt
	 +TZ1VNVkQxtPbFWfrYn5cpMGJ7m6fmwThn3Qm4VqX8OnJwYTbJWMvi9q59AvvB0BuznPR
	 tZ9FfHCUgHTQdHzGmtfbFfgTjz13Rn3Ob4GjDNVWJaFVbjQ/xoNlGpxai1YtTar6YZfWu
	 oi32nljPwfxh1ru/X9Os76siJz9Vp/CgYcCWZ9v2QGgv0R8wN/FcpBV7wEYQCDeejj3Ir
	 TRFfwgKT7UBXXw9ElgeetI3Y5/Z1Lif9GpUSAbl05Napjo2ky4V6RU6Wf17p4zePijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2sldiuk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BBC606A31E
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2sldiuk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDB01F000C4;
	Wed, 25 Nov 2026 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795607332;
	bh=wDI+oUgpYsLCsLGsOKKJFNO8N72+mK/yyeDgKBUDsMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2sldiukq09W4OOshuxXfif3P6sBWNwqYOBEBFH5wLb87FPHI/RJ/GzcHdzOu8Nm5
	 bAAvUb/IJNcAT3LJ6HmQPyOZc/40B/2lJEiquwm7uwCmoCUHLR72kJiWePqTvgUQbO
	 M7OwOPw6w1NzzdWE7zIq0pHEDSnoiVoduo4nuk6MnC4fiTgm6dQCcM2JyrlVYA4vlH
	 uHMJ7tB4B9A0e/tdxTr9VOOoci7nTxLp/+uCoXnFZ08xwcM+TIJjeg293Z5gvyCirm
	 fNqipQFyelfeqSwN8TN7U1+xzvb77WsNS/i8i6AHaBhGnmrtpUoQOuPCeHUIsa6l/7
	 xC2VY6a6Er1Fw==
Message-ID: <sashiko-outbox-233285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix deadlock on interrupt handle
 revocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyu Zhang" <ziyuzhang201@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125113553.94215-1-ziyuzhang201@gmail.com>
References: <20261125113553.94215-1-ziyuzhang201@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:48:51 +0000
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
- [High] dmaengine: idxd: active work reinit and missing cancel on
  interrupt setup
--

commit e10f41baa968851823cafa610d6872d2435dbbf7
Author: Ziyu Zhang <ziyuzhang201@gmail.com>

dmaengine: idxd: Fix deadlock on interrupt handle revocation

This commit embeds int_handle_revoke_work in struct idxd_device and queues
it unconditionally on IDXD_INTC_INT_HANDLE_REVOKED, removing the dynamic
work allocation and synchronous idxd_wqs_quiesce() fallback.

> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index 4b827a3297564..f3ade8036ddb7 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -108,6 +108,7 @@ static int idxd_setup_interrupts(struct idxd_device *=
idxd)
>  	}
>  	dev_dbg(dev, "Enabled %d msix vectors\n", msixcnt);
> =20
> +	INIT_WORK(&idxd->int_handle_revoke_work, idxd_int_handle_revoke);
> =20
>  	ie =3D idxd_get_ie(idxd, 0);
>  	ie->vector =3D pci_irq_vector(pdev, 0);

[Severity: High]
Can idxd_setup_interrupts() reinitialize idxd->int_handle_revoke_work
while it is pending or running, and does idxd_cleanup_interrupts() leave
it uncancelled?

idxd_setup_interrupts() also runs during FLR recovery via
idxd_reset_done() -> idxd_pci_probe_alloc(idxd, NULL, NULL), which calls
idxd_cleanup_interrupts() and idxd_setup_interrupts() back-to-back on an
existing device without cancelling int_handle_revoke_work:

drivers/dma/idxd/init.c:idxd_pci_probe_alloc() {
    ...
	if (!alloc_idxd) {
		/* Release interrupts in the IDXD device. */
		idxd_cleanup_interrupts(idxd);

		/* Re-enable interrupts in the IDXD device. */
		rc =3D idxd_setup_interrupts(idxd);
    ...
}

kworker (idxd->wq)                <irq thread> (idxd_misc_thread)
idxd_device_flr()
                                  cause & IDXD_INTC_INT_HANDLE_REVOKED
                                  queue_work(idxd->wq,
                                             &idxd->int_handle_revoke_work)
  pci_reset_function()
    ...
      idxd_reset_done()
        idxd_pci_probe_alloc()
          idxd_cleanup_interrupts()
            free_irq(ie->vector, ie)
          idxd_setup_interrupts()
            INIT_WORK(&idxd->int_handle_revoke_work, ...)
              <-- reinitializes queued work, corrupting pwq->worklist

Calling INIT_WORK() on a queued work item corrupts pwq->worklist and
clears WORK_STRUCT_PWQ in work->data, leading to a NULL pointer
dereference in process_one_work(). Because idxd_cleanup_interrupts() does
not cancel the work after free_irq(), a pending or running
idxd_int_handle_revoke() can also hang waiting on idxd->cmd_done after the
misc IRQ is freed, or access idxd->wqs and idxd->reg_base after they are
torn down in idxd_cleanup_internals() or idxd_remove().

Initializing idxd->int_handle_revoke_work once during device allocation
(such as in idxd_setup_internals()) and calling
cancel_work_sync(&idxd->int_handle_revoke_work) after free_irq() in
idxd_cleanup_interrupts() would avoid both problems.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125113553.9421=
5-1-ziyuzhang201@gmail.com?part=3D1
