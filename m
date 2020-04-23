Return-Path: <SRS0=w91c=6H=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3EFC2BA19
	for <dmaengine@archiver.kernel.org>; Thu, 23 Apr 2020 07:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B821D21569
	for <dmaengine@archiver.kernel.org>; Thu, 23 Apr 2020 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587626523;
	bh=U12rqlmXTaLrY3z2T7tWjVcCbQmMHqer0x+sCeBzUtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=z88XI3u12mJbdgCoijpZO0LLlGumW/p86bbafsFj3pRKOiR/YCbGfJ2R9IqMxHd+t
	 xVVLTh5P88z7CgAVG8NWO6W1JtXcua9qudMSpb5GrN6sksABr3OVOak3x9rE711BQx
	 oTMLtw/WFcMOAFY7SE9IcvlvHWs2G5qjYjhcdgbM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgDWHWD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 23 Apr 2020 03:22:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:58346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgDWHWD (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 23 Apr 2020 03:22:03 -0400
Received: from localhost (unknown [49.207.59.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E47D20736;
        Thu, 23 Apr 2020 07:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587626523;
        bh=U12rqlmXTaLrY3z2T7tWjVcCbQmMHqer0x+sCeBzUtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s3thZLOlkheO+B7irKilkc4PbWfubeLwSuTvIpeNBde3dKdf7pMW/lfgHRmHLQ1m9
         j434vm1b+UzCMRhQW58dpqtJX3WHrTG9vEf2/i0sPxpTSWJnzJg3ajyJfXdXJLtoJE
         kJC++T9qA3Yr4cEAASM0+UIG/EXOgkyWFLVlnq2U=
Date:   Thu, 23 Apr 2020 12:51:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     leonid.ravich@dell.com
Cc:     dmaengine@vger.kernel.org, lravich@gmail.com,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Allison Randal <allison@lohutok.net>,
        "Alexander.Barabash@dell.com" <Alexander.Barabash@dell.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dmaengine: ioat: removing duplicate code from
 timeout handler
Message-ID: <20200423072158.GD72691@vkoul-mobl>
References: <1587583557-4113-3-git-send-email-leonid.ravich@dell.com>
 <1587589761-32690-1-git-send-email-leonid.ravich@dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587589761-32690-1-git-send-email-leonid.ravich@dell.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 23-04-20, 00:09, leonid.ravich@dell.com wrote:
> From: Leonid Ravich <Leonid.Ravich@emc.com>
> 
> moving duplicate code from timeout error handling to common
> function.

Applied all, thanks
-- 
~Vinod
