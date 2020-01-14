Return-Path: <SRS0=kmdA=3D=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E24CC33CAE
	for <dmaengine@archiver.kernel.org>; Tue, 14 Jan 2020 00:16:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4148821569
	for <dmaengine@archiver.kernel.org>; Tue, 14 Jan 2020 00:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578960992;
	bh=8eR2k4N3/QElfnpXUzRtCjcysj33XTmq362d49xB6mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=A5JGVHb0Smv5Xk/PuStDtqUhWrpibvfThZ46fE4gZumzdvmcCHhNimjF4WA76Cph8
	 4nNNYaL0sjtw/AAVJskD+V8ceL6xZ9mpZYdtEf6s9T6oT0BnYradlVXx0koeOhajP3
	 wOtp8yF22i+An6oALWuMxSEi2TH/9SFDusmUH7zs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgANAQb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:16:31 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33309 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbgANAQb (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 13 Jan 2020 19:16:31 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so10883774otp.0
        for <dmaengine@vger.kernel.org>; Mon, 13 Jan 2020 16:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E6IJAm/G2BZsEtWssBpYlld99L9pgrhy2OUvTYO1Gu4=;
        b=YljbaRNMXYRIDC9cnfux58plvuZMg+g92w8zV7HrxwNhjp39XKWkPNsk+oUfe4HBcU
         08ifF1DrTn8bKFknBlQ+Sa9cOh8euRpZby95mnnHRPmSmfH9kgp6FIyQ3g+BHXbLWxd0
         1doz0RRyF1uNsIsTiGXTOp0yu2TaE7z0oPxjh6AzxnsdsRUB3+JBWMsy5DNtxvPkGU3t
         kulTaRe/Gd5Wzk8l5fsEAte5rD/zDXeijHLkd9RhsQneNcAQ7cTTs7ygxupXiA7MsiAZ
         96rbP2/2WODFeg/3R9RYS9PxO1+D4X05MzVkEe/HVQmawWHzv760c+Elbo7mzLSNUxBP
         +02A==
X-Gm-Message-State: APjAAAUqV3midkbB3OTk/JmyZ14P+BnwK38B1Hm2YXuZbIceaMWniEcm
        duol7pyhgLSPMYjPZ02mRw6Ex9xiLA==
X-Google-Smtp-Source: APXvYqwKV4+v3Leod9xb07kUm1JW+pTMYwOXTAKNj2IdxC82flhbi1xXQ7ijcqGdU1HwsaC8khsocg==
X-Received: by 2002:a9d:6211:: with SMTP id g17mr14258893otj.168.1578960990377;
        Mon, 13 Jan 2020 16:16:30 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm4721471otl.74.2020.01.13.16.16.28
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:16:29 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:16:27 -0600
Date:   Mon, 13 Jan 2020 18:16:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, vkoul@kernel.org,
        eugen.hristev@microchip.com, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, mchehab@kernel.org,
        lee.jones@linaro.org, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        wg@grandegger.com, mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 06/17] dt-bindings: at91-sama5d2_adc: add
 microchip,sam9x60-adc
Message-ID: <20200114001627.GA10411@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Fri, 10 Jan 2020 18:17:58 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-adc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
