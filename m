Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524104;
	b=Cj7H/BDLiF8m1orDPVEHbyD0o4vH5XFMR7JpQX5Bh63yB9Ma0V7KE2o9nhDvsdh7HQWO
	 2Jk/XocfcxbuuGjobZ5lXS6s/LBhmO1gvFXdQ6qgPrPDQwK321HUjXhAcLIlImukfubkP
	 WuzKZCBIQdYv12aMEnRFhd65z2Uj7u/fpBQPShsp04n6CSmeekvpmWkK2T1BhPIhTN6O7
	 9rof8C09uEfblOOM4SQgnMe1XxgerB2Nkpf6kIRHZSUyk6CWajNl/I2KKT2UfQKDnWboE
	 041p7Ln37NQmduPvA9EftZXx2649jBZdymc6Kic4WzxkfdaYp0z37KGXa+jrVmoim4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524104;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VonIu9bN0fYZojuGis/ktvDMkeVk1+tCiu8w9p6vW+g=;
	b=n51tDeLNcgHoBjfi26bbsBWCpkO0mgB3C+0rV5PvSZ5kAUioauOyjWLRnxWq72QbWc+i
	 9otYasR+GmJ44/AhO0/sBjcXab9Uc5k4vv1eMAMt8r66yt8L4HmQNRxUbUe65DSiOPYHF
	 KAfYW9iUphzsqWNvHklkc/4lX0XU2MPoH02a/zX2nNusK2niniNRRD31msXXw/fTz/U+A
	 zrl2DZKyGmn1z8w0vDI0AdTgkWiyaK0SreDLDm7VqW6uHuFxT+WGADq8mjVpcZ8mgAo99
	 hrfMkM2LICRqhchoZwPInfG0ZHUG3mEOjNs9nB9OY/ubyTOmPhmwtBoD4P+bnR1Z9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZb+KTk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABC606A322;
	Tue, 24 Nov 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZb+KTk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB011F000C0;
	Tue, 24 Nov 2026 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795524103;
	bh=VonIu9bN0fYZojuGis/ktvDMkeVk1+tCiu8w9p6vW+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XZb+KTk2FYrJjSKRVeyRcinPCfst09CgJjdugDaw7vLn9OsO8tqKkb3BjL4/D6GH7
	 YVrxWE1w5hyhMRyJi2LT/lTNuorSnMV8W1zZPG6emT8jQ+QnyNL9xsLHGz7N+FB4jp
	 phMLlFfdwbj9kTfbufl1702gVsTtTNOb/QjC26D/tHlzm4Jh5xX8hWhdybXNhYnCEW
	 vmXy3Kiuoi6sp79KLDXYdY590/zp+JL1oX356h9wPxrCNAD+mp3D2q3qfPb/UpZA29
	 wJaFc8h4X0sE8fjc5Xn/00fJZG8lkH2KOkmxaEBPxal31f+tCUahEwEqGVPoYHHwrO
	 SKiztNX3al+rQ==
Message-ID: <sashiko-outbox-231162@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] spi: spi-geni-qcom: Add QSPI support over GPI
 DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-qspi_qup_upstream-v2-6-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
 <20261124-qspi_qup_upstream-v2-6-cd69894107c8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:41:42 +0000
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
- [Medium] spi: spi-geni-qcom: unvalidated tx_nbits and phase split in
  setup_gsi_xfer()
- [Medium] spi: spi-geni-qcom: unreset started flag in
  spi_geni_transfer_one_message()
--

commit 3cee624932aec05c72fd7f3325666f8b401b4c9e
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

spi: spi-geni-qcom: Add QSPI support over GPI DMA

This commit adds QSPI controller support over GPI DMA for the
qcom,geni-qspi compatible, combining TX, optional dummy, and RX phases into
a single SPI_TX_RX hardware command.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 631908522957a..c2f14554c4a1e 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
[ ... ]
> @@ -418,27 +427,50 @@ spi_gsi_callback_result(void *cb, const struct dmae=
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
> @@ -449,20 +481,21 @@ static int setup_gsi_xfer(struct spi_transfer *xfer=
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
Can an uncombined dummy_data transfer be sent onto the wire as an active
SPI_TX transfer here?

In GENI_GPI_DMA mode, spi_geni_probe() sets SPI_CONTROLLER_MUST_TX, so
spi_map_msg() populates xfer->tx_buf =3D ctlr->dummy_tx for any non-empty
transfer without a TX buffer (and callers such as spi_mem_exec_op() also
set tx_buf on dummy transfers).  When a dummy_data transfer is not paired
into a [TX, dummy, RX] sequence by spi_geni_transfer_one_message(),
setup_gsi_xfer() does not reject xfer->dummy_data and instead takes the
else if (xfer->tx_buf) branch with dummy_cycles =3D 0, actively driving dum=
my
bytes on the bus instead of tri-stating for dummy clock cycles or returning
-EOPNOTSUPP.

Because SPI_CONTROLLER_MUST_TX always populates xfer->tx_buf, bufferless
transfers with len > 0 also take the SPI_TX branch instead of failing with
-EINVAL, and non-QSPI RX-only transfers take SPI_DUPLEX, leaving the SPI_RX
and else branches unreachable.

[ ... ]
> @@ -1056,7 +1149,7 @@ static int spi_geni_transfer_one_message(struct spi=
_controller *spi,
>  {
>  	struct spi_geni_master *mas =3D spi_controller_get_devdata(spi);
>  	struct spi_device *spi_slv =3D msg->spi;
> -	struct spi_transfer *xfer, *next_xfer;
> +	struct spi_transfer *xfer, *next_xfer, *last_xfer;
>  	bool keep_cs =3D false;
>  	bool dma_synced =3D false;
>  	bool started =3D false;
> @@ -1066,6 +1159,54 @@ static int spi_geni_transfer_one_message(struct sp=
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

In struct spi_transfer, len is in bytes, and callers such as
spi_mem_exec_op() set dummy_data transfer len to op->dummy.nbytes and
tx_nbits to op->dummy.buswidth:

drivers/spi/spi-mem.c:spi_mem_exec_op() {
    ...
	if (op->dummy.nbytes) {
		xfers[xferpos].tx_buf =3D tmpbuf + op->cmd.nbytes +
					op->addr.nbytes;
		xfers[xferpos].len =3D op->dummy.nbytes;
		xfers[xferpos].tx_nbits =3D op->dummy.buswidth;
		xfers[xferpos].dummy_data =3D 1;
    ...
}

setup_gsi_xfer() writes mas->dummy_len directly into
peripheral.dummy_cycles (TRE_SPI_C0_DUMMY_CYCLES) without converting from
bytes via (next_xfer->len * BITS_PER_BYTE) / next_xfer->tx_nbits, while
spi_geni_transfer_one_message() also adds next_xfer->len as bytes into
msg->actual_length.  As a result, standard QSPI reads with a dummy phase
program 8x, 4x, or 2x too few dummy cycles in single, dual, or quad mode,
corrupting the read data.

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
Does a combined QSPI read validate buswidth across phases or handle split
command and address TX transfers?

setup_gsi_xfer() sets peripheral.qspi_mode from spi_geni_qspi_mode(last),
programming a single GO TRE mode for the entire SPI_TX_RX command from
last->rx_nbits while ignoring xfer->tx_nbits and the dummy phase tx_nbits,
and the loop above does not check that tx_nbits and rx_nbits are compatible
with that single mode.

In addition, because the driver advertises SPI_TX/RX_DUAL and
SPI_TX/RX_QUAD without implementing mem_ops, spi_mem_exec_op() builds four
transfers ([CMD TX, ADDR TX, DUMMY, DATA RX]) when an address phase is
present; the lookahead above only combines one TX transfer before the dummy
and RX phases, so CMD TX is sent as a separate SPI_TX command before
[ADDR TX, DUMMY, DATA RX].

> +
>  		if ((xfer->tx_buf || xfer->rx_buf) && xfer->len) {
>  			reinit_completion(&mas->xfer_done);
> =20
> @@ -1074,16 +1215,17 @@ static int spi_geni_transfer_one_message(struct s=
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
> @@ -1093,7 +1235,7 @@ static int spi_geni_transfer_one_message(struct spi=
_controller *spi,
>  				goto out_err;
>  			}
>  			if (dma_synced) {
> -				spi_geni_dma_sync(spi, xfer, false);
> +				spi_geni_dma_sync(spi, xfer, last_xfer, false);
>  				dma_synced =3D false;
>  			}

[Severity: Medium]
Should started be reset to false once a transfer completes?

When an earlier transfer in a multi-transfer message finishes normally and
a later transfer fails validation or setup before being submitted to
hardware (such as the combined-phase check above or the checks in
setup_gsi_xfer()), started is still true at out_err.  That causes
spi_geni_handle_err() to run on an idle controller, terminating and
restarting the GPI DMA channels (or issuing SE cancel/abort commands that
time out when no transfer is active).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qspi_qup_u=
pstream-v2-0-cd69894107c8@oss.qualcomm.com?part=3D6
