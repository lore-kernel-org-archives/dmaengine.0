Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD64C43616
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 09:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 389D761207
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 09:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239918AbhDLJSf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 12 Apr 2021 05:18:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:40790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241748AbhDLJRI (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 12 Apr 2021 05:17:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 945856102A;
        Mon, 12 Apr 2021 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618219010;
        bh=86BoBLYrY23WBuYIcQXOMybJGEerlk21BkMg1kOQbx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ca8YgaMob5ekZNYSAG/rZ/lh3xE7sEyETlzFG7mVrS5Dt3QaW7qgFdy2aKJAKsPwG
         iDTa1lrfMEFOj7fbGE75Kjfbm4UD9Y4zHUgWuNvTRN+VGFOpe9d799ikjsjmuIiZfp
         ZdkelSaDsuJxC5Ocr1KnHI12K2K1jIvZvZJZzIELeePwFBm4G0eayp2B3y485QeT3z
         uE07WpQM7OKQ9dSQNkkAoAu8xhzIcqZkgCUGYhMwicX3DB5ykFBD7buNt+pyE53QFs
         NWma3nNHuXpyhyzwduMju9ozpym544GbMMY3F/S21Z+dTkBcdri+vYuySRer6BJPba
         8up8ZGf2Q4SJw==
Date:   Mon, 12 Apr 2021 14:46:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: fix wq size store permission state
Message-ID: <YHQP/lah+pF2plXG@vkoul-mobl.Dlink>
References: <161782558755.107710.18138252584838406025.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161782558755.107710.18138252584838406025.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 07-04-21, 12:59, Dave Jiang wrote:
> WQ size can only be changed when the device is disabled. Current code
> allows change when device is enabled but wq is disabled. Change the check
> to detect device state.

Applied, thanks

-- 
~Vinod
