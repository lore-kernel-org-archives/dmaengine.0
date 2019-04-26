Return-Path: <SRS0=bl+G=S4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD53BC43219
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:53:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E466208C3
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556279630;
	bh=QY853IY9k74Ed/so1atOlKzBiqTXys6WIbsMjXz6wyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Bdqr2BndWMo54+fr3hJEQ2oU5DobQ0vvJ3EYqMfDn/H1W7T+1GoAiwJtWXExcqxEA
	 xJHQXSvPQqQ2Nm/uow1HRyV+SztQuY67r/XC10x6dEx46quoWiNIdZRU+HWMe1B4JP
	 2hkw2pV2CA2fgioXVx2w6F0Nh41Dw9T3xEnu7RD0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfDZLxu (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 26 Apr 2019 07:53:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfDZLxu (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 26 Apr 2019 07:53:50 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EBA6206C1;
        Fri, 26 Apr 2019 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556279629;
        bh=QY853IY9k74Ed/so1atOlKzBiqTXys6WIbsMjXz6wyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kq0huFpc9iIFvcUfBI06TfwUhS48P1Y626LbtH5Feimvn1W+eL/0lUNAhqVJRQDDf
         acWpKGyG8raeCLpz8GCe5kfcKjOgfVWZpQYnveF/cf1rFbmgnXyQWg+PW67LnDLE24
         o87iaiyHa3c7h/IkgXqurjtw6/I4HOlczvS8jSO4=
Date:   Fri, 26 Apr 2019 17:23:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Simon Horman <horms@verge.net.au>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        HIROYUKI YOKOYAMA <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
Message-ID: <20190426115343.GY28103@vkoul-mobl>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
 <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
 <20190411151756.GC30887@bigcity.dyn.berto.se>
 <CAMuHMdXLM0hkUva4AukBpYy+=mRQ_tWT4XCGb=ZGbuT5nYMzjA@mail.gmail.com>
 <OSBPR01MB1733615712FC0F8271580D8BD83D0@OSBPR01MB1733.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB1733615712FC0F8271580D8BD83D0@OSBPR01MB1733.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190426115343.dDMwWvKDsX4ID0TpKyL1XDaxioqC44BZXlazzo9BaxE@z>

On 25-04-19, 03:52, Yoshihiro Shimoda wrote:
> Hi Geert-san,
> 
> > From: Geert Uytterhoeven, Sent: Wednesday, April 24, 2019 9:22 PM
> > 
> > Hi Niklas, Shimoda-san,
> > 
> > On Thu, Apr 11, 2019 at 5:18 PM Niklas Söderlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > > On 2019-04-11 10:49:37 +0200, Simon Horman wrote:
> > > > On Wed, Apr 10, 2019 at 08:26:57PM +0200, Niklas Söderlund wrote:
> > > > Not strictly related, but is it appropriate to:
> > > >
> > > > 1. Move this driver and drivers/dma/sh/usb-dmac.c to drivers/dma/renesas/
> > 
> > That may make sense...
> > 
> > > > 2. Remove drivers/dma/sh/sudmac.c which appears unused
> > >
> > > I let someone with a better grasp of history answer this one. From my
> > > side removing drivers which are unused seems like a good idea :-)
> > 
> > There seem to be some (half-baked?) interaction between sudmac.c and
> > drivers/usb/gadget/udc/r8a66597-udc.c and drivers/usb/renesas_usbhs/fifo.c.
> > These don't seem to be used at all on Renesas ARM platforms, but
> > CONFIG_USB_R8A66597_HCD is enabled in shmobile_defconfig and
> > multi_v7_defconfig?
> > 
> > Shimoda-san: can you please enlighten us?
> > Thanks!
> 
> Sure.
> 
> - SH4A / sh7757 has SUDMAC. (any other Renesas ARM platforms don't have it).
>  # sh7757 is not public product though...
> - At first, I added this SUDMAC support into r8a66597-udc.
> - But, our direction is changed by some reason. So, we use renesas_usbhs driver anyway.
> - The renesas_usbhs supports dmaengine, so I added dma/sh/sudmac driver.
> - However, for some reasons (maybe I'm busy for other projects?),
>   I didn't add using the sudmac support into arch/sh/kernel/cpu/sh4a/setup-sh7757.c.
> - So, no one uses both r8a66597-udc and sudmac now.
> 
> From 2013 (added the sudmac driver) to now, since no one integrated the sudmac for sh7757,
> I think we can remove the driver.

And where is the removal patch :)

-- 
~Vinod
