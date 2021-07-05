Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A87FC07E9E
	for <dmaengine@archiver.kernel.org>; Mon,  5 Jul 2021 19:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8159A6197F
	for <dmaengine@archiver.kernel.org>; Mon,  5 Jul 2021 19:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhGET0s (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Jul 2021 15:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230012AbhGET0q (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 5 Jul 2021 15:26:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FA5A61985;
        Mon,  5 Jul 2021 19:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625513049;
        bh=JeO8oN6hAarNQU0OKhByNKQte2RNYCQ3Y6/h1ywr3UQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=LBPv6qVZf7hxHgAOgemAGfzwHtQhusZCli9rtD121RlFUsMYcsG03KvGK1gyu1l0E
         GgZa17galPx7Ndux2KjQRgAkjjunqqCoHAVXeewkk6OXjuYF6JdJHu0unpy+GJPNef
         q92ON2U9xqbMQnSh7bge4qiifea9aS5fIO9t94CRfjdS9azq8lOdUSYzl3tr5mP1yx
         w+OThIPbctU//J3q5we5kXw/v2mmVJ5ekT5peRO3rVtWcrNvQaSu9gRPiJTxzpJ1RP
         72UbjC39c2SryZISjRbdsFJNFDDvyiYhHGCWCRC8RQ/thlzwQoDGLNWB9O8zqeykGx
         Cek3STDCUJ96g==
Subject: Re: [GIT PULL]: dmaengine updates for v5.14-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YOMJM1UjXOsbtIDe@matsya>
References: <YOMJM1UjXOsbtIDe@matsya>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YOMJM1UjXOsbtIDe@matsya>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-5.14-rc1
X-PR-Tracked-Commit-Id: 8d11cfb0c37547bd6b1cdc7c2653c1e6b5ec5abb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18ef082713ad1104c32cd17a15abdc3f43c9b28a
Message-Id: <162551304929.9654.422382849119172569.pr-tracker-bot@kernel.org>
Date:   Mon, 05 Jul 2021 19:24:09 +0000
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        dma <dmaengine@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The pull request you sent on Mon, 5 Jul 2021 18:59:23 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-5.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18ef082713ad1104c32cd17a15abdc3f43c9b28a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
