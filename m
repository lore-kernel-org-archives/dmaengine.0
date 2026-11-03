Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793724551;
	b=WAKu/Ro+feLAzbOHli5lT3TwUBtYqYcvfL4sZfXU7fAMuUCwk8WuyQXubffXcxkt/dz7
	 sav5b7lOPeapQkppX0/hy9lMRNiFGn5bXnvXq54u/KycnbwFUgE4q36F5PB/6x7SMyK6M
	 oa9TaxnEXFBgIJqIxQ3i3mr/CQpX+DYbXK+sL9Pv8vbN/rmPJgwn1byvxS3BhdCVLTfiO
	 u9C/7weVJJoMKUPpMxbm/03Cd7qjbyksKlmF5ridTlGvk1IPqzxcrqZ+Eh/G6UcKXdRS3
	 yz0sy8w3xr//SwWH2H/7ODUXkwlLRMZ1JKZSEkQupU3YyNvKBl9QpaofU6bpCalfuLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
	b=zlZHjZ1ofF/2neQhaJrIKbSrLi69AniVnfaQYuD51ARKHTu7XtmIA5aDRDb/NhPUhtmA
	 bbqpdU7zkre5if/d3v2+DzJ7FD9Ld5/+4wsg6E6XEeSWtbTZmGt5/SGRxvkoDtjYLpaqL
	 FsOWP8XXN6cDeuBadp/C2m2231XLVTx55Ql3RxGSNkQHHZhttx1GrNKSNu/EG5SGWTqDi
	 Y0xpDGWvLE/cUMgVLpj+2SIJpUKBC9e3eVVoDFsmJD+QQOgrDLn0YqShLieJFhVMltW7v
	 bbaOIps8VcofLaz7Xmej1HJHkUasvOu5Tyb/u4AyDEGOmlH0MoYOxKsqLUZlcOBej/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=k7gshdYH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFCB606A326
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 16:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFCB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=k7gshdYH
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df7f544919so2957733eaf.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 08:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724549; cv=none;
        d=google.com; s=arc-20260327;
        b=mrc9970k0iesQZzxQLLo0B2beKZGRWKOEsFrYxlyMwck/l6BQ5kKkWNwBwNDqpJgir
         wXI2qwe3XLwMvsMXl2CkCXv24bMy0+u8EE0Htqlm2YB5e0P3G1mlp5MqBTlA3Af4/l4J
         Eq2Jx3yuktJOdYt4GoDcGc/YaMLm0YkVb3/I/lnUVI1eym+clBMeonvPpLSZdZQKi7//
         VjQDsSL1zdhpncUjJ71A2KthS/goa91shMEBJcC6OJTOvPpQjztc/Mjkpkv79vBWcMc9
         VcAdM0/rSWmL4rblwUmQkmy8Ug8ruMWFRsZZmLjcGajxEJzxPno9GPSDaefXdYVUV7IE
         LzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        fh=LCh+tS1U4KVo6P3G1z1fMGEhJ5t8D4MHF5A0oD2bdLw=;
        b=rv/4HmhZw5Tj5UZtIOG9iqrdX864p6SKhUXFDUDsVjbYB22xZpdq5ud/63QCRSk/bk
         1tX0aX+/hdkRbyJK4giMlC0vz6/KbT03MJigIBEgCNMQtruFKBP/CakG5rHtNMUq4eHC
         4La+9MJlejrKrIPEOUw52cspgkd7Xox7I4C7pg6zgx0m8nfPM2DeMkllxIQ4DHObnHAE
         KndvlmvRqJUyQaprSnBDdFJmf5f5eGP07FeYynSB7Pk1cQ36wZtemI7XNE96bxXOp+Be
         DHUeVylHqY8vIZzyh3OogyykE1cLFdGiF7546Lo8kqJdbq6Agrsu0OOnIPK3cF+tIxWL
         PYYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793724549; x=1794329349; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        b=k7gshdYHRpP53Q7yeUy/RmrSI399/OaEJ5JN3Z30FYBxMlDUTN0TzBgKJ0pQM2quGx
         1dTOArEXd95tQ6sQA8kOE/pWv2HFyTPcRMPpN6ghfaRcAZL8+7n9mThGi5g3gXK5HNub
         gHk0d/Hixn+fFnFpJEEYM9l5EWUeI4cw0l++x+RESBVSIfxuLJfj5FNl3YPjRdcdTt4+
         +RJP58CeAAnn/+PprgIHVGkedMLUxnmwMjAXLjTjlqzjbZTLUA8//jMGSv5VvUmUPOLs
         pgUTHs8aZ9D6rxKc+Zxe/QD/HeOQzXGK/lLXtb829YCh49Sfql+BxoI3MrTvC/x/W7GX
         CKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724549; x=1794329349;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        b=0ehZ5cjs7bxEK0f90NwpRoPnlKjM59ZRCm34a6XQBJgTsy8uZI5DzLXzuEV56fYCWz
         eOEKhi49MtCbjQsNKPnFuIi26gOER62HtQbEhVDWyo39xV65mA68xbNH8EuEQOgWKd+f
         EwRJ4wBhPNGdGBcfsieAU7XQo6gnIJQUzLcnpgs2SmC84ybXqQIDF9MVNM4KO822u2h7
         orQG8QThcEEpYFMmUO+CYiyM/cD8XZxrnuixQLV0C4AtGb+CqP/Mw5MWGBPOjOePH4tj
         0LcYgsjD0BVLz849T+YGB1+yNpcu/BHKyTaXnHWKFKgV0KmCobiBjhwX/22QBs1NXY2K
         vJJA==
X-Forwarded-Encrypted: i=1; AKwUvBy9ZZmKA53CymnsKvYoGF4GIko9F+XAEEO6ePuUgmRQBUf+qrSiU3gZJb75/gAx/Gil/xVVB3uIfnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zd44JrwYH7xvNRVxpP1+xc4xtXO0mABjFe+y7xixnEEOMkV5+
	GvOrpcyum3YVAiYs8DGwV67KwRYMiIocHj4BHbhJmtgnDuY+Wltz+M/U7WEdsgzBGP3R4IgLwwn
	3XAMp82qLhT/1lfnTMHXNc5ESJQAfCwFOfs786H7cKw==
X-Gm-Gg: AYBFou3uWlXb6IkXbXHoBb7a6/Xi8/mw2zNx5kQ0uK0mxaLYAo82yoeDM1knheZArzJ
	jz4BSz/nF4aoetB7gTXB/klmE02v4nEKQK47PnGyyuPDCfc9TW/p73x7UtjHnlnJi9qIHtXHlsU
	mTATki9d+eyd+4Kps4JIzSnpZr75PN1bGZelQi6hi6C3OS6sO5AMDnRNDHB5+qNtt1vtj3Ur9P4
	HymrwwN7OUui/FeWK6Dyue5QUgLVzCtHCncG4DQrT8awXvU9Oo5aeMVIT1JIp3GEQY/9RQi/XFg
	lzkifSevgfRS1rL8P7XcwoWn9yuCn6FX6Ea9UL4X+Ndp+nD9wXMxGbiBqa+qAEBh0DXshApuhvG
	UEtwkOKfrwhBHuG3o93BjQoYpu1JMEs0dWcZ50NHMfk18OFrFM0Pr/LHqWReZwBoHwA60ZKwCRT
	sIoKLXGHWabV0UGYt7lOjZP9hWAylCVwd0mqYsyx0B0jhVm4uay0/S
X-Received: by 2002:a05:6820:1794:b0:714:b145:a2fe with SMTP id
 006d021491bc7-714f2421901mr8082390eaf.12.1793724549410; Tue, 03 Nov 2026
 08:49:09 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com>
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 3 Nov 2026 16:48:52 +0000
X-Gm-Features: AclHuK9TxGbcB0r3JV185lrcPtsBTW6TG2IE6iERGadxyS8js5NnWPr-6g7jlJY
Message-ID: <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peter

On Mon, 2 Nov 2026 at 09:07, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
> up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
> that support 40-bit DMA4 channels so add support so this works upstream.
>
> The first patch updates the bindings, them patches 2-5 do some
> refactoring and add the support for the newer SoCs.
>
> Finally patches 6 and 7 add the nodes to the base device tree and
> patches 8 and 9 enable it and configure HDMI audio to use them as
> per the down stream device trees.
>
> The series was assisted considerably by Claude Opus 5.5 based on the
> various downstream Raspberry Pi patches and tested on a number of
> RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
> and dtbs_check pass clean.

cc Phil Elwell as he knows far more about DMA on the Pi than I do.

> Peter Robinson (9):
>   dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
>   dmaengine: bcm2835: Refactor control block handling
>   dmaengine: bcm2835: Support controllers split across several nodes
>   dmaengine: bcm2835: Add BCM2711 40-bit channel support
>   dmaengine: bcm2835: Add BCM2712 support
>   ARM: dts: bcm2711: Add 40-bit DMA controller
>   ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
>   arm64: dts: broadcom: bcm2712: Add DMA controllers
>   arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio
>
>  .../bindings/dma/brcm,bcm2835-dma.yaml        |  31 +-
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   8 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  16 +
>  .../boot/dts/broadcom/bcm2712-d-rpi-5-b.dts   |   8 +
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  10 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  40 ++
>  drivers/dma/bcm2835-dma.c                     | 496 +++++++++++++++---
>  7 files changed, 534 insertions(+), 75 deletions(-)
>
> --
> 2.56.0
>
