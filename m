Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794851352;
	b=m4P/Rn7e1y9YH+VsLKD/BjLZxj1tx1rUXHUa5LjcWfIInRcl8X3N3o7N8Y64yVkIpzWB
	 u+UzbMNMLjnzUf28r40R3RL6HEDcLytB75LMSKOTUf2JmC/EMn4ExgBhHeIylREAf0L3z
	 Ko0EtIaZF8jJSwNTsYZFIjIkCHaeN30wQp/JDO+FOxaIIR71jprhdzkxlaNRpwHbpkiWj
	 F8Dq6Q3rZ+4GmtGlanulB1tQKYgCAz4StEinsexUJma+0O2niJGX2J4ZCJpQodDQUT5rO
	 743znGA3nb4nM/UZhqt3hDJHUB9Knklu7HlfRCtECQdVj4yxP3D1hSlq/fkmYCISawg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
	b=j6X80tBgyM6MIjrfm67c0+n4/wmVk+hZcm2oDMmCTNLHNBuCryu2bFxkSGbZrygxcQEQ
	 dgZqYtBk3u3xkVhGHpeqjn1XrbG/FcqvsjtBTXDWGMyy2nFQEnZHXWgN559xugsnRkDZ3
	 nWRGm3C56dRPYd61K31JwmfWady50rn8r9sONGEAEUs+atNrHmuLF9585FwyhG6ZdeS89
	 KPXzUigQWAEDtQP8iubf5z+KPR9s+p6NTwmvupz3jQhdNvW0G19JSQCZ7q7vGmunc98tU
	 kvv4pGOHnaiXWiqmUkFE61YxkWKTWpIaSyZdc6ll+UoSLaiPGd0ecU17Ft4Gaytnolg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gU4scvE5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF0606A336
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 17:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DF0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gU4scvE5
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so2676348a91.1
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 09:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794851352; cv=none;
        d=google.com; s=arc-20260327;
        b=GXEP2kMKq6s3aXcWLpcIAzNN8vkfgNHyUSY9XIEOG4t9wt3trLOSFUK/xg7ARjNg2v
         8dmtuEy4dRLBpiTKS3/TigBkXFqmofujoowsQcWouxzgO8X2zS3OzoXsZnwVePBDw5Kt
         oRqxBUxxGBQwTe48rDOdao4wcLFURTWu6uElOlN9dyUu8k0CUE9TWaTuO47LdLVmjWji
         TFIuidHsQQDX6M9j25Pr84N1WAV/e4sVfi635WMXHIEL1uwhYN/eURm2ETejF6dRz41I
         FIO3h+lUma2SQRJ28v6s5uWdKZM/nAHd158I3yxIWYzCEfL5xXwmBSBaDqe3B6x/CZgs
         lVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
        fh=9mj5idA578461rXMMnZr1HuElz6WN3qfXWNPKM58IZs=;
        b=EhmUy0RJc2n6UiBV3EOMQEoCC6iKgL6qCS4a/dKr7crK18h9+l7Ov7iq3p4U5aHVT5
         UKiJvc+JC8HbVO7//z6tfQ75KEIwlclYcE7TX+ePVa1+ohRG+CJHYRYa5CJRuna84Sct
         I4r2GgjWgdRmNsqYHcmXUo7nWUG6SXEBzKkCw64QOxHI9nna6ylC09pxf1BeWQAi/Eo8
         VmDsIAz42zqSESk9YUq6YAJAasBMm4gwraizjQFDIa9foahJUpK9hCAgRV47yYqDdZgm
         RFTIGjjejfWAxomIZ3GfY/mguQTakPBvd5B0EE9/pbC8IbQpjI6F71ST86A8DMWWcVZf
         +Fyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851352; x=1795456152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
        b=gU4scvE5tqrBconnBUEpPW4QB8gCOBLAI02bJ2DRkIFpNrj+RGHcFZpMivuaL6Ndl1
         XV/w9xehKGtyQw38SsTVf6wqdNzZK5tlfu+6h/SzJmFWr+wmPLKQYtrzqDgJxtt6fKpT
         FCuFmMlVIaS2NOt4SqYpU3A1gc5bTP02tROTPAiwgaZdyp+Wh1RZAoPdS4G4d7uc6k7s
         mq/1uYqEJDpbqSCOffuP8LhDfz63UBlfLKj8Z6SaAOsEgRlrMwJxIDIvPL80fWSzVnOY
         rA/LRN1qmiod4GHpGbBvesdzFRLa3F3DDsUoCrMC1Mx8g3d/foNhG/OAWW3FalQJncJN
         RRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851352; x=1795456152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8eRcybjrdDMglrYGKeBlpIcbBQ3QdhJtvgYlBD8b+U=;
        b=y1UmqyUILi/cgNObIcY2pYy15kRmQULuqCmsMrw8aDWZ14pEWpSPeiQqQ/kFErsHYC
         2y9oCqtWf3rfN1JynaQX0rVYblrP+0n6LQdUECZ52F9bYjNj12bCGmBMrnwtO5b+r7Y8
         qy/rtNXkf45niggXPZnW+WhZARROEFn63v5M4wjWZtPGUV+IGdXY/PVeY4DO3mbYuf73
         xjmXBxdYjIQrNEKFmWfQh5vYtpZsKY3tNCmfGcYF1hqAg4aPaO7FLhSDejowvpRBE+KV
         uSg14ElsMWMBhY9lG0lMzCRbpfpYSkuC+rqMZ5zDi3KDbV/lboKV4SxAiFemLA9JPP2d
         dKaQ==
X-Forwarded-Encrypted: i=1; AL+hErGoeq4MvWDAeVzPX4GyXVVr5QZKTo1wkqVTz9aCohp6M6n6T9GRjTdDuEed221lUsHo+J2JoLAPPck=@vger.kernel.org
X-Gm-Message-State: APuU4Z99BP46z2HzRFHCPsuzRDWnaS9qd8X0/Ck19NAH1Y22SwTU9MNy
	/RF/kENorKCgcgqaNxzRdph6SgMFMkzBxozApzfueBF9XwX3cDm0B0V12IpJ22bw/cG7RFQ2QDP
	ARmXAgeYSoNDluU9QDRhHqJS3HuxHBZM=
X-Gm-Gg: AZFdTZfcxNYVPdLr4N9rP5BWLtucze2ZCZ7Dr7pEOiPx2hWKezvP4yRf4y27Xbr58H8
	FWqeRFNZB4MoyvOprn0/jOGoXYAt9t0+4AFs0kz9RLF+o66IGvlnJ9dxuOJ7kWFxfV/pO9IZ+rl
	eALCcCfnm0bmzp8OXyV6Wgg3cDcqTT0s6ra9JPhShXvGtL9qabo8y9OhkYxfIZir12uLOMcFsXz
	fOZvtFwA869UfJ7s3aWieJ5F1MyqNk6av3/sFigl9HOLmSdX+xAnYdpVgc0r5f3OCx/trWTjZoq
	IqkCaBrYil/ik1IF+V0YM1wzgw9My6/jRTQKMS7uvSSjLKtPn1VqMiqGJ2b3lIzx4pbH/4juhZ1
	xc1QG0+cqOa2x9Ja4NbVXdkpsltYcpH2HYb1B/J60MeNwKbg8UvLSa4Ktt2K2cWNz5UvA9tjDGa
	Wndip12yQSnXUm8ixU
X-Received: by 2002:a17:90a:c88b:b0:3ac:8741:e2e4 with SMTP id
 98e67ed59e1d1-3b1b0a4e341mr10606541a91.52.1794851351473; Mon, 16 Nov 2026
 09:49:11 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011202406.1869441-1-mhun512@gmail.com>
In-Reply-To: <20261011202406.1869441-1-mhun512@gmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 16 Nov 2026 10:48:59 -0700
X-Gm-Features: AclHuK_Kl0DspNDrEKp-YEz0pV4NOcqF_Nq6hbXh0I_C-bUeC2RYqKCw6K1g_1I
Message-ID: <CAOMdWSJ8Wejc5+k0c1zKV1L+97GtDrW2xh4TF2+sMVqUYaUiWQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mmp_tdma: Release IRQs before channel tasklets
 and storage
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> The shared IRQ is requested before the channels are initialized and
> released after their storage is freed. Its handler can therefore
> dereference NULL pointers or freed channel state. Pending tasklets can
> also outlive the channels.
>
> Initialize both channels before requesting the shared IRQ and add managed
> tasklet cleanup for each channel. This releases IRQs before draining each
> tasklet and freeing its channel storage.
>
> This issue was found by static analysis.
>
> Fixes: c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Compile-tested with GCC, W=1 (arm). No runtime testing.
>
> This fix overlaps with Allen Pais's DMAengine BH v3 conversion. If that
> series lands first, the cleanup should use dmaengine_kill_bh().
> Link: https://lore.kernel.org/r/3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com/
>

Reviewed-by: Allen Pais <allen.lkml@gmail.com>

Thanks.
>  drivers/dma/mmp_tdma.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321..965cdd6 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c
> @@ -353,6 +353,13 @@ static void dma_do_tasklet(struct tasklet_struct *t)
>         dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
>  }
>
> +static void mmp_tdma_kill_tasklet(void *data)
> +{
> +       struct mmp_tdma_chan *tdmac = data;
> +
> +       tasklet_kill(&tdmac->tasklet);
> +}
> +
>  static void mmp_tdma_free_descriptor(struct mmp_tdma_chan *tdmac)
>  {
>         struct gen_pool *gpool;
> @@ -562,6 +569,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>                                         int type, struct gen_pool *pool)
>  {
>         struct mmp_tdma_chan *tdmac;
> +       int ret;
>
>         if (idx >= TDMA_CHANNEL_NUM) {
>                 dev_err(tdev->dev, "too many channels for device!\n");
> @@ -584,6 +592,9 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
>         tdmac->status = DMA_COMPLETE;
>         tdev->tdmac[tdmac->idx] = tdmac;
>         tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
> +       ret = devm_add_action_or_reset(tdev->dev, mmp_tdma_kill_tasklet, tdmac);
> +       if (ret)
> +               return ret;
>
>         /* add the channel to tdma_chan list */
>         list_add_tail(&tdmac->chan.device_node,
> @@ -666,14 +677,6 @@ static int mmp_tdma_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>         }
>
> -       if (irq_num != chan_num) {
> -               irq = platform_get_irq(pdev, 0);
> -               ret = devm_request_irq(&pdev->dev, irq,
> -                       mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         /* initialize channel parameters */
>         for (i = 0; i < chan_num; i++) {
>                 irq = (irq_num != chan_num) ? 0 : platform_get_irq(pdev, i);
> @@ -682,6 +685,15 @@ static int mmp_tdma_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       /* Release the shared IRQ before draining and freeing the channels. */
> +       if (irq_num != chan_num) {
> +               irq = platform_get_irq(pdev, 0);
> +               ret = devm_request_irq(&pdev->dev, irq, mmp_tdma_int_handler,
> +                                      IRQF_SHARED, "tdma", tdev);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         dma_cap_set(DMA_SLAVE, tdev->device.cap_mask);
>         dma_cap_set(DMA_CYCLIC, tdev->device.cap_mask);
>         tdev->device.dev = &pdev->dev;



-- 
       - Allen
