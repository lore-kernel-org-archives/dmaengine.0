Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ED2C56202
	for <dmaengine@archiver.kernel.org>; Wed, 18 Nov 2020 10:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73DB022228
	for <dmaengine@archiver.kernel.org>; Wed, 18 Nov 2020 10:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="le7o9svl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgKRK7U (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 18 Nov 2020 05:59:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:56540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgKRK7T (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 18 Nov 2020 05:59:19 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 318FB221FB;
        Wed, 18 Nov 2020 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605697159;
        bh=ZpfavT36F0f47AvlCCvAzoFPIHcMHHWJELItBg0XM4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=le7o9svlhciRZg9yMw/kElDk+Y/oVG9O6IIdDeP9idL8+DPgVc2J+7ImYHeLOjzfT
         A64viIGANaoJ65x7I0ZazQf6XRo2M2NZi1vkLSbNtf0XpAaywAbv7IQEAXqkIWf0t2
         ieyAfnrJyQbyQjK0khlFfycCctiRoV6ZVzDT0TiM=
Date:   Wed, 18 Nov 2020 16:29:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     tiny.windzz@gmail.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [RESEND PATCH 05/19] dmaengine: sun6i: Add support for A100 DMA
Message-ID: <20201118105914.GO50232@vkoul-mobl>
References: <cover.1604988979.git.frank@allwinnertech.com>
 <719852c6a9a597bd2e82d01a268ca02b9dee826c.1604988979.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <719852c6a9a597bd2e82d01a268ca02b9dee826c.1604988979.git.frank@allwinnertech.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 10-11-20, 14:28, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> The dma of a100 is similar to h6, with some minor changes to
> support greater addressing capabilities.
> 
> Add support for it.

Applied, thanks

-- 
~Vinod
