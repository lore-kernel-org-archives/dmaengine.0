Return-Path: <SRS0=+vnI=4H=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3D0C34047
	for <dmaengine@archiver.kernel.org>; Wed, 19 Feb 2020 09:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A69224656
	for <dmaengine@archiver.kernel.org>; Wed, 19 Feb 2020 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582104476;
	bh=9kyEssX5GEbwlVExA9JUPsMK72bF0lQACS2bjDvlqvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EbS0WWU7jPWAobhZ30mK5sOJySJxw4wYrYJ7FpUjrEMFPNMDgdqXeKb9dwxqcamTK
	 tJ0NbHkZXoXN4epsFtOZDD2o7jaOqOJ+IhUjK01yOuce3ksNY0vkrvTdkeajslvq8b
	 /BINVd0ZAPUCjJBEvhoqdtmfennL9cxN3MGB05Yo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgBSJ14 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 19 Feb 2020 04:27:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:52758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgBSJ1z (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 19 Feb 2020 04:27:55 -0500
Received: from localhost (unknown [106.201.32.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 849AA2064C;
        Wed, 19 Feb 2020 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582104475;
        bh=9kyEssX5GEbwlVExA9JUPsMK72bF0lQACS2bjDvlqvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ps8pNHJpu5H+1dtWXtP1nZ/vMn+PISHycpZFQKHsacq25au3EysOMbcLKDHH3BAd2
         y73T6NuhAIbWZ8PVVOg4Zm8zeE8VZvgaMlmRXAXSZpaYiONEGAhq11oUnKgpObKaGa
         nfYJZdekeW4qPjWgALR9BhLDf5iJ6mdLxnWo5SC4=
Date:   Wed, 19 Feb 2020 14:57:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        dmaengine <dmaengine@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dmaengine: coh901318: Fix a double lock bug in
 dma_tc_handle()
Message-ID: <20200219092751.GH2618@vkoul-mobl>
References: <20200217144050.3i4ymbytogod4ijn@kili.mountain>
 <CAMuHMdWaCqZ_zcHuBetAQu4kmoffNw5jvHM5ciTi29MAxL70bg@mail.gmail.com>
 <20200219091754.GE2618@vkoul-mobl>
 <CAMuHMdVC_=V6z+8GubgDvWR37zZdr8f3Fqs-KYUYdZ+e=wYCyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVC_=V6z+8GubgDvWR37zZdr8f3Fqs-KYUYdZ+e=wYCyg@mail.gmail.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 19-02-20, 10:20, Geert Uytterhoeven wrote:
> Hi Vinod,
> 
> On Wed, Feb 19, 2020 at 10:18 AM Vinod Koul <vkoul@kernel.org> wrote:
> > On 17-02-20, 23:24, Geert Uytterhoeven wrote:
> > > On Mon, Feb 17, 2020 at 3:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > The caller is already holding the lock so this will deadlock.
> > > >
> > > > Fixes: 0b58828c923e ("DMAENGINE: COH 901 318 remove irq counting")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > This is the second double lock bug found using static analysis.  The
> > > > previous one was commit 627469e4445b ("dmaengine: coh901318: Fix a
> > > > double-lock bug").
> > > >
> > > > The fact that this has been broken for ten years suggests that no one
> > > > has the hardware.
> > >
> > > Or this only runs CONFIG_SMP=n kernels?
> > > This seems to be used in arch/arm/boot/dts/ste-u300.dts only, and
> > > CONFIG_ARCH_U300 is a ARCH_MULTI_V5 platform, which looks like
> > > it doesn't support SMP?
> >
> > Should we drop the driver then..?
> 
> Why? Because spinlocks are no-ops on SMP=n, and spinlock bugs thus don't
> affect the single platform using the driver?

That doesn't answer the question if anyone has a hardware and we have
users :)

Sorry I should have written better about hardware and testing
rather than cryptic reply which may have suggested about SMP :)

-- 
~Vinod
