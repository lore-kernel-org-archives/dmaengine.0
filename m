Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E74C433F5
	for <dmaengine@archiver.kernel.org>; Fri, 10 Sep 2021 17:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2DAD611CC
	for <dmaengine@archiver.kernel.org>; Fri, 10 Sep 2021 17:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhIJREX (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 10 Sep 2021 13:04:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230227AbhIJREX (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 10 Sep 2021 13:04:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08DB0611BF;
        Fri, 10 Sep 2021 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631293392;
        bh=C3nE/9XwGekN1rYasw/kMo/NCYXIfDSTtfzsiNnzZyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=onJACllqxwbm30uJt3vI1V6CpCd39GR8QCshCfqXS12faovGIwdFUqZqJ6OP4gy5J
         y39Dy8d4EesKwKxTUvXnysZlpMhXcOn3d2H0vE4nk9XgUXpfnywUNi4EgKXGsn+VIp
         RYSEjnzr/SIcWYy8BOCPZMMVfnGA4ZylwM6xdWd89JVhvYxjk16HCmxdV2VyTZw268
         DKzIKfKiwVTSScPrpx1/UUClnEmkj2KkAIzpN4U7foPB4azphPSR2IGPz+1DdRS3CZ
         irVa0uQ+Y8YEn6xfIXTIfPdqI4xIOUwJ0jILIjzYrzxPlpyHLR0/Dniqfg7dT3bChv
         O/GSNOHq/NE5g==
Date:   Fri, 10 Sep 2021 22:33:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dma <dmaengine@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL]: dmaengine updates for v5.15-rc1
Message-ID: <YTuPy/I5aYNH1/I7@matsya>
References: <YTg+csY9wy4mk035@matsya>
 <CAHk-=wiVLppF6shSBiKK7-B7FRZ3UP_sMVKcLvtRs8AQM+k2vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiVLppF6shSBiKK7-B7FRZ3UP_sMVKcLvtRs8AQM+k2vg@mail.gmail.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Linus,

On 09-09-21, 11:11, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 9:39 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Also contains, bus_remove_return_void-5.15 to resolve dependencies
> 
> That one actually has a commit message with explanations about that
> branch from Greg.
> 
> There are other merges that _don't_ have any reason for them. Like
> randomly merging 5.14-rc5 with no explanation.
> 
> Or the three random "merge fixes".
> 
> Please people. For the Nth time. Merges need commit messages that tell
> people _why_ you merge, and what the code is that you merge. Not just
> "merge tree X"

Agree, the reason to merge was to resolve conflicts b/w fixes and next.
I agree we should document these merges better, will make sure that is
taken care of in future!

-- 
~Vinod
