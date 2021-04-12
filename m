Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D90C433ED
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 07:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28AB96121F
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 07:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236808AbhDLH4n (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:56:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:52010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235386AbhDLH4l (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 12 Apr 2021 03:56:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAFFD6121F;
        Mon, 12 Apr 2021 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618214183;
        bh=4OnDbC30lXLayCkKm4w01TyimA7GvybCci23suSZ0BA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QtQyHkJpaPDqBHw1plp7HZMvepc/oxNaC4gzOKV2AKCisr6QHvYP8QuKY35sb6/cO
         9DPGxmhdHs85FhVFDp9zH8JyPW7ppYcfuOjhN80zYP/VhC5kvCcU85EBeDGuihfPEi
         PvdTOkp/28KJljqBI+RZ5jdW2wP/jMpihLasBV30fOo1L1k5oyiKoioAyQglgN9ktC
         HPv9Ne9BoQUMaS+jyTKqCX1qOAHOZnKx1qAeXbW2igFTghJuQsmNh/JfdmflL3wjq9
         vr7tmh73QFrDvb/TNfNcCpMU4BqmWZ4BJhVX6KtMJ4RumIjOky7loNDJm8Y93H+pRO
         OAwNPATg0dUSA==
Date:   Mon, 12 Apr 2021 13:26:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Nikhil Rao <nikhil.rao@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: fix delta_rec and crc size field for
 completion record
Message-ID: <YHP9I4WT14uFU9aj@vkoul-mobl.Dlink>
References: <161645618572.2003490.14466173451736323035.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161645618572.2003490.14466173451736323035.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 22-03-21, 16:36, Dave Jiang wrote:
> The delta_rec_size and crc_val in the completion record should
> be 32bits and not 16bits.

Applied, thanks

-- 
~Vinod
