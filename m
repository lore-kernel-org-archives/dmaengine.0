Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EF3C6FA82
	for <dmaengine@archiver.kernel.org>; Sun,  4 Sep 2022 17:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbiIDRUJ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 4 Sep 2022 13:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbiIDRUH (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 4 Sep 2022 13:20:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69A61F603;
        Sun,  4 Sep 2022 10:20:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8D41AB80DDC;
        Sun,  4 Sep 2022 17:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F41C433C1;
        Sun,  4 Sep 2022 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662312004;
        bh=zpBK7WCWgOhkt+HOxHGAjVqFFKRH5ptoBTIBEanM4Yc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bdUwxT2Rki/mRywLrdJ+TgjBcxwOLvngkZApMLflSY+KJK5o+9yIfZx7Trb1f5u2K
         srwjEbrMu++cpyWx8IiiNcgxT+KzA2Nz8PLNt7P3mDNhCJmPTyyDJdfOx+JtWPRsk2
         QmXh28dJA1jqjtJY0jvIWf0k8CNqHQbv8UMDz00Xnpmk4rYuwIsNmmzhN/2nswqaDa
         nLdpMNUjui4we7RjCw3Bm64zMtEAPSyPzre+S4RxWJqI8v5AfzlIberHZTv2HsZXA4
         7YHAucx/BxFoEfLqZ2C4oCMNBZ4gGdMToEUC5/Eh2UuROneBgx8lgMXMCkDZzorzUo
         jXeJgtYHGxO3A==
Date:   Sun, 4 Sep 2022 22:49:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dmaengine: hsu: Finish conversion to managed
 resources
Message-ID: <YxTePSmaCnEkLMGA@matsya>
References: <20220713172235.22611-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713172235.22611-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 13-07-22, 20:22, Andy Shevchenko wrote:
> With help of devm_add_action_or_reset() we may finish conversion
> the driver to use managed resources.

Applied all, thanks

-- 
~Vinod
