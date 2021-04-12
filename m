Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA605C43616
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 16:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A54E3611AD
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 16:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244518AbhDLQsm (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 12 Apr 2021 12:48:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344382AbhDLQjl (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 12 Apr 2021 12:39:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 702F261220;
        Mon, 12 Apr 2021 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618245563;
        bh=JFIeqaNEA1qgNCWPtgiaJv2GoCKPOSrm5ivp0sQizTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YUIbvERJJyhCLQmD23XHwWFl98MkN6T8ACAT4kkW1QOzB1ITAdI6/+facx3CJUhbA
         pjeDZTPUjGNirchQm8dUISb9E0v/m0TvScSUaU33VmsLY0QS7PcHKjdtvoZaYdp/nx
         ztTnYzhGCMK9GeoE5o0JGjrnnwpRynGz1rsWMLbRMfAaoiqFRS15OyqcPchj6yZfOo
         GMibDGRNOYtw+04csqM5TZpguTrYxwPKR7ViKpdN1CQ/kw8OrEdYFLyA5MSp+wkoZ/
         +x69+QH7OLOV9bWrIvdQzn827McjHS4iboLhC1dChFilgYxUAgyYxiWtaMQyGa3Hhb
         4n+GRJG2yqEoA==
Date:   Mon, 12 Apr 2021 22:09:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: idxd: clear MSIX permission entry on
 shutdown
Message-ID: <YHR3txxybb+f7n8F@vkoul-mobl.Dlink>
References: <161824457969.882533.6020239898682672311.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161824457969.882533.6020239898682672311.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-04-21, 09:23, Dave Jiang wrote:
> Add disabling/clearing of MSIX permission entries on device shutdown to
> mirror the enabling of the MSIX entries on probe. Current code left the
> MSIX enabled and the pasid entries still programmed at device shutdown.

Applied, thanks

-- 
~Vinod
