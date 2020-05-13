Return-Path: <SRS0=uSda=63=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38C0C433F8
	for <dmaengine@archiver.kernel.org>; Wed, 13 May 2020 15:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 417F32151B
	for <dmaengine@archiver.kernel.org>; Wed, 13 May 2020 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589381554;
	bh=Cxocxxjlh8HclAZR/lNU7FkEh0Xtsq9c7G0JwAnbsEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jCPC8x3g0HOhomH6QzFJ5StUDP+wbO46iBX+ha/p5OqR9Ot0k2j8Cu7JHvJWyO3fc
	 kA32rxYRkBBIkEX4SNPZ2BSwueyB1w8sUajVCp++qSRdmzVuYGUWm9QKBzmGqztwjV
	 KKBjLiB960bU/hPP5mPnTjJruJlyd0M/mk1nueHg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389065AbgEMOwb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 13 May 2020 10:52:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728345AbgEMOwb (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 13 May 2020 10:52:31 -0400
Received: from localhost (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14F4E20EDD;
        Wed, 13 May 2020 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589381550;
        bh=Cxocxxjlh8HclAZR/lNU7FkEh0Xtsq9c7G0JwAnbsEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNQMdr7K2j5oRwahDcwjCBo8rliDx0uJAZiwO4LUNwB2m2SpTHHZYOCrtyfDspFKZ
         tL9jkJrddURL7E4ZyDtfQGPzrBewgf8UfxyEeNCQ7GT1KOXCShYgb9XvCl8PhzWuse
         5zdMKwIxZJY5sN+jOO33iwrrk2lJs1GpvWET+iTo=
Date:   Wed, 13 May 2020 20:22:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] dmaengine: ti: k3-udma: Use PTR_ERR_OR_ZERO() to
 simplify code
Message-ID: <20200513145226.GJ14092@vkoul-mobl>
References: <1588757146-38858-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588757146-38858-1-git-send-email-zou_wei@huawei.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 06-05-20, 17:25, Samuel Zou wrote:
> Fixes coccicheck warnings:
> 
> drivers/dma/ti/k3-udma.c:1294:1-3: WARNING: PTR_ERR_OR_ZERO can be used
> drivers/dma/ti/k3-udma.c:1311:1-3: WARNING: PTR_ERR_OR_ZERO can be used
> drivers/dma/ti/k3-udma.c:1376:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Applied, thanks

-- 
~Vinod
