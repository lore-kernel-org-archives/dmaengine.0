Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48093C433E0
	for <dmaengine@archiver.kernel.org>; Sun, 17 Jan 2021 05:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00A6F23119
	for <dmaengine@archiver.kernel.org>; Sun, 17 Jan 2021 05:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbhAQF6b (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 17 Jan 2021 00:58:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:50676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbhAQF6A (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 17 Jan 2021 00:58:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94ABD23119;
        Sun, 17 Jan 2021 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610863039;
        bh=KhFAlgYWV81mqF0LQgovtUnRvAnJ5XcvzlxsYz88gBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LsPPSvSJ5M33pVXNm+ssIGtBxJjtc5n/S9gXbtD3H8JQ7vOrIz+JOKJ9NglOa08Cw
         vuTP57JvWHtdKMcBOzLr0BZICj5t93Rp+k7Vm5MMHKE3TmQw9hA4FoXNPP84RAIlMB
         4VdxPB0Ar8F8dCLtG2ieVzO1PcSLom+JIqSIGxvfiMdtQOKcZqiBbY2neTF/qxKTTe
         kYkS1YgL8uDSBzdvXy/2JkYk8Ji9tm9GN2Y8VSTnfC+2A4HPZ/JZN6aSGKN0dHZgX4
         mCbxz17sawjvxRzcAD1AO/2an3VWiA+yIVJemmRYvFH8Wd+E8r+gnrOeNX0mlsDSAb
         znRfIGgsToYyg==
Date:   Sun, 17 Jan 2021 11:27:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@intel.com, chuanhua.lei@linux.intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        malliamireddy009@gmail.com, rtanwar@maxlinear.com,
        lchuanhua@maxlinear.com
Subject: Re: [PATCH v11 0/2]  Add Intel LGM SoC DMA support
Message-ID: <20210117055714.GJ2771@vkoul-mobl>
References: <cover.1610703653.git.mallikarjunax.reddy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610703653.git.mallikarjunax.reddy@linux.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 15-01-21, 17:56, Amireddy Mallikarjuna reddy wrote:
> Add DMA controller driver for Lightning Mountain (LGM) family of SoCs.
> 
> The main function of the DMA controller is the transfer of data from/to any
> peripheral to/from the memory. A memory to memory copy capability can also
> be configured. This ldma driver is used for configure the device and channnels
> for data and control paths.
> 
> These controllers provide DMA capabilities for a variety of on-chip
> devices such as SSC, HSNAND and GSWIP (Gigabit Switch IP).
> 
> -------------
> Future Plans:
> -------------
> LGM SOC also supports Hardware Memory Copy engine.
> The role of the HW Memory copy engine is to offload memory copy operations
> from the CPU.

??

Please send updates against already applied patches and not an updated
series!

-- 
~Vinod
