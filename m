Return-Path: <SRS0=GWNR=A4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6F8C433E0
	for <dmaengine@archiver.kernel.org>; Fri, 17 Jul 2020 06:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02FBF2070A
	for <dmaengine@archiver.kernel.org>; Fri, 17 Jul 2020 06:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594966823;
	bh=j+wpU7QpKZPfvuoTI7QREkrdNKm4S1KWNuhsVk3urkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ctetJ/xD4DtbXpk4g55OAy2QO9XgrCfZN58YE2qMhv30KSkPSSpxY+fyvzm9EWWqK
	 Pa929ll35saxdQ2pKYX+v9ZlY2SxXTi8XZSAoqNwmOs27sXFXC9OapM+YExO5QSpm9
	 3xs9ZH6K1H+X45WAabc70IzYr82VXLe0lFOZrqxE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgGQGUW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 17 Jul 2020 02:20:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726113AbgGQGUW (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 17 Jul 2020 02:20:22 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5928B206F4;
        Fri, 17 Jul 2020 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594966822;
        bh=j+wpU7QpKZPfvuoTI7QREkrdNKm4S1KWNuhsVk3urkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o/efJR5s+9Nv2eFb5bBgvEmSjeZM4eZ4dd1338WltwIhmf209iVlnhNp+XuhmhLEj
         6SyTXYCBBWkNaQZ25bSKO9AnrdyQhI0U4uwIHDWNHYz+JdaOujxt+0+zLBvDvenEMY
         ya7IZJD1MxapuWgjBdx14rFWa04oCxA4C62NAUqQ=
Date:   Fri, 17 Jul 2020 11:50:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Koehrer Mathias (ETAS/EES-SL)" <mathias.koehrer@etas.com>
Cc:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v4] dmaengine: Extend NXP QDMA driver to check
 transmission errors
Message-ID: <20200717062018.GG82923@vkoul-mobl>
References: <744443c0462aac2df4754f99500a911527c0b235.camel@bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <744443c0462aac2df4754f99500a911527c0b235.camel@bosch.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 15-07-20, 08:41, Koehrer Mathias (ETAS/EES-SL) wrote:
> Extend NXP QDMA driver to check transmission errors
> 
> The NXP QDMA driver (fsl-qdma.c) does not check the status bits
> that indicate if a DMA transfer has been completed successfully.
> This patch extends the driver to do exactly this.

Applied, thanks

-- 
~Vinod
