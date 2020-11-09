Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2270C388F7
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:49:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45E5B20731
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604922599;
	bh=2Pr2Q3ugfT6NO8YZithe0fGBp63/IvbYBELWwyxvsBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wdFexZ6LCYwAJzOxz9Q7FmWGl588e9zjSiHng8JWnN2b/UA/Jjdw6cH9J/4KxdCdH
	 vbks5Nvb42hV9F0eu5Kc8aZYC2l9lFV0xzGbznC2fVZfXUhws3vv79e2cbKQHcYnWG
	 DpJ9LHZ/FRHl+yYPRqCnXfRjQ9d8Z2kMbtJES/S4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgKILt7 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:49:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:36186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgKILt6 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 06:49:58 -0500
Received: from localhost (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EF65206ED;
        Mon,  9 Nov 2020 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604922598;
        bh=2Pr2Q3ugfT6NO8YZithe0fGBp63/IvbYBELWwyxvsBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LWWhrdYW0iIhfVT+SZIPOYUk5BwFnyrXtt1ayKI3aBAylDn0432w7DmqgLfihXAMp
         4lROVVoPyI0IGKCMKA0vtXEmHm9d7yveWgWDopsZo4nnVw/oIMxDIRdUI2x7Vu9Rot
         tegRC+pFDl98r3ZvM6fbRatCfUWZIBr7/zVaAoU0=
Date:   Mon, 9 Nov 2020 17:19:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v1] dmaengine: dw: Enable runtime PM
Message-ID: <20201109114954.GK3171@vkoul-mobl>
References: <20201103183938.64752-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103183938.64752-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 03-11-20, 20:39, Andy Shevchenko wrote:
> When consumer requests channel power on the DMA controller device
> and otherwise on the freeing channel resources.
> 
> Note, in some cases consumer acquires channel at the ->probe() stage and
> releases it at the ->remove() stage. It will mean that DMA controller device
> will be powered during all this time if there is no assist from hardware
> to idle it. The above mentioned cases should be investigated separately
> and individually.

Applied, thanks

-- 
~Vinod
