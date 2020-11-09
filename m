Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABFDC4741F
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 09:54:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1817120789
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604915663;
	bh=VVpHmqjN0Zg1/NjdG2vwxUM3gyQDACGicowXg3lKOdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yRZslhcE5vC9tIxz7GWRfOh7Nugqp7+zBEUf+HCKcefHeU+eaFwLLXJY2QCnp9Dgd
	 Wm4bbAPLDtnLUmQ5hmYiIj72GogD9JEr+Mz3V9x5JS+sjl7prshwXUU779UejJlXdx
	 xZ+8K3WRVnr21MbAQYEvkMzrnSYfxsvFJ/wUpZ7E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgKIJyW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:54:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:33074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgKIJyW (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 04:54:22 -0500
Received: from localhost (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5CE62067B;
        Mon,  9 Nov 2020 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604915661;
        bh=VVpHmqjN0Zg1/NjdG2vwxUM3gyQDACGicowXg3lKOdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eXbyB9JtYMb0+O7cRyxmaXkzTtzeIpVbOFdTW9EOFc1UqEUN+B/sCkabRLEUt19Wh
         7x4IxnkOy5M1UoKJrSO6/T9o1H/kxI3BETeEWNnaweX5o3qGD9QPCgpmx27Pe0lUFV
         9cdrlyAqk2Kc8MPEUQtMB3SZ2/sHog0zgpaB+Ihs=
Date:   Mon, 9 Nov 2020 15:24:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sia Jee Heng <jee.heng.sia@intel.com>
Cc:     Eugeniy.Paltsev@synopsys.com, andriy.shevchenko@linux.intel.com,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] dt-binding: dma: dw-axi-dmac: Add support for
 Intel KeemBay AxiDMA
Message-ID: <20201109095417.GE3171@vkoul-mobl>
References: <20201027063858.4877-1-jee.heng.sia@intel.com>
 <20201027063858.4877-12-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027063858.4877-12-jee.heng.sia@intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 27-10-20, 14:38, Sia Jee Heng wrote:
> Add support for Intel KeemBay AxiDMA to the dw-axi-dmac
> Schemas DT binding.

This patch should be 10th one, we add binding before its use in the
drivers

> 
> Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index e688d25864bc..0e9bc5553a36 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -8,6 +8,7 @@ title: Synopsys DesignWare AXI DMA Controller
>  
>  maintainers:
>    - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com
> +  - Sia, Jee Heng <jee.heng.sia@intel.com>

That is intel representation and not your name, right! This need to be
your name in from Firname MiddleName Lastname <email>


>  
>  description: |
>   Synopsys DesignWare AXI DMA Controller DT Binding
> @@ -16,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - snps,axi-dma-1.01a
> +      - intel,kmb-axi-dma
>  
>    reg:
>      items:
> @@ -24,6 +26,7 @@ properties:
>    reg-names:
>      items:
>        - const: axidma_ctrl_regs
> +      - const: axidma_apb_regs
>  
>    interrupts:
>      maxItems: 1
> @@ -122,3 +125,25 @@ examples:
>           snps,priority = <0 1 2 3>;
>           snps,axi-max-burst-len = <16>;
>       };
> +
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/interrupt-controller/irq.h>
> +     /* example with intel,kmb-axi-dma */
> +     #define KEEM_BAY_PSS_AXI_DMA
> +     #define KEEM_BAY_PSS_APB_AXI_DMA
> +     axi_dma: dma@28000000 {
> +         compatible = "intel,kmb-axi-dma";
> +         reg = <0x28000000 0x1000 0x20250000 0x24>;
> +         reg-names = "axidma_ctrl_regs", "axidma_apb_regs";
> +         interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +         clock-names = "core-clk", "cfgr-clk";
> +         clocks = <&scmi_clk KEEM_BAY_PSS_AXI_DMA>, <&scmi_clk KEEM_BAY_PSS_APB_AXI_DMA>;
> +         #dma-cells = <1>;
> +         dma-channels = <8>;
> +         snps,dma-masters = <1>;
> +         snps,data-width = <4>;
> +         snps,priority = <0 0 0 0 0 0 0 0>;
> +         snps,block-size = <1024 1024 1024 1024 1024 1024 1024 1024>;
> +         snps,axi-max-burst-len = <16>;
> +     };
> -- 
> 2.18.0

-- 
~Vinod
