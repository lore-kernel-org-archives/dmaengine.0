Return-Path: <SRS0=hjok=DM=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43920C4363A
	for <dmaengine@archiver.kernel.org>; Mon,  5 Oct 2020 04:48:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CDCC20829
	for <dmaengine@archiver.kernel.org>; Mon,  5 Oct 2020 04:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601873305;
	bh=SGOjSWwhGcmogDrwdKkFX5oRYyeI+Y/QRkCspjBS5r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=W0cbdIiIJB8fTAstpg6GrorOQE6bQ3BcEoLu+aZ8rnCwqQFsTh0BmkXqSn8F0P6Fc
	 AagkX6UhxPFE6YoOxdtMQpYnpfV8hPX2LRbHxUqMr6jQ/mWCfYlybsWXTKPT5dMrnU
	 86mjf8ZHHX8VLs9qOqgniNiotvfZtPZCq/RHyIgo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgJEEsY (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Oct 2020 00:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgJEEsY (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 5 Oct 2020 00:48:24 -0400
Received: from localhost (unknown [171.61.67.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 114E92080C;
        Mon,  5 Oct 2020 04:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601873304;
        bh=SGOjSWwhGcmogDrwdKkFX5oRYyeI+Y/QRkCspjBS5r0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=woriaVUARbn4mShDeLjKztVNBMpM0EX+hkCG2+gwTWXEbroKOv68TQ3lZ7NUXlALj
         2QkEnXDC2Sdmo2H/t6fc3g5kuSRFAdPeimPKFEwDRxKA+L+kXmoL3uHIvHF3evlm4v
         ddUjuDheZnSgxwU0F2XlHl26MNajnQxbaZoH5ZVY=
Date:   Mon, 5 Oct 2020 10:18:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        kernel-janitors@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/14] dmaengine: sh: drop double zeroing
Message-ID: <20201005044819.GJ2968@vkoul-mobl>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-5-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600601186-7420-5-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 20-09-20, 13:26, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)

Applied, thanks

-- 
~Vinod
