Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA61312834;
	Sat, 12 Sep 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205088; cv=none; b=ptPrQIRipKCd3nMeEtGD9v+TkP/pAPDdbinthVmhuFoP0h3FhNSJ8HEV6X+z2ggjGcFWxpTC9lexc0mTbZaKZgcf4qnR2NC9rI26zlWsK10CP9yEeDRpYttOsWlBlUDS5AbDgabiYQ49JVpb7XxlzgeFzNh6dVGO48MCoQDJVsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205088; c=relaxed/simple;
	bh=nsJS9M8rYAfWe6QKTgXR53WKrxSVyyESM7PVQRY8xMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toMbN4c5kQ71CfVrz65jjrzZ5sFjMRCxJDoSXQo6zI2aDN8nom3b9vC7UX8QXYxJO/gUslAz46dauH/1XKWGUHG3sxI/gqQn/lJEbFVV00TFJGu9EA5+nR2nGuQptYodidFUZXGPTgyA5Nma8HKFdCpUlora7EzcCrG0nOPJlyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbvUO2Hu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbvUO2Hu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F23D1F000FF;
	Sat, 12 Sep 2026 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789205087;
	bh=jlDAifSOhcOWqoOnA1uxysXhHTyvwF8FnNiIJAQAd3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dbvUO2HunQLYViPkLwkbKS7RsK6z9nBOTHnsekm2y661Eq/t2NOGMorFD2b+Paqct
	 OMqjVgFy3I8EyIJ/wAp8F9IFecXMDjEv3JH1nxjKqxhdl3I3YaXmKYFhiDNg8nCjo4
	 46cOAx27sfB3PtQGBkeAOJ69ItoSrwjVgXFzj5bLdPUpsnXXYtezyk4gFoXIVVP1rH
	 VmchgJ3u3BJay22D3pzIq9lH8lvrGDCpI7ZzowEThm6DntqAG/bwqy4V06sS4ElLg9
	 5chGe/gkqYuPYkIh585XtXjcaVJuu27qcemIO7ciJQvSj3b3NC5c+GF5yGfNmZpibm
	 ZcgRYn99K/3bQ==
Message-ID: <17df0369-0a94-4763-b4c0-ce1f7c99d02d@kernel.org>
Date: Sat, 12 Sep 2026 11:24:42 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: bestcomm: make gen_bd init helpers static
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
References: <20260911215914.175851-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260911215914.175851-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 11/09/2026 à 23:59, Rosen Penev a écrit :
> bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
> the PSC wrapper functions in gen_bd.c, so make them static, drop
> their now-unneeded exports, and remove the corresponding header
> declarations.  The reset and release variants stay exported because
> sound/soc/fsl/mpc5200_dma.c calls them from a separate module.

What do you mean by "variants" ? For me a variant is something that does 
the same but slightly differently.

Maybe add that last extern user was removed by commit 7d3ee229ea51 
("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")

Christophe

> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/dma/bestcomm/gen_bd.c       | 6 ++----
>   include/linux/fsl/bestcomm/gen_bd.h | 8 --------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 61b5746e1a97..b5093f7445cb 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
>   /* Task support code                                                        */
>   /* ======================================================================== */
>   
> -struct bcom_task *
> +static struct bcom_task *
>   bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
>   			int initiator, int ipr, int maxbufsize)
>   {
> @@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
>   
>   	return tsk;
>   }
> -EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
>   
>   int
>   bcom_gen_bd_rx_reset(struct bcom_task *tsk)
> @@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
>   EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
>   
>   
> -extern struct bcom_task *
> +static struct bcom_task *
>   bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
>   			int initiator, int ipr)
>   {
> @@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
>   
>   	return tsk;
>   }
> -EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
>   
>   int
>   bcom_gen_bd_tx_reset(struct bcom_task *tsk)
> diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
> index aeb312a1cd00..7253d308d77a 100644
> --- a/include/linux/fsl/bestcomm/gen_bd.h
> +++ b/include/linux/fsl/bestcomm/gen_bd.h
> @@ -16,10 +16,6 @@ struct bcom_gen_bd {
>   };
>   
>   
> -extern struct bcom_task *
> -bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
> -			int initiator, int ipr, int maxbufsize);
> -
>   extern int
>   bcom_gen_bd_rx_reset(struct bcom_task *tsk);
>   
> @@ -27,10 +23,6 @@ extern void
>   bcom_gen_bd_rx_release(struct bcom_task *tsk);
>   
>   
> -extern struct bcom_task *
> -bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
> -			int initiator, int ipr);
> -
>   extern int
>   bcom_gen_bd_tx_reset(struct bcom_task *tsk);
>   

