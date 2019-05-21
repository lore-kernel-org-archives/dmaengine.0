Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E30C04AAF
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 05:08:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA15421743
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 05:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558415336;
	bh=t9uGR8r9L5rDKRnzXSH9HiCpiLLr+T3BJA4V/XcVk08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Iw6vSdmh9G58NwcSWV9PLeXdKjwSIvHjwC9Sz05/QWmCuhzDrEiicnU1qQUGXY7Rt
	 gJ9EZehYql6OiWY2uEZmyFdLTZN0N33wkb6WZc7GjmUIBBtGHYsJlF/2QzEFzGRFK6
	 ZM55d99SJOH7MD0ozUR70hfZU9IQYsTu+NwXB4yo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfEUFIz (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 01:08:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:57590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbfEUFIy (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 01:08:54 -0400
Received: from localhost (unknown [106.201.107.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9596B2173E;
        Tue, 21 May 2019 05:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558415334;
        bh=t9uGR8r9L5rDKRnzXSH9HiCpiLLr+T3BJA4V/XcVk08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EL6n2oJMIhlHpjk0CaqrXg2Te4EkGw/11o6XT6Bj7F+vgHzT8E7960+wfl661UX1s
         eQZXuHHZp6HoQXpqftwyfG6BMMO5NqY3mYlZerY93pl472dzSqFboJEV5/imLP84Cm
         mXSw3DnqfVq9dHsuRYmfpU0C/4QcgMJK+6J2tBHw=
Date:   Tue, 21 May 2019 10:38:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     dmaengine@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] dmaengine: axi-dmac: Enable TLAST handling
Message-ID: <20190521050850.GV15118@vkoul-mobl>
References: <20190516094430.16121-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516094430.16121-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-05-19, 12:44, Alexandru Ardelean wrote:
> From: Michael Hennerich <michael.hennerich@analog.com>
> 
> The TLAST flag is used by the DMAC HDL controller to signal to the
> controller that the following segment (to be submitted) is the last one (in
> a series of segments).
> 
> A receiver DMA (typically another DMAC) can read this parameter (from the
> transfer), and terminate the transfer earlier. A typical use-case for this,
> is when the receiver expects a certain amount of segments, but for some
> reason (e.g. an ADC capture which can have an unknown number of digital
> samples) the number of actual segments is smaller. The receiver would read
> this flag, and then the DMAC would finish.

Applied, thanks

-- 
~Vinod
