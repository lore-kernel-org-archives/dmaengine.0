Return-Path: <SRS0=0eZt=4Q=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF113C3F2CF
	for <dmaengine@archiver.kernel.org>; Fri, 28 Feb 2020 06:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82072205C9
	for <dmaengine@archiver.kernel.org>; Fri, 28 Feb 2020 06:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582870779;
	bh=TaGWNx+94xPOzTUcvMwtuFNzOyRhSX5OsWuOPwk5R5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ocq+uUjSf8zDSqPsSdJBbJPznO7hjt15NRbJQpenFuQ+O9tIjYbUkEoDSphdqovfD
	 7pUN0mOYu/oamcACzeKGjZc/q6JamMtS4O4+MJ8/dSf/3NXfDQHF7voW14qVw0Sb3B
	 iNnUI9BfIOnZeE9ZuDzq/bcwSoADytiIcLsfuV5w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgB1GTj (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 28 Feb 2020 01:19:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:53700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgB1GTi (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 28 Feb 2020 01:19:38 -0500
Received: from localhost (unknown [122.182.215.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9ECEA205C9;
        Fri, 28 Feb 2020 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582870778;
        bh=TaGWNx+94xPOzTUcvMwtuFNzOyRhSX5OsWuOPwk5R5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RuCB4V4h8GMWh9JM9++8a0bdLvvRBN/yUjvfgZ+m1sxnB1BdZJFVJLnOKF1wr1WtL
         ww+5Ab8t3cjYMUWTfCs8DK9D1qscdIyQfvnBMWmQLZEquPl0oUn5qvTzuNbeBInR/H
         JxGyQVkeZGWHVBSWFE8ZiaghElfev+af/d9I0wtA=
Date:   Fri, 28 Feb 2020 11:49:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: remove set but unused 'rc'
Message-ID: <20200228061934.GA4148@vkoul-mobl>
References: <20200225081459.4117512-1-vkoul@kernel.org>
 <701657fb-bba5-2733-05ef-fa181d562223@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <701657fb-bba5-2733-05ef-fa181d562223@intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 25-02-20, 09:14, Dave Jiang wrote:
> 
> 
> On 2/25/20 1:14 AM, Vinod Koul wrote:
> > The driver assigns result of check_vma() to rc and never checks the
> > result, so remove the assignment
> > 
> > drivers/dma/idxd/cdev.c: In function ‘idxd_cdev_mmap’:
> > drivers/dma/idxd/cdev.c:136:6: warning: variable ‘rc’ set but not used [-Wunused-but-set-variable]
> >    136 |  int rc;
> >        |      ^~
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > 
> > Dave, if you want the result of the check_vma() to be checked, feel free to
> > send the patch for that
> 
> Yes I will send a fix. Mistake from several code merges. Oops.

Ok, no issues
-- 
~Vinod
