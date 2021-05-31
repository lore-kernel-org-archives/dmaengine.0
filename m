Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBB9C4708F
	for <dmaengine@archiver.kernel.org>; Mon, 31 May 2021 04:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D34A4611EE
	for <dmaengine@archiver.kernel.org>; Mon, 31 May 2021 04:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhEaEWr (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 31 May 2021 00:22:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhEaEWq (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 31 May 2021 00:22:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F239F611EE;
        Mon, 31 May 2021 04:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622434867;
        bh=PdA89RDGqgHB6kaGkEhPhITfjlbZI5fvRA+wZtemrHc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kbbezpht87I4Fc5QhMMdRdXE02+EEK83ITQSxxvpR2tKnfMBn6b/nwdmEGK20Pn43
         BBzPYcbeLzIltFHj6huRMrtq7J2vHtapFTjqEtw47tGVfLya8IhkX8hptz2h7h0HuW
         yiOVkOEAuNXfRIJLaMMX05itQt0fwooVDII7OY5lC2tjN+wC6yBNvQXF7mb66x5Xj1
         UVF59bb71WBk0gP9QAmdp+HJI4ATNHlWw4zeuobdJO+L93g4/TEOn6X0+UgD1h+mtg
         Mx9Ozofj3tAnlgJCXEuhtqG3t8KB4fOQ7SGl0xt97KDQ2+E4yFi1oviESH0ljlUs7s
         w7oUCrcHUdibQ==
Date:   Mon, 31 May 2021 09:51:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dmaengine: Move kdoc description of struct
 dma_chan_percpu closer to it
Message-ID: <YLRkMJgGW3slzjWO@vkoul-mobl.Dlink>
References: <20210518104323.37632-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518104323.37632-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 18-05-21, 13:43, Andy Shevchenko wrote:
> We have split by unknown reason of kdoc and struct dma_chan_percpu definition.
> Join them back. No functional change.

Applied both, thanks

-- 
~Vinod
