Return-Path: <SRS0=uof7=B3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E102C433E1
	for <dmaengine@archiver.kernel.org>; Mon, 17 Aug 2020 05:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 778972076E
	for <dmaengine@archiver.kernel.org>; Mon, 17 Aug 2020 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597641377;
	bh=7eos3FUEtXEfjD7Mgm5b/JLUuuvN1wr3ZQd5jd4Eiz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B4ddGzNYcttD/Ys5h/le/IZtrbm/7Y5BrlCk5HlRGDk+WAhXS/ogWF2W8UxGfl50D
	 xKXoufO+GOcUECrTfguaN35c4A7OMtecVRthGFqiYKdq7u7NQcRAnPGKM5nZq9Y6y5
	 xxs4U8HVgpWRplS2tbrtW+Cmg1A/7GEaSev8+4CE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgHQFQR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 17 Aug 2020 01:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgHQFQM (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 17 Aug 2020 01:16:12 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3C1520758;
        Mon, 17 Aug 2020 05:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597641371;
        bh=7eos3FUEtXEfjD7Mgm5b/JLUuuvN1wr3ZQd5jd4Eiz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zqll9qTkqnL+BCtIekZsy576BRHmSkI9wDaTXk2VmJ/faosKRX5rPHoyomfxOA9qe
         o5HE0AHNmhStQVcl1VyRvum0RAABUszl1v1kmqizUj9V9Ig6LNKmGoO2K2m3pFLZX5
         EyohQnSeHw+Q5OTVAzsUZJF9VWjuXkTBWmCkQ70w=
Date:   Mon, 17 Aug 2020 10:46:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     ludovic.desroches@microchip.com, tudor.ambarus@microchip.com,
        dan.j.williams@intel.com, arnd@arndb.de,
        nicolas.ferre@microchip.com, plagnioj@jcrosoft.com,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] dmaengine: at_hdmac: do exception handling appropriately
 in at_dma_xlate()
Message-ID: <20200817051607.GF2639@vkoul-mobl>
References: <20200729122903.2473297-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729122903.2473297-1-yukuai3@huawei.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 29-07-20, 20:29, Yu Kuai wrote:
> Do several things for exception handing:
> 
> a. check return value of of_find_device_by_node().
> b. call put_device() if memory allocation for 'atslave' failed.
> c. if dma_request_channel() failed, call put_device() and kfree().

One patch per change please

-- 
~Vinod
