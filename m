Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5EFE732C7
	for <dmaengine@archiver.kernel.org>; Thu, 28 Sep 2023 11:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbjI1L4h (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 28 Sep 2023 07:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbjI1L4e (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 28 Sep 2023 07:56:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF311A5;
        Thu, 28 Sep 2023 04:56:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41957C433C7;
        Thu, 28 Sep 2023 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695902188;
        bh=wAziT84zsBar0DnfXJLmnl6XnoBPC7xoMptDDmCkGSg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=sQNstdL/NaO5ZYXnEyKoGAQteUo9B3pfTj376QsYbb3M3g09CilZsuzlSclEqJECW
         PYC2ZOrG6pq/RLy2NlMW+WXSypx6UlqEkOs+OBiPfD7yyrsA+cl+5nNZ5GoQDrTVG+
         mu0Jj3k/fmDvxESqGhtxRtzaTUoQrsjXPxnqs0G94SoLVUkizMXh2CAQxvraPfEetR
         UUIWgoV3LA6aPJ4ovsNX9rL5qyPzjgk836cph4mupzIpZ+vCSjdKcz5ElBhu034w7s
         Q5UFoQkkOIJXH23zHy+3tz6X1bqM3nCJExsXiWiAICT6fhDi71R88W0MKAJrnRyp2x
         65EQ+Eup5n/Vg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Tony Lindgren <tony@atomide.com>, dmaengine@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <f15cb6a7-8449-4f79-98b6-34072f04edbc@moroto.mountain>
References: <f15cb6a7-8449-4f79-98b6-34072f04edbc@moroto.mountain>
Subject: Re: [PATCH] dmaengine: ti: edma: handle irq_of_parse_and_map()
 errors
Message-Id: <169590218590.152265.2604230779311762501.b4-ty@kernel.org>
Date:   Thu, 28 Sep 2023 17:26:25 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


On Fri, 15 Sep 2023 15:59:59 +0300, Dan Carpenter wrote:
> Zero is not a valid IRQ for in-kernel code and the irq_of_parse_and_map()
> function returns zero on error.  So this check for valid IRQs should only
> accept values > 0.
> 
> 

Applied, thanks!

[1/1] dmaengine: ti: edma: handle irq_of_parse_and_map() errors
      commit: 4500d86a2e5115724d58c27cfb3ef590bee0dd58

Best regards,
-- 
~Vinod


