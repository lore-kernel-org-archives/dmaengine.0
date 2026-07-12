Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305D2FFF90
	for <dmaengine@vger.kernel.org>; Sun, 12 Jul 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873722; cv=pass; b=UlLAEmHq7ngdpxf4rxpiEbQ//hIrEHX9BokJCYbyidGk0WglcsKSlMktAkEIijfRiRo/gMFUOjIil6Aac1/OuxSLItKGrUmdU/xIJmEk51sefpizRHtvF2kjczeYaJc8GvK/C4bPf3lfX7Tu92GZSOXgNK3zR3HJ6hh8dj0f+8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873722; c=relaxed/simple;
	bh=7i/Rn/dhr3Mgij/9YcNdsjZtxF1/hEU+xQBeMW9Ey4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXBVn/REXiZNk5ve5xV6VhIfLWZOovYzWS3DyiL2EbdvQBmA4dyridq/ixXOVXUcGlfWhrxltSeQmRkIXKJNwcqY4BasXjuX01QE5ZDAy+5Yl+4kGkB4R00t8W+GtS+JPmXKHOY4vHsh/vGEmPZdj7f1SOKVvkGs8ZKtpxt6tkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWCaehET; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWCaehET"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983ed43ca1so432828a12.2
        for <dmaengine@vger.kernel.org>; Sun, 12 Jul 2026 09:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783873719; cv=none;
        d=google.com; s=arc-20260327;
        b=sfjeNsX39Y2GwJSmmDmGz/1PDak/BBJDQtiZlblQyybEYedMgbgurzbD6CMq4k/SNJ
         S5UmITR2jm7SAVznwz/i1yIzBsQGCjJQL5NJHx9UV8RwFfX1o5bVABQjPe/eBlig4Ly7
         eWUuXKdneM8ZYQC7A+2isbQ5dWv49y4BlZgm2aTWzIpoPS1agD91lLFg0faHP7nSPGI/
         lCTUqDhlNqkQnwVlyLimUT3uATofrjEK5mi0WaqJBe56o/OlVmC9SseuLQKqfHbbn1mH
         kInqqgc8BB9QIHApSb7MOKuBpry8PiF78b7Lw+/JXnGv6BYyCwYXbGNsG3CljpChNzhk
         58Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EgoCmnmVbjw1BMhsQWXcWZO4KmCIzPKcvkDJCNUSpVo=;
        fh=u2778MsoTQo7zjptLs2N10HjyQ7umqL2YkPQHTmpGAo=;
        b=UnjodJOMHpDzOov1LayB67SEZZyRzB04kHz6vqRxHW8bR1K3GzOhdEJq+8rmdCm76z
         DMGeKwKdh5yoUvlGP2MT+4cfJq3BjJ4QIPL/M27sNTzqDoJDJls7E1ZS+bLUVUsdSdV/
         aanT0HrQm5gloLZ6fJC+McU7T2ohaJOYhRitDvtDGZ7mP0EjxGHYdrkc9uu/P02sF2iS
         lR2PwoNvThYXdskQb1iDU6iY8uIryHtJe1gmfkn5HD+PzRSJc5VVz7fbjbamc/UkHgv7
         xIge7PYBgFnNcOa7nbiV0rHpc0DJSLRxV+uXJSpbWdnDDSB2sVEiy2iXLY2oONB8FQl3
         +2Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783873719; x=1784478519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgoCmnmVbjw1BMhsQWXcWZO4KmCIzPKcvkDJCNUSpVo=;
        b=EWCaehETWOhBYSMyVmYlgtmQieLg8Njn6+a8HC45RtqSsrQfRK/NikjK3uSjYQpAG+
         qVMPTupjtmRU/oaA3rktNhK+cTRzNAYz6oeBvjQINndnajS6/OJMA8c3RcidN9qXuFzO
         wZa0saRIfDU4z8RitCmQs9WUQ/rMzc3lOARagWq4NdxJVASVQgY/H7VKrTe97gshaMj9
         2YPN8slsVXce+gbAMGzdGUtrLkoJR85JMwcCdRwRZH/23j5a97KfVMxUdyx1lJjKZ/YC
         nXMXpHmj/0/hU0ldBGOHydgQ5aC9EyXfd1ch6mlMBpKkSbw3rbiMZ+lRyKZkoUVWxqTG
         SQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873719; x=1784478519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgoCmnmVbjw1BMhsQWXcWZO4KmCIzPKcvkDJCNUSpVo=;
        b=btpKEKB1BUKBcwgHvjczznKuaBmQr/G8HrYVyjD6MicDwCR++c/0YdKrrQvv1iEeiz
         dVw9IK9WF81q9CyJXdQkyTJbWSon1/+WL+poYvWl0Myjhj54ptNzKhWN2+nmMyUxWoNV
         P+xuseX6y8gCvTac7sdwivL6bMSiJccA97jYWlhz4adFMGghvFqAGYomlkTranL/H3bJ
         oNui82T1Rb7T+cDPNlu5LtWUu5TCPkdNSA3b+7ORmt1bCu3qtzznTal5UKPF60XJ2hE/
         e3YIhnZ/dFBLkiyZyZecrpVGPSh1IQfb/dhZ68zsyFruyesSfJ+BCFGC/AfUWqNDQ6Qc
         ZrlA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg5Nd1cEB6zDEJNTbvMe9m7w5ZBfEGeo1oEF9UHP1MMkg+TOiB8mjovKLTID4gcX6vOpfgRnwRmkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52bIQWf6WKmPqCJHaFguuEuH3TsOmdpwDv2jTVZhXU7Va8QOh
	mkT2O0k1bU9NuSCaIYyFFYwBlNtpNF9kdscP9AEr3v6KY4p9ARjKL63xP+7I40YaM/nwMjk8/60
	3tvJuyRBzrLZZX8/l0jDOWBDbtAkglsQ=
X-Gm-Gg: AfdE7ck0O7eEECF2qCC9etDlw9z33ejh4+mdTDmbACrPF2o+L6mPN/SnrBPmmH6KV9H
	6eT+JABJg4kjrP4JAJPxKUCm4Bji5Bu7R0J1KnmlSTUFkaR+Qde1EQrvvag1PkiYH+fzYP7IUbQ
	RgDzTo91kIwwOvds0nuJ/gZFb3P2Kw85hmQHaTPPYnOISRb/Nu8o7Jp+WrnZwCikUuw3Di1FBV0
	to9EqyJe6vKHTd6wmwkAVAzAY5Zsi4SFIM2xo2RhrQg9xERoOSkVpAGOte+2soG2MdLN4tZbLdW
	mZrC/nZNzabeH2m/WBPxtZbeMU5aQ74=
X-Received: by 2002:a05:6402:2554:b0:697:f628:e20e with SMTP id
 4fb4d7f45d1cf-69c5f0fb24emr1619159a12.4.1783873719294; Sun, 12 Jul 2026
 09:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ti-dma-crossbar-v2-1-2ac0d6efde36@gmail.com> <20260712-dainty-condor-of-luxury-bacfa4@quoll>
In-Reply-To: <20260712-dainty-condor-of-luxury-bacfa4@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 12 Jul 2026 21:58:25 +0530
X-Gm-Features: AUfX_mwMgDvCB9nBCCsjpCryDFHPIKYbDGQ8Zy_zFoLA_FiJjkw_3uJlAmv6NuU
Message-ID: <CAOWyW_79oQB0L=3MtCnRuLst3=5ATJj=wpSS_550skTswUE2LQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 12, 2026 at 6:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 08, 2026 at 10:02:18PM +0530, Bhargav Joshi wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,dra7-dma-crossbar
> > +      - ti,am335x-edma-crossbar
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#dma-cells":
> > +    minimum: 1
> > +    maximum: 3
>
> That's rather:
>   enum: [1, 3]
>
> right?
value 2 is required by DRA7 enhanced DMA crossbar (edma_xbar), and it is
used in dra7-l4.dtsi so i think we can keep it unless you specifically
prefer enum: [1, 2, 3]

>
> > +
> > +  dma-requests:
> > +    minimum: 1
> > +    maximum: 256
> > +
> > +  dma-masters:
> > +    maxItems: 1
> > +
> > +  ti,dma-safe-map:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Safe routing value for unused request lines
> > +
> > +  ti,reserved-dma-request-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      DMA request ranges which should not be used when mapping xbar in=
put to
> > +      DMA request, they are either allocated to be used by for example=
 the DSP
> > +      or they are used as memcpy channels in eDMA.
> > +    items:
> > +      items:
> > +        - description: starting DMA request line number
> > +        - description: number of consecutive lines to reserve
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#dma-cells"
> > +  - dma-requests
> > +  - dma-masters
> > +
> > +allOf:
> > +  - $ref: dma-router.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,am335x-edma-crossbar
> > +    then:
> > +      properties:
> > +        "#dma-cells":
> > +          const: 3
>
> else:
>   properties:
>     dma-cels:
>       const: 1
Yes but this should be rather,
else:
  properties:
    '#dma-cells':
        enum: [1, 2]
as dra7 doesn't use value 3 but uses 1 and 2, I will add it in next version
>
>       Best regards,
>       Krzysztof
>

Best Regards,
Bhargav
