Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EF493644
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738703; cv=none; b=RvJgJJj57tXx+wWd/BauDekV6EJfhBq1l3DfHj3LkM4akpnPiS4+SeYdIieqMTbtoZJ3YEIQKlsLRkL1omSvBLtljp3za69+1mGMqvk6T+D56BFhWtzETs9CHr1Za2G4ioEdSs7zPM4xT7jvafGxJRo4LN42x9I5gj2VrD9os7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738703; c=relaxed/simple;
	bh=UMAZZ4ZDv/F+IliX9EbG8PNa9qGq4bOWIMLptcEPhiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=epP/K21K+EuBBVTpdhpgvaxV5k/7NhYjHjmOe5yej36JpcYgIz+J8Yp2CRI1izxW1TUeHi0xSo1BnLVP6BUeDLWHjYZaTiZMz/HHQwk6pvjtY2uZ7cVEqSAn8bOXr1C9R9q/21pE7xv978cM5TOlbNWk8+iyUBpgN3CGnuLMBVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9lrfzCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9lrfzCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9C21F000E9;
	Wed, 26 Aug 2026 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787738700;
	bh=wtX61/c1q7lgpBvEn87DUQ+tSgboQGraEgO7otsHwyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9lrfzCDM0amDa1YDsf6pehJMp929OVq9eWHTYcKEaAqxf6ejYrIxMAw2O2RXAusz
	 U/CeSMlGNyDUNK2TLSPxNttfW4LicPnDvGxclFzLum60diceypWZWWgxJ+0tATC2ss
	 AxtUr0WLQH95SQbBn269eTleURa60nmSUu1L+RgDyAxryMyt//qPNZW20twpZjSJdp
	 IYH6Lne+197nZS/v2srf7jS4o4uSM44gGOzecCyvOftrj8+jOoCRTdbdIJO0fgmL61
	 /r7cer+9AvyU8uP8w/5ySO0nBZM727Omj4hdA4gj/ZOuR3s2ga+8G/QXrXoQcH+Nkn
	 jZedVqWoUqRXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Randive" <aniket.randive@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:05:00 +0000
Message-Id: <20260826100500.9D9C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Double free and invalid DMA unmap in geni_i2c_gpi_xfer() due t=
o uninitialized rx_buf across loop iterations.
--

commit 1ca4e6273080dc8f5231d9130b61334c26638357
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>

i2c: qcom-geni: Add bus recovery support for GPI DMA mode

This commit adds bus recovery support for GPI DMA mode in the QCOM GENI I2C
driver. It implements I2C_BUS_CLEAR and I2C_STOP_ON_BUS opcodes via the
GPI TX DMA channel and updates the recovery trigger logic.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 9fa1a8ac400c3..85cb1367958c6 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[ ... ]

> @@ -1066,14 +1136,18 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	else
>  		ret =3D geni_i2c_fifo_xfer(gi2c, msgs, num);

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential double-free and
invalid DMA unmap in geni_i2c_gpi_xfer() during multi-message transfers.

Looking at geni_i2c_gpi_xfer() which is called just above this context,
the rx_buf pointer is initialized outside the message processing loop:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_xfer() {
    void *tx_buf =3D NULL, *rx_buf =3D NULL;
    ...
    for (i =3D 0; i < num; i++) {
        ...
        if (msgs[i].flags & I2C_M_RD) {
            ret =3D  geni_i2c_gpi(gi2c, msgs, &config,
                                &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
        ...
        if (!gi2c->is_tx_multi_desc_xfer)
            geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_=
addr);
}

If a multi-message transfer contains a read message followed by a write
message, rx_buf is allocated and set during the read message. During the
subsequent write message, the I2C_M_RD block is skipped, meaning rx_buf
is never reset to NULL.

The stale rx_buf pointer is then passed again to geni_i2c_gpi_unmap() at
the end of the write iteration:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_unmap() {
    ...
    if (rx_buf) {
        dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_=
DEVICE);
        i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
    }
}

Could this lead to a double-free of the bounce buffer and an invalid DMA
unmap since rx_buf retains its value from the previous read iteration?

> -	if (!gi2c->gpi_mode &&
> -	    (ret =3D=3D -EPROTO || ret =3D=3D -ETIMEDOUT || ret =3D=3D -EAGAIN)=
) {
> +	if (ret =3D=3D -EPROTO || ret =3D=3D -ETIMEDOUT || ret =3D=3D -EAGAIN ||
> +	    (gi2c->gpi_mode && ret =3D=3D -EIO)) {
>  		/*
>  		 * Only attempt recovery if SDA is stuck low. -EPROTO and
>  		 * -ETIMEDOUT indicate bus errors where the target may be

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-i2c_bus_re=
covery-v1-0-203f0ec76f84@oss.qualcomm.com?part=3D3
