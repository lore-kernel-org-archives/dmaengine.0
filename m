Return-Path: <SRS0=kmdA=3D=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDEFC33CAE
	for <dmaengine@archiver.kernel.org>; Tue, 14 Jan 2020 00:25:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70ADA222C4
	for <dmaengine@archiver.kernel.org>; Tue, 14 Jan 2020 00:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578961522;
	bh=4fiixW2EB7t7wNVahtcaM/AyIKNE6SsJpV4VmYij+Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EotuByOEpz6C/GXCZSTlelHPA0VuU/dsjteo7or9dDcnaS1ZiLlvkt4ADOgzC2dvh
	 RXBEzXL1rAbD71vqKrQBkOc917pbvH3W0EsAmz+vT1S43WJC/04MdDs/UChkXhKEed
	 zeP83s6KyK/0wFEmAv2RT9cBNWeHvjZ3EuRElRIw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgANAZW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:25:22 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45232 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgANAZV (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 13 Jan 2020 19:25:21 -0500
Received: by mail-ot1-f67.google.com with SMTP id 59so10841402otp.12
        for <dmaengine@vger.kernel.org>; Mon, 13 Jan 2020 16:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PuZkmizV0FjMntSV+5swUbzzYgbKg4dX9XcvnF9x9qQ=;
        b=X62U4GH5XEpejAyidwbPusE8qa8mEgQKvEBa1YsYDlBos6CM4fBcgbYm9q6xBTp6N6
         TeW/mWfP3d9AFJWGwXoSAZJnjr0HjC+s4J7fgidHckX8a3aszS/9u5NMOr/SAHvD+ygv
         7eFwmN4bwyunYvKOpAUMLxh7d6URdfZpxvE44mFtLwuxbDln6U+ikjAx9hDbD+rNd1OT
         ROEdNWaeNM3QYimbDGRetn+Tq44r1srfrwojVggZgwe2mo/CTCtKdNsvpNQ2T6mUdb48
         OD+tG2aGTMCOQE8R2/pLbNxBoXI9TqFEV7ME9PC1Vx3TJc24amRBMahKOLrdmJSv2yi9
         POXw==
X-Gm-Message-State: APjAAAXlWbCBDXre1YlBmS3oLy0A85Xm0y+wawdbwuQxDVGjzbvs52rc
        5TK7z+HMSIxwh34rsQitmDwtV8zDXg==
X-Google-Smtp-Source: APXvYqys22UmytG/ve0ex+tygTrRoUVcJq98fhDRpJR3yAS3CBBP9msD6ZXPxJYO1jXCttc6kePC3w==
X-Received: by 2002:a9d:6e98:: with SMTP id a24mr14274624otr.109.1578961520664;
        Mon, 13 Jan 2020 16:25:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v4sm4796692otf.7.2020.01.13.16.25.19
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:25:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 223d55
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:17:17 -0600
Date:   Mon, 13 Jan 2020 18:17:17 -0600
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
Subject: Re: [PATCH v2 09/17] dt-bindings: atmel-sysreg: add
 microchip,sam9x60-ddramc
Message-ID: <20200114001717.GA11996@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-10-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-10-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Fri, 10 Jan 2020 18:18:01 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-ddramc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
