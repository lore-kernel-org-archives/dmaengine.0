Return-Path: <SRS0=Gs2F=W7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB72C3A59E
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C0082339D
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567572340;
	bh=EUPmKKY9jGi4DJWODdHgS+ZfZMdxO9WYVpWbD1TUdjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=APD/YtVUstYo2Y+QyII1L6nG9meX2xAjFp3yQbzTwq/PRwndvdhYpCvQpqVMSQII4
	 m/qpF1lcHLHq7IohjkUJQD0FJGApEFBNdT8GUq9rTaKbc7TjSX6Y1/VhGGUnhSM/Tr
	 PWVoD/K3qY+h9ZGThOkatiSDNdo2b9j7E+w1mk2M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfIDEpk (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 4 Sep 2019 00:45:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725864AbfIDEpk (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 4 Sep 2019 00:45:40 -0400
Received: from localhost (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C48522CED;
        Wed,  4 Sep 2019 04:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567572339;
        bh=EUPmKKY9jGi4DJWODdHgS+ZfZMdxO9WYVpWbD1TUdjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nu70i+I7hzg8WNliK/2UekCjI7p4F/GJvfHPPxukXe5LCr1c073qmVst3qVYHDCEX
         QGvwLq8tVroXzszFXq2tS61wv0OdiJJaIcQNYNnMgPWckcMjsn887sDyEebvCaxDFd
         IcnqWiyyoF+ltwP3PK4GYkmxutZgUfFmZY60izLw=
Date:   Wed, 4 Sep 2019 10:14:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
Subject: Re: [RESEND] dmaengine: dmatest: Add support for completion polling
Message-ID: <20190904044431.GV2672@vkoul-mobl>
References: <20190731071438.24075-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731071438.24075-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 31-07-19, 10:14, Peter Ujfalusi wrote:
> With the polled parameter the DMA drivers can be tested if they can work
> correctly when no completion is requested (no DMA_PREP_INTERRUPT and no
> callback is provided).
> 
> If polled mode is selected then use dma_sync_wait() to execute the test
> iteration instead of relying on the completion callback.

Applied, thanks

-- 
~Vinod
