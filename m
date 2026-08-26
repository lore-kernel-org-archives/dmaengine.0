Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B73BF69E
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738641; cv=none; b=UVMkeMy6Dh63uuWCy+eU6h5Jzt9m2mQeL3vs0nMZ78W5I5GYf5U2RlZuCuzfumK46nny3f59lng4MdpzFmtvGUUx+mgrwQJsTsmbWe/qSd2wefUi3HQ76ZxAIdlsC5pHLlbdZKTXIwqyyo68gCwAAbxEhdKKthvTz851ZJAWxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738641; c=relaxed/simple;
	bh=PB7upBQIqsI/Ygzw6QZJK2EfhGB+M4G97phai+vd/6c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g97+boxWysZVeMCkuuQruxr9yjXUG55FmLk5NLnFSNFgmrSNXFPDRO0BNvfRoZnAApJMvqFNLJGcfr0PJMHg8TPOnPHafkpP75yzAQnngZoBhUFSuJHAl1z8tnTcMyzMDR1Gy5yObe5aZQCMMuOgHzRcvv/mnC6BHxu1IC1Fhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cag6dqLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cag6dqLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B334C1F000E9;
	Wed, 26 Aug 2026 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787738640;
	bh=s0YWZKMvmn7EZDdc83GyqeR9nPWx5eXQbDLCTqiwKwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cag6dqLgo5xUn2YsC14v3chJ+cjMpKEPk7TxuzZN1rePYQwaNiVqNpV0V+2lk16f0
	 34fLQhRo/Bnm4txOlV3gTB2g9bQg341xEkRWqpCrLA9ezSEN72FmsGGwnG3LIfIx+4
	 hhfktW46NXjvyTyCd4T62BXWF0ZRDNthmy6uXbg+4zdJT2lFRbgl2WZyokOjjkFw+c
	 1p5CaKRbVwwZOjJEhAFY1oRR2qFahQWnZb7nEDr+Y1I/lRxQG3wcSrblsiDHxLVem4
	 DgLzVEbBNl6O81TQmw+9pB8W2qOzWF5riH+j3CytbqOMeQL0BKJEUivUJFganP+JRo
	 +Xkhb3Q7LC02w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] i2c: qcom-geni: Add bus recovery support for
 FIFO mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260826-i2c_bus_recovery-v1-2-203f0ec76f84@oss.qualcomm.com>
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-2-203f0ec76f84@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:03:59 +0000
Message-Id: <20260826100359.B334C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Compilation error and broken synchronization logic in the command =
abort path.

Pre-existing issues:
- [High] A NACK interrupt during bus recovery causes a fatal NULL pointer d=
ereference in the interrupt handler.
--

commit de102ddbb8af25ab8831cc82b3f8ba2ab217ef7a
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

i2c: qcom-geni: Add bus recovery support for FIFO mode

This commit adds bus recovery support using I2C_BUS_CLEAR and
I2C_STOP_ON_BUS hardware opcodes to restore a stuck bus to an idle
state in FIFO mode. It automatically triggers recovery on bus errors
and registers a recovery callback via i2c_bus_recovery_info.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[ ... ]

> @@ -956,6 +957,90 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *g=
i2c,
>  	return num;
>  }
> =20
> +static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
> +{
> +	unsigned long time_left;
> +	unsigned long flags;
> +
> +	/*
> +	 * Clear cur so the IRQ handler does not attempt FIFO watermark
> +	 * filling or draining while the recovery opcode is in flight.
> +	 * cur and err are shared with geni_i2c_irq(), which reads cur and
> +	 * writes err under gi2c->lock, so take the lock around this reset.
> +	 */
> +	spin_lock_irqsave(&gi2c->lock, flags);
> +	gi2c->cur =3D NULL;
> +	gi2c->err =3D 0;
> +	spin_unlock_irqrestore(&gi2c->lock, flags);

[Severity: High]
This is a pre-existing issue, but by explicitly clearing gi2c->cur here,
can a NACK interrupt during bus recovery cause a NULL pointer dereference
in the interrupt handler?

If a NACK interrupt occurs during this sequence, geni_i2c_irq() routes
it to geni_i2c_check_addr_data_nack() which unconditionally checks the
flags on the current message:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_check_addr_data_nack() {
    ...
    else if (!(gi2c->cur->flags & I2C_M_RD))
        geni_i2c_err(gi2c, DATA_NACK);
    ...
}

> +	geni_se_select_mode(&gi2c->se, GENI_SE_FIFO);
> +	reinit_completion(&gi2c->done);
> +
> +	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
> +	time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
> +		gi2c->abort_done =3D false;
> +		geni_se_abort_m_cmd(&gi2c->se);
> +		time_left =3D ABORT_TIMEOUT;
> +		do {
> +			time_left =3D wait_for_completion_timeout(&gi2c->done, time_left);
> +		} while (!gi2c->abort_done && time_left);

[Severity: High]
Is gi2c->abort_done declared as a struct completion? If so, assigning false
to it and checking it with a logical NOT will cause a compilation error.

Additionally, does this wait on the correct completion variable? The loop
calls wait_for_completion_timeout(&gi2c->done, time_left) but then checks
!gi2c->abort_done. It appears it should wait on &gi2c->abort_done instead.

Lastly, does the hardware abort command geni_se_abort_m_cmd() need to be
issued while holding gi2c->lock to prevent racing with the concurrent
interrupt handler?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-i2c_bus_re=
covery-v1-0-203f0ec76f84@oss.qualcomm.com?part=3D2
