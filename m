Return-Path: <SRS0=qqdP=TW=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F75C072A4
	for <dmaengine@archiver.kernel.org>; Wed, 22 May 2019 05:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EADE21479
	for <dmaengine@archiver.kernel.org>; Wed, 22 May 2019 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558502144;
	bh=FQBJ3uELb0SBCR3xZ1w1OjR2/WAe4IKnzXe9+95areA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YUcXgGXTPYq3eR+GC4O2I/7LSRRI9WAmggIdLG6kyiF5P5sWA5Hgvw9bBREnM4hAg
	 wqWK9OEPr+I1u8afd4/Rr/7Pw7bUfr2EpM+VwCPVaa04DAc1mrhF+IBiyczAZwnUBC
	 bxQ+jSPQch6P2urd2jMCbDr3cDLLU10hZddzyWYY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfEVFPo (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 22 May 2019 01:15:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbfEVFPo (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 22 May 2019 01:15:44 -0400
Received: from localhost (unknown [171.76.98.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF70520863;
        Wed, 22 May 2019 05:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558502143;
        bh=FQBJ3uELb0SBCR3xZ1w1OjR2/WAe4IKnzXe9+95areA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qvZ8KzNYyDuLf4jzUi2jbhlgPQb31vM7LHh1jCX0UFkBxM29uIWfRLntHlVkRPOet
         Jt0dHzRmDECDVdkmfkoR3JwbD2dcD8eIg/QodvKGUiNSqcndDuzSYPva4Iajarf6+p
         f1nimg+X4p8d8yoOwd58tAAeujkvNbQ5MRw090Zk=
Date:   Wed, 22 May 2019 10:45:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Radhey Shyam Pandey <radheys@xilinx.com>
Cc:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Andrea Merello <andrea.merello@gmail.com>,
        Appana Durga Kedareswara Rao <appanad@xilinx.com>
Subject: Re: [PATCH] dmaengine: =?utf-8?Q?xilinx=5F?=
 =?utf-8?B?ZG1hOiBSZW1vdmUgc2V0IGJ1dCB1bnVzZWQg4oCYdGFpbF9kZXNj4oCZ?=
Message-ID: <20190522051539.GQ15118@vkoul-mobl>
References: <20190521141034.8808-1-vkoul@kernel.org>
 <CH2PR02MB61980091BB537AC704B1F333C7070@CH2PR02MB6198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH2PR02MB61980091BB537AC704B1F333C7070@CH2PR02MB6198.namprd02.prod.outlook.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 21-05-19, 14:20, Radhey Shyam Pandey wrote:
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: Tuesday, May 21, 2019 7:41 PM
> > To: dmaengine@vger.kernel.org
> > Cc: Vinod Koul <vkoul@kernel.org>; Michal Simek <michals@xilinx.com>;
> > Radhey Shyam Pandey <radheys@xilinx.com>; Andrea Merello
> > <andrea.merello@gmail.com>; Appana Durga Kedareswara Rao
> > <appanad@xilinx.com>
> > Subject: [PATCH] dmaengine: xilinx_dma: Remove set but unused ‘tail_desc’
> > 
> > We get a compiler warn about variable ‘tail_desc’ set but not used
> > 
> > drivers/dma/xilinx/xilinx_dma.c:1102:42: warning:
> > 	variable ‘tail_desc’ set but not used [-Wunused-but-set-variable]
> >   struct xilinx_dma_tx_descriptor *desc, *tail_desc;
> > 
> > So remove it.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

Thanks applied now

-- 
~Vinod
