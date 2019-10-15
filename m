Return-Path: <SRS0=cP/1=YI=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB6CC10F14
	for <dmaengine@archiver.kernel.org>; Tue, 15 Oct 2019 10:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A56C21848
	for <dmaengine@archiver.kernel.org>; Tue, 15 Oct 2019 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571134332;
	bh=w3QWewbpPrxAZCTWgN3UGwB7e/KG44sxNvyNwpRlQj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Y9rUukJS5LgYSsQJFj1ihSzqyHtXdpUy3I4ac/cyHgWgKKa8w2p2PCZjndjlZLgZs
	 2vdgbESQnMNcjGw930ZgVb3PgrFDb9SgsyJ+g8KDOTrs32IxPCcKHmXOmP4x3RKT7t
	 d4E0gGBCNU28hGtuEBjpyvWLwmdmRalCL7zZywnQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbfJOKMM (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 15 Oct 2019 06:12:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbfJOKML (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 15 Oct 2019 06:12:11 -0400
Received: from localhost (unknown [171.76.96.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 734AA2089C;
        Tue, 15 Oct 2019 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571134331;
        bh=w3QWewbpPrxAZCTWgN3UGwB7e/KG44sxNvyNwpRlQj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ioPd3eBOJwoeBbOzPOjxdv9tjH3xph969rVlEMM87jYI+uuRVuozAatjq/JwrXN4z
         cq2a/z+3Hap1CIZHDn+2vFsKSZXZqpF+1dZuWQeODEH6W33HWPNL5/ZrWuMhtypRzF
         hWn7+tvj3e+FrP7IzN+gNwB09ruiPQGyGCCfSgEM=
Date:   Tue, 15 Oct 2019 15:42:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc:     dan.j.williams@intel.com, michal.simek@xilinx.com,
        nick.graumann@gmail.com, andrea.merello@gmail.com,
        appana.durga.rao@xilinx.com, mcgrof@kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next 0/4] dmaengine: xilinx_dma: Minor functional fixes
Message-ID: <20191015101206.GQ2654@vkoul-mobl>
References: <1569495060-18117-1-git-send-email-radhey.shyam.pandey@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569495060-18117-1-git-send-email-radhey.shyam.pandey@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 26-09-19, 16:20, Radhey Shyam Pandey wrote:
> This patchset fixes axidma simple mode 64-bit transfer.
> It clears vdma control registers before update, in probe
> use devm_platform API and remove clk_get error in case of
> EPROBE_DEFER.  

Applied, thanks

-- 
~Vinod
