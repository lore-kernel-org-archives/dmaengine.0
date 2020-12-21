Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A98CC433DB
	for <dmaengine@archiver.kernel.org>; Mon, 21 Dec 2020 14:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06A3A22B43
	for <dmaengine@archiver.kernel.org>; Mon, 21 Dec 2020 14:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgLUOaO (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 21 Dec 2020 09:30:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:54458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbgLUOaO (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 21 Dec 2020 09:30:14 -0500
Date:   Mon, 21 Dec 2020 19:59:29 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608560973;
        bh=Bh+HPbGzk4zFoKHZMp6c/AcuLdArCcV9nV0lsORyENI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=ULCkR4hY8UlQKXZWyc0gzb5SaIk7k5Ec6jwnEDtbWtnfFtNKtA/CsN7pqjWJSzyb6
         K7XZrmsXnIIfczV8iPPsxPxWE5qulwZnaK+3KyhD/0xHiBeWDBNX7Felqfj9sJaEez
         rWb7eswT6e48BaDoxKGotM3P15NbDX0K8gYHXvnr7UpwUQpCUDd2ydp0rRTqA0x+d9
         Jg9AHZcf/GvsGwsFjXjVug+pfyhOHa7mrSTh1YTvP4E9jNlZximbGBmJBx2Im0zhJ0
         joxNB3t/yNuDWELllj365PD69e7HSVdMip6ycJffBlQh5hAHlSkXw9He6YtPRCf/M9
         BJrJWAvNl/FlA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc:     dan.j.williams@intel.com, michal.simek@xilinx.com,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH 0/3] dmaengine: xilinx_dma: coverity fixes
Message-ID: <20201221142929.GF3323@vkoul-mobl>
References: <1608228615-7413-1-git-send-email-radhey.shyam.pandey@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608228615-7413-1-git-send-email-radhey.shyam.pandey@xilinx.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 17-12-20, 23:40, Radhey Shyam Pandey wrote:
> This patch series fix coverity warnings for xilinx_dma driver.
> No functional change. These patches are picked from xilinx 
> linux tree and posted for upstream.

Looks good, can you please add fixes tag and make it one line in last
patch (I think it would fit now)

-- 
~Vinod
