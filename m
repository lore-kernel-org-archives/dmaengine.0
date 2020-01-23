Return-Path: <SRS0=bLat=3M=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DFFC2D0DB
	for <dmaengine@archiver.kernel.org>; Thu, 23 Jan 2020 11:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 749D624673
	for <dmaengine@archiver.kernel.org>; Thu, 23 Jan 2020 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579779242;
	bh=Ii7+gflALb++Ih795G9LtBEWh6vSlXtgVEOCb71c1zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Eemf91oLth5PKHA9kl1Ho1l7jEWwHWgWkDNkmtORXDA1WB3gpEM/rI1BJPaqM6rmb
	 RaxMTwbMvBIUCMRLKCMoB877gosmi3BTrpNGzKX6fVEFrjcodSzLZyEyF/NrxR1MTT
	 WGywFh0CPHvchnkJpzpSW87AU6fOv3GkpB6/nFms=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgAWLeC (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 23 Jan 2020 06:34:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:47006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgAWLeC (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 23 Jan 2020 06:34:02 -0500
Received: from localhost (unknown [106.200.244.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82F3E24125;
        Thu, 23 Jan 2020 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579779241;
        bh=Ii7+gflALb++Ih795G9LtBEWh6vSlXtgVEOCb71c1zI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C4TkXuqYssMBiTVdDrNWu68FalhaJ8fVrj1Jn11SQVp+taCp83aQ0XE1wAPhqHKSn
         8YJGY8R0ozGYCJ6kh4qA5inasjREbCXXQ+Ys9PsQlbpaQ0et+tdP2L0nUNHh/iMixq
         OSeBLpvob1sZCPxIy6kx/qtBzRYw/5Jir1eacN0k=
Date:   Thu, 23 Jan 2020 17:03:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] dmaengine: ti: k3-udma: fix spelling mistake
 "limted" -> "limited"
Message-ID: <20200123113357.GW2841@vkoul-mobl>
References: <20200122093818.2800743-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122093818.2800743-1-colin.king@canonical.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 22-01-20, 09:38, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are spelling mistakes in dev_err messages. Fix them.

Applied, thanks

-- 
~Vinod
