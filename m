Return-Path: <SRS0=IgV5=6L=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B371C54FCB
	for <dmaengine@archiver.kernel.org>; Mon, 27 Apr 2020 16:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55CE920661
	for <dmaengine@archiver.kernel.org>; Mon, 27 Apr 2020 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588004518;
	bh=M5nmYevSYtNvNspZnywHqJHYt+jM5gSM8GMH5qH4XCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wDmmWO4l/0XQ6i9RCJHPcsKFJSyzVQtG2H87M3+LbxefmzRnNRHdqfonQlaWxPg5c
	 zSsfM+30bM9JE+kPbiZGpEsJ4vknOd4rnbDP35IP/7QrAJ72p1hc2sZbBPVvwCnDuj
	 3qmsKuH5zq3ObhkUlUsqWPC8O2m+t3NVC9Gqz3y0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgD0QV6 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 27 Apr 2020 12:21:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:46626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbgD0QV5 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 27 Apr 2020 12:21:57 -0400
Received: from localhost (unknown [171.76.79.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9DBD20661;
        Mon, 27 Apr 2020 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588004517;
        bh=M5nmYevSYtNvNspZnywHqJHYt+jM5gSM8GMH5qH4XCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjKWlaPx8qgtYAyrnnBsFI9uFJDovXdkEc08Jis0cZEkOYg4H1PcWk5qCljH1z3Vn
         RZTuezk3++opudKIaLLV9BUiMOftiyhoqn9hvuntUuoUwRK8Kh7WWG3TnHf6E2XDRq
         8zZf6grFLOlRk8u6aARnqzfo/LINgJHBS+Z0LaLU=
Date:   Mon, 27 Apr 2020 21:51:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v1 5/6] dmaengine: dmatest: Describe members of struct
 dmatest_params
Message-ID: <20200427162152.GO56386@vkoul-mobl.Dlink>
References: <20200424161147.16895-1-andriy.shevchenko@linux.intel.com>
 <20200424161147.16895-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424161147.16895-5-andriy.shevchenko@linux.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-04-20, 19:11, Andy Shevchenko wrote:
> Kernel documentation validator complains that not all members of
> struct dmatest_params are being described. Describe them all.

Applied, thanks

-- 
~Vinod
