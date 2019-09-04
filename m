Return-Path: <SRS0=Gs2F=W7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EED3C3A5A9
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 09:34:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1C4623400
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567589677;
	bh=ODWCxBgr9OEhXpwaK9k8C+NkbNBxfyE+CSqgvIsM160=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zqQTYqKJrFWIU2gQPS97N/6N8rJ4FAEh2fcDd8euP2JMVV188OJwMLZ6lur90LBtW
	 FLyBUrErK0SdFS1U6i3c3fX+Y1FOjCi6FUkBqbkAGUoqPHHzGefcHIoPykeHAS2rJh
	 rbSoLqOPHbsnuGQhT3HnkRH2p9cSai4UvzP+lnXY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfIDJeh (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 4 Sep 2019 05:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfIDJeh (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 4 Sep 2019 05:34:37 -0400
Received: from localhost (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 528532087E;
        Wed,  4 Sep 2019 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567589676;
        bh=ODWCxBgr9OEhXpwaK9k8C+NkbNBxfyE+CSqgvIsM160=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YzFTZ0u9W8+L81ISZW5dTG7205LnQErs1XltcKyjhizUcIUT2yBLssS/r9wTsbhbd
         WJm9UWjVHYKhcFOZ1F7YRfRmJLmuBZl7E0HEW4FCG3VPf1P9OgKBon6yJ3D28e4Fi2
         NqjCkfGb2CrU+mFpmwxepR7CLzaCNl+2F1REgna8=
Date:   Wed, 4 Sep 2019 15:03:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] dmaengine: rcar-dmac: minor modifications
Message-ID: <20190904093327.GR2672@vkoul-mobl>
References: <1566904231-25486-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190904060955.GG2672@vkoul-mobl>
 <TYAPR01MB454461A61EE21E891FF171B5D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB454461A61EE21E891FF171B5D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 04-09-19, 06:14, Yoshihiro Shimoda wrote:
> Hi Vinod,
> 
> > From: Vinod Koul, Sent: Wednesday, September 4, 2019 3:10 PM
> > 
> > On 27-08-19, 20:10, Yoshihiro Shimoda wrote:
> > > This patch series is based on renesas-drivers.git /
> > > renesas-drivers-2019-08-13-v5.3-rc4 tag. This is minor modifications
> > > to add support for changed registers memory mapping hardware support
> > > easily in the future.
> > 
> > This fails to apply for me, please rebase and resend.
> 
> I'm sorry for this. I'll rebase this patch series.
> Also, I'll rebase the following patch as one series.
> https://patchwork.kernel.org/patch/11118639/
> 
> And, note that the following patch [1] is already superseded.
> https://patchwork.kernel.org/patch/11118637/

Yes I think I picked the v2, please check my -next and send updated if
any on top of that :)

-- 
~Vinod
