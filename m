Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A96480DC1;
	Wed, 29 Jul 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329189; cv=none; b=ODTH6Wy1e3ulPqstGBfNEpgxhy9T5W4rZ3g2Pg1RNqtGKdt8R1j9G1W35GAIuPmcxoXY714IJYp1G+71Ug8CsYDp2yV1cySFfWHw4KuAatFVZ5lR+VvRkegzt33P3QQx1uz0/qpuKDePiXbfiBSby9AN1KTHVmdpIhnALdfB9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329189; c=relaxed/simple;
	bh=9VU751HRdCwVVe6AyErSJPGFzhMyjvTd+5LsxpKL0UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V738khzrcFFbpqypr/bZOfz1cOZXTCcithUHX+16EDxb4u5jqYBMIkFxrxBjQ94MAWTa8UFH/49GlbvLh22VQfmwQpdk1oLEub9v8+2P0uXYh/uBpfsRYmNuzV5+i45Et5beUqXnmr9d9lTdskJ7bWtGMzdAGnPeNQ9fRv8+WUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM5m3qcJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM5m3qcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D619F1F000E9;
	Wed, 29 Jul 2026 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785329187;
	bh=e9FNNDjx0nVXATQFTofAejqoG99mn33IslluzvDStFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YM5m3qcJqaXn+aqm56s3AFCAHgI7k8NCqa/Sg5QwQDdjwqTI40MrPSzMnCqgKykgc
	 6bDISajbOeqxVptHHOGJpLJ6eeq9G80vwUO7UCLF9hAkbytt+1w7MefKV2+zZZbf5a
	 9oT+VUZF9SekOkFHwb0HvponSqsLViwG+f2JzpXkbnftQhUFgrmJSUUL9hKHfPd8xx
	 Fki6dbanTz3IROgZSM7TWyIlaAD+lXRjVOrr/YVllgfUucRIFgS1zEIh0VcveiiIYr
	 Q+ucLIy4JFHrF5ZVfX6R862TvxnAXno3kTKDlXGTNpu62biq44CuIp90EFM4k+Qz0Y
	 YOhPoXDqoGtQA==
Date: Wed, 29 Jul 2026 18:16:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Allen Pais <allen.lkml@gmail.com>, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH helpers
Message-ID: <amn2H5thhxTdGUKO@vaman>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>
 <20260727205608.A51B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727205608.A51B01F000E9@smtp.kernel.org>

On 27-07-26, 20:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Low] API breakage leading to widespread build failures in downstream DMA drivers due to the removal of the `task` field from `struct virt_dma_chan` without updating its consumers.
> 
> Pre-existing issues:
> - [Critical] Race condition causing a Use-After-Free of a cyclic descriptor's `tx_result` pointer when a channel is concurrently terminated.
> --
> 
> --- Patch [1]: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH helpers ---
> commit 9141d715bfba5e26881326cc343ca063eaf8458a
> Author: Allen Pais <allen.lkml@gmail.com>
> 
> dmaengine: add tasklet-backed channel BH helpers
> 
> This patch introduces helpers to initialize, schedule, and kill a channel
> bottom half. It converts virt-dma to use the new API, replacing its private
> tasklet while preserving the execution context.
> 
> > diff --git a/drivers/dma/virt-dma.c b/drivers/dma/virt-dma.c
> > index 7961172a780dd..89fcd51ddcabe 100644
> > --- a/drivers/dma/virt-dma.c
> > +++ b/drivers/dma/virt-dma.c
> [ ... ]
> > @@ -98,7 +98,7 @@ static void vchan_complete(struct tasklet_struct *t)
> >  	}
> >  	spin_unlock_irq(&vc->lock);
> >  
> > -	dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
> > +	dmaengine_desc_callback_invoke(&cb, vd ? &vd->tx_result : NULL);
> 
> [Severity: Critical]
> This is a pre-existing issue, but does dropping vc->lock just before
> referencing vd->tx_result open a race window for a use-after-free?
> 
> If a concurrent dmaengine_terminate_sync() calls the driver's terminate_all
> callback (like bcm2835_dma_terminate_all()), the driver could acquire the
> lock and free vd via vchan_dma_desc_free_list():
> 
> CPU1
> vchan_complete()
>     spin_unlock_irq(&vc->lock);
> 
> CPU2
> dmaengine_terminate_sync()
>     bcm2835_dma_terminate_all()
>         spin_lock_irqsave(&vc->lock, flags);
>         vchan_dma_desc_free_list() // frees vd
>         spin_unlock_irqrestore(&vc->lock, flags);
> 
> CPU1
>     dmaengine_desc_callback_invoke(&cb, vd ? &vd->tx_result : NULL);
> 
> Could evaluating vd->tx_result here pass a dangling pointer to the client
> callback if the descriptor was freed by the concurrent termination?
> 
> >  	list_for_each_entry_safe(vd, _vd, &head, node) {
> >  		dmaengine_desc_get_callback(&vd->tx, &cb);
> [ ... ]
> > diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
> > index 59d9eabc8b674..abe2a44757442 100644
> > --- a/drivers/dma/virt-dma.h
> > +++ b/drivers/dma/virt-dma.h
> > @@ -21,7 +21,6 @@ struct virt_dma_desc {
> >  
> >  struct virt_dma_chan {
> >  	struct dma_chan	chan;
> > -	struct tasklet_struct task;
> 
> [Severity: Low]
> Does removing the task field here cause build failures in downstream drivers?
> 
> Several DMA drivers like bcm2835-dma, hisi_dma, idma64, and tegra210-adma
> directly access chan->vc.task during driver removal or error paths to kill
> the tasklet. Without updating those consumers, they will fail to compile.

This one seems valid.
We need to replace the callsites with dma_chan_kill_bh() here

-- 
~Vinod
