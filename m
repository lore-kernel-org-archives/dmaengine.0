Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26408C433B4
	for <dmaengine@archiver.kernel.org>; Fri, 16 Apr 2021 13:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED2DB610EA
	for <dmaengine@archiver.kernel.org>; Fri, 16 Apr 2021 13:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241568AbhDPNcF (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:32:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235011AbhDPNcE (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 16 Apr 2021 09:32:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6A34610EA;
        Fri, 16 Apr 2021 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618579899;
        bh=DiL8azXw7EQ88wcrJFGSG3mIfSvPLDRKS0/YVCn5MBk=;
        h=From:To:Cc:Subject:Date:From;
        b=s97M0mZJ4BCa/vv5ZGM1QGct0qC94FS1x7O9+R+e2ZPgBoAqzrYDDNoBfMrFPc3Fs
         TitjYxG5ipWu+ggNbxFPlIX+JTqpejNgbi/T4UhmHT+W53hQb1NdxjoBVijtnbH3oE
         SZTJ2IE2M+wLzCid31BmRk8ivoxVGvP5FryY0sgTX9s5jpxE6FYEg8RnfUPUKLxwFJ
         uhoWs57jShmw1C8HksFanFzHVpFIbBi2xlCmsFLsKvEJegKA1xk9mWmoldHaurfJAB
         UkBmyAvakruCdHPrV7khVs0HZEKA8P0tKe9s0crUAxlzi8KBUm3AbkEUiGWEqB6JNn
         iQt4ng5DVA9ng==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: [PATCH 0/2] arm64: sm8150: Add minimal DMA support
Date:   Fri, 16 Apr 2021 16:31:31 +0300
Message-Id: <20210416133133.2067467-1-balbi@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Felipe Balbi <felipe.balbi@microsoft.com>

Hi,

With these two patches, GPI DMA probes fine on sm8150 (well, after
setting gpi_dma[012] status to okay). Future commits should come to add
relevant DMA channel mapping for the various IPs.

DTS patch a dependency on I2C patches by Caleb Connolly and SPI patch by
yours truly.

Felipe Balbi (2):
  DMA: qcom: gpi: add compatible for sm8150
  arm64: boot: dts: qcom: sm8150: Add DMA nodes

 .../devicetree/bindings/dma/qcom,gpi.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 72 +++++++++++++++++++
 drivers/dma/qcom/gpi.c                        |  1 +
 3 files changed, 74 insertions(+)

-- 
2.31.1

