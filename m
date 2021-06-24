Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A997CC49EA7
	for <dmaengine@archiver.kernel.org>; Thu, 24 Jun 2021 11:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DA0B613DA
	for <dmaengine@archiver.kernel.org>; Thu, 24 Jun 2021 11:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbhFXLMm (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 24 Jun 2021 07:12:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232331AbhFXLMl (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 24 Jun 2021 07:12:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D31F613C5;
        Thu, 24 Jun 2021 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624533022;
        bh=3u57Aj47HiyOzb1Aq5HTw4fncIXifEL6yQ0gf3JMBB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kF5f7z6Wp0JYYFhyGg5EbJzBR2TLXYTcfcygIipG30SqjUiyJ4JrRwJ1JlAdkALAW
         gtlDqAOZrVpUiUoMW9F4SRXIjwE6NcER/tBVYcup4io/2ICMGXZFNgoF/5SMomF401
         OxCY6wI4Y9vnN6d9i7lPzfd4Tlsv60LJiyZk1aFQ72B7ySP8XZm1YwcXj7DVlnSGRp
         sQAVqMyQ5JXHgFODC6FJsHbuiwzp5jo9aVw9EHWn6mfaW8lTgfIYVyBrmV8TxjZVVu
         F98sa8saC117uK6cvjZJ+gBfwv1dtYPmlX8/2zX+lrCGNbSf79GfSBZpqFx5f0YM07
         6HMmoTdZW2Udg==
Date:   Thu, 24 Jun 2021 16:40:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: xilinx: dpdma: Fix spacing around addr[i-1]
Message-ID: <YNRoGkqDTbYyqQk/@matsya>
References: <ef7cde6f793bfa6f3dd0a8898bad13b6407479b0.1624446456.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef7cde6f793bfa6f3dd0a8898bad13b6407479b0.1624446456.git.michal.simek@xilinx.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 23-06-21, 13:07, Michal Simek wrote:
> Use proper spacing for array calculation. Issue is reported by
> checkpatch.pl --strict.

Applied, thanks

-- 
~Vinod
