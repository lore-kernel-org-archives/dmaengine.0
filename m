Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6614382395
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947475; cv=pass; b=DlmlwXY2j7uz4p7hdwXJeWhD3QiQBG/FjXjvkPPO6bH8tIjRhOe7m2d9lYPQXdpkKODzfr5wYVyF0QgePO/YskLl6jsmXqpp5atqWqxcooAtH/2C2guzm79pnah95O5rJP0G/+Hc7pivJ7fX4RNfJHlxyfGsuP0U0EAWteJxLS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947475; c=relaxed/simple;
	bh=ONggWHVtY3pFPRHkz5Sn57TKXqxuE4SNo3A7kONgqMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azoiqXkYzZFNAFFCl9HXv3a/DAtwGDEI9MhWbOSDGCPmJ7B4IssXMw1sUyUEi2VPE9ZSaDuPoY/Mg23R5p8w+wOOs+Ycki4cdXUGQgwYsba6cM6eh89rzckrarq3l1vt7CAJROV3RJFrvbCINJgtKX6yVY40eNoI3Ey9YiOHlBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tq+48R/P; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq+48R/P"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so133101066b.3
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 02:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788947472; cv=none;
        d=google.com; s=arc-20260327;
        b=eOeUvYd/14Qg/L0CdQ3n/BcgkWB4ew6OTtVfKmwm8n3vDrCOA9jYFUoic+UAiHhaaY
         J2YlyhNU9aSxn7OJN8sHiVShGr8ZN62jKyJiBmJoh1T2bSXZdR+1d4Kv5UZO3uAJxvmu
         azwW78VxodTw9FA9KxwIbMo4l/sMSCA/35yBwE1qO1V/nBFPC853VihnxcPrAJrP5O30
         kOOyi3ROjCvu45D5cR6MShxAAwj6D4cCoJPTLpzJ5ZpXQr3JKdwRzwhfdFcdYG+EHFx6
         TNAIqkC5Ae7NMG6hkOzGyuIVlLBx1n7jG1tRfNOY0BKswROpen6ifgvyq0jegG1+JCJ0
         nfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2sxmbjjdvvFVFcMjQD3pZI/s9eB063lV/ibGAwj6uM=;
        fh=/XNllmxdQ1BvzbZfB0yNyn4GsnKaRXTG21qNc2ryJh0=;
        b=j1b105w2pRX2e4P2jaT5r5GncSe4xaa15F/LSl+LSS9KRY76xlXqf9+kAPTca73U/7
         aOL5mNICn2Q7W8QlOaChU+qjolktdJePsYEa2P8D31CGLqkQsRHc4H3oXdovdKuAeUic
         f9ndrhxLAEeHU59+/pTL+RPdVKvIclsmJjXQPpsopVdKnOtqLa3+adPbcjmAmqhm5+Sw
         YGK93+tZwy6kpKeFFS5wCRvZQ7cZ+WjikBouCUj5PWJ8vL2XUUWjjhcBlilRsa6WMJne
         Ac5LlOM37e28WuBZfr2kndaq5erg2odiz6GPFYuhmlrkfDNFBHtSfm8Mc8Jc1R9J+Tj3
         cEdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788947472; x=1789552272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2sxmbjjdvvFVFcMjQD3pZI/s9eB063lV/ibGAwj6uM=;
        b=Tq+48R/PhoZ7sOb5ZyalrdUnHlq2E1tWOmc0h4y0KC0NrwkVI1c42oMFDU4U6bA81m
         4ad5AyPB/hZCzCqygni+8uD/7eFQWYfzg0dTWtKyThbef8bbcROenDGk756wMnO8VAWg
         BJIHnTeNYrt0pUQhnhLgRh8DAsUp9pfAQSqJL6ECEJBb6Rkepi/cTsXeN7xBW+b6HzfM
         Aqz/8VvxluYlcHxokwxJWR/xaqpxpXvX5jf7L5xd+SZFCoTloRPmI1fDrIZO/4KzSeRd
         fhddr0a3Gh3raZY+jb88c1RtlA/iSeQFbvQ9+lim6tnjKMn+40IX7X7w/UAkLqwAUKAN
         dn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947472; x=1789552272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2sxmbjjdvvFVFcMjQD3pZI/s9eB063lV/ibGAwj6uM=;
        b=TreNMkxvTP9k8bJ07AbbxP3voDo4alfux3LvnYYLLQP7DafIP+tKtpdPHrwX9SGW/i
         rhZ1Zz+tzJ+xh0CFEx1ykQ7sTwT5ZMljIZbvcXUQ7ee+G5lkor6oqKiS0yjbTUZRL49J
         zuC02rWrn9DiLgiAqKpydsksF7GPYSXzenAP17EPg+xFz6NhthFv7WpYhtkKmvyKbcjy
         66ZNiZBUXtpzz2HXdzGVXQRpK2e0M4/MxOyb9EGNj2WfvFUTf84nHwUV9+vbZ30keDff
         wukH7+uJZ3yz7nFSBaq/YRL0eX/S0lphJumhPHiKv3wcbaknNpAHVfJRu6hv7gnY5ASS
         ysnA==
X-Forwarded-Encrypted: i=1; AKwUvBwWp1HRy0ZlAYthJ6KEjb3esZVtwFRo2s/g0n2sFBfJtGyc+Wslih/x/Cq+3Dnipwr3eNebowfzz8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m7cVyxP/7aO3pTd24UhsbMMw+JB9inJuWpLnEkxHRKxn+wpqSf
	0SWTtPsI8MklTR+aq6A6s23BII7uJPGfBK7COQQLYaocg57YeTEfWFNdKA0kHwYCPTVR3Mdfywn
	AW2ozG2Dkh4jQou7ftd1+YW2RpPym4lk=
X-Gm-Gg: AYBFou12WkMiM/hMA8Dy2BNBP7XdFRJSK+qscASwQIcbR8BTeRPuTKhgOwlzhtCU8Px
	t9a/L9dN3jTmywjUVA/nvXyQ5a9SZh1TSlgVHQiDtSQoqDumO1a5L4L8d+yqgFiNiLOpUUrpSF5
	x0DdTmZlLZ6y09FvbuwNvIxvYCfH5FaslkgetmMqM/KjPwfKANpM64iRbkpRomFntu4iM3eyZ4f
	it6z7tux//iDLfS+CBvwHjEX8DMzAaCNknNy9Wj9FVHRH9LPXBDDA/gcmyknSOmsNh05mO7EkZy
	SYeEXENuC/sNoOlynLIyJCweUx6b+9C+NWpL3Pd3CbFDGfC3IfqIpKZDLA==
X-Received: by 2002:a17:907:a893:b0:c25:5114:c832 with SMTP id
 a640c23a62f3a-c292adecc24mr353918366b.3.1788947471494; Wed, 09 Sep 2026
 02:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 9 Sep 2026 17:50:58 +0800
X-Gm-Features: AcwNN1VQuJAYFeXqwj4YYRkZb5G_JQc9Jkxz7vWDvIbI3Cnj3i-wv3O74qb61Sk
Message-ID: <CAMpQs4JG4cDWxF0fT_mph+Dh8hDOSfBUMg1S7Cbf_bo4x70yWw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedness
 bug in irq handling
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Julia Lawall <julia.lawall@inria.fr>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Tue, Aug 18, 2026 at 5:35=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Storing that negative value into an unsigned variable makes the check
> `if (lchan->irq < 0)` always false, so probe errors are not correctly
> detected and propagated.
>
> Fix this by changing the type of `irq` to `int`, which allows proper
> signed comparison and error handling.
>
> Fixes: 1c0028e725f1 ("dmaengine: loongson: New driver for the Loongson Mu=
lti-Channel DMA controller")
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202608152230.p20WPlS0-lkp@intel.com/
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Gentle ping.
> ---
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc85..969dbc5dabe7 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -90,7 +90,7 @@ struct loongson2_cmc_dma_chan {
>         struct dma_slave_config dma_sconfig;
>         struct loongson2_cmc_dma_desc *desc;
>         u32 id;
> -       u32 irq;
> +       int irq;
>         u32 next_sg;
>         struct loongson2_cmc_dma_chan_reg chan_reg;
>  };
>
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> --
> 2.52.0
>

--
Thanks.
Binbin
