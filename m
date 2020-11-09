Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE01DC2D0A3
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:56:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98F04207BC
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604922994;
	bh=YSPOnZ9WyeWCMZa0fv9ReScihrXEhj6QtSBLU7BD/OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KgSwRWGSQHF/+LvHJQF21nB/7+n0FdtOBsFaCQEg2GR7za98q4+vgLI0B7nBQ/gae
	 sJuCAB8qzLBSJKiMMddigdfqkLGPa2Fs9zKHPrAclo/zb8Dwml/3C9DnvGVteJq3AQ
	 jRi+2qNQMumBimBoHplCKX37cYgg1XL61wp5fbXY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgKIL4e (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:56:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:37464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgKIL4e (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 06:56:34 -0500
Received: from localhost (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F5B120789;
        Mon,  9 Nov 2020 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604922993;
        bh=YSPOnZ9WyeWCMZa0fv9ReScihrXEhj6QtSBLU7BD/OA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1eW+9N8tIzc9065UasyQEKovO56wPhUPN6Mh8E+2795/TViAiGtXZhVvVvS6qGZ/7
         G/9QqneGCIgdgwlX6/rR8naNJmh4bgyaXO8htk40kz7DQUyKj3Rjs19cN2dnePkMQp
         4msQRjT1x8yOdXOC8fuM25vgK9CsvNCjvlEOcuio=
Date:   Mon, 9 Nov 2020 17:26:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     dmaengine@vger.kernel.org, linuxarm@huawei.com
Subject: Re: [PATCH v2 00/10] dmaengine: a bundle of cleanup on
 spin_lock_irqsave/irqrestore
Message-ID: <20201109115629.GN3171@vkoul-mobl>
References: <20201027215252.25820-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027215252.25820-1-song.bao.hua@hisilicon.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 28-10-20, 10:52, Barry Song wrote:
> Running in hardIRQ, disabling IRQ is redundant since hardIRQ has disabled
> IRQ. This patch removes the irqsave and irqstore to save some instruction
> cycles.

Applied all, thanks

-- 
~Vinod
