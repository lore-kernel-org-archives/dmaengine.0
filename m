Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.79.152.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795871910;
	b=rl6DN2i+h/p87j7EhuLoqEE+jSaIiJQWZ61h41lIklmJZklKu1qT8LkUU/HzMlOZfwWH
	 an2L/CIcg3BeGMtJDb0aUMjH18++LUwVBNHSjD9TAmnxpAaPHrT+V8gLsemWnVmRCCY8+
	 6lED4WhL1Gyl9HHUBB7vHj0d91XTkl5WrSiu6VYWamk8GgOzlxdJWMeT7XhtYAYtWQH62
	 92QMSx39v9SJnFQ5WqmWeZiUWIf+9i6VTKGTeBpzVtTyZCaDbbfMLTKQMx+yqVxCvW7Th
	 4SJju/wlnzSdbYUpwepdXR7HxD262bJWOMi4lKeSa0Sj1j1s/wbTMK8I7nqO+If87EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795871910;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CRM114-Version:
	 X-CRM114-CacheID:X-CRM114-Status;
	bh=cZm5m9xfo4Jb6pFNmztBRasuevWqhbDWf7mk78V/z2E=;
	b=UvwSlLzmo1nUal8Dr5qv/O4cFyv547NR3+l2zirkXBk9ZT1x1WWhFlotJXvFF7e//ZIV
	 F57ZQyngO31rjEE8jVtIBahm8jN53rgkXbUA1DCKtwciLfKT7EW0SsXw68NbtkLm/sU9+
	 dznfoCsJRFnNmQgMV+OwFoZAjqOBGyBvJeX71l/qEgd9EcXKGQIVJqp4FQmOwFZ/muGNP
	 ZyFn6oymKW/qg0tMCEst9fT+AgkE8b+PdEmlH8Ux70NRJD6UG1Jm8bkHAPmCb4M68x2yq
	 dnsW9bSxMqXbLniI+wZJTWE9kC+6dBB+/MKTbSM3kcw1wILfbAed6mWKLPWLo+T6JQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mleia.com;
	spf=none smtp.mailfrom=mleia.com;
	dkim=pass header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=WJz2+YO8;
	dkim=pass header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=WJz2+YO8;
	arc=none smtp.remote-ip=178.79.152.223
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FBA606A31C;
	Sat, 28 Nov 2026 13:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FBA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=WJz2+YO8;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.a=rsa-sha256 header.s=mail header.b=WJz2+YO8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795871901; bh=WKJMErkZW4DjO8u8iHFA3D1mfv7gzRSJwYlysqbmBQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJz2+YO8p/n7CfrdNuZwMovzpkkjRdxUNllt2Kk0WMm0OnLnsAJQoLgepWWvSMTyE
	 iCnoVFjNkGbwr4sx8orjoxPQeC5DDUa3A14qB+bnGNU0LaCkBtKa3kgY0HgBpmLQMD
	 KDYmoRisOuruOqsvJ1kA52PXKoAJdNfRfLCXVgVf4eJrhghouEf51gUyelumznWDAX
	 35Hv6rR4cL+ihiGXi7tlsIIuQsaV3bdiA/VqSrokuG3r2lqm+DJ+o10f+B7owikeQJ
	 9kX3wDAvDCpEmvxAFuScPeMnhmoWrIbr2EoYlu/xJKkeFnl61rCILCPHoOdHktaPxd
	 fp374iyOio5Ew==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id D9B93413E90;
	Sat, 28 Nov 2026 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1795871901; bh=WKJMErkZW4DjO8u8iHFA3D1mfv7gzRSJwYlysqbmBQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJz2+YO8p/n7CfrdNuZwMovzpkkjRdxUNllt2Kk0WMm0OnLnsAJQoLgepWWvSMTyE
	 iCnoVFjNkGbwr4sx8orjoxPQeC5DDUa3A14qB+bnGNU0LaCkBtKa3kgY0HgBpmLQMD
	 KDYmoRisOuruOqsvJ1kA52PXKoAJdNfRfLCXVgVf4eJrhghouEf51gUyelumznWDAX
	 35Hv6rR4cL+ihiGXi7tlsIIuQsaV3bdiA/VqSrokuG3r2lqm+DJ+o10f+B7owikeQJ
	 9kX3wDAvDCpEmvxAFuScPeMnhmoWrIbr2EoYlu/xJKkeFnl61rCILCPHoOdHktaPxd
	 fp374iyOio5Ew==
Message-ID: <46b5102a-4448-439c-b9c9-f6b17fbe4d43@mleia.com>
Date: Sat, 28 Nov 2026 15:18:20 +0200
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
Subject: Re: [PATCH v2 1/3] dmaengine: of: Add managed DMA router registration
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>, vkoul@kernel.org
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, piotr.wojtaszczyk@timesys.com,
 manabian@gmail.com, robh@kernel.org, saravanak@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261128_131821_913836_39289E2E 
X-CRM114-Status: GOOD (  14.17  )

On 11/27/26 13:03, Tian Xuechen wrote:
> Add devm_of_dma_router_register() to unregister a router when its
> device is detached. Reuse the controller cleanup action, since routers
> share the same OF registry. If registering the cleanup action fails,
> remove the newly registered router immediately.
> 
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
> Changes in v2:
>    - Add the reusable managed router helper.
> 
>   include/linux/of_dma.h | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> index 16b08234d03b..7f9198ea9627 100644
> --- a/include/linux/of_dma.h
> +++ b/include/linux/of_dma.h
> @@ -64,6 +64,21 @@ extern int of_dma_router_register(struct device_node *np,
>   		struct dma_router *dma_router);
>   #define of_dma_router_free of_dma_controller_free
>   
> +static inline int
> +devm_of_dma_router_register(struct device *dev, struct device_node *np,
> +			    void *(*of_dma_route_allocate)
> +			    (struct of_phandle_args *, struct of_dma *),
> +			    struct dma_router *dma_router)
> +{
> +	int ret;
> +
> +	ret = of_dma_router_register(np, of_dma_route_allocate, dma_router);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, __of_dma_controller_free, np);

I had to double check that of_dma_controller_free() also suits
of_dma_router_register(), and it is.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
