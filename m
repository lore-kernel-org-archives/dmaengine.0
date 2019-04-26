Return-Path: <SRS0=bl+G=S4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED33C43219
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE1892077B
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556279927;
	bh=YqFqQmwEejQETrkmodn0e21QBKZPRzIzdLWkCBzS2sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=elRh2hMtBXJTfYcmNmHWgQZw390PFQ6NqdTkjW8yUNhMel97XIwdHC2AT19ykbi5n
	 xQdq9btpRZ4UFYPgvQR3PnBetVq7zJil25uoXeEO+Z23Tq9Gzz+ulnLS/Y6uW/Hoyf
	 zR9pldGOnVSTrfOWz1PtsPHXlHwMkVbgJWdyIyOw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfDZL6r (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 26 Apr 2019 07:58:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:48616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbfDZL6r (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 26 Apr 2019 07:58:47 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00D12206C1;
        Fri, 26 Apr 2019 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556279926;
        bh=YqFqQmwEejQETrkmodn0e21QBKZPRzIzdLWkCBzS2sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wHjR0azsZg+RlaXu00W7bvlF05QT6L+HOB1+CgzFvt7NeF6Sh89V6+StqkUcCLy8Q
         lxNhVf80gpdXU6yR/p83h70rzB11J7A+vhLbpK+NQi7stUGys1YVPPQ1is9GwAtTJ8
         IDVZLyKthRMnttwQrSZ7qAtwXEnKWAIBwDkeXJcE=
Date:   Fri, 26 Apr 2019 17:28:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     shun-chih.yu@mediatek.com
Cc:     Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com
Subject: Re: [PATCH 1/1] dmaengine: mediatek-cqdma: fix wrong register usage
 in mtk_cqdma_start
Message-ID: <20190426115840.GA28103@vkoul-mobl>
References: <1556164430-30724-1-git-send-email-shun-chih.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <1556164430-30724-1-git-send-email-shun-chih.yu@mediatek.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190426115840.P7WBW-Oyl4TdmPhiVVwT5bNcRYLK0v1jYV82l9YYjoM@z>

On 25-04-19, 11:53, shun-chih.yu@mediatek.com wrote:
> From: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> 
> This patch fixes wrong register usage in the mtk_cqdma_start. The
> destination register should be MTK_CQDMA_DST2 instead.

Applied and cced stable, thanks
-- 
~Vinod
