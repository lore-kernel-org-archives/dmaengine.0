Return-Path: <SRS0=kZgs=3C=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D68C33CAF
	for <dmaengine@archiver.kernel.org>; Mon, 13 Jan 2020 21:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C15421569
	for <dmaengine@archiver.kernel.org>; Mon, 13 Jan 2020 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578952211;
	bh=4bLAkwPUPzdXlAHdorU0yNPmSzIzFNXzZyF9iMgLKIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XeM3YWgBEoYJwVTe6CuyQCDDBU4FYRSZhWqXS/RPB1kC5n8RugNqIef52alU55rbW
	 75lPhLjreoYp+36DJGv3tj0v9AZfmYXev93ftF8jzsBCFbVr//AxgZ6ytCjt8n69z7
	 DyO5Z1Q8X3h/ATDfwhyF93Lr5kNMmN8dmNh6u15Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgAMVuK (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Jan 2020 16:50:10 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34677 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728738AbgAMVuK (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 13 Jan 2020 16:50:10 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so10511721otf.1
        for <dmaengine@vger.kernel.org>; Mon, 13 Jan 2020 13:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pxveT8kmVAy+6NNs/m6VYBrLz6raLXBMbZxaVD7AKwA=;
        b=OPug7Ij+Rk9G7N8X+dG1ISGngp/UZfiuv+RbHsIDy/6AmxSk5eFbimLcfphu3QSVFs
         PU/FIwfI/mLIuTM9kmKUeRkSrXMFL8ZabhUotvuxsyCRDTnyst8//i8mADfyo8qrAxS7
         udGzM3wA+uIbS3gFQ2NYoHjC586nO9A4g1OWVhc6yYVeRsMYIwl+Tl6vzRpkKWbqthe3
         H+CH8d+YDbQG0jZfprKxYP8Uz9T2X1hcY/7RbMx144pFp8Er9aBK1rAye04PehFrs2fh
         PwFYcvQX4OnWLWpYR8wb4ouX4HbmQ2kpuj6G0jKmX7INGew3YwG+y0LMyi1z+JqoG6rx
         N7uA==
X-Gm-Message-State: APjAAAW0fD5M/pHN40znZgc5AEbdcHv9baTWLody6xb2DVHujbe93r0I
        kpewMVjS4xfIDJ5djaodoJndfwM=
X-Google-Smtp-Source: APXvYqxYCpOjUXVhhU66Yr2HX1w+oqN+x/1U97LiIdZosb+MiYejNc87vRv+wNU9n3+GFEdJKPttBQ==
X-Received: by 2002:a9d:478:: with SMTP id 111mr14168407otc.359.1578952209648;
        Mon, 13 Jan 2020 13:50:09 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q25sm4625730otf.45.2020.01.13.13.50.08
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:50:08 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 15:47:36 -0600
Date:   Mon, 13 Jan 2020 15:47:36 -0600
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
Subject: Re: [PATCH V2 7/7] dt-bindings: arm: imx: Add the i.MX8MP EVK board
Message-ID: <20200113214736.GA12301@bogus>
References: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
 <1578893602-14395-7-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578893602-14395-7-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Mon, 13 Jan 2020 13:33:22 +0800, Anson Huang wrote:
> Add board binding for i.MX8MP EVK board.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
