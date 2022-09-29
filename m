Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04B5C433F5
	for <dmaengine@archiver.kernel.org>; Thu, 29 Sep 2022 17:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiI2RHL (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234858AbiI2RHJ (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 29 Sep 2022 13:07:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACB21CE91B
        for <dmaengine@vger.kernel.org>; Thu, 29 Sep 2022 10:07:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19B696207F
        for <dmaengine@vger.kernel.org>; Thu, 29 Sep 2022 17:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E51C433D6;
        Thu, 29 Sep 2022 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664471227;
        bh=B+FgVsDxHWcPdAzTaBlEasyRYTaJvPP1Lv638yL6bds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MO9mNclaRgk2bHMYJTywbYywWbOqv8XkcBD+NhSkHbMgzyHQaZoWy9e29/y1EVOPV
         IVBCiAy7R1N+pZBJ+222hL0oK7kbTuoQCiuLJB2Ssqvc0ST32S65k6zQSZXJxphoxS
         YHUkyinQwM4l6OWv8sHZo4hajjrD+ZaVy/xHruUQbAZQzkffvNZrqwe0eYJpUDWVZk
         rH5Wl3GPWXX8vvRBCPintsa66fc/GUaPHSROb5CTbQVwR2XejkjE3OrPpVV4IyCJvH
         jsjDB2//9DF+BbGNiS+mFoRDHfCU/jzZsrOM9VVV8/y8DQF4nTl5iVIyBCP+ZsS1m4
         kfvnbHLIcDCWQ==
Date:   Thu, 29 Sep 2022 22:37:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     dave.jiang@intel.com, vinod.koul@intel.com,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ioat: remove unused declarations in dma.h
Message-ID: <YzXQtkHi72WEvcSw@matsya>
References: <20220911091817.3214271-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911091817.3214271-1-cuigaosheng1@huawei.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 11-09-22, 17:18, Gaosheng Cui wrote:
> ioat_ring_alloc_order and ioat_ring_max_alloc_order have
> been removed since commit cd60cd96137f ("dmaengine: IOATDMA:
> Removing descriptor ring reshape"), so remove them.

Applied, thanks

-- 
~Vinod
