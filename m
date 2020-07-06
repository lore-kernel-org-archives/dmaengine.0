Return-Path: <SRS0=Mp2P=AR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DCFC433DF
	for <dmaengine@archiver.kernel.org>; Mon,  6 Jul 2020 04:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D30320739
	for <dmaengine@archiver.kernel.org>; Mon,  6 Jul 2020 04:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594011080;
	bh=IBp8tyBnj3Y2L0swdhp+79ynA2bQ68n3mPtdQrODtRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BPUwspWJ+FUN5r5KOkj62J9SrJ2NS7o0a9aPxlF/PTrQDa+JLj3QE5bRhEY0Dv6Dn
	 Aa7+GzPzJSIw5yRcFia2Q7OwWoSuwxDpahazMXGpp4SkB1K8K/4t2KLuf6NwmN4Afs
	 oRSQFcRUBZ8KAHJRpb9iH7qfmvXvgzAG9AIBgREE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgGFEvU (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 6 Jul 2020 00:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:43926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgGFEvU (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 6 Jul 2020 00:51:20 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F77120739;
        Mon,  6 Jul 2020 04:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594011079;
        bh=IBp8tyBnj3Y2L0swdhp+79ynA2bQ68n3mPtdQrODtRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJkEHH2San4T44pjglxmA92z9tSBwJE1pkqPTDKMFCMLmiFnBOzWKsph7HiVpWavG
         2uMjxlfUybdG0xjkQYrxpPJ9ovygbpeHdavo/xKvmu4lp1yiQjMViejRwZ2bKsslLX
         1lXu7s7lLXwuvwIfDD2rkshFn8mbCHmbEJgCiWFQ=
Date:   Mon, 6 Jul 2020 10:21:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
        Tsuchiya Yuto <kitakar@gmail.com>
Subject: Re: [PATCH v1] dmaengine: dw: Initialize channel before each transfer
Message-ID: <20200706045115.GC633187@vkoul-mobl>
References: <20200705115620.51929-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705115620.51929-1-andriy.shevchenko@linux.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 05-07-20, 14:56, Andy Shevchenko wrote:
> In some cases DMA can be used only with a consumer which does runtime power
> management and on the platforms, that have DMA auto power gating logic
> (see comments in the drivers/acpi/acpi_lpss.c), may result in DMA losing
> its context. Simple mitigation of this issue is to initialize channel
> each time the consumer initiates a transfer.

Applied, thanks

-- 
~Vinod
