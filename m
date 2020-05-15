Return-Path: <SRS0=Szr/=65=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA266C433E2
	for <dmaengine@archiver.kernel.org>; Fri, 15 May 2020 05:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9602C206F1
	for <dmaengine@archiver.kernel.org>; Fri, 15 May 2020 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589522104;
	bh=WnqeQYB2+mWUD/mIsKJdTJfRuViOXVybAl49eE0Z4DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=N6ytoNFochWkTf2+MZ7pOWAz57kfS5NZNCZlpAJmcUcAQLwTBo1XDy9fHQK9TAvqc
	 QPtOq7NrYlfNKHGDBCknWVmyEnfwIsg3+S7lTixASknNmrOqCy5Htpyac+Zm01LAt1
	 +ijxX8x6JljZaCE3tQ0x+CgYl3GPrZots+d3O/pI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgEOFzD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 15 May 2020 01:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:54522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgEOFzD (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 15 May 2020 01:55:03 -0400
Received: from localhost (unknown [122.178.196.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C988C2054F;
        Fri, 15 May 2020 05:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589522102;
        bh=WnqeQYB2+mWUD/mIsKJdTJfRuViOXVybAl49eE0Z4DI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sAg43KVr/hWVncPlPicHiINe6Uccng5CXf9YIDv90MS0ElyT1kGcIJ8vd5QbKSiVZ
         a6GWciC7dmunbsSigfqpNIt0YKRE5/PG7BeiI0Wwyhi6Gn6KscQi2BTTqM4IQApxhw
         ohUhWQDYYA8k6p9VitKe9Zhoy+0W0HW2Y+k3bGuk=
Date:   Fri, 15 May 2020 11:24:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Add missing dma_sync call for rx
 flush descriptor
Message-ID: <20200515055458.GD333670@vkoul-mobl>
References: <20200512134544.5839-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512134544.5839-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-05-20, 16:45, Peter Ujfalusi wrote:
> The TR mode rx flush descriptor did not had a dma_sync_single_for_device()
> call to make sure that the DMA see the correct information.

Applied, thanks

-- 
~Vinod
