Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFED3F20FA
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571601; cv=none; b=eLNdAljTeOCV1pSy367pHGSWZKCdz19u3/dcDw2RzWIKHto8I3dKJkh7Pk/tMnEu678WUCcDGVM9JMR36VyjeamrKCNTikJXaV6XziqKMk2JFiW/3nm6n4wU8A+j/kcDJ36EjzXj2f5hNIMGXMakcnpcsIm8cMZUubmDDnVAy5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571601; c=relaxed/simple;
	bh=26HxvGNK9DVTU4YC0T0WVmCnuuzpSawPprXNbpF3BAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UFeLwJ2HqUqS8Si1bjBr+Ckpjpz8VDt75P6RDx81DCZq8ZfHmPkbE6Q3rw7lrAUYLPqt8tgTbeUxBkpq1pU5HAtEN6Q1ohs12Nslccb/SVldWVTPg+f+o0WkvxdvnEdz+FdQfAn55qWHKKrLc/1gRX93qVg2jcdZNvHk/Ypr9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqlpsH6P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqlpsH6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D64D1F000E9;
	Mon, 24 Aug 2026 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787571599;
	bh=zRVPJY3WE1BMmgpvb8OWW5cagiRXpNtADqZZgXRUpbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eqlpsH6Pyf4VS5XVgEqKzkJb8NTs05rG39TdxeMJUi8QnWTWtTbJY9w7bw/5wvo+V
	 w9+sGm42OqCzJ9jZueoxuIY0nZF1ZIRUBsq2qcSI3Ra+uAXUH7qg30F3cp7baWJFMx
	 N6mkQSbWtiJ0ufP7XZdqCHJfsnbG4eQOFPlEVzevMLuYradvNz8YZX8QkRNYjjiHXB
	 LsNKlE7tsa88iAPHsN6mQe+aSqSfoK2B27GQblQiOOxqI2UtrW9FwJMOHPLru4w2q5
	 cU1q5xTOv/SlBwA3MKhB4gcqSuQN3fpxDwixwgi3pf+lIqYRz3ulhlew/gY0ukgsfd
	 c6SDZwmyUoysQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Add support for I2C High-Speed mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260824-i2c-hs-v1-2-8dd94e5c6113@oss.qualcomm.com>
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-2-8dd94e5c6113@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 11:39:58 +0000
Message-Id: <20260824113959.2D64D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing I2C_HS_WRITE checks in geni_i2c_gpi() cause unintended TX =
DMA mapping for read messages and out-of-bounds array accesses.
--

--- Patch [2]: [PATCH 2/2] i2c: qcom-geni: Add support for I2C High-Speed m=
ode ---
commit 010ffaa50c8bd9bb0e57a40b999e343cea742bb8
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

i2c: qcom-geni: Add support for I2C High-Speed mode

Implement I2C High-Speed (HS) mode for the Qualcomm GENI I2C controller.
Detect HS mode requests based on 3.4 MHz frequency and configure the
hardware accordingly.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 658636c1ee0e2..3712e0dd9e68d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
[ ... ]
> @@ -700,7 +756,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, st=
ruct i2c_msg msgs[],
>  		goto out;
>  	}
> =20
> -	if (op =3D=3D I2C_WRITE)
> +	if (op =3D=3D I2C_WRITE || op =3D=3D I2C_HS_WRITE)
>  		map_dirn =3D DMA_TO_DEVICE;
>  	else
>  		map_dirn =3D DMA_FROM_DEVICE;

[Severity: High]
Will this cause unintended TX DMA mapping and out-of-bounds array accesses
for High-Speed mode read messages?

It looks like op =3D=3D I2C_HS_WRITE was added here for map_dirn, but it wa=
sn't
added to the check that skips TX DMA mapping for read messages earlier in
this function:

    if (op =3D=3D I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
            peripheral->multi_msg =3D true;
            goto skip_tx_dma_map;
    }

Because I2C_HS_WRITE isn't checked here, High-Speed reads will fail to skip
the TX DMA mapping.

Additionally, it appears the same omission happens later in the function
when incrementing msg_idx_cnt:

    if (!((msgs[msg_idx].flags & I2C_M_RD) && op =3D=3D I2C_WRITE))
            gi2c_gpi_xfer->msg_idx_cnt++;

Since I2C_HS_WRITE is missing, the counter will be prematurely incremented
for HS reads. When the subsequent RX call processes the read message with
I2C_HS_READ, it will use the incremented msg_idx_cnt, potentially pointing
out of bounds of the msgs array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-i2c-hs-v1-=
0-8dd94e5c6113@oss.qualcomm.com?part=3D2
