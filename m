Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978418;
	b=0CyOe16GhfiB4BWjGxqAMuT3I25vkgPbVPuJnSpmC/OWKCHSSwjHVmn9P6WhY1LDC4JK
	 0OTmzFNFklNFCSdQ1j4yiCJ6tLoJXXcMIv+LutU5HYYx9KjXHhl/5mDSaBdqlOftM+szf
	 d9huu24lzjQUqTrc/1v8qMzQJlOhu9UlUsOzWLYCwsP6+KQwWhTK1inwZRPFHIMvtU2+Q
	 sKVuKaXfrxxFG1qrkbpYfg1y2xisL00sBC2iGQTeIDMy8QT1xsDFsOQu2xnw6zkNklPRR
	 C65XKAZ54c7WQUA8zLlYdtOC+kY/9vcIrhRCbpO0ZO924b1J+raiYxvS9H9BmoEMOWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=chljuawuQqoVUbkR6TZgo3ovuu5Trbmjx9rGpS1wdQ8=;
	b=fwNJRvDEiJsK5UovzOc3ZcsQpmBqrtBsP5BEYl7YjEv1+qS7rWcPeuvgGq9cOEvzUBzG
	 1pgr8QjOU1ZYVrUlXtGs/KpN+giurSPs48lQEYd1xSBLHQ3Fyuu799A7FI9RUh5IIIawm
	 /zw3xtSq+jOwdo3aM3L1zakD4tVlSLuA3zqwHOpBmC4GxCLVxamdSPZe3YJtMRo8x2qNB
	 SnQLIRuZ2F7cWU71iE4SNyFsm3G84tg1B4dAVkIwfkorUXDy8HKX4xyjYIOnsE3cnYkSk
	 Nw7tdT4pvYwy9WGcM20q1pkFPKt8YTj2TrAou+wA6/UDZ3DKobVLnw9UblcHfgpBz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Az/Miehr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4A6082BF7;
	Fri,  6 Nov 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Az/Miehr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DCD1F008A2;
	Fri,  6 Nov 2026 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978417;
	bh=chljuawuQqoVUbkR6TZgo3ovuu5Trbmjx9rGpS1wdQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Az/Miehr2813/EFLF7KkEjgqSxF7CigPWoMeQlkWi9a2S3L3mLyDkrE89UstWCiYQ
	 RdkUKiWK8eud1v0maQrSTeniRTSkxXr+/1Z4qZ6mPAFxVlqCcJGN+o8T8eb1Znb8r+
	 /h6gqWqqRBsyQlBF51u0nHENgAsrWRpZRnc3DYQCLes0fMGQAMUeWLCFSSR2D/CHof
	 IvNipRR2CIvCo8RKNJAf1XaSIKffbGbBvNiUVvQAtemiTeCzMWYuuCuRwJiXRlZL8q
	 PQeQtll/W9nbWYHr2xWho8toXmMfBS4cJnczRyRuEyeWhBs8aIDFDrCV6ZFA0Y9KBe
	 RbKMS3THSARJQ==
Message-ID: <sashiko-outbox-201663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] spi: spi-geni-qcom: Add transfer_one_message()
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-qspi_upstream_series-v1-1-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-1-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:20:17 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] spi: spi-geni-qcom: unreset started flag in
  spi_geni_transfer_one_message()
- [Medium] spi: spi-geni-qcom: double handle_se_timeout() call on target
  abort
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] spi: geni-qcom: incorrect DMA timeout handling in
  spi_geni_target_abort() [1]
--

commit 3683cd703233401c535fc67323251b79d0c02313
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

spi: spi-geni-qcom: Add transfer_one_message() support

This commit replaces the SPI core's default transfer_one_message() path in
the Qualcomm GENI SPI driver with a driver-specific implementation that
handles message sequencing, GPIO chip-select control, transfer delays, DMA
buffer synchronization, and error recovery.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 6c57f8309a3b2..25c03096ee23f 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -935,16 +940,206 @@ static int spi_geni_transfer_one(struct spi_contro=
ller *spi,

[ ... ]

> +static int spi_geni_transfer_one_message(struct spi_controller *spi,
> +					 struct spi_message *msg)
> +{
> +	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
> +	struct spi_device *spi_slv =3D msg->spi;
> +	struct spi_transfer *xfer, *next_xfer;
> +	bool keep_cs =3D false;
> +	bool dma_synced =3D false;
> +	bool started =3D false;
> +	int ret =3D 0;
> +
> +	xfer =3D list_first_entry(&msg->transfers, struct spi_transfer, transfe=
r_list);
> +	spi_geni_set_cs(spi_slv, !xfer->cs_off);
> +
> +	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
> +		if ((xfer->tx_buf || xfer->rx_buf) && xfer->len) {
> +			reinit_completion(&mas->xfer_done);
> +
> +			/* Synchronize buffers only for DMA; the SE FIFO path uses CPU access=
. */
> +			dma_synced =3D mas->cur_xfer_mode =3D=3D GENI_GPI_DMA ||
> +				     ((xfer->tx_sg.nents || xfer->rx_sg.nents) &&
> +				      xfer->tx_sg.nents <=3D 1 && xfer->rx_sg.nents <=3D 1);
> +			if (dma_synced)
> +				spi_geni_dma_sync(spi, xfer, true);
> +
> +			ret =3D spi_geni_transfer_one(spi, spi_slv, xfer);
> +			if (ret < 0) {
> +				dev_err(mas->dev, "Transfer failed: %d\n", ret);
> +				goto out_err;
> +			}
> +			started =3D true;
> +
> +			ret =3D spi_geni_wait_for_xfer(spi, xfer);
> +			if (ret)
> +				goto out_err;
> +
> +			/* DMA errors and target aborts are reported through msg->status. */
> +			if (msg->status !=3D -EINPROGRESS) {
> +				ret =3D msg->status;
> +				goto out_err;
> +			}
> +			if (dma_synced) {
> +				spi_geni_dma_sync(spi, xfer, false);
> +				dma_synced =3D false;
> +			}
> +		} else if (xfer->len) {
> +			dev_err(&spi_slv->dev,
> +				"Bufferless transfer has length %u\n", xfer->len);
> +			ret =3D -EINVAL;
> +			goto out_err;
> +		}
> +
> +		msg->actual_length +=3D xfer->len;
> +		ret =3D spi_transfer_delay_exec(xfer);
> +		if (ret)
> +			goto out_err;

[ ... ]

> +out_err:
> +	if (!ret && msg->status !=3D -EINPROGRESS)
> +		ret =3D msg->status;
> +
> +	if (ret && started)
> +		spi_geni_handle_err(spi, msg);

[Severity: Medium]
Should started be reset to false after each transfer completes, just like
dma_synced?

In a multi-transfer message, if one transfer finishes normally and a
subsequent transfer fails before starting hardware (for example, failing
the bufferless transfer check or set_rate() in setup_se_xfer()), started
remains true from the earlier transfer.  The out_err path then calls
spi_geni_handle_err() on an idle controller, where handle_se_timeout()
issues cancel and abort commands with no active transfer, waits up to two
seconds on completion timeouts, and sets mas->abort_failed =3D true, causing
later transfers to fail with -EBUSY.

[ ... ]

> @@ -1057,11 +1253,14 @@ static irqreturn_t geni_spi_isr(int irq, void *da=
ta)
> =20
>  static int spi_geni_target_abort(struct spi_controller *spi)
>  {
> +	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
> +
>  	if (!spi->cur_msg)
>  		return 0;
> =20
> +	spi->cur_msg->status =3D -ECANCELED;
>  	handle_se_timeout(spi);

[Severity: High]
This problem wasn't introduced by this patch, but spi_geni_target_abort()
unconditionally calls handle_se_timeout() regardless of mas->cur_xfer_mode
[1].  When operating in GENI_GPI_DMA mode, this skips
handle_gpi_timeout() and dmaengine_terminate_sync(), and instead writes SE
registers such as SE_GENI_TX_WATERMARK_REG while the GPI DMA engine is
still active, leaving the controller in an unrecoverable state.  Should
this call spi_geni_handle_err() or dispatch on mas->cur_xfer_mode?

> -	spi_finalize_current_transfer(spi);
> +	complete(&mas->xfer_done);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does setting spi->cur_msg->status =3D -ECANCELED here cause
handle_se_timeout() to run twice on every target abort?

spi_geni_target_abort() calls handle_se_timeout() and then completes
mas->xfer_done.  When spi_geni_transfer_one_message() wakes up, it sees
msg->status !=3D -EINPROGRESS, sets ret =3D -ECANCELED, and jumps to out_err
with started =3D=3D true, which calls spi_geni_handle_err() ->
handle_se_timeout() a second time on the already-aborted hardware.  Because
mas->cur_xfer is already NULL on the second call, handle_se_timeout()
issues a redundant abort command that can time out after 1 second and set
mas->abort_failed =3D true.

In addition, if wait_for_completion_interruptible() in
spi_geni_wait_for_xfer() is interrupted by a signal at the same time as
spi_geni_target_abort(), both threads run handle_se_timeout() concurrently
without serialization on mas->abort_done, mas->tx_reset_done, and
mas->rx_reset_done.

[1] https://sashiko.dev/#/bug/linux-9f164df4-358b-4ab0-bbe7-3843965ed2e8

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-qspi_upstr=
eam_series-v1-0-21f43042dd60@oss.qualcomm.com?part=3D1
