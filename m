Return-Path: <SRS0=uof7=B3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D21BC433DF
	for <dmaengine@archiver.kernel.org>; Mon, 17 Aug 2020 05:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 500522078A
	for <dmaengine@archiver.kernel.org>; Mon, 17 Aug 2020 05:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597641588;
	bh=wjJ94GU+eyAWzet/4ricC+nJKG4hygniNkU+kcxbLRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1MQe94qy8Xa9h6tD1TdPrxbisSaoYcgkKM3h+VPjSuBclxEB4YyLddZmOFICuuKyl
	 WcjJvhBpbvfYcPtDznhJguRJb7V6oFOW3DbiwmA34i1ty8tEn6n5nnbLXV3GwVh2CH
	 xATNTh+gk/CyBJfBwCPy4B0aOU0Lzt46gMJRXwFY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgHQFTs (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 17 Aug 2020 01:19:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgHQFTr (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 17 Aug 2020 01:19:47 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1044420758;
        Mon, 17 Aug 2020 05:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597641587;
        bh=wjJ94GU+eyAWzet/4ricC+nJKG4hygniNkU+kcxbLRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=idlQJqt5ucfXWJJUQYbwxeBVFqIHYi1paI8d8s88mHBwd8QUH1jrS0q9TNsFsaxum
         6x+gH2NCq3kX60iU95G6ODbT77O3J42SNVvqqh7M7XUAf8VcKy1F0DLAIYCkIPaoZY
         QX0Gsr45pyzHuswLtG6T3YWQmPzzONEkMhkZSO74=
Date:   Mon, 17 Aug 2020 10:49:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Nikhil Rao <nikhil.rao@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: clear misc interrupt cause after read
Message-ID: <20200817051941.GH2639@vkoul-mobl>
References: <159603824665.28647.5344356370364397996.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159603824665.28647.5344356370364397996.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 29-07-20, 08:57, Dave Jiang wrote:
> Move the clearing of misc interrupt cause to immediately after reading the
> register in order to allow the next interrupt to be asserted.

Applied, thanks

-- 
~Vinod
