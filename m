Return-Path: <SRS0=bl+G=S4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29044C43219
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0558208C4
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556279696;
	bh=eoQ7l9KNmIM+FnDjz6dXIbRHBpA6734LVlbHJtYUmKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PuQSuA/NxeVH0ZdfzEc42IrRpejqWkAUUrYTlzOlwXtHqiJwsSOaKmI1pg6PaKjG/
	 AGnvRFHOi74mP2C4U1UWt7OceUncp+XAUd8Y2qOJy5bamZyKc9OQbxJRVxDU6Q3U3Z
	 9IhKjMr6Bq4CyT5QeWVPEwlpjKqqycBKgtPtcz5w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfDZLyz (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 26 Apr 2019 07:54:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:46674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfDZLyz (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 26 Apr 2019 07:54:55 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24896206C1;
        Fri, 26 Apr 2019 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556279694;
        bh=eoQ7l9KNmIM+FnDjz6dXIbRHBpA6734LVlbHJtYUmKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATPJTwp/mrihRh+67xd+x5sL9LKrNmsKPXf/D6NInwXYoG55Tvf5d+US3AUL2t7V0
         DHf3G1kzPxWXeY4ig+IyPEfAekyna8ZV2z6jdc1lWZx801jEUCFVEGxmqrglRtPxTO
         ks3NFN5K07+DfoGv2D/xlBtMJoEEI3nLMZpDz/yQ=
Date:   Fri, 26 Apr 2019 17:24:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
Message-ID: <20190426115447.GZ28103@vkoul-mobl>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190426115447.koQo3hgRW-tVB0fwWU43q6O-THUQkArCehNOI8kt9e8@z>

On 10-04-19, 20:26, Niklas Söderlund wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Update copyright and string for Gen3.

Applied, thanks

-- 
~Vinod
