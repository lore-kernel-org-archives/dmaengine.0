Return-Path: <SRS0=fQ6P=S2=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056E0C10F11
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 05:37:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC392218D3
	for <dmaengine@archiver.kernel.org>; Wed, 24 Apr 2019 05:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556084223;
	bh=6n1y629YvX7uRPOu6wE+3P0XVvYg6jCtqY1QKCzRJEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KLydTdIT2KjXlGWPNAh270G0YG53L3TkiFtLXznFaL7sI68QDd4Fc7hNW01+b7sij
	 t9wu08yw/baMRmEAYCsybr6UCYkMdzYu1kkMWdBBaSap/FjvXCjuUon6rAleUW+WNm
	 bnBFlQ5ESEZgyap/e+0OXPZ+s+trhQoQAcAVRg0w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfDXFhD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Apr 2019 01:37:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:59418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbfDXFhD (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 24 Apr 2019 01:37:03 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1223F2089F;
        Wed, 24 Apr 2019 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556084222;
        bh=6n1y629YvX7uRPOu6wE+3P0XVvYg6jCtqY1QKCzRJEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2kXjcaXGG6ELbvjMTs7xRsWywEcGFq60sckkoRcbSonOlwxkhEvlZeZnNjM4rAscb
         saKRt0jDn1isFbJHF5MHJfJgonTt3xMv47oQGoKLYPNc3MHVT3ZGmDA1HLEBu7tsK0
         203HxOgxTdwIZOepcaAzyWHDADnnr4Tm26NhKmJw=
Date:   Wed, 24 Apr 2019 11:06:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     dmaengine@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] dmaengine: axi-dmac: Infer synthesis configuration
 parameters hardware
Message-ID: <20190424053654.GK28103@vkoul-mobl>
References: <20190326130628.10121-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190326130628.10121-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190424053654.Iapvbp6kQYqNH0DY4zFUXQyq-NNGUM0uOl5fFOQL6Vs@z>

On 26-03-19, 15:06, Alexandru Ardelean wrote:
> From: Lars-Peter Clausen <lars@metafoo.de>
> 
> Some synthesis time configuration parameters of the DMA controller can be
> inferred from the hardware itself.
> 
> Use this information as it is more reliably than the information specified
> in the devicetree which might be outdated if the HDL project got changed.
> 
> Deprecate the devicetree properties that can be inferred from the hardware
> itself.

Applied, thanks

-- 
~Vinod
