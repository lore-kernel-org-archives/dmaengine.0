Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1731EE49A6
	for <dmaengine@archiver.kernel.org>; Mon, 21 Aug 2023 13:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbjHUNwE (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 21 Aug 2023 09:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbjHUNwC (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 21 Aug 2023 09:52:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9884BF9
        for <dmaengine@vger.kernel.org>; Mon, 21 Aug 2023 06:51:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2DBE4637D1
        for <dmaengine@vger.kernel.org>; Mon, 21 Aug 2023 13:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AE4C433C9;
        Mon, 21 Aug 2023 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692625918;
        bh=Y/WdOWiUcbB29hs3tdrKowqRFbdhSY2JBx4rpjUEYQU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=DJL+OIzkkd6Y5bvAr48BDkLuhqxVDpO3oyicmt1mhj1MVHGNIbepfZOVpOPXCemun
         7iqJEYuIWu2LrInhzw/sr9rzRMQ8WPHr1x60jVtGT425IOmRWXsexTXJQcVqztAx2E
         HONLKmvI3RLKRL8SkeW+OUGz2w8rw+kV0m1f2r/UCLZSZ7tuURFH1fOMK12GEz8asz
         3t1cg6uggj6f/kLkOiU77uNo3c8Ycf5F4NWY6jXjXF1vwqrPlHI+UAlTGXg099AMAP
         qWoAQoMwlujsQh/cc+/Me8r4a6uhC6YIPgWsLKL3iEE7hCdM9VjK9WM6d9bRaQ/TrC
         05riHWGWBob+Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     pliem@maxlinear.com, Li Zetao <lizetao1@huawei.com>
Cc:     dmaengine@vger.kernel.org
In-Reply-To: <20230815080250.1089589-1-lizetao1@huawei.com>
References: <20230815080250.1089589-1-lizetao1@huawei.com>
Subject: Re: [PATCH -next] dmaengine: lgm: Use builtin_platform_driver
 macro to simplify the code
Message-Id: <169262591729.224153.18222867787416313734.b4-ty@kernel.org>
Date:   Mon, 21 Aug 2023 19:21:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


On Tue, 15 Aug 2023 16:02:50 +0800, Li Zetao wrote:
> Use the builtin_platform_driver macro to simplify the code, which is the
> same as declaring with device_initcall().
> 
> 

Applied, thanks!

[1/1] dmaengine: lgm: Use builtin_platform_driver macro to simplify the code
      commit: 8674ca395003272d8215e949838ef3b27d67afde

Best regards,
-- 
~Vinod


