Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABA7C2D0A3
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 150BA20789
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604922481;
	bh=+1jUO5zVW1SKw9KmRQ1CIOboAVSFsXPM+3hRXA2kH1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BvKjgN0ZaKXkzYVXfnxRLGI7bhwnyT0Ds8fxusrl8DXzrYgFXwC0lDo3YJcvJlLE6
	 IFH/sU73sS0132qS4oy+pxvKO6/AfZoZMjNwcWqwin5WCds/Me28G11Dk2z7Syb4wX
	 vNThYRgmVn+VOq1YWGTcajeUXRUoWRiuGASS6450=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgKILsA (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:48:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:35766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgKILsA (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 06:48:00 -0500
Received: from localhost (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23D65206ED;
        Mon,  9 Nov 2020 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604922480;
        bh=+1jUO5zVW1SKw9KmRQ1CIOboAVSFsXPM+3hRXA2kH1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zVwZth8NXMO8b+9mGaA5fgP25EbPZF6L2i+JLJFcXq5+XIE1AYCaoEWCwwto6ejRt
         iJrxXSW7bA7E58hADPZ40KaFzGo8YkpdcV9LtNAlhoYPHMJcZafuNN86hU/T0mBP5T
         j5iqC3vl0+jPfWQXNyGmPJvHFHR7XPwVAJXKVjug=
Date:   Mon, 9 Nov 2020 17:17:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Update calculation of group offset to
 be more readable
Message-ID: <20201109114755.GI3171@vkoul-mobl>
References: <160407294683.839093.10740868559754142070.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160407294683.839093.10740868559754142070.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 30-10-20, 08:49, Dave Jiang wrote:
> Create helper macros to make group offset calculation more readable.

Applied, thanks

-- 
~Vinod
