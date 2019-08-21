Return-Path: <SRS0=zFvX=WR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA778C3A59E
	for <dmaengine@archiver.kernel.org>; Wed, 21 Aug 2019 16:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB65222CE3
	for <dmaengine@archiver.kernel.org>; Wed, 21 Aug 2019 16:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbfHUQVr (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 21 Aug 2019 12:21:47 -0400
Received: from 212-186-180-163.static.upcbusiness.at ([212.186.180.163]:34752
        "EHLO cgate.sperl.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfHUQVr (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 21 Aug 2019 12:21:47 -0400
X-Greylist: delayed 3602 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Aug 2019 12:21:46 EDT
Received: from msmac.intern.sperl.org (account martin@sperl.org [10.10.10.11] verified)
  by sperl.org (CommuniGate Pro SMTP 6.2.1 _community_)
  with ESMTPSA id 7775516; Wed, 21 Aug 2019 15:21:42 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 00/10] Raspberry Pi SPI speedups
From:   kernel@martin.sperl.org
In-Reply-To: <cover.1564825752.git.lukas@wunner.de>
Date:   Wed, 21 Aug 2019 17:21:54 +0200
Cc:     Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stefan Wahren <wahrenst@gmx.net>, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Eric Anholt <eric@anholt.net>, Nuno Sa <nuno.sa@analog.com>,
        Noralf Tronnes <noralf@tronnes.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Florian Kauer <florian.kauer@koalo.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Content-Transfer-Encoding: 7bit
Message-Id: <4ECE0035-552C-4E7E-8CFA-D8EAC0B041FA@martin.sperl.org>
References: <cover.1564825752.git.lukas@wunner.de>
To:     Lukas Wunner <lukas@wunner.de>
X-Mailer: Apple Mail (2.3124)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


> On 03.08.2019, at 12:10, Lukas Wunner <lukas@wunner.de> wrote:
> 
> Lukas Wunner (10):
>  dmaengine: bcm2835: Allow reusable descriptors
>  dmaengine: bcm2835: Allow cyclic transactions without interrupt
>  spi: Guarantee cacheline alignment of driver-private data
>  spi: bcm2835: Drop dma_pending flag
>  spi: bcm2835: Work around DONE bit erratum
>  spi: bcm2835: Cache CS register value for ->prepare_message()
>  spi: bcm2835: Speed up TX-only DMA transfers by clearing RX FIFO
>  dmaengine: bcm2835: Document struct bcm2835_dmadev
>  dmaengine: bcm2835: Avoid accessing memory when copying zeroes
>  spi: bcm2835: Speed up RX-only DMA transfers by zero-filling TX FIFO
> 
Acked-by: Martin Sperl <kernel@martin.sperl.org>

