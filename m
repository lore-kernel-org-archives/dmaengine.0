Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A857C4741F
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC18F206ED
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604922089;
	bh=HGqNgTmS0U40pm39xZrWRkCSImvX6c6OezTYr8uPL8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rhw7c4LXk2DwYV3Fdog5y5FUMYHQrRq8DNmcSuvjDO9LVe2O2M3nUR072zTSEDFw3
	 BQiwsYJZghDPmfX9Q/QxX3c0sQECJdYvH8XcfPM00V7u9vPM315dCA/jAZqplpvAfm
	 ITY2WTfWHEsJ+MEt35h9WbDJH+EvjQEn7Whm8xPk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgKILl1 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:41:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:33872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729320AbgKILl0 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 06:41:26 -0500
Received: from localhost (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 051A820684;
        Mon,  9 Nov 2020 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604922086;
        bh=HGqNgTmS0U40pm39xZrWRkCSImvX6c6OezTYr8uPL8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ot9e5LHp1yebv2QTG3Zmke/D6BMZhYJckqyI/gNVz1LnVOW6MaxZJZ7pLfw28GPUJ
         0R5JQSc1VvhqC6wz5lc0QyY6U6bRqf5IdunqLlrOv1+zzq1OZi3srDix7x7hJ/cRRR
         eJ5MJtIzAyifbrxJdC7dGHn9UkxbRDfB892RDipI=
Date:   Mon, 9 Nov 2020 17:11:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Pedersen <twp@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH v4] dmaengine: qcom: Add ADM driver
Message-ID: <20201109114121.GG3171@vkoul-mobl>
References: <20200916064326.GA13963@earth.li>
 <20200919185739.GS3411@earth.li>
 <20200920181204.GT3411@earth.li>
 <20200923194056.GY3411@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923194056.GY3411@earth.li>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

HI Jonathan,

On 23-09-20, 20:40, Jonathan McDowell wrote:
> Add the DMA engine driver for the QCOM Application Data Mover (ADM) DMA
> controller found in the MSM8x60 and IPQ/APQ8064 platforms.

Mostly it looks good, some nitpicks

> The ADM supports both memory to memory transactions and memory
> to/from peripheral device transactions.  The controller also provides
> flow control capabilities for transactions to/from peripheral devices.
> 
> The initial release of this driver supports slave transfers to/from
> peripherals and also incorporates CRCI (client rate control interface)
> flow control.

Can you also convert the binding from txt to yaml?

> diff --git a/drivers/dma/qcom/Kconfig b/drivers/dma/qcom/Kconfig
> index 3bcb689162c6..0389d60d2604 100644
> --- a/drivers/dma/qcom/Kconfig
> +++ b/drivers/dma/qcom/Kconfig
> @@ -1,4 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config QCOM_ADM
> +	tristate "Qualcomm ADM support"
> +	depends on (ARCH_QCOM || COMPILE_TEST) && !PHYS_ADDR_T_64BIT

why !PHYS_ADDR_T_64BIT ..?

> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	help
> +	  Enable support for the Qualcomm Application Data Mover (ADM) DMA
> +	  controller, as present on MSM8x60, APQ8064, and IPQ8064 devices.
> +	  This controller provides DMA capabilities for both general purpose
> +	  and on-chip peripheral devices.

> +static const struct of_device_id adm_of_match[] = {
> +	{ .compatible = "qcom,adm", },

I know we have merged the binding, but should we not have a soc specific
compatible?

-- 
~Vinod
