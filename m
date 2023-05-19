Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599E5C77B7A
	for <dmaengine@archiver.kernel.org>; Fri, 19 May 2023 10:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjESKrn (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 19 May 2023 06:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjESKrm (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 19 May 2023 06:47:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351BFE45;
        Fri, 19 May 2023 03:47:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83CCA6566C;
        Fri, 19 May 2023 10:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F2EC433D2;
        Fri, 19 May 2023 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684493261;
        bh=7i1v5yJ7dwEAa0/B0jt/5ohuvfPbXe32yoT2guKJvCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ftYjRnxwP4H1XmjTSAzFRiFnzn+tDFl9JLmA39QroMRJx+1wpZdY/gr1T80dsLSP5
         M4NpoJ7ELj3cj/uXkO8+6Bz+kMMr2MWU9g/lUmKflmzZxyyEOKl/YC44D/jTJ9EC/D
         gFa5yH5GBxKAw0UBus7p6MO/ZMNItfp1X6NvCpQ4Fd+OdA6qGoaOVIF2gAVOpxFAfZ
         4FY7tUv1o/XhD7iNaw31621LkBy6qXwNx5JvXztVOCpwh/QCFJ6vN/+Xu6JBgYuz57
         RWm5QGH4pFdj0NJQQ8uuE0mjOl6ArftTnnk2vsPgCRxJnuQFhn311ezlawWdO+U5Ch
         M6yG7fNXxQsMw==
Date:   Fri, 19 May 2023 16:17:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] dmaengine: ste_dma40: use proper format string for
 resource_size_t
Message-ID: <ZGdTyO2pCBvV850q@matsya>
References: <20230519093447.4097040-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519093447.4097040-1-arnd@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 19-05-23, 11:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A fixup for a printk format string warning causes an out-of-bounds
> variable access as the %pR string expects a struct resource instead of
> a plain resource_size_t.
> 
> Change both to the special %pap and %pap helpers for these types.

Applied, thanks

-- 
~Vinod
