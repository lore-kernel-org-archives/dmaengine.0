Return-Path: <SRS0=Ed1A=WQ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E8AC3A589
	for <dmaengine@archiver.kernel.org>; Tue, 20 Aug 2019 13:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3486622DD6
	for <dmaengine@archiver.kernel.org>; Tue, 20 Aug 2019 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566308634;
	bh=wiCsbZWwRHIuHm00HMq4RBi1zW5xCUqrHbzHKVOQFZY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=FjOXbwJqtF5My9Yx5o6wfnIucQ/GyzudxwNccFwbN0ZU0RRaCKNKBGJvpoYb7mMlS
	 a0CbILd2vYn3kRVrjicDc1LCY33wxrw9a2dDlI8cI+5I/ggwb7SB2VHivI4CwgKV44
	 XyC04ULm6g6wYGNAtwXkGcx+5UP3MvqUp4NMGnjQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730003AbfHTNnt (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 20 Aug 2019 09:43:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730404AbfHTNn2 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 20 Aug 2019 09:43:28 -0400
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B10042087E;
        Tue, 20 Aug 2019 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566308607;
        bh=wiCsbZWwRHIuHm00HMq4RBi1zW5xCUqrHbzHKVOQFZY=;
        h=From:To:Cc:Subject:Date:From;
        b=ow1vNCSSU2BIAQrVOQ2XzdJvEo1F6o2i82hAPP5Pdt2crgcDztyaQpg4j6hQz4hUc
         QQECGx1ZObubiBJYokDQSdyGxppnPL0gMbqZdxer0U7+pfCLlUAIClWgCMKx8PTgxD
         O5KpudLsIdm1XUTK3wCw57fPzTJql0//nyrNMVfk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 4.4 1/4] dmaengine: ste_dma40: fix unneeded variable warning
Date:   Tue, 20 Aug 2019 09:43:22 -0400
Message-Id: <20190820134325.11825-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 5d6fb560729a5d5554e23db8d00eb57cd0021083 ]

clang-9 points out that there are two variables that depending on the
configuration may only be used in an ARRAY_SIZE() expression but not
referenced:

drivers/dma/ste_dma40.c:145:12: error: variable 'd40_backup_regs' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
static u32 d40_backup_regs[] = {
           ^
drivers/dma/ste_dma40.c:214:12: error: variable 'd40_backup_regs_chan' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
static u32 d40_backup_regs_chan[] = {

Mark these __maybe_unused to shut up the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20190712091357.744515-1-arnd@arndb.de
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/ste_dma40.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index dd3e7ba273ad0..0fede051f4e1c 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -142,7 +142,7 @@ enum d40_events {
  * when the DMA hw is powered off.
  * TODO: Add save/restore of D40_DREG_GCC on dma40 v3 or later, if that works.
  */
-static u32 d40_backup_regs[] = {
+static __maybe_unused u32 d40_backup_regs[] = {
 	D40_DREG_LCPA,
 	D40_DREG_LCLA,
 	D40_DREG_PRMSE,
@@ -211,7 +211,7 @@ static u32 d40_backup_regs_v4b[] = {
 
 #define BACKUP_REGS_SZ_V4B ARRAY_SIZE(d40_backup_regs_v4b)
 
-static u32 d40_backup_regs_chan[] = {
+static __maybe_unused u32 d40_backup_regs_chan[] = {
 	D40_CHAN_REG_SSCFG,
 	D40_CHAN_REG_SSELT,
 	D40_CHAN_REG_SSPTR,
-- 
2.20.1

