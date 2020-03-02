Return-Path: <SRS0=PJgd=4T=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF884C3F2D2
	for <dmaengine@archiver.kernel.org>; Mon,  2 Mar 2020 07:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D8C2246A1
	for <dmaengine@archiver.kernel.org>; Mon,  2 Mar 2020 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583133506;
	bh=OCe9TPRVfM8awbQHRtmo9MeSlSAQTCwJ3q7SBouEVKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wAuTijKH8o6ebCCgk0Ei5w4i7bOWif2+NHM/guitvCTiNC/sQjNFjXBaR5LqHbP8+
	 8zo6JCQ7QOD5dR2PEncMhCGVFWpsclaowgB1xkcXOPkDQVH+CUiZD+Cp7011ItcbwQ
	 oANGaEYcbOCGQf24/zZXlSyPOAFmxnsN6btafWXY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgCBHS0 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 2 Mar 2020 02:18:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:38654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgCBHS0 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 2 Mar 2020 02:18:26 -0500
Received: from localhost (unknown [171.76.77.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D148624699;
        Mon,  2 Mar 2020 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583133505;
        bh=OCe9TPRVfM8awbQHRtmo9MeSlSAQTCwJ3q7SBouEVKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UCA9qAGDo1y+BzxlxDNT89/QGCkwsbQ6iv9RF6+obECCUQwMmL0CKNnBuXHsZRIf0
         Vqie+h6GEKeEhzSJWkuWOyQYlndo51M/QaxdqfiVu2O4HUbEj6Rav8k7s0tuIMw0AD
         4WAkQh43/GI2hplG18XX0duQiAulc0LOxt2ljF/8=
Date:   Mon, 2 Mar 2020 12:48:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v1 1/4] dmaengine: Refactor dmaengine_check_align() to be
 bit operations only
Message-ID: <20200302071821.GH4148@vkoul-mobl>
References: <20200226101842.29426-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226101842.29426-1-andriy.shevchenko@linux.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 26-02-20, 12:18, Andy Shevchenko wrote:
> There is no need to have branch and temporary variable in the function.
> Simple convert it to be a set of bit and arithmetic operations.

Applied, thanks

-- 
~Vinod
