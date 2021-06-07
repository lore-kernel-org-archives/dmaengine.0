Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3704BC47082
	for <dmaengine@archiver.kernel.org>; Mon,  7 Jun 2021 06:54:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11D606121D
	for <dmaengine@archiver.kernel.org>; Mon,  7 Jun 2021 06:54:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhFGGzw (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 7 Jun 2021 02:55:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhFGGzv (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 7 Jun 2021 02:55:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C25060FF0;
        Mon,  7 Jun 2021 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623048841;
        bh=3WOLgfAMR0w8GUbFt52lE2XL9Zd739S4s8Bkg9JcIKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n6+6O9A/1C0/pvDUSV0h+nRgmgF3u5+tVSfum3G87Nc0YLLFyVSNE11VNYkCq2EvT
         mjeH4ZWrt+XX90ZzTuRCVHkHr685vskt3e3c2A8CrewGwSVhEpbBqI/bXaeE9VXRUm
         sGe2H4i1W1uj1ExYGnljmGwie40weJv8ifJu3Ghtf1/v/a4oMyGGzPfOfCVTy37Cng
         r6GBcLiatke/HfikrNRpOV+EbOGrIgVyaRivS/YcApI7F0T3Jutk0WKwFoLRNsyua1
         Pkan85xwt5ywPQ0wz6CpKpYo8HvftGd+EFpdk38Evv8+sXx0H+jC8W9zXg+EN4XNDO
         fWKHCBZCIsi9g==
Date:   Mon, 7 Jun 2021 12:23:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Guillaume Ranquet <granquet@baylibre.com>
Cc:     Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] fix mediatek UART APDMA desc logic
Message-ID: <YL3ChZxIQwqZpCTF@vkoul-mobl>
References: <20210513192642.29446-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513192642.29446-1-granquet@baylibre.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 13-05-21, 21:26, Guillaume Ranquet wrote:
> The logic used in the apdma driver to handle the virt_dma_desc caused
> panics and various memory corruption.
> This is an attempt at sanitizing the logic a bit.

Applied, thanks

-- 
~Vinod
