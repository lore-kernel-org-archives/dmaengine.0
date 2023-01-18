Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26937C32793
	for <dmaengine@archiver.kernel.org>; Wed, 18 Jan 2023 12:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjARMsi (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjARMrc (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 18 Jan 2023 07:47:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FFAC48A07;
        Wed, 18 Jan 2023 04:10:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D77EB81123;
        Wed, 18 Jan 2023 12:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7AC433F0;
        Wed, 18 Jan 2023 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674043804;
        bh=uutO3CtT+wA7qypDIPP4zl5/993/yVjXfqjCPyqyzpY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nn3TTGjS1gA4rYq2FCcHRr2f+F5vUhNpdnLe/AyfPgiuA/basd2FumNwznsRvIfAC
         3e4pxbtbUmSJq6vVwf4Am+zJAYBU5i2zIARzykggqmsRSkFtW7pmtyvaZX8KcBqoB0
         9hoS7G++lH3eYmfErffopbmmId25xEa6U5QdJlM7l0vZhN4MkPotshbUcFLasUjo0f
         xcykrYegLGZxxYYPO98s0S+rjQeYmyRVirUnnNcspf0+fesod+wRaKH/BJQB6sj1ya
         8COiyj0Oc5QJByw+OzzVuGHmAGPqxXNLc33ufCl17fQmuxBRzRg65xEIuk+W+J7VcD
         R8g5C+EsuVnvA==
Date:   Wed, 18 Jan 2023 17:37:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] dmaengine: sun6i: Set the maximum segment size
Message-ID: <Y8fhFCUzYPwu3Y+m@matsya>
References: <20230101193605.50285-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230101193605.50285-1-samuel@sholland.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 01-01-23, 13:36, Samuel Holland wrote:
> The sun6i DMA engine supports segment sizes up to 2^25-1 bytes. This is
> explicitly stated in newer SoC documentation (H6, D1), and it is implied
> in older documentation by the 25-bit width of the "bytes left in the
> current segment" register field.
> 
> Exposing the real segment size limit (instead of the 64k default)
> reduces the number of SG list segments needed for a transaction.

Applied, thanks

-- 
~Vinod
