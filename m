Return-Path: <SRS0=FD85=5T=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A55C2BA17
	for <dmaengine@archiver.kernel.org>; Fri,  3 Apr 2020 00:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77D32207FF
	for <dmaengine@archiver.kernel.org>; Fri,  3 Apr 2020 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585874434;
	bh=uNdObiZUcMPCmKTt+tHx1I8OZubswKO9nydYm0aQq7w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=JeAEA4voF7fzeq80URetX14ZUKPvAXQT5s4jQ8hxgFWd5xOi6xRFk9ZhVMfBJBHG1
	 gf92wVTUhDcE9YBIkJ98ZRUx4lBrN0rgaVaCWAjktEK3jmWoVAIRuxgOHU+LOh3JbD
	 X/L31/AghFNrK6ahu8darJeLZYP3ll/i8MPN2NxU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390452AbgDCAkV (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 2 Apr 2020 20:40:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:39124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390445AbgDCAkV (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 2 Apr 2020 20:40:21 -0400
Subject: Re: [GIT PULL]: dmaengine updates for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585874420;
        bh=uNdObiZUcMPCmKTt+tHx1I8OZubswKO9nydYm0aQq7w=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gSWSUHIOrXpfpP5p8bX7J/9CG8xzvnd+nAF9pI/XHOiqDwpj193LJrWMyFBxMYaN/
         t+VRy8J4pKKSyxhYJjBD/m7KC9P1EoW8tHZSAnDVSPiK5dY7jJ8OUnpMT85xoInQY+
         HJOaPsNMLedeOLK5fa4VFZNwSNTd/lESvYEduDBY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200402112500.GJ72691@vkoul-mobl>
References: <20200402112500.GJ72691@vkoul-mobl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200402112500.GJ72691@vkoul-mobl>
X-PR-Tracked-Remote: git://git.infradead.org/users/vkoul/slave-dma.git
 tags/dmaengine-5.7-rc1
X-PR-Tracked-Commit-Id: cea582b5ee5645839650b6667335cfb40ec71c19
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e964f1e04a1ce562f0d748b29326244d3cb35ba4
Message-Id: <158587442059.31624.5342191140301326373.pr-tracker-bot@kernel.org>
Date:   Fri, 03 Apr 2020 00:40:20 +0000
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        dma <dmaengine@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The pull request you sent on Thu, 2 Apr 2020 16:55:00 +0530:

> git://git.infradead.org/users/vkoul/slave-dma.git tags/dmaengine-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e964f1e04a1ce562f0d748b29326244d3cb35ba4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
