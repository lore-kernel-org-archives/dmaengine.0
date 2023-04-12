Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0BFC77B6F
	for <dmaengine@archiver.kernel.org>; Wed, 12 Apr 2023 17:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbjDLRPd (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 12 Apr 2023 13:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjDLRP0 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 12 Apr 2023 13:15:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7C37AB8;
        Wed, 12 Apr 2023 10:15:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9624637AD;
        Wed, 12 Apr 2023 17:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DCAC433D2;
        Wed, 12 Apr 2023 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681319704;
        bh=zlbdGrALDztjrTEIW/OH9aRgfbK21Wz9YdCzO/M3rko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SxOiGEJuyXgAx0igTzc4pFMiqsXblpeBM3xM3WPXzxXr1P4pCV3i9J6hxTdxdLOqr
         JzLqK0GejqJXRyECSDgk2pAmOtadI6KnBavLVMHGJxGnf8jeDngA86PNlBPcMLTtpf
         CQSjsuy3++Kv9xL/HoK6UZjobB1T1YUSv8luGtZBOLpiQkZJmq3MTrCExIM029F7hh
         O9uucWlg5tRJlCIWhBXqu1o3Z3FoE3QtvdRJR89990IhWPhBrLqkZMg79SF2u/GH/n
         Exe81tRKtssVrVt2zVIn4x4VHgvHybF6KFPN9gW9pZpBgOLQEJgv+ouN3GhiaBs1A4
         ypU6+8twOtZyw==
Date:   Wed, 12 Apr 2023 22:45:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shunsuke Mie <mie@igel.co.jp>
Cc:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: dw-edma: Fix to change for continuous
 transfer
Message-ID: <ZDbnFEsmmeOrtP0v@matsya>
References: <20230411101758.438472-1-mie@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411101758.438472-1-mie@igel.co.jp>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 11-04-23, 19:17, Shunsuke Mie wrote:
> The dw-edma driver stops after processing a DMA request even if a request
> remains in the issued queue, which is not the expected behavior. The DMA
> engine API requires continuous processing.
> 
> Add a trigger to start after one processing finished if there are requests
> remain.

Applied, thanks

-- 
~Vinod
