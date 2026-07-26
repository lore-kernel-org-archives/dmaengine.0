Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73712EEE86
	for <dmaengine@vger.kernel.org>; Sun, 26 Jul 2026 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785044365; cv=none; b=GHZgRoxjU4LylAodIth6/J8Kwgt+781Bh2xxcjRfc6reVZk6m8FV0fNNuTLmtCyFcVsIJLo1RVULg+/9QUbNB3xHbqYMR8rgOY0Vk1Ql/q8Qvrv3uWatUWatBoUWRE3G7lIww18oR8RY1WMHd7JzkNczI5/HwHN3yjU2PnErikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785044365; c=relaxed/simple;
	bh=3DTr5cakUS36ytKiDThBRG8Nc7k4sA9jjUkV4Ha5brc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hndm43K8sBPNifzIGdnavtZUPuxXXwZOEHQuE19kAttEw5De1NhOJvcLFNnpDeSdnVAo8SvqxF7/uE3u7uvQawjcOTcLi78ea/eJWUxaAD6Kgy40jozMs04lIXAlXOV/HQHgmek0TjAmeUyJ7+YclozHNgYejWybWY3KY4EmVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJ5Aa1Je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJ5Aa1Je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E01F000E9;
	Sun, 26 Jul 2026 05:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785044363;
	bh=VBOrgADtm6+WMGgXScoHQHQPiDQ4rakkyrSYdOuAc2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJ5Aa1JeFiuxr4IVXWwR58wbdJnCgsNCT+N5+oK6eGw0TcvIXSXa+Nwt6Z9Xc+wXR
	 vzV1Ndf2Zo5zhAQF6lDDfhnpJyIaKLmrFAqb0tZ8jKIV7AqIMfOqtIS/h6eJCo+WbW
	 KGio30tlyEYi0FS8kVxn/cJWn23qtFtPi3Iv+t5I2ORmJoyRGqzzUnlslbMzYJ2S+W
	 Kz8+yXJuMe5AYl5dTsdiQB5gxxZUWglpB0AYub/ssctaeCW6cFBPZ0m9zjSb5bWG4V
	 K2c8h1zqXMyhWuNAyElHaVVJzaApBP77jZjJmn+uWbaHUM4QGC86qbHIQ+FovOXD6E
	 4NHsi9GK+4E5w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/1] dmaengine: apple-admac: suppress bind/unbind
 sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fan Wu" <fanwu01@zju.edu.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260726052950.37062-2-fanwu01@zju.edu.cn>
References: <20260726052950.37062-1-fanwu01@zju.edu.cn>
 <20260726052950.37062-2-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 05:39:22 +0000
Message-Id: <20260726053923.0D9E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and unmapped MMIO access due to lack of `dma_device=
.device_release` and relying on devres for memory management.
- [High] Use-After-Free due to missing tasklet teardown in device removal.
- [High] Out-of-bounds DMA transfers due to missing alignment validation in=
 `admac_prep_dma_cyclic`.
- [High] DMA hardware state machine is not stopped during device removal, l=
eading to memory corruption.
--

--- Patch [1]: [RFC PATCH 1/1] dmaengine: apple-admac: suppress bind/unbind=
 sysfs attributes ---
commit f71ce7adaa3454720893d7cb49e38df7126d9fe4
Author: Fan Wu <fanwu01@zju.edu.cn>

dmaengine: apple-admac: suppress bind/unbind sysfs attributes

apple-admac stores its dma_device and channels in devm-managed memory and
does not implement dma_device.device_release. This patch suppresses sysfs
bind/unbind controls since unbinding while in use causes memory corruption.

> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a4815..1f331bf051e16 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -946,6 +946,7 @@ static struct platform_driver apple_admac_driver =3D {
>  	.driver =3D {
>  		.name =3D "apple-admac",
>  		.of_match_table =3D admac_of_match,
> +		.suppress_bind_attrs =3D true,
>  	},
>  	.probe =3D admac_probe,

[Severity: High]
This is a pre-existing issue, but does relying on devm_kzalloc() for
admac_data in admac_probe() lead to a use-after-free during device unbind?

If a client requests a DMA channel and the device is forcibly unbound,
devres will immediately free admac_data and its channels after
admac_remove() returns.

If the client later calls dma_release_channel(), won't it access the freed
admac_chan and call admac_free_chan_resources(), touching unmapped MMIO?

[Severity: High]
This isn't a bug introduced by this patch, but could an out-of-bounds issue
happen in admac_prep_dma_cyclic()?

drivers/dma/apple-admac.c:admac_prep_dma_cyclic() {
    ...
    adtx->buf_addr =3D buf_addr;
    adtx->buf_len =3D buf_len;
    adtx->buf_end =3D buf_addr + buf_len;
    adtx->period_len =3D period_len;
    ...
}

If a client passes a buf_len that is not a multiple of period_len, does
admac_cyclic_write_one_desc() calculate an offset that exceeds the buffer
bounds:

    addr =3D tx->buf_addr + (tx->submitted_pos % tx->buf_len);
    WARN_ON_ONCE(addr + tx->period_len > tx->buf_end);

and still program the hardware descriptors to perform out-of-bounds
transfers?

>  	.remove =3D admac_remove,

[Severity: High]
This is a pre-existing issue, but does admac_remove() fail to wait for or
kill scheduled tasklets?

If an interrupt fires and schedules a channel's tasklet concurrently with
device unbind, admac_remove() calls free_irq(), which doesn't wait for
tasklets to complete.

After admac_remove() returns and devres frees admac_data, could the tasklet
execute and dereference freed memory?

[Severity: High]
This is a pre-existing issue, but does admac_remove() leave the DMA
hardware active during unbind?

When the device is unregistered and memory is unmapped, if the hardware is
not commanded to stop (e.g., via admac_stop_chan or resetting rings), will
it continue performing DMA accesses to memory that may be freed by the
client, causing memory corruption?

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726052950.3706=
2-2-fanwu01@zju.edu.cn?part=3D1
