Return-Path: <SRS0=Wixg=AU=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6686C433E0
	for <dmaengine@archiver.kernel.org>; Thu,  9 Jul 2020 08:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FE5520708
	for <dmaengine@archiver.kernel.org>; Thu,  9 Jul 2020 08:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgGIIhO (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 9 Jul 2020 04:37:14 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:48765 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgGIIhN (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 9 Jul 2020 04:37:13 -0400
X-Originating-IP: 86.202.118.225
Received: from localhost (lfbn-lyo-1-23-225.w86-202.abo.wanadoo.fr [86.202.118.225])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 70464FF810;
        Thu,  9 Jul 2020 08:37:11 +0000 (UTC)
Date:   Thu, 9 Jul 2020 10:37:11 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     tudor.ambarus@microchip.com, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH] MAINTAINERS: dma: Microchip: add Tudor Ambarus as
 co-maintainer
Message-ID: <20200709083711.GA3759@piout.net>
References: <20200709082410.6880-1-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709082410.6880-1-ludovic.desroches@microchip.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi,

On 09/07/2020 10:24:10+0200, Ludovic Desroches wrote:
> Add Tudor Ambarus as co-maintainer for both Microchip DMA drivers and
> take the opportunity to merge both entries.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  MAINTAINERS | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c87b94e6b2f6..b1382f73ec28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11259,14 +11259,16 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Supported
>  F:	sound/soc/atmel
>  
> -MICROCHIP DMA DRIVER
> +MICROCHIP DMA DRIVERS

Since you are renaming that, entry, I'd go for something with AT91 or
MPU as there may be other BUs submitting dma drivers.

>  M:	Ludovic Desroches <ludovic.desroches@microchip.com>
> +M:	Tudor Ambarus <tudor.ambarus@microchip.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	dmaengine@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/dma/atmel-dma.txt
>  F:	drivers/dma/at_hdmac.c
>  F:	drivers/dma/at_hdmac_regs.h
> +F:	drivers/dma/at_xdmac.c
>  F:	include/dt-bindings/dma/at91.h
>  F:	include/linux/platform_data/dma-atmel.h
>  
> @@ -11406,13 +11408,6 @@ L:	linux-wireless@vger.kernel.org
>  S:	Supported
>  F:	drivers/net/wireless/microchip/wilc1000/
>  
> -MICROCHIP XDMA DRIVER
> -M:	Ludovic Desroches <ludovic.desroches@microchip.com>
> -L:	linux-arm-kernel@lists.infradead.org
> -L:	dmaengine@vger.kernel.org
> -S:	Supported
> -F:	drivers/dma/at_xdmac.c
> -
>  MICROSEMI MIPS SOCS
>  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
>  M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
> -- 
> 2.24.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
