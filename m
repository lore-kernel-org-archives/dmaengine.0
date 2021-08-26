Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9E6C432BE
	for <dmaengine@archiver.kernel.org>; Thu, 26 Aug 2021 16:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6062C61040
	for <dmaengine@archiver.kernel.org>; Thu, 26 Aug 2021 16:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhHZQfe (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 26 Aug 2021 12:35:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:49096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhHZQfd (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 26 Aug 2021 12:35:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B14660FC0;
        Thu, 26 Aug 2021 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629995686;
        bh=dCGAPXc6Mw1jmXz1RGjogeyHjyBb7KuRCJVoEWSsudg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mRK49krWEUfp7hFoTj0Ww3moqTX9/KBeqd5c/+AMqNklnK/7bELvbkzunVQ4F5Im3
         9hUBXKMoxnpt/UWaqJkt+CG+WKJ9l9If9q+kfIH4X7QF9kuHLfT6o57Qc6LXrwB3Qq
         RyyBKDuPDi5RUxasRvzUxntG/hTwcQgpn6vza+/tZiTnhsY2N2q5ajMHjqRhgXjY5r
         bGL7RfoRkgP0jJu/FATmyrTcruPxDK7JoGOhxPOmbwwKVqDsqmTWjUDkMbUJxd1HET
         JiBcBd37C/DRw+8tHIRfLLi4T1ahAiCyNFB8OBSqiZ6lO9KcHxBvT/a03dElmW7f/P
         aW4AViQFWb9Gw==
Date:   Thu, 26 Aug 2021 22:04:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: remove interrupt disable for cmd_lock
Message-ID: <YSfCos2mZ+Bv0DiX@matsya>
References: <162984027930.1939209.15758413737332339204.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162984027930.1939209.15758413737332339204.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-08-21, 14:24, Dave Jiang wrote:
> The cmd_lock spinlock is not being used in hard interrupt context. There is
> no need to disable irq when acquiring the lock. Convert all cmd_lock
> acquisition to plain spin_lock() calls.

Applied, thanks

-- 
~Vinod
