Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153DA4921B4;
	Mon,  5 Oct 2026 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208727; cv=none; b=UpokLmIyOsHX55Qe8G9yBFsnWu3yghipYwfnb0HqMm3yq0/CDgS7x6V6DbdKKOtyv1cRPZMdEx/pxmLftqx1q4+mg6JyI4NUaAeTkiojocMqemTdSJn2+dXm+28rtLNocaVfqOheHBJ43DPzLPUO4dIzj73+jKeHr3Zzg231JVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208727; c=relaxed/simple;
	bh=mvvRQkunNlMJ1zfHdjZmp7OWJJ/efZMOdpUneWqAgBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgRfu5OKqt8VCSIMeyuXin+Ghtc0f8HZUhzhBLUFpCpCN1fwHnL0bJzG3dP8ekHDTBau8WsYgKDDG60yRBCXxJaC5N7lcAJp/r2MVajzSm9zdE/AGngiorW2Gub2Rco8hP+gQNIP2meQnhAt4+QzlGYFZKTaXrBDvaXnxJRS/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxcb1had; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxcb1had"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FE91F000FF;
	Mon,  5 Oct 2026 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791208725;
	bh=hB96Gs8hLMTWWdb83gK/pYz1+UsEAi8km31i/cat4RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxcb1hadOyNcndGwI00W4Z2i9T1Fj36nxN1D2FABJulC5gVeSYv5Q9e2v7Du8iSo8
	 l9EdafQXzGFQb+2bUrP9KVZaLoOCsN3EgLkxVj1c87x5MSVAPl57SMTUU2P4+p3VHu
	 dW7zwbSIFQGEybrPwwAxc4rTFnnJed0v+0TOEGX/5ZFrzX6u/FnQw01BhKBweU9dvK
	 +D3bIIVYRcoPMn/kerQrg3ohui+YMleOC/fVXOCg5cZZ9yK+kQCyC0For2J9Km7QWi
	 49zRK2Pc3DelHioJT8W1saw4BDmTjJXwguBFIRXNl58T9Pk7EUgTrIfmKsWsFVXd3n
	 rzZ6qquDq2Z5g==
Date: Mon, 5 Oct 2026 15:58:42 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Message-ID: <asOtEhjOMXc9SVNP@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907063343.22255-1-hemanth.selam@gmail.com>

On 07-09-26, 12:03, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/dma/bcm-sba-raid.c        | 8 ++++----
>  drivers/dma/ppc4xx/xor.h          | 2 +-
>  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
> index 0de03611252e..485fcde390dd 100644
> --- a/drivers/dma/bcm-sba-raid.c
> +++ b/drivers/dma/bcm-sba-raid.c
> @@ -734,7 +734,7 @@ sba_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t src,
>  	struct sba_device *sba = to_sba_device(dchan);
>  	struct sba_request *first = NULL, *req;
>  
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */

This is bogus, pls drop these... If there are real typos pls fix those
instead! This is not a language book, it is code, upto should be just
fine!

>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>  
> @@ -877,7 +877,7 @@ sba_prep_dma_xor(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t *src,
>  	if (unlikely(src_cnt > sba->max_xor_srcs))
>  		return NULL;
>  
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>  
> @@ -1356,7 +1356,7 @@ sba_prep_dma_pq(struct dma_chan *dchan, dma_addr_t *dst, dma_addr_t *src,
>  	if (!(flags & DMA_PREP_PQ_DISABLE_Q))
>  		dst_q = &dst[1];
>  
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>  
> @@ -1626,7 +1626,7 @@ static int sba_probe(struct platform_device *pdev)
>  	sba->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, sba);
>  
> -	/* Number of mailbox channels should be atleast 1 */
> +	/* Number of mailbox channels should be at least 1 */
>  	ret = of_count_phandle_with_args(pdev->dev.of_node,
>  					 "mboxes", "#mbox-cells");
>  	if (ret <= 0)
> diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
> index da1230df2817..0931e18cd0d3 100644
> --- a/drivers/dma/ppc4xx/xor.h
> +++ b/drivers/dma/ppc4xx/xor.h
> @@ -12,7 +12,7 @@
>  
>  #include <linux/types.h>
>  
> -/* Number of XOR engines available on the contoller */
> +/* Number of XOR engines available on the controller */
>  #define XOR_ENGINES_NUM		1
>  
>  /* Number of operands supported in the h/w */
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..bcc188e70441 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -1032,7 +1032,7 @@ static int xilinx_dpdma_chan_wait_no_ostand(struct xilinx_dpdma_chan *chan)
>  {
>  	int ret;
>  
> -	/* Wait for a no outstanding transaction interrupt upto 50msec */
> +	/* Wait for a no outstanding transaction interrupt up to 50msec */
>  	ret = wait_event_interruptible_timeout(chan->wait_to_stop,
>  					       !xilinx_dpdma_chan_ostand(chan),
>  					       msecs_to_jiffies(50));
> -- 
> 2.48.1

-- 
~Vinod
