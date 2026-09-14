Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D1637F334;
	Mon, 14 Sep 2026 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365115; cv=none; b=efM7eAhjtmfIBJzG7+RpIuFnlcTP7nhW3B3GGDxeK+l1kUM4fc3MO0qy2dG/TEqEdn1+FjfLs48/lRwDBoUVVIgM7nM6suY2t9chrXeHU91Fg4cxokjfjab93sRyhqjNFhBd6eE7xDm3O8PpNkaj8ggncZGRn/yHitjohfR+PkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365115; c=relaxed/simple;
	bh=G8Ssi4Ky5b5O8tHMmLJgzcnHzHrqsjRqRv8/Hke+OAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pzk32Zxi4tR6NBuzfp8QpwDVx+Bcp/fzFVl4Z6Quny2EawENRZPKkUAYNry10FHeUibEFooYPAIBH+pEh/xd9W2B6ykv9Qm/egsD/JFCE08bQwarT44SoRD3p3xql/0ycLk9T049jc+3vbOQ7t8C+Qn3ZTsWzKDSwFBKdd0KAlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHijlw1B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHijlw1B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2301F000FF;
	Mon, 14 Sep 2026 05:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789365110;
	bh=D5zceg5+91niGlqEFk3evIy/yGdGxOsNYfbIU+4Af3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bHijlw1Ba4A0JsT8Exy/3SI8wndx4Mz2t8D0LNiJi9SU4doe8jMU/To+hPurAelIc
	 o6+eUt0r8wd40nRA4M9mE2RZiZ+G1PEOZXxnIy6KRj6QtrShPLvgD/BAl4m2WY9dhy
	 q+wzIN54NGdSTlmGrYzP2B8DOZLqXM0ug/mZIe65rVBp8J0kxjsT/FxT/ABGw6jP0l
	 tsTo5nIVBNKCpfmWl9ST5zeBjvAoyAUwhTSIzdzyMihW74QA8pxwDIfg3Y9ulW8Xwm
	 tyJ6cMuDScidAl/W+E1DCPygxfZIPadgHLA2hUfTkeVwZJGyOXKkbTed/7EpgM8nbw
	 p7A+LPC6HmxLw==
Message-ID: <cb482593-e729-4e93-b529-6e84c83e19b2@kernel.org>
Date: Mon, 14 Sep 2026 07:51:45 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] dmaengine: bestcomm: make gen_bd init helpers static
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
References: <20260913194804.39939-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260913194804.39939-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2026 à 21:48, Rosen Penev a écrit :
> bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
> the PSC wrapper functions in gen_bd.c, so make them static, drop
> their now-unneeded exports, and remove the corresponding header
> declarations.
> 
> These had use before commit 7d3ee229ea51
> ("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   v2: mention driver removal that made them unused.
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

