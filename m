Return-Path: <SRS0=kmdA=3D=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3133C33CAF
	for <dmaengine@archiver.kernel.org>; Tue, 14 Jan 2020 00:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A891A21569
	for <dmaengine@archiver.kernel.org>; Tue, 14 Jan 2020 00:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578961017;
	bh=ty5zfQkiRhAx57Hwj6NCRKyc2kPTZbupHVXQsQn3t5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ae2KKeJZteIUT8sndwMi+ETUhMA1pUxAF2SGINjA/npunpeTYmdMXn+unOkWPBx8I
	 78vrzThQ2F1+D6Qfd60SQ7lEJ15KhRwIULRpWjY/mLbngqq0GNjGTBPsHasC/hdz+N
	 0n67sPOQZ4lG4mXLhFBJBWNSm9WY6+K4ml4EloOk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbgANAQy (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:16:54 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39204 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgANAQy (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 13 Jan 2020 19:16:54 -0500
Received: by mail-oi1-f194.google.com with SMTP id a67so10165833oib.6
        for <dmaengine@vger.kernel.org>; Mon, 13 Jan 2020 16:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nnCP/oi7Z0mxzEO5kxr1fVYeBOYXbt9IQu/uVhgHHc8=;
        b=DaDytjfBteW2FTRuhOBuI842r+ocbk8p90i6jlNylPxacBlKbYjeRt312sSPDxdPuS
         ChoH4XsWy/h/oBVe5xUVVXYDH4168f7dKTYGnWyzICICinM5Y4P3CAxmuvkH8433S7L3
         AAIHgwRB28Xq7/u6fFC3zBfWFY2onVZHh3leOz2UU5jKpwyGlCSkWc4j4rbu3nFwuKAl
         Xk3r/acC5h5lSvZKpQDOZvtx48VTXPQ00pT8RapyWY1kFNa3C5zFDtw/lKiuJMMwKY47
         7qXUycgde9i61Pg8xB+p8YWkChNAhSiX9WKoFVorJymJ8xc8Ke+2wrKrPpV4juOkEW/A
         LAZA==
X-Gm-Message-State: APjAAAXS7NFqh6uam2UFNXnVomBtSDn4P+LZ2hnYx8Qo/lGGLvP6IqX6
        NWH1o6cOtbwgQX9PL8SMgUR+SGqAdw==
X-Google-Smtp-Source: APXvYqzydiAoBkTwen66gNXHVkjLvm+PsTJXbiVIZ7vGVJDTtxNO7UurEi4HstD7SOjX483t5kb9/g==
X-Received: by 2002:aca:36c1:: with SMTP id d184mr14901480oia.70.1578961013158;
        Mon, 13 Jan 2020 16:16:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm4760078otk.2.2020.01.13.16.16.50
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:16:51 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219cf
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:16:49 -0600
Date:   Mon, 13 Jan 2020 18:16:49 -0600
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
Subject: Re: [PATCH v2 07/17] dt-bindings: atmel-matrix: add
 microchip,sam9x60-matrix
Message-ID: <20200114001649.GA11024@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-8-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-8-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Fri, 10 Jan 2020 18:17:59 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-matrix to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-matrix.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
