Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30203F5BE6;
	Fri,  9 Oct 2026 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526202; cv=none; b=f1iZrNbyWoM74KzCONukG04ScnoGV2+bLVY/ZpXhKufBR9NX/dOXWEd249nwv4ukWye7OTR3+RjrFmboHglfCJ0xgD+ubjF0qsLC93uVljsKEp4eJFKSBYSqhnwP6Yt2eywc0SWSc1kblfFG2dQy8A5w1AHL2icWRaAxLuURECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526202; c=relaxed/simple;
	bh=rU+8Mkvi1ga4RAW1RdgldokCwBFLcWC4LjQQokcBo8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClDtOfpqJc97v+Cp9UNLSHDnIf+vMsxylXcLPqTu4PaPa/3S5HSJacyVxWlaTI0ZuDVYjYDrp6rEM26byQM5D/SkYgMEkzLgrNr3WFuOP7E0Hp6yU0wcS0VR5vEH1OPMGz6ko9+8RvjmHlbT9kDtL12z4MPieyLE07oxF3giJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHoFb0Pl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHoFb0Pl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A313E1F000FF;
	Fri,  9 Oct 2026 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526200;
	bh=UDcK8ZPSq7CkMqztCqSp48WwtN8ye2a+VyWUfSniaSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHoFb0PlgBLxBycUHzslEd/t1NRoi99IE1ScTnjg+/cQyu34sqN4nqkd7Sm1XFwlY
	 xIdw+YLTuNqNLTVcHkKMOyQ8JDo2VDxmJ02BgoLj7MGAF3nh7dgARo0VsRvQwDQEFC
	 g3GL/yLgYKm/8u9YcWFhXDJf+rYZeTEUNjZy5zY/I6gaVOeNA0LztvSgLBl0pQ8SY6
	 PtN4ndGkla6zdc3QlaiMxQ6VRmZHbZ7/n9sZaTd4xuyiv0r+ixEFA1eZwGP/0bpqn3
	 QiyiiRMs0MNqiYfZuHLonubuAjfnhptEJVEinVAUnimyhZUvZd49ulUo1aK/7zwV+x
	 /ucqcBmBplApw==
Date: Fri, 9 Oct 2026 08:09:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Maciej Sosnowski <maciej.sosnowski@intel.com>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <djbw@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: ioat: fix completion pool leak on ring
 allocation failure
Message-ID: <20261009-electronic-shoebill-of-development-d823ef@quoll>
References: <20261009043229.3108794-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009043229.3108794-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 12:32:29 +0800, Haotian Zhang wrote:
> ioat_alloc_chan_resources() allocates the channel completion writeback
> area with dma_pool_zalloc() and then allocates the descriptor ring with
> ioat_alloc_ring().  The ring allocation runs under GFP_NOWAIT and can
> fail, in which case the function returns -ENOMEM without freeing the
> completion area.  As the ring pointer stays NULL, the only teardown path,
> ioat_free_chan_resources(), bails out early and never releases it; a
> subsequent retry overwrites ioat_chan->completion, leaking the previous
> allocation permanently.  The dmaengine core does not call
> device_free_chan_resources() when device_alloc_chan_resources() fails, so
> nothing else cleans it up either.
> 
> Release the completion area with dma_pool_free() before returning from the
> ring allocation error path.
> 
> Fixes: 5cbafa65b92e ("ioat2,3: convert to a true ring buffer")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/dma/ioat/init.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




