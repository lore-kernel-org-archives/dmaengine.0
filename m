Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82375C04AAF
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 04:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55551216B7
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 04:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558413578;
	bh=H7+dKgf9U1QiGInh5iVvhafZtmO+M7kgnQMPzeqYjo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eEnA67byP6QXBx/jlXVm6Atol1FypBn8+8vbuVw6qjw7TdLMYwpapGiw/2MihdlKm
	 Urf9a08rIu7W6sIGW99RryOoZ2IzYWuJyRlWMnulYuVMwFu6rmPXmfqW1cIlgclQLC
	 FyUCCUBp79e4S6UUdwAalo5BgXwDSd9QBjAEHqVo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfEUEjh (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 00:39:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:47032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfEUEjh (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 00:39:37 -0400
Received: from localhost (unknown [106.201.107.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9148421743;
        Tue, 21 May 2019 04:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558413577;
        bh=H7+dKgf9U1QiGInh5iVvhafZtmO+M7kgnQMPzeqYjo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KeQBu1tCKZLQG+03G9UbFYtHR9NW57lVMYWf7MPGLME2MSubFvEPCE14TsGk1cspd
         UGbdrXn/HEK1itT+UUVcGh51pJ9CQTO1Po6yIQ023X1hX8fVV4TgjPlB1mw5rCY31s
         hiUQ5/0VdmXfoL2hngULJKfmlbitS2/7OvEhCrQs=
Date:   Tue, 21 May 2019 10:09:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        dmaengine@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: stm32-dma: Fix redundant call to
 platform_get_irq
Message-ID: <20190521043933.GO15118@vkoul-mobl>
References: <1557215681-18541-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557215681-18541-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 07-05-19, 09:54, Amelie Delaunay wrote:
> Commit c6504be53972 ("dmaengine: stm32-dma: Fix unsigned variable compared
> with zero") duplicated the call to platform_get_irq.
> So remove the first call to platform_get_irq.

Applied, thanks

-- 
~Vinod
