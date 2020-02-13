Return-Path: <SRS0=zPRf=4B=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D915BC3F68F
	for <dmaengine@archiver.kernel.org>; Thu, 13 Feb 2020 14:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0BC024650
	for <dmaengine@archiver.kernel.org>; Thu, 13 Feb 2020 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581605199;
	bh=W82GgC4McSrXk1Q92M7zOg/KKPxsVJA4PeYnPwzdY1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ME8vhtA9Gb0HW1R9HQhnyqSZoLzrxKWmelHFBiT04bnOfHzdsIHnS9mEbdlTVjU+F
	 0cQNhVN7boTfcL18lAysvrOQmwQ0/S9H7Yevy4om3jK6KTaCHPYr6eyBDjOAEbAEAV
	 tYYEVocmQ5kF6CRym8fWYTXwXYGmiyJ4KTXVP7pk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgBMOqj (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 13 Feb 2020 09:46:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:58076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgBMOqj (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 13 Feb 2020 09:46:39 -0500
Received: from localhost (unknown [106.201.58.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4EC22073C;
        Thu, 13 Feb 2020 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581605198;
        bh=W82GgC4McSrXk1Q92M7zOg/KKPxsVJA4PeYnPwzdY1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d2tVYJDW0otBDp/xIhPuC5x72IbITOGml3006xOnvsRGafUYR6VDozarGzriLQcT0
         phXNBZtxsPqirxMOs8JQiLv2Sfx8uBcfbDQBB3MYu5Eb028FFGOLgNTGYlOHdFDIv9
         XY/nzzWTa9rEOIBq8Znfs0p3DF6FdasLsWkiCb9A=
Date:   Thu, 13 Feb 2020 20:16:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: uniphier-mdmac: replace zero-length array
 with flexible-array member
Message-ID: <20200213144632.GL2618@vkoul-mobl>
References: <20200213003535.GA3269@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213003535.GA3269@embeddedor.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 12-02-20, 18:35, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Applied, thanks

-- 
~Vinod
