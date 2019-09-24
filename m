Return-Path: <SRS0=IPQN=XT=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B5FC432C1
	for <dmaengine@archiver.kernel.org>; Tue, 24 Sep 2019 11:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D2F521655
	for <dmaengine@archiver.kernel.org>; Tue, 24 Sep 2019 11:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cw7rTdOv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394644AbfIXLwe (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 24 Sep 2019 07:52:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40166 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394463AbfIXLwe (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 24 Sep 2019 07:52:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id x127so1217000pfb.7
        for <dmaengine@vger.kernel.org>; Tue, 24 Sep 2019 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sCg6sABhmq65xC3vuiHniWHaGdlPpo8woMlr1gIVlvY=;
        b=cw7rTdOvUG3gzPwscr9GgYHKmcZvbKCWgpJjsgt/2Ka23l/+NPJ966TuVTC0h3xPDg
         mmkrS47wPFH50qsHgyb2yZgroj3vAKHXKoWFqUMAgpn6roKRavX7EgpD5KUGhzISHgbU
         sl7B3+d8kKnOlUeEj7rJbs+3GgO8VIZzYW/Rh1Nh/X0mTroGz1RW5HaFZ8HdhYzXC9gF
         nbJfGGb6ULsDMYuVZQJ0lxA8+7sc+OgW/xBkCg4Q/8z9N/e+QADLjlauIhsRjxXnbY53
         KbDU0bLsjpP0xo87HxMfXvbOb3kDpMZ3qowRdw9I9Qw0M86U2fYCnYZl15LVvVxONSHT
         Rxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sCg6sABhmq65xC3vuiHniWHaGdlPpo8woMlr1gIVlvY=;
        b=sH+6pXFUR5x0ImBFHzYB/VMBZfrCAVtjAnNvZTqaGnL0OfxFCUn/6E+y65Yo+UO2zS
         Bh7mfkH7Uz9IYcvrIB5APc1aVqPhqNk3KEZldh7/JMFjX7l0g7SQShoC4aXW8pYWMyCJ
         R0j4AhY1CmRAbWqNIZ5U522Fx3vds64bfvD4hvJD79YUnNAznc+02NJrzMEvohuXpAeR
         MSbXrJKMr57pVSShmiRxx/RE788/rozUov5TxwAkLiimp5vRA4eoKarIB8tCRxSf7WCt
         ulb4XmBUvoOoJWdU3WzD8IgxlqxH6djvfE4dtqvXzTFZ/wcGOQK3gVQj2YVMiqNDSgdi
         qJgA==
X-Gm-Message-State: APjAAAWmy97RTLO7fpelJCUqeJKY9tBJQZSm5nyeviM5q7xnjMNKBhbZ
        T+SMMYO++r4D4g7H7nwxb1nLyA==
X-Google-Smtp-Source: APXvYqwsaxACYpoxwOjFBfYzCidOFSr9Yfb0vm7hg7vM/gqJ99oQ5xmUaBhv/WqUo6B8M7z9Iyai3Q==
X-Received: by 2002:a63:ea07:: with SMTP id c7mr2856860pgi.106.1569325953131;
        Tue, 24 Sep 2019 04:52:33 -0700 (PDT)
Received: from localhost ([12.206.46.61])
        by smtp.gmail.com with ESMTPSA id w7sm1601017pjn.1.2019.09.24.04.52.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 04:52:31 -0700 (PDT)
Date:   Tue, 24 Sep 2019 17:22:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1] dmaengine: dw: platform: Mark 'hclk' clock optional
Message-ID: <20190924115231.6aay7mkpnzqrr5vh@vireshk-mac-ubuntu>
References: <20190924085116.83683-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924085116.83683-1-andriy.shevchenko@linux.intel.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-09-19, 11:51, Andy Shevchenko wrote:
> On some platforms the clock can be fixed rate, always running one and
> there is no need to do anything with it.
> 
> In order to support those platforms, switch to use optional clock.
> 
> Fixes: f8d9ddbc2851 ("Enable iDMA 32-bit on Intel Elkhart Lake")
> Depends-on: 60b8f0ddf1a9 ("clk: Add (devm_)clk_get_optional() functions")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/dw/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
