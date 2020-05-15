Return-Path: <SRS0=Szr/=65=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080E1C433E0
	for <dmaengine@archiver.kernel.org>; Fri, 15 May 2020 05:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5052206F1
	for <dmaengine@archiver.kernel.org>; Fri, 15 May 2020 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589522116;
	bh=+EJ5OP4XBWtQX5FuZhwQz6o9tHlBGTDluzVjEosgjaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yhRWVKAj8cgifjNji82s8tIOo6bZnS2W9/Zh0JcLpxe3z8aZ2yZUTDmXSCNIQVZb/
	 GA/rLem5hE1B8X17+Vix4XOMDjy3Vdd/+q818Q+rPfrpRpgxfj0C3cFpyOMot6nMzW
	 68kvXmCYpPK8UVQddc/Ufa9hHsAKOyaA2oaSrtEc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgEOFzQ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 15 May 2020 01:55:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgEOFzQ (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 15 May 2020 01:55:16 -0400
Received: from localhost (unknown [122.178.196.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4994B2054F;
        Fri, 15 May 2020 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589522116;
        bh=+EJ5OP4XBWtQX5FuZhwQz6o9tHlBGTDluzVjEosgjaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FqUYZ9c5Ze4U0dYvUNievv0J+LNLhKMdLGH6su/xyGMHU7Mt0mwAtfKicaX5qfKj4
         CnBMYXSxffSgbITsI1dje71VPOPADQXJDym8k7iBNB+yx6FEtYBvsG3eeL0oLtZyu9
         dUBs+D0gM1G8q7T+J9Jqo0v8+JoJ0S9dACvKSpzw=
Date:   Fri, 15 May 2020 11:25:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Remove udma_chan.in_ring_cnt
Message-ID: <20200515055511.GE333670@vkoul-mobl>
References: <20200512134611.6015-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512134611.6015-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-05-20, 16:46, Peter Ujfalusi wrote:
> The in_ring_cnt is not used for anything, it can be removed.

Applied, thanks

-- 
~Vinod
