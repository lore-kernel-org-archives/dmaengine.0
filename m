Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12F47D922
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219469; cv=none; b=eivqTPCFkwtBD5IVNe5Gc1v8YpqvpIoYp1u9YO6xluzzIX5y1kBB+LK7X8o7plujXohf0rsPM2SFUZeaeclRQxj1Zkh44wsNS6L2Nu5VR76WxsP50Jz3qhnEfQJpE7+E6xWc8iPjHhvxI2LR3ycl28aqO9Mrk03apxJRqXlK67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219469; c=relaxed/simple;
	bh=DfhVW9q+ZJGUgto08QZkf4wEFJXr1nHCqFvZJvzO/EQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cE9pUHoisjN31Q8godbucWSj2LawWBG9nr2Ghs9o0yEGmITfNO8Fa6UZVGxwm3BJMrHu8HgGF2FLBi7FKVV0tKLtu8Z7p5T7mYPOnQbuJ+Xy1aaQzJHVmdopqBUzRAcHlGqGY6KxyqY6ipS2fnGvuKNPyrLcNeXROBOT4R4wqEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TE4HERDk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TE4HERDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952721F00893;
	Sat, 12 Sep 2026 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789219467;
	bh=/ZVUk098ME+zl/znmt+mR+qKQCnwEM37rmnHd5pP8Bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TE4HERDkmgNzRZlz+Bob1x76FFaZqyJN+vb23JdOVKHHXRLavCLdYeeMFOSwJ5HNw
	 0N2s4DZxhIv2UhZSh2xOciM1hP0+d/or3xkQTyjyuGRL2Jk6hDMkOYdknyvbI7DKWg
	 l0GDVXqyZ4qzAtTgeZkXsCHbZVi7OxcCnXv9jBa7JJYT2GIXKRmuWp4f301HajY9oU
	 5oIe6KKXCoDbbdnUhPVUYDqnfgxRqz82mdfhzb1dzdGX6bZLeiJFbwbWAX4vAHlNKS
	 ggb4T5vAXBBaqw+O+ls3ZAExH20vm1UJczuC+x5tKwkmLX87O6sH9q6qF1MqSfPi9l
	 HsCtcgARQcvJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: Add support for I2C High-Speed
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
References: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
 <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 13:24:27 +0000
Message-Id: <20260912132427.952721F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Double free and double unmap of the `rx_buf` bounce buffer dur=
ing multi-message GPI transfers.
--

commit 86b736c2ca3097acfcf4a35074f23d04a9c9f622
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

i2c: qcom-geni: Add support for I2C High-Speed mode

Implement I2C High-Speed (HS) mode for the Qualcomm GENI I2C controller,
detecting requests based on 3.4 MHz frequency and configuring timing
parameters accordingly. The patch uses HS-specific opcodes and updates
the GPI DMA configuration with a CONFIG1 TRE to pass timing parameters.

> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
[ ... ]
> @@ -883,14 +940,25 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *g=
i2c, struct i2c_msg msgs[], i
[ ... ]
>  		if (msgs[i].flags & I2C_M_RD) {
> -			ret =3D  geni_i2c_gpi(gi2c, msgs, &config,
> -					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> +			ret =3D  geni_i2c_gpi(gi2c, msgs, &config, &rx_addr, &rx_buf,
> +					    gi2c->is_hs_mode ? I2C_HS_READ : I2C_READ, gi2c->rx_c);

[Severity: Critical]
This isn't a bug introduced by this patch, but is it possible for a
multi-message transfer to double-free the rx_buf bounce buffer here?

The rx_buf pointer is initialized to NULL outside the loop at the start
of geni_i2c_gpi_xfer().

If a sequence consists of a read message followed by a write message,
iteration 0 (read) will populate rx_buf via geni_i2c_gpi() and then unmap
and free it at the end of the loop using geni_i2c_gpi_unmap().

In iteration 1 (write), this read block is skipped, meaning rx_buf retains
the freed pointer from the previous iteration.

At the end of iteration 1, geni_i2c_gpi_unmap() is called again:

		if (!gi2c->is_tx_multi_desc_xfer)
			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);

Since rx_buf still contains the pointer from iteration 0, will this result
in a double dma_unmap_single() and double kfree() for the same address?

>  			if (ret)
>  				goto err;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-i2c-hs-v2-=
0-b0901791e244@oss.qualcomm.com?part=3D2
