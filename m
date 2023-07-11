Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052E7C0015E
	for <dmaengine@archiver.kernel.org>; Tue, 11 Jul 2023 16:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjGKQpS (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbjGKQo7 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 11 Jul 2023 12:44:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30930173D
        for <dmaengine@vger.kernel.org>; Tue, 11 Jul 2023 09:44:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D71861574
        for <dmaengine@vger.kernel.org>; Tue, 11 Jul 2023 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92225C43395;
        Tue, 11 Jul 2023 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689093857;
        bh=8TrRKkLOcEYBzaySTDjhq6PAvGWgPMebx1giqJROGO4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=VYPai/d06RnQS3sX+5DhN2F2fZ8S4wOBWasy3sea2b5qqzsLWYYK+wWtD+HbIjNLg
         tE64L1dyiHeG48QkF0FUd2Er5PH2G04ev+RkssZ0KxPL0OufaJXl/tvZ1QyCS7Fhn9
         p8+Y4IMiQVgHqrQOjna3j8fmecb9ROAKIONM8K33M2Ugi9QQkAI0AuzqZfa2hvh8a3
         Jq/4f3Jl41l3EUfdQrwyesKZb//P1xYhCmqUDGE9tDUrEtJvuIF4UeOEfopmQB/4fB
         ROA8/SsHZZSqeiQ6cSkbFxbp3IRxJQELhNUVt6MuKqo+2tEkYcGi6tOWJet65PZOz/
         VBL71T7ZPRSxA==
From:   Vinod Koul <vkoul@kernel.org>
To:     fenghua.yu@intel.com, dave.jiang@intel.com,
        dmaengine@vger.kernel.org, rex.zhang@intel.com
Cc:     ramesh.thomas@intel.com, tony.zhu@intel.com
In-Reply-To: <20230614062823.1743180-1-rex.zhang@intel.com>
References: <20230614062823.1743180-1-rex.zhang@intel.com>
Subject: Re: [PATCH 2/2] dmaengine: idxd: Modify ABI documentation for
 attribute pasid_enabled
Message-Id: <168909385518.208679.16596889582994018766.b4-ty@kernel.org>
Date:   Tue, 11 Jul 2023 22:14:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


On Wed, 14 Jun 2023 14:28:23 +0800, rex.zhang@intel.com wrote:
> Modify the sysfs attribute description in ABI/stable documentation for
> the attribute /sys/bus/dsa/devices/dsa0/pasid_enabled.
> 
> 

Applied, thanks!

[2/2] dmaengine: idxd: Modify ABI documentation for attribute pasid_enabled
      commit: f7b6372e4f04f1a7c7a90fcb30b27040e57e97da

Best regards,
-- 
~Vinod


