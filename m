Return-Path: <SRS0=Ed1A=WQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC43C41514
	for <dmaengine@archiver.kernel.org>; Tue, 20 Aug 2019 11:14:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8CF622CF9
	for <dmaengine@archiver.kernel.org>; Tue, 20 Aug 2019 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566299692;
	bh=KX1MsYgzdBdHgqdlJIsghz8JkL+LPh8VAytgPVuXT40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QXbU/RH2s0ccgf+C8mwZoi55hix2pfX0B5+tz/b5yAJg3vqtX2c8/wpkC8RULFPlu
	 PMDFBQ+lzxY1qQtxKqZ033d+dl3bUEKnbWVhJWmSAQAL+lPhnL/Er3iy2ZHwgfmhvZ
	 P/yjDsduykjs438mU3z9OgfKLfN6aNmLQnPmD/VY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbfHTLOv (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 20 Aug 2019 07:14:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfHTLOv (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 20 Aug 2019 07:14:51 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 576F02070B;
        Tue, 20 Aug 2019 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566299691;
        bh=KX1MsYgzdBdHgqdlJIsghz8JkL+LPh8VAytgPVuXT40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u1RBEi8NWNPC1i0RRI9/hMhw2NPfI/QVo75f3Uoh2cR9wQM12fLKVDdv2aJOIcGau
         31wkLPE81BlOFca7nhzWfaCDZ2opZbhp7V8jhFjA+aPljKREXJd+5JeGSy4xV+Q/08
         7a1rbqdkcRcdMcYUeo3/m5NzpampdzcOTFyypwpQ=
Date:   Tue, 20 Aug 2019 16:43:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v1 07/12] dmaengine: dw: platform: Enable iDMA 32-bit on
 Intel Elkhart Lake
Message-ID: <20190820111340.GT12733@vkoul-mobl.Dlink>
References: <20190806094054.64871-1-andriy.shevchenko@linux.intel.com>
 <20190806094054.64871-7-andriy.shevchenko@linux.intel.com>
 <20190814144439.GW30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814144439.GW30120@smile.fi.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 14-08-19, 17:44, Andy Shevchenko wrote:
> On Tue, Aug 06, 2019 at 12:40:49PM +0300, Andy Shevchenko wrote:
> > Intel Elkhart Lake OSE (Offload Service Engine) provides few DMA controllers
> > to the host. Enable them in the ACPI glue driver.
> > 
> 
> Since Jarkko noticed an issue with naming of IP, this and relevant patches has
> to be re-done.

OK I will wait for  av2 then :-)

-- 
~Vinod
