Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.79.152.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872153;
	b=mV7zgNuOzAqGWhwyg5FB5G/pLRT5v/3nq6NLfWNkj5pXKoinqubvW4JUDmSIHVYlJO3Q
	 +nX+6SDvVBaa0cXI9GuLkMcH2fzoto/4I6+p9GEUOyGwVooMUFlUKub7bOPiAwLunDBM2
	 /LcoPriqS+qLXU9l6PPTe01CfiHH8PwSXR2HvRdfFWCjezTJ/99try0rCaRH0MvqY/Fis
	 wP5GP80H8lqIL5F79XEr7da0Dx11/QkbUcJYe272cpzPWMWxJjBjS2f5YS4wBeCkr5ivi
	 cwTvEC4aAIUWMF0BO8o981Qp1aCE0/7ZJlZh+DtJ9i28alCvHnri7Wgm6tm7vY8WMGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872153;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CRM114-Version:
	 X-CRM114-CacheID:X-CRM114-Status;
	bh=VvTdIJHKuouRllvVwKtOQDRcHd3EzCa9wjhnYhHsdr4=;
	b=sXcpIcpnBrddA2tFjJgU9S5HU6He9vGyrjNgZvwfHv8oURCR+pCtVQnWIp4/Ibl535bv
	 NrFDjvmrq/KdY4BePiMXoChQORxH5Wj5UY3LRRFhoAYN4UpAnB6+yYuzwjxGE9jNBdf8U
	 oFQsY/KVYQmF4DBO1G7OsuJRKzH7lO+D0YtAUregR70V+mJYC2KuqS9vUALe8Ve+IjCFh
	 HBfYbKqJh390FjQIpfyI5MZxfvcEB65Ka6Z4PQsNYtm24+Bn+eA8dMv43eJMiFxTrsUAq
	 SWEHOT+0Kkk1co/027Cz6ZOnQJBuQC8V0v0eg+9h+wFsyr82BmPjcyBw6rKZqbAuFjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mleia.com;
	spf=none smtp.mailfrom=mleia.com;
	dkim=pass header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=FAfZksCh;
	dkim=pass header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=PkX+5e99;
	arc=none smtp.remote-ip=178.79.152.223
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E2606A31C;
	Sat, 28 Nov 2026 13:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF0E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=FAfZksCh;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=PkX+5e99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872151; bh=wJ5lUs3BX7Bttw2LUpjz2R6r/7Wqq+5g9XMCrfdK2mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FAfZksChn70Qyi/QPP5lLIasiOVasEsTFPZS94+gerTyy2BcE59ph+aYEmPbMxyK7
	 3jRqzqoCY9+zlBaEQi2Juvl+EJ4KEsml6rwDtgHba1RknsLc1qWTDWtLp+/6erfXjt
	 rjqfLUEO84O/dRlQspecv0ElSyK/diHhPU/ff85aEKPFbsO3jfQZkRd1OebT4kRi8l
	 yo7LaLZAfYQV9l2yYiqDj/6g8+6RBfYD2pkzO4hyzSu7alK8u4FVa54zLoDW2mWkqF
	 lTeDQJUajhICKnoxTFj6i0s73ddqluth1ylmA3yNL7j3cT2EJvSGr8qsCbBv7Kg6wq
	 5H2bjtGxTppKw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0D729413E90;
	Sat, 28 Nov 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872150; bh=wJ5lUs3BX7Bttw2LUpjz2R6r/7Wqq+5g9XMCrfdK2mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PkX+5e99abrvKB/z+zefMqr6WvvmFBsdqOR4g8njOTpoxynYkOGijvfzx72kWq7u2
	 5YubRRtl3nBJqaXp1exwwufd8n3LjCkvS+EqdPbTZkS/hZgw60WuDU+FcLuSXgwLcc
	 V80Iqacu3bnO1FqtCVzOUHGgoHyXQP8jXoppDPQWzxXB6p+jbNT0ExmzUG3gjOfTcB
	 CdvXlNUunYH9As6QDPCQnHidJ2u0HN/9vAzAguT8RZ4ou85XEMPKCp+H6KjkVpntFr
	 yStOyHDbSdu6JomYvVm+5Aex2Sm+YiZt5belGu9KKWeE8NWkeA4S9ggDkmJMV6cYDC
	 RMCkS+g8lzrxg==
Message-ID: <f140988f-823b-43e6-a6b1-3356d5df5c5e@mleia.com>
Date: Sat, 28 Nov 2026 15:22:29 +0200
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dmaengine: lpc18xx-dmamux: Use managed DMA router
 registration
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, vkoul@kernel.org
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, piotr.wojtaszczyk@timesys.com,
 manabian@gmail.com, robh@kernel.org, saravanak@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261128_132231_076490_BF2EDAD0 
X-CRM114-Status: GOOD (  19.04  )

On 11/27/26 13:03, Tian Xuechen wrote:
> The DMA router remains in the OF registry after its device-managed
> data is released. Use managed registration to remove the routing
> entry before the router data is freed.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")

The change is correct, but it should be clear that the fix does not
apply to the fixed commit:

Cc: stable+noautosel@kernel.org # relies on new API

> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> Changes in v2:
>    - Use devm_of_dma_router_register() instead of a remove callback.
> 
>   drivers/dma/lpc18xx-dmamux.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index d3ff521951b8..0c6758c53a72 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -166,8 +166,9 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
>   	dmamux->dmarouter.dev = &pdev->dev;
>   	dmamux->dmarouter.route_free = lpc18xx_dmamux_free;
>   
> -	return of_dma_router_register(np, lpc18xx_dmamux_reserve,
> -				      &dmamux->dmarouter);
> +	return devm_of_dma_router_register(&pdev->dev, np,
> +					   lpc18xx_dmamux_reserve,
> +					   &dmamux->dmarouter);
>   }
>   
>   static const struct of_device_id lpc18xx_dmamux_match[] = {

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
