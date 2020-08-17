Return-Path: <SRS0=uof7=B3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29706C433DF
	for <dmaengine@archiver.kernel.org>; Mon, 17 Aug 2020 05:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 068E32076E
	for <dmaengine@archiver.kernel.org>; Mon, 17 Aug 2020 05:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597641684;
	bh=0ybDwR+imr95BHoU5d25QzlteuoQ8ZrdxzMMQmxwrWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SuU7aDsPer8xhG3WlrnUNG7b9jFPrwuhUCBJk28bMU/d2yKpcXDDQrI5dxL5LyD6Y
	 tjrR8hVQFWxEjR5s54fcYti7v9lnvFWifaSem51WOt1j/A4FGiG/HEl7RiPWLPEOsR
	 yPIw4ydq+1pLe83hHaqwmlAdWxUZ+d+Ko6EKK2YY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgHQFVX (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 17 Aug 2020 01:21:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgHQFVX (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 17 Aug 2020 01:21:23 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FD1020758;
        Mon, 17 Aug 2020 05:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597641683;
        bh=0ybDwR+imr95BHoU5d25QzlteuoQ8ZrdxzMMQmxwrWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GTIIfTL3trRYQg1LU+PB2bfaB3Z2NBfZv4AUDMf++TJhHyFM6xZfCG1OOX2DWpQiW
         3GOwMiWOieT6xRF0EE8Z4qX9xR0v7UjfSeyiVeZP7HHW/pzqnm2FlT8arcgGyyOTF7
         LA8aSs42Eh+7B3lET+mX/m5f1Bf7cQqmVfgXBbLg=
Date:   Mon, 17 Aug 2020 10:51:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dmaengine@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [PATCH] dmaengine: ti: k3-psil-j721e: Add entries for 2nd port
 of MCU SA2UL
Message-ID: <20200817052119.GI2639@vkoul-mobl>
References: <20200803100724.19003-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803100724.19003-1-peter.ujfalusi@ti.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 03-08-20, 13:07, Peter Ujfalusi wrote:
> The security accelerator within MCU domain supports two ports similarly
> to the SA2UL in MAIN domain.
> 
> Add endpoint configuration for the two ingress and one egress threads of
> the second port.

Applied, thanks

-- 
~Vinod
