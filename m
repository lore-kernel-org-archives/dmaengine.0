Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36374C4708F
	for <dmaengine@archiver.kernel.org>; Mon, 31 May 2021 04:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03A7B611EE
	for <dmaengine@archiver.kernel.org>; Mon, 31 May 2021 04:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhEaEFX (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 31 May 2021 00:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229952AbhEaEFW (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 31 May 2021 00:05:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD10F611AC;
        Mon, 31 May 2021 04:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622433823;
        bh=0xfMtsHewwb7fTSKcKv14cPltEk1ithOlhx+6gwiMWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YH4XE324kuwVcxWwphHA9vmTHk3uOkBaY0gEBmL90Rkd2umcwWyJEcz4vBFw89xuo
         gaAw4gElZ2x9ARafnLx6MgO4gRUCZNy07c27Asx2k5ngrVqa6MjU5MS6FLxMgscq+N
         86AyApEbCSXfmohHU2EExJ6P1RF5K39ZI7/GU6/Med5DJTFNwfms4UXieXq0Xqj7j5
         7s8/lKiMcbYB6hBjxmvszUKm/S6x9vAhXieRTR6kfguTcRPgnwrHDCdtPKQDhetYN9
         opAE80XSsBpPVHuoWo2X8iH+Fk5wTHhhCl4c3Xc5yaVo+/g3fDeF5+e4LF86piqwi/
         XoySnNHa+7ltQ==
Date:   Mon, 31 May 2021 09:33:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        michal.simek@xilinx.com, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, yi.zhang@huawei.com
Subject: Re: [PATCH 1/3] dmaengine: stm32-mdma: fix PM reference leak in
 stm32_mdma_alloc_chan_resourc()
Message-ID: <YLRgG+mK1exroXrh@vkoul-mobl.Dlink>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-2-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517081826.1564698-2-yukuai3@huawei.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 17-05-21, 16:18, Yu Kuai wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.

Applied, thanks

-- 
~Vinod
