Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25861C4360C
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 16:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEE1C6135F
	for <dmaengine@archiver.kernel.org>; Mon, 12 Apr 2021 16:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240489AbhDLQsk (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 12 Apr 2021 12:48:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343681AbhDLQjK (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 12 Apr 2021 12:39:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 604F961042;
        Mon, 12 Apr 2021 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618245532;
        bh=jCA/ywY3otFKg74t/80g16fuOxllt97XhBVrFAxwDpo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ThMd6G3Rf2C2V3uBly4LbfRCsQFbx/STY7WHGqdo3wXKlaIPZ8mu/WZ8VBXxzx/RC
         5WprGof5NtNivyusZ0/pWmkYPlQH0WzECS5sRMm82Qeze9dTshoyDwHBWTukneOtGn
         7nAzDL946PWBefmcZtIa7JfzAt3PNhCNlfLRvGP5uqAW3F99Rfa+xIBBVPjNYYRD1r
         ZReh+9qwIhZ5zaYsFjrd6G/Phy6D+uv4eq+krRYjk9ekDz1MAlxxyRbZzNuRS+JeCH
         PA9ndmmMys1+z9pZosFSQv5iLU9DeK6EV33EM1svgkTV+fxLJDWKjReBeWB2tbkkuO
         S6XzbZA9qdLug==
Date:   Mon, 12 Apr 2021 22:08:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Shreenivaas Devarajan <shreenivaas.devarajan@intel.com>,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH v4] dmaengine: idxd: fix wq cleanup of WQCFG registers
Message-ID: <YHR3l/J5iiAZaPDR@vkoul-mobl.Dlink>
References: <161824330020.881560.16375921906426627033.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161824330020.881560.16375921906426627033.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-04-21, 09:02, Dave Jiang wrote:
> A pre-release silicon erratum workaround where wq reset does not clear
> WQCFG registers was leaked into upstream code. Use wq reset command
> instead of blasting the MMIO region. This also address an issue where
> we clobber registers in future devices.

Applied, thanks

-- 
~Vinod
