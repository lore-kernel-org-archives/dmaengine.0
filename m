Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078519;
	b=Gw8XSQDc9MegzK3SwI1jx3/tAuOvn03NGx3ZV+Ydvxkzu8JOlQbITRR8WlBkZvSp5GBN
	 1MZJPzLoBXnVoSFap+mM3V4/ymioupewnZvWeImaXek/r67dXUs3pgLOXBuNSkWSroAIV
	 v1kx/qtgNdVmpbRdL6sAFYPT37pvGNafWfroaNM+cWEm1Q5Dm7l0lYomcWxUBzi+a2dCJ
	 7Iyn8C0vO9VBOtEx7ukQ0XWZJWxC+U1ggqrvwfVBHOJ8wFGUHFBl8cykAOKk7Uh2RlKpJ
	 WQIrjjrMyplcjb/gIHen2c4gBYOJ0FGVFNgZ79O5szuuRlQjkc/M/4el5ZRJ65oWXlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HNFamImZ5Dj8euyr7r7xIkmDCGu7nQTzQZBW3i5fPJo=;
	b=DmYleE0Ko4lAXN1RXT54ydmWuGpgQM6gGZd8RfriRlDlA7MzB932EpxQkSi13KjnM+LF
	 fTTg749f01elweLsyzlq2q12N1LdlmSczICcMQp7EYb4/8OqC9C4od36m25lcEy4ZnPEs
	 77znXq377XeVeKKL+hsZpiEe/EBajxMyVW1UJO943GB1bCqQ0p7E4RvfTjcR5accFjVTE
	 HAYggZb427qVjOEXPRBvQE6Glc/3pDlWaSNbmcnEpJbOPnpSlCZlG63ZQbKabfuKKtpK1
	 YEME3A5wEPHoWaLJPFTqtCDFA5US4sNrwc0nUd5uTZ2WYVYmXpc/kdeJFujLpMBerjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tiwjy9Qb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17082606A31A
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 05:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tiwjy9Qb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6459D1F01825;
	Tue, 27 Oct 2026 05:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793078518;
	bh=HNFamImZ5Dj8euyr7r7xIkmDCGu7nQTzQZBW3i5fPJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tiwjy9QbK9J0aRQfjBpvcBD4AhouFtW4q8gD6OI5RT3IGfFtxvs+g5PzdcCLV9XQW
	 i8VL0i42B+8nfK9+BCyw1JSF2vgSsr4GOH9NtHu21ANtj+XPBigiwFtri8qRx9tBoP
	 KoJ15gSgTXr9mNaW5IYz4519b5cYrxgjYC6m9VbwHUKtntBhJXUyy6vyDfl477nCBo
	 oaLjp89pUDipiPQzrjKS5upB3tyPKu0mCy9WxTfGC2V3EpA4aOVzGkCtpYp77Z1Obs
	 fRZVt8k/DmZocqrJA5F/nuG30UlZvXKBR+QqD6UtWGb7uJQ3XktcmaKZ9UkGL1p0r8
	 B88DgloysnkSA==
Message-ID: <sashiko-outbox-186111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for
 FIFO mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 05:21:58 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] i2c: qcom-geni: geni_i2c_recover_bus() clobbers bus command erro=
rs with 0
--

commit fe6ea9338e2ca73e2ec47223ed6169e93b8a2179
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

i2c: qcom-geni: Add bus recovery support for FIFO mode

This commit adds I2C bus recovery support for FIFO mode in the Qualcomm GENI
I2C driver using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS hardware opcodes. It
triggers recovery automatically in geni_i2c_xfer() when a transfer fails wi=
th
-EPROTO, -ETIMEDOUT, or -EAGAIN while the bus is not free, and registers the
recovery callback in i2c_bus_recovery_info.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 60b6273f538c2..d9e86f110ae9b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[ ... ]

> @@ -1013,6 +1015,115 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev=
 *gi2c,
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
> +	geni_se_select_mode(&gi2c->se, GENI_SE_FIFO);
> +	reinit_completion(&gi2c->done);
> +
> +	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
> +	time_left =3D wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeo=
ut);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
> +		geni_i2c_abort_xfer(gi2c);
> +
> +		return -ETIMEDOUT;
> +	}
> +
> +	/*
> +	 * ARB_LOST and BUS_PROTO interrupts may be reported while the bus
> +	 * transitions from stuck to idle during the recovery sequence.
> +	 * The opcode completed successfully so treat these as success.
> +	 */
> +	if (gi2c->err =3D=3D -EAGAIN || gi2c->err =3D=3D -EPROTO)
> +		return 0;
> +
> +	return gi2c->err;
> +}

[ ... ]

> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
> +{

[ ... ]

> +	ret =3D geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
> +	if (!ret)
> +		ret =3D geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
> +
> +	/*
> +	 * Recovery succeeds only once both bus lines are released. The bus
> +	 * state is the authority, while a clean opcode status with either
> +	 * line low is a failed recovery.
> +	 */
> +	if (geni_i2c_bus_is_free(gi2c))
> +		ret =3D 0;
> +	else if (!ret)
> +		ret =3D -EBUSY;

[Severity: Medium]
Can this check in geni_i2c_recover_bus() overwrite a genuine command error =
or
timeout stored in ret with 0?

In geni_i2c_fifo_bus_cmd(), expected transient recovery errors (-EAGAIN and
-EPROTO) are already converted to 0 upon completion, so a non-zero return
value indicates that the recovery opcode failed or timed out.

When geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR) succeeds, the target has
released SDA and both SDA (RX_DATA_IN) and SCL (IO2_DATA_IN) read high,
meaning geni_i2c_bus_is_free(gi2c) is already true. If the subsequent
geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS) call fails or times out,
geni_i2c_bus_is_free(gi2c) will still evaluate to true and clobber the error
in ret with 0, leaving the bus without a transmitted stop condition while
reporting a successful recovery to callers of i2c_recover_bus().

Similarly, if I2C_BUS_CLEAR itself times out or fails while SDA happens to =
be
high, I2C_STOP_ON_BUS is skipped by if (!ret), and the geni_i2c_bus_is_free=
()
check discards the error and returns 0.

Should geni_i2c_recover_bus() preserve non-zero errors from
geni_i2c_fifo_bus_cmd() and only check !geni_i2c_bus_is_free(gi2c) when ret
is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-20260826_a=
niket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com?part=3D2
