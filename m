Return-Path: <SRS0=H4t5=57=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF060C2BB85
	for <dmaengine@archiver.kernel.org>; Wed, 15 Apr 2020 16:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C27E206F9
	for <dmaengine@archiver.kernel.org>; Wed, 15 Apr 2020 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586967235;
	bh=MZvf1uk2yEbEvh8enIS7Opv+16yLhCtcLriMG0yY+38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B3GlQ+havRVhhPmOXNWLnJCKRuexmuHtn6nL/AR1LzkmouO6i+D7wPsaRXVYCKUaD
	 bttuu6+j2rWQDSthmyVp9303bcVRDE4NZ6cC26gv8+zch9GTkuo/c/TTKWOgVidpAj
	 jtHOFw6SXYXCDMgZvmK0oJlRJt+ezW5Q7wUNTAyQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415340AbgDOQNm (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:13:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1415257AbgDOQNA (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 15 Apr 2020 12:13:00 -0400
Received: from localhost (unknown [106.201.106.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13B0D2076A;
        Wed, 15 Apr 2020 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586967180;
        bh=MZvf1uk2yEbEvh8enIS7Opv+16yLhCtcLriMG0yY+38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ouJLjovf/rIME1C9A6sBRGlAh7/MjGUvJ0ST64BjIeNXbviE6c1cMP5Sk/n1iKcBx
         sM+NvGRfa/hDWt3++JeE0Nve13vetJZL6nTrTGfzRwFsNKm97lwXbw13m7P68Ts5GP
         0s3slCMdeSg/y23yJm6ZxiQ7nvPvvQ5tOOIoashE=
Date:   Wed, 15 Apr 2020 21:42:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sebastian von Ohr <vonohr@smaract.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Add missing check for empty list
Message-ID: <20200415161243.GY72691@vkoul-mobl>
References: <20200303130518.333-1-vonohr@smaract.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303130518.333-1-vonohr@smaract.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 03-03-20, 14:05, Sebastian von Ohr wrote:
> The DMA transfer might finish just after checking the state with
> dma_cookie_status, but before the lock is acquired. Not checking
> for an empty list in xilinx_dma_tx_status may result in reading
> random data or data corruption when desc is written to. This can
> be reliably triggered by using dma_sync_wait to wait for DMA
> completion.

Applied, thanks

-- 
~Vinod
