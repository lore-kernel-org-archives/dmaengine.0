Return-Path: <SRS0=bl+G=S4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157FBC43218
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D63A72089E
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556277718;
	bh=UTTAxG+Jg2VAeqcLpeFJKIEKlZAfzGGDG25z5H78rAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vyzv1t7872s3GblUaQpe9s9u8wyzp15EG8x5GQqNJRqOZfqC1JYryNWUYdP/xqcOx
	 +H/wGOJ8XdON+wJ8hYl6bvJBUWP6P4jAwlu0ftndrXtp4ATquVL/PGQpgfWMH0w/LV
	 M+uIxzMe4oR7UX0NRXLasC7vK/lkvBbCt1k7gbak=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfDZLV6 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 26 Apr 2019 07:21:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfDZLV6 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 26 Apr 2019 07:21:58 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA3C4206C1;
        Fri, 26 Apr 2019 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556277717;
        bh=UTTAxG+Jg2VAeqcLpeFJKIEKlZAfzGGDG25z5H78rAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t+6KkdQqRKDBxuQwEWECujbYKroyxMsUN1ZGCNldId/wYNBxex9hZZXZn2uJKXoRU
         3vJAtRYLJFg7/3fvBkY2lkHFdXFIlVzUUk+NOrKPvpv1zWCvMWKhnNGVbVMj1QJPIS
         7MAHS3/Z9G0fs1D+9HoIpeYne2/hwhOjoncJtc/g=
Date:   Fri, 26 Apr 2019 16:51:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sugar Zhang <sugar.zhang@rock-chips.com>
Cc:     heiko@sntech.de, broonie@kernel.org,
        linux-rockchip@lists.infradead.org,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl330: _stop: clear interrupt status
Message-ID: <20190426112151.GQ28103@vkoul-mobl>
References: <1554289582-43695-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <1554289582-43695-1-git-send-email-sugar.zhang@rock-chips.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190426112151.ZTz1L4_6sUi2-2-aUv_x3QBzOcULFgMfzTIMYAjOanY@z>

On 03-04-19, 19:06, Sugar Zhang wrote:
> This patch kill instructs the DMAC to immediately terminate
> execution of a thread. and then clear the interrupt status,
> at last, stop generating interrupts for DMA_SEV. to guarantee
> the next dma start is clean. otherwise, one interrupt maybe leave
> to next start and make some mistake.

Applied, thanks

-- 
~Vinod
