Return-Path: <SRS0=2hur=75=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08E6C433E0
	for <dmaengine@archiver.kernel.org>; Tue, 16 Jun 2020 15:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8420F207C4
	for <dmaengine@archiver.kernel.org>; Tue, 16 Jun 2020 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592322995;
	bh=R61SkJYIcVRhePEvug5Stic2Feh2A2ukFhd4hMM46ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Di0hCvLZ3Oc8eHiXoDgTMq0lMtepF73nyihzWCuapzhtKysL7j/ZiehlC3NT6mMo3
	 Xtnkbec/WwVZGhJJ/7g2pFWE3vwr7RIFxCRrGysskszXDb8WGiJUfLKU9nacQm0ETi
	 7xTen9IH3YS/37LMsXydgYEw4Wx8Izw7WeNq3FnA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732401AbgFPP4e (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 16 Jun 2020 11:56:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732037AbgFPP43 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 16 Jun 2020 11:56:29 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5613820882;
        Tue, 16 Jun 2020 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592322989;
        bh=R61SkJYIcVRhePEvug5Stic2Feh2A2ukFhd4hMM46ng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YcMKY1h8Jr+HNrxoq1euP2/3qW6zN66yyVUF+qtwAAT2tmK37sJLrfktMyGTlCxeE
         TtRe1wVWo32zVElQbw1pCY2rzDpxaH0UKs00vwHunD8zLQVc5m7H/IHlwnToJ5eA91
         nIzagknHD4uF7RbruCjtnP8iza96Aqo1FVzkyEwE=
Date:   Tue, 16 Jun 2020 21:26:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [PATCH 0/2] dmaengine: ti: k3-udma: Fixes for
 alloc_chan_resources
Message-ID: <20200616155625.GJ2324254@vkoul-mobl>
References: <20200527070612.636-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527070612.636-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 27-05-20, 10:06, Peter Ujfalusi wrote:
> Hi,
> 
> It turned out that udma_stop() can not be used to stop the channel which was
> left enabled during boot (missing cleanup in early boot) since it would initiate
> teardown. This is not supported on non configured channels.
> Simply reset the running channel instead fixes the issue.
> 
> While looking at this issue I have noticed that the cleanup path misses
> resources if the error happens early.

Applied, thanks

-- 
~Vinod
