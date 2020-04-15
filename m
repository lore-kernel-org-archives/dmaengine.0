Return-Path: <SRS0=H4t5=57=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4DEC2BA19
	for <dmaengine@archiver.kernel.org>; Wed, 15 Apr 2020 16:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2EE221734
	for <dmaengine@archiver.kernel.org>; Wed, 15 Apr 2020 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586966735;
	bh=Eon/kODku4B5cB6+FzYwFxrHvEHuLXWbf464ab57/ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=K/OmSTu9V9AUTQudVQ7D51drRcm/DoKkf3Cnp0Oej5F9PJLpUksonteA80psphQwE
	 EiF+FIZpbOW5UEkZEeuLfuaUalyrFthrHClgilCAKsahRvcIxTkswQ9wi+veEp1dri
	 mwVjvwS8y5TQH3IQArshZj4fWwY2CFip7giKCcQ0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406289AbgDOQFf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:57904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406742AbgDOQFe (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 15 Apr 2020 12:05:34 -0400
Received: from localhost (unknown [106.201.106.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E3822166E;
        Wed, 15 Apr 2020 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586966732;
        bh=Eon/kODku4B5cB6+FzYwFxrHvEHuLXWbf464ab57/ss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MYhWL3GFqyivUyvIaZmO4yuG4loQCi3kVFJBVgBAxQpnz1QUDuhEtU52Agsvhh654
         tLlm35JWq25Ca+Q+Safov5zorpriyWBTBnAJW+5ibrc3zuOgl5cy3o8IIp3rQBk3CZ
         d+EfcXmLliXGrWIHiU6qPmxzS1ASfjGjKPWRojT0=
Date:   Wed, 15 Apr 2020 21:35:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        dmaengine@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
        linux-kernel@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: ti: k3-psil: fix deadlock on error path
Message-ID: <20200415160521.GX72691@vkoul-mobl>
References: <20200408185501.30776-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408185501.30776-1-grygorii.strashko@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 08-04-20, 21:55, Grygorii Strashko wrote:
> The mutex_unlock() is missed on error path of psil_get_ep_config()
> which causes deadlock, so add missed mutex_unlock().

Applied, thanks

-- 
~Vinod
