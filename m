Return-Path: <SRS0=EEJZ=CD=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4E1C433E1
	for <dmaengine@archiver.kernel.org>; Tue, 25 Aug 2020 11:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB60F2071E
	for <dmaengine@archiver.kernel.org>; Tue, 25 Aug 2020 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598353805;
	bh=w30OqiibvtacniwjHg2viVJ3Iyg7WO59WpSOlIJFLLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=p9Iw3a9upCPCnjdLsNrwIsZoZ29DcjGcNvTdU9LBpsqw66mhrj2aNFaNpHrC7+zCR
	 6tOVIdOkp2TPyCqZfErcOICIkZ3sx5eGeOOFRCfTlEotRgRM925YRU8j+8PFCX/mZS
	 3TOxQhuvsoNbc/aOFZDnEcl8Lw2g6QkSiGf8rq6o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgHYLKE (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 25 Aug 2020 07:10:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgHYLKD (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 25 Aug 2020 07:10:03 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 650732071E;
        Tue, 25 Aug 2020 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598353803;
        bh=w30OqiibvtacniwjHg2viVJ3Iyg7WO59WpSOlIJFLLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=boGXDU8Wk/NYRwIb8BenXAZhIhVMJ7lwrQhsKS8NF3joV5PwcvK+G2ndNujsY1lMn
         JWgwTZ3QOu4lS+3ClbV7wxS52PVFtFCbiSK7ufrbEGIQZUHX5S1gvIUFPWFeduQJFt
         9cPplCGFo/ZwewhnrNLo86+HKc+wOaiHIBMFZ+uQ=
Date:   Tue, 25 Aug 2020 16:39:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc:     dmaengine@vger.kernel.org, Joao Pinto <Joao.Pinto@synopsys.com>
Subject: Re: [PATCH] dmaengine: dw-edma: Fix typo in comments offset
Message-ID: <20200825110959.GJ2639@vkoul-mobl>
References: <d7c7e56a83a13a62438a6c1a23863015a3760581.1597327654.git.gustavo.pimentel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7c7e56a83a13a62438a6c1a23863015a3760581.1597327654.git.gustavo.pimentel@synopsys.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 13-08-20, 16:14, Gustavo Pimentel wrote:
> Fix typo in comments offset related to padding bytes.

Applied, thanks

-- 
~Vinod
