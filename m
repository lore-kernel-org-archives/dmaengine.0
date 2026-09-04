Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68843D7D8E
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525870; cv=none; b=cEAPlSVFAUE4BWJMn7J5PcYx0nHy4/rVsDGt0z6Q1ue+3fFX7R2Lp/L+JN2MK2A530oVJw8CdISW6J9xGhrsqwKhsHAqTtZYWm/nUfM5J2E5lu7P8DBqobmroil4uAYLNA2N7YVFK2ykgpZiY8eayr8TMqv+WyrUN6wWetyEVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525870; c=relaxed/simple;
	bh=rHB7rehoOlZbxstD6lbTIinMurFJh6tn3L0YtYVOH+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMD7W8xil2NLnXg4eyvQqgrdjcAgrEqw12kk/Rkj3VOZe1POEqUZEVwblzP4norWRuE+5WrsWRgOqWAgVTkKTjkxjmxvuVj6AYewbIneT/Lk3q831syT7Ub+4mU1/7NzuOIoidP61k4Np+uKkCh8FYNo6xSnizZcbuF/E975V1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so661677241.1
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 05:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525867; x=1789130667;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X7GYFb8ObjcCzbJF1jAT3MEmY5+IWm6xkKfaRZugkok=;
        b=LuzK/mi51NM+UixY1S/FR/qcN5auU5ZUivuFkaknXVYnOFUoo5E77484+COiJJCmdW
         85U4h99sKkQTYEbM4GgvIQTFhFLW9XRqlNtgNQvX4/2qLBZdmgepGI1vTJX3A9wsNfNg
         1VtfMB2lk93JjZWKIJor9Y4KOfZXjjLsq6VUXrX+BGHN8zJc9iUsAqm0zOAkwOY0V95u
         N4aqKfG6s3nFmdq9WkiTt5oxM9R4tVFNm16ARCScQuaQEjUGnpQWobQjn8w16htLXhxt
         iP8PEXZTazhMsaBfzwHFFM6Sy8JVXfV+2NacSeQYhVdNmqbIWVDFKXAiDdeFDhUqBpPH
         OLVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr7RPPNcszy6zOAtXNIEmoOlR2A6AZrBpQ5CZo89gnh5oRjRAIRULt2jBGNJwUJZZFK8aEMFJH150=@vger.kernel.org
X-Gm-Message-State: AFuF++mhQmNceCqlh1mgCJLE81GrInTQU+ceg9/pyTmKyRt4zjy+Fh1o
	6n9U7JRFsHqmeikeW8jcJNz7pVYaUVg81WEY7CJfvPSJZEuCXosx7RbKNHiPIUQaHQI=
X-Gm-Gg: AYBFou09hjNYuhcCnhphJ/4LCY5aFSkDYPSKYkmZyuhoITzC/4+c2jBQvXZWDE7bYyF
	ie3jzPbX/+fzUiwkLmk8iTrmxpIN9SPNr++S3q2EiQq086ai7nr5p6uzBg+VG2sw60lkF12PV5a
	4+Rif/Odm2VmNYcw3GbqdS7eYwEeT2cFrR2mXZReSHKnFDKwgcr5CtFBBn65XwrZ6r6hzIciWwH
	q/l6Omb0uqPpoM3DWzJEzkXMesJjJEPTY9bgjnywoio6je8B17INqBarrDnl1YvzPc8TFzkzkAU
	aNts3k/84hLB70hezlTDh1aJ+FiWimzFRGyswuF+I0MHejnXf2DwwBG1Z4pRVC6DZ8xAgHmk67R
	PzSKBO0ZpH472aMqmq2XlT1bTFTnFTW0AUQQZ8L67j0CuAlvmUttM8/0p21TvK9l40WscB3TZkx
	uczXWfa3RAWnZ1HxONZ/WPFAZWUSv7HcmtqT0f4ObIltzDO8QgaQz1zskSilMdXxHt4StWGvCB5
	04kZho6RziazPWg699vAcmEcno8rI4Bguv0
X-Received: by 2002:a67:e045:0:b0:77f:fb50:8820 with SMTP id ada2fe7eead31-78a52c86b64mr751071137.11.1788525867319;
        Fri, 04 Sep 2026 05:44:27 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee1c0cdsm1458960241.8.2026.09.04.05.44.26
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:44:27 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97ea365dd5cso652494241.2
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 05:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrNYuje0MmdxTYaJpZKnXDnFpz1cJdAFdj75EsRtUmz75uGFmAmQvloqqVrFVNHYWUxDMxBRkacXc=@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:786:e7a0:603e with SMTP id
 ada2fe7eead31-78a4a8b86demr2120669137.7.1788525866617; Fri, 04 Sep 2026
 05:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:44:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj14sZXrcPhNA7HZ8+nB9FYypcOhNEYpkhYj7YZsMQhg@mail.gmail.com>
X-Gm-Features: AcwNN1XPYwq96qhQmx4WPVu51XNqxvA6TQNjfaLRuNelQJUi_vPdQl2bb7NiYmg
Message-ID: <CAMuHMdXj14sZXrcPhNA7HZ8+nB9FYypcOhNEYpkhYj7YZsMQhg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
> for the IPMMU becomes optional. Add a flag to distinguish. No functional
> change.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -219,10 +219,12 @@ struct rcar_dmac {
>   * struct rcar_dmac_of_data - This driver's OF data
>   * @chan_offset_base: DMAC channels base offset
>   * @chan_offset_stride: DMAC channels offset stride
> + * @has_ipmmu: flag telling if DMAC is connected to an IPMMU
>   */
>  struct rcar_dmac_of_data {
>         u32 chan_offset_base;
>         u32 chan_offset_stride;
> +       unsigned int has_ipmmu:1;

broken_ipmmu_microTLB_0?

>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -1877,8 +1879,9 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>          * can't use it with the IPMMU. As the IOMMU API operates at the device
>          * level we can't disable it selectively, so ignore channel 0 for now if
>          * the device is part of an IOMMU group.
> +        * Not applicable if system uses something else than IPMMU like SMMU.
>          */
> -       if (device_iommu_mapped(&pdev->dev))
> +       if (data->has_ipmmu && device_iommu_mapped(&pdev->dev))
>                 dmac->channels_mask &= ~BIT(0);
>
>         dmac->channels = devm_kcalloc(&pdev->dev, dmac->n_channels,
> @@ -2000,11 +2003,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  static const struct rcar_dmac_of_data rcar_dmac_data = {
>         .chan_offset_base = 0x8000,
>         .chan_offset_stride = 0x80,
> +       .has_ipmmu = 1,

The issue this fixes was seen on R-Car H2 and M2-W.
R-Car H3 ES1.0 already existed at that time, so R-Car Gen3 might be
affected or not.

>  };
>
>  static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>         .chan_offset_base = 0x0,
>         .chan_offset_stride = 0x1000,
> +       .has_ipmmu = 1,

Let's hope this issue was fixed in R-Car Gen4.  Perhaps someone can
verify this using the test Laurent shared[1] a long time ago?

>  };
>
>  static const struct of_device_id rcar_dmac_of_ids[] = {

[1] https://lore.kernel.org/1422137953-30156-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
