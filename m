Return-Path: <SRS0=2hur=75=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7407C433DF
	for <dmaengine@archiver.kernel.org>; Tue, 16 Jun 2020 16:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAFC1206F1
	for <dmaengine@archiver.kernel.org>; Tue, 16 Jun 2020 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592325068;
	bh=7t8RgxP0ueHPPX3r70Fomz/wi4nDyTMGz6KPZu6e7eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=X71+pmEYrOaCDoA7aJ3QX34bzqRv/bbgKMxesbjm7UigdCvaz8rGYgb9giWe9Zz/F
	 /WoOf2mn7+ku1vqac92ZiFkREl0oLA68FtDSwLI2PfSZqYwye1Cap7dkDXo5ks1F53
	 RogW6xj0E3kTUYBLpIJ0+yikYQytL+fjZQTKYqMU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbgFPQbI (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:31:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729167AbgFPQbI (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 16 Jun 2020 12:31:08 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECDF62067B;
        Tue, 16 Jun 2020 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592325067;
        bh=7t8RgxP0ueHPPX3r70Fomz/wi4nDyTMGz6KPZu6e7eE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1nbFoW4qUXuUvgY6MBgopgG40XyU9Vx7Xser4qkz7ICtuEtO3KQZ7lxRhG1+tqNzd
         IzuwvPosuvCSUBvopfdNVSxZbBtl+JD/WqYBPotTACixjzHofJyAWCMrbneoXyL9vW
         TUEB8J8B+5D5UVAebXmDUS9c1283whOsYIJ9OJsk=
Date:   Tue, 16 Jun 2020 22:01:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Cc:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/15] dmaengine: dw-edma: use PCI_IRQ_MSI_TYPES  where
 appropriate
Message-ID: <20200616163104.GN2324254@vkoul-mobl>
References: <20200602092025.31922-1-piotr.stankiewicz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602092025.31922-1-piotr.stankiewicz@intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 02-06-20, 11:20, Piotr Stankiewicz wrote:
> Seeing as there is shorthand available to use when asking for any type
> of interrupt, or any type of message signalled interrupt, leverage it.

Applied, thanks

-- 
~Vinod
