Return-Path: <SRS0=k+Z1=44=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F5AC10F27
	for <dmaengine@archiver.kernel.org>; Wed, 11 Mar 2020 09:16:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AAC421655
	for <dmaengine@archiver.kernel.org>; Wed, 11 Mar 2020 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583918188;
	bh=DHyY/MYmOo/X+nXfG4G9caJrRWJLihQGG00VeTdc28s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gNFbpley6VEWvdH3AycFCmP99UeDPwbIdz9EVtk+Lv9dKeANaoEeZZM2QcYZndUS1
	 Ldi4P3R7KaEaM6LX5lyx/J97lN22CT65oHbAcqwapwJ5tYJ0S7imJKORybANoeY/LY
	 d2ubSGECS3RduSXCCPLw1Tnv05hDTOP6LhUiMK5I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgCKJQ1 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 11 Mar 2020 05:16:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:53120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbgCKJQ1 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 11 Mar 2020 05:16:27 -0400
Received: from localhost (unknown [106.201.105.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1777F20848;
        Wed, 11 Mar 2020 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583918187;
        bh=DHyY/MYmOo/X+nXfG4G9caJrRWJLihQGG00VeTdc28s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FSb9swnoWIBgHZRRUUN923dtpzqBZvonMnZUsq9y+/UOqIX6utA2IragMzB77XmNV
         +H4b3XOLCj/dGTiEe7DIiHYxlXoTvQm1PAqF1/e6XbRiv/JWOPAyYjFYZd4gXOE2X+
         +UBwO6Gu0fAx1Xzc15pv+FbnR4EXHbMZoqaCrfW0=
Date:   Wed, 11 Mar 2020 14:46:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Radhey Shyam Pandey <radheys@xilinx.com>
Cc:     Sebastian von Ohr <vonohr@smaract.com>,
        Appana Durga Kedareswara Rao <appanad@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Add missing check for empty list
Message-ID: <20200311091622.GL4885@vkoul-mobl>
References: <20200303130518.333-1-vonohr@smaract.com>
 <20200306133427.GG4148@vkoul-mobl>
 <CH2PR02MB7000C592992EEFBFB01D5735C7E30@CH2PR02MB7000.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH2PR02MB7000C592992EEFBFB01D5735C7E30@CH2PR02MB7000.namprd02.prod.outlook.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 06-03-20, 13:57, Radhey Shyam Pandey wrote:
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: Friday, March 6, 2020 7:04 PM
> > To: Sebastian von Ohr <vonohr@smaract.com>; Appana Durga Kedareswara
> > Rao <appanad@xilinx.com>; Radhey Shyam Pandey <radheys@xilinx.com>;
> > Michal Simek <michals@xilinx.com>
> > Cc: dmaengine@vger.kernel.org
> > Subject: Re: [PATCH] dmaengine: xilinx_dma: Add missing check for empty list
> 
> Minor nit -  Better to also add <...> "in device_tx_status callback "
> > 
> > On 03-03-20, 14:05, Sebastian von Ohr wrote:
> > > The DMA transfer might finish just after checking the state with
> > > dma_cookie_status, but before the lock is acquired. Not checking for
> > > an empty list in xilinx_dma_tx_status may result in reading random
> > > data or data corruption when desc is written to. This can be reliably
> > > triggered by using dma_sync_wait to wait for DMA completion.
> > 
> > Appana, Radhey can you please test this..?
> 
> Sure, we will test it. Changes look fine.  Though had a question in mind, 
> for a generic fix to this problem, should we make locking mandatory for 
> all cookie helper functions? Or is there any limitation?
> 
> The framework say for dma_cookie_status says locking is not required. This
> scenario is a race condition when the driver calls dma_cookie_status and
> it sees it's not completed, but then since there is no locking and dma 
> completion comes and it changes cookie state and removes the element 
> from active list to done list.  When driver access it in tx_status it  results
> in data corruption/crash.

The expectation is that you would lock while looking at list and then
return.. So you should not have issues..

-- 
~Vinod
