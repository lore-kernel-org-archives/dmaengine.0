Return-Path: <SRS0=94oH=TV=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487E8C04AAF
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 04:35:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B3F121743
	for <dmaengine@archiver.kernel.org>; Tue, 21 May 2019 04:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558413353;
	bh=qZN3IK1vbxs608sdt11a9mNgqMMzprUJqKnmoO/sOCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hf0pbwmxr7OgJm4nDA+S2fpIxbTFcO+wbf0S3xQqSAgjVJcM0rHjHUPAzYzqMEA1C
	 SzIMU7u2lYvCRqwvGnMPTgsYrjO/ZDlvFIU8IJfkiK7oeQ0Tolm5aoFYS3/NGj00jH
	 Zs35vEVBMd4BXxm0APnoTv1oU7c9gMIMiom7oI0k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfEUEfw (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 21 May 2019 00:35:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbfEUEfw (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 21 May 2019 00:35:52 -0400
Received: from localhost (unknown [106.201.107.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37BC12173E;
        Tue, 21 May 2019 04:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558413352;
        bh=qZN3IK1vbxs608sdt11a9mNgqMMzprUJqKnmoO/sOCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sXATTafsToz9eVhdc86W9NvGDgAFAImwDd4VPSHsqytA7efSrYc3Ybo1+Y4P/oMh8
         3gb38MmwgstO8DimDjpjaUCSp61ijZVHgQMQmx4f03xEyzvOqG+dmjzZk6/u7wckg6
         v42oyVb8kMconTEg8cFPg7DbL8+B8ub7SVGEetqs=
Date:   Tue, 21 May 2019 10:05:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peng Ma <peng.ma@nxp.com>
Cc:     dan.j.williams@intel.com, leoyang.li@nxp.com,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [V2 2/2] dmaengine: fsl-qdma: Add improvement
Message-ID: <20190521043548.GM15118@vkoul-mobl>
References: <20190506022111.31751-1-peng.ma@nxp.com>
 <20190506022111.31751-2-peng.ma@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506022111.31751-2-peng.ma@nxp.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 06-05-19, 10:21, Peng Ma wrote:
> When an error occurs we should clean the error register then to return

Applied, thanks

-- 
~Vinod
