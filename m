Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AA43E48E
	for <dmaengine@vger.kernel.org>; Wed,  8 Jul 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513079; cv=none; b=VTQCVR+XT3BMJ6CTBXK8iv+iRffG8owNN3gWg3UvCcddpp0WTWPfDZPCrGJ+1Q1U++uZ+apeYCqdEmu37HCFgXZLd6rC5+aDPkpDg4DzrUoAoyYoJpvsiyB/zt3GWpZhfafyHIsVZCr/SlKVdAwrsan3uqDL10y0syTQyuEkG50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513079; c=relaxed/simple;
	bh=gt1sheQIviRHfIj/UZc8opTwHEugzb9D3v4q5g0GNME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgWzkWZGWd5tWRDwo3hHpNqgM7nAmzwzHvK+ETJKZNgCcxr2uHhFQDk7xs25k1N5wCkvOL24TSZe1VtKQ7wiTRRkYGn9Saa0UFiIjx7zxbNMnhnAMufS0e+xCvx2yXG94spbtmmiNPw+ZiD3U0SjzqAejnuM0zUFxsBgmMlM9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1lJiYVk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1lJiYVk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-474560436c3so572774f8f.0
        for <dmaengine@vger.kernel.org>; Wed, 08 Jul 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783513076; x=1784117876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=;
        b=n1lJiYVkfNgEzxvugVKuV0yrOwRSSL60Uw1HXTySn9I0pM0k/yKAoz6FY61xt9aH+R
         Nah/tucx9fFgg4QKbe3uYLba8p3JXzXo69B/5KVZdUcHRQypb4bsUO+dT0NMK/NrY0vM
         powvW+2IQ+VvQ4dtjfw6AiXi+F0Jq/oFkE2YYrA9wqbXT4JvJT7G19d1KOqmHWBxuFY2
         bA3nk1U/IEmDS8e54HIxJjlUpBcwcc2d0bILPG+2qpY+5pWXGStVv3ar5e+Z/N3AleJM
         hyprtPNl0Pog4xNY1/2WdzWyuoYjy2rlNZ+mv66MBNSxspU35ZNs94MyY4OFcFS6nt3c
         UetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513076; x=1784117876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=;
        b=XkxQyw1s2BlKBw/kyJsqrDIZjvIqE1/bAk6PZF1wOHTMaHr3oJGW20uOG51geDHzjo
         9GqJDmoI6PP7uZ/7yhkLMaxtLzG5DtI5KY/15VPSUSFHYXZ0OVbsomqXagghcHoV0AqP
         j3nu8llK0aHYvrAkZvxLaAXwS/aRZLIqAlILYMPazfRVi0vXeROb+ZfqpLx1wrv2GJCC
         MrkicRZoa+RfuoeKSQZHW0KqngECSiCE7OXsrFtVrfqsAxbrfwuGAt1y9H5ZxGk2H0sk
         alH5Pz1wZJUMksaQDlH1YlxrtK8+RZ+8p047dJ78GxBft/jam+1m9Wtts0mvApj/L5oN
         Ku/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpHllAXC/A/+GWSQlk77a8xlMstNm/psMYwUNE/fL/5X10rXYOa4RTHliSgpDy7fMGh1eLfBVNg6ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HgB6twMT82OsjtPcAj7h30Q5cLKlvrMMEHeg81i1Fg2RgLiB
	4jMV8hzPloxqw+gX0Mc1I9C+2r0HB2niCpsSNY/RAT2itce3ZuMbv+J6xv2uuM6ceQOTOSV8VBt
	vRK20ulY=
X-Gm-Gg: AfdE7clbBCnvx2yHDfsufxWhQo5mYY4rILbUJYe36JhgehIUWY1lxqNKJnW43H4CZHG
	TXqbJwR+HI99APk670P90QwbcMp8uwxDipnI12keSP0WcxWVmC72sr6lK06ZQ9gqMbifl+yRNn2
	wqvjBem6O9U3y4GJrWpes1eYbHqTSi3v7Vvdtv+vbWU8sBeGPz7MJsUsvpCjxmC3tZvW7m63AmP
	ELpwvcCAmiPgXqREV7pd0U4PXXF9N9hqChe3jrymJ5Vo6mnyfYPD9RD66cQD1ImuZxdq4YT7//4
	JAMqLnTm9lEZ+Ux2BYTNHSljRam8V/kwnBCotuyRKUQNxDunmwZTJxtqGKfNA03s+n4Uf6VG5zG
	oAVHBo+DRE/sgPeR1gYPkqMPQs8RnbbIwjwfxzpUH5phs9Dc2nQeep1Hjzp4Qw2Rtd35bGigeUO
	SWCcrorTv7EshOVq9T/x5FL6sX
X-Received: by 2002:a05:6000:40cc:b0:47d:ede0:f8ff with SMTP id ffacd0b85a97d-47df073b1a4mr2646073f8f.9.1783513076033;
        Wed, 08 Jul 2026 05:17:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:28ff:335b:63e2:fdd2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm45642623f8f.37.2026.07.08.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:55 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:17:51 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v20 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <ak4_vsdef9MJd1Yv@linaro.org>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
 <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 12:01:08PM +0200, Bartosz Golaszewski wrote:
> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> channel - prepend the existing queue of issued descriptors with an
> additional "dummy" command descriptor with the LOCK bit set. Once the
> transaction is done (no more issued descriptors), issue one more dummy
> descriptor with the UNLOCK bit.
> 
> We *must* wait until the transaction is signalled as done because we
> must not perform any writes into config registers while the engine is
> busy.
> 
> The dummy writes must be issued into a scratchpad register of the client
> so provide a mechanism to communicate the right address via descriptor
> metadata.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I finally found the time to try this for the qcom_nandc driver on
MDM9607 (with scratchpad_addr = nandc->base_phys + NAND_VERSION). It
seems to work fine and my initial impression is that it does solve the
crashes/corruption when both Linux and the modem access the NAND in
parallel. (Hard to reproduce, needs a bit more testing.) Thanks!

It feels a bit awkward to call dmaengine_desc_attach_metadata() with the
same scratchpad_addr for every descriptor (especially because you store
it globally), but I also don't really have a better idea how to pass the
address for the dummy register.

> ---
>  drivers/dma/qcom/bam_dma.c       | 189 +++++++++++++++++++++++++++++++++++++--
>  include/linux/dma/qcom_bam_dma.h |  14 +++
>  2 files changed, 196 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f4f258994264a234f60debd3e66e31a6b35d1dc5 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> @@ -919,13 +977,23 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  			 * push back to front of desc_issued so that
>  			 * it gets restarted by the work queue.
>  			 */
> +
> +			list_del(&async_desc->desc_node);
>  			if (!async_desc->num_desc) {
> -				vchan_cookie_complete(&async_desc->vd);
> +				struct bam_desc_hw *hdesc = async_desc->desc;
> +				u16 flags = le16_to_cpu(hdesc->flags);
> +
> +				if (flags & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK)) {
> +					if (flags & DESC_FLAG_UNLOCK)
> +						bchan->bam_locked = false;
> +					bam_dma_free_lock_desc(&async_desc->vd);
> +				} else {
> +					vchan_cookie_complete(&async_desc->vd);
> +				}
>  			} else {
>  				list_add(&async_desc->vd.node,
>  					 &bchan->vc.desc_issued);
>  			}
> -			list_del(&async_desc->desc_node);
>  		}
>  	}
>  
> [...]
> @@ -1064,9 +1220,23 @@ static void bam_start_dma(struct bam_chan *bchan)
>  
>  	lockdep_assert_held(&bchan->vc.lock);
>  
> +	vd = vchan_next_desc(&bchan->vc);
>  	if (!vd)
>  		return;
>  
> +	/*
> +	 * Wrap the issued work with a LOCK/UNLOCK pair exactly once, at the
> +	 * start of a fresh sequence and only when there is real work to lock
> +	 * around. On a re-entry after a full FIFO, we see the BAM is locked
> +	 * and must not add another pair we simply continue loading the
> +	 * remainder of the same locked sequence.
> +	 */
> +	if (!bchan->bam_locked) {
> +		ret = bam_setup_pipe_lock(bchan);
> +		if (ret == 0 && bchan->bam_locked)
> +			vd = vchan_next_desc(&bchan->vc);
> +	}

I *suspect* though that Sashiko is right about the new race condition
here if new descriptors are queued while the hardware is busy processing
a locked sequence.

https://sashiko.dev/#/patchset/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05%40oss.qualcomm.com?part=6

Any idea how to fix this?

Thanks,
Stephan
