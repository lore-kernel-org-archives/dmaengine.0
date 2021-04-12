Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98521C433B4
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 07:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 566696120B
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 07:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236921AbhDLH63 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:58:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:52234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236918AbhDLH6X (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 12 Apr 2021 03:58:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C5C160231;
        Mon, 12 Apr 2021 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618214286;
        bh=7mRlUL0gS55bWyVLzUMbepM1sxpQpFuyKjRiczfRwOI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qK/pdf6Ru1I3K42O381uZ6+hnx/eGc/zkpXZcJz71i5axeLExdvbdpp7ihCzDsGMe
         auIkB1Mjr6W7dw29dQiOUFdNbWpWomMfL3RakaA/JZqKwXrnkjdDpAKq3T9awviViu
         nHdXNttD/dUjKyOuRscSW93R04HTCx++GJ8ctZ/xMZTfnMphWVQKQCF+p7s/s9fqm/
         /pzTgUntacV0w9daI4Z95UIvgLoqE6gsrdqsJjKXVE19/ZRds6YnPL173967mb/BQh
         1Y9oN0ZG0qpW+rDqwQnLUwYoxCyB9QdPYVbhS9pbm+R0HAe/nG4pIgi2Gl/+FAIrvn
         NAZP26gYNAE0A==
Date:   Mon, 12 Apr 2021 13:28:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Sanjay Kumar <sanjay.k.kumar@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix clobbering of SWERR overflow bit on
 writeback
Message-ID: <YHP9isd9FhdwkFXy@vkoul-mobl.Dlink>
References: <161352082229.3511254.1002151220537623503.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161352082229.3511254.1002151220537623503.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-02-21, 17:13, Dave Jiang wrote:
> Current code blindly writes over the SWERR and the OVERFLOW bits. Write
> back the bits actually read instead so the driver avoids clobbering the
> OVERFLOW bit that comes after the register is read.

Applied, thanks

-- 
~Vinod
