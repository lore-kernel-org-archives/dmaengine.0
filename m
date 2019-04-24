Return-Path: <SRS0=fQ6P=S2=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FB9C282CE
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 12:22:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2D19218D2
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 12:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbfDXMWU convert rfc822-to-8bit (ORCPT
        <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Apr 2019 08:22:20 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:42441 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbfDXMWU (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 24 Apr 2019 08:22:20 -0400
Received: by mail-vs1-f67.google.com with SMTP id f15so10234877vsk.9;
        Wed, 24 Apr 2019 05:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2+gyHyjOSfX4EDiY7exTorEvXpPqFPghhbTRaLfpWlM=;
        b=ceuvQkcGt7B5W8Gk/AoM+nZ0XxBxed4s+paATFE3CE3QN8ssjVLrjU4jl+DRF5XoPi
         LAnUS2/jJW+GlBNjpkJUtuYwNWTnKqCzyHbLFsZ3YtrXpXBUeZxrtN+tiS0ImB0OlwYD
         5E3HV8YskKO0OuJMMYTRdOIYDmkvnHCaGFld3Wceaqvc7cyL+hYgEIRVO5SKXA41M70y
         A3+Ih8PREXMtknEU11xKsiHlB8t71y609FcSsoUqEJKB7xNlQmkwlbQxTZxiAGhTXniW
         8wI6N4+edCNJhiSyNL0mb5539HkJqRcU4ov1iTFlMjMAmqWWBguJNxaThoJaVJukw0eS
         ds5Q==
X-Gm-Message-State: APjAAAUJ0xHNcc1Ao3kV2JaiRuiBsPVIx9/AWQ4wXP/C7/8dV/RHMFB/
        i9SgwBa24tOvI16zDH2KRXPWwGHhrX7gZnPt99Y=
X-Google-Smtp-Source: APXvYqxMS+D620DJ7TPM39p4hDoPhPRDnewp45WELr1tq/x1uzopZXTMdhoYdD1nvFF0JaYq+u5Li1jFcdaBFXdRq+g=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr6228666vsd.152.1556108538862;
 Wed, 24 Apr 2019 05:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
 <20190411084937.y5m6vzcwtkqqun7s@verge.net.au> <20190411151756.GC30887@bigcity.dyn.berto.se>
In-Reply-To: <20190411151756.GC30887@bigcity.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Apr 2019 14:22:06 +0200
Message-ID:
 <CAMuHMdXLM0hkUva4AukBpYy+=mRQ_tWT4XCGb=ZGbuT5nYMzjA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190424122206.OtcecimGAQzwjZ7v_0KTN1tRldYoKkhtOVMJvgZZuYY@z>

Hi Niklas, Shimoda-san,

On Thu, Apr 11, 2019 at 5:18 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2019-04-11 10:49:37 +0200, Simon Horman wrote:
> > On Wed, Apr 10, 2019 at 08:26:57PM +0200, Niklas Söderlund wrote:
> > Not strictly related, but is it appropriate to:
> >
> > 1. Move this driver and drivers/dma/sh/usb-dmac.c to drivers/dma/renesas/

That may make sense...

> > 2. Remove drivers/dma/sh/sudmac.c which appears unused
>
> I let someone with a better grasp of history answer this one. From my
> side removing drivers which are unused seems like a good idea :-)

There seem to be some (half-baked?) interaction between sudmac.c and
drivers/usb/gadget/udc/r8a66597-udc.c and drivers/usb/renesas_usbhs/fifo.c.
These don't seem to be used at all on Renesas ARM platforms, but
CONFIG_USB_R8A66597_HCD is enabled in shmobile_defconfig and
multi_v7_defconfig?

Shimoda-san: can you please enlighten us?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
