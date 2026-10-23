Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758933;
	b=zGaMOkkl7qtBJzxxKBPIhiyAl4fu68cyRnmlMJVAtLdbCX5R70Ynv/Rbyc/0gfw0V2z3
	 j6dGzuu3M4jdYHCrl4mwTNe0h7ZvBQJ8gr454gf9QFCPQPbFHmarcuuoF8NLf9s5QfN1b
	 ysSDsGrfsFAjtb4guOA4994KhBZGbgESE95zbKIXuE0k3qpxyFvrle6BgGSpBCEE5PXtv
	 IP1eergHI5RvUTYdQ29AHzh+XBcxbkPP27q1+QvF88Rc1BL5n90LUKPA9DQpSX+UG+tJt
	 srmGmvdk95oue7Y8CACeiBCniWfKo4CrJ2WPQsS2DdziTD8sQ7aDxwMDbxuTkJ6ukSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758933;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YEt0je46/3csBVuX6e53p5XldR7ccEI88Mw6M27J71w=;
	b=b6ZM1j8wnJrHuKTgG1s36+yoI6tN0ehya5oVjb4H1nFu7E9lWMHY4gpovkpMiISai+DR
	 ZJwXTBBPpqKqfGszNSBZfpW1QIRhK8NMs7xvDGfkNldi3Ck1u2dvTc3bWUe0jWgfy+iU1
	 68TnXZFxVWYOYVuhynGf6j2zlDYBa5t8hjCGQT/2+osrvVpygZjAykIGmhYAj8S01QWrn
	 XsFM4gY2tWdzpP18gQDsyqK6TgcWAOCmu46E9Io8yd0F1GmvDSo5AJHwvY1EYEha9m8SN
	 FVC6yrY42sNkJXcy3M0WTIkkre75WvRo0W7QVXz6DsJ2WiUhGpfpVBjcIQ/K8kEHLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onsW4VDO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F9606A31E
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onsW4VDO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839681F01829;
	Fri, 23 Oct 2026 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758932;
	bh=YEt0je46/3csBVuX6e53p5XldR7ccEI88Mw6M27J71w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=onsW4VDOAyravMwxul3DBs8lJs05HQYVnd4o5pyIbuQ37oI3Zk2zPh/4HRfRi3F4d
	 rZFKk5YkA/SD61kbNCp3N3DMSYCTmuRu4mDNwEmPSCciNPHAwotJb69y7JCntIEnPS
	 PMEdLezrh51fAjc6dqGcZ78J/xmpqivBZELU9Ma6XFVBLqP4HCDCC6sunMPxdPcHjm
	 VC+U+9EckD15rOS7jpCvpWE2Pd0zq95btX9bcjN9jWZIB2eJvOQsyPSklTXhUrJCpa
	 ewrJHErGvZ3mFUE4LI7ZqpBIUzbK3V4IhCwO9+J5SB/RavlCXsf82eQtiLst/GfrDQ
	 G4IPi8Q5gBMXw==
Message-ID: <sashiko-outbox-182779@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-3-93572b453d6f@oss.qualcomm.com>
References: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
 <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-3-93572b453d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:35:32 +0000
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
- [Low] i2c: qcom-geni: unreachable -EAGAIN/-EPROTO check in geni_i2c_gpi_b=
us_cmd()
- [Low] i2c: qcom-geni: misplaced XFER_TIMEOUT fix in geni_i2c_fifo_bus_cmd=
()
--

commit 0f096af4f3272f27200e96084308f4f7a864dd9b
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

i2c: qcom-geni: Add bus recovery support for GPI DMA mode

This patch adds I2C bus recovery support in GPI DMA mode by issuing
I2C_BUS_CLEAR and I2C_STOP_ON_BUS commands over the GPI TX DMA channel,
and checks SE_GENI_IOS I2C_BUS_FREE on -EIO completions before triggering
recovery. It also updates geni_i2c_fifo_bus_cmd() to use gi2c->adap.timeout.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 065d7240de04d..31f811bdc0513 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1034,7 +1034,7 @@ static int geni_i2c_fifo_bus_cmd(struct geni_i2c_de=
v *gi2c, u32 cmd)
>  	reinit_completion(&gi2c->done);
> =20
>  	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
> -	time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	time_left =3D wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeo=
ut);
>  	if (!time_left) {
>  		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
>  		geni_i2c_abort_xfer(gi2c);

[Severity: Low]
Earlier in the history, commit "i2c: qcom-geni: Add dynamic transfer timeout
based on transfer length and frequency" removed the XFER_TIMEOUT macro from
drivers/i2c/busses/i2c-qcom-geni.c in favor of gi2c->adap.timeout.

The preceding patch in this series, "i2c: qcom-geni: Add bus recovery
support for FIFO mode", introduced geni_i2c_fifo_bus_cmd() using XFER_TIMEO=
UT,
which causes a build failure with CONFIG_I2C_QCOM_GENI enabled at that comm=
it
before this hunk replaces it with gi2c->adap.timeout.

Should this change in geni_i2c_fifo_bus_cmd() be squashed into "i2c:
qcom-geni: Add bus recovery support for FIFO mode" to preserve git
bisectability across the series?

> @@ -1065,13 +1065,82 @@ static bool geni_i2c_needs_bus_recovery(struct ge=
ni_i2c_dev *gi2c, int ret)

[ ... ]

> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum i2c_op c=
md)
> +{

[ ... ]

> +	time_left =3D wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeo=
ut);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
> +		dmaengine_terminate_sync(gi2c->tx_c);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* ARB_LOST and BUS_PROTO may be expected during recovery; treat as suc=
cess */
> +	if (gi2c->err =3D=3D -EAGAIN || gi2c->err =3D=3D -EPROTO)
> +		return 0;
> +
> +	return gi2c->err;
> +}

[Severity: Low]
Can gi2c->err ever be -EAGAIN or -EPROTO here in geni_i2c_gpi_bus_cmd()?

When gi2c->gpi_mode is enabled, setup_gpi_dma() selects GENI_GPI_DMA mode,
which disables SE_IRQ_EN and routes completion events through the GPI DMA
callback i2c_gpi_cb_result() rather than geni_i2c_irq().

In drivers/i2c/busses/i2c-qcom-geni.c, i2c_gpi_cb_result() sets gi2c->err
only to -EIO on transfer failure:

	if (result->result !=3D DMA_TRANS_NOERROR) {
		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
		gi2c->err =3D -EIO;
	}

As noted in the comments in geni_i2c_needs_bus_recovery() and
geni_i2c_recover_bus(), GPI mode reports NACK, BUS_PROTO, and ARB_LOST alike
as -EIO and cannot distinguish benign recovery events on the opcode return
path. Is this -EAGAIN and -EPROTO check in geni_i2c_gpi_bus_cmd() unreachab=
le
code left over from geni_i2c_fifo_bus_cmd()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-20260826_a=
niket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com?part=3D3
