Return-Path: <SRS0=EEJZ=CD=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6098C433DF
	for <dmaengine@archiver.kernel.org>; Tue, 25 Aug 2020 10:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D53A2074D
	for <dmaengine@archiver.kernel.org>; Tue, 25 Aug 2020 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598351040;
	bh=H31ZO/87ppxr5475Vt7I46XnCrCXIsay23gE80a6GDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xjTePuYs10LThxkw5MWLyjZDMHBWe6ChZ5YnC/gNIhMf3xUZbwOslGZi4VJDFplut
	 2zh7L4V9wv2VrydPFXoGFpcc8u8cAkoD2SP7KC7JzUtlKDB3VjCoKTBjzQJYQi+Tmb
	 vi38FKKVnEvTuBLtO/kRMPgdZFSAD07C693OCcwc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbgHYKX7 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 25 Aug 2020 06:23:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:38420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728117AbgHYKX7 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 25 Aug 2020 06:23:59 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 322522068F;
        Tue, 25 Aug 2020 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598351039;
        bh=H31ZO/87ppxr5475Vt7I46XnCrCXIsay23gE80a6GDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oky9bh3AlxAeHICmZHQXDxk6MuNS7Vdejhac2RWmawjaM9lKPMU2spb/MUev4szio
         NZDEeg8DPoY/dBhfjPv27FU282BTtQ932ek3pwGTkVeD/O9uatBRD5/JAqMR5ER6Ky
         2EshmCFMDfd3eIgU3eQIsam1hUFQmkcLJSUrCQdk=
Date:   Tue, 25 Aug 2020 15:53:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Fix the TR initialization for
 prep_slave_sg
Message-ID: <20200825102355.GD2639@vkoul-mobl>
References: <20200824120108.9178-1-peter.ujfalusi@ti.com>
 <acdbc662-c912-480d-02c6-47a7b6d1b671@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acdbc662-c912-480d-02c6-47a7b6d1b671@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 25-08-20, 08:34, Peter Ujfalusi wrote:
> Vinod,
> 
> On 24/08/2020 15.01, Peter Ujfalusi wrote:
> > The TR which needs to be initialized for the next sg entry is indexed by
> > tr_idx and not by the running i counter.
> > 
> > In case any sub element in the SG needs more than one TR, the code would
> > corrupt an already configured TR.
> 
> I forgot to add the Fixes tag:
> Fixes: 6cf668a4ef829 ("dmaengine: ti: k3-udma: Use the TR counter helper for slave_sg and cyclic")
> 
> Can you add it or I can resend with the tag.

Applied with fixes line, thanks

-- 
~Vinod
