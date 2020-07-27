Return-Path: <SRS0=vTIU=BG=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B54C433DF
	for <dmaengine@archiver.kernel.org>; Mon, 27 Jul 2020 09:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D17F2075A
	for <dmaengine@archiver.kernel.org>; Mon, 27 Jul 2020 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595840898;
	bh=cKjSFajTMTVIbHiGmbvp/knDuFdf5FSpOZEQq8ErUYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=o7dvhM9sCLY30Z5davK3lVoDP7+FmQLfv4mGFn3JDL3nPI+tj2/eVRHFq/SHBoP40
	 1MUmMuz3lIQIHYWI56YOUWRDroNBnLpGosaLS/NDC3zDt53AN0jAHXFTaRQ6M+gTVV
	 rB9DdLQOqJB7Qtd8u87OV8/rhI+F/SytthW3kIQw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgG0JIS (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 27 Jul 2020 05:08:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbgG0JIS (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 27 Jul 2020 05:08:18 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0232320714;
        Mon, 27 Jul 2020 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595840897;
        bh=cKjSFajTMTVIbHiGmbvp/knDuFdf5FSpOZEQq8ErUYg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L/otVaVkqNLzwix6OOCOALaDlCkcUVuasQYn6UFNy02/7vt4FE3rB6Y90BmJ1nMQd
         fB8Y3TWoyl/FmI/pJ7Q9F6nvxoo/sLpDB1TcXsQ4ILoBvGMMTaGk0c0dA0fQqt44P1
         K4XZ2YT9KOsYfGTqjnkf5Nkt6PtmRqyV5Us4hwtE=
Date:   Mon, 27 Jul 2020 14:38:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Nikhil Rao <nikhil.rao@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: add missing invalid flags field to
 completion
Message-ID: <20200727090814.GO12965@vkoul-mobl>
References: <159526025819.49266.13176787210106133664.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159526025819.49266.13176787210106133664.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 20-07-20, 08:50, Dave Jiang wrote:
> Add missing "invalid flags" field to completion record struct.

Applied, thanks

-- 
~Vinod
