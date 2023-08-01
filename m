Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CBBC04A6A
	for <dmaengine@archiver.kernel.org>; Tue,  1 Aug 2023 18:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbjHASoy (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 1 Aug 2023 14:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbjHASov (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 1 Aug 2023 14:44:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B172683;
        Tue,  1 Aug 2023 11:44:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CA4C61691;
        Tue,  1 Aug 2023 18:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1E8C433C9;
        Tue,  1 Aug 2023 18:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690915489;
        bh=eOKT8d8fvSNrmOp3l/vWmIN4pVtwSVEs/dKcmyAocgU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=MywX7MO9iMOfE0EwZChLxOBPOOYpT1DJUXdRi9JOEN6/B9Rto/noJZ7KYXxawmNWm
         fB/ylmY4B55bZV8QMBc/LX1BAjiPWDCOZoXaleiichmVehKYeMqw60y8BGyEHQooOu
         VNG5sZVVZJA/PgfRWxeM7d5bgUAeuKEK+LLPvh76uG8C6NRDWz+dZ/L+L2KNu+Kw88
         NCyNu7CQ+cO/fVf+HvENO7YBOtXZ4YkxakF5aKaSd0IewpJ8eJDCzdKLIAqnAEefZb
         NwzP6xt2C3cflRH+9yaH2sEfTQzBa/XLnH3MzHiqDWClyzRNXw95IyHj32kfn6f+ae
         gNSEgObZb6Vnw==
From:   Vinod Koul <vkoul@kernel.org>
To:     afaerber@suse.de, mani@kernel.org,
        Zhang Jianhua <chris.zjh@huawei.com>
Cc:     dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230722153244.2086949-1-chris.zjh@huawei.com>
References: <20230722153244.2086949-1-chris.zjh@huawei.com>
Subject: Re: [PATCH -next] dmaengine: owl-dma: Modify mismatched function
 name
Message-Id: <169091548725.69326.17741814180569996226.b4-ty@kernel.org>
Date:   Wed, 02 Aug 2023 00:14:47 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


On Sat, 22 Jul 2023 15:32:44 +0000, Zhang Jianhua wrote:
> No functional modification involved.
> 
> drivers/dma/owl-dma.c:208: warning: expecting prototype for struct owl_dma_pchan. Prototype was for struct owl_dma_vchan instead HDRTEST usr/include/sound/asequencer.h
> 
> 

Applied, thanks!

[1/1] dmaengine: owl-dma: Modify mismatched function name
      commit: b4b349f73efae39b6646d82cc1ee081b85645f7b

Best regards,
-- 
~Vinod


