Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F38FC433F5
	for <dmaengine@archiver.kernel.org>; Mon, 18 Oct 2021 06:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AB40610A6
	for <dmaengine@archiver.kernel.org>; Mon, 18 Oct 2021 06:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhJRGhR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 18 Oct 2021 02:37:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:39638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhJRGhQ (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 18 Oct 2021 02:37:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5292A610E8;
        Mon, 18 Oct 2021 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634538905;
        bh=/8AGKSuQdmYL1uNB10YZZWx0sqpwRvR+1t36Wfhd20A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IkZX7wuheKb7+I4ccW5WRkZjISGfVSU0izjQjbblipL5lWiIUbXKBVik7feqC9ha0
         PBTjDCvwMRMpLz938UsbSiPmSM4c9ABr4CvgOwCwqrS02g+Vr6N26pEOUECX78exL4
         NBUafDeqNyzweOyhTcaTwXi+U1bxyFwwE0qd8gXDlD0qwpI9z2D6mCcwbmJAOgbzol
         8otWlff3UIYdBcOMY3+BuBbYp0u6E+K9JMLjtGFuN/WlfVcjF0BdqkmGAT6vAIBddf
         Py+qNiA1apRnCKElPmd10xCsjFPkexmqvWJ1+YJXiZxanZGBMXbD+jfvtodBRW6OvO
         4EMubcIl7mneg==
Date:   Mon, 18 Oct 2021 12:05:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: remove gen cap field per spec 1.2 update
Message-ID: <YW0VlQtg/QWIWJDD@matsya>
References: <163406167978.1303649.1798682437841822837.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163406167978.1303649.1798682437841822837.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-10-21, 11:01, Dave Jiang wrote:
> Remove max_descs_per_engine field. The recently released DSA spec 1.2 [1]
> has removed this field and made it reserved.

Applied, thanks

-- 
~Vinod
