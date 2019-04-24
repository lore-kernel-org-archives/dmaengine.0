Return-Path: <SRS0=fQ6P=S2=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147D9C10F11
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 05:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6532218D3
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556084353;
	bh=gsinXkBgFIGD0/7FqtRBNfYQ4Nw7H+RS94t9EZY7Mw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=g9dde4avas3FxrnXKn2FNeKzSrBesFTMjdNHkj9nmhUWzrLu8rVG+LwmxLhKZ6bsB
	 +iV0Ia/exT2l2uryFBeGkmrNRjw/UT1KlMilpWjZHJxyOZRW/SxtX6ET9MR8ks326C
	 z/ivdMjFTdforqxL/EDxawtqb4HuyjiLSIvh42dM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbfDXFjN (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Apr 2019 01:39:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfDXFjN (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 24 Apr 2019 01:39:13 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E44D2089F;
        Wed, 24 Apr 2019 05:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556084352;
        bh=gsinXkBgFIGD0/7FqtRBNfYQ4Nw7H+RS94t9EZY7Mw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UOxm7BzgXVCb1lDG4LGlNZFMK5KSbjQcGy5ozeMhTw184475AA8hZJRqc5T3+aCak
         FRWV7v1GKPGhP3Xtnrlu48pgKGNJq7mAFogp3toJMB+5jFfSQDVLPwDlkmxRxhKBSm
         UJ9Ot7JjrBGrHkPMVHsBe4DAa/DwjGA/bNPVb8oI=
Date:   Wed, 24 Apr 2019 11:09:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     dmaengine@vger.kernel.org, Dragos Bogdan <dragos.bogdan@analog.com>
Subject: Re: [PATCH][V2][RESEND] dmaengine: axi-dmac: Enable DMA_INTERLEAVE
 capability
Message-ID: <20190424053909.GM28103@vkoul-mobl>
References: <20190326140756.1941-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190326140756.1941-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190424053909.orZ9xruKFHoEZ3PqQAEiAHsu7IvGdfIkXvCoQqrYZ2g@z>

On 26-03-19, 16:07, Alexandru Ardelean wrote:
> From: Dragos Bogdan <dragos.bogdan@analog.com>
> 
> Since device_prep_interleaved_dma() is already implemented, the
> DMA_INTERLEAVE capability should be set.

Applied, thanks

-- 
~Vinod
