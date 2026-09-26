Received: from mail-ed2-f28.google.com (mail-ed2-f28.google.com [74.125.228.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67EF342538
	for <dmaengine@vger.kernel.org>; Sat, 26 Sep 2026 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443291; cv=pass; b=c4ucoo5ypPoST+VDt7gL+aKI60jXYuuWJoeQwGwEIkFbBfouchhuAnSSqieU9ZB3fxrIoH+dAd22QTxpWes8fSM0LaWcceLEWKoFwsysSKYsDK1VT79NYX/jPg0Vf1ZEmS5fUM2Lp0xVyKKDHv5wnERjHG4trCUSohmnnugVN8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443291; c=relaxed/simple;
	bh=9u4Wqtg4qpyeBT0sOT/aJf74/jMuOahB7RDE+KuTt40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzOHSRgfSsgD63JorAjBKtnOoFIYnXer/JNu1cjU72nAK0QZjT7PYLmLOXiaYJIIUaOaESR4+JvSsyM6gM6++rAOqJb5QH1zSlMP7NjyinAPUbKdSGpn2fsm28ARfEZrAYgsGM94S6/7LytV+2mYlKkRIjDEoapdkAHk9JRl1bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlvRd4jz; arc=pass smtp.client-ip=74.125.228.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlvRd4jz"
Received: by mail-ed2-f28.google.com with SMTP id 4fb4d7f45d1cf-6aaf1149da7so135928a12.0
        for <dmaengine@vger.kernel.org>; Sat, 26 Sep 2026 10:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790443288; cv=none;
        d=google.com; s=arc-20260327;
        b=BxuXcapBEhL/hwRs2JOsjtdmtxW/Bs3mszk5S0vr74eZUX5n4gpkqH5m5EkrNhUEwJ
         AXC+hEMRCtZSH4dBeCt4dYujCFk3EgH0DLTHZemNQeXcnUw1WQtr1b2y3DEcv8Lg/Y6e
         XJ9rXsR0vOnHJ25UI6Vj2uW/nn4VZRWwsMmc3agG968v7fyANxZ3VGIPkBupoRH9N35k
         qPppCN1Fzgrqj82/EMglqwk8cNieGR21BRXyApv/LLaFAfCx8gYCu0y6CWBHya53GxnU
         A4RwW7NEvo/Q5E96BQpje6w9szlYxgcZ4lglpjF84Qga61n+BkerXqKVNz8QFI9Xi3oP
         Qziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        fh=yVcKiM6ZcPWeKuwhugT5+A5D5kHEe9y4ZtKKuZVyJp8=;
        b=k51jQVfBsliHyhKSQ1rARLLEFMGqwvajIfyPxByXD/sJGsjjk0yOAiAk50g/N8y/KM
         7dElZj9pFKyxTxRQkphrrMEeb3YSeru5lllNYVz3U7oNPDnVWGrSl2/YRY6FmAOgmpoT
         enhdxfDOo5Vey7Kd4MEnZkxL3QaGCw76YDNA2IhzmhizdCQdu3ccwZ4jBQQIxLV7GyoT
         b/1PqOsGLomQc6kKZtsHJH73jM0kvZ57TicX3RvuPDpWQVSkEorWqVWJs1eHAtWgCfUg
         GL+pKs9ZADCOpyHnSZuucgdyb+1MDeOyXcDIwWVD7HQEoRBeDLkLwRSDpIZquE0GV45Y
         xlUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443288; x=1791048088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=dlvRd4jzH8V5HqYoI//aWRQ/EWCiZnZjWdbSOca9kYyxX201VUFGqZqEFk+iQzoCOt
         0F8Erf/as7S230x+smAmlXMIPv5wxLBlbIxPb/t1cOtsSmFFJ8GJFgKfa/0p1ragFKd2
         BBFlL0kkWBUvDv0BM3ppToEClLUaffkgaTKys5azDPf2F2cZ5snkzVN8CrkQaX8WHprS
         MQ8SCwRwi2NcHTe5RgUCp0rKVFXg0UG/9zqYRWBjWZyoqmX8pR+YYpTYkcvX/oYj3Xvg
         mcbEiPTSZ++hmx5CfjXT8yuJJPKxpbtkGnmdb+oZNcjcnzaB/vnLFHGWK6MvdOQWLUx3
         a1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443288; x=1791048088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=ngtdcaaYQA/ZCkcNm+N/4Us+UJQfqvtaUupH4vVqKGeNstshWSSM6Eu9BEHIj3yVlD
         wCziCiaDjVL1ReIpt6l5/1LkPERcc3bt+dEAu5uo8P4UyZfkpjdGj+nmK4Jgjik7ZW9V
         uh5UEgaT2YfKd1pExJunlrXy8T5QNnWQYKOX35uq/wDKNxRTkYgX/9MqJYI/a67NTTGZ
         WxQ9WDoC/veW8H9/iHGdYTjIHX/dDgt7B548tsjwfHCecmVr7FLH+XsEj7P71rOtAd1n
         rynfYFSvHOjMNOSLJcaHCqtter4AtRaHvW8U4POXL/1V2JGDbSdaNcNaKzXtlaMhAG9y
         fyXA==
X-Forwarded-Encrypted: i=1; AKwUvBzwqDyzZUzlxEYa+Ab19wsPsieRP3BxXJ6jzOn8sbS8kBmxUdT4o/UgSFvN1HkAZJ8N2BBpOrzuMgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd76P2BrGYtmo71dky+s1yzq8cMGy0t8cNnjosEkAYfDQbnzF/
	o5Z28hQvkbrONWvwmC42xlGOvoKSFkzavTr6fKZoHoEkQC64PVy1iXDET7vlewtkdbjp7XeowTd
	CS7vBBi5XBrQ6ToIHy5GuxacFvQNF4zY=
X-Gm-Gg: AYBFou3Puk3ndpsV/HzdWXUk+2cUKHBN6pZYpIIFnKbrjavh00tbi4Jnbj++QlL+ikx
	mmJoTvkpeL1LjGLieE5uBNES9Gi+7KWmO97ORPSssJQmZCxXZH6oh1cpzc+geLdy1j9kaw6giUK
	KoHX9f5GWNjZbu08eaFmdPq/rzkELG7b1irNxsu9QPNiuhITD55Ahp3C2glkUvw3d9AiaglIbKl
	9F5rFmZTVzAoVUfjPdAaXTqgOuxxLVKRCwnBx4H8z7chPi9te+BHn17pzW8r2F6vUGvZ9XcZJHC
	nP5MY6yCPkLEVH2me3rw9bLgqvXnsc9jQYzi5Ro2EBBwEukF8fFlMmwRF6TsKuTnyqqAIssqJn0
	+sG3zEur3QPM=
X-Received: by 2002:a05:6402:13ca:b0:6aa:13d6:888f with SMTP id
 4fb4d7f45d1cf-6aae1fa590cmr5300101a12.1.1790443287630; Sat, 26 Sep 2026
 10:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
In-Reply-To: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 01:21:16 +0800
X-Gm-Features: AclHuK_oi-zKoshtXCuOOr3CsOX0yKq1NGgpk2U78md_ZK4k1diCt_1GHatAQ2s
Message-ID: <CAAo+4rUpf=e+rVKR4FhTOuGb+xGx+yTz7KOZbrRc29ErgznuCQ@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:10=E2=80=AFAM Nguyen Minh Tien
<tien.nguyenminh@embeddedlinux.blog> wrote:
>
> From: Chengfeng Ye <dg573847474@gmail.com>
>
> As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
> context, other users of the lock in process context should disable
> interrupts, otherwise the tasklet can preempt a holder of the lock on
> the same CPU and deadlock. sun6i_dma_terminate_all() and
> sun6i_dma_pause() take it without disabling interrupts.
>
> This was found by an experimental static analysis tool for irq-related
> deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
> is also taken inside the HARDIRQ-safe vc->lock:
>
>   [  299.389380] WARNING: possible irq lock inversion dependency detected
>   [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_termina=
te_all+0x40/0x2c4
>   [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in=
 the past:
>   [  299.426398]  (&vc->lock){-.-.}-{3:3}
>
> Use spin_lock_irqsave() in both places, as
> sun6i_dma_free_chan_resources() already does.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 =
DMA controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> [tien: rebased, added the lockdep report from a T113, Fixes and Cc stable=
]
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
> I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
> on, stopping dmatest set off the report above in
> sun6i_dma_terminate_all(), and a small test module set it off in
> sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
> 2023. It never got a review and no longer applies, so I rebased it on
> dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
> Chengfeng, I hope you don't mind me picking it up.
>
> With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
> four channels passes while another channel is paused, resumed and
> terminated in a loop.


Not at all, thanks for picking this three-year-old patch up and
testing it on hardware. I=E2=80=99m glad to see the patch can move forward.

Best regards,
Chengfeng
