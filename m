Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955CAC433DB
	for <dmaengine@archiver.kernel.org>; Wed,  3 Feb 2021 11:30:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A7CB64DDE
	for <dmaengine@archiver.kernel.org>; Wed,  3 Feb 2021 11:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhBCL3o (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:29:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:40716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234207AbhBCL2R (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 3 Feb 2021 06:28:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FD2264F61;
        Wed,  3 Feb 2021 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612351656;
        bh=mUYdp4U3vFf1iFUtKaZfsqysLilt5siap4qfoik4zEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C8z6Swkn8co22JQkpD1Lm7Hp22j+UNAoh7kEEcNFMqPMcjS4DyNmJs5+qrfeb5lH6
         2pf4QxwXRCMIOuGHII/CxYFvJC6sFVEVfIOZWN9V56EB772DSdPeNFfUdNw+cU5Uba
         Bru3xLO44rMD1gM2VBAGGmnu2wotPdgV5RMcgsaX8qoHIPMbrFBD93uaSMlOEtLn3u
         6/p5+lhEFJe4PyBn3pt/YkF1ydpdWhNom+Ijn3SLUU1AbaHKwqBFeCwnN4lfnxo44x
         eJdAMkEFo8I1fa8r4wrOWwseen6n9fTY7JbDlZjueeJP8yjURIrx51p+x9KzMEtzh+
         FIozW90sHCITQ==
Date:   Wed, 3 Feb 2021 16:57:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Sanjay Kumar <sanjay.k.kumar@intel.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: idxd: check device state before issue
 command
Message-ID: <20210203112732.GP2771@vkoul-mobl>
References: <161219313921.2976211.12222625226450097465.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161219313921.2976211.12222625226450097465.stgit@djiang5-desk3.ch.intel.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 01-02-21, 08:26, Dave Jiang wrote:
> Add device state check before executing command. Without the check the
> command can be issued while device is in halt state and causes the driver to
> block while waiting for the completion of the command.

Applied, thanks

-- 
~Vinod
