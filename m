Return-Path: <SRS0=E1jm=DW=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7244C433DF
	for <dmaengine@archiver.kernel.org>; Thu, 15 Oct 2020 07:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B51D22247
	for <dmaengine@archiver.kernel.org>; Thu, 15 Oct 2020 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602747110;
	bh=L5cgGgIHOY7d7lauAxttKpfU48/5ENhOve/vKZtz4Ko=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=RksXPfpHATMXcV5fLt7VHfHy6EZm9Tiw8y+2tvYWTCOna4DkF3R8L2OgbXTYGpCxf
	 ZBR8eBYn9kuQnfTejjR0YFz9ZSW5B0wM2S+i6cbprJcsW4ekfnD3m/vk2gIArwqbon
	 mhesPPoX4wh1P9OJmyCZZDnNOFttUgOLnyVC/kAQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgJOHbu (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 15 Oct 2020 03:31:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgJOHbs (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 15 Oct 2020 03:31:48 -0400
Received: from localhost.localdomain (unknown [122.171.209.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5363122243;
        Thu, 15 Oct 2020 07:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602747108;
        bh=L5cgGgIHOY7d7lauAxttKpfU48/5ENhOve/vKZtz4Ko=;
        h=From:To:Cc:Subject:Date:From;
        b=zavuJFWR9YFAyFQFiZG1dlyQ3OQeRPolf/Hc5IEFTbBL3KbrijA3q/4ZY6bw6+9Mk
         RmOu52uBpKX0Tu5uffYla0yMPslFHnZME1YmMLHqOWO9Tyqng7rmu/7vZh04iq7BlU
         dgQybTzligGpPiQ4phtklJmTiH2NDH8YTtnR714E=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/4] dmaengine: use inclusive terminology
Date:   Thu, 15 Oct 2020 13:01:28 +0530
Message-Id: <20201015073132.3571684-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

dmaengine history has a non inclusive terminology of dmaengine slave, I
feel it is time to replace that. This series starts the work by replacing
slave with peripheral as I feel this is an appropriate term for dmaengine
peripheral devices.

This series updates the header for dmaengine and use macros to keep existing
name to avoid breaking users. If people are okay with this, I will post rest
of the pile which does conversion for whole subsystem. After next cycle we
will move users and once that is done drop the macros.

Vinod Koul (4):
  dmaengine: move enums in interface to use peripheral term
  dmaengine: move struct in interface to use peripheral term
  dmaengine: move APIs in interface to use peripheral term
  dmaengine: core: update to use peripheral term

 drivers/dma/dmaengine.c   |  48 ++++++------
 include/linux/dmaengine.h | 161 +++++++++++++++++++++++---------------
 2 files changed, 124 insertions(+), 85 deletions(-)

-- 
2.26.2

