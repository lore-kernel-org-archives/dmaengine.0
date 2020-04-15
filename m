Return-Path: <SRS0=H4t5=57=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5D2C2BA19
	for <dmaengine@archiver.kernel.org>; Wed, 15 Apr 2020 15:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66C622078B
	for <dmaengine@archiver.kernel.org>; Wed, 15 Apr 2020 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586965565;
	bh=cuaimWd8/zmkTDXGtNNm5fx0JUn3LdgJFtrs/J1SPeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vp3AIpVJ/u2pCu+h/t3p+Q8PG+2zYlQAeF73FJ3ehZNEGPv0CGssRmmbsupWq2oCr
	 6yg/PA32jtr3xaYqBpGqLphTVyx7poevcqQ/aP2FtZ9k3RwE/fBSG5ZbqZKgwdyWG/
	 pRnpLZ4/C/0T7yhe2X/t/+dCrrqTc369qmDIKWp4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414893AbgDOPqD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 15 Apr 2020 11:46:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1414879AbgDOPqA (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 15 Apr 2020 11:46:00 -0400
Received: from localhost (unknown [106.201.106.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 644462078B;
        Wed, 15 Apr 2020 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586965560;
        bh=cuaimWd8/zmkTDXGtNNm5fx0JUn3LdgJFtrs/J1SPeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKsM1EM/Q/XY6y0vo9gZwrCKEqSjUECTeDT++Ss0nPwiTVbqd/1PPpkC4zP+1v83y
         WqDqkznDAt+NsdBR6EuM5KpGhvaEcUV4zUvTSy8nMnEaMQkziUrOQvu1b5aBuJF9bQ
         KwRU7MzojGEYKFSdF05Am2/1BIc+UpjCYwEYOrw4=
Date:   Wed, 15 Apr 2020 21:15:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        dan.j.williams@intel.com
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Disable memcopy via MCU NAVSS on
 am654
Message-ID: <20200415154550.GQ72691@vkoul-mobl>
References: <20200327144228.11101-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327144228.11101-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 27-03-20, 16:42, Peter Ujfalusi wrote:
> Trace of a test for DMA memcpy domains slipped into the glue layer commit.
> The memcpy support should be disabled on the MCU UDMAP.

Applied, thanks

-- 
~Vinod
