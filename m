Return-Path: <SRS0=PJgd=4T=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AEDC3F2D1
	for <dmaengine@archiver.kernel.org>; Mon,  2 Mar 2020 07:14:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CD7124699
	for <dmaengine@archiver.kernel.org>; Mon,  2 Mar 2020 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583133243;
	bh=8bbBNKsvRKtZwidiAYoqCkbRlyeEpy9PG4a5xT9W3vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1yOdaRmnv1Fe2P9P7GNcNzpID22JtdVm65dtL/xOWx+4dVvL0AZwbFYXS0d7ugwKd
	 VsXiXXmdqegx8VblFgOLir2KZz22qZMhoiN4/bZkOPBZYiFmvVeN3asCqkKmWiSN64
	 FrUFPabSrKV/PTffiECOPm8ieZHYsgXqqNNYLBKs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgCBHOC (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 2 Mar 2020 02:14:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgCBHOC (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 2 Mar 2020 02:14:02 -0500
Received: from localhost (unknown [171.76.77.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 681EF24697;
        Mon,  2 Mar 2020 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583133242;
        bh=8bbBNKsvRKtZwidiAYoqCkbRlyeEpy9PG4a5xT9W3vQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYW//VXIjtwNp4XoysgSIMcXslgNlmxYrTBdT/gGLm5TjQ63tENlWvOGbA/6w0YJq
         sN4/9GXRpFG7w7BkIl0rAyXArvp6whZAnbXr+h1kiEt6SnrqXJxWlmRaTU1FYyR/BL
         s5aoEjxLulmGEsKdBOxi0QidmSiGSTq7MLRmqlGI=
Date:   Mon, 2 Mar 2020 12:43:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: expose general capabilities register in
 sysfs
Message-ID: <20200302071358.GF4148@vkoul-mobl>
References: <158256729399.55526.10842505054968710547.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158256729399.55526.10842505054968710547.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-02-20, 11:01, Dave Jiang wrote:
> There are some capabilities for the device that are interesting to user
> apps that are interacting directly with the device. Expose gencap register
> in sysfs to allow that information.

Applied, thanks

-- 
~Vinod
