Return-Path: <SRS0=Gs2F=W7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE9DC3A59E
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3711122CF7
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567571862;
	bh=Y3SgjdI4eTUWwvUoaem0J4TTnC5iUZrRH8WOPdvvpp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FJUqA0LfIPKvj26xBGyoQKh0e72XVFly0YP+SymLey+gljEyL17MKhXQ/reJCRoVa
	 MpAs4wof3IVRDb6KNlUM04eA2xyyXOzoeYw2i8vgNSasQbm1P75D3HhgrlcJoG9BEN
	 gaUzZvmQxpLz11KqUawiKtLfycSnXBdR5rN5Nw0c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfIDEhl (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 4 Sep 2019 00:37:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:50002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfIDEhl (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 4 Sep 2019 00:37:41 -0400
Received: from localhost (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8313722CED;
        Wed,  4 Sep 2019 04:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567571861;
        bh=Y3SgjdI4eTUWwvUoaem0J4TTnC5iUZrRH8WOPdvvpp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xFePtaN1wIDo7sT4SSHslCc3QyfQEQHite+Op3AxxXVaQ9cOP4qqukb6X/Fl9BJ8k
         pIAkYF3DY7/cxjbwipby6+PBht2SRSlcsZmrnYwF6vGtYjeiACg7l9DOMvDYU0J3Nz
         8Po2Dxu7SeCnYR1mKQfh60NzL8YgFWpRuZCewYzQ=
Date:   Wed, 4 Sep 2019 10:06:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ti: edma: Remove 'Assignment in if condition'
Message-ID: <20190904043631.GS2672@vkoul-mobl>
References: <20190730132006.2790-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730132006.2790-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 30-07-19, 16:20, Peter Ujfalusi wrote:
> While the compiler does not have problem with how it is implemented,
> checkpatch does give en ERROR for this arrangement.

Applied, thanks

-- 
~Vinod
