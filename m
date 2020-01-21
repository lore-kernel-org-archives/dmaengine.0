Return-Path: <SRS0=78CF=3K=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8F2C2D0DB
	for <dmaengine@archiver.kernel.org>; Tue, 21 Jan 2020 09:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65E7424654
	for <dmaengine@archiver.kernel.org>; Tue, 21 Jan 2020 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579599365;
	bh=icfzH3y4wahzijh/wKIolkLodnwYUg3fl14fAJn1FZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Z0SE5MHLvcI4KQkRqYlOuX7qZUSWXNEB99R+KZ+wbWbuXwO7+bpeTD3pnaNJJx17m
	 apmt6s73S3nPS3x9Ama1D8q3bpRqWNksJdNFVbOomwDMqo2rZ/3vXI/lxyDf/wU6BX
	 QgLwDvF8Sd5Z7pqjznRF7lwxhUztD+r827JFbZIA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgAUJgF (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 Jan 2020 04:36:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:44176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUJgF (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 Jan 2020 04:36:05 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4DA422522;
        Tue, 21 Jan 2020 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579599364;
        bh=icfzH3y4wahzijh/wKIolkLodnwYUg3fl14fAJn1FZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmAcnKZ90CFsvmOWK5jFHQ+r7WU9WcCVDdRbA4a93GmfCg39cqGKkOCgI6hOpTVon
         kDO5HXY0FQ30J2SSUL4pqIP+sbEiIALmxBFtyDidTcbQSUEl942y4FynyZGLIplG1/
         2A7HUTMl7TrWs/cETTzLaV2dzsWrciquayomN8kA=
Date:   Tue, 21 Jan 2020 15:05:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matt Porter <mporter@konsulko.com>,
        Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] dmaengine: Miscellaneous cleanups
Message-ID: <20200121093559.GJ2841@vkoul-mobl>
References: <20200121093311.28639-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121093311.28639-1-geert+renesas@glider.be>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 21-01-20, 10:33, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> 	Hi Vinod,
> 
> This patch series contains a few miscellaneous cleanups for the DMA
> engine code and API.
> 
> Changes compared to v1:
>   - Add Acked-by,
>   - Rebase on top of today's slave-dma/next.

Thanks for the quick rebase :), applied now

-- 
~Vinod
