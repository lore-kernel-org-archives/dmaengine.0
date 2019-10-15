Return-Path: <SRS0=cP/1=YI=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69696C10F14
	for <dmaengine@archiver.kernel.org>; Tue, 15 Oct 2019 10:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C824217F9
	for <dmaengine@archiver.kernel.org>; Tue, 15 Oct 2019 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571134386;
	bh=n7OWT8GOlrrap2ubPSUmrLOHz9qRkP7hrTDjFgpgwKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=L/nx9RsRc6P5ZXxNz43jPEDF0Jnfx6FTgZR9x2UzM/Y9+GrWIQ6oTyZ0rjjMGzdv9
	 Z0Os0wGb61lX+W2y1ekUeRi58mWdx5bJWCO7EgYuW7YFtP/8qUmxlafHPAAa1wmuR0
	 qA9JYnwqASLArgBDxGC528/0sBHPejmatQXD91rA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfJOKNG (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 15 Oct 2019 06:13:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727504AbfJOKNF (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 15 Oct 2019 06:13:05 -0400
Received: from localhost (unknown [171.76.96.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E9E02089C;
        Tue, 15 Oct 2019 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571134385;
        bh=n7OWT8GOlrrap2ubPSUmrLOHz9qRkP7hrTDjFgpgwKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zWPfxmkJpB5c4VsK8EtOuIUDK178Rm8VRjAzHScp9lGfJopCJhwomVYYZiyzImQ6n
         ZVgemgPfxQiez4ls1o9SboDy9fFxbrINWJfnOF/ebt2Ts1juDECSpxtQj1DnzS2i81
         kDr+PWtt44o0sLLdtmb6Xdpf3tHRW/Dfv9fU9bEA=
Date:   Tue, 15 Oct 2019 15:43:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com,
        dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sprd: Change to use
 devm_platform_ioremap_resource()
Message-ID: <20191015101300.GR2654@vkoul-mobl>
References: <1af3efdac3b217203cace090c8947386854c0144.1569554639.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af3efdac3b217203cace090c8947386854c0144.1569554639.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 27-09-19, 11:29, Baolin Wang wrote:
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together, which can simpify the code.

Applied, thanks

-- 
~Vinod
