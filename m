Return-Path: <SRS0=Lzn8=SZ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A02BC10F14
	for <dmaengine@archiver.kernel.org>; Tue, 23 Apr 2019 05:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48A43214AE
	for <dmaengine@archiver.kernel.org>; Tue, 23 Apr 2019 05:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555996276;
	bh=jND5KBLA5hl7G9qH/rxqX/MJ4O60Ms3M5+zk7ebnDkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ywlu1JacKMhxpy6co5YAxgPTPfNKFUpZzItpBKTuHzdeMZHWwKmVKQyrk4ytYg/js
	 hBcvD6e9C0cmHd/m4T1/Vm1gBy1rEg8aTtc8pDE+sCKq3utdJDjVbvnIA0OvAlZHWR
	 Oe0UVdlhCY1H7EbToWD+9ds4rLnwCDVteiAVQUnE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfDWFLP (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 23 Apr 2019 01:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfDWFLP (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 23 Apr 2019 01:11:15 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B26D20811;
        Tue, 23 Apr 2019 05:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555996275;
        bh=jND5KBLA5hl7G9qH/rxqX/MJ4O60Ms3M5+zk7ebnDkg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PAZvKbIZ2SpdTByeFNvRwsCXmBltB9TQhyXqeN/RPB2CrjkzFPcKNyFGH2NHTSQ2N
         6pGO6ovHEXFvLsRMVsGliWNZgwKKqS+PJJJ8Cif9dSr4UnW7n0H9K838khUkQd7oVS
         5HWeL3Ty26HnZyYLqmUoEOfZSa2wwEHXml07309w=
Date:   Tue, 23 Apr 2019 10:41:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Eric Anholt <eric@anholt.net>,
        bcm-kernel-feedback-list@broadcom.com,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Lukas Wunner <lukas@wunner.de>,
        Florian Kauer <florian.kauer@koalo.de>,
        Martin Sperl <kernel@martin.sperl.org>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] dmaengine: bcm2835: Avoid GFP_KERNEL in
 device_prep_slave_sg
Message-ID: <20190423051109.GE28103@vkoul-mobl>
References: <1554143899-4124-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <1554143899-4124-1-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190423051109.MBoL_qIxOJXgzykYhGnPRDZ6XM9EQuqadbXMN6I5XZQ@z>

On 01-04-19, 20:38, Stefan Wahren wrote:
> The commit af19b7ce76ba ("mmc: bcm2835: Avoid possible races on
> data requests") introduces a possible circular locking dependency,
> which is triggered by swapping to the sdhost interface.
> 
> So instead of reintroduce the race condition again, we could also
> avoid this situation by using GFP_NOWAIT for the allocation of the
> DMA buffer descriptors.

Applied, thanks

-- 
~Vinod
