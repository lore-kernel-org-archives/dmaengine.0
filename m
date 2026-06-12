Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BCC3A9002
	for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 22:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302275; cv=none; b=eKB4CpwxTOJXWpspA4cmq/I3mbrBVyzuILvCMLOnPiyVcRJrfLcIBNiCNuwMANOvkVXasjNZDHOPsA8S4Dy1eXqXHY0OLoyFxPBcrMwY/b8CwbQBhMXw0IaXP/kgk1fS9uNBpg982b9AtP6pxi4D7qSSjX0yttfSpVfEi/xYFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302275; c=relaxed/simple;
	bh=46eWzXrU9eVLphxd1Tn0Gviv6PYu0KY6N/AhOnXju2k=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s49aZqQb7S71HXr6JPfK5lmj7sshTTIHU7sxAMoxcVBBaNbGh0kb9g1rJTMSs4fJol0cnV6V6XLXL+V3M4Y2g0cng0EerLkVrqF4v9GmptGHdrEayommM0QJwHQt8tARGMBZ+erc1pF0z+XyARtEmP/nj2qafASxv/TP3lEFQ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qz9hANio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qz9hANio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5AC1F000E9;
	Fri, 12 Jun 2026 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302273;
	bh=e462Ohc2Qi1wiZZExGGrgeMWzq8XDoTrVO4HT1enLLU=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=Qz9hANiok4JXz9Bj7H3JfxiqEHp1zI7ltGwubo56zQTqCmN4/jG5xE6GAIvcUx/9P
	 qD8QG9r36AqhPDuZWvYYBb/Xt3TqPI/RYyN8vU86Od6b0fdOLq1AmsTlkL9cNqMm5W
	 oXPiK9xVN2pjKRBX7yld1eNoJXmc42Jg1s4wfiCAoaPrv8o15VPVDpp6lggHnYF1Vk
	 yYdDZu/qXIoHg9zPpym87fdln9JZ/O1Ca0smuUoiy4k/y2u+c0jpYC2+6VUveBcGsO
	 XwXMemFXHLUn+lepp7qpEdO2TX9Jfbprpx7M4DPsNSDY1F7IYiD2UTPesEZB5nXrew
	 1mQHA9QYklVjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx: Treat "xlnx,flush-fsync" as a flag
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260612215233.1887921-1-robh@kernel.org>
References: <20260612215233.1887921-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 22:11:12 +0000
Message-Id: <20260612221112.EB5AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Switching to of_property_read_bool() limits flush_on_fsync to a bo=
olean, breaking selective per-channel flushing and leaving dead code in the=
 driver.

Pre-existing issues:
- [High] The property 'xlnx,irq-delay' is incorrectly read using of_propert=
y_read_u8() despite being defined as a 32-bit integer in the device tree bi=
ndings.
- [High] Missing bounds check on the number of DMA channels allows an out-o=
f-bounds array write to xdev->chan.
--

commit 509281d674522c9a7b063c96ad8a6bee204fa2c0
Author: Rob Herring (Arm) <robh@kernel.org>

dmaengine: xilinx: Treat "xlnx,flush-fsync" as a flag

This commit updates the Xilinx DMA driver to treat the xlnx,flush-fsync
property as a boolean flag rather than an integer. This aligns the driver
behavior with the device tree binding documentation. It also explicitly lea=
ves
xlnx,irq-delay as an 8-bit read.

> Use the boolean helper so the driver follows the binding. Leave
> "xlnx,irq-delay" as an 8-bit property read because the hardware field
> is 8 bits wide.

[Severity: High]
This is a pre-existing issue, but since it's mentioned here: is it safe to
read a 32-bit device tree cell with of_property_read_u8()?

Device tree properties are 32-bit big-endian values. When reading a 32-bit
property with of_property_read_u8() in xilinx_dma_chan_probe(), only the fi=
rst
byte in memory is read. For values less than 256, the most significant byte=
 is
0, meaning chan->irq_delay will always evaluate to 0 and silently disable t=
he
interrupt delay timer. Does the hardware register width affect the DT cell
encoding width?

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 404235c173538..cbb23fd6e0960 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
[ ... ]
> @@ -3262,11 +3262,8 @@ static int xilinx_dma_probe(struct platform_device=
 *pdev)
>  			goto disable_clks;
>  		}
> =20
> -		err =3D of_property_read_u32(node, "xlnx,flush-fsync",
> -					   &xdev->flush_on_fsync);
> -		if (err < 0)
> -			dev_warn(xdev->dev,
> -				 "missing xlnx,flush-fsync property\n");
> +		xdev->flush_on_fsync =3D
> +			of_property_read_bool(node, "xlnx,flush-fsync");

[Severity: High]
Does this change break backwards compatibility for device trees that rely on
selective flushing?

While this matches the boolean type in the DT binding schema, it ignores the
driver's legacy behavior where it checked for integer values:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_chan_probe() {
    ...
    if (xdev->flush_on_fsync =3D=3D XILINX_DMA_FLUSH_BOTH ||
        xdev->flush_on_fsync =3D=3D XILINX_DMA_FLUSH_MM2S)
        chan->flush_on_fsync =3D true;
    ...
}

Because of_property_read_bool() in xilinx_dma_probe() returns a boolean,
xdev->flush_on_fsync will evaluate to 1 if the property exists, treating all
legacy configurations like <2> (XILINX_DMA_FLUSH_MM2S) or <3>
(XILINX_DMA_FLUSH_S2MM) as <1>.

Does this also leave the explicit conditionals checking for
XILINX_DMA_FLUSH_MM2S and XILINX_DMA_FLUSH_S2MM in xilinx_dma_chan_probe()
as unreachable dead code?

>  	}
> =20
>  	err =3D of_property_read_u32(node, "xlnx,addrwidth", &addr_width);

[Severity: High]
This isn't a bug introduced by this patch, but does the driver lack bounds
checking when parsing the dma-channels property?

In drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_child_probe(), the dma-channe=
ls
property dictates the loop limit for calling xilinx_dma_chan_probe():

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_child_probe() {
    ...
    for (i =3D 0; i < nr_channels; i++) {
        ret =3D xilinx_dma_chan_probe(xdev, node);
    ...
}

Inside xilinx_dma_chan_probe(), chan->id is incremented and used as an inde=
x:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_chan_probe() {
    ...
    xdev->chan[chan->id] =3D chan;
    ...
}

Since the xdev->chan array is fixed to a size of 32
(XILINX_MCDMA_MAX_CHANS_PER_DEVICE), could a device tree specifying a
larger number of channels result in an out-of-bounds write and memory
corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612215233.1887=
921-1-robh@kernel.org?part=3D1
