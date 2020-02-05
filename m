Return-Path: <SRS0=osqa=3Z=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1494DC35247
	for <dmaengine@archiver.kernel.org>; Wed,  5 Feb 2020 18:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBA5720674
	for <dmaengine@archiver.kernel.org>; Wed,  5 Feb 2020 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580926821;
	bh=WnbOrCJJctB5p1GDCsuuSvYgI4mUo3clWBPfeC8tSAw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=mQF4jh8ZNAWb8bX9tGdocqRO3O9BLGvVG7sxXMkWSa/8qazBLgEg5zNrtklVRCHPf
	 Idv8Uc12BhyK6j+Jb366PDGRxYtaG9LhMTpRUB91S40ydSiKACgEc0fPxp3e7MU716
	 ZnJcxra1wKzV4XPMjLlWmaN00KUs7bpjV7b0X0BA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBESUU (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 5 Feb 2020 13:20:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:51962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727705AbgBESUT (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 5 Feb 2020 13:20:19 -0500
Subject: Re: [GIT PULL] dmaengine fixes for v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580926818;
        bh=WnbOrCJJctB5p1GDCsuuSvYgI4mUo3clWBPfeC8tSAw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nARIRhs3Hw1yOUl1M+mk8I9BNaye1qwClSBDpvbVBvNMno1ovPg1oTxlQQiuTOY9Y
         tO5ezn9j+s+ne8CBJOhyKDHh0pYM10D/089bjIjD+MlcdaD/sF8Bi0mOymB8wSWRaz
         Wao0YGlRVrFgYowwNNaanqxk+0l8aNqXbyV+WpKk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200205160021.GL2618@vkoul-mobl>
References: <20200205160021.GL2618@vkoul-mobl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200205160021.GL2618@vkoul-mobl>
X-PR-Tracked-Remote: git://git.infradead.org/users/vkoul/slave-dma.git
 tags/dmaengine-fix-5.6-rc1
X-PR-Tracked-Commit-Id: bad83565eafe8a00922ad4eed6920625a10a2126
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18ea671ba40bcbb15c47118e20010240186da33b
Message-Id: <158092681890.14135.2243192978578155305.pr-tracker-bot@kernel.org>
Date:   Wed, 05 Feb 2020 18:20:18 +0000
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        dma <dmaengine@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The pull request you sent on Wed, 5 Feb 2020 21:30:21 +0530:

> git://git.infradead.org/users/vkoul/slave-dma.git tags/dmaengine-fix-5.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18ea671ba40bcbb15c47118e20010240186da33b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
