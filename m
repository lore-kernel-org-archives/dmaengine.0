Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696833;
	b=sJ+2q9tztPZFK1IAbV0nSCKROmx5CCH2ir2y6rl1OoS/OFEnCFDLGdXjeYvlrSHSfTUA
	 gG2gBAAsOvP69rD91s67k0sMmtkEe+wjNpXfoOGMfG00Fl+CdPBsc34obKhwjKo8sdXa/
	 Uo+faXSlxdI1Nh1rgvUgTCRo+dV/oszV8f43Bmd6ZsJJzZuyKDBVbHXHrrNbIA5qNT89U
	 +km/6sPyF2mpqs10pi+DjRXxhyhQM8jlpyngoq1sH8lm5+04dkPhTNrdx4FH8dqzsGlO1
	 sP5jXkOssWcKm6NcSFyClyFmcGGN7RrHVUZONmK7MS13/CFeRq/+Q5G3ECaXAPdOYxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6pzIayZmRetxDAKlr2ftaGfCg2m123rlOXD4M/1ZILQ=;
	b=5sZgTcGvGNA/P5SJfy86icJpqGg7sQfsqfN6ASIEpdP0E7PCLyYr0ivkOGF5nk1oPfzn
	 89Ipu4gDE7WJRwr0auUNqcHncuwPRvy4035dnVqlSCPG3HNKB36xLQJhwGXFq/64/ABLb
	 KoRHt0Rv15oKNpOJTzVrexuA1CnOzmHeXqIu1iMHAUpqOBDhWJOxJe+YsxuCOcnfds8Is
	 vegs1wIppRKAVyvIMREb0xn+EBgbI9uwiVuype502pkfMuYBZl7Bz7fCl2iZUaQ38N3P7
	 jGdl4BTuKJa9u0+xCK+oUFkumhgCDN9dB3IsVVyz8puGBrunXS5ezfBF+Vj6+gp2cJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8sD6ezu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4CD606A324
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8sD6ezu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F101F000C1;
	Tue,  3 Nov 2026 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696833;
	bh=6pzIayZmRetxDAKlr2ftaGfCg2m123rlOXD4M/1ZILQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n8sD6ezulHqjCoDivkpe8xJ3Lc8szF0w1rTig2wMzKs0jT+kGq7TocOOVym6Pjedt
	 Cjw7+Ry4FdUqBn5DJTTfu3vhtzwuHi3PmGFBgjFFO/fYYiN6ezyUESfLFtDTT3OatJ
	 awt0s8zCMC+nVPsvft2b7+FVxPzYpYo2sOih+PKcNRt+S8PU153nfY3FTWh6J3omyY
	 JWnfUHdNWgBcyoLJ5BhON02EJMQSBbhJ1wNV6LrauWphzUSve37LrJO6pWrqv6+rpC
	 487OMVGGJwJapYRajxc+eLc2WT0nXYFgFQfBiwvXPE8eUYusukwnxMx3q6fP5lXbgS
	 tteSC/wncTLtA==
Message-ID: <sashiko-outbox-194925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i2c: qcom-geni: Add bus recovery support for
 FIFO mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 09:07:12 +0000
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
- [Medium] i2c: qcom-geni: geni_i2c_recover_bus() overwrites bus command er=
rors with 0
--

commit cc96ce79094e98763abdf6d3ca4ab22eeb1119f1
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

i2c: qcom-geni: Add bus recovery support for FIFO mode

This commit adds I2C bus recovery support for FIFO mode using the
I2C_BUS_CLEAR and I2C_STOP_ON_BUS hardware opcodes when SDA is held low.
It automatically triggers recovery from geni_i2c_xfer() on -EPROTO,
-ETIMEDOUT, and -EAGAIN errors and registers geni_i2c_recover_bus() via
i2c_bus_recovery_info.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 60b6273f538c2..b08353616adc8 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
[ ... ]
> @@ -1013,6 +1015,112 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev=
 *gi2c,
>  	return num;
>  }
> =20
> +static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
> +{
[ ... ]
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
> +	ret =3D geni_i2c_bus_is_free(gi2c) ? 0 : (ret ?: -EBUSY);

[Severity: Medium]
As reported by Sashiko on v3 [1], can this overwrite a real command error
or timeout in ret with 0?

In geni_i2c_fifo_bus_cmd(), expected transient recovery errors (-EAGAIN
and -EPROTO) are already cleared to 0, so a non-zero return value
indicates a command timeout (-ETIMEDOUT) or a controller error such as
-EIO.

Once geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR) clocks SCL until the
target releases SDA, both SDA and SCL are high in SE_GENI_IOS, so
geni_i2c_bus_is_free(gi2c) is already true before I2C_STOP_ON_BUS runs.
If geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS) then fails or times out,
or if I2C_BUS_CLEAR itself times out after advancing the target to a high
data bit (skipping I2C_STOP_ON_BUS), evaluating geni_i2c_bus_is_free(gi2c)
first unconditionally overwrites the negative error in ret with 0 even
though no STOP condition was generated on the bus.

Note that a subsequent patch in the series (commit 8e94719d9d80, "i2c:
qcom-geni: Add bus recovery support for GPI DMA mode") adds explicit
if (ret =3D=3D -ETIMEDOUT) goto out_pm checks in the GPI DMA branch, but
leaves this FIFO branch unchanged. Should this preserve non-zero ret values
and only check geni_i2c_bus_is_free(gi2c) when the commands succeeded (for
example, if (!ret && !geni_i2c_bus_is_free(gi2c)) ret =3D -EBUSY;)?

[1] https://lore.kernel.org/r/20261027-20260826_aniket_randive_oss_qualcomm=
_com-v3-2-7f2a6e572de9@oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-20260826_a=
niket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com?part=3D2
