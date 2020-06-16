Return-Path: <SRS0=2hur=75=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ACFC433DF
	for <dmaengine@archiver.kernel.org>; Tue, 16 Jun 2020 16:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 126482075E
	for <dmaengine@archiver.kernel.org>; Tue, 16 Jun 2020 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592324937;
	bh=JpTCvK5zFPERLoJ7+BL5bx1daTFnJ0DVQEE6Ek0j9Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NFF890FDa/T2FCOP+DjOGSxxudQ2vf0QRcyDfF3rKiGu7DpJFmWGU9tgC6dlpLD0X
	 6xptUadDETp6QNitS5CK1Es/Vw+dx1t7VW1f7NCOwC/Jht8usJXwaWMz0xiiMFrtBE
	 CR+c/B+iHpdmxArSUa+T+wjHZXBx0gLOSaaK1410=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgFPQ24 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:28:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730324AbgFPQ24 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 16 Jun 2020 12:28:56 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61BBD2067B;
        Tue, 16 Jun 2020 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592324936;
        bh=JpTCvK5zFPERLoJ7+BL5bx1daTFnJ0DVQEE6Ek0j9Sw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASEsZ+N2S3uyKyWBFvMm1ifHI1TYBo/sPDy0KmufQ3yVlLolYjItPyF7BIxI8n8AC
         iTLUVjlYAmYjjNTL465zKku9PwUEhvH+v6MRc8zPnUIRYLYSt5xGd4jHNuPbci21kM
         nK4fAiXSRNRthCzeTVEc3KrbRBndV0DOHzleUXJ4=
Date:   Tue, 16 Jun 2020 21:58:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] dmaengine: mmp_pdma: Do not warn when IRQ is
 shared by all chans
Message-ID: <20200616162852.GM2324254@vkoul-mobl>
References: <20200601192337.172869-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601192337.172869-1-lkundrak@v3.sk>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 01-06-20, 21:23, Lubomir Rintel wrote:
> When there's a single interrupt for all the DMA channels, the
> unsuccessful attempt to request separate IRQs emits useless warnings:
> 
>   [    1.370381] mmp-pdma d4000000.dma: IRQ index 1 not found
>   ...
>   [    1.412398] mmp-pdma d4000000.dma: IRQ index 15 not found
>   [    1.418308] mmp-pdma d4000000.dma: initialized 16 channels
> 
> Avoid that, treating the IRQs as optional.

Applied, thanks

-- 
~Vinod
