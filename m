Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44785233943
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526897; cv=none; b=gFUB2t1jOcTv/M2Am0CZ2+Y+LRpugSom5ecykW6hXu6uU88i3Fh1b9QfO32sdKExroWVYMMZ62wwizc9Mfd9a3qVtSrp5tsZRr9kwzPK3I+484+0JReDW+dFbL65HQ8aGJbunFi+zjBnZkFSyTY/4Ofj7Z1DleeTMzFUqJ//Hzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526897; c=relaxed/simple;
	bh=jUfy3jDPDO1gYgSYzIH9kVV64CrYvNurBewZo0IJOhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGIJdJC+uQlxq7TPDy2MjpBV0mFDNvdWXhSFc0U+eTB4X3zxtcR1nmC39vFtqV0F3UiP0bYZH5QbQJ8BNJvKSHWpPRh9HonWC7dkQ53GCx3YLwg/ksEphnGoYYBZVIt9eATyacPpS+H1mjIvyeLs7tW/TDeHr9csciTkb4l0MNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so355178e0c.0
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 06:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526895; x=1789131695;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BhKln9SUSjqstm0nn2XiJI7ZCrh52DpPOYmNB+vWzdE=;
        b=SZN3oYsl7Akugqct6sLvZwrrRWhsTMdmvji0uCZy4dRjrvYueJXeb0OePxVVvbxjmx
         k4vH2i0pt4hFvVn+F4vZ1q4KjNTCAophmUTXKNjkMhSiyi3uQIjmeSuBbaA2Sg9U+u6l
         ZkGZSzq6V9nIlOp6VRXUwR8eJ0mc7BS6kg7FkIph+O00tSbN37csixUI58kLnqU5V0ea
         44p0wdmKs3A6mxNji5cDM9rFAo9OOl6nYkprJDWzW1/eOeUDVImTw3vZiApXY/dC0+mI
         Q4aHR91OrvYew+fbd23kPqWESAeDYqbkdwqZe0o4FuhljLHReDFHbk5fWgUgfudROsoG
         7wYg==
X-Forwarded-Encrypted: i=1; AKwUvBz2N8keNEJKHY8UYL8cLSeHTkO/1TC1PpAa62GLW+VlWyV+ymrh1mLvJPFyY53jkV1sSHyoeSsR2MY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUPcHt6rslxAEgVvUuHhTo21Cg1k08j5dJgJEc0cNRIPkgUzHh
	Zy8ldsfsMk8G+MG9GRgP7BHAPSgx3Z+093ao3RxoEzTsBT6HqydB2+2H2trbzf4nw6s=
X-Gm-Gg: AYBFou16bFlkTDjE1URamcl7QqbVlP1SK8ZY6qK0NJnsGbgA6MaD00k2tq6EC5+g5jh
	IDyFmN9G5GUHv2Ly8uSZW79tgtaYqMRBg+Zq4oFDGndfhjAOZYCABHArDYrSLYIGqejh+kPo0BO
	YACpNBls8qezLGTWWyYAlWPfgZ0mPjySv/qS7xPDU54ib/iWvOuok+c/JX1iesSZJlOU3KdVvxw
	SwwUveY7r3j+lOd1HP1QGXzxax18k6hXWerzOzmdb2zIe6pzlKms/uCPs0BnZe1X9l2JY1DtVwD
	gDzH+3hSDvJ8hy7iLoT3iJc23wzFQ7DY84WNDFSLa6ApkNgOkm6UJXEiHUZ/9c7LQz5clkVtdnn
	S8DTUNGnTSgu4hsGdSOPW35TuS8DsZvHj1kPjmd8DA/iav9bPJdDemTWehs7786U7PnJ0WdrW8e
	yZIXIDbXorkgoU9mSDMUqqKz9od7c5TNyMC78E4hi6bDxIDOT3oltwY9aCNtUt350WY8/+Qj1/O
	XwwLmGgZbKRb9yi2Aio5QUcJA==
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id 71dfb90a1353d-5c7ed0b2b83mr2558321e0c.0.1788526894962;
        Fri, 04 Sep 2026 06:01:34 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef771sm1971603e0c.3.2026.09.04.06.01.34
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:01:34 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so320867241.1
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 06:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeHtJJrDvhXuczcfzVEQCr0agJoZdkZdmf2QkLnoxbwJnPgQvAtTO5SMny5YFjNNaR8hxTfVBOydc=@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1516158137.4.1788526889240; Fri, 04 Sep 2026
 06:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:01:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAL+B7RchaV+PMDT7XbQvXz1WZ82B0EZXcH8VLBEbL+w@mail.gmail.com>
X-Gm-Features: AcwNN1X59X7feyO-WMq28mmKv3eBAzn4dNno6YGSjElkpqCwSZMQqdTmBUfjuRo
Message-ID: <CAMuHMdWAL+B7RchaV+PMDT7XbQvXz1WZ82B0EZXcH8VLBEbL+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
> instead of an IPMMU, so we don't need to set the flag for a workaround.
> Make the module description more generic while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -2012,6 +2012,11 @@ static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>         .has_ipmmu = 1,
>  };
>
> +static const struct rcar_dmac_of_data rcar_gen5_dmac_data = {
> +       .chan_offset_base = 0x0,
> +       .chan_offset_stride = 0x1000,
> +};
> +
>  static const struct of_device_id rcar_dmac_of_ids[] = {
>         {
>                 .compatible = "renesas,rcar-dmac",
> @@ -2019,6 +2024,9 @@ static const struct of_device_id rcar_dmac_of_ids[] = {
>         }, {
>                 .compatible = "renesas,rcar-gen4-dmac",
>                 .data = &rcar_gen4_dmac_data,
> +       }, {
> +               .compatible = "renesas,rcar-gen5-dmac",
> +               .data = &rcar_gen5_dmac_data,

I expect this can just point to rcar_gen4_dmac_data, once we have
confirmed the IPMMU issue does not impact R-Car Gen4.

>         }, {
>                 /*
>                  * Backward compatibility for between v5.12 - v5.19

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
