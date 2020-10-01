Return-Path: <SRS0=kZNx=DI=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C828C4727C
	for <dmaengine@archiver.kernel.org>; Thu,  1 Oct 2020 05:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EC0321D7D
	for <dmaengine@archiver.kernel.org>; Thu,  1 Oct 2020 05:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601531046;
	bh=XnKoU51iYFVHfmibWKJZ6czKxmaPT+0FE7RySPmxRTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2CwIpaf7Mweb/m6Fd67nHWk8umtsPIHbvDJhTHuhDAF7kF/KqZHXy3Giv0f6HyHr9
	 gXcg9F84Q04hk49Xdd1he+mDLU6hgRfUHMK0A9nSnbPZdlBkWkJ6d2kSFTBEFdonRZ
	 Qq5s54om6NVFUvCfXNpU8Z3FADrQup6TXMtXUH0c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgJAFoF (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 1 Oct 2020 01:44:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:36386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAFoF (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 1 Oct 2020 01:44:05 -0400
Received: from localhost (unknown [122.167.37.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F5BD2087D;
        Thu,  1 Oct 2020 05:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601531045;
        bh=XnKoU51iYFVHfmibWKJZ6czKxmaPT+0FE7RySPmxRTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=df6AHiH7CJE/M76/2Ix0e6ASrI7P73ZifXgbc72IqkzBV14IIWBoaQHOIBpX1NZDO
         3t2zQ/K9RcAvQaj5nEcRBE53uVGNfwhxLAEzV7qy1XY2umj5f2Sl9ejU/WZaDg/Gsn
         jweoS8HNGn/vmElk6So/PBpwXb25aFnQRNB7yw4E=
Date:   Thu, 1 Oct 2020 11:14:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH] dmaengine: pl330: fix argument for tasklet
Message-ID: <20201001054400.GP2968@vkoul-mobl>
References: <20200930121735.49699-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930121735.49699-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 30-09-20, 17:47, Vinod Koul wrote:
> Commit 59cd818763e8 ("dmaengine: fsl: convert tasklets to use new
> tasklet_setup() API") converted the pl330 driver to use new tasklet
> functions but missed that driver calls the tasklet function directly as
> well, so update it.

kbuild bot is happy, so merged this and pushed this branch to next

-- 
~Vinod
