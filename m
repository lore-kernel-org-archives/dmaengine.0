Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979155;
	b=XTPrNOTkKOkj2VgFDRQMmOxNm/u+LEKJOGqmfWTYqCuIEP9VBEfYv/4X9U5M0VYrMpCC
	 5YtDihhEilre2IBpDUEpfkK/oEhYJFHwkfzX+2c4L1sbiJjBeTA9Xx2YEG93fPMXyXO1Q
	 LjFUCR0BEvp06rRuyDkeyD2mJBzHywkSVE2Mynn0S9aQoP/sE3AHwrwZnaXFZCWGi8Awr
	 7rdg49r1LCt/SjohxIMG68WAwcDpVdfXfPYWhtlfCldNsvsPDqSDW8UY5ckHcdsJ9VNCj
	 fZBi3dcemC/6/XI7l+eGXOsfSJ928st5iMMCIAwEZcKCUlvrnBgUxxs3K3dNZo0gOEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979155;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rMl1U7nW/90t6rAF9C09fPiFlgzHGi6pf3vP5zsdLEo=;
	b=IjjIjq1D+6/RnYEHjdVL+cW9PxGQcu6XWGS4Nl44lecDk8KnKjjCVB2PXWOfu8/Ru3Xe
	 ZCIkMegHiiIyj+cypbOHz2FNIdDkS3eJEmDoPLgJu5W9OBoyYqtWCDfsI9sKFKqCHoFpd
	 agyNZg17vz75opv26pf/Z3ewgkJn9J8ebx/fb5GUrrJgtshADPNOeaIKACLOvOCjXajCg
	 +6DCuu0m0U7UptUErTa6BBgwAOA8J3Kc4BPxNo6HKYiI0WveSf8ZvdKBBrj0ZfSZsQrUK
	 Qp0as8zV6Ub7JoqEB3ywuoJuQWP4i8wgxoFCzWrJD//ImB7JkFdD6zOmaxDAlpWRPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcLnXvYU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFEA606A32E;
	Fri,  6 Nov 2026 15:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcLnXvYU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDC41F0089F;
	Fri,  6 Nov 2026 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793979154;
	bh=rMl1U7nW/90t6rAF9C09fPiFlgzHGi6pf3vP5zsdLEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcLnXvYUEWWrBvAo08yoYrjkW+c9s8Zh9CJVM+RvoTJvRoEApeQcSddXogm7N7eiT
	 we8EtwvudiAJc48jRjw9QWvAp/6GqIidxZNkXNraMT8wmoIAX2WtnbzFEO7NF71RF4
	 c6abvOo7BBPjyPUSW5N8UxC2MYa/ooHa65xbLs6aMT+w31c5arc8GJZDirAfN76KFi
	 zamrxKxD1rsSB7Ph9h6lm6EFdsJUPLYG5EaMGHA0i6fE07hxAREvh8V8Oh7nXVTgLE
	 NtE/77LSxdC6yiMKmHmaEGkvc7p7nzDDEHTZjLuom8wsJHBBnxWiSDGejf4ln4N8la
	 x8hQ4wcO3H50A==
Message-ID: <sashiko-outbox-201699@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] spi: spi-geni-qcom: Add QSPI support over GPI DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-qspi_upstream_series-v1-6-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-6-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:32:33 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] spi: spi-geni-qcom: dummy_data len treated as cycles in
  setup_gsi_xfer()
- [Medium] spi: spi-geni-qcom: uncombined dummy_data sent as TX in
  setup_gsi_xfer()
- [Medium] spi: spi-geni-qcom: unreset started flag in
  spi_geni_transfer_one_message()
- [Medium] spi: geni-qcom: unvalidated tx_nbits and phase split in
  setup_gsi_xfer()
--

commit d6c09f855544d5373d7663c53224613976d60d6e
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

spi: spi-geni-qcom: Add QSPI support over GPI DMA

This commit adds QSPI controller support over GPI DMA for the
qcom,geni-qspi compatible, combining TX, optional dummy, and RX transfers
into a single SPI_TX_RX command.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c2c3400b24c41..26dad85a590e3 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
[ ... ]
> @@ -412,27 +421,50 @@ spi_gsi_callback_result(void *cb, const struct dmae=
ngine_result *result)
[ ... ]
>  static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_mas=
ter *mas,
> -			  struct spi_device *spi_slv, struct spi_controller *spi)
> +			  struct spi_device *spi_slv, struct spi_controller *spi,
> +			  struct spi_transfer *tx_rx_xfer)
>  {
>  	unsigned long flags =3D DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>  	struct dma_slave_config config =3D {};
>  	struct gpi_spi_config peripheral =3D {};
> -	struct dma_async_tx_descriptor *tx_desc, *rx_desc;
> +	struct dma_async_tx_descriptor *tx_desc, *rx_desc =3D NULL;
> +	struct spi_transfer *last =3D tx_rx_xfer ?: xfer;
>  	int ret;
> =20
> +	/* QSPI receives data only as part of a combined TX-then-RX command. */
> +	if (mas->dev_data->is_qspi && xfer->rx_buf && !tx_rx_xfer)
> +		return -EOPNOTSUPP;
> +
>  	config.peripheral_config =3D &peripheral;
>  	config.peripheral_size =3D sizeof(peripheral);
>  	peripheral.set_config =3D true;
> @@ -443,20 +475,21 @@ static int setup_gsi_xfer(struct spi_transfer *xfer=
, struct spi_geni_master *mas
>  		mas->cur_speed_hz =3D xfer->speed_hz;
>  	}
> =20
> -	if (xfer->tx_buf && xfer->rx_buf) {
> +	if (mas->dev_data->is_qspi && tx_rx_xfer) {
> +		/* Combine the command and data phases into one hardware command. */
> +		peripheral.cmd =3D SPI_TX_RX;
> +		peripheral.rx_len =3D get_xfer_len_in_words(tx_rx_xfer, mas);
> +	} else if (xfer->tx_buf && xfer->rx_buf) {
>  		peripheral.cmd =3D SPI_DUPLEX;
>  	} else if (xfer->tx_buf) {
>  		peripheral.cmd =3D SPI_TX;
>  		peripheral.rx_len =3D 0;
>  	} else if (xfer->rx_buf) {
>  		peripheral.cmd =3D SPI_RX;
> -		if (!(mas->cur_bits_per_word % MIN_WORD_LEN)) {
> -			peripheral.rx_len =3D ((xfer->len << 3) / mas->cur_bits_per_word);
> -		} else {
> -			int bytes_per_word =3D (mas->cur_bits_per_word / BITS_PER_BYTE) + 1;
> -
> -			peripheral.rx_len =3D (xfer->len / bytes_per_word);
> -		}
> +		peripheral.rx_len =3D get_xfer_len_in_words(xfer, mas);
> +	} else {
> +		dev_err(mas->dev, "Invalid transfer: no tx_buf or rx_buf\n");
> +		return -EINVAL;
>  	}

[Severity: Medium]
Can an uncombined dummy_data transfer or a bufferless transfer be sent on
the bus as an active SPI_TX DMA transfer here?

In GENI_GPI_DMA mode, spi->flags has SPI_CONTROLLER_MUST_TX set, so
spi_map_msg() sets xfer->tx_buf =3D spi->dummy_tx on every non-empty
transfer without a tx_buf (and callers such as spi_mem_exec_op() also
populate tx_buf on dummy_data transfers).  If a dummy_data transfer is not
merged into a [TX, dummy, RX] sequence in spi_geni_transfer_one_message(),
or if a transfer has no caller-supplied tx_buf or rx_buf, xfer->tx_buf is
still non-NULL.  It bypasses the bufferless check in
spi_geni_transfer_one_message() and takes the SPI_TX branch in
setup_gsi_xfer() with dummy_cycles =3D 0, driving dummy_tx bytes onto the
data lines instead of tri-stating or returning an error.  Because
xfer->tx_buf is always populated in GPI DMA mode, the SPI_RX and -EINVAL
branches here are also unreachable.

> @@ -466,6 +499,17 @@ static int setup_gsi_xfer(struct spi_transfer *xfer,=
 struct spi_geni_master *mas
>  	peripheral.pack_en =3D true;
>  	peripheral.word_len =3D xfer->bits_per_word - MIN_WORD_LEN;
> =20
> +	/* TRE_SPI_C0_DUMMY_CYCLES in the CONFIG0 TRE is an 8-bit field */
> +	if (mas->dummy_len > U8_MAX) {
> +		dev_err(mas->dev, "Dummy cycles %u exceed hardware limit %u\n",
> +			mas->dummy_len, (unsigned int)U8_MAX);
> +		return -EINVAL;
> +	}
> +	peripheral.dummy_cycles =3D mas->dummy_len;
> +
> +	if (mas->dev_data->is_qspi)
> +		peripheral.qspi_mode =3D spi_geni_qspi_mode(last);
[ ... ]
> @@ -1058,6 +1153,54 @@ static int spi_geni_transfer_one_message(struct sp=
i_controller *spi,
>  	spi_geni_set_cs(spi_slv, !xfer->cs_off);
> =20
>  	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
> +		mas->dummy_len =3D 0;
> +		last_xfer =3D xfer;
> +
> +		/*
> +		 * Combine a TX phase, optional dummy phase and RX phase into
> +		 * one QSPI command.
> +		 */
> +		if (mas->dev_data->is_qspi && mas->cur_xfer_mode =3D=3D GENI_GPI_DMA &&
> +		    xfer->len && xfer->tx_buf && xfer->tx_buf !=3D spi->dummy_tx &&
> +		    !xfer->rx_buf && !xfer->dummy_data &&
> +		    !list_is_last(&xfer->transfer_list, &msg->transfers)) {
> +			next_xfer =3D list_next_entry(xfer, transfer_list);
> +
> +			if (next_xfer->dummy_data &&
> +			    !list_is_last(&next_xfer->transfer_list, &msg->transfers)) {
> +				/* The current client supplies the dummy length in cycles. */
> +				mas->dummy_len =3D next_xfer->len;
> +				next_xfer =3D list_next_entry(next_xfer, transfer_list);
> +			}

[Severity: High]
Does assigning next_xfer->len directly to mas->dummy_len program the wrong
number of dummy clock cycles for standard SPI clients?

In struct spi_transfer, len is always in bytes: the SPI core validates
word alignment, allocates dummy_tx, DMA-maps the buffer, and accounts
msg->actual_length (below in this function) in bytes, and callers such as
spi_mem_exec_op() set len =3D op->dummy.nbytes and tx_nbits =3D
op->dummy.buswidth.  Passing next_xfer->len directly into
peripheral.dummy_cycles without converting bytes to cycles via
(next_xfer->len * BITS_PER_BYTE) / next_xfer->tx_nbits programs too few
dummy cycles (for example, 8x too few in 1-bit mode), corrupting QSPI read
data.

> +
> +			/* Ignore the TX buffer inserted by SPI_CONTROLLER_MUST_TX. */
> +			if (next_xfer->len && next_xfer->rx_buf && !next_xfer->dummy_data &&
> +			    (!next_xfer->tx_buf || next_xfer->tx_buf =3D=3D spi->dummy_tx)) {
> +				last_xfer =3D next_xfer;
> +			} else {
> +				mas->dummy_len =3D 0;
> +			}
> +		}
> +
> +		if (last_xfer !=3D xfer) {
> +			next_xfer =3D xfer;
> +			for (;;) {
> +				/* A combined command cannot change timing or CS between phases. */
> +				if (next_xfer->speed_hz !=3D xfer->speed_hz ||
> +				    next_xfer->bits_per_word !=3D xfer->bits_per_word ||
> +				    next_xfer->cs_off || next_xfer->dtr_mode ||
> +				    next_xfer->word_delay.value ||
> +				    (next_xfer !=3D last_xfer &&
> +				     (next_xfer->cs_change || next_xfer->delay.value))) {
> +					ret =3D -EOPNOTSUPP;
> +					goto out_err;
> +				}
> +				if (next_xfer =3D=3D last_xfer)
> +					break;
> +				next_xfer =3D list_next_entry(next_xfer, transfer_list);
> +			}
> +		}

[Severity: Medium]
Does combining transfers into SPI_TX_RX drop the bus width of the TX and
dummy phases and fail to combine split command/address transfers?

In setup_gsi_xfer(), peripheral.qspi_mode is derived only from
spi_geni_qspi_mode(last), ignoring xfer->tx_nbits on the TX transfer and
next_xfer->tx_nbits on the dummy transfer, and this validation loop does
not check whether the phase bus widths are compatible with the single GO
TRE mode.  In addition, because spi_geni_probe() sets SPI_TX_DUAL/QUAD and
SPI_RX_DUAL/QUAD without implementing ctlr->mem_ops, spi_mem_exec_op()
splits reads with an address into four transfers ([CMD TX, ADDR TX, DUMMY,
DATA RX]); the combiner above only merges a single TX transfer before
DUMMY and DATA RX, sending CMD TX as a separate SPI_TX command.

> +
>  		if ((xfer->tx_buf || xfer->rx_buf) && xfer->len) {
>  			reinit_completion(&mas->xfer_done);
> =20
> @@ -1066,16 +1209,17 @@ static int spi_geni_transfer_one_message(struct s=
pi_controller *spi,
>  				     ((xfer->tx_sg.nents || xfer->rx_sg.nents) &&
>  				      xfer->tx_sg.nents <=3D 1 && xfer->rx_sg.nents <=3D 1);
>  			if (dma_synced)
> -				spi_geni_dma_sync(spi, xfer, true);
> +				spi_geni_dma_sync(spi, xfer, last_xfer, true);
> =20
> -			ret =3D spi_geni_transfer_one(spi, spi_slv, xfer);
> +			ret =3D spi_geni_transfer_one(spi, spi_slv, xfer,
> +						    last_xfer =3D=3D xfer ? NULL : last_xfer);
>  			if (ret < 0) {
>  				dev_err(mas->dev, "Transfer failed: %d\n", ret);
>  				goto out_err;
>  			}
>  			started =3D true;
> =20
> -			ret =3D spi_geni_wait_for_xfer(spi, xfer);
> +			ret =3D spi_geni_wait_for_xfer(spi, xfer, last_xfer);
>  			if (ret)
>  				goto out_err;
> =20
> @@ -1085,7 +1229,7 @@ static int spi_geni_transfer_one_message(struct spi=
_controller *spi,
>  				goto out_err;
>  			}
>  			if (dma_synced) {
> -				spi_geni_dma_sync(spi, xfer, false);
> +				spi_geni_dma_sync(spi, xfer, last_xfer, false);
>  				dma_synced =3D false;
>  			}
>  		} else if (xfer->len) {

[Severity: Medium]
Should started be reset to false after a transfer completes, just like
dma_synced?

If one transfer in a message completes normally and a subsequent transfer
fails validation before hardware submission (such as the combined-phase
check above or the -EOPNOTSUPP / -EINVAL checks in setup_gsi_xfer()),
out_err sees started =3D=3D true from the earlier transfer and calls
spi_geni_handle_err() on an idle controller, resetting the GPI DMA
channels or issuing cancel/abort commands that time out.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-qspi_upstr=
eam_series-v1-0-21f43042dd60@oss.qualcomm.com?part=3D6
