Return-Path: <SRS0=Gs2F=W7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B60C3A59E
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35FC522CF7
	for <dmaengine@archiver.kernel.org>; Wed,  4 Sep 2019 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567572862;
	bh=Zus18VEyZu/6MRT81lAksVBUQFbtOkG/3wRaFXJu84o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gZyP1xJUZNuAvyf6lrPqZLbWph0v7lp88CLLBrmGPHVFDV97u8qY1JEncMf6E4Pum
	 Xp2LHvvJEXbGz7yTbkwYXyryCtnn29I0b5DKhyv/ZvhLvYJbCUHUrV4YmkLwTtQ8gL
	 y747/4ZW5FhOKvov7RgjP4TBXgsyTyyWWwav1gxU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbfIDEyW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 4 Sep 2019 00:54:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbfIDEyV (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 4 Sep 2019 00:54:21 -0400
Received: from localhost (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 473152077B;
        Wed,  4 Sep 2019 04:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567572861;
        bh=Zus18VEyZu/6MRT81lAksVBUQFbtOkG/3wRaFXJu84o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LuIXZUVhc0IKy+3hGi9BWu5oAt98v2c5eJPETodPT9V2AZBOQtlc/kmvQli9lxcGq
         lpHqaE1niaDZCuIf53eHfWxrm2tl0THuYfua0TrxgCA2VLE3e5ZuoPLE7ME47rz8eE
         5C/CmvBBrBl8H1EnJVLNa2eoXk4OGVpGkM6rkQDA=
Date:   Wed, 4 Sep 2019 10:23:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dmaengine: dma-common: Fix the
 dma-channel-mask property
Message-ID: <20190904045313.GY2672@vkoul-mobl>
References: <1566988223-14657-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566988223-14657-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 28-08-19, 19:30, Yoshihiro Shimoda wrote:
> The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
> for the generic DMA bindings") changed the property from
> dma-channel-mask to dma-channel-masks. So, this patch fixes it.

Applied, thanks

-- 
~Vinod
