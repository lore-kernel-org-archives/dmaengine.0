Return-Path: <SRS0=veQE=C3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFE4C43464
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 07:12:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B15D02176B
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600413176;
	bh=+mcKGaRIHRgzkR2y8o71owNlJFDkesVTMde4xFq6i1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vxB/NYMPH/LL7aScqcgEofget73NQ4WRTF41aHP8ARdmeb4DTnFaZGaYH+7iXlSdE
	 zWY24Gwc9ZQdUQQgOf+xIp2WscSNkMlf+lt4YcP1KL/OKTgw3Qi9g3bfskspK+B9Nm
	 nFDjEqBSpeioxkkj+bL8GhRv1QoMDKH7H2rI6FKc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgIRHM4 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 18 Sep 2020 03:12:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:47704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgIRHM4 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 18 Sep 2020 03:12:56 -0400
Received: from localhost (unknown [136.185.124.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C95C9214D8;
        Fri, 18 Sep 2020 07:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600413175;
        bh=+mcKGaRIHRgzkR2y8o71owNlJFDkesVTMde4xFq6i1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HOOz3Xeh0xooGWC8ULM0LTLPQzvQ5rU57lcJ4pq4cpfkqYMs3BKHzOaC4ecCJPCkd
         TRJ9czp7V/ZXnADNweK/b7L+82t87C59cjGI2l3tT1WpO/ExN1pqm+k38Gr4E4S2Nv
         u8Ton6GuDxqeNeK9bhx/CfBKSKNmmy0cLW+TcwI8=
Date:   Fri, 18 Sep 2020 12:42:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc:     dmaengine@vger.kernel.org, Joao Pinto <Joao.Pinto@synopsys.com>
Subject: Re: [PATCH] dmaengine: dw-edma: Fix Using plain integer as NULL
 pointer in dw-edma-v0-debugfs.c
Message-ID: <20200918071251.GJ2968@vkoul-mobl>
References: <6569fd8ca5ddaa73afef1241ad7978c2a1fae0c7.1600206938.git.gustavo.pimentel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6569fd8ca5ddaa73afef1241ad7978c2a1fae0c7.1600206938.git.gustavo.pimentel@synopsys.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 15-09-20, 23:56, Gustavo Pimentel wrote:
> Fixes warning given by executing "make C=2 drivers/dma/dw-edma/"
> 
> Sparse output:
> drivers/dma/dw-edma/dw-edma-v0-debugfs.c:296:49: warning:
>  Using plain integer as NULL pointer

Applied, thanks

-- 
~Vinod
