Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A044D3F326C
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009020; cv=pass; b=Y/WzAkr+WweezTUXQiWXKUO9PpksZRgA+Rt1CekFk4eErhDdVrTZgt6Yf7qbM4j7xWsq5S9nryiQ0RbkpXUGWyPMOk8Hdaa8lLHkFMl45sILLSw5EjVPakBwDFSDI5/Q8gNaJq5WyvgUYS6d6iy9+yLBKFizGeRkPEGI8y3TFv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009020; c=relaxed/simple;
	bh=9eSFYOl7kYn4j8mvAT0Cf6LeVVnmKsPzCcAEXVf1qJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovfOUyLoDLNUmEoKSIpJzeB0dAr9Syio/a9vMJ/pNwzyQ7kVJ3DjPolY4TcT7oP6JfXNIyrd48HqFaEBTKIJMjGcZhSyTPhxdP/yGOiXYYXqU3w/oemdSGGlO2WlIWROf4vKzYShAMUsywTC5fMBM3HWCVABj0RR0/WsqvPU4IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+TDFgvJ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+TDFgvJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a10d6f455dso572809a12.1
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 16:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009017; cv=none;
        d=google.com; s=arc-20260327;
        b=fR4O5J6/2PiyuHxICSvgPS4n9NSqzrlRHYzx1j5Dgb2CXvBWwELY+tpBtdzVaEc7oy
         60JFEP7ijvq4dhkNPhCYN2chmOvMOc4n3WjDA0ChEas3neViaZdWc04/NrlMhTFZ/eJ1
         8xF0uBTLYuAY9/XEh+1L7hFEsdIHhK4LJykplKI2KWxCYftTCKrBFxRf+phRSF1m8n7l
         jeWDHg7BgAjIXQIPwp/6kGlDODNuvblqPfjXnUnJg4frOOkQA1oIEz5sz36PiI17bg2v
         wl6Zxc6RN8t/aBe2ejkUm4XDROroQOe9SGw1xkidQl7hmJHLnzePzHRDBcZCZ8X5IVxY
         790A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mza8YFJw9Nex8v6b5Iq6o1h/WX62q5XrbPAuvjkscxg=;
        fh=/XpjGZn3y6K47Mvo2dSR9uLrxJmo0fukuO+2jit3bps=;
        b=C42Cq5fq9yD53VRVXTlZg0xo+qXIR2Kx29qRUWPcBfQrYvFANLBXt/l+6+JUCLauSc
         cBQeBnYUd4QxPJFgc7OTm4qrMEWgp2KWxOtFYaLMEG1WXnGCGG/Nc/fpG8dXp2jUfBbZ
         D3D+xocF/EBFzKmj4AES9kr5uGPLcaP4ckseP0sOOupZFZXJ+FRcUFyu0uLYdR2H7ihX
         +KxA7d1y2tMZ5nYTKZUNRf31kBfEKNfs7EubmKMXwL9e+IqnhcBmWc00juBUxUhxS+3A
         MOZ/IdcrBVx+vJiUCYdJM1QXyrbcj7VxNNAghTUJ+RVtLIgckHGjEMM8OG5v+sQLUY0P
         Q7kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009017; x=1787613817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mza8YFJw9Nex8v6b5Iq6o1h/WX62q5XrbPAuvjkscxg=;
        b=c+TDFgvJfdJTp0qHRPHjUw30DdTeTBslFv5aaFanflmFAMHXhWp6yzruZmVia4OF0B
         VfprCpL6yS/TPK/zJoqgEqYzsi2ZVSB3IZdt74qSQVOuqaOaDKGMY69PRSX2Qw+wxDLd
         NgdJ9HUHfAZCLE4kdbomKDYsr4/ung+pzQOgUd9YAw25fOV1qpJrDBkp7od7h22aaerB
         +gwlwwOa4rfyIGQB5TnfOR+USfN7ZLmNpqHL7CXDFr43nZDPXNwnVSEtTJ8HSma97lxP
         9zV1XOd3i+aCGhvag4l/+jZTU7dDqPQyS1gRnIsZREvFfpyA7Oxp6u+9Q7BQLfA0goAj
         zQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009017; x=1787613817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mza8YFJw9Nex8v6b5Iq6o1h/WX62q5XrbPAuvjkscxg=;
        b=Apygd/Nj1nOvyO+dzoSHJf4yxJN/ipynmcKCg67R6kHF7EoojMbCDMQJ4e1ZM07paM
         wgS8xG/X16wqjSh3H/+imd0M73N63K2+/VkjW1NfxrfOGAOXLJYcRssBJzwSPOy6iMQS
         00LbU3q6++hSLPjyl8FlWEShLi0yDzBuWrE4Ivup6X+xgoQlv/cVkgRj1hdwOoEtoXKe
         iPQLGFVvC4nAO6nCb4fsJueHYRYImZ8/HKTYGtO7oLLabnsGKOkmdeK5CRxGQq1Ugxx6
         JWnBMLDQt+2f67d8BJnsbXTH4gXkWb/H2cS+PuwkMb5WC7oL3143i/JwZoapy33jw+bs
         TBwA==
X-Gm-Message-State: AOJu0YwHI6R0JmEnsWE/GJhvTFFIprodL+TlqAPb5tUOwI/nAZlHurO1
	yz/ZZkf3pkkXoykBa6r0+rq8WR6IK/TOrPcY2K2gHWSnCH3ndrxD5WdCyTqRCJ6xSQqLIr1Xegc
	Cp50V9XRZQLGX8hJqGbM3GzxGMTEXImXVhQ==
X-Gm-Gg: AR+sD10vpSg3YRyhtSkexHQ5cFHSOVtJMNSqJdccPonSy1AHAYG0XBDMma0WH+RvXnu
	lgRBRdKZcvbxs7frDxpmqX5MlinCdrrWnRnaPNV3sniMHk+g9eAtMWnOPc4s2I5VFI4hWjJNYy0
	jhCms+RP9hccVQNJCvHe3ILRnxn36um5tEClmbigjNa0QOkGNgQSLIM214OYliTeW9H0ug7S7Xa
	nyzkzjMABrdmOcTtgLicWgTBEnz3x9cf6xRxdP9ukOLptMeqRuJ2/KGVl59YxdRGsuUbZuH2ziX
	iG/XRdEn7Pga7e3uXLbkV8iL+CRSR+mt16BJIdfgF0ksQ+AxbvsIDQU=
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id
 4fb4d7f45d1cf-6a38a8b7c62mr7184435a12.1.1787009016712; Mon, 17 Aug 2026
 16:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-6-69ac5f92df45@gmail.com> <20260817215405.5BC3F1F000E9@smtp.kernel.org>
In-Reply-To: <20260817215405.5BC3F1F000E9@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:53:25 +0530
X-Gm-Features: AcwNN1XYCdHEoxp8zYAqowoGvQcsnsweOral1dWBweqLMbdSD1YhkaBkE_HN9aY
Message-ID: <CAOWyW_6Tgc8oPY+TOaU5zTGx3i_YPSDBoW_8RLixyzj_cWTyGQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, 
	neil.armstrong@linaro.org, olteanv@gmail.com, Frank.Li@kernel.org, 
	conor+dt@kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:24=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The schema explicitly marks `ti,hwmods` as deprecated but simu=
ltaneously mandates it in the `required` array, creating an inescapable val=
idation conflict.
yes, will fix this in v2
> - [Medium] Unresolved phandle references (`&ctrl_mod` and `&usb0_phy`) in=
 the binding example will cause a fatal dtc compilation error.
no in examples this doesn't cause any error or warning.
> --
>
> --- Patch [6]: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT=
 schema ---
> commit e8e58c2d48bc9c752ca62d3c7e0ea6fd5cff0b12
> Author: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
>
> Convert the TI AM33xx USB Wrapper text binding to DT schema.
> Changes during conversion:
> - Drop the USB control module from child nodes, as it physically resides
>   within the System Control Module address space, not the USB wrapper.
> - Allow standard phy@[0-9a-f]+$ child node names alongside the legacy
>   usb-phy@[0-9a-f]+$.
> - Mark the legacy ti,hwmods property as deprecated.
> - Document required #address-cells, #size-cells, and ranges property
>   missing from text binding.
>
> > diff --git a/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml b=
/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> > new file mode 100644
> > index 0000000000000..889190431c9a0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> > @@ -0,0 +1,104 @@
>
> [ ... ]
>
> > +  ti,hwmods:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: Name of the hwmod associated with the USB module.
> > +    const: usb_otg_hs
> > +    deprecated: true
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ranges
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ti,hwmods
>
> [Severity: Medium]
> Will this cause a validation conflict? The schema explicitly marks ti,hwm=
ods
> as deprecated but simultaneously mandates it in the required array.
>
> Any device tree validating against this schema will emit warnings or erro=
rs:
> omitting the property violates the required list, while including it trig=
gers
> the deprecated warning. This prevents the creation of cleanly validating
> device trees.
>
> [ ... ]
>
> > +examples:
> > +  - |
> > +    usb@47400000 {
> > +        compatible =3D "ti,am33xx-usb";
>
> [ ... ]
>
> > +        usb-phy@47401300 {
> > +            compatible =3D "ti,am335x-usb-phy";
> > +            reg =3D <0x47401300 0x100>;
> > +            reg-names =3D "phy";
> > +            ti,ctrl_mod =3D <&ctrl_mod>;
>
> [Severity: Medium]
> Does this reference an undefined label? The ctrl_mod label was dropped du=
ring
> the conversion. Referencing it here will cause dtc to fail with a Referen=
ce
> to non-existent node or label error during make dt_binding_check.
>
> > +            #phy-cells =3D <0>;
> > +        };
> > +
> > +        usb@47401000 {
> > +            compatible =3D "ti,musb-am33xx";
> > +            reg =3D <0x47401400 0x400>,
> > +                  <0x47401000 0x200>;
> > +            reg-names =3D "mc", "control";
> > +            interrupts =3D <18>;
> > +            interrupt-names =3D "mc";
> > +            dr_mode =3D "otg";
> > +            mentor,multipoint =3D <1>;
> > +            mentor,num-eps =3D <16>;
> > +            mentor,ram-bits =3D <12>;
> > +            mentor,power =3D <500>;
> > +            phys =3D <&usb0_phy>;
>
> [Severity: Medium]
> Similarly, does this reference the undefined label usb0_phy? The label wa=
s
> removed from the example, which will also result in a dtc compilation err=
or
> when building the example.
>
> > +        };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-=
usb-v1-0-69ac5f92df45@gmail.com?part=3D6
