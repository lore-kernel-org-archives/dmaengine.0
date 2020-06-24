Return-Path: <SRS0=BNS2=AF=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA42C433E0
	for <dmaengine@archiver.kernel.org>; Wed, 24 Jun 2020 06:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 971722088E
	for <dmaengine@archiver.kernel.org>; Wed, 24 Jun 2020 06:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592978617;
	bh=1NNEAu5SaBy1TE3co7sVLQF9xPwX5FCT8mjmZHfq3lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=s7KDsMKzSd7eB7EYluLo8DL/TDT4Wr5mk0kwzIn1RYRLL4c5uo3Si3R58izO+YBuE
	 iH9ygxgH3t3LR5V5c17S7jP1v06srE4mdjYjWUl/RI3lIqlUlBB3/y1ERyFzr8ivlY
	 1F1RsdTRE+QtT7vx4KyqWE5yZBJsq8i/wsdctrN8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388307AbgFXGDh (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Jun 2020 02:03:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388164AbgFXGDh (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 24 Jun 2020 02:03:37 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E63632085B;
        Wed, 24 Jun 2020 06:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592978616;
        bh=1NNEAu5SaBy1TE3co7sVLQF9xPwX5FCT8mjmZHfq3lQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=us+MWmV9Pnwi1IBiwovXU6CliVGEe5BvT5F1y4Zte+BoRyyDC7cFrdMGSmmG1xLRW
         pakSh7DuAyYEthPL79cLSS4WbAOgjAWFysrn95ZTrdekhCVsnl5QFXNI3TiL2bQyY0
         LuWKNDGMApfuukSeDeOBJ+zCPivtRaskjKal5taw=
Date:   Wed, 24 Jun 2020 11:33:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH v2] dmaengine: ti: k3-udma: Fix delayed_work usage for tx
 drain workaround
Message-ID: <20200624060332.GB2324254@vkoul-mobl>
References: <20200618114004.6268-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618114004.6268-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 18-06-20, 14:40, Peter Ujfalusi wrote:
> INIT_DELAYED_WORK_ONSTACK() must be used with on-stack delayed work, which
> is not the case here.
> Use normal delayed_work for the channels instead.

Applied, thanks

-- 
~Vinod
