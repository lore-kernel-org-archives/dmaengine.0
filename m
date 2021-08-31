Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D539C432BE
	for <dmaengine@archiver.kernel.org>; Tue, 31 Aug 2021 16:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DAE0610CD
	for <dmaengine@archiver.kernel.org>; Tue, 31 Aug 2021 16:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239928AbhHaQUk (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 31 Aug 2021 12:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:47958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239927AbhHaQUj (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 31 Aug 2021 12:20:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 741AF610C8;
        Tue, 31 Aug 2021 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630426784;
        bh=6YxVw0YYb8l0J34OB6YwDw1VaBdyP+CxuIDS/mwxsuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MtTKON4w8U0T7ddoL+qbL8BU2liLGx61L0W6PEslxfzmW6QKQibcrPD1OAtQgKMWz
         /JDODxJ3XR6zq+0AqPjmv9H+QvbYtgiq6sW3Rm78Lw/sOk6o7yNwft7QNbkSt003+r
         lfVRzfJ0srtL7OqJMSUgM811mkCHRRqOzMKdDniLq9fMm7n8+BekMa5HP4LKIbKHln
         n76YfQJBfthoXuqhXGRXB8Q8aaXv9EjEaBh1Ndf8XFloh3aa6NRk7HZQiXDIVTckHB
         /zN00ajHAvTymTUnOGx9C8j2O8JFxE6YLpeapxUrnkG6Nr0Nf8q8BRa3iGvQUDZH3t
         HZcjPt++fOuww==
Date:   Tue, 31 Aug 2021 21:49:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] dmaengine: sh: Fix unused initialization of
 pointer lmdesc
Message-ID: <YS5WnIqde1b2P5HB@matsya>
References: <20210829152811.529766-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829152811.529766-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 29-08-21, 16:28, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer lmdesc is being inintialized with a value that is never read,
> it is later being re-assigned a new value. Fix this by initializing
> it with the latter value.

Applied, thanks

-- 
~Vinod
