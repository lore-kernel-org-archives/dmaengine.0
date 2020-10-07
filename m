Return-Path: <SRS0=s11Q=DO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9126C4363C
	for <dmaengine@archiver.kernel.org>; Wed,  7 Oct 2020 07:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6960C207EA
	for <dmaengine@archiver.kernel.org>; Wed,  7 Oct 2020 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602054567;
	bh=bnklQ8l6OX/FmQ4nvdW9WWtkTWuJOx4P1YWiA+21SLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0CJRmLrr3tyyh+0Ddg1dXLFAXWArro+lpgg5irBvhIFFJqV1KRCxB5V5i0+A8R8Ua
	 fl10Fnbz4XmAXBIX8P1cwo4SQD807S6vdjF8P+QpCvNqnnhCQL4pUUKAQa/RByZFD/
	 N3oW2xt8jsqVHx5ogebD6BhVisaokmdIHF5srVE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgJGHJ1 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 7 Oct 2020 03:09:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgJGHJ0 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 7 Oct 2020 03:09:26 -0400
Received: from localhost (unknown [122.171.222.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FF1420797;
        Wed,  7 Oct 2020 07:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602054566;
        bh=bnklQ8l6OX/FmQ4nvdW9WWtkTWuJOx4P1YWiA+21SLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GAeHkLcVjZBwcjpt1dSuWHaFY3yl56vmO1w2ms15u0Se7+ik1/TULsucWUxGbRZzG
         P/X8XH9aVCDclJpxtLBjcZTaOZnKI81Yr3/4ams8/G6JbIk6fRV/bbdKYADei2A4eo
         MhstyoLQMOlvhHbLbFaa1nGI/JJHWEJF3MsZ/Knc=
Date:   Wed, 7 Oct 2020 12:39:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Allen Pais <allen.lkml@gmail.com>
Cc:     green.wan@sifive.com, hyun.kwon@xilinx.com,
        dmaengine@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: Re: [PATCH 1/2] dmaengine: sf-pdma: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20201007070922.GU2968@vkoul-mobl>
References: <20201006050458.221329-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006050458.221329-1-allen.lkml@gmail.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 06-10-20, 10:34, Allen Pais wrote:
> From: Allen Pais <apais@linux.microsoft.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.

Applied, thanks

-- 
~Vinod
