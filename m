Return-Path: <SRS0=fQ6P=S2=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E51C10F11
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 05:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D21A0218D3
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 05:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556084337;
	bh=5NsObc2GKmosG2DX2hWDOz3YywJOySJairtdhovZdbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mFaGuGY/nQlPnJXIXYRGyGd5fZzrOfNUqnZqifB1nF6waRr0inhu4m1/c9CPMf2bJ
	 wETNdiM4t63m129AUALqTwalbE2oIGvlLvv8OJsslbzqTlfENvH7YhdKsmW4BzaPOj
	 YCleRZw0IuAI6cGjGhoWqH2bsUoBlU4qElwG5waY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbfDXFi5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Apr 2019 01:38:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729334AbfDXFi5 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 24 Apr 2019 01:38:57 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19D3A2089F;
        Wed, 24 Apr 2019 05:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556084336;
        bh=5NsObc2GKmosG2DX2hWDOz3YywJOySJairtdhovZdbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OGzeADX9WnGEeF5hXfTrrWFrFHBiHtysURfu4EiLrji7t0bsEEim7V5X3gz0ImiWn
         66eUin/NiZCHrIVvFBEK6aDkc2QxWSq7EVSM6lVU2TVKIyDmJPzswasDOkwKyfT+hR
         NWxDForE+clWpIiJVykGH9YJWNw8jCyM1x4ZujHg=
Date:   Wed, 24 Apr 2019 11:08:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH V3] dmaengine: axi-dmac: Don't check the number of frames
 for alignment
Message-ID: <20190424053851.GL28103@vkoul-mobl>
References: <20190326140520.28475-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190326140520.28475-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190424053851.BIwMReAURDkccjn3MzT325DK21AGwF8cszl-Zzr0kqA@z>

On 26-03-19, 16:05, Alexandru Ardelean wrote:
> In 2D transfers (for the AXI DMAC), the number of frames (numf) represents
> Y_LENGTH, and the length of a frame is X_LENGTH. 2D transfers are useful
> for video transfers where screen resolutions ( X * Y ) are typically
> aligned for X, but not for Y.
> 
> There is no requirement for Y_LENGTH to be aligned to the bus-width (or
> anything), and this is also true for AXI DMAC.
> 
> Checking the Y_LENGTH for alignment causes false errors when initiating DMA
> transfers. This change fixes this by checking only that the Y_LENGTH is
> non-zero.

Applied, thanks

-- 
~Vinod
