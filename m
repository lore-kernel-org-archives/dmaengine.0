Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00282C6FD1D
	for <dmaengine@archiver.kernel.org>; Fri, 17 Mar 2023 17:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjCQRqI (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 17 Mar 2023 13:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjCQRqG (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 17 Mar 2023 13:46:06 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B2D4C6F0;
        Fri, 17 Mar 2023 10:46:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B5002CE2112;
        Fri, 17 Mar 2023 17:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE5CC433D2;
        Fri, 17 Mar 2023 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679075161;
        bh=CALHI8QyhoysYboPSI+ssSWyhwsi+tg0oMym2GnjLfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sSLHGeJ+Jff2S+eekB9OJwltvEAwDyNdx56iAiZ0lkdD6PM5jxQAO0LEu8UPc3Gec
         gcgjnWoVLQXusq6Xx1WyV2s+M3E11Dngza3Pk3UTBlK8rcpfBVsiS78dxIg4q2UJS4
         swsBvvUD5rQRVqqAgvqr0qaVJndwzvozHIJRS4TeSmgENBTen89/kumYMKJfKqSyqI
         9nnXy6ii7gQ41mBBPlK6m8VDNJGLwLmJ7Gh0XxYN2YMI8q66C6d6dUe8c+EejQzIpC
         AbMXWD3LLLpsTcHpMX5pd/UMe3jlZ/pecZOnCyF4MU312Guk6pyhP5OfbJuqgOlzSo
         SVRt8lG0wcbxA==
Date:   Fri, 17 Mar 2023 23:15:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] dmaengine: ioat: use PCI core macros for PCIe Capability
Message-ID: <ZBSnVUr6VcTuK4Ie@matsya>
References: <20230307214615.887354-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307214615.887354-1-helgaas@kernel.org>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 07-03-23, 15:46, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The PCIe Capability is defined by the PCIe spec, so use the PCI_EXP_DEVCTL
> macros defined by the PCI core instead of defining copies in IOAT.  This
> makes it easier to find all uses of the PCIe Device Control register.  No
> functional change intended.

Applied, thanks

-- 
~Vinod
