Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E923F1643;
	Fri,  9 Oct 2026 06:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526206; cv=none; b=bYWr2RyQvxVxxoepl5o1NMQgUoLD33Zu/28a8vDsXAKfw7Jy9VprMjMU9XA59pb6K5plaEvvpJ5iv5UqtmL8bb8pndbvPTPfPfwMb/BlLal1n5tgcj1GI3lAoU/Wsf8N1/Q9LU2zmhAYXwCq3/3sF/yrt4ujcOHs1LCjQgQBH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526206; c=relaxed/simple;
	bh=s5udbliOv+5a5hVfWiZ94WmnyWb8iHC+uVHpFb+G3DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtrZjjYl8BderZdZuq+k+wnqZfkxz85iYfcfPJwfDAqDV6hOQwNU5BmkMBYQzra/yvOxAEvU1pKWibijrAbyuLqTyX2anVU20Bdbb7QPZVQVS6Z2Hkawa0yJK0dpWaA6lJhSDKnoLnooGqJm5/gCqPhD3e89Rzncchbs13kIKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9pPqQI6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9pPqQI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22021F000FF;
	Fri,  9 Oct 2026 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526204;
	bh=uNEyUpqWkIL1k7ckpeKBLtRv7ZKipBMmT5/I3vSkb2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b9pPqQI6LCVJbJ0tdzWdfq1YYVNZ4Qgvc2O7ABA6/0dVfcMRR0FShX7vbK+XR7aJb
	 zu2KzPC4iUhsFg+ufj4xWAKgBlJKe6tzcFlp1sEyiaoxuIaDmM1qUC71ZIoWj/qdML
	 up7HOwx+avtus2K867s0GXtTJ3GnAjCyMwa0owcznFTfNIWyXe+nUbxr2r1cXYSx7U
	 3eLDDDLcdJ4Sv5q5eXFWE/q3RqaAN26H1xWFbIcjnGy7k1VfNcn0iloORsiwaFiOIv
	 vOM/DpeP1Lq4tzaRO/BvEoGMVoA2BMvgVkwbdaomqHxjhbymiINHKkpl8tG8xFiosc
	 +L5EEzoFXDAAg==
Date: Fri, 9 Oct 2026 08:10:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Green Wan <green.wan@sifive.com>, Paul Walmsley <pjw@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: sf-pdma: fix double-free of the in-flight
 descriptor
Message-ID: <20261009-brave-significant-slug-44bbee@quoll>
References: <20261009042358.3102885-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009042358.3102885-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 12:23:58 +0800, Haotian Zhang wrote:
> The descriptors handed to sf_pdma_issue_pending() and
> sf_pdma_donebh_tasklet() come from the virt-dma desc_issued list
> (sf_pdma_get_first_pending_desc() returns list_first_entry() of that
> list), so chan->desc always refers to a descriptor that is still linked
> on a virt-dma list while a transfer is in flight.
> 
> sf_pdma_free_chan_resources() and sf_pdma_terminate_all() free that
> descriptor with kfree(chan->desc) and then call
> vchan_get_all_descriptors(), which splices desc_issued into the local
> head list, so vchan_dma_desc_free_list() frees the very same object
> again through sf_pdma_free_desc(), causing a double-free (and a
> use-after-free for the pending tasklets).
> 
> Drop the direct kfree(chan->desc) calls so the in-flight descriptor is
> freed only once by vchan_dma_desc_free_list().
> 
> Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 2 --
>  1 file changed, 2 deletions(-)
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




