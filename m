Return-Path: <SRS0=+vnI=4H=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78ABAC34047
	for <dmaengine@archiver.kernel.org>; Wed, 19 Feb 2020 09:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4224F21D56
	for <dmaengine@archiver.kernel.org>; Wed, 19 Feb 2020 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582103983;
	bh=128eHlw3wzlODku61UIR6+ucTbXEDzAi1KbfLtK/lUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uMPn5xnUbL1oNbaAmGUN0N1ckir+SHREjKw690llLHMczOPEkqmFHgO7tckYoT+8a
	 HNNEAhPPfVdcyx0Bns9NT37YvPdvzCAnrPM62ES3J6Y38Usar0PVtpZsbvf9u6Ovxj
	 I2KmD4M3d5qnxq8pwAunQdLWWU9uKvKTnt9fbWzI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgBSJTn (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 19 Feb 2020 04:19:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:51110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgBSJTm (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 19 Feb 2020 04:19:42 -0500
Received: from localhost (unknown [106.201.32.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E40D24656;
        Wed, 19 Feb 2020 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582103982;
        bh=128eHlw3wzlODku61UIR6+ucTbXEDzAi1KbfLtK/lUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HKfY8ZIgKA5lD+QQANloL7MGV+X33r48y+q27o6kTsr3fSnEJzf6fLXRz9Pmg/GlV
         7b+6LZu0VLuNAH7EXpSq2VDBRQ1LRrNjt+qe35veDQWU50jfBE1Y3SJVJCNk4TL60d
         1SZxR/htN4tuXkCqGJWyd/HFxDOCV2o5FrnX1HDk=
Date:   Wed, 19 Feb 2020 14:49:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org, jerry.t.chen@intel.com
Subject: Re: [PATCH] dmaengine: idxd: correct reserved token calculation
Message-ID: <20200219091937.GF2618@vkoul-mobl>
References: <158204471889.37789.7749177228265869168.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158204471889.37789.7749177228265869168.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 18-02-20, 09:51, Dave Jiang wrote:
> The calcuation for limit of reserved token did not take into account the
> change the user wanted vs the current group reserved token. This causes
> changing of the reserved token to be possible only after we set the value
> of the reserved token back to 0. Fix calculation so we can set a value that
> is non zero for reserved token.
> 
> Fixes: c52ca478233c ("dmaengine: idxd: add configuration component of driver")
> 
You don't need empty line here

> Reported-by: Jerry Chen <jerry.t.chen@intel.com>
> Signed-off-by: Dave Jiang <dave.jiang@intel.com>

Applied after removing the empty line, thanks

> ---
>  drivers/dma/idxd/sysfs.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 298855ca934f..edbfe83325eb 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -519,7 +519,7 @@ static ssize_t group_tokens_reserved_store(struct device *dev,
>  	if (val > idxd->max_tokens)
>  		return -EINVAL;
>  
> -	if (val > idxd->nr_tokens)
> +	if (val > idxd->nr_tokens + group->tokens_reserved)
>  		return -EINVAL;
>  
>  	group->tokens_reserved = val;

-- 
~Vinod
