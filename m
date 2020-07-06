Return-Path: <SRS0=Mp2P=AR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3158C433E0
	for <dmaengine@archiver.kernel.org>; Mon,  6 Jul 2020 05:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDFEA2074F
	for <dmaengine@archiver.kernel.org>; Mon,  6 Jul 2020 05:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594012393;
	bh=NMfbm3tD/jlMh+rbwO32nIfh6SNp9Qec71BKYvnl79I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DDK2nh0TYgNcDPFOGugLrmXF1UDtY4nQ0mUMZiXVWKQED/B2iuqeq61A2DD475BB5
	 X2R40IFc0Emu/uEJkEzLXfz0RLtHyN9T5UtWK79nfLApbG9+FFdmlPx7O+VObRNNT9
	 ifiuxNB7behU1/uw7w3DeNwmAFeQY0vaOA69lQgc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgGFFNN (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 6 Jul 2020 01:13:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726879AbgGFFNN (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 6 Jul 2020 01:13:13 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A57620715;
        Mon,  6 Jul 2020 05:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594012393;
        bh=NMfbm3tD/jlMh+rbwO32nIfh6SNp9Qec71BKYvnl79I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V05t8v+MTDFNvNZsgRXt4cffqxSwel6BCwTMZd8UJYtlRtuZn2SXX5VhKqh5E6zV1
         Kl1EGYV/LIV1nbICu0KxS5zV1ftRLnMnHyj/Wlmcxgp/XNU7aW2dXHtlYdNSdk72lu
         ou7O5fnIskYYMA07+2fY4qR57yMhWYAfuCi7IRyY=
Date:   Mon, 6 Jul 2020 10:43:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com,
        grygorii.strashko@ti.com, vladimir.murzin@arm.com
Subject: Re: [PATCH] dmaengine: dmatest: stop completed threads when running
 without set channel
Message-ID: <20200706051309.GF633187@vkoul-mobl>
References: <20200701101225.8607-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701101225.8607-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 01-07-20, 13:12, Peter Ujfalusi wrote:
> The completed threads were not cleared and consequent run would result
> threads accumulating:
> 
> echo 800000 > /sys/module/dmatest/parameters/test_buf_size
> echo 2000 > /sys/module/dmatest/parameters/timeout
> echo 50 > /sys/module/dmatest/parameters/iterations
> echo 1 > /sys/module/dmatest/parameters/max_channels
> echo "" > /sys/module/dmatest/parameters/channel
> [  237.507265] dmatest: Added 1 threads using dma1chan2
> echo 1 > /sys/module/dmatest/parameters/run
> [  244.713360] dmatest: Started 1 threads using dma1chan2
> [  246.117680] dmatest: dma1chan2-copy0: summary 50 tests, 0 failures 2437.47 iops 977623 KB/s (0)
> 
> echo 1 > /sys/module/dmatest/parameters/run
> [  292.381471] dmatest: No channels configured, continue with any
> [  292.389307] dmatest: Added 1 threads using dma1chan3
> [  292.394302] dmatest: Started 1 threads using dma1chan2
> [  292.399454] dmatest: Started 1 threads using dma1chan3
> [  293.800835] dmatest: dma1chan3-copy0: summary 50 tests, 0 failures 2624.53 iops 975014 KB/s (0)
> 
> echo 1 > /sys/module/dmatest/parameters/run
> [  307.301429] dmatest: No channels configured, continue with any
> [  307.309212] dmatest: Added 1 threads using dma1chan4
> [  307.314197] dmatest: Started 1 threads using dma1chan2
> [  307.319343] dmatest: Started 1 threads using dma1chan3
> [  307.324492] dmatest: Started 1 threads using dma1chan4
> [  308.730773] dmatest: dma1chan4-copy0: summary 50 tests, 0 failures 2390.28 iops 965436 KB/s (0)

Applied, thanks

-- 
~Vinod
