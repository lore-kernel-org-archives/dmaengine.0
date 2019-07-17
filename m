Return-Path: <SRS0=wfPj=VO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413D4C76186
	for <dmaengine@archiver.kernel.org>; Wed, 17 Jul 2019 06:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1341721743
	for <dmaengine@archiver.kernel.org>; Wed, 17 Jul 2019 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563345743;
	bh=ziLssIkR8rgNBLsQXPr/OIkD9PTEJszOLsFZ53nKyy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nR8YVvPPjLgWhVJCoRI+da5XYzeucpD4fDpaq2tsfi8qMO0vHRoHH3qLyxRt9e0JW
	 G4dbB1/fuLTLiuhUspPCxeV+ZEX0aij6B5kD2p0lyBXlZekTt3xHA/atiIiHyyNEPI
	 Ca/BRz+7fPehs5JSDnR2j/tOzuSXqZOJ9SIh5RxA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfGQGmW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 17 Jul 2019 02:42:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:48056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfGQGmW (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 17 Jul 2019 02:42:22 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ACF82173B;
        Wed, 17 Jul 2019 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563345741;
        bh=ziLssIkR8rgNBLsQXPr/OIkD9PTEJszOLsFZ53nKyy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dFNuUpkepOTNKhWPGU57Hl5wPQafG8UXOoutNGCqgeGNt4ovmTz1qeSc5rUnPbAzY
         DKxMgVTzi+v//QXtwNzMMAfMxp2eUbqfUa3NdaFEfOGtRlJm2E3X922Pi2pZaYtpNZ
         qmYNEBSSV91j9959VBZ103+IqwFegup/hI+rzwU0=
Date:   Wed, 17 Jul 2019 14:42:05 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     yibin.gong@nxp.com
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, broonie@kernel.org, festevam@gmail.com,
        vkoul@kernel.org, dan.j.williams@intel.com,
        u.kleine-koenig@pengutronix.de, catalin.marinas@arm.com,
        l.stach@pengutronix.de, will.deacon@arm.com,
        linux-spi@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 12/15] ARM: dts: imx6ul: add dma support on ecspi
Message-ID: <20190717064204.GA3738@dragon>
References: <20190610081753.11422-1-yibin.gong@nxp.com>
 <20190610081753.11422-13-yibin.gong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610081753.11422-13-yibin.gong@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Mon, Jun 10, 2019 at 04:17:50PM +0800, yibin.gong@nxp.com wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> Add dma support on ecspi.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>

Applied, thanks.
