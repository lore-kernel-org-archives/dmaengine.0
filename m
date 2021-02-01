Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F40C433DB
	for <dmaengine@archiver.kernel.org>; Mon,  1 Feb 2021 09:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D8064EAE
	for <dmaengine@archiver.kernel.org>; Mon,  1 Feb 2021 09:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbhBAJ5p (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 1 Feb 2021 04:57:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232443AbhBAJ5p (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 1 Feb 2021 04:57:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E3A664EA6;
        Mon,  1 Feb 2021 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612173424;
        bh=n5n2UarFiBpvQlcyjJySlTA8gnvO61B8Vaa3iMUUy6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BKRQ6mf+tRMJ8gKkS55F0/txglji67yxPEzoPrjj7GsRf8RiVmkBIZWUoOvHcGvpZ
         Kla1gzLm9ZKy6JLFrwpA28m78g5E1NNS8aqNgedbs9ejt9LlTC1hiNKxoiMTrF0hXq
         jOegsvIgtpV61eXgqSggph6y7uxw4SjpVcDbxWSfKv5PuDUsmx0SvrX9uLi1AOlIFH
         j9Wvakv3mKrUV7xmOpPNAKEhzgjqvw5K4wGueltPcLacTUznotlP1qK8pbmYKMRqFf
         D6r7oir28SzL86W1bX4Xvq1g3JxC5wh33nrqac6svhHX7/rVFIdlV9z64XaF9aGxxa
         Y+wPz66Hw8GJQ==
Date:   Mon, 1 Feb 2021 15:26:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     michal.simek@xilinx.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH] dmaengine: xilinx_dma: Alloc tx descriptors GFP_NOWAIT
Message-ID: <20210201095659.GP2771@vkoul-mobl>
References: <20210129170800.31857-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129170800.31857-1-rf@opensource.cirrus.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 29-01-21, 17:08, Richard Fitzgerald wrote:
> Use GFP_NOWAIT allocation in xilinx_dma_alloc_tx_descriptor().
> 
> This is necessary for compatibility with ALSA, which calls
> dmaengine_prep_dma_cyclic() from an atomic context.

Applied, thanks

-- 
~Vinod
