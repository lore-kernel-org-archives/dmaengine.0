Return-Path: <SRS0=m5Qb=3E=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C96C33CB1
	for <dmaengine@archiver.kernel.org>; Wed, 15 Jan 2020 16:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C1F42187F
	for <dmaengine@archiver.kernel.org>; Wed, 15 Jan 2020 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579104028;
	bh=eBGLvhXJudq8c8ns1iD/SjohF++SLfZwoKDFp3HQgcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0b0yZ1/8Z09V3USyqg0k21euDtgs9j8htDhg1HGl5vbgZlzu1d6fTMeMmy0e0fNe4
	 w/hDpSe+2fIW/v8un5AXQ8xRS0xbvw6XNIirEP+BqQ+6M/Uu7KjUYQ2xmKJeeUbjeP
	 W2NHPb6in9wLWPPW3lY32UK7qWjFX7DuR85NH2So=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgAOQA2 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 15 Jan 2020 11:00:28 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44897 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgAOQA2 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 15 Jan 2020 11:00:28 -0500
Received: by mail-ot1-f67.google.com with SMTP id h9so16471679otj.11
        for <dmaengine@vger.kernel.org>; Wed, 15 Jan 2020 08:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RUBHE4XJm85NFA8oPl1FMyCsYkpngZCS0u/hs5fFTfs=;
        b=djHqqXnWSTieH2AWHB7Kyk/7mFk9z7afXFN+SJ86LADByPlMTt/ZLfxuiAo7+lDWSj
         ajRInNMt9HY59QQ7R5nph/gmemTbS2zuNYyPxuAwCUgvtmlbHKctu9ORyXAATKPJXB8v
         lwR59B+nFX6davVHqm3S2I/lMUqwtfGs0FmPflI7ACSbkvIb84EbhTHl1cQMwqrNSmg3
         eBYjG8U6Ypnzwtb/cL4BNdD4OvGNMB1oaqeMkowrCnPtceO0Zt8SltJFuErnBSrb78rC
         hyc0zo0G8FMMqtazXg98EqeSrM5AX7x0GdMPvX2PsjDb4ymh4s2UqdJQdMlm3mULeaKN
         Y3VQ==
X-Gm-Message-State: APjAAAV5Wazfbt80++N7em5kQw42RPSiLs4QOZoKLEFfZhr09qszTspO
        +1LMrTqBYQyVxEqX0O/W7OmSa5c=
X-Google-Smtp-Source: APXvYqzBjqEiEqSnuDv9ASHYvCcBVSOjnw4eyFqLUOF5WWc7sI+iCh+ZJkA3h/kfNsW5MeXVZ19ccA==
X-Received: by 2002:a9d:6d10:: with SMTP id o16mr3307221otp.28.1579104026884;
        Wed, 15 Jan 2020 08:00:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 6sm5747747oil.43.2020.01.15.08.00.25
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 08:00:25 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22093b
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 09:42:50 -0600
Date:   Wed, 15 Jan 2020 09:42:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, vkoul@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org,
        manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com,
        rjones@gateworks.com, marcel.ziswiler@toradex.com,
        sebastien.szymanski@armadeus.com, aisheng.dong@nxp.com,
        richard.hu@technexion.com, angus@akkea.ca, cosmin.stoica@nxp.com,
        l.stach@pengutronix.de, rabeeh@solid-run.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 3/7] dt-bindings: imx-ocotp: Add i.MX8MP compatible
Message-ID: <20200115154249.GA15419@bogus>
References: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
 <1578893602-14395-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578893602-14395-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Mon, 13 Jan 2020 13:33:18 +0800, Anson Huang wrote:
> Add compatible and description for i.MX8MP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
