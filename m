Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A4FC433FE
	for <dmaengine@archiver.kernel.org>; Mon, 18 Oct 2021 06:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E561610C7
	for <dmaengine@archiver.kernel.org>; Mon, 18 Oct 2021 06:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhJRGPf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 18 Oct 2021 02:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229847AbhJRGPf (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 18 Oct 2021 02:15:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6686860F56;
        Mon, 18 Oct 2021 06:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634537604;
        bh=roG/LrnebQ24A/ZxdxzZ3+XJwO8+/2dyKFc3em3jnq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QG191IV/yu4uR2WjkHTA+csB2wOkyVZFW68dx1Sq3WC/3ZekKZXRTVudqjejgGbXM
         jLbmh/VVnkgJrRXlL6OTQp6+v4k4QUIUWaUPpT3fLPlA6o/DqhpDbztPiFvpeMBbiJ
         /VVnBXXqmWOc1ySlg+wQk/W2S0RHUx6EJAoP0SIsKCQLA7JV9/fCpyD9SCql6gDRHU
         vHaNooyJn1ZH2fzCBXP3FIHdc2dbqLxxkaQKWWuxH6cXP3c/M/LbaAJc2FXgdm4xaV
         KZeOTPwlbcut4fbYs/A42NouxtWEZ7lSsT0713s+VcSeM67cnkGlYmaDlZ4UfiiMhp
         0Y1i4yKaL+Gqw==
Date:   Mon, 18 Oct 2021 11:43:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Anatolij Gustschin <agust@denx.de>
Cc:     linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: bestcomm: fix system boot lockups
Message-ID: <YW0Qf7v10P22WJI/@matsya>
References: <20211014094012.21286-1-agust@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014094012.21286-1-agust@denx.de>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 14-10-21, 11:40, Anatolij Gustschin wrote:
> memset() and memcpy() on an MMIO region like here results in a
> lockup at startup on mpc5200 platform (since this first happens
> during probing of the ATA and Ethernet drivers). Use memset_io()
> and memcpy_toio() instead.

Applied, thanks

-- 
~Vinod
