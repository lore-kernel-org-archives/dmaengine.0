Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758295;
	b=QbHFa8kCUHkMCn0o3gGKvQoFre/uUsAi6bijygcJEwdX/kBPQTLLqRGALG9Gy0qr1nkf
	 2XzHT6r5RhgM8F3rl0K0YW5/gBoQZtiC+0ZkdBbXf9pwJMzV9qRioCx/I+waFqn9298FY
	 VVhWjtuGWwXYzYWWPaYjRX/yeVEak9GsOqdt44dvvT72BgsctV2NGFhuYK86PAxlUSwKM
	 nxfL8CCkWVXGVV2aATzsRsQUtjDPs9nWZGFRjYN7aqnJHBtXGXwLeiNWkHWeIobiv2WX5
	 v/rCZkwyjwfp4CiMoTHUYmK3+WFE/ZS6LPkDrvZ6QqqnpdI1QNTC2XhtJWLo5NbjpLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758295;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yQLfnKPfRNEU5kUanAb9U+c6hCsQT7/WJbNgjXGxYLo=;
	b=uVQOycVrQHR4Ei/O3eZk6VYHD7z80R9vNmBTA7i0PDmwWwjHDyVCtz69AmbOWjYcFWSv
	 1wRuPyAWVY8VhbSaCsJVIpms/qJ2WQn1P8SdCL0pcrpXTLGs92QVQ4OEdzBO5G7CFphUD
	 jDha4TRLpyHuzYpp06eZwx2gvaDNRMrn4CoA7WN2QOWbnggdtOzY5w+DynxY/o73kfSs0
	 x4bv9xgNpE4/amBMNQWin9saYBrxCPUrTCWlHx0XVGSgDoIHJs+5/cC+/KPFqJVHVmz0Y
	 Jd9pMWOtvDqWIFncmkeUwLMsyAs+PcPThsj3tMq/v7Tx8pDEQnitCK3n9c1Kh7dHyQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTjo8IM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D9606A31A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTjo8IM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7CF1F01829;
	Fri, 23 Oct 2026 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758294;
	bh=yQLfnKPfRNEU5kUanAb9U+c6hCsQT7/WJbNgjXGxYLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTjo8IM2mLrv2g2ZgUDA2J7KJKgiad46ue4rTubqSVCpimzr8XTv8a+8mzNY02HoE
	 IRR8ho4jr0e1ogyK0oKvjby+W3OQilElirBtgLEJTVnE1p5ogyFQOpTFGTJrTPGXHL
	 aKT13pWXoxHNryS5v/i0bdeIeucD4pMsdYfwtyPEDkqIc7pkIAEi1BkVwWraWCokk8
	 6SwI8z1AFhf9JY8qVaE0dOJ0aXse/comE3BTGgeQXQ8hTLkaMIFz3q3zAjJmD6/HNS
	 rEyIyV9Bd5dvTDnRuAG/59ZkGtGR4FICL+XZjRKkSYFvdLk6aWJAjW6IH6TKICxA9B
	 xgkIok0iAZkog==
Message-ID: <sashiko-outbox-182761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] i2c: qcom-geni: Add bus recovery support for
 FIFO mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-2-93572b453d6f@oss.qualcomm.com>
References: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
 <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-2-93572b453d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:24:54 +0000
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
- [Medium] i2c: qcom-geni: missing set_rate() call in geni_i2c_recover_bus()
- [Low] i2c: qcom-geni: undeclared XFER_TIMEOUT in geni_i2c_fifo_bus_cmd()
--

commit fa2e06c81faf514701416b8f6399729cc8d72319
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

i2c: qcom-geni: Add bus recovery support for FIFO mode

This commit adds I2C bus recovery support for FIFO mode using the
I2C_BUS_CLEAR and I2C_STOP_ON_BUS hardware opcodes. It triggers recovery
automatically from geni_i2c_xfer() on -EPROTO, -ETIMEDOUT, and -EAGAIN
errors, and registers geni_i2c_recover_bus() via i2c_bus_recovery_info.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 60b6273f538c2..065d7240de04d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[ ... ]

> @@ -1013,6 +1015,107 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev=
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
> +	time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);

[Severity: Low]
Will this break compilation at this commit due to XFER_TIMEOUT being
undeclared?

Commit 6b4917500125 ("i2c: qcom-geni: Add dynamic transfer timeout based on
transfer length and frequency") removed the XFER_TIMEOUT macro from
drivers/i2c/busses/i2c-qcom-geni.c in favor of gi2c->adap.timeout.

A subsequent commit in the series, 0f096af4f327 ("i2c: qcom-geni: Add bus
recovery support for GPI DMA mode"), updates this call in
geni_i2c_fifo_bus_cmd() to use gi2c->adap.timeout, so this commit fails to
build on its own and breaks bisection.

> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
> +		geni_i2c_abort_xfer(gi2c);
> +
> +		return -ETIMEDOUT;
> +	}

[ ... ]

> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct geni_i2c_dev *gi2c =3D i2c_get_adapdata(adap);
> +	u32 ios;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources=
:%d\n", ret);
> +		pm_runtime_put_noidle(gi2c->se.dev);
> +		return ret;
> +	}
> +
> +	if (geni_i2c_bus_is_free(gi2c)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return 0;
> +	}
> +
> +	/* Bus clear cannot recover a target holding SCL low. */
> +	ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
> +	if (!(ios & IO2_DATA_IN)) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return -EBUSY;
> +	}
> +
> +	ret =3D geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);

[Severity: Medium]
Should geni_i2c_recover_bus() call gi2c->dev_data->set_rate(&gi2c->se,
gi2c->clk_freq_out) after pm_runtime_get_sync() before issuing I2C_BUS_CLEAR
and I2C_STOP_ON_BUS?

In drivers/i2c/busses/i2c-qcom-geni.c, geni_i2c_xfer() is the only place th=
at
invokes dev_data->set_rate():

geni_i2c_xfer()
  pm_runtime_resume_and_get(gi2c->se.dev)
  gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out)

For standard GENI I2C controllers, qcom_geni_i2c_conf() programs
SE_GENI_CLK_SEL, enables SER_CLK_EN with clk_div in GENI_SER_M_CLK_CFG, and
sets the SCL timing counters in SE_I2C_SCL_COUNTERS. For SA8255P,
geni_se_set_perf_opp() configures the performance domain OPP, which
geni_i2c_runtime_suspend() drops to 0 via geni_se_resources_deactivate().

If a caller invokes i2c_recover_bus() directly via adap->bus_recovery_info
before the first transfer after probe, or after runtime suspend has
deactivated the SE resources, wouldn't the recovery commands run without the
serial clock and SCL counters or OPP configured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-20260826_a=
niket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com?part=3D2
