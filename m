Return-Path: <SRS0=FmAI=UJ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055C0C282DD
	for <dmaengine@archiver.kernel.org>; Mon, 10 Jun 2019 07:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF0E12085A
	for <dmaengine@archiver.kernel.org>; Mon, 10 Jun 2019 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560153257;
	bh=P4DGh8ttH28T2p9/JtWa0sqscD/hKoDboB2sWHg32nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HqHko4HxCgYkP0D59IfvsR5D8eu5kcf0jBhnsY58sHWugw3VBSDYiQtyoZF/wEQKW
	 hLOSEsVvvvnl0Ln4gNzsJHayanpFgRKnKApqCMJiMi14MKLSlP+gNGKAcjA+r3SN6X
	 VsKjmy84SUlbHPzQB9n+aqDa81SsiQ5+drKgPVCM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387912AbfFJHyR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 10 Jun 2019 03:54:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387781AbfFJHyR (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 10 Jun 2019 03:54:17 -0400
Received: from localhost (unknown [122.178.227.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFB2F20833;
        Mon, 10 Jun 2019 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560153256;
        bh=P4DGh8ttH28T2p9/JtWa0sqscD/hKoDboB2sWHg32nI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HRZLtn+6g/Wx35xTU9bTm8tbIZcDe8OC5CIkMAgTIB60WF78fjy7t2T3psBUDNJ23
         4lCm8x3vEzpZjNw43v0hh8QQE3JXHCo39BE6Awa91LzeU2+u5vyDrJoWICcHymQZIC
         mNTpnpdprFzD/BZKdD7VEPGl6cIwBPyVkObPB8Zc=
Date:   Mon, 10 Jun 2019 13:21:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Jiri Kosina <trivial@kernel.org>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH trivial] dmaengine: Grammar s/the its/its/, s/need/needs/
Message-ID: <20190610075108.GO9160@vkoul-mobl.Dlink>
References: <20190607113039.14560-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607113039.14560-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 07-06-19, 13:30, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks

-- 
~Vinod
