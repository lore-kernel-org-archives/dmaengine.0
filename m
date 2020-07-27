Return-Path: <SRS0=vTIU=BG=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0650DC433DF
	for <dmaengine@archiver.kernel.org>; Mon, 27 Jul 2020 09:16:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D009920658
	for <dmaengine@archiver.kernel.org>; Mon, 27 Jul 2020 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595841380;
	bh=g+jsheoBYo9FAWpHTsbNwPFmucV5zo8Yq2qg0+vuKuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iAuU6f3VhVsZBAZB63lxiQgqd8lQGoiSQkW58Hj5eukolgDfCDXvj2I9YO8g86wDv
	 shMF8wXS9FvXvCrKw0l0QUeO9GcG/XVbDxnOGub0m8aJrl26R/F3vfaqaPYIlgXeGa
	 J9dV+KzuZNK2c0syxjf68VgbAOzY7jsxdKCKgEjY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgG0JQU (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 27 Jul 2020 05:16:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgG0JQU (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 27 Jul 2020 05:16:20 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 342182064B;
        Mon, 27 Jul 2020 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595841380;
        bh=g+jsheoBYo9FAWpHTsbNwPFmucV5zo8Yq2qg0+vuKuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O3rrZDT1rGqSmo6uMz0+axUk3hlwbI429A0H82qEcsUNq+P7lMyLcU0JkhzgU8W3J
         mGp7KOz+jkPge6ulZTQY+ApX3oNw7aJc8eUHPwemu7NxxlMsVRkW1SYo0R/mCs8fYH
         SFx8i1c1eOIa3gqcacmqJgFaH7oCXanaZAZBbKxM=
Date:   Mon, 27 Jul 2020 14:46:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v1] dmaengine: dw: Don't include unneeded header to
 platform data header
Message-ID: <20200727091616.GS12965@vkoul-mobl>
References: <20200721130844.64162-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721130844.64162-1-andriy.shevchenko@linux.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 21-07-20, 16:08, Andy Shevchenko wrote:
> Including device.h is too much for the dma-dw.h platform data header.
> Replace it with the headers of which dma-dw.h is direct user.

Applied, thanks

-- 
~Vinod
