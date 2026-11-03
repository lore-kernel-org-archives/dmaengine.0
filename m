Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793725818;
	b=r8fFubbnbYvFdDlqX4yj6DMSRpGkvyLQAkeiwgC2Gl+1yy+XR66XG9viv7MbZZIQjLfH
	 nypAbEGAHP1IwzDRnP6CPXAY2Wm8DImzcejtNd+XhrLR4UcpBoSHVm94O0UYZZ48QwoSW
	 J955GdhlA0pOQBukhFT9FKLrcqmjgcA+cBAVGtd/lIcTAJJ8n2YkE2OcjdVFKC43grPsg
	 BsRxg8s3yJBk3Ho8q0vV8oioodXio5afxcrBXUAHxbPP9u9RjAQotin8hDhU2HjfJKdfE
	 DTOa6WyToSUf7LpxvF5H9l9Xkckx7hWSMpm24vxM+0nDKWbCWGNKTdYmJJ4A1/aYtxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
	b=MoQmJYQU3vWPs6QVcyW3257uW845w3SR04YXdJ6u2J6I5KI2p/drTLQqSiqY5hjoJPtM
	 8QyIo7XPYp522njbC5pGygi7fK0ueq2uVSg1ErOAvjmZTZG0EHm1z2rjpTdz3JB9pwhgQ
	 dw48PxW5FF1rxEXtTcand/VTTXjJr+5coylv4yKXNnX2vVbkNLfEBGHzRww6uN6RD2RTb
	 ne2bQV74S71WU3Gz/7STAWh+QbGagmClvi9XF+D64Av6xzgjehGWcfDzQLuHCNaXlPz3E
	 MpK3XWO33p+J5qp+ihgrRHwvVLVoF0Q2sbLkga5QWpaW8FWM4ke5omMp7vlc9j4t31w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=JxILHW9o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AD606A329
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 17:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=JxILHW9o
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso727774266b.3
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 09:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793725811; cv=none;
        d=google.com; s=arc-20260327;
        b=D1WpqDF3YKlV3QZy/6MqcliAMWP3Ry07DwjPMv1tfk552mMXYEp9xp1+2NYjmW31wS
         HgQIzIoWEBT2OVVUNKhwfKJLFhEyDyE9cxSdripsGFUfSivU45t2OlygaGfhUauPAgx+
         QKcE1U/inlHP7oOdZqLJ/qOtIveta4THBYWXi6h6V3wUJvrN3YDN7I9gCOtRcdhBqAI4
         YM3k76+7gX023BwH+1qkjgHqH1UZ+GDH3MxMPhyjclDQWQ8LJxp70B91TzwuxY9rbnpL
         p+50I+yi3nGgFZ8Kw6sH506CNRohZYY8jfe+yUQ5WJpMvf7YmMUdZdONNyYBz6y5XXTY
         lMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        fh=2wQcGPVuLgs9+zdBTFghdka785GqKJe9s+BgPqDjhUw=;
        b=dsy+gBzwCmiEhXTxXzihN5BsTcFG866N5bz6/8v5A9/wx3WryNzkXL6Qr0okm+Rz8C
         R+IvGsiwDJz66DQ9vikiS68XLfKR+wNAd02DLu+qkW0VN3CjM4gP7hYfjP5xgrqEJk5r
         2lvNSFb7ooFY2Lj/SGl9Qv+IflTHZnbmls873LR26Uq19ZzF85JwYYhdhqg5BdbOx2EG
         Nb4iJiaw4SokOrucwdNhMQX/ctksIUoh9ESiDNO/G84gRy1aAjLPu2VqmU8wj8bAULMI
         EZAcqQA2twjrOeLygOalvEhFbYVrkgDqXtEMLaeubgRdDCmdSxBr0Xhb/oxEUF9iGGpv
         dvqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793725811; x=1794330611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        b=JxILHW9oYQyXUYBtKv5mOLzWifmwbFU5MNI6Mp4YODeYAzXlF6FwKyKkebHtzdDUmP
         oXoW2e5P8WnYVZNz7WHUyIFENfwIZI1SD3j4wlgld63bqHDUfuqwCyjVM6tGZg095Ar9
         ou5iZ8mvEHPtc2qB9uYv3hztIjJReuw1mOKug0C9yGfIIPj2AFQN+pOenpQvaxSV+5tK
         AKHy1yYC/IEtbdkJ94EYKQoYPFQ76GClEv0y75JPclIa+KUBpLBVQ8VkgaAFCPVhV70e
         yPtYJX87NNuZpHnwgo7/tkA2MJwTZ1Uz4tZ7JzvmBzB2IsQM+S/v9DwgE4cYVMCDibu2
         Tt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725811; x=1794330611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        b=O1YYFsxl3hf6umw8KZe7FFjqYqFpJ+VX10/pfTyrg9APUF5rB6ZLrMNXQQgkgM5Bm2
         A0ONfx0PUJUFBVbfQuKaEGXrzuxRWECdXmROQO0S+HnQHL+pheRlp6SxLsHc1fqhKIFp
         kHOhpH0U+orOfgrfS7uqUX/W3U4cf26i2f0quMbXRZToaWOUlKaDKjwZM/fUYrPYy8ta
         UXsTUJs6MusleVdMwgFHSK8t0J077kigjQG5QWriVhudsE0ziD6pw+G1m+bH7fiifaMB
         RN9DzK0s8csGQRNaAUqL1fzu5wZ1zWPQSxDZJBFZHJOVNPi2jZJLPoiIM1B3BoaIlEZh
         fkCw==
X-Forwarded-Encrypted: i=1; AKwUvBzjOHw9zv8+YFSpDhcm2D0y4ijkIuWuPyLp7Mc8IS4M1HtKO6Wutr48KlGwmYxgiByv2XtPp+dh5V0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TBbOVEeZQks4c6MPd4d5G5bJE8GYRHXbJ5FP6MvX9ksFBGuAv
	1ZY/PvMLn3XtqzALBtOhzRwsRjpkyMDhMefp7e060oeJwVRUS3NFNIFoPqRIqgiu4JD4eCBhYz2
	dMQyiqttsCo/yf5hu+/AaHpcMfYvAJvYgwBkwEuU+/Q==
X-Gm-Gg: AYBFou0GFXxtNTG475ympAAm/GWp5KzKcohts/kJ9HTZ+cRL5jTxq4P136lMzYIP3ZV
	ShpAQkMgqMYyZ02zI941YMCUijTYBABlRQxpIGNW+CtBpxAk1vXjqtRBJrNDtxiLB7q031mS5ZU
	HdxNLGuRGLJoUJJzHCvxFkbZ0j1ksG40u0k6kuxdVx9Mf+okkGLWMyWXti1MmlzWk//XUUl3r9o
	Ru3arR7T8GRhfZ4yEPqfQygVe7acg2RRiYZ8Pqy9V/ugyzvW+iCyWoR3jOgN+XJIuIS77jmBAxI
	Zf+9c+9WvW/7QkvPIVQxIbV1Hu+vT0Th4mRZlWCc1cKDD6PMEeQy/gTB4oLO6A6vo2oWAQ1Qwde
	zs7BU7D7NxXAhlqnoVHxtukU6QFKCRxnIhdx8DSEtemhCvgzWfmh4/a4U/LyWLlaOkOVq
X-Received: by 2002:a17:907:9811:b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c4ca74209fcmr1138335066b.0.1793725810499; Tue, 03 Nov 2026
 09:10:10 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
In-Reply-To: <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 3 Nov 2026 17:09:33 +0000
X-Gm-Features: AclHuK8tMj1QOQ1uafVmUFnYp2xZaTUAkPNNAv0ydPYWKPLq44x8qXFWk7k_EBs
Message-ID: <CAMEGJJ2ro0s0ZvQRgNneZZKTictbQcWzfLAT9fc9d62uA1cS3g@mail.gmail.com>
Subject: Re: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Peter Robinson <pbrobinson@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:49, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Peter
>
> On Mon, 2 Nov 2026 at 09:07, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
> > up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
> > that support 40-bit DMA4 channels so add support so this works upstream.
> >
> > The first patch updates the bindings, them patches 2-5 do some
> > refactoring and add the support for the newer SoCs.
> >
> > Finally patches 6 and 7 add the nodes to the base device tree and
> > patches 8 and 9 enable it and configure HDMI audio to use them as
> > per the down stream device trees.
> >
> > The series was assisted considerably by Claude Opus 5.5 based on the
> > various downstream Raspberry Pi patches and tested on a number of
> > RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
> > and dtbs_check pass clean.
>
> cc Phil Elwell as he knows far more about DMA on the Pi than I do.

Let me answer some of the questions that have arisen:

1. The downstream bcm2711 dtsi has 2 nodes for the DMA channels for 2 reasons:
   i. It is an accurate reflection of the hardware, and which bus the
DMA controller's bus master interface appears on.
   ii. It allows us to use the address translation provided by the
dma-ranges property - we do no explicit address munging in the
downstream driver.

2. This driver does know about each channel's capabilities - see how
is_lite_channel and is_40bit_channel are initialised independently of
the DT node where it is declared.

I hope that clears things up a bit.

Phil
