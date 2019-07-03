Return-Path: <SRS0=4Ln5=VA=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14ECC0650E
	for <dmaengine@archiver.kernel.org>; Wed,  3 Jul 2019 18:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8ADA0218A0
	for <dmaengine@archiver.kernel.org>; Wed,  3 Jul 2019 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562179466;
	bh=xfJSqYCJZU7KFgHNfEk7t4GstsgDfEzAzjhkWqbmweo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DpwJ+rpGQJQDKmPqY6jB/WK/fw9wwmZ8gLtWY70nClFnmqveNjruLC/vWUpQyvYDo
	 FCOSjDUndVaQAGDLDwSkHc8VksGpFiXo873WsWRsJB00vH6PQ4VL0KPhCoUA0dBVfP
	 1FtEpwFs47h8UVEokGETyJ0CjvI/ks5khZ8gK7KE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGCSo0 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 3 Jul 2019 14:44:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbfGCSo0 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 3 Jul 2019 14:44:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DCD921852;
        Wed,  3 Jul 2019 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562179464;
        bh=xfJSqYCJZU7KFgHNfEk7t4GstsgDfEzAzjhkWqbmweo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qRcKxKfUjUhJG5hzUEGxgY1AKbWzhWnm9fbGLJBHHgDO40ynHczf8Ai0cgAoqh20x
         R6IvqsOtp/BJKwsnwtPrwDxpYTUvabfbkpJIzzKb8HKdP7DLybi+MZJ9u4JsxKHRmI
         6mvldrw134P0jc3OwigWc+g3LryAdVRXcKV4e3yg=
Date:   Wed, 3 Jul 2019 20:44:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Slaby <jslaby@suse.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        dmaengine@vger.kernel.org,
        "George G . Davis" <george_davis@mentor.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Fix .flush_buffer() issues
Message-ID: <20190703184422.GA14207@kroah.com>
References: <20190624123540.20629-1-geert+renesas@glider.be>
 <20190626173434.GA24702@x230>
 <CAMuHMdWuk7CkfcUSX=706f8b6YMFio7iwZg32+uXsyOKL68fuQ@mail.gmail.com>
 <20190628123907.GA10962@vmlxhi-102.adit-jv.com>
 <20190628125534.GB1458@ninjato>
 <20190628130200.GA11231@vmlxhi-102.adit-jv.com>
 <20190703173050.GA11328@kroah.com>
 <20190703181519.ifrmycrsrohcc2gf@x230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703181519.ifrmycrsrohcc2gf@x230>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Wed, Jul 03, 2019 at 08:15:19PM +0200, Eugeniu Rosca wrote:
> Hi Greg,
> 
> On Wed, Jul 03, 2019 at 07:30:50PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jun 28, 2019 at 03:02:00PM +0200, Eugeniu Rosca wrote:
> [..]
> > > I am doing this per-patch to allow patchwork to reflect the status of
> > > each patch on the linux-renesas-soc front-page. AFAIK patchwork ignores
> > > series-wide '*-by: Name <email>' signatures/tags.
> > 
> > I don't use patchwork :)
> 
> How do you then collect all the "{Reviewed,Tested,etc}-by:" signatures
> (each of which means sometimes hours of effort) in the hairy ML threads?
> Patchwork makes it a matter of one click.

I've been doing this for a very long time now, before patchwork was even
around.  It's pretty trivial to collect them on my own.

thanks,

greg k-h
