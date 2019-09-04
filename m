Return-Path: <SRS0=Gs2F=W7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C111C3A59E
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D657822CF7
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567572116;
	bh=Y3SgjdI4eTUWwvUoaem0J4TTnC5iUZrRH8WOPdvvpp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pGUZZ+KALxgzrtEiRBN3KbmO8BU1TAf2tJUPyMjJ7CKxcQmPWloIqee/WgzNa+0Ks
	 uA8Fw9VGBxzaIhR6cWIptPVf+7/CIj2lrg0I1yTKUYUmafLdq6He9WiGM24+gC1yXv
	 s4X5lo16sshKWaxn+1ZefwJBKFEo42/1F8P/VlKo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfIDEl4 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 4 Sep 2019 00:41:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:50558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfIDEl4 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 4 Sep 2019 00:41:56 -0400
Received: from localhost (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A30022CED;
        Wed,  4 Sep 2019 04:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567572115;
        bh=Y3SgjdI4eTUWwvUoaem0J4TTnC5iUZrRH8WOPdvvpp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qprynB9AGH9qA25g6oG7NVhLbnrtnuUd3wQ1EMSI6lTWdifZYUGC9P3+PjwcyAzSu
         z8wlY3zIdNXnYsOFfey3c4ZnxLVsFqh80Rv1zs2BfYzUIk6YuXc3OwwSehoNCBA1DW
         zvPPY7JU5f6UyvCB0erYVoO1bbRwBb3khRt6rrjM=
Date:   Wed, 4 Sep 2019 10:10:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ti: omap-dma: Remove 'Assignment in if
 condition'
Message-ID: <20190904044047.GT2672@vkoul-mobl>
References: <20190730132015.2863-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730132015.2863-1-peter.ujfalusi@ti.com>
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
