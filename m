Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0B4C433DB
	for <dmaengine@archiver.kernel.org>; Wed,  6 Jan 2021 06:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D920207B5
	for <dmaengine@archiver.kernel.org>; Wed,  6 Jan 2021 06:27:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAFG1G (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 6 Jan 2021 01:27:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:48772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbhAFG1G (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 6 Jan 2021 01:27:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F172C207B2;
        Wed,  6 Jan 2021 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609914385;
        bh=Rl1DPGc6dg7UtTQq81mf5Us0imnQVsR1ec0WshwiXCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G0K4caMy6BnHP2xJk/C4lSVGJvSkrTK0qbuu2HrFjz1E8u1+a3d9cQBkNuMs8unG8
         dU/2lNZSQHQgxlFAcnpzw6w6XKsHpO4UJt/f/pcAsNKPPvRpF3uquaELeEJKMHKMyF
         YRl8jmFpPKJbfTYPV8p717TJ0I5yVOdLlm+B71AiFDK333N+1HyXrsg0i96Bbb3FXV
         VXu/+rbd3UofF5/kiI/oEzhKxIn/Wkm8Y7x1bW2afaJWiDxgZvL4LPYbZ8FckaaU8g
         vAFgOPMv7LXrkuGMIxRRrsyeegV1iEK9svOhnIBfxbcoE8VpK0qgPGNcOtYoWG6T0N
         8NiNQYL5SbTQA==
Date:   Wed, 6 Jan 2021 11:56:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        dave.jiang@intel.com, dan.j.williams@intel.com
Subject: Re: [PATCH v2 -next] dma: idxd: use DEFINE_MUTEX() for mutex lock
Message-ID: <20210106062621.GS2771@vkoul-mobl>
References: <20201224132254.30961-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224132254.30961-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-12-20, 21:22, Zheng Yongjun wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().

Applied, thanks

-- 
~Vinod
