Return-Path: <SRS0=bmra=4M=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843AAC11D2F
	for <dmaengine@archiver.kernel.org>; Mon, 24 Feb 2020 16:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5596D20836
	for <dmaengine@archiver.kernel.org>; Mon, 24 Feb 2020 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582561969;
	bh=IxTuBSvPz4fwuvrg5p6mLDmVoKr6O8b6AF2iOLVhOOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ywn0qF+UNo7TVN9fyQ4OCrklyt8LTz8lpDZUvOanLpwPQnxcw3SNhqKGRIXxre1Tz
	 TiOeYcUFFI8PojzHh9a3dJoKokRgrwvHv+ShdstyM4JeBabEOJEj8jgy/zuqWvWBq1
	 1B5H7019epFtqLVQpfvusArma0oWrM7bF4EKqw9k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgBXQct (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 24 Feb 2020 11:32:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:40324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727689AbgBXQcs (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 24 Feb 2020 11:32:48 -0500
Received: from localhost (unknown [122.182.199.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9631D2080D;
        Mon, 24 Feb 2020 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582561968;
        bh=IxTuBSvPz4fwuvrg5p6mLDmVoKr6O8b6AF2iOLVhOOo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qHqxD/XwC7cY65wXFyDKID/s/3+BZZaiv9VKnUi6FSfJ5CERo+nsG0utFueEzuFGm
         xtSGr7VJwbzGeZxP+fr8b3ZGNZ4eHe7QljS97UaI+1VQdzbpnKRw3Ml2vFX347g1+I
         +fN+zYlwjuVRKY9GLbyaQAJUMtVcUpQEaAl6Pa3o=
Date:   Mon, 24 Feb 2020 22:02:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org, jerry.t.chen@intel.com,
        yixin.zhang@intel.com
Subject: Re: [PATCH] dmaengine: idxd: sysfs input of wq incorrect wq type
 should return error
Message-ID: <20200224163243.GY2618@vkoul-mobl>
References: <158213304803.2290.13336343633425868211.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158213304803.2290.13336343633425868211.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 19-02-20, 10:24, Dave Jiang wrote:
> Currently when inputing an unrecognized wq type, we set the wq type to
> "none". It really should return error and not change the existing wq type
> that's in the kernel.

Applied, thanks

-- 
~Vinod
