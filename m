Return-Path: <SRS0=k+Z1=44=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8034BC10F27
	for <dmaengine@archiver.kernel.org>; Wed, 11 Mar 2020 09:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 542E12146E
	for <dmaengine@archiver.kernel.org>; Wed, 11 Mar 2020 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583919582;
	bh=E69tOYIoG2a2ouEteetpRGTzwWOBrIpym/fy1NpcPYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=d+kHK8N2xw7QdwvzmEixYzlZj48hJFqucdB2+wPBCz23ySPsZITj44IZRp8hTrYqn
	 YGlox2cr+ewQDcBoTOqjAHG8ou6w1KfUbueELYAD5EY201MOs36vZPqx1ubIGPAFnn
	 qoO4Ef4GKzyX4KN1l6/eWop9fn6zBPbmZ4L+hUsw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgCKJjm (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 11 Mar 2020 05:39:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728245AbgCKJjm (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 11 Mar 2020 05:39:42 -0400
Received: from localhost (unknown [106.201.105.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 966DA2146E;
        Wed, 11 Mar 2020 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583919581;
        bh=E69tOYIoG2a2ouEteetpRGTzwWOBrIpym/fy1NpcPYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNLB48HgtODhUAqVLzfMiXiKp+AzpEcsW9IZ+CUaQ3OcRrrGc7ZWTTzVA6wlRAVpc
         HZt1eRR3hXjlQCb3D8AW2rRy7t2OMA21wb+ibHyYixWtxBzaFYc5GjTgbQhM4Y/j1g
         KnCuRe8ZIpOYp6iXenkG8Dg7iWKJYvBszS/E8yY8=
Date:   Wed, 11 Mar 2020 15:09:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: remove global token limit check
Message-ID: <20200311093937.GQ4885@vkoul-mobl>
References: <158386266911.11066.7545764533072221536.stgit@djiang5-desk3.ch.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158386266911.11066.7545764533072221536.stgit@djiang5-desk3.ch.intel.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 10-03-20, 10:51, Dave Jiang wrote:
> The global token_limit is not tied to group tokens_reserved and
> tokens_allowed parameters. Remove the check in order to allow independent
> configuration.

Applied, thanks

-- 
~Vinod
