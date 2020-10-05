Return-Path: <SRS0=hjok=DM=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9BAC4363A
	for <dmaengine@archiver.kernel.org>; Mon,  5 Oct 2020 04:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C48B620848
	for <dmaengine@archiver.kernel.org>; Mon,  5 Oct 2020 04:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601873039;
	bh=NyIPq2qrlKxq27v9Ess1X+z0nqi4ab82aLZbHW2g8q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AkKRtt1ToKw3/k778WUh5m4zrEYg1DRsPm0vp4rO07rd55FbqVG24XskibrhUXF9G
	 mqXE3tQ7D31Dr+EQ6xyjw0450OIY0gBwMC2Z109rBqIXkQN9GUR+ZuzYoVrVFmLhNv
	 QvKPRfYHezyleu3D0kXdyvgGcvrLrXyRRlYUrk1M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgJEEn7 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Oct 2020 00:43:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgJEEn7 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 5 Oct 2020 00:43:59 -0400
Received: from localhost (unknown [171.61.67.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E5162080C;
        Mon,  5 Oct 2020 04:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601873039;
        bh=NyIPq2qrlKxq27v9Ess1X+z0nqi4ab82aLZbHW2g8q8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qTnVsaMxt+bOICcR8V3/KsWckd7VF61FQv3S/NUP9VVvdXL92UxnYpAIEVZyVAu5R
         Pit35+Toc0wG5f7muOaHi3jX4lEj93uktUzENeuW9AZsP27if8ojKKqHyBMrKYl8JC
         HxpiP9RqUqp+jfpz0SkaRdjojEKcoEH10P4/rNcY=
Date:   Mon, 5 Oct 2020 10:13:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Qilong Zhang <zhangqilong3@huawei.com>
Cc:     dan.j.williams@intel.com, peter.ujfalusi@ti.com,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH -next v2] dmaengine: ti: k3-udma: use
 devm_platform_ioremap_resource_byname
Message-ID: <20201005044354.GH2968@vkoul-mobl>
References: <20200921093701.102208-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921093701.102208-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 21-09-20, 17:37, Qilong Zhang wrote:
> From: Zhang Qilong <zhangqilong3@huawei.com>
> 
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.

Applied, thanks

-- 
~Vinod
