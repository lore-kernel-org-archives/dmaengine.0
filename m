Return-Path: <SRS0=78CF=3K=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FA6C2D0CE
	for <dmaengine@archiver.kernel.org>; Tue, 21 Jan 2020 09:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF6C24653
	for <dmaengine@archiver.kernel.org>; Tue, 21 Jan 2020 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579598438;
	bh=qKSs/AtoxyANBpnuD1dUfh98+h8YxgyT8YLAkX1kDFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FypVpuotCyZ3+9NQj4lzlDWsJ9FcYetXGyE5mL6G0moo5QLIKp66KS7DdZnuM4dS7
	 8m1yv+Tk4MPqmuBvzXtf2l8rsDsSGI9UTQE1adPz3Faq0x7W4p0Jje0OHIwFVYLU7U
	 iWg64demFjkc7Bv/oDpjF2g55LZXHPzCeeR9iQMA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgAUJUf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 Jan 2020 04:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:37964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUJUf (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 Jan 2020 04:20:35 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBB3F20882;
        Tue, 21 Jan 2020 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579598434;
        bh=qKSs/AtoxyANBpnuD1dUfh98+h8YxgyT8YLAkX1kDFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eakjcS4TLsnD2uLcQ03IDSCX17gGY77o2clXE3dmRPsaB3uOHoLJL6zRKBhR0JONB
         WY5yYdde1Qd9DV+6BkIx5HaLpbeHfyDeKqo/08VM1N3qVVAtnXYNV7TuT/flb0g1hd
         slm/8xW6AM665mcymWrVyW8GAp/H4+SrHtSxY50I=
Date:   Tue, 21 Jan 2020 14:50:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        broonie@kernel.org, manivannan.sadhasivam@linaro.org,
        andrew.smirnov@gmail.com, rjones@gateworks.com,
        marcel.ziswiler@toradex.com, sebastien.szymanski@armadeus.com,
        aisheng.dong@nxp.com, richard.hu@technexion.com, angus@akkea.ca,
        cosmin.stoica@nxp.com, l.stach@pengutronix.de,
        rabeeh@solid-run.com, leonard.crestez@nxp.com,
        daniel.baluta@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/7] dt-bindings: fsl-imx-sdma: Add
 i.MX8MM/i.MX8MN/i.MX8MP compatible string
Message-ID: <20200121092030.GH2841@vkoul-mobl>
References: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 13-01-20, 13:33, Anson Huang wrote:
> Add imx8mm/imx8mn/imx8mp sdma support.

Applied, thanks

-- 
~Vinod
