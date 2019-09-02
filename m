Return-Path: <SRS0=o9uo=W5=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE7DC3A59B
	for <dmaengine@archiver.kernel.org>; Mon,  2 Sep 2019 08:52:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E19D2173E
	for <dmaengine@archiver.kernel.org>; Mon,  2 Sep 2019 08:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730594AbfIBIwc (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 2 Sep 2019 04:52:32 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45445 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbfIBIwc (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 2 Sep 2019 04:52:32 -0400
Received: by mail-oi1-f195.google.com with SMTP id v12so9877512oic.12;
        Mon, 02 Sep 2019 01:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BzAZZRviuMDn2r64WPalgs0DmpFOxned7Ta1XqFhMtc=;
        b=qFNcaQ9yyp7XKxwi4gnAAvPuMRYgKSeFaXSYWVXcz4jD0rzQ5S6OeAvkFeuN6VAeqt
         HEUjTEUv+CRbGtkqGzU2OoH0se2oN/3AtLCN8XHcvNu3UZq5pOGxE/cst2+gmKxbqxzW
         JsPSnB7bfDHaCnHFDrvEZU6LHhaR8Gv7c3I4pFHevokqHlDn444eEpjo0imEhV3lPyQk
         uMk9yXptsJEmgClC5TB88IhRjEGPFU3F+xh9lrPAxMyfvIQCyuGmuYKOKG9PJKfjDA4U
         X6tpouMoYXbxLKMQh6OjIcXJ81MvRebIQ1mGgnfB1UgTO2kmW5aZTW8/V4UzOsSXjsJN
         Wp7w==
X-Gm-Message-State: APjAAAVGmiWeZ/tgfxMwmllb9d4ffA4E+JwBmXYySN2z2HXsBG1+fNu0
        B9ZYiF2YksW9S1lc24TWbFHDOJwPSGxlKmEruRM=
X-Google-Smtp-Source: APXvYqxOVkJ5aaiGfRLywqIyKbyCBEHPdv6vb+Zo587GkDTcTuFmlMdNYQHiaropCS78ywXzlBBQoBxyDD7MvuYvzsY=
X-Received: by 2002:a54:478d:: with SMTP id o13mr18723515oic.54.1567414351703;
 Mon, 02 Sep 2019 01:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <1566990835-27028-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566990835-27028-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566990835-27028-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Sep 2019 10:52:20 +0200
Message-ID: <CAMuHMdVbbnUj+S48oxBL0HDQsRjSBCLnfztj8WHsz-VQ=aWN5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: rcar-dmac: Don't set DMACHCLR bit 0 to 1
 if iommu is mapped
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Vinod <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Shimoda-san,

On Wed, Aug 28, 2019 at 1:15 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The commit 20c169aceb45 ("dmaengine: rcar-dmac: clear pertinence
> number of channels") always set the DMACHCLR bit 0 to 1, but if
> iommu is mapped to the device, this driver doesn't need to clear it.
> So, this patch takes care of it by using "channels_mask" bitfield.
>
> Note that, this patch doesn't have a "Fixes:" tag because the driver
> doesn't manage the channel 0 anyway so that the behavior of
> the channel is not changed.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 779b715..204160e 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -192,6 +192,7 @@ struct rcar_dmac_chan {
>   * @iomem: remapped I/O memory base
>   * @n_channels: number of available channels
>   * @channels: array of DMAC channels
> + * @channels_mask: bitfield of which DMA channels are managed by this driver
>   * @modules: bitmask of client modules in use
>   */
>  struct rcar_dmac {
> @@ -202,6 +203,7 @@ struct rcar_dmac {
>
>         unsigned int n_channels;
>         struct rcar_dmac_chan *channels;
> +       unsigned int channels_mask;

Given you want to store the output of of_property_read_u32() here in a
subsequent patch, you may want to use u32 instead of unsigned int.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
