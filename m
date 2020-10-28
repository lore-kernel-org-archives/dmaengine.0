Return-Path: <SRS0=uZPL=ED=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395E3C63798
	for <dmaengine@archiver.kernel.org>; Wed, 28 Oct 2020 22:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E10EB206D9
	for <dmaengine@archiver.kernel.org>; Wed, 28 Oct 2020 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603923553;
	bh=JPiww9FNC4aTQtjOnFImLsQd7t7hkat2n6jCaAgxlkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tjlCF1gDV1Q4ucMH+A8+dDloxJtHzdljIWYVayazGRlUtaYtmQV4ADxCxsEWmukO4
	 cAZWx4ut0TuYHIUQCiblQ+JvybSc6wMRUEl/6uwhg/ZpxSPf7kzLODgCPLPtXyumTn
	 6C7njr2tkGj2RahzdtQscjWc0b5nlLF+l+FDfWOU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732318AbgJ1WTK (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731683AbgJ1WRl (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:41 -0400
Received: from localhost (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F8A42245B;
        Wed, 28 Oct 2020 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603865371;
        bh=JPiww9FNC4aTQtjOnFImLsQd7t7hkat2n6jCaAgxlkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z4oaMGAeHeNRdAIdPmpCk/v0psrCwVqrHvCYcvlU+BUZFrwKVXIBqW9fzWRQHJFvz
         Ex4DknSD71aeo/pKNJm/dWVErlOyJwd/o3qKu3bFRJZ8CMqoQ1A6H8LVneLPG7vCXz
         lXJnQ5GhfatcOYlIMhXHlAUgPWxG18RogZcIdgZ4=
Date:   Wed, 28 Oct 2020 11:39:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Surendran K <surendran.k@samsung.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        shaik.ameer@samsung.com, alim.akhtar@samsung.com,
        pankaj.dubey@samsung.com
Subject: Re: [PATCH v2] dmaengine: pl330: Remove unreachable code
Message-ID: <20201028060926.GL3550@vkoul-mobl>
References: <CGME20201016110722epcas5p3e1bc44be4c2b35654b440276448b7c4f@epcas5p3.samsung.com>
 <20201016103347.63084-1-surendran.k@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016103347.63084-1-surendran.k@samsung.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 16-10-20, 16:03, Surendran K wrote:
> _setup_req(..) never returns negative value.
> Hence the condition ret < 0 is never met

Applied, thanks

-- 
~Vinod
