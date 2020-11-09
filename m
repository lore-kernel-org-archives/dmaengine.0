Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78A8C388F7
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 12:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C31920789
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604924712;
	bh=8G7ghePS1bDlhikQ1xbvG/dT3rCGlTM8MU7CGtiAtGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0Xt9jP+XTVawbzGLH/R4VObZHp+ZtWOvQSHrtvTfrnEkh57JjVxspQIy8G7Yf0rFh
	 3G8BsqBPa6RBp+RihBrTR9JlZGUDfF2LlJVXVicU//wE96IY4pAXq9f4aNsOed5biR
	 sC4ORN6HLUM7Jp8lewgyk6g5doLwS9XKY47bij3w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729516AbgKIMZM (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 07:25:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:43054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729507AbgKIMZL (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 07:25:11 -0500
Received: from localhost (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 876D5206CB;
        Mon,  9 Nov 2020 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604924711;
        bh=8G7ghePS1bDlhikQ1xbvG/dT3rCGlTM8MU7CGtiAtGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bdrmEmW/TOwd9Vp5f9Z8aACcGKEn9UgLO++CcWphKmoQMPaJ4Wt74vYnxHNkzY/OB
         nzK9aCeOdfGtPDtTm3GlmjSCeZvLSeDTqLxthVUhbojJVHWz5BW1lgFZa1kX1I1dSJ
         vTmiQVm1H4evMaL6QLugW9ZvriN7h18GD6vPNpcw=
Date:   Mon, 9 Nov 2020 17:55:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc:     dan.j.williams@intel.com, michal.simek@xilinx.com,
        nick.graumann@gmail.com, andrea.merello@gmail.com,
        appana.durga.rao@xilinx.com, mcgrof@kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH 0/3] dmaengine: xilinx_dma: mcdma fixes
Message-ID: <20201109122507.GP3171@vkoul-mobl>
References: <1604473206-32573-1-git-send-email-radhey.shyam.pandey@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604473206-32573-1-git-send-email-radhey.shyam.pandey@xilinx.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 04-11-20, 12:30, Radhey Shyam Pandey wrote:
> This patchset fixes usage of mcdma tx segment and SG capability.
> It also make use of readl_poll_timeout_atomic variant.

Applied, thanks

-- 
~Vinod
