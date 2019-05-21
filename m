Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFD5C04AAF
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 04:16:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51E1520862
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 04:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558412192;
	bh=pmk5CqkD6sqT/pibTXOuA932xXqreDHa6zo1d/maJQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=J8vGJU0As40PVGVgQvP8yB6c/r644feR1yRnNBrSvlsrFLtHZ903NoCa241VfR4je
	 YMebOWSQ34CGquKlJDvUwGNRHsjxNwh1CUyy10RT+TeypPdRcbYmk63uB5LcAtMT1Y
	 7NGFSu2W6l4lKcKSlkJBqsYaRofcklSt8p3SscCI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfEUEQb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 00:16:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:38752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbfEUEQb (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 00:16:31 -0400
Received: from localhost (unknown [106.201.107.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F5A321773;
        Tue, 21 May 2019 04:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558412191;
        bh=pmk5CqkD6sqT/pibTXOuA932xXqreDHa6zo1d/maJQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YouPjg0qdaKRUWE6aOJTqaI+Spb0FKW/P6tWAVX6EEihJZQMqXjNjnfOrgBC2Q8qm
         QjsCGz1UccOvVY96sN6+5L58NdXkIVH5f4DROpd4MFZuhUZzZ4bJtsLzm0zDh2k2cK
         JaDnXuUdy73oVgD5JCzrvvzSov5n2BwIujX9Vwdk=
Date:   Tue, 21 May 2019 09:46:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     "robh@kernel.org" <robh@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "plyatov@gmail.com" <plyatov@gmail.com>,
        "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v3 05/14] dmaengine: imx-sdma: add mcu_2_ecspi script
Message-ID: <20190521041627.GE15118@vkoul-mobl>
References: <1557249513-4903-1-git-send-email-yibin.gong@nxp.com>
 <1557249513-4903-6-git-send-email-yibin.gong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557249513-4903-6-git-send-email-yibin.gong@nxp.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 07-05-19, 09:16, Robin Gong wrote:
> Add mcu_2_ecspi script to fix ecspi errata ERR009165.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
