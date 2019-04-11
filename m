Return-Path: <SRS0=QHC4=SN=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3CCC10F14
	for <dmaengine@archiver.kernel.org>; Thu, 11 Apr 2019 08:49:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 276D22184E
	for <dmaengine@archiver.kernel.org>; Thu, 11 Apr 2019 08:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfDKItm (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 11 Apr 2019 04:49:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45942 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbfDKItm (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 11 Apr 2019 04:49:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 01A9425AD6D;
        Thu, 11 Apr 2019 18:49:40 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EF7E6940356; Thu, 11 Apr 2019 10:49:37 +0200 (CEST)
Date:   Thu, 11 Apr 2019 10:49:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
Message-ID: <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190411084937.1YkfLHKdmcMeS3S28qfTJaIpzXsppgcTyucvtqErlhY@z>

On Wed, Apr 10, 2019 at 08:26:57PM +0200, Niklas Söderlund wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Update copyright and string for Gen3.
> 
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/dma/sh/rcar-dmac.c | 4 ++--

Not strictly related, but is it appropriate to:

1. Move this driver and drivers/dma/sh/usb-dmac.c to drivers/dma/renesas/
2. Remove drivers/dma/sh/sudmac.c which appears unused
