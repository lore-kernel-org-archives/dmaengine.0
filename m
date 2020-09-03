Return-Path: <SRS0=MLMT=CM=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65027C43461
	for <dmaengine@archiver.kernel.org>; Thu,  3 Sep 2020 08:27:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 306A120767
	for <dmaengine@archiver.kernel.org>; Thu,  3 Sep 2020 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599121652;
	bh=AbWFhSZrSoYx6Fp+YWywGEU0EqwcOSISwNIHxOF/xrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PU0indJ5gm6LsZeIjpdTvNWtZmIW8mj9yzAC2qbWtt6xZ/8H1yx5XfcBtYyFMPo/5
	 p/SUa5qCN79w9pJv33ClCWe0dpzAI7LrUT5iMEWQtVr03mt9T3RsKve/4f2XWcjDa8
	 73iYJJZUEzf++Vp5a8e3WjMbkhX+sne5GtK3nxBU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgICI1W (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 3 Sep 2020 04:27:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgICI1V (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 3 Sep 2020 04:27:21 -0400
Received: from localhost (unknown [122.171.179.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E96F0208C7;
        Thu,  3 Sep 2020 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599121640;
        bh=AbWFhSZrSoYx6Fp+YWywGEU0EqwcOSISwNIHxOF/xrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CShokF7yy0Q2skhvanCrcL8gLouFzuDy52Ps63kiiLEPBULkR4dAY07e/OXPSjQ7P
         ZSxHU3SPp8vlg1wgh8K38DKz5BwfSbZr+YX3tMCaMdGrGsJJP/bNiEJEIFtJOPfJkm
         +4gDX0yPWjBuP/oVs6/UAKME6cI9pQWKJtTwVoo4=
Date:   Thu, 3 Sep 2020 13:57:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [RESEND PATCH v2] dt-bindings: renesas,rcar-dmac: Document
 r8a7742 support
Message-ID: <20200903082716.GM2639@vkoul-mobl>
References: <20200903073813.4490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903073813.4490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 03-09-20, 08:38, Lad Prabhakar wrote:
> Renesas RZ/G SoC also have the R-Car gen2/3 compatible DMA controllers.
> Document RZ/G1H (also known as R8A7742) SoC bindings.

Applied, thanks

-- 
~Vinod
