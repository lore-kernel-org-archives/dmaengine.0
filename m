Return-Path: <SRS0=tuOs=YH=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC1FC47404
	for <dmaengine@archiver.kernel.org>; Mon, 14 Oct 2019 07:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC9702083B
	for <dmaengine@archiver.kernel.org>; Mon, 14 Oct 2019 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571037078;
	bh=6q4gU/LtAUycFwqw30WIYo/sEjc55qm4peqIZTtuQi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vAV24uS57EgrfVyBMXd/fjAZekcpmFk3IsKq1wXU66K9Phv7DI7ejo0ea9z1bTRyG
	 +cp28P4ooYEVWM+h0MYd3EP3r7wAu2vzJB/onjMLuzEws7t1TOYRT3Px+4Z5dPV9im
	 7PNjTERqTiXY8FN2zMAn2rDkSbyll/kIe8cCYWYs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbfJNHLR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 14 Oct 2019 03:11:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729928AbfJNHLR (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 14 Oct 2019 03:11:17 -0400
Received: from localhost (unknown [122.167.124.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26AE72083B;
        Mon, 14 Oct 2019 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571037076;
        bh=6q4gU/LtAUycFwqw30WIYo/sEjc55qm4peqIZTtuQi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D8O87hu78qWHtUicStxL8s4EaUeE5JZHOcevhMmFJyjTrsi51f0pNVvJYfJU9jJYF
         lvx5MWXrfinKdDjSs9JFQ4S2H04bUzuvuHiwh5TNDq1Qo2Yqg+cXoAjdpToxAzzik7
         z6u27Z8mnSym+M2ryHd8CHNsg+tjJXDzxK+7b1jg=
Date:   Mon, 14 Oct 2019 12:41:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     jonathanh@nvidia.com, ldewangan@nvidia.com,
        thierry.reding@gmail.com, dmaengine@vger.kernel.org,
        linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] dmaengine: tegra210-adma: fix transfer failure
Message-ID: <20191014071112.GC2654@vkoul-mobl>
References: <1568626513-16541-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568626513-16541-1-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-09-19, 15:05, Sameer Pujar wrote:
> >From Tegra186 onwards OUTSTANDING_REQUESTS field is added in channel
> configuration register(bits 7:4) which defines the maximum number of reads
> from the source and writes to the destination that may be outstanding at
> any given point of time. This field must be programmed with a value
> between 1 and 8. A value of 0 will prevent any transfers from happening.
> 
> Thus added 'has_outstanding_reqs' bool member in chip data structure and is
> set to false for Tegra210, since the field is not applicable. For Tegra186
> it is set to true and channel configuration is updated with maximum
> outstanding requests.

Applied, thanks

-- 
~Vinod
