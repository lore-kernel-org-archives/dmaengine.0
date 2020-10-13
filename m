Return-Path: <SRS0=FGCh=DU=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9326C433DF
	for <dmaengine@archiver.kernel.org>; Tue, 13 Oct 2020 07:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A2C820872
	for <dmaengine@archiver.kernel.org>; Tue, 13 Oct 2020 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602572484;
	bh=PWUXZUmAro4Vo+Y/6BQugd23hce3ESPaoJVUv8Ka70Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rGMZYoqNHFarn+XXy9L6247iWcPmxW0lSNLesLNVIFEz0OSiXFQa0YIZ3zplkRFlq
	 nAY1g+Y+Qk6lumxKcLRDvnNUKGEExulv4Ph+ylW2rXJIOPg072dO7T00Moexc6y/DF
	 cO97JFh9Wnhlojm9qN8qQ/lSeMDoZjL5A12zT3TI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389814AbgJMHBY (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 13 Oct 2020 03:01:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389813AbgJMHBX (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 13 Oct 2020 03:01:23 -0400
Received: from localhost (unknown [122.171.192.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6252C20797;
        Tue, 13 Oct 2020 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602572483;
        bh=PWUXZUmAro4Vo+Y/6BQugd23hce3ESPaoJVUv8Ka70Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XI7pwgxKzcz0QP/Y0FCCTMsRUx1Ku6JJRmeooDXal2SSvQgqSooRBYACoOE6Jaxto
         3VXFsmZAPvHbvRG4nS4RrR/qrJi8C0i3gBVod095u1g6TZw4/CPAmqFnssoq6jcKy8
         jzPXVVCPjDNXDrGeCXIHghFBRtSq+CV7GiGuKiJc=
Date:   Tue, 13 Oct 2020 12:31:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Sia, Jee Heng" <jee.heng.sia@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/15] dmaengine: dw-axi-dmac: support Intel KeemBay
 AxiDMA
Message-ID: <20201013070118.GN2968@vkoul-mobl>
References: <20201012042200.29787-1-jee.heng.sia@intel.com>
 <20201012135905.GX4077@smile.fi.intel.com>
 <BL0PR11MB3362A202A1D3BDC8C1CA41DBDA040@BL0PR11MB3362.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR11MB3362A202A1D3BDC8C1CA41DBDA040@BL0PR11MB3362.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 13-10-20, 05:49, Sia, Jee Heng wrote:
> > >
> > > This patch set is to replace the patch series submitted at:
> > > https://lore.kernel.org/dmaengine/1599213094-30144-1-git-send-email-je
> > > e.heng.sia@intel.com/
> > 
> > And it means effectively the bumped version, besides the fact that you double
> > sent this one...
> > 
> > 
> > Please fix and resend. Note, now is merge window is open. Depends on
> > maintainer's flow it may be good or bad time to resend with properly formed
> > changelog and version of the series.

yeah sorry I wont look at it till merge window closes

> [>>] Thanks. Will resend the patch set with v1 in the header.

Should this be v1, v1 was the first post, this would be v2!

Please use git format-patch -v2 to autogenerate version headers in
patches..

I thought Intel folks had internal review list to take care of these
things, is it no longer used..?

-- 
~Vinod
