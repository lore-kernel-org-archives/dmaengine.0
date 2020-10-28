Return-Path: <SRS0=uZPL=ED=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2154BC388F7
	for <dmaengine@archiver.kernel.org>; Wed, 28 Oct 2020 21:48:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6FBA2245A
	for <dmaengine@archiver.kernel.org>; Wed, 28 Oct 2020 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603921731;
	bh=yVEfc4+gOF4s/3xGZTQCBpdsAOxojMx9ZF/7nK6oM/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZmmM4JchG9jj+x6zsQsyLO9cYlsZkv9QlDoEj+VC3iv//UsDoZpL1O7k1AWEI5I8s
	 pe+pPDl0yYlnBuA7OrN0VWcU105QU8I6xJJ6B0hojCJjf0ni6vRGWZS5eJzABSJ89C
	 VykplETSfkgZ699fRLB8VCA1eeL8AaD4fFmXNKBo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgJ1Vsv (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727683AbgJ1VrX (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 28 Oct 2020 17:47:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9637C247FD;
        Wed, 28 Oct 2020 18:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603908538;
        bh=yVEfc4+gOF4s/3xGZTQCBpdsAOxojMx9ZF/7nK6oM/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E0YnPcnjOExKX6+eztVKyGMzzPpsfM8/XUjQvIDmiU3H8ekOh3AEAu/6VYxa7Yvxf
         Wmw2Jkck3TiDXj+B8Xr2j/07yhl0fmpFIIzW00vaKKUnjA0Npv7L47E9eFwmEOhxWV
         T6Bf/EknL7w8iqvyrUePpzRg3nJ/7Z0rM9BG4rf8=
Date:   Wed, 28 Oct 2020 19:09:49 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Dutt, Sudeep" <sudeep.dutt@intel.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sherry.sun@nxp.com" <sherry.sun@nxp.com>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "Rao, Nikhil" <nikhil.rao@intel.com>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH char-misc-next 1/1] misc: mic: remove the MIC drivers
Message-ID: <20201028180949.GB2831268@kroah.com>
References: <8c1443136563de34699d2c084df478181c205db4.1603854416.git.sudeep.dutt@intel.com>
 <20201028055429.GA244117@kroah.com>
 <f64a1f67781441c8ed48b991afbf8dd2f9030289.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f64a1f67781441c8ed48b991afbf8dd2f9030289.camel@intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Wed, Oct 28, 2020 at 05:22:01PM +0000, Dutt, Sudeep wrote:
> On Wed, 2020-10-28 at 06:54 +0100, Greg Kroah-Hartman wrote:
> > On Tue, Oct 27, 2020 at 08:14:15PM -0700, Sudeep Dutt wrote:
> > > This patch removes the MIC drivers from the kernel tree
> > > since the corresponding devices have been discontinued.
> > 
> > Does "discontinued" mean "never shipped a device so no one has access
> > to
> > this hardware anymore", or does it mean "we stopped shipping devices
> > and
> > there are customers with this?"
> 
> Hi Greg,
> 
> We are not aware of any customers of the upstreamed MIC drivers. The 
> drivers were upstreamed primarily to lay a foundation for enabling the
> next generation MIC devices which did not ship.

Ok, thanks for the explanation.

> 
> > > Removing the dma and char-misc changes in one patch and
> > > merging via the char-misc tree is best to avoid any
> > > potential build breakage.
> > > 
> > > Cc: Nikhil Rao <nikhil.rao@intel.com>
> > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
> > 
> > I like deleting code, can this go into 5.10-final?
> 
> Yes, we would prefer this goes into v5.10. I am hoping you can carry
> the Ack from Vinod and the Reviewed-by from Sherry but I can resend the
> patch with those updates in the commit message if required. I did
> verify that this patch passes allmodconfig and allyesconfig builds with
> your latest char-misc-next tree.

I can pick them up automatically, no worries, thanks!

greg k-h
