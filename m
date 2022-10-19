Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D348EC433FE
	for <dmaengine@archiver.kernel.org>; Wed, 19 Oct 2022 13:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbiJSNl0 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbiJSNlE (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 19 Oct 2022 09:41:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CF51AF29;
        Wed, 19 Oct 2022 06:28:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1BF63B822EB;
        Wed, 19 Oct 2022 13:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E65AC433D6;
        Wed, 19 Oct 2022 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666186030;
        bh=bPyf7qhG0vZuSB+2GkOelpmW5vyhp9yjwvOWEO+3gvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SH255SVdAXWhTmndoa93qxEnoDkV3H/+E6n76U9kVyJ8/Z8zwgTHD0DfayDmM3rc1
         CA8THtInMWALw0vYCmN6/qG2zDSZeNdCLwp3rmC7B16od3vTq3JAXYyYXr4bR/xZOE
         ZoN4V2tLd88DIqapNCSxX86TzsLW/3jb8IvDMj6IBoMwZveCMnWE+LnXQz0mh7ApkT
         9RodCnfQcB8GSqYnrtSQlqmnc+zZScI4VudlF2+4c2H5NzA2T8NRVzTcE+vcR0U5Pn
         keVzEW1SOqoLrWQ2cbATPZDDxh36/hYCBzCzx7R5KCk/i4QRgRHF9610m32nsvJf8J
         y3oJQpQpfG3Qw==
Date:   Wed, 19 Oct 2022 18:57:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ioat: Fix spelling mistake "idel" -> "idle"
Message-ID: <Y0/7KhJMl9eBQw99@matsya>
References: <20221004160913.154739-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004160913.154739-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 04-10-22, 17:09, Colin Ian King wrote:
> There is a spelling mistake in the module description. Fix it.

Applied, thanks

-- 
~Vinod
