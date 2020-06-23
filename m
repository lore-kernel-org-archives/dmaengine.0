Return-Path: <SRS0=bNmE=AE=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911DCC433DF
	for <dmaengine@archiver.kernel.org>; Tue, 23 Jun 2020 14:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7211F20720
	for <dmaengine@archiver.kernel.org>; Tue, 23 Jun 2020 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592923063;
	bh=LxiQVVinhBQKbOzwTpLWbfRK5z2E0I1fmXbEPivqF7E=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=f8P2J7QM2gUD/15kMwiszPijFbn6lyZ12ZD7rbRClc7pgfuQNY+4/7OSjXHHbY9a3
	 ErgJTbkSgA6Ko/cM42l+KFNjC3QwGlFldVidlxwRnQhL9rV8PrWIKoHVji+5UC9cr5
	 6BAGUxLQelf2OVfKlO/UDnbRJ71fS15N06URCLU0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732754AbgFWOhn (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 23 Jun 2020 10:37:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732835AbgFWOhm (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 23 Jun 2020 10:37:42 -0400
Received: from localhost.localdomain (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 555E6206EB;
        Tue, 23 Jun 2020 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592923062;
        bh=LxiQVVinhBQKbOzwTpLWbfRK5z2E0I1fmXbEPivqF7E=;
        h=From:To:Cc:Subject:Date:From;
        b=KWmHHVNewecJReWi3cvU5ePHXSdfNeV4szsOGTLoU1NIvU2Z1oo8BbrzH74R+3tdx
         UukOkmBIFDzlUjQZxiNsSGLoh5OmeZ2wdLMk5kJ0iO3DrEa3H0TCKuqakmx+uCKpN0
         hl18QPkVVXErOlBxxRjOMu1wtxnIk6TOu2CatMhw=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] MAINTAINERS: switch dmaengine tree to kernel.org
Date:   Tue, 23 Jun 2020 20:07:29 +0530
Message-Id: <20200623143729.781403-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

I have switched DMAengine tree to kernel.org now, so update in
MAINTAINERS file

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..49d096742d5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5111,7 +5111,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-dmaengine/list/
-T:	git git://git.infradead.org/users/vkoul/slave-dma.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
 F:	Documentation/devicetree/bindings/dma/
 F:	Documentation/driver-api/dmaengine/
 F:	drivers/dma/
-- 
2.26.2

