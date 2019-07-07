Return-Path: <SRS0=Re54=VE=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7FBC48BDB
	for <dmaengine@archiver.kernel.org>; Sun,  7 Jul 2019 17:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E790620830
	for <dmaengine@archiver.kernel.org>; Sun,  7 Jul 2019 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562520146;
	bh=2s2gE1E50GfJ/EeGP73+waB27rAFwSqJTvo/pyPbyTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1ShKU7bB2CAZVYyZZNhp5XjpA3LflkJ9l7F15zIw9whQaU26X7HDQwToQtPmnT9wS
	 /QimL6HmQjV4r3fthYhvHjf156NJpLvcDf4/eqWmbqDBqKmZ8okA8oR8Qw/WrU1F3q
	 +pk5mBB/jkLvimuTannSLn4uA+8jaIqpPb3uoZ/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfGGRWZ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 7 Jul 2019 13:22:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfGGRWZ (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 7 Jul 2019 13:22:25 -0400
Received: from localhost (unknown [49.207.58.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 123B62082F;
        Sun,  7 Jul 2019 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562520144;
        bh=2s2gE1E50GfJ/EeGP73+waB27rAFwSqJTvo/pyPbyTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8xhwKgCQQTlYyEcvQ9jYHJsRv0Z+cre4Dl/vakph1j//935NcoNxWlgYm9an0aBI
         tm8lVCX129aYQ1F7gtpxXixVR8/7M1hOdTo8Rd8T68DdyqUjfLMmNJoRRRYfkIRwdr
         hatgmaikvSFZLBe+cNlfc+FPBrhwAvaXzdjvaH4g=
Date:   Sun, 7 Jul 2019 22:47:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Raag Jadav <raagjadav@gmail.com>
Cc:     dmaengine@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: at_xdmac: check for non-empty xfers_list
 before invoking callback
Message-ID: <20190707171701.GI2911@vkoul-mobl>
References: <1561796448-3321-1-git-send-email-raagjadav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561796448-3321-1-git-send-email-raagjadav@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 29-06-19, 13:50, Raag Jadav wrote:
> tx descriptor retrieved from an empty xfers_list may not have valid
> pointers to the callback functions.
> Avoid calling dmaengine_desc_get_callback_invoke if xfers_list is empty.

Applied, thanks

-- 
~Vinod
