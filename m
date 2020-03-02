Return-Path: <SRS0=PJgd=4T=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431FAC3F2D2
	for <dmaengine@archiver.kernel.org>; Mon,  2 Mar 2020 07:14:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 180CE24697
	for <dmaengine@archiver.kernel.org>; Mon,  2 Mar 2020 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583133255;
	bh=wawn5S7WdrfHFqJcu96OmyY5P/i87bFAmG/GVbarqkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LItotm1PNWr5iEj0JU26/3G4VazDS+QUdvC/CMk0yd2Ovb4CgEdptHVSG9XPmxAf7
	 ahT2N1Pbl9Oh5A771PqUNprGmBwEN4oIX/DNq6FaLItkZsbH/hWz3oaqwvFRI0wM8/
	 ggBBqrbJbb8hREFQD/LAspDUdd4tufemsHPkscjA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgCBHOO (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 2 Mar 2020 02:14:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:38458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgCBHOO (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 2 Mar 2020 02:14:14 -0500
Received: from localhost (unknown [171.76.77.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EE0E24697;
        Mon,  2 Mar 2020 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583133254;
        bh=wawn5S7WdrfHFqJcu96OmyY5P/i87bFAmG/GVbarqkQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VLuqt+lDR4MUUrhWI+aUpl9jB2n/Nkik4UE+l3zls8gmB6waZgalXQIILpWVp/ZmH
         bu+Dmy3Rn1KZl0VYuQ732zVqolducLbgmLQDOO+cP9Kxg0NUcSCdNu41pUdKAoDdlJ
         pVrel3Xk3+2VBImYo8Qeg/Xjh+pClnUEoW5f5rtE=
Date:   Mon, 2 Mar 2020 12:44:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: check return result from check_vma() in
 cdev
Message-ID: <20200302071410.GG4148@vkoul-mobl>
References: <158264926659.9387.14325163515683047959.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158264926659.9387.14325163515683047959.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 25-02-20, 09:47, Dave Jiang wrote:
> The returned result from the check_vma() function in the cdev ->mmap() call
> needs to be handled. Add the check and returning error.

Applied, thanks

-- 
~Vinod
