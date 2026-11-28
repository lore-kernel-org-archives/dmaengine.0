Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.79.152.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872223;
	b=HqI9oxG5uiei708fRq16zS33CusReX93oeIWSVJQxNGdI+OaqOm6ybVY29QC7Awza4YN
	 2Znb3qyA3UinhNlUmxTQm6F8oCSC6lq8kohxrt/zI6Kb8XBFGD6VslmsiFbR0ouOBMjkQ
	 ekSci0AmTGt5z+MKLGVMEbe7fvG2WqC8EjFBuSQFIPN2poLcntz77JfnxLpl1802ZiFBK
	 p7H/COQpkpkenhyRdvpyQ0uPXL3HTtmaAckDdRscydbgkNc1vz8SXyAiCJ84RiFceyQyg
	 lR98UxpSxVQwtI3DnjGkK3XAIK82wmb6hyPnNJfLnzbRUnGMy8izYQnYcwEHDlYcO8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872223;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CRM114-Version:
	 X-CRM114-CacheID:X-CRM114-Status;
	bh=iznsA3tuh367bUtmJzfjdQpTwH0gqm+N+dnutb6NMMU=;
	b=0nKfpddBBabLsMJBkYwdJQIwAEtXm4MncDb+ts+m9rxeXGNYqlhtyjSW0+CNvZW7KABR
	 7anOSlxmXeqJLkWvAg1yz0OW7Qr5VY/vJY22dWEjRWvL89XdFkvrYhgCh7d+1MsXi+Jzy
	 RmmzsK9VabR5N6pM2VvaLo3OhFsdgeYYyN5bI5X7qkomJ1i0g2yWiZ/0I1/I3uFAisjrk
	 qAAgEVESLA8s7aJtlVGwUNqWCU3y2nB+NBW4ltLo609W/+ffwCjfjPf0rTHJ/oAeV9f5n
	 eUDaHkbvd6vi+YXIWoibFadyCtkUWyrmTGhPcypHzPz3p1QP4g29rzBUWObrOjWaj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mleia.com;
	spf=none smtp.mailfrom=mleia.com;
	dkim=pass header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=abQxF4DV;
	dkim=pass header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=abQxF4DV;
	arc=none smtp.remote-ip=178.79.152.223
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B36606A31C;
	Sat, 28 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=abQxF4DV;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=abQxF4DV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872221; bh=+TAdfg5T/qdwwjeCMT1NCNUY0OQwknykReIuv2qNOvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abQxF4DVceMvKEoTV1vVEmLD0jPpdmvAETeZnVb5JXQOA3Mp8D16cOM9A+GRyTjJs
	 gjnRsr5d7mNvD99ItYH+IE9l3w+KpfU72666IPHli7yaTdSE7lLgm5HQ8tuiNelxmZ
	 wSEUEpm35EGl3tgTJBIt4IHZky0IsUeScf2iS2KjQqsX/Nu1ZbtLgBKC1Y4+8bpsVo
	 G9q+Qg8SPStcIMa4hNTOaD93wNhINqup11YKuvE+xW+tWCZsDVYChi7m2PoG2/Tybl
	 RGCapeZnYQvbNeQYupj4MRPoMYJM89m1PM8nbku7xex8Z9tBLBUv5ImwbOROIyzhJF
	 mkdHudDmTJ0Rg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 6E175413E90;
	Sat, 28 Nov 2026 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795872221; bh=+TAdfg5T/qdwwjeCMT1NCNUY0OQwknykReIuv2qNOvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abQxF4DVceMvKEoTV1vVEmLD0jPpdmvAETeZnVb5JXQOA3Mp8D16cOM9A+GRyTjJs
	 gjnRsr5d7mNvD99ItYH+IE9l3w+KpfU72666IPHli7yaTdSE7lLgm5HQ8tuiNelxmZ
	 wSEUEpm35EGl3tgTJBIt4IHZky0IsUeScf2iS2KjQqsX/Nu1ZbtLgBKC1Y4+8bpsVo
	 G9q+Qg8SPStcIMa4hNTOaD93wNhINqup11YKuvE+xW+tWCZsDVYChi7m2PoG2/Tybl
	 RGCapeZnYQvbNeQYupj4MRPoMYJM89m1PM8nbku7xex8Z9tBLBUv5ImwbOROIyzhJF
	 mkdHudDmTJ0Rg==
Message-ID: <7c224686-0a28-4fd7-bf41-980909623a5e@mleia.com>
Date: Sat, 28 Nov 2026 15:23:40 +0200
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
Subject: Re: [PATCH v2 3/3] dmaengine: lpc32xx-dmamux: Use managed DMA router
 registration
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, vkoul@kernel.org
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, piotr.wojtaszczyk@timesys.com,
 manabian@gmail.com, robh@kernel.org, saravanak@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261128_132341_467798_82B9E4F3 
X-CRM114-Status: GOOD (  18.81  )

On 11/27/26 13:04, Tian Xuechen wrote:
> The DMA router remains in the OF registry after its device-managed
> data is released. Use managed registration to remove the routing
> entry before the router data is freed.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")

The change is correct, but it should be clear that the fix does not
apply to the fixed commit:

Cc: stable+noautosel@kernel.org # relies on new API

> 
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> Changes in v2:
>    - Use devm_of_dma_router_register() instead of a remove callback.
> 
>   drivers/dma/lpc32xx-dmamux.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
> index 33be714740dd..3218be8e8eae 100644
> --- a/drivers/dma/lpc32xx-dmamux.c
> +++ b/drivers/dma/lpc32xx-dmamux.c
> @@ -180,8 +180,9 @@ static int lpc32xx_dmamux_probe(struct platform_device *pdev)
>   	dmamux->dmarouter.dev = &pdev->dev;
>   	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
>   
> -	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
> -				      &dmamux->dmarouter);
> +	return devm_of_dma_router_register(&pdev->dev, np,
> +					   lpc32xx_dmamux_reserve,
> +					   &dmamux->dmarouter);
>   }
>   
>   static const struct of_device_id lpc32xx_dmamux_match[] = {

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
