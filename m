Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B576C433E6
	for <dmaengine@archiver.kernel.org>; Mon, 21 Dec 2020 16:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6601C22CAF
	for <dmaengine@archiver.kernel.org>; Mon, 21 Dec 2020 16:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgLUQYR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 21 Dec 2020 11:24:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:49672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbgLUQYR (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 21 Dec 2020 11:24:17 -0500
Date:   Mon, 21 Dec 2020 21:53:31 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608567816;
        bh=SdjGMg1jfOLQE6yDz3aUg8B6DOgcCQDxJ0jTB5YTOlQ=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=IPnWW5Qf/kIUNSYbAA9K7NL0et33f/C6oiHODVp2mZyoBgm6LVzYrYq1iIRb48nn0
         CS9QczTZqnUyivlVgBt3ZRTOZm1/NbkuYRbxFxO7nwgJeErPdOaH45EcPmWsKaX7vv
         AIic89tBn+rEPbKYg0lCwv/dDhkHvD9bEwZxa6UTIeGbdIuv3vWeFdeJb5zf4cW1o5
         +pnZwS0t7yKSZagekG7kQtZ+tEZO1Fw2p3Uq06zX/urjHYcFD5DIj9pyq5NVV8g9Rx
         oN60oTJxI4bXC5D9OYAtKHPvhgHx7webB/UojPmwhe7GkvwjtDZq+6WXx99kPRn1YA
         aFxB4cMkU11Iw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        dan.j.williams@intel.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] qcom: bam_dma: Delete useless kfree code
Message-ID: <20201221162331.GI3323@vkoul-mobl>
References: <20201216130649.13979-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216130649.13979-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-12-20, 21:06, Zheng Yongjun wrote:
> The parameter of kfree function is NULL, so kfree code is useless, delete it.
> Therefore, goto expression is no longer needed, so simplify it.

Applied, thanks

-- 
~Vinod
