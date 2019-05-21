Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB313C04AAF
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 05:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0B8021743
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 05:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558415182;
	bh=9NH+SfjlfzJPDTJpNsRQhjrEOEnEgynhPQL6rFcx5co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=l+9i/PPZ5/q4hEJr2XM5eb4PsHE1YeV5HDBDe8RXXb2IYDtYCdnYHgBXXHVD10ze0
	 YphS9IvpK1EySXSQx/ber2UrShbIt8SG4F1C6dD6BF7hMtZYBGAybeFa1dPPwNzjSJ
	 kPl3MrbidPh79io/eazhJ3GOtu/IrZ+s7zMe22S0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbfEUFGW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 01:06:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbfEUFGW (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 01:06:22 -0400
Received: from localhost (unknown [106.201.107.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05BCD21019;
        Tue, 21 May 2019 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558415181;
        bh=9NH+SfjlfzJPDTJpNsRQhjrEOEnEgynhPQL6rFcx5co=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lAuHN5RpHIxo2KmVqVWVsG5vRY3okM2fLD3oZk3gYY1pbnUPaV0CEMu+FBlXM8KC5
         f18/mBkJHn8opa6gXNyUnqgMXn3Jv1YGZ/GYGzrd2y9pWJkIpeT9rYLT1A4+wK388d
         ME5lOoXhZlDfW54rPGvutvNAwlePx8+Qpr4TILUo=
Date:   Tue, 21 May 2019 10:36:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     dmaengine@vger.kernel.org, Dragos Bogdan <dragos.bogdan@analog.com>
Subject: Re: [PATCH] dmaengine: axi-dmac: Add support for interleaved cyclic
 transfers
Message-ID: <20190521050618.GT15118@vkoul-mobl>
References: <20190516070443.16219-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516070443.16219-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-05-19, 10:04, Alexandru Ardelean wrote:
> From: Dragos Bogdan <dragos.bogdan@analog.com>
> 
> The DMAC HDL core supports interleaved & cyclic transfers.
> An example use-case for this mode is when the controller is used as a
> video DMA.
> 
> This change sets the `cyclic` field to true, so that when the IRQ comes and
> the `axi_dmac_transfer_done()` callback is called (from the interrupt
> handler) the proper `vchan_cyclic_callback()` is called. This way the
> DMAEngine framework will process data correctly for interleaved + cyclic
> transfers.
> 
> This doesn't fix anything. It's an enhancement to the driver.

Applied, thanks

-- 
~Vinod
