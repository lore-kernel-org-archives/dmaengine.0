Return-Path: <SRS0=zPRf=4B=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DD2C2BA83
	for <dmaengine@archiver.kernel.org>; Thu, 13 Feb 2020 14:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CA6424650
	for <dmaengine@archiver.kernel.org>; Thu, 13 Feb 2020 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581605213;
	bh=1RjZacEsDOra88X+LYFZXFaWaOUqfNWN3gyjAVvD6Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jrgs4yDtbWHORm4LQhJocOxIn5fchdx3krvJuCuH9YDtSixvOo6laDp+PjUrhMP5U
	 jbMdLa4gcENGkpGJj69uWNFKuOTxAxfOGTKOUl9iLd0M4y4h7S2G4j+Md8k+L8N5S6
	 dzAxqV5ECYStlw+I3o7f8I4yU5qUkA4M+uDICyPo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgBMOqx (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 13 Feb 2020 09:46:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:58264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgBMOqw (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 13 Feb 2020 09:46:52 -0500
Received: from localhost (unknown [106.201.58.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88EEB2073C;
        Thu, 13 Feb 2020 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581605212;
        bh=1RjZacEsDOra88X+LYFZXFaWaOUqfNWN3gyjAVvD6Ec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XRXD/8LqIMboCTmSpmPyK8eA0bU2024whimKpxS5YVDSPryCmLL4lCzTCJJZAzolB
         ren4HKAOjy34SDFWWp8CW8V/d68+RhvyR/XxZAg7M5SEyLEi5wHbrKEL0pLr8rfZmu
         YEug+2D+slHbOWfrxaVHYSQMYrsumduJAci1UlKc=
Date:   Thu, 13 Feb 2020 20:16:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: bcm-sba-raid: Replace zero-length array with
 flexible-array member
Message-ID: <20200213144648.GM2618@vkoul-mobl>
References: <20200213003703.GA4177@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213003703.GA4177@embeddedor.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-02-20, 18:37, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.

Applied, thanks

-- 
~Vinod
