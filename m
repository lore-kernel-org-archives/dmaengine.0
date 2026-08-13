Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05715478E5E;
	Thu, 13 Aug 2026 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630491; cv=none; b=e7F3lnZ9JlUupQe3ugP808jw1jwAj9iW1BX5VEAGlkEKLtyFCoTKgrm0x32P1TrkUSaxVSwZoao9IRepKKvqyImCjDUr0wIrtnUVBA8zYEWsHaqX6vaWYiy735ogKxHoxhLq8PWwXuhH/afH/HJXpSJ5F+guCdd87y0oFWjrDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630491; c=relaxed/simple;
	bh=3Ldiv6qKaF7WTl9mITxfZusGD7VlDtn3WbU0WNRR7E0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=esvcc57xxQ4HvLW4SuGkU9ffhwi9yJnq9+nepUvNgoYoDFydOQ84FpZychA7mioeLfle5+tZanPys/+izX+3uMXWk+UeRRNnIUPH4f7/6MAoyCSciFcsnml4z2Rl/7NrjR970eCV5XD9ROe51YPhPp00SdIzmhEKXwUpeQs+Mfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgdFBlpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgdFBlpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338661F00A3A;
	Thu, 13 Aug 2026 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630489;
	bh=WttXvDp29y169g7N91pAtzFglCfJrv7CFIxCYNeCODc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HgdFBlpjvBRLTfqdao3yUUY0KZ47RglDZfVPa8VRcUM3faK4lmDRm2wzXrgNgsjYp
	 gYWwFj1iugVPzj1MzEm3DIQmD5RTd6C+T6X3NzgjHKCbX8r2AfMl/goQoXhL65U+g/
	 Iu/HPnF9o/ILPHe7gEeno4GkTajxtEU4V6PyWgRPGXi5MOJG1E+h3/yFH7YRhol6AA
	 x0MXdZZQhZMH86dr6Xl71N2jw3zCPgM7R6K4yDOJAil48U6TiIPCP0YOSPEvKos7nZ
	 dJQQXyZtMLSpB8ljysHestcyDYW3qIp5oHLxxQantG+NAh948w7btYF8fC5quI+YOb
	 xBBdnrtymwLLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/4] i2c: qcom-geni: Support multi-owner controllers
 in GPI mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260813140047.1006478-5-mukesh.savaliya@oss.qualcomm.com>
References: <20260813140047.1006478-1-mukesh.savaliya@oss.qualcomm.com>
 <20260813140047.1006478-5-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:14:48 +0000
Message-Id: <20260813141449.338661F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Premature hardware lock release breaks multi-owner transaction ato=
micity
- [Medium] PM runtime usage counter leak on `geni_i2c_init` error path

Pre-existing issues:
- [Critical] Double free and use-after-free of DMA bounce buffers in `geni_=
i2c_gpi_xfer()`
- [High] Memory leak of DMA tracking arrays on multi-descriptor transfer er=
ror paths
--

--- Patch [4]: [PATCH v9 4/4] i2c: qcom-geni: Support multi-owner controlle=
rs in GPI mode ---
commit e932d5c4bcfb356d1e0cbaf5c247b0bd50b4e7e8
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

i2c: qcom-geni: Support multi-owner controllers in GPI mode
   =20
Some platforms use a QUP-based I2C controller in a configuration where the
controller is shared with another system processor. In this setup the
operating system must not assume exclusive ownership of the controller or
its associated pins.
   =20
Add support for enabling multi-owner operation when DeviceTree specifies
qcom,qup-multi-owner.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -829,6 +829,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2=
c, struct i2c_msg msgs[], i
>  	peripheral.clk_div =3D itr->clk_div;
>  	peripheral.set_config =3D 1;
>  	peripheral.multi_msg =3D false;
> +	peripheral.multi_owner =3D gi2c->se.multi_owner;

[Severity: High]
Does this setup cause premature hardware lock releases, breaking the
multi-owner atomicity?

In geni_i2c_gpi(), the interrupt flag is unconditionally set for sequential
transfers:

geni_i2c_gpi() {
    ...
    } else {
        flags =3D DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
    }
    ...
}

Since the GPI driver inserts an UNLOCK TRE when DMA_PREP_INTERRUPT is set,
would a multi-message sequence like Write-then-Read drop the hardware lock
mid-transaction while the bus is stretched?

[Severity: Critical]
This is a pre-existing issue, but does geni_i2c_gpi_xfer() have a double fr=
ee
bug on its DMA bounce buffers?

The tx_buf and rx_buf variables are initialized outside the loop, but are n=
ot
reset at the top of each iteration:

geni_i2c_gpi_xfer() {
    void *tx_buf =3D NULL, *rx_buf =3D NULL;
    ...
    for (i =3D 0; i < num; i++) {
        ...
        if (msgs[i].flags & I2C_M_RD) {
            geni_i2c_gpi(..., &rx_buf, ...);
        }
        ...
        geni_i2c_gpi_unmap(..., rx_buf, ...);
    }
}

If a message sequence contains a Read followed by a Write, rx_buf is mapped
in the Read iteration and then freed in geni_i2c_gpi_unmap(). In the next
Write iteration, rx_buf is not reset to NULL and not overwritten, causing
geni_i2c_gpi_unmap() to use and free the stale pointer again:

geni_i2c_gpi_unmap() {
    ...
    if (rx_buf) {
        dma_unmap_single(...);
        i2c_put_dma_safe_msg_buf(rx_buf, ...);
    }
}

[Severity: High]
This is a pre-existing issue, but is there a memory leak of the DMA tracking
arrays on the multi-descriptor transfer error paths?

If a multi-descriptor transfer encounters an error (like a device NACK),
gi2c->err is set and the cleanup loop in geni_i2c_gpi_multi_desc_unmap()
aborts early:

geni_i2c_gpi_multi_desc_unmap() {
    ...
    if (tx_multi_xfer->unmap_msg_cnt =3D=3D gi2c->num_msgs - 1) {
        kfree(tx_multi_xfer->dma_buf);
        kfree(tx_multi_xfer->dma_addr);
        break;
    }
    ...
}

Since unmap_msg_cnt never reaches num_msgs - 1 on an early error path, are
dma_buf and dma_addr permanently leaked?

[ ... ]

> @@ -1075,6 +1080,11 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
>  	} else {
>  		gi2c->gpi_mode =3D false;
> +
> +		if (gi2c->se.multi_owner)
> +			return dev_err_probe(gi2c->se.dev, -EINVAL,
> +					     "I2C sharing not supported in non-GSI mode\n");
> +

[Severity: Medium]
Does this early return leak the PM runtime usage counter?

By returning directly here, it seems to bypass the pm_runtime_put() cleanup
step at the err: label that the rest of the function uses on failure.

>  		tx_depth =3D geni_se_get_tx_fifo_depth(&gi2c->se);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813140047.1006=
478-1-mukesh.savaliya@oss.qualcomm.com?part=3D4
