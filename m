Return-Path: <SRS0=E1jm=DW=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD78C433DF
	for <dmaengine@archiver.kernel.org>; Thu, 15 Oct 2020 22:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EDE02080A
	for <dmaengine@archiver.kernel.org>; Thu, 15 Oct 2020 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602800390;
	bh=+TJ95xdJlftxV4Z94OHlZV3ItVqrDm7HSYyQmzSml4M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=zO9UoJnT/RKL20p5gAJRlY32TjkfDtc30wjHb6gI7ndiDMCwyr8JmDKlrUS7hZt9a
	 HjgvUgjBEJPO3x6HCpzcThIBDloScsue7P48shOLOQgv1SUt5jnFJWVx8zCHn/ZZEg
	 yuAATLXZQgiqhmRLmCMNKAYPmrTCP2yAHjcpzlgk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731842AbgJOWTl (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 15 Oct 2020 18:19:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731740AbgJOWT3 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 15 Oct 2020 18:19:29 -0400
Subject: Re: [GIT PULL] dmaengine updates for v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602800368;
        bh=+TJ95xdJlftxV4Z94OHlZV3ItVqrDm7HSYyQmzSml4M=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ckdrZ4qoDt0VXLPQORGUKPqXio0SjjZIRAxLRbouMv4phTK89sLZzrNOyVkXp5Bbd
         iW2airr52Y4aHnsRT0hxYOWqwxGksSw/2vxHDTkoi9w7u8GX2kZ16Pk0mydn3l3DN1
         9w13aI4U8PspgVXY7wk1r3ghaXyvLHLliJJJz1Pk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201015070622.GS2968@vkoul-mobl>
References: <20201015070622.GS2968@vkoul-mobl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201015070622.GS2968@vkoul-mobl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-5.10-rc1
X-PR-Tracked-Commit-Id: fc143e38ddd47d3b01ac276786ee78edf053bf5d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f065199d4df0b1512f935621d2de128ddb3fcc3a
Message-Id: <160280036886.16623.6053755934168477432.pr-tracker-bot@kernel.org>
Date:   Thu, 15 Oct 2020 22:19:28 +0000
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        dma <dmaengine@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The pull request you sent on Thu, 15 Oct 2020 12:36:22 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-5.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f065199d4df0b1512f935621d2de128ddb3fcc3a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
