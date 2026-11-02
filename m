Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650732;
	b=VaJhItZAqlsoAzu/SAqGZozeZ9Ac3+vajgRsDkyEuLVRviKqD4Kax2Vm66JkvRMPFFIZ
	 J1W07PLqh62GVvejF1d5paPa44pG5f66iFB5Rj7X2jd/UbO4ehjHTMDBpR4VmO0cseb1/
	 mDfCEdDFc0XTa1Pw4CPzrtE6Fv6AduyllJmz/REY0otI3jvkEHei7QHVH0PYHgfhu0wyv
	 sxsWVwGqgXtQ1hQ4cquA7TNkd4fPZA2TaPBC0dSz5IXyvRTt/eRjlgzAD8t7LFS9QaqLV
	 fe1MI2HAu5jmcXmvIEVYL4jE5pWythA1tXhGh0mjdM4Hf5fjpyZvtvJg3F/H019etIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
	b=Caj1lMVSNd2EOJM8yEP5U9vtl/+ELuxFEqnugxVg3+StlIC7njkXNxtAmfhjw8slgH+1
	 FDlVTt7hDNdYM1wj9KI6dFGEmTVi87N5ViUOX9ak9Hc1yYvnuXF0LAM6YMwiCaiZ193He
	 pG6sV1h+qJ0XtmPNa7BPGjOz6rUcJyF9NXaBQ4L4pKZvkXnqU+01DPCf1IAqGFPtoJ+jB
	 nBhTQ9PjEj285ZpnyrOOmw2/gXY8CAOfHkF8JlWU6rU4DFyCC4BlT560NMhe08uqx1kz8
	 U0291rufR/HfYGdZM+qCQ9DAvbQclLdabYkewZJkDZ5htcWkOa2G6QJ6TVOSp12+WOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qR7u5LvF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491F606A326
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 20:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7491F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qR7u5LvF
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53644b28706so55098531cf.3
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 12:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650731; cv=none;
        d=google.com; s=arc-20260327;
        b=Ui/Y6Jwv1XYzovnjOopdqiGs09nFIS5fjaVfLN6+ixVKFRkqewSYelvmLspmGswGmp
         ETkKSj4PFST6LQ7yYnjP+zutROmIqBqhrnCJfDQD4Zi3MKy6iXB0cjrJ7jBQ3+Sw4mdP
         OA6Rg5UZS+8uExzP1HRzXvPZhP1UPQGIMmSJyaKi4RLAVasiguhrUMgvBsISTYrEAFoo
         jk+jcBj5Ui5CG2RBNaz+lQIVvwFLFLhwO+QG2Ag68E5mDzoqOC9WXyJFFFBnPQJt5InV
         sqU+6tnbnm1dIxYqPrle8B5E+r7Su+tYrtUzRfAtA7XjHMos8Zv2URl4YMOqBxvx1mEF
         qoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        fh=2K2rcmDbuXgnZB8pbo4DxwWm3w8GUFp1H1b50qNX2vY=;
        b=M0oz8Ukg57nN+8qVdKlTKUXoOiBaOjGSxeoYsZ+ckZRtlc0NRQZyXdQSZmgMa7GguR
         emP9lQYFllFSOyhTfsOVJMD9DA4hKkp3YtyB3l9LxNGpdJMDXcg/ZBRDJ7u2Q2LF57dL
         XhIZ0JNnDVXEcGVEu/+jYGDVm/1HQDXKWQOe5VU9ZLIPcI95dVd2GZ1EsWWbkC1ikFoj
         mW+fgs0YRsXVS/fSd7V8Px9c42YTtvOxDgWsygDc502r3QGZauBKi3F9HaIe8dj+H6ID
         Bd05aoIqnxgv6iuzNjihp5UtTpIL7PrnC1aOdr8ncZXcEL8UU7QvXodFdbK1ubWgNadZ
         p2hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650731; x=1794255531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        b=qR7u5LvF+BmZ6p/A2VqUeOsFcv/wzEN9CWzDu5fT/Xg4LUIINw3waXbPipr/mfIF8L
         EzsbmKEy+uqevJtgzcUvbF0FXwRIGJnSIgBY7LJUW60YfDqKw2dq27MOXrMlCs/5vhBd
         mONFhIxNgyp70fCUpJMgOeJFRK6+YxvpTrRBE08bwQnBfIh4fxw8OWTASVxjTW3VYsVR
         PfHfVMXacR4kudnJXbxlebn9o5spjfNrLge7MX+/mXNE0YHC2hAYFPCXxG85deL15xGK
         0/YnUgkztKIgI0RGOemPYht9y5S13RMFHxa1FME48jjwla+rnAzNl/ynjmVlck/jGKBL
         VRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650731; x=1794255531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        b=v3x6BOwZVqUkuoeTluhtd1tqMnJ/LWN16O52dXDvpqwn/y+cwMzAe5sy35KeyQUUMB
         srppWrc8odb0FkzzMR4qNDeBv3U2lm0e9T85VQYOKAGLTKgAOQrejlxLWR/MpFgAGcL+
         /LquYbXgggr/aPMpyHffcNnYLjpphQSNj52TB9pe3rFnVyuJ9EUxmma0eqUCh0k9n35v
         jP/TUEOy+pN8gG1/JjYFdAWJfEdywT4q8OxkQtg0R7FuZLXhNekBWMAAL1b/eMbF0rus
         9rMSqPc8Mf/DAifeYPCgF+i1KT0RdY1e3e8wqjZCTH+DqG312iEwFxUc66Q4U729Oui6
         GQOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSPC777bYghdkkXMHUm0bjiQvVlzAi+WuQVgFnwEc6YXu1xOPyNxahGl0eUU0Zyg7EpTjWpZp70u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIyd3XsyTRHKhbSLqIJZpK9qb6CUPd6rjNKc9YmdJY9UpK7+4s
	kx9zdliUJT6xzne660+Iv6JdK5XeEbi21Lb7n8Ob7THVNXOu/f+eZnMvi2p4hjU1pUgGlT/eoqh
	fwO+eLzZGgjafhbWZtwZq+e1E8/5ZgjE=
X-Gm-Gg: AYBFou3ujvZCUAwAGvb/Ox9pbmijFM+YaoyqchPmbGBNvWEGcQQQ6cu0CCEjWMwPma0
	10EeZ42MdX4UzNTNKqvlOTAh8otVpOp1Yz3S9c9Dy/ECO43i5JxGO8X6+fsI1QeO/4rcsoveVTI
	9bMcyg7V7x+QxKmbZcn1VQBPKu34VeCrZrdJm3JgDrGK0V1L934+o+lllW9YT1+CiejEmpJPGac
	b6vKRg9vNIxp3+6UqB6Fq9vR71x1Gd0xMQsQa24u+CWTcnoo39OBdG7clSRYoBLDSIFe6hSEUNW
	yC7R3Q6pHwxEYOEHtlNJGbrCgsyS/sZ6CApAFztNJwZA71wtmNo4npeOa9GwxlXLFdBv8xlyK9H
	aeoEhP2iEVLD/fUykF6VSKo9O/n3rHCRAQVolcKFe7x9c3go3HKnMWO37NYk3EAukhy3bZuYeHr
	hvnxIf2VuySEUAaBTYaniUzEVh3OSsfVuSH5Vfaz5xlRW+ulmY6v3nkUQNDWF4kZrS/vMM4dSdY
	gC2V2SvnGxiCHVJpg+p0h4/qQzptx4NkOY=
X-Received: by 2002:a05:622a:2510:b0:536:72b4:b835 with SMTP id
 d75a77b69052e-542b7141e17mr189658521cf.46.1793650731219; Mon, 02 Nov 2026
 12:18:51 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
In-Reply-To: <20261102-email-target-d3191584d234@spud>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 2 Nov 2026 20:18:38 +0000
X-Gm-Features: AclHuK9-yjv7ad1RizN3tUZLE_u9kHWCoEZqwdsahJwce9NtT6g6vb4WuuUHq4E
Message-ID: <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
To: Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> > Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> > described by a separate node covering channels 11-14, and for the
> > BCM2712 DMA controllers. The register address of a node identifies its
> > first channel, allowing a controller to be split across nodes.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> >
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826c..31d97a10a0ea9 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> >  maintainers:
> >    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> >
> > -description:
> > +description: |
> >    The BCM2835 DMA controller has 16 channels in total. Only the lower
> >    13 channels have an associated IRQ. Some arbitrary channels are used by the
> >    VideoCore firmware (1,3,6,7 in the current firmware version). The channels
> >    0, 2 and 3 have special functionality and should not be used by the driver.
> >
> > +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
> > +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> > +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
> > +  split across several nodes, the register address identifies the first
> > +  channel of a node.
>
> Uh no, a device should not be split across different nodes. This should
> not be needed, why can't your driver handle the upper channels having
> different capabilities?

This is the way it's done in the downstream kernel, unfortunately
Broadcom doesn't publish the HW details so either they'd need to
contribute the support (which they've not done since the RPi4 was
available) or I'm not sure what the other options would be. Open to
suggestions.

> Thanks,
> Conor.
>
> > +
> >  allOf:
> >    - $ref: dma-controller.yaml#
> >
> >  properties:
> >    compatible:
> > -    const: brcm,bcm2835-dma
> > +    enum:
> > +      - brcm,bcm2835-dma
> > +      - brcm,bcm2711-dma
> > +      - brcm,bcm2712-dma
> >
> >    reg:
> >      maxItems: 1
> > @@ -99,4 +108,22 @@ examples:
> >          brcm,dma-channel-mask = <0x7f35>;
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    dma-controller@7e007b00 {
> > +      compatible = "brcm,bcm2711-dma";
> > +      reg = <0x7e007b00 0x400>;
> > +      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "dma11",
> > +                        "dma12",
> > +                        "dma13",
> > +                        "dma14";
> > +      #dma-cells = <1>;
> > +      brcm,dma-channel-mask = <0x7000>;
> > +    };
> > +
> >  ...
> > --
> > 2.56.0
> >
