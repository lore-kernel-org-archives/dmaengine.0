Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521663;
	b=S0zej9kCx2t/zIIgU0jufeuUvMnUyeR3pA1Xeq1ynjskKn5j8SYUnmSIIfIlQGxzN/EA
	 HzCN1q0Jx5TFmAtnIFtRSSmAtwN0l5u13jqRL4fnv6cK0RQOgzle48emfxKT/4vjNnBY/
	 DxcP24lKVZwi2Q7BcMI3HmKkw6Xsxi0V7Ohbt9mPTPXmaL2kW6s6r1tH8+DTh+xFnbDRu
	 azSVb3Bb8ywUixei02CGomUwP4IphZ92Mz8eRf5S14JJ6IJ5W1E8bEJsXc+d7UAgGqL4y
	 /o3NVMS8ZXLy41TrXERhSAUIjAJT/HjwVvLGWTkAkRi7FUjuWQ8aaedM2JZljIq1xNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FoT4YtPGMqQFcb5Zc91i/fbcoFufCmB8n/I+onT316M=;
	b=MZYY6Dr/vTlhINyWRHfjzw5vpZ4FysnVNrPFLbThpcmu+UXlWqXA3LZI6SJ7upYn4EqR
	 P6BYrVWltZdMECl3WVmUg37mX+40vYi7WK7GnLHQRm46DWXzjcFTE1G8JMHx7z+RwIBmC
	 IioHAzf9sVl7BceB7MaJSe0pJxw2FgG5Lq7+rzMevy6fobGqiE+9N1kmVOuTDfcWvxxff
	 E/+rAJtcVQLVUENvlnYj4uR6U122b1iLOjoBPxlnrMUL/ZPipToWGOh9Mce/R+hDgTS+6
	 Ii/+to1RPVroD02E5lSit88qX1YpNYoBXV6RclVMjdPQwVSQ7tC2w/7h7zApHJIKfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oz9BGA7r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C8606A31E;
	Tue, 24 Nov 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oz9BGA7r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCB21F000C4;
	Tue, 24 Nov 2026 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521662;
	bh=FoT4YtPGMqQFcb5Zc91i/fbcoFufCmB8n/I+onT316M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oz9BGA7r4e7FDN1wF/Y7XXpPf5WP3AWiPdFCOmJ5jELFj0MCJG4q2vvw0GT8hMDS2
	 K2RlMTHWYS22q0eRl9bI3zWCRLfXYiYyPu/KP2F89lRITl4dJ3UL0bP+4HjIJ2eZIB
	 7D3St0iLKXufNCZpwzixZz+Fwj78GiTl7kRRYc1t4M4P7tRUpf0iPS1QtnFXuDY/ko
	 lZg3EqKl2HmGIn2WaiY444TCtT4yCiEO/kKq/gikArXHkBU8XjrcdYUlKIn5IL3KzC
	 f3LrEZGDBQTOwDXzxe+5FNCsHEy11Zo36lImoMgU1Gqt1WL3YD9lgkjNq2iADe2jle
	 p1tpPy7xOymcg==
Message-ID: <sashiko-outbox-231086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 08/20] dmaengine: ti: k3-udma: move udma utility
 functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-8-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-8-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:01:01 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: ti: k3-udma: unexported non-static debug helpers in
  common
--

commit e1b4b30f90c2fcb960c69be1c5300cf860e709ee
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move udma utility functions to k3-udma-common.c

This commit moves shared UDMA utility functions from k3-udma.c into
k3-udma-common.c for reuse across K3 UDMA variants.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index c9cbe93f2391d..54b95490a56a7 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
[ ... ]
> @@ -1349,5 +1371,531 @@ void udma_reset_rings(struct udma_chan *uc)
>  }
>  EXPORT_SYMBOL_GPL(udma_reset_rings);
> =20
[ ... ]
> +void udma_dump_chan_stdata(struct udma_chan *uc)
> +{
> +	struct device *dev =3D uc->ud->dev;
> +	u32 offset;
> +	int i;
> +
> +	if (uc->config.dir =3D=3D DMA_MEM_TO_DEV || uc->config.dir =3D=3D DMA_M=
EM_TO_MEM) {
> +		dev_dbg(dev, "TCHAN State data:\n");
> +		for (i =3D 0; i < 32; i++) {
> +			offset =3D UDMA_CHAN_RT_STDATA_REG + i * 4;
> +			dev_dbg(dev, "TRT_STDATA[%02d]: 0x%08x\n", i,
> +				udma_tchanrt_read(uc, offset));
> +		}
> +	}
> +
> +	if (uc->config.dir =3D=3D DMA_DEV_TO_MEM || uc->config.dir =3D=3D DMA_M=
EM_TO_MEM) {
> +		dev_dbg(dev, "RCHAN State data:\n");
> +		for (i =3D 0; i < 32; i++) {
> +			offset =3D UDMA_CHAN_RT_STDATA_REG + i * 4;
> +			dev_dbg(dev, "RRT_STDATA[%02d]: 0x%08x\n", i,
> +				udma_rchanrt_read(uc, offset));
> +		}
> +	}
> +}
[ ... ]
> +#ifdef CONFIG_DEBUG_FS
> +void udma_dbg_summary_show_chan(struct seq_file *s,
> +				struct dma_chan *chan)
> +{
[ ... ]
> +}
> +
> +void udma_dbg_summary_show(struct seq_file *s,
> +			   struct dma_device *dma_dev)
> +{
> +	struct dma_chan *chan;
> +
> +	list_for_each_entry(chan, &dma_dev->channels, device_node) {
> +		if (chan->client_count)
> +			udma_dbg_summary_show_chan(s, chan);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(udma_dbg_summary_show);
> +#endif /* CONFIG_DEBUG_FS */

[Severity: Low]
Should udma_dump_chan_stdata() and udma_dbg_summary_show_chan() remain
static in k3-udma-common.c (and be dropped from k3-udma.h), the same way
this patch makes udma_desc_pre_callback() static?

Their only callers, udma_synchronize() and udma_dbg_summary_show(), move
to k3-udma-common.c in this commit, and neither function carries
EXPORT_SYMBOL_GPL(), so declaring them in k3-udma.h would fail modpost if
another module called them with CONFIG_TI_K3_UDMA_COMMON=3Dm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D8
