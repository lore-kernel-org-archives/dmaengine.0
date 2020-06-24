Return-Path: <SRS0=BNS2=AF=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A106FC433DF
	for <dmaengine@archiver.kernel.org>; Wed, 24 Jun 2020 07:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F00920B80
	for <dmaengine@archiver.kernel.org>; Wed, 24 Jun 2020 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592984231;
	bh=LK7O6LV+35wmudbGCbNEfnocB+CY1ZD8BjhOqryJF40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aakTF7C2vKL/rssBmAtbbPWXiKznWghrHkhRPUE9PfmETOQuqI+BqtM70sLpJ8AL0
	 XGiY4W8gfpmh90ercdq6SmOS3JajM19rMZnaVMZb05Zka6/I7PwsET8TNEULzbYVQ/
	 q1UDB+PpAmxFoURT7IijSqRTW6W/Nh9lbV3n+GLA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389695AbgFXHhL (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Jun 2020 03:37:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389583AbgFXHhK (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 24 Jun 2020 03:37:10 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 533B7206E2;
        Wed, 24 Jun 2020 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592984230;
        bh=LK7O6LV+35wmudbGCbNEfnocB+CY1ZD8BjhOqryJF40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNjTx0Wi+UoSs2QxcYwdgy+8G0PpP25vN4kVdTszQYGU2URe8OSpi/co4hE+96f06
         W8Hkwd39sAu+PR6jZFJzrZRVnJye6mOqa9ntdaeA6GGUOcAuqSdoQ1r2wEb4jVjHjB
         3wtpNnSB4Jdg6qfkSHnHYchjBMcJKtzW++v1S934=
Date:   Wed, 24 Jun 2020 13:07:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Robin Gong <yibin.gong@nxp.com>, Peng Ma <peng.ma@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: fsl-edma: Add lockdep assert for exported
 function
Message-ID: <20200624073706.GN2324254@vkoul-mobl>
References: <1591877861-28156-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591877861-28156-1-git-send-email-krzk@kernel.org>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 11-06-20, 14:17, Krzysztof Kozlowski wrote:
> Add lockdep assert for an exported function expected to be called under
> spin lock.  Since this function is called in different modules, the
> lockdep assert will be self-documenting note about need for locking.

Applied all to fixes, thanks
-- 
~Vinod
