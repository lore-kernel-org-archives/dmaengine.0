Return-Path: <SRS0=0Nna=EE=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF52EC56201
	for <dmaengine@archiver.kernel.org>; Thu, 29 Oct 2020 00:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A923120790
	for <dmaengine@archiver.kernel.org>; Thu, 29 Oct 2020 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603932855;
	bh=G99llodwo7LN/VxVH9PSAtp57j5+vnW+TiOqCIEpROA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2qD5BMnrJsTGki7uA/8a3W2M4JKHhO7qg5dJtGjv4nle9SPhj89/X7n60XTJzoi38
	 ftynqKyNluAB9me1hhTVh8MX00o/P7cfvTpwvQp+PfCKhVnKsbJVjfr6cpZpwN1nP9
	 R2XCuL7IRfiT4xLPLVqTvJV5tgVZmz4z2uY73k5g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731725AbgJ1WTM (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731768AbgJ1WRo (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:44 -0400
Received: from localhost (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6B062245F;
        Wed, 28 Oct 2020 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603866347;
        bh=G99llodwo7LN/VxVH9PSAtp57j5+vnW+TiOqCIEpROA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R3Z+rG8M4FiWQHPAxuhr7HCyoRQNXg3SSumdnqn/JVNCocwn2IpaU2wXprUQKKq0/
         vAS7rdiGm1WM8+xWMQFjKiWBhCQALS6+hOpP4iSTJaHVjsIsXKvaRWHdFuEcoxsVFV
         0FNPn7xkelHhmvTO0mcTQ6gGqr7dt0yET793mr4k=
Date:   Wed, 28 Oct 2020 11:55:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild-all@lists.01.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] dmaengine: ppc4xx: make ppc440spe_adma_chan_list
 static
Message-ID: <20201028062542.GN3550@vkoul-mobl>
References: <20201019155756.21445-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019155756.21445-1-krzk@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 19-10-20, 17:57, Krzysztof Kozlowski wrote:
> The ppc440spe_adma_chan_list file-scope variable is not used outside of
> the unit so it can be made static.

Applied both, thanks

-- 
~Vinod
