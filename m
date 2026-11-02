Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602844;
	b=xCY+ZD7i3CrWENAKxrm6pisgzYqJWa1OS0vasL0ENZNlgU7/eATKoykDN0AJ2jaJOHMO
	 iy1wnTYXAIco9qmezdlPf1BMQTBcyqnB17KEJf960LB6z2fFH7QFB86nhA1hIsibrFZ8p
	 +ROpbkkiH6ec+EbJoY5kiPSmAb4QOh02kNDC2al4UoO2LGfwu3oUuJH9f6EPqeutJktrZ
	 0cZ10pfPpiBrbhsD08S2njMgoXX/Rc8UtiVJCMXWhkYdlC50Lyb1vQPaA7MBRfiJo93BE
	 LQDyrf3HUZ/vVW0/AZ46Rs9v/+hlRPu4IAWWT6ctALhglOE0MQ9gk6Vuc/AMVGeMR7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602844;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=drddJG0sj3gAdPwkvwI/bq+BjhbH5qeTOg1nM6CQf4o=;
	b=RCiJaCWrYBjFPd51kyG7hNRrPCFDtDssVoF2EzsgNONs7pBKELg2yMBiV1YASSLRzu0K
	 1lf3eD2W1kaxrL1Sz0KBKGGypclqlFQ4hSoxNMF4FsT3ZhMiQcA7hxP8whFJG9Hh7nx63
	 htbovlD78ynzSpOsl19vkx+g8lIDhnAeEaPDo/AA0CQCyGwwaVGsCnamYmNp+2D+T+5Rk
	 ESH1sFMpS7PXZuGrabLvTyWUVXeuLWOh4OXAnmMrMewU0CBqOUsGrrWWXF1mvanYMh/8r
	 pNUfB6dog0GJRHRmuHc2hiIIclu2dxDVc/Jxy+xrytL3lIsqcPNbqAvvr+qvAgIMpQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F58qm/N3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D647606A32D;
	Mon,  2 Nov 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F58qm/N3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8C01F00919;
	Mon,  2 Nov 2026 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602844;
	bh=drddJG0sj3gAdPwkvwI/bq+BjhbH5qeTOg1nM6CQf4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F58qm/N3coRjks5+CJFgOjjJDM4V0zANSCKNnLZ5+uL82sa9nQ5VvzjJLEa3klQ9e
	 V03RmzZUwaLq9CXeV4fHmGonyI5FMJfv691QYvFj42c8bjJE/QsM7Ny0rAkHdaDjPW
	 CFUomsgqA0RKFXHEmm2zdAEWfhArjmOsCndwfXgtp4+xYJXNvFps01s1alWAhGAhyJ
	 sj8S1AJuDLHTcY89SrhcQxwt4KBPEKvv+cr+vT4zBTj5s8RwmDlJrbfj7vm7I6bEel
	 EYKy0XxZP754zgC/FRFwFJ3qD223Ml5RaH2QQKDOA5VKqaiBjlZB2FSbXH+0R5IzTD
	 lI7VCKiK238Ng==
Message-ID: <sashiko-outbox-192991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: imx95: convert eDMA to per-channel
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-edma-iommu-v3-v3-7-9d0e62a954eb@Example.Com>
References: <20261102-edma-iommu-v3-v3-0-9d0e62a954eb@Example.Com>
 <20261102-edma-iommu-v3-v3-7-9d0e62a954eb@Example.Com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:00:43 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: imx95: edma2 child nodes break fsl_edma_probe() on imx=
95-navq
--

commit 4788f1a45cc4009b4772c28b9de4641ae62aa052
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx95: convert eDMA to per-channel child nodes

This commit converts the edma2 and edma3 nodes in imx95.dtsi from flat
interrupt arrays on the parent node to 64 per-channel child nodes with
individual reg and interrupts properties.

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index d20c2498b9aa2..64570703ce6cb 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -635,148 +635,666 @@ edma2: dma-controller@42000000 {
>  				compatible =3D "fsl,imx95-edma5";
>  				reg =3D <0x42000000 0x210000>;
>  				#dma-cells =3D <3>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				ranges;
>  				dma-channels =3D <64>;
>  				/* channels 0 and 1 reserved for V2X fast hash */
>  				dma-channel-mask =3D <0x3>;

[ ... ]

> +				dma-channel@42100000 {
> +					reg =3D <0x42100000 0x8000>;
> +					interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +				};

[Severity: High]
Will adding all 64 enabled dma-channel child nodes under edma2 cause
fsl_edma_probe() to fail on arch/arm64/boot/dts/freescale/imx95-navq.dts?

In arch/arm64/boot/dts/freescale/imx95-navq.dts, &edma2 overrides
dma-channels to 30 while inheriting all 64 enabled child nodes from
imx95.dtsi:

    &edma2 {
        /* channels 30-63 owned by M7 */
        dma-channels =3D <30>;
    };

Previously, with a flat interrupts array on the parent node,
fsl_edma3_irq_init() only iterated up to fsl_edma->n_chans (30) and ignored
the remaining entries.

With child nodes present, fsl_edma_probe() sets fsl_edma->n_chans =3D 30 and
calls fsl_edma_configure_chan_from_dt(), which iterates over every available
child node via for_each_available_child_of_node(). When it reaches
dma-channel@42100000 (channel 30), fsl_edma_child_to_chan_id() rejects it:

drivers/dma/fsl-edma-main.c:fsl_edma_child_to_chan_id() {
    ...
    ch_id =3D div64_u64(child_res.start - chan_base, chan_size);
    if (ch_id >=3D fsl_edma->n_chans)
        return -EINVAL;
    ...
}

fsl_edma_configure_chan_from_dt() then returns -EINVAL and aborts probing
edma2 altogether:

drivers/dma/fsl-edma-main.c:fsl_edma_configure_chan_from_dt() {
    ...
    for_each_available_child_of_node(np, child) {
        ch_id =3D fsl_edma_child_to_chan_id(pdev, fsl_edma, child,
                          &parent_res);
        if (ch_id < 0) {
            dev_err(&pdev->dev, "invalid channel in %pOFn\n", child);
            of_node_put(child);
            return -EINVAL;
        }
    ...
}

Should imx95-navq.dts reserve channels 30-63 via dma-channel-mask (or
disable those child nodes) so that edma2 still probes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-edma-iommu=
-v3-v3-0-9d0e62a954eb@Example.Com?part=3D7
