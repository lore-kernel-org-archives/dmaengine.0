Return-Path: <SRS0=oHFp=A2=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5A2C433E2
	for <dmaengine@archiver.kernel.org>; Wed, 15 Jul 2020 05:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE351206E9
	for <dmaengine@archiver.kernel.org>; Wed, 15 Jul 2020 05:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594792536;
	bh=nvGTsPzBDL/2LFcF2SnsYKiCK59Dx5m/R/SiFd5N+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wpmS3Tcv3b6lw7D2uutSg7OhxUBTjaUA2x8CQZdLbFaa4F3arVStBkaUyzQwOIRD9
	 yKbQe3ucp/Hm6CA9uS4BJvlSTVb+kYmglYv7Onph9alzIuKDq7g90tK0dKHnEUg2J0
	 Qvy6VfUFMKQJtVJCOGo0lFnBIZ7i5PUfFdjRQAQs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgGOFzf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 15 Jul 2020 01:55:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:53706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgGOFzf (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 15 Jul 2020 01:55:35 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D95620663;
        Wed, 15 Jul 2020 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594792535;
        bh=nvGTsPzBDL/2LFcF2SnsYKiCK59Dx5m/R/SiFd5N+BU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYVl3MLud38NQquULtVJs8uVqlfrRupz53UmhCq1v+dirY80IKIohW6MVZeYxhA55
         PoTJjMVOylD2KBTlRjSElf15jEaDDpwj54eJ/XQ0YEYs28htHOCac8LPeaDZ2bkrHq
         RnlqNagLQjxDDcVJbCtaIGWweC3CLzKlhyXDvdss=
Date:   Wed, 15 Jul 2020 11:25:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sugar Zhang <sugar.zhang@rock-chips.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/14] dmaengine: pl330: Improve transfer efficiency
 for the dregs
Message-ID: <20200715055531.GT34333@vkoul-mobl>
References: <1593439555-68130-1-git-send-email-sugar.zhang@rock-chips.com>
 <1593439555-68130-3-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593439555-68130-3-git-send-email-sugar.zhang@rock-chips.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 29-06-20, 22:05, Sugar Zhang wrote:
> Only the unaligned burst transfers have the dregs.
> so, still use BURST transfer with a reduced size
> for better performance.

Applied, thanks

-- 
~Vinod
