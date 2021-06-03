Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF04C47096
	for <dmaengine@archiver.kernel.org>; Thu,  3 Jun 2021 06:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8452613D8
	for <dmaengine@archiver.kernel.org>; Thu,  3 Jun 2021 06:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhFCHAz (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 3 Jun 2021 03:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:49014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229665AbhFCHAz (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 3 Jun 2021 03:00:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 390EB613DC;
        Thu,  3 Jun 2021 06:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622703551;
        bh=jgrGqdnGPl0lwpmF25TNhq9uPU4zSNlD7KMcq6t6+64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KpKUW+ywUIK57T5P7f5EqeOA4x9bGC1zroG5/AL+hkXJqKH4eKzKM4d6Ojw/HjyZW
         ZMSJSq8Vrs7I7+T2Zzq6JCC0vhHu7bMIWdqR9gMyF7GbRsUuJCAQax800CH0nRep48
         YUB8zitsdijF9U5mTjOSuCJC5pen9gL57s+BX7srYZ8AXgwPl1/qe3LK/dFoDat5W6
         dm+hj6G+SnnjtJVuZ3ZJ/Dz4XBz29IYvQwSKxf47AEZ9YaX8Q+vsz+CuDXnGcH3AqK
         BYbTpvynDSOZAS+EuDnxHNvPG3siDZvGRcWieJFxgvil2vsALg12/alz0+R+/Ca6LX
         cN6B31noO2Bhw==
Date:   Thu, 3 Jun 2021 12:29:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     dave.jiang@intel.com, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix missing error code in
 idxd_cdev_open()
Message-ID: <YLh9u2eLCDuOzQTU@vkoul-mobl>
References: <1622628446-87909-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622628446-87909-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 02-06-21, 18:07, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'rc'.
> 
> Eliminate the follow smatch warning:
> 
> drivers/dma/idxd/cdev.c:113 idxd_cdev_open() warn: missing error code
> 'rc'.

Applied, thanks

-- 
~Vinod
