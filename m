Return-Path: <SRS0=Lzn8=SZ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2D1C10F14
	for <dmaengine@archiver.kernel.org>; Tue, 23 Apr 2019 05:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C3A3214AE
	for <dmaengine@archiver.kernel.org>; Tue, 23 Apr 2019 05:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555996212;
	bh=69ba/LcdkGrzPUsyKo78VQP0+UkYmFORyGWlVeZinxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aEw371W6TqinIJqy/Dk3d/NnyggRqAyxZbxLhv2EzHObNiKFZQNeq09uhgdSI25Sv
	 +mgIFFyX6gGlqIu2uNfAZ5yA5A1X6+vBbeyxIw74a642R6nFevyq71y55wT5ErNV1X
	 oSFCTQBZe67pYV5KAdfa3EX4cnab0/9KFGAHzrOs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfDWFKM (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 23 Apr 2019 01:10:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfDWFKL (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 23 Apr 2019 01:10:11 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78D9E20811;
        Tue, 23 Apr 2019 05:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555996211;
        bh=69ba/LcdkGrzPUsyKo78VQP0+UkYmFORyGWlVeZinxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nW+wFJRM27F8h3lQQMrkZxTcrAi99D4KSeOvOuruSs5/yd1BFadM9ZwyuH84d7dDb
         inz21vNS6RGC72CnJZKsUVwo/ygvILgKGnqItQ59HWW3TXQnkSdQdP5HTXsa4+1vi7
         Bj0u2ttAZWEhctUfP/VsWc107Kb9GTKiUZYInBjk=
Date:   Tue, 23 Apr 2019 10:40:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     dmaengine@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dmaengine: at_xdmac: remove BUG_ON macro in
 tasklet
Message-ID: <20190423051005.GD28103@vkoul-mobl>
References: <20190403102359.27698-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190403102359.27698-1-nicolas.ferre@microchip.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190423051005.X65A2A05WGs3aKPx0tgKSgtC0brvHUzlw_nY0HFDR0U@z>

On 03-04-19, 12:23, Nicolas Ferre wrote:
> Even if this case shouldn't happen when controller is properly programmed,
> it's still better to avoid dumping a kernel Oops for this.
> As the sequence may happen only for debugging purposes, log the error and
> just finish the tasklet call.

Applied all, thanks
-- 
~Vinod
