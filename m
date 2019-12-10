Return-Path: <SRS0=KFUa=2A=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536D8C43603
	for <dmaengine@archiver.kernel.org>; Tue, 10 Dec 2019 06:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25C14206E0
	for <dmaengine@archiver.kernel.org>; Tue, 10 Dec 2019 06:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575957773;
	bh=syvbhAR/ADsJyMnOlOSI0B7aatrRGP2kpxTU6u/WAOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=d8h4yOTbQvO4lmKTiOUShUXNjkHwDi39LFOBH/g5pe1mI78Mh5EkUqXZcJ+qrOyhT
	 oIeMDCp7XWKC6gTIzjsY83fuXjj+IBQz7/74jyOKo2tthlP6HR3c9mXUlsWeifUBsY
	 +cV13ZqakNYxMWgLU2sRUovD7JSQAUQs8ZzKWnj0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfLJGCw (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 10 Dec 2019 01:02:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:50322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfLJGCw (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 10 Dec 2019 01:02:52 -0500
Received: from localhost (unknown [106.201.45.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32A9520652;
        Tue, 10 Dec 2019 06:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575957772;
        bh=syvbhAR/ADsJyMnOlOSI0B7aatrRGP2kpxTU6u/WAOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NX5YT5DeCowC/Mi+uHgqUvsvtunko8BdoEGU+P34H0KdO31rcS7Zj/A1SAbX4B9p7
         Asf/rhbEEjj/ZJenjdI7a8FexDk2KvvFlFHau+IYBJ9w2eV2fcCRAN3/V648JsjU1Z
         qSZj1x+Gl5PHEwgDsADpk9m0xB+RLDzPio7BF+0Q=
Date:   Tue, 10 Dec 2019 11:32:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: ti: edma: add missed operations
Message-ID: <20191210060247.GQ82508@vkoul-mobl>
References: <20191124052855.6472-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191124052855.6472-1-hslester96@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 24-11-19, 13:28, Chuhong Yuan wrote:
> The driver forgets to call pm_runtime_disable and pm_runtime_put_sync in
> probe failure and remove.
> Add the calls and modify probe failure handling to fix it.
> 
> To simplify the fix, the patch adjusts the calling order and merges checks
> for devm_kcalloc.

Applied, thanks

-- 
~Vinod
