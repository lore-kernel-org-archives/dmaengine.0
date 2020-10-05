Return-Path: <SRS0=hjok=DM=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C430BC4363A
	for <dmaengine@archiver.kernel.org>; Mon,  5 Oct 2020 04:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8489220829
	for <dmaengine@archiver.kernel.org>; Mon,  5 Oct 2020 04:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601873216;
	bh=0SimSveQGeUxXB9OTEuy2aHgGOxBfTXFFfaOsN9roXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Wa+DK9M28O+9TsDmInNJUtsg0DJhzfa4mRHRcFvFlTVDHYu6KcHJs236sxmN+1Bxx
	 QBxZjz/L9MemFq9e3nbx9qw8Vofi3eIenWwv6HGSG4JJyZ4XuT6GG1TnyhrSyiBocL
	 qLDosU13BQwrANpSTPVwbGHHAnJU8O34OWqjrfuI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgJEEq4 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Oct 2020 00:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgJEEq4 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 5 Oct 2020 00:46:56 -0400
Received: from localhost (unknown [171.61.67.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB6582080C;
        Mon,  5 Oct 2020 04:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601873215;
        bh=0SimSveQGeUxXB9OTEuy2aHgGOxBfTXFFfaOsN9roXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BQEZCokKzw0j4sTpUVkmfD2atNDjTgLkjZZQMfu1cSzDOWRTDnRA1Pe8CgEOjBLWS
         OTM6xTd1hiYCMPeNowSerJZ32N2tOloRqVmPqLiXr7iDpWRUmWJb0tihdk9rlfdZBr
         t8a2AqrlxLkmtK5zz/Brdmyrvn0AYBvi75qtaWQ4=
Date:   Mon, 5 Oct 2020 10:16:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] dmaengine: ioat: Allocate correct size for descriptor
 chunk
Message-ID: <20201005044651.GI2968@vkoul-mobl>
References: <20200922200844.2982-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922200844.2982-1-logang@deltatee.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 22-09-20, 14:08, Logan Gunthorpe wrote:
> dma_alloc_coherent() is called with a fixed SZ_2M size, but frees happen
> with IOAT_CHUNK_SIZE. Recently, IOAT_CHUNK_SIZE was reduced to 512M but
> the allocation did not change. To fix, change to using the
> IOAT_CHUNK_SIZE define.
> 
> This was caught with the upcoming patchset for converting Intel platforms to the
> dma-iommu implementation. It has a warning when the unmapped size differs from
> the mapped size.

Applied, thanks

-- 
~Vinod
