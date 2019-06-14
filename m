Return-Path: <SRS0=LQqC=UN=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC48C31E44
	for <dmaengine@archiver.kernel.org>; Fri, 14 Jun 2019 05:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7056021721
	for <dmaengine@archiver.kernel.org>; Fri, 14 Jun 2019 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560491953;
	bh=80gnw/3vYSftrRxPke1w88PzyZ1Zi7c7Gmr1/Of+xlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kPkT9FXDa/y6L6m2Ubey35JqD5gUAlO/5/99ly6cDIbFB9eg+5ZcagvFViYN2ojzH
	 g4B6KX3teAUnPDb81Ghy/ltFXUfydzi8HIOmEQnmMTO/N+zVfkKj+b/d+OR+b6ejPM
	 6Le0FSCfJdDLDIgxOYz8gT6j8a0zf1K8k4n7mnWk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfFNF7N (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 14 Jun 2019 01:59:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfFNF7N (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 14 Jun 2019 01:59:13 -0400
Received: from localhost (unknown [106.201.34.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A562F2082C;
        Fri, 14 Jun 2019 05:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560491952;
        bh=80gnw/3vYSftrRxPke1w88PzyZ1Zi7c7Gmr1/Of+xlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovRjX7zC70XGx4p+GqYG3MprYbUyPonHRWSv2txYrPXQy7K8k0VLyJiUITLqtLv36
         ikMc0bylUY9HrLnKkRQcQLUxJkxuviiDvj5cTMdgppV51K6y4P73ZFUBgmNnyhGDOy
         dYKioX50R0Ikev5trsEMKysDGphMBigWLtMSEC0g=
Date:   Fri, 14 Jun 2019 11:26:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     dmaengine@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert@linux-m68k.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv2 1/2] dt-bindings: pl330: document the optional resets
 property
Message-ID: <20190614055603.GE2962@vkoul-mobl>
References: <20190611153433.22129-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611153433.22129-1-dinguyen@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 11-06-19, 10:34, Dinh Nguyen wrote:
> Add the optional resets property the pl330 dma node.

Applied both, thanks
-- 
~Vinod
