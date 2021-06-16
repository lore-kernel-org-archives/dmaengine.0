Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38E0C48BE8
	for <dmaengine@archiver.kernel.org>; Wed, 16 Jun 2021 10:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82A3D6128B
	for <dmaengine@archiver.kernel.org>; Wed, 16 Jun 2021 10:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhFPKqw (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 16 Jun 2021 06:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232396AbhFPKqw (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 16 Jun 2021 06:46:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C23D6115C;
        Wed, 16 Jun 2021 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623840286;
        bh=Y7Wcg53O+6THROza6+l3yBX+X42pLdn7tZhr6x/tdaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YMsb9AwCcm4YyUjeM3I17ByW5jF1Rn6YbKT7qhA6e2OhgX5uOL+Is/Siw88GdmkhY
         qcxU70J3Z0AcMXnok8QDUGBxdXU6ZtP/89rrRL85OGtQVfgW35y/YmDrb9Z8Xr520I
         jgfG4ciiGRElAR4czMTCHiNQEjQjzYqGLavUKiagfXYEdH8enC78cZAA11t8SN5LVC
         xY47MVqBlzPHQX7pUzeOLzI+vk4yZb0deWwXMgg4mljwpXvEnC6n1ePrgeyT4NaviO
         USb/a+Mr8SQl26Hx3my8KtcSrzWUzhneAhSylU7zcle+X7EcHy1hGbp/iUIqyeS8jQ
         h2SD/Wigzr3Sg==
Date:   Wed, 16 Jun 2021 16:14:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Olivier Dautricourt <olivier.dautricourt@orolia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stefan Roese <sr@denx.de>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: dma: add schema for altera-msgdma
Message-ID: <YMnWGpcIW6G+3JnA@vkoul-mobl>
References: <7487a25cdb240d1be4a8593aa602c3c73d8f5acb.1623251990.git.olivier.dautricourt@orolia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7487a25cdb240d1be4a8593aa602c3c73d8f5acb.1623251990.git.olivier.dautricourt@orolia.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 09-06-21, 17:20, Olivier Dautricourt wrote:
> add yaml schema for Altera mSGDMA bindings in devicetree.

Applied all, thanks

-- 
~Vinod
