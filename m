Return-Path: <SRS0=mVlT=DQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564EFC433DF
	for <dmaengine@archiver.kernel.org>; Fri,  9 Oct 2020 04:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E16D422248
	for <dmaengine@archiver.kernel.org>; Fri,  9 Oct 2020 04:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602217109;
	bh=PnFnJOf9+5DLfEfUAdKBJ/7+3TNHhSqul2nI4kiD7gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DJEY2e5/KwzQ4aNJLi9vvtQ2tbyPzORy1RXRVUN0DtKUy3qe5SRS5orx7dp0+x0XI
	 kpE4qdFRF4YbVHmv7tdjlhWzr6z2eG7emGwFgePo/liIgZRX5wCnkRwWU2rfugh8Bq
	 nqNkTMzI3Qrn+80NtFGlF/5qxYf/80Nu0LF9+PUY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgJIES2 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 9 Oct 2020 00:18:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgJIES2 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 9 Oct 2020 00:18:28 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3F6322227;
        Fri,  9 Oct 2020 04:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602217107;
        bh=PnFnJOf9+5DLfEfUAdKBJ/7+3TNHhSqul2nI4kiD7gs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mKvvbufcBaL632eNjLw6EHox+m2lGwZweAkLYSpeBGcsKI+dP+MagI+vXkeNnFpn1
         nqN8RIZqOTQijT6z5br9m9CVNi4E3+z248Uo17EbYeUo+HVj78cdyhGpIHePBk1O/J
         +Ghg9ygCJ8nvmpFp0ESqxWazMIciKN8/aaKOu2JY=
Date:   Fri, 9 Oct 2020 09:48:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     dmaengine@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 5/5] dmaengine: owl-dma: fix kernel-doc style for enum
Message-ID: <20201009041822.GC2968@vkoul-mobl>
References: <20201007083113.567559-1-vkoul@kernel.org>
 <20201007083113.567559-6-vkoul@kernel.org>
 <20201008140403.GB23649@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008140403.GB23649@linux>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 08-10-20, 19:34, Manivannan Sadhasivam wrote:
> On Wed, Oct 07, 2020 at 02:01:13PM +0530, Vinod Koul wrote:
> > Driver doesn't use keyword enum for enum owl_dmadesc_offsets resulting
> > in warning:
> > 
> > drivers/dma/owl-dma.c:139: warning: cannot understand function prototype:
> > 'enum owl_dmadesc_offsets '
> > 
> > So add the keyword to fix it and also add documentation for missing
> > OWL_DMADESC_SIZE
> > 
> 
> Do we really need to document the max value? Does it produce any warning?

It does.. Once you add the enum, it will treat is as such and look at
members and complain that the OWL_DMADESC_SIZE is not documented ;)

-- 
~Vinod
