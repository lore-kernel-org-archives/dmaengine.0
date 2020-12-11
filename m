Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7B2C433FE
	for <dmaengine@archiver.kernel.org>; Fri, 11 Dec 2020 17:31:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EEBB23DC2
	for <dmaengine@archiver.kernel.org>; Fri, 11 Dec 2020 17:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394992AbgLKQZN (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 11 Dec 2020 11:25:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727045AbgLKQYp (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 11 Dec 2020 11:24:45 -0500
Date:   Fri, 11 Dec 2020 21:54:00 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607703844;
        bh=ZnBvTYYCLxcRIfQCkCwz3NcHFbIH3swkrddHO+mhiiE=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=niZrHuQDlxPXwfXWwpYOPzEDgWfLpBhNworWUE9sBWSIENDehmE2VMR+fQfwkC1/c
         YjyycwYIyJZTQHdHoo//VkCWYYmNxCdec2DGurHGefox5f1afTiQuW4tndr9yWi9tb
         F+8y/6vuH9SSnUYSYzgnbtC12pT21yfZKUuuJFMdIWjcWir6f2euGRp6c/puQ0bWIK
         NyzOPM2N33dzN4A9VENZJFIrA7FiICnIpMR+6R+WNalpId9WyZ9qXWyg9wgsp9wcyE
         Je3gTXKYhbnITKpvtuc0wUbZ260ovPM/6jouB4u6aC4fvHm8g/Pxj1P8954zsZN9qb
         O3ncktNgC7vCQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     nm@ti.com, ssantosh@kernel.org, robh+dt@kernel.org,
        dan.j.williams@intel.com, t-kristo@ti.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        vigneshr@ti.com, grygorii.strashko@ti.com
Subject: Re: [PATCH v3 00/20] dmaengine/soc: k3-udma: Add support for BCDMA
 and PKTDMA
Message-ID: <20201211162400.GZ8403@vkoul-mobl>
References: <20201208090440.31792-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208090440.31792-1-peter.ujfalusi@ti.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 08-12-20, 11:04, Peter Ujfalusi wrote:
> Hi,
> 
> The series have build dependency on ti_sci/soc series (v2):
> https://lore.kernel.org/lkml/20201008115224.1591-1-peter.ujfalusi@ti.com/
> 
> Santosh kindly provided immutable branch and tag holding the series:
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.11 

I have picked this and then merged this and pushed to test branch. If
everything is okay, it will be next on monday

-- 
~Vinod
