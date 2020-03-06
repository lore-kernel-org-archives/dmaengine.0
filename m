Return-Path: <SRS0=Ziga=4X=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB23C10DCE
	for <dmaengine@archiver.kernel.org>; Fri,  6 Mar 2020 13:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C55FA20848
	for <dmaengine@archiver.kernel.org>; Fri,  6 Mar 2020 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583501719;
	bh=gIboAinAdMo9JMZauS/rqqTvcKm62TrUHeVJSqCWbZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Nc32JmYVwtsqMBoiChCTnFl8/muaMo1fXrHOQmKgzR5CVtJ5tY60r0ltKOmMoXPkf
	 qHhNgZYtpC07noCXyDZHystRVucvzfAu+qM7ulrgTbo5AJvzL5Td3I91vPj6vYYfro
	 919l8mF+gPzUjSEYQBSKr1VqY/sxaQW94HdfS5Hc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgCFNfT (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 6 Mar 2020 08:35:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:55392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgCFNfT (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 6 Mar 2020 08:35:19 -0500
Received: from localhost (unknown [122.178.250.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EA80206D5;
        Fri,  6 Mar 2020 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583501718;
        bh=gIboAinAdMo9JMZauS/rqqTvcKm62TrUHeVJSqCWbZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iLkZvAMftEO2UKFz5G/ueo7JPm5De8uCg8meSV5ozOnZOl4tDHukD9DEKQYeOvHnP
         YPvP3cOm8EhE4kSyk8yh3Z5tvSFppWokyNT7vb9lTstN9h52ukmcMiC6g3mD00AEpr
         hZNJpUYX3IFjKKqScDSV4tWC5ff1jzWtzsg/Am1k=
Date:   Fri, 6 Mar 2020 19:05:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     dan.j.williams@intel.com, peng.ma@nxp.com,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] dmaengine: fsl-dpaa2-qdma: remove set but not used
 variable 'dpaa2_qdma'
Message-ID: <20200306133514.GH4148@vkoul-mobl>
References: <20200303131347.28392-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303131347.28392-1-yuehaibing@huawei.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 03-03-20, 21:13, YueHaibing wrote:
> drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c: In function dpaa2_qdma_shutdown:
> drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c:795:28: warning: variable dpaa2_qdma set but not used [-Wunused-but-set-variable]
> 
> commit 3e0ca3c38dc2 ("dmaengine: fsl-dpaa2-qdma: Adding shutdown hook")
> involved this, remove it.

Applied, thanks

-- 
~Vinod
