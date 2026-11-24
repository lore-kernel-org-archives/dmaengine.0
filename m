Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523443;
	b=3hZm6fBJgOO6PPX2Q7307mP/JS3Fg5dlrEcSKw92zHaYimLEjOVuvJoaXdz6BQbHz9ae
	 1X/AG1+lSIW1uD5PumqaJZJTasCDNuv1w+vjFIU5GP4OsVDWdQXn4dOBaZVsxtK8g0HBd
	 oRGrwYmckbyBoA6LT1R4sf+5ZlIBn4hfIjyc0VnaWWzOZDpCfJ7u6Fw8JtkD24PhrFnSX
	 ZI0aqr9nGHLN32urEi7WVDDD92w2LYS3YUMNTs5sRNX1dyDDS+IO0qQh7chYzunu/nY7z
	 taRRj/7Z8Mbh4b1t3HTjeHJFd5lWG5ZfaQcmw5LRLX65dS99Th6QreH1Wjnhpz2uGaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LK1P7uDPd4RtQ5QpN+qBWe67//ohCfK5v8N49ign+j8=;
	b=stzwPgkpNDj23J9Ax2m+9whG7fgJ7kxQWN12sVbNfOYukBSQYdMGlVdO8I61/RkUWDtI
	 F1MnyTmhO9UJCWdfYYtrQ+Zh20m+ZnytvCqLjS9J/xG82LEcCH7xuzLnFXmJMfTn2ZJgJ
	 yiGaVUbpCUvzMBfPWtC7PsqYG9V6SfMknpW7Rjv0C4GwwgusgLig5SS+VmGoHxoPONLFR
	 3V96VB7h11YQ02KYeFe+sRDS9tDcCl4Y5A6kqBAKPrlaiWP1c7elftJsm5wi2tYAo6ChV
	 kKW8dv1LXnbBoqL6nAtRUio2E7WSRG0pCB/fFRGiYgR6JeB7NubqdsS6KVUH09qbjpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9spHILw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A6606A69D;
	Tue, 24 Nov 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9spHILw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F001F000E0;
	Tue, 24 Nov 2026 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523442;
	bh=LK1P7uDPd4RtQ5QpN+qBWe67//ohCfK5v8N49ign+j8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m9spHILwdNTBL5f9kgoq/rhmAwvL3uEUkVSeOjGkRWWFFFZxLKe659QtkpTntaqY2
	 khHYBswdPlfq2dct1lDUzQ8pJ5F2fAu+EzoZBfO5a8IhjmHeXKR1QGdYLWwAMG8Bmc
	 i8iDxXfcef6/a4IRA3u2rj38WSyjrBszWmMi2sTinM9uV14DsyD7Apay5ct74+dZyu
	 jsGH+v/8vhSupMzd27N34FdNpsmL9Z6inpN/NkKkQUbyJTzgvi5d4NTwRW0txZ76co
	 JvUTU5XcgkqD+PNDq7r+56H65TSgXUxsBZ3xPqew8MPgU5YptuVViEPzZHBez/+KE3
	 Q8hmWNhSlDHVA==
Message-ID: <sashiko-outbox-231139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] spi: spi-geni-qcom: Add transfer_one_message()
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-qspi_qup_upstream-v2-1-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
 <20261124-qspi_qup_upstream-v2-1-cd69894107c8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:30:41 +0000
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
--

commit 6aec5a29fbc76295782ba681ed33e86a4939fdbf
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

spi: spi-geni-qcom: Add transfer_one_message() support

This commit introduces a custom transfer_one_message() callback to manage
SPI message sequencing, transfer completion, DMA buffer synchronization,
and GPIO chip-select handling directly in the GENI SPI driver.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index e239c4333055b..0a15e75051d86 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
[ ... ]
> @@ -939,18 +945,209 @@ static int spi_geni_transfer_one(struct spi_contro=
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
[ ... ]
> +out_err:
> +	if (!ret && msg->status !=3D -EINPROGRESS)
> +		ret =3D msg->status;
> +
> +	if (ret && started)
> +		spi_geni_handle_err(spi, msg);

[Severity: Medium]
Should started be reset to false once a transfer completes?

Unlike dma_synced, started stays true across iterations of
msg->transfers.  If one transfer finishes normally and a subsequent
transfer in the same message fails before starting hardware (for example,
failing the bufferless transfer check or clk set_rate() in
setup_se_xfer()), out_err runs spi_geni_handle_err() on an idle
controller.  In GENI_SE_FIFO or GENI_SE_DMA mode, handle_se_timeout()
then issues cancel and abort commands with no active command, waiting up
to 2 seconds for completion timeouts and setting mas->abort_failed =3D true,
which causes future transfers to fail with -EBUSY.

[ ... ]

> @@ -1065,11 +1263,14 @@ static irqreturn_t geni_spi_isr(int irq, void *da=
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
> -	spi_finalize_current_transfer(spi);
> +	complete(&mas->xfer_done);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does setting spi->cur_msg->status =3D -ECANCELED here cause
handle_se_timeout() to run twice on a target abort?

After complete(&mas->xfer_done) wakes spi_geni_wait_for_xfer(),
spi_geni_transfer_one_message() sees msg->status !=3D -EINPROGRESS, sets
ret =3D -ECANCELED, and jumps to out_err with started =3D=3D true.  That ca=
lls
spi_geni_handle_err() -> handle_se_timeout() a second time on an already
aborted and idle serial engine, timing out after 1 second on
mas->abort_done and setting mas->abort_failed =3D true.

In addition, because spi_target_abort() runs without spi->io_mutex, if
wait_for_completion_interruptible() in spi_geni_wait_for_xfer() is
interrupted by a signal at the same time as spi_geni_target_abort(), both
threads call handle_se_timeout() concurrently without serialization on
mas->abort_done, mas->tx_reset_done, and mas->rx_reset_done.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qspi_qup_u=
pstream-v2-0-cd69894107c8@oss.qualcomm.com?part=3D1
