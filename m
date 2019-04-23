Return-Path: <SRS0=Lzn8=SZ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81500C282E1
	for <dmaengine@archiver.kernel.org>; Tue, 23 Apr 2019 05:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 502672177B
	for <dmaengine@archiver.kernel.org>; Tue, 23 Apr 2019 05:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555996561;
	bh=SaKbq3VWldnSqZadWRhgrbRg6S9DDhZgQ0cGocH1CM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lVmjvg6sFB0rdzWafYaJVgqzAVo3720L5R17h5+3tk9+5Jx0bmztXOHvUCaMCmbGj
	 wzrcGR7tuHZkWBMKN0do+K6MsOF8BAQuAbCjspWxv13hEliKubKVp1/LeNJf4KpHGv
	 i9yCM+QdProdFY2EKZFbE1DQi1XACGzjeX1xRPGI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfDWFQA (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 23 Apr 2019 01:16:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfDWFQA (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 23 Apr 2019 01:16:00 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 395F22064A;
        Tue, 23 Apr 2019 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555996559;
        bh=SaKbq3VWldnSqZadWRhgrbRg6S9DDhZgQ0cGocH1CM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tQQMUbVUsLWRkjAP2inONF1dSy8LWxbDXjvjCThdk7DyNME4SEGVBHWWnTWgxUtqJ
         bG6MkzHnxf84u7FmTLGlS3Qd6nnBYjstLEYHyImXlTjRivQ7/GCecBfwR6/5E0BffQ
         rQStLLPzwfh0XZUPXYDufuQZgRJJ7XrZvIUYf1LA=
Date:   Tue, 23 Apr 2019 10:45:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart+renesas@ideasonboard.com,
        Achim.Dahlhoff@de.bosch.com, yoshihiro.shimoda.uh@renesas.com,
        ylhuajnu@outlook.com, hiroyuki.yokoyama.vx@renesas.com,
        kuninori.morimoto.gx@renesas.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue
 0 is valid
Message-ID: <20190423051554.GF28103@vkoul-mobl>
References: <20190412052914.16006-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190412052914.16006-1-dirk.behme@de.bosch.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190423051554.z89bRi4-xaK3b0UdqHHtUUXXeGR57rj0223H7sh5DSM@z>

On 12-04-19, 07:29, Dirk Behme wrote:
> Having a cyclic DMA, a residue 0 is not an indication of a completed
> DMA. In case of cyclic DMA make sure that dma_set_residue() is called
> and with this a residue of 0 is forwarded correctly to the caller.

Applied both, thanks
-- 
~Vinod
