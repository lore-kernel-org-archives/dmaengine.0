Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579E7C433DB
	for <dmaengine@archiver.kernel.org>; Tue, 22 Dec 2020 16:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0876023103
	for <dmaengine@archiver.kernel.org>; Tue, 22 Dec 2020 16:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgLVQ1z (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 22 Dec 2020 11:27:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:59926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbgLVQ1z (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 22 Dec 2020 11:27:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D5622AAE;
        Tue, 22 Dec 2020 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608654434;
        bh=TL0OpA64GzFmwToXJLX0r9Oq1tR4MpAMJvZ6vZ0Fdyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iDgzLpQBBXH9YTfFBKVQJYN6MYAp0jCmF55BRi4QMkWj9bvJlAMGoT5ymjLbEQtzw
         3tEM/W5nGCHA3+B+VwbF798B2VViU6tS/mjzIV7x4TgTTUMiDOkQq5MI3n7dW9zA5E
         FSw9Km5td0sUQBbjY85j2Q3PdKmI6mps5XRQCC2ChSGNeeoPAZ528rrHsxGFxTJSNt
         5g4vgoUpkM5Ac394XVjisDu4ydN3le5yZm44TWYT94ZnALtWvXTqjsMhTMGaD8dqa1
         Gk5eCeSwlpTHzab3W/rGF8KZK1Pw/MvIBODzv2zvbb43/pVQ+KG76KZIpU6ryF/bZW
         0vu2GqQzMYCJA==
Date:   Tue, 22 Dec 2020 21:57:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
Message-ID: <20201222162709.GA120946@vkoul-mobl>
References: <20201222040645.1323611-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222040645.1323611-1-robh@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 21-12-20, 21:06, Rob Herring wrote:
> 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> preferred for a single entry while greater than 1 should have an 'items'
> list.
> 
> A meta-schema check for this is pending once these existing cases are
> fixed.

> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 1 -
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml   | 1 -

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
