Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90434D90C;
	Wed, 12 Aug 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527634; cv=none; b=BQbxc3bPkW894pFDNHmIKVm+z93Xq6xVyYOBQsD4umKNEmztQMWr9NH/beOk+zraT4YXBLg/u3PZco2iQZcRWM4uxY1uxriR5QB2Wh3XDbiKjO19O6Jl69r7NAWs3m1/M4yFEL3z1yrl8HCDt1umhn8/tWEERbniRvetRiqPg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527634; c=relaxed/simple;
	bh=WKfLiLx9/p+NBrSKWq/XuUxjaoocSqC2eUQ2EbYlOw4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=clIpUY3+zqbcpDeQi4vvXrcA0678jhFKLioLv3KnqwuTaeAwKa/djsyfiOdLL1gtvrkXFK9G9IbRZy4heQWb/zOaLdKPXR991xo1UZ4tQRDcwYRnN/O+9WFfWooh7LP28++VodCj4r5xzNEpykfo4/NVa3RmhnNVh3vtrgr8CCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6AR3vRA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6AR3vRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008FD1F000E9;
	Wed, 12 Aug 2026 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786527632;
	bh=ojsFGwRbLrD5qPL7+71OpmuD6Jm8UrrTelExgID0/q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P6AR3vRA1qgLDx2oN0ix8qlUk//wwcVvDN9DgeDni2fWcm0gDRqU7pzIqHHO3E9Fw
	 iL03q4pMU8ZpgasaQYJXkKY4ZgmNrpO7pvsu6Wp/9DssyyfxYP69OAukuttb0Wo3KP
	 F65/+SAB+2Gp6J7Dlf62lkDWHlpuf8FTcPU1VPJ3XSKIvk4hWZae4hvMYukKjcyGI1
	 hD3QMWeJCqETGa1xWtcay990lOa/Iil8l4rBfyjACJJG7SwJIoRYBKezc29tQfoSn0
	 EuuWFoj+xqlQZVgTLUcBNMSSfjey7IaTwRfF4enfWTvF0KHsf5Ksg9Wk4RNg+XbZgd
	 rf1uLFn5F+nWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260812-t603x-admac-v3-2-d1f137f803e1@chaosmail.tech>
References: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
 <20260812-t603x-admac-v3-2-d1f137f803e1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:40:31 +0000
Message-Id: <20260812094032.008FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional overwrite of global configuration registers with a p=
otentially hardcoded channel mask during per-channel setup.
--

--- Patch [2]: [PATCH v3 2/2] dmaengine: apple-admac: Add M3 generation ADM=
ACs ---
commit 14231adca1c04d18dabe6aedf727a8ccef7b20a1
Author: Sasha Finkelstein <k@chaosmail.tech>

dmaengine: apple-admac: Add M3 generation ADMACs
   =20
The admacs present on t8122 and t603x SoCs need additional writes in
order to operate correctly. The exact purpose of this register
is unknown.

> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
[ ... ]
> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width =3D readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
> =20
> +	if (ad->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}
> +

[Severity: High]
Does this code overwrite global configuration state for all channels?

Since admac_device_config() is called per-channel during setup, writing a
hardcoded value (0x200000, which is BIT(21)) directly to global controller
registers without a read-modify-write will unconditionally clear any existi=
ng
state for other active channels.

Is T8122_UNK_28_VAL a global magic value, or might it be a channel-specific
bitmask captured from a trace that should be applied via a read-modify-write
incorporating the channel number?

>  	switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
>  	case DMA_SLAVE_BUSWIDTH_1_BYTE:
>  		wordsize =3D 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-t603x-adma=
c-v3-0-d1f137f803e1@chaosmail.tech?part=3D2
