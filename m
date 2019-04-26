Return-Path: <SRS0=bl+G=S4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A133C43219
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 191CD2089E
	for <dmaengine@archiver.kernel.org>; Fri, 26 Apr 2019 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556278061;
	bh=zBXxIWmmRGWmmbmBaM3ZVBb8Ka7HoT5CAw6AZ/GEdyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MAK5m+FCkvZ2NTrF7J466M0eTS66DonD2/iWXIbq3b1ftyQxrNJQZKeOtMRLjMoZ6
	 wrd0me0RTgpmIO0lkk4ktxqtO5WkOkuURrjdX3FSoTIqAMt2BbnJ7S0ivVMpQbzN4s
	 eD1y7ZPAISGtWGr5Oq2ZQNgtsb3fdmKT3pwHcfGw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfDZL1k (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 26 Apr 2019 07:27:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbfDZL1k (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 26 Apr 2019 07:27:40 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55303206BF;
        Fri, 26 Apr 2019 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556278060;
        bh=zBXxIWmmRGWmmbmBaM3ZVBb8Ka7HoT5CAw6AZ/GEdyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hU3EhyvCDGBu7m1aK/qt6NK+r89U0JlJjxq+k8nywUXLCgqMIWhl+1062BKKoo7XB
         f1oNhj48N/RqxVJhFhzyuQaDknS/qKvAITjRwSbsD+pMHQ3x93eAEpFjyFNMM/w7mc
         Dkr5jpeqgbmEZO5BjA95q8MK+T20j0N8wSvm7JlU=
Date:   Fri, 26 Apr 2019 16:57:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: xgene-dma: fix spelling mistake "descripto"
 -> "descriptor"
Message-ID: <20190426112734.GT28103@vkoul-mobl>
References: <20190415153028.24849-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190415153028.24849-1-colin.king@canonical.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190426112734.dY1ZSPDhIg7dKGcBEaE9JpFN9GYII7YKhiJSpxUevGQ@z>

On 15-04-19, 16:30, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a chan_dbg message, fix it.

Applied, thanks

-- 
~Vinod
