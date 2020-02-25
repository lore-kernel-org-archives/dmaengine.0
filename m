Return-Path: <SRS0=OqEg=4N=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1707BC35E04
	for <dmaengine@archiver.kernel.org>; Tue, 25 Feb 2020 16:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6C4921744
	for <dmaengine@archiver.kernel.org>; Tue, 25 Feb 2020 16:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbgBYQOM (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 25 Feb 2020 11:14:12 -0500
Received: from mga18.intel.com ([134.134.136.126]:21367 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbgBYQOM (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 25 Feb 2020 11:14:12 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 08:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="438112379"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2020 08:14:07 -0800
Subject: Re: [PATCH] dmaengine: idxd: remove set but unused 'rc'
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
References: <20200225081459.4117512-1-vkoul@kernel.org>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <701657fb-bba5-2733-05ef-fa181d562223@intel.com>
Date:   Tue, 25 Feb 2020 09:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200225081459.4117512-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org



On 2/25/20 1:14 AM, Vinod Koul wrote:
> The driver assigns result of check_vma() to rc and never checks the
> result, so remove the assignment
> 
> drivers/dma/idxd/cdev.c: In function ‘idxd_cdev_mmap’:
> drivers/dma/idxd/cdev.c:136:6: warning: variable ‘rc’ set but not used [-Wunused-but-set-variable]
>    136 |  int rc;
>        |      ^~
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> 
> Dave, if you want the result of the check_vma() to be checked, feel free to
> send the patch for that

Yes I will send a fix. Mistake from several code merges. Oops.

> 
>   drivers/dma/idxd/cdev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
> index 8dfdbe37e381..82b19eed6561 100644
> --- a/drivers/dma/idxd/cdev.c
> +++ b/drivers/dma/idxd/cdev.c
> @@ -133,10 +133,9 @@ static int idxd_cdev_mmap(struct file *filp, struct vm_area_struct *vma)
>   	struct pci_dev *pdev = idxd->pdev;
>   	phys_addr_t base = pci_resource_start(pdev, IDXD_WQ_BAR);
>   	unsigned long pfn;
> -	int rc;
>   
>   	dev_dbg(&pdev->dev, "%s called\n", __func__);
> -	rc = check_vma(wq, vma, __func__);
> +	check_vma(wq, vma, __func__);
>   
>   	vma->vm_flags |= VM_DONTCOPY;
>   	pfn = (base + idxd_get_wq_portal_full_offset(wq->id,
> 
