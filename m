Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E71CC433DB
	for <dmaengine@archiver.kernel.org>; Sun, 17 Jan 2021 06:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F7BB225AC
	for <dmaengine@archiver.kernel.org>; Sun, 17 Jan 2021 06:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbhAQGwi (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 17 Jan 2021 01:52:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:37688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbhAQGwb (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 17 Jan 2021 01:52:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ED3422795;
        Sun, 17 Jan 2021 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610866310;
        bh=mcI/n+3OEFnPMmwWzQS5bOhUzaTZik0BdBJRDaXdIVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rv4g/hOXJUdmXY3m2LpidvUWxv9QlK7nXR4+J9P11SiTBVjy/nsWKAZ5eLQFm4kID
         sbW97aikDOSeSEW5jUVLz64Jbio1SKius6ECscN4hWf7FwioXSTelmog49V34T+/mi
         3ZxB3idb+pkS8QAnIwUVOJ//XgelXqAtxjcxjoXseejsMbZnGNm1SGkznTgOwkLn3p
         RRAgBPVdDi6HGkTZLD/04gp6fQrN4Pf37VtuSQZWdT564Mcu02aN0PtNOmi9tQ9R5w
         Weqym36IcdHqLGWER1KWbWtWdhTqwisWdBxVYsJrcDIosfvOi9ePXd5xAleE0zL2jk
         RL6Q+12MFrG8g==
Date:   Sun, 17 Jan 2021 12:21:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Sanjay Kumar <sanjay.k.kumar@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix list corruption in description
 completion
Message-ID: <20210117065145.GN2771@vkoul-mobl>
References: <161074757267.2183951.17912830858060607266.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161074757267.2183951.17912830858060607266.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 15-01-21, 14:52, Dave Jiang wrote:
> Sanjay reported the following kernel splat after running dmatest for stress
> testing. The current code is giving up the spinlock in the middle of
> a completion list walk, and that opens up opportunity for list corruption
> if another thread touches the list at the same time. In order to make sure
> the list is always protected, the hardware completed descriptors will be
> put on a local list to be completed with callbacks from the outside of
> the list lock.

Applied, thanks

-- 
~Vinod
