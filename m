Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81901C4338F
	for <dmaengine@archiver.kernel.org>; Wed, 28 Jul 2021 06:52:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EC3860C3F
	for <dmaengine@archiver.kernel.org>; Wed, 28 Jul 2021 06:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbhG1GwT (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Jul 2021 02:52:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhG1GwS (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 28 Jul 2021 02:52:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ABC760F6D;
        Wed, 28 Jul 2021 06:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627455137;
        bh=0tmxzT3CUglL6Oy2bTWTFEgCdyazA4GGdjP/VAHkfe4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJ7J/VDEMwBFcowTMMciiUDlwvl1KiWcxuyUM1srwbSQfxkFNCT+XMAN6Ynt5Ewfm
         atpuMAdZZPLUfPdzsJgzhp7sPQGZYaVWqHZBRBLBHGfMMCJ8fGGPcyilkhQnlAkQVv
         uA0/PRI7RdbSgK9zhhHQkwjtQsYb5ALi6X7NjbE+NAgpXoIBpyDI4p9MR+L5Pz8Zge
         OroqddHeQ4pGhB/gz4jxDoD/jr73Oc6SoKUY5cSQOLwoFiuY4jcCpDfFd4RBgJmOU3
         rd9lZOD1iyuNT6H5z/C5W6ZuiEDbVIoAL8hVXjjdLkTBT8Hcm8qBHKfw05iVhBs5Lq
         If72FgdEOXLQQ==
Date:   Wed, 28 Jul 2021 12:22:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     wangzhou1@hisilicon.com, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dmaengine: hisi_dma: Remove some useless code
Message-ID: <YQD+ncEBh4TiM406@matsya>
References: <4f8932e2d0d8d092bf60272511100030e013bc72.1623875508.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f8932e2d0d8d092bf60272511100030e013bc72.1623875508.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-06-21, 22:34, Christophe JAILLET wrote:
> When using 'pcim_enable_device()', 'pci_alloc_irq_vectors()' is
> auto-magically a managed function.
> 
> It is useless (but harmless) to record an action to explicitly call
> 'pci_free_irq_vectors()'.
> 
> So keep things simple, comment why and how these resources are freed, axe
> some useless code and save some memory.

Applied, thanks

-- 
~Vinod
