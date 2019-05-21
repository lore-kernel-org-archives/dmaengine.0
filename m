Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD6DC04AAF
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 07:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 408A021743
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558423297;
	bh=Ag74ndH2WI93u1W3o4FuC7Tdt8eh+FlOGnYZ8HXxSqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=in1NjhaWAEFrorGTWJ16M2lij2mFReS3ssQag8NC7OoHXi50Ucr6UaAGiA06VRfCb
	 UaZmGwAkZLjqdlpMNIDpePWmOppxU/Y3x6+mjc7ncEQOfIoWYtvJQRB7yY/NJ6dZ1P
	 CNeAKwUd4JHRWntYFZpMquE8+Jn11rQdocy+afdE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfEUHVg (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 03:21:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbfEUHVg (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 03:21:36 -0400
Received: from localhost (unknown [106.201.107.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EECE2173C;
        Tue, 21 May 2019 07:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558423296;
        bh=Ag74ndH2WI93u1W3o4FuC7Tdt8eh+FlOGnYZ8HXxSqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jtfJgFsnCfrk08DHKSZaSoF8nvpXV6gOR3UMEHGjadaKpA5+aL9BL9ttSPdmq+ISd
         cBa25RUENQH7JR53M9V2yPmuxQIpv800uA8khRiYOo9JOhykuwy04XmlGH84QI6v32
         VtiICNIRb5ptnpk7YJZI++SYntOLaq22uQGkziEw=
Date:   Tue, 21 May 2019 12:51:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ti: edma: Enable support for polled (memcpy)
 completion
Message-ID: <20190521072131.GB15118@vkoul-mobl>
References: <20190514080909.10306-1-peter.ujfalusi@ti.com>
 <20190521050430.GS15118@vkoul-mobl>
 <ce1a2e96-bc4b-3998-0c36-362867907177@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce1a2e96-bc4b-3998-0c36-362867907177@ti.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 21-05-19, 09:16, Peter Ujfalusi wrote:
> On 21/05/2019 8.04, Vinod Koul wrote:
> > On 14-05-19, 11:09, Peter Ujfalusi wrote:

> >>  	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
> >> @@ -1801,6 +1804,20 @@ static enum dma_status edma_tx_status(struct dma_chan *chan,
> >>  	unsigned long flags;
> >>  
> >>  	ret = dma_cookie_status(chan, cookie, txstate);
> >> +
> >> +	if (ret != DMA_COMPLETE && echan->edesc && !echan->edesc->cyclic) {
> >> +		struct edma_cc *ecc = echan->ecc;
> >> +		int channel = EDMA_CHAN_SLOT(echan->ch_num);
> >> +		int j = (channel >> 5);
> >> +		unsigned int mask = BIT(channel & 0x1f);
> > 
> > GENMASK or define a macro instead of a magic number?
> 
> So it is better to change the other places first from where I have just
> copied this.

That would be nice as well :)

-- 
~Vinod
