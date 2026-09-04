Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD8C47729B
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525006; cv=none; b=JnlQgiGqwsGhadZMBtLvzkiqMRlgY3QevVuMe9sG3Rci1ryz4ZsX7BcX1V13838P0/18JaMZT1AzXzkEZpGStfr/yecSSPDZVydishH5vSKY5TSWtMP23N3eJD+TlKl/Fe4JXbU9j4C8RM5oBlE1BP87jTXJACe6yqPslVbolME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525006; c=relaxed/simple;
	bh=2DtpMsYpyVYksuw1OGOXVQZ0XVIysiiC9LDRS8naQq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSUuJykP6hpAXU2mdnSTRfwo81q3D4VHzR1L4FKTAxbLYgs7nXq88VaSKRFX6Ut/4Nto9wcIsch3gQUR6AYz2R4IhOY91PUoKNbih1l30VRpmWtb2aFDJie/+vChTie1lTf662/vJZay75NICoPV2Tfy0g1Nr3rl7t/qLQhRr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98089686ee7so636282241.0
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 05:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525003; x=1789129803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wBhQA37E1Xf0Mr+HPKFsdlUMfZuU0RFIBB/KUd4dqqE=;
        b=FboADL9K+sOjLwMEeKXmfZLRoEB3LN0N+yx4bj8qPtut79U3p/DmF5WkCOGvl5RBOU
         w1bEGG01RIg0eJQzrDj3hBeCQ5ENPMoZA5VQ6Id41D/ovvsiC87pKsp4yQgviOGvqAB1
         qYGj6zkRXD08SC3TlTnYG/0EKZiCebA6+k5HktI/yTxHWTVkSjbC5FZKrBAlEtff7ALp
         XknlbiQK22ZjFljMXnti+zGRtSvo3FL3khmwptVH2+BPsz3tpMT/glzyoNhHlgATvaPC
         bY/yfK4ElFqio9x3lgJDqTqv1AYUjpMEJYJ75Kk8QzXmnAqR5Wrjk0HqfkVmD81jT4qg
         j1Rw==
X-Forwarded-Encrypted: i=1; AKwUvBw8+FRwXkPiVrOC+4MNF4lF8hrHF5XDx9Me/xNhT+n6BO8SQH03PiJzfuXGjCZxuh+eNAN7QJ3hk7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ+gtcsX2vy+99Gk+Q2H9k/4mNGEIOG8ZUeyjWGbF82agtfPCw
	xzWs1QbeI+2Ps5DT247wRq6szjISe4sLNennb0FGM3XBuh6kJLedxiepWD1tl+QxNzU=
X-Gm-Gg: AYBFou0oEj0ZXBtHJbUB9IiCoYr2K5mH+L9QtAd4NicmzHvtE7BUOncItBS3D1Z+V1c
	Q86JB69o3Gzs7GoHYh5GQxHXGZjVM4aNIg0llsi7swVVNYidPGZwQxm6qmkt+wqOIpQqVKgYkxa
	QE1gm2jNn7Orqg1ZYme299K5P5cc4u7Ue9Z0cXC9ETt58Db+Pr0eIx/+kJE81nG9mHQX0oUpZdC
	gtC05xTBO7zEImEIH4j9GHyiqskUFrB1HK7zLari/ZawnmVy/SqS47Vj9N0Ro9JGOFwPYxuX0+v
	D/EpJXQDZGCLdoEUky4NnQCnEsQ4PWgc2D5Jps3p9XYdOzXP+q9G4F2ufzYApOU8zRsM2YKEBvN
	9tVRiEx5oMum7SEc64Phu2m+pwmUxiV83ZUgi0YpIMVyDMgw3OKOCgbcnfnhLikPXdYCdW5NFe+
	LjoFSTGHhoN2tG+wzjHhZuFwvwvNWKWw70W0SZWa3NZl2GPHc+YBuEWeB1uzuvajFP/Mkm+Q+uh
	B+Z2SP7mLRiFhCtoU61Oj22ChRbVw==
X-Received: by 2002:a05:6102:6447:b0:778:f972:32eb with SMTP id ada2fe7eead31-78a4aa9259cmr2013943137.12.1788525003196;
        Fri, 04 Sep 2026 05:30:03 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm1409129241.9.2026.09.04.05.30.02
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:30:03 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso805411e0c.2
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 05:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9vTpZQIADPAenniFQSd4kdMcOQ4pNyw+sGgdYuUldE3WccPD9dcuKSYhldJJDsd6eOYoxCRR7Ojo=@vger.kernel.org
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id
 ada2fe7eead31-78a4aa70e09mr2345087137.11.1788525002767; Fri, 04 Sep 2026
 05:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:29:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXavMv7hAnd0WHXuThGemifD8G38Tg2GwvkCjoy3_jzKA@mail.gmail.com>
X-Gm-Features: AcwNN1Uk-vpOhRjUqifYExzXweIhzAcoCntgx4xcaaEfdAuYllug8_vrtZCfUzs
Message-ID: <CAMuHMdXavMv7hAnd0WHXuThGemifD8G38Tg2GwvkCjoy3_jzKA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dmaengine: sh: rcar-dmac: fix style in struct initialization
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A new member will be added to the struct. Before that, adhere to coding
> style by using a single space when assigning values.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1998,13 +1998,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  }
>
>  static const struct rcar_dmac_of_data rcar_dmac_data = {
> -       .chan_offset_base       = 0x8000,
> -       .chan_offset_stride     = 0x80,
> +       .chan_offset_base = 0x8000,
> +       .chan_offset_stride = 0x80,
>  };
>
>  static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
> -       .chan_offset_base       = 0x0,
> -       .chan_offset_stride     = 0x1000,
> +       .chan_offset_base = 0x0,
> +       .chan_offset_stride = 0x1000,
>  };
>
>  static const struct of_device_id rcar_dmac_of_ids[] = {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that rcar_dmac_driver below has a few more violations,
which you are indeed not modifying in this series ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
