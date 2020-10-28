Return-Path: <SRS0=0Nna=EE=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA42C55179
	for <dmaengine@archiver.kernel.org>; Thu, 29 Oct 2020 01:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CFEB20791
	for <dmaengine@archiver.kernel.org>; Thu, 29 Oct 2020 01:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933300;
	bh=72tdqQGYgx97kC78MmocZGiIQ8/htsbdM1NBjk0K1I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cgQomIdTrVDjLGNlbgtd2ctZO2XWj32ODbwLxji4p+Hk6Rk2WuXbSMs2l6xM76hBI
	 I9bzJYOXPPXuUd4ykQVY53obbRXY4L/bpIwG9iVmo/2VR5OeLh9dQjMYMKidqzNbXJ
	 sm+WVEgnY/BLqEzWySAfNIj7IS2NnCu4lKSnTAno=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404078AbgJ2BBk (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Oct 2020 21:01:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731505AbgJ1WRX (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C0A522281;
        Wed, 28 Oct 2020 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603864473;
        bh=72tdqQGYgx97kC78MmocZGiIQ8/htsbdM1NBjk0K1I8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WB/vvFCA/kWkNiO7Kr/jDWIp+xd3mah2esh2L9agVA3HcXraFS0jk60/OdL7mKvYI
         7HZzatctjYLdJLGQEqyk1kQDaMFzHGHd+0ZPF9rOdj9967mgDQLz6XLdZS4DK1Sahl
         Zlhr3mnDs6fAH9JHrPs70N3c4lVQO0EYFh3Fh0o0=
Date:   Wed, 28 Oct 2020 06:54:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sudeep Dutt <sudeep.dutt@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Vinod Koul <vkoul@kernel.org>, Sherry Sun <sherry.sun@nxp.com>,
        Ashutosh Dixit <ashutosh.dixit@intel.com>,
        Nikhil Rao <nikhil.rao@intel.com>
Subject: Re: [PATCH char-misc-next 1/1] misc: mic: remove the MIC drivers
Message-ID: <20201028055429.GA244117@kroah.com>
References: <8c1443136563de34699d2c084df478181c205db4.1603854416.git.sudeep.dutt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c1443136563de34699d2c084df478181c205db4.1603854416.git.sudeep.dutt@intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Tue, Oct 27, 2020 at 08:14:15PM -0700, Sudeep Dutt wrote:
> This patch removes the MIC drivers from the kernel tree
> since the corresponding devices have been discontinued.

Does "discontinued" mean "never shipped a device so no one has access to
this hardware anymore", or does it mean "we stopped shipping devices and
there are customers with this?"

> Removing the dma and char-misc changes in one patch and
> merging via the char-misc tree is best to avoid any
> potential build breakage.
> 
> Cc: Nikhil Rao <nikhil.rao@intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>

I like deleting code, can this go into 5.10-final?

thanks,

greg k-h
