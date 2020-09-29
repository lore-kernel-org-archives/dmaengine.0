Return-Path: <SRS0=x+Fe=DG=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CBAC4727C
	for <dmaengine@archiver.kernel.org>; Tue, 29 Sep 2020 18:44:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B9132075E
	for <dmaengine@archiver.kernel.org>; Tue, 29 Sep 2020 18:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601405067;
	bh=qC/oe6gb+6KT9Rvu5m/SCT+jMK8zG0adDcErzCiw+WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZhNLJKB/bkvMrpxW5RmqSS6pxVEE39y+Xf3YfNiB0+40LA5Qf6+8xsDi65TlCBTrX
	 e+WqrW8gt32uAql0I9x4ZmWXO5KsgIX1VsXQY1OzqArdAcT0JT9kjq8pZl9+klct+9
	 rxxXnp3fe4xHYhgZ0W65cn6z2HZHdusjrcnwdONc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgI2So1 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:44:27 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:37982 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgI2So1 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 29 Sep 2020 14:44:27 -0400
Received: by mail-oo1-f66.google.com with SMTP id r10so1542225oor.5;
        Tue, 29 Sep 2020 11:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nY9+4lqo0MEowM9x/sIa8yC+J2rLn2r05J1zX+4+m4s=;
        b=aQGDDNzbxJz6kJs4B5rEjz7c6L1ZXJJ/j6wLnid8JQpx6N5nkgsm+VMC/MFD/Dxuji
         vcWM5bQNkZQL+yvswZ87m6dK2nPz9IXWBFKVao1xqpZ5Zs23kz9jO9ACzQHbag7BGjBA
         kivhfTMxo2ugH3Tnqq6SXtj9ZoxenhxHHaATEv8EeIYCoEBKuEZfvXMi9CoBkKIXu5nY
         bHv9FpLrRWPkT6A8wvLhmu6ueEWH658XAd7Unyr5wUsLM6kgCsTa09lIpS8YZ+pMS6ta
         nFysqxc9M5+tsPU8ylVg4R8J9+yLx5OH/PyKMoinvgwmToMFmJmJ7iolqM9Y/24wqpAg
         7g1Q==
X-Gm-Message-State: AOAM5320QOcPIfVaMyyCf+XrarlA84PGCEzJ09TcCPGOn66ZbJZl6As9
        VEcaZtXsIOecJZGAdYZ+FA==
X-Google-Smtp-Source: ABdhPJxBmQ/k0EOFw/H4LYM2itNduFhHNo8ttvEQXf2Wi/Nv6QTqhg0BflBo9p1gchQuzxE/ckBrvg==
X-Received: by 2002:a4a:d80a:: with SMTP id f10mr5709037oov.76.1601405065955;
        Tue, 29 Sep 2020 11:44:25 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f94sm1180147otb.29.2020.09.29.11.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:44:25 -0700 (PDT)
Received: (nullmailer pid 940845 invoked by uid 1000);
        Tue, 29 Sep 2020 18:44:24 -0000
Date:   Tue, 29 Sep 2020 13:44:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: dmaengine: Document qcom,gpi dma
 binding
Message-ID: <20200929184424.GA935309@bogus>
References: <20200923063410.3431917-1-vkoul@kernel.org>
 <20200923063410.3431917-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923063410.3431917-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Wed, Sep 23, 2020 at 12:04:08PM +0530, Vinod Koul wrote:
> Add devicetree binding documentation for GPI DMA controller
> implemented on Qualcomm SoCs
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/dma/qcom,gpi.yaml     | 86 +++++++++++++++++++
>  include/dt-bindings/dma/qcom-gpi.h            | 11 +++
>  2 files changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>  create mode 100644 include/dt-bindings/dma/qcom-gpi.h
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> new file mode 100644
> index 000000000000..82f404bc8745
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc GPI DMA controller
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  QCOM GPI DMA controller provides DMA capabilities for
> +  peripheral buses such as I2C, UART, and SPI.
> +
> +allOf:
> +  - $ref: "dma-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,gpi-dma

Should be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt lines for each GPII instance

GPII or GPI?

> +    maxItems: 13
> +
> +  "#dma-cells":
> +    const: 3
> +    description: >
> +      DMA clients must use the format described in dma.txt, giving a phandle
> +      to the DMA controller plus the following 3 integer cells:
> +      - channel: if set to 0xffffffff, any available channel will be allocated
> +        for the client. Otherwise, the exact channel specified will be used.
> +      - seid: serial id of the client as defined in the SoC documentation.
> +      - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
> +
> +  iommus:
> +    maxItems: 1
> +
> +  dma-channels:
> +    maxItems: 1

Not an array. Is there a maximum number of channels or 2^32 is valid?

> +
> +  dma-channel-mask:
> +    maxItems: 1

So up to 32 channels?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#dma-cells"
> +  - iommus
> +  - dma-channels
> +  - dma-channel-mask
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/dma/qcom-gpi.h>
> +    gpi_dma0: dma-controller@800000 {
> +        compatible = "qcom,gpi-dma";
> +        #dma-cells = <3>;
> +        reg = <0x00800000 0x60000>;
> +        iommus = <&apps_smmu 0x0016 0x0>;
> +        dma-channels = <13>;
> +        dma-channel-mask = <0xfa>;
> +        interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
> new file mode 100644
> index 000000000000..71f79eb7614c
> --- /dev/null
> +++ b/include/dt-bindings/dma/qcom-gpi.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2020, Linaro Ltd.  */
> +
> +#ifndef __DT_BINDINGS_DMA_QCOM_GPI_H__
> +#define __DT_BINDINGS_DMA_QCOM_GPI_H__
> +
> +#define QCOM_GPI_SPI		1
> +#define QCOM_GPI_UART		2
> +#define QCOM_GPI_I2C		3
> +
> +#endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */
> -- 
> 2.26.2
> 
