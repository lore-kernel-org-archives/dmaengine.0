Return-Path: <SRS0=mcWF=UY=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86247C48BD5
	for <dmaengine@archiver.kernel.org>; Tue, 25 Jun 2019 04:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FB8C20863
	for <dmaengine@archiver.kernel.org>; Tue, 25 Jun 2019 04:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561436709;
	bh=3T6SKEcFjkbKM6aaALMIK/+Tqx6ODcVS6SWlNzDr09I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=e91nidRPIviJ+xXUaX920Z9sysQ5By048c36VpgT3GYsJ2eFmfj6kjQn7ROo/eFWQ
	 5hAVaxdL2dR3umBK69YyZuDrxShpclS2acn5WTw8UqBvxxlrOO2ytkgcIpCfSLBLqF
	 UMDb1xb3rt+NozX8KrK6mFLLcmw8X+i4/zp5OUoE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfFYEZI (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 25 Jun 2019 00:25:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfFYEZI (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 25 Jun 2019 00:25:08 -0400
Received: from localhost (unknown [106.201.40.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31A6820656;
        Tue, 25 Jun 2019 04:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561436707;
        bh=3T6SKEcFjkbKM6aaALMIK/+Tqx6ODcVS6SWlNzDr09I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BC0wuSSNup5Bw5ED5C9BZVbBzkbRp5GHgp+c7iuY2nV7bs5lyZhjAFzcsv4xucX2w
         h67TQyKHllU5gCt5rqJjhUPqMJch+TtBaEj+WloIcCiCP3a4Ad+HIENLQHB0j9tI76
         N/kcUknAi9tFLtjcuCx+gfXOHdw2EerwAqer7aPs=
Date:   Tue, 25 Jun 2019 09:51:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sh: usb-dmac: Use [] to denote a flexible
 array member
Message-ID: <20190625042157.GH2962@vkoul-mobl>
References: <20190619124555.12701-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619124555.12701-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 19-06-19, 14:45, Geert Uytterhoeven wrote:
> Flexible array members should be denoted using [] instead of [0], else
> gcc will not warn when they are no longer at the end of the structure.

Applied, thanks

-- 
~Vinod
