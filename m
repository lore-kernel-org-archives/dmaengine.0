Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989D44A40D
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055203; cv=none; b=My2lpq19M5ebna3c4umvGDP99+7As1QhyZ+wEZhJNTBFNzVZazHFNemgrgPcJzRziu449MtdUvZo8iAW4I3EpGLQLpg1DubHzHQbvnc8cFGBwMjEFjWw4R6zRqCL/aKweNuyI4oPdN4kjJKN1RZmqG6leSgtvnSgjp2Ru1KytWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055203; c=relaxed/simple;
	bh=lCITJhGvkQah8vptdHrcZyeXJBmigbPj+HcTAOix3rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgDz7nQXMPCRneCz/fSqlOYKPyBuZSewXWtivdYGkHXC/a4VNmqFTGRSIZYYdIIM/l+qIkmSViNdr4s1UPu0Qck14E/3G3wKXjUpdoN7AX9hJiYttCeoZJEqdgTfQKDXhG/qJbhx4BMtC+WXQgys9R+Jq+CETL31aSrkSjEffno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0amdKAa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0amdKAa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A91F00ACA
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787055202;
	bh=6+JuKutqkV/NahV6ZwmWtd94j1vi3VcVBc80f5zsreY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a0amdKAa7iNa8nqxpCkx47Yaqg+yzVn5CH8adjxWKq+V+JPEOx7GrYkDolPjTRZo8
	 CYtBwkSXlL7A1kJMAeVWrIl/GONP0BVvp648iy/yZYg2H815/LJPLPLWmN6niCMFYz
	 xdgG8cBjuAGaKOTxeqkCf/pAMzcI/RYviaiNQorSWIoQOt0y/xx0BaiPZjpFbsKkle
	 Uy76VwDo4FggoovSUar24uqjpKBL/fjp7JQwdd574pNfYsIhNCqXEZMTIPIk4FRTb0
	 Uu6ULi6dIfhcmqEw4q84P3CN2XGC59oaQeGN7MWAdrHX1Lz8F/C3thOce2nmYYtrbY
	 1y/CHN37As4dg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso6562827a12.1
        for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 05:13:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqPZPWok5Iy9iXNJuscEM0AuFo5oAtlxl0NDLvf1s17FPGNKVF+q7wsxTCXvjASp0WSPaIJDdJaY8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSFe0m11lnQCYoYNRoQXtVLsmQrRfpF0yu2yycqAgYJDZnjPQ
	z4W/lWIRp4q4RIlEMbnOfL8WwRR0rrth1JdA1J0b/+10E0D8vbHfG/U7Xg1+l/CwySTB7Czlee7
	bxiU7PYzXtOlQoqjtLGXjoWLHytnzRug=
X-Received: by 2002:a17:907:a091:b0:c12:4647:a629 with SMTP id
 a640c23a62f3a-c212a358091mr1620068766b.25.1787055200876; Tue, 18 Aug 2026
 05:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Aug 2026 20:13:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73pU-2mguZNMyM1vjA75BOA86jFcER=FVy=m+oJ6jkPQ@mail.gmail.com>
X-Gm-Features: AcwNN1WUrAy5DW83QeRGCFzMxCmhZfOXEvcm1BDZn1K0i-HK9jjhXP9YVIAmaT8
Message-ID: <CAAhV-H73pU-2mguZNMyM1vjA75BOA86jFcER=FVy=m+oJ6jkPQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedness
 bug in irq handling
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Julia Lawall <julia.lawall@inria.fr>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

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
